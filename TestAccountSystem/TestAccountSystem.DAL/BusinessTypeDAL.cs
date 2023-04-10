//============================================================
// author:yangyiliang
//============================================================

using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TestAccountSystem.Model;

namespace TestAccountSystem.DAL
{
	public partial class BusinessTypeDAL
	{
        public static object Insert(BusinessType businessType)
		{
				string sql ="INSERT INTO BusinessType (BusinessNumber, BusinessName, K1, K2, K3, K4, K5, C1, C2, C3, C4, C5, Remark)  output inserted.ID VALUES (@BusinessNumber, @BusinessName, @K1, @K2, @K3, @K4, @K5, @C1, @C2, @C3, @C4, @C5, @Remark)";
				SqlParameter[] para = new SqlParameter[]
					{
						new SqlParameter("@BusinessNumber", ToDBValue(businessType.BusinessNumber)),
						new SqlParameter("@BusinessName", ToDBValue(businessType.BusinessName)),
						new SqlParameter("@K1", ToDBValue(businessType.K1)),
						new SqlParameter("@K2", ToDBValue(businessType.K2)),
						new SqlParameter("@K3", ToDBValue(businessType.K3)),
						new SqlParameter("@K4", ToDBValue(businessType.K4)),
						new SqlParameter("@K5", ToDBValue(businessType.K5)),
						new SqlParameter("@C1", ToDBValue(businessType.C1)),
						new SqlParameter("@C2", ToDBValue(businessType.C2)),
						new SqlParameter("@C3", ToDBValue(businessType.C3)),
						new SqlParameter("@C4", ToDBValue(businessType.C4)),
						new SqlParameter("@C5", ToDBValue(businessType.C5)),
						new SqlParameter("@Remark", ToDBValue(businessType.Remark)),
					};
					
				return SqlHelper.ExecuteScalar(sql,CommandType.Text, para);
		}

        public static int DeleteByID(int iD)
		{
            string sql = "DELETE FROM BusinessType WHERE ID = @ID";

           SqlParameter[] para = new SqlParameter[]
			{
				new SqlParameter("@ID", iD)
			};
		
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text,para);
		}
		
				
        public static int Update(BusinessType businessType)
        {
            string sql =
                @"UPDATE BusinessType SET  BusinessNumber = @BusinessNumber 
                , BusinessName = @BusinessName 
                , K1 = @K1 
                , K2 = @K2 
                , K3 = @K3 
                , K4 = @K4 
                , K5 = @K5 
                , C1 = @C1 
                , C2 = @C2 
                , C3 = @C3 
                , C4 = @C4 
                , C5 = @C5 
                , Remark = @Remark 
                 WHERE ID = @ID";

			SqlParameter[] para = new SqlParameter[]
			{
				new SqlParameter("@ID", businessType.ID)
					,new SqlParameter("@BusinessNumber", ToDBValue(businessType.BusinessNumber))
					,new SqlParameter("@BusinessName", ToDBValue(businessType.BusinessName))
					,new SqlParameter("@K1", ToDBValue(businessType.K1))
					,new SqlParameter("@K2", ToDBValue(businessType.K2))
					,new SqlParameter("@K3", ToDBValue(businessType.K3))
					,new SqlParameter("@K4", ToDBValue(businessType.K4))
					,new SqlParameter("@K5", ToDBValue(businessType.K5))
					,new SqlParameter("@C1", ToDBValue(businessType.C1))
					,new SqlParameter("@C2", ToDBValue(businessType.C2))
					,new SqlParameter("@C3", ToDBValue(businessType.C3))
					,new SqlParameter("@C4", ToDBValue(businessType.C4))
					,new SqlParameter("@C5", ToDBValue(businessType.C5))
					,new SqlParameter("@Remark", ToDBValue(businessType.Remark))
			};
			return SqlHelper.ExecuteNonQuery(sql, CommandType.Text,para);
        }		
		
        public static BusinessType GetByID(int iD)
        {
            string sql = "SELECT * FROM BusinessType WHERE ID = @ID";
            using(SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text, new SqlParameter("@ID", iD)))
			{
				if (reader.Read())
				{
					return ToModel(reader);
				}
				else
				{
					return null;
				}
       		}
        }
		
		public static BusinessType ToModel(SqlDataReader reader)
		{
			BusinessType businessType = new BusinessType();

			businessType.ID = (int)ToModelValue(reader,"ID");
			businessType.BusinessNumber = (string)ToModelValue(reader,"BusinessNumber");
			businessType.BusinessName = (string)ToModelValue(reader,"BusinessName");
			businessType.K1 = (decimal)ToModelValue(reader,"K1");
			businessType.K2 = (decimal)ToModelValue(reader,"K2");
			businessType.K3 = (decimal)ToModelValue(reader,"K3");
			businessType.K4 = (decimal)ToModelValue(reader,"K4");
			businessType.K5 = (decimal)ToModelValue(reader,"K5");
			businessType.C1 = (decimal)ToModelValue(reader,"C1");
			businessType.C2 = (decimal)ToModelValue(reader,"C2");
			businessType.C3 = (decimal)ToModelValue(reader,"C3");
			businessType.C4 = (decimal)ToModelValue(reader,"C4");
			businessType.C5 = (decimal)ToModelValue(reader,"C5");
			businessType.Remark = (string)ToModelValue(reader,"Remark");
			return businessType;
		}
		
		public static int GetTotalCount()
		{
			string sql = "SELECT count(*) FROM BusinessType";
			return (int)SqlHelper.ExecuteScalar(sql, CommandType.Text);
		}
		
		public static List<BusinessType> GetPagedData(int startIndex,int endIndex)
		{
			string sql = "SELECT * from(SELECT *,row_number() over(order by ID desc) rownum FROM BusinessType ) t where rownum>=@startIndex and rownum<=@endIndex";
			using(SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text,
				new SqlParameter("@startIndex",startIndex),
				new SqlParameter("@endIndex",endIndex)))
			{
				return ToModels(reader);					
			}
		}
		
		public static List<BusinessType> GetAll()
		{
			string sql = "SELECT * FROM BusinessType";
			using(SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text))
			{
				return ToModels(reader);			
			}
		}
		
		protected static List<BusinessType> ToModels(SqlDataReader reader)
		{
			var list = new List<BusinessType>();
			while(reader.Read())
			{
				list.Add(ToModel(reader));
			}	
			return list;
		}		
		
		protected static object ToDBValue(object value)
		{
			if(value==null)
			{
				return DBNull.Value;
			}
			else
			{
				return value;
			}
		}
		
		protected static object ToModelValue(SqlDataReader reader,string columnName)
		{
			if(reader.IsDBNull(reader.GetOrdinal(columnName)))
			{
				return null;
			}
			else
			{
				return reader[columnName];
			}
		}
		public static BusinessType GetMaxCode()
		{
			string sql = "SELECT top(1) * FROM BusinessType order by BusinessNumber desc";
			using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text, null))
			{
				if (reader.Read())
				{
					return ToModel(reader);
				}
				else
				{
					return null;
				}
			}
		}
	}
}
