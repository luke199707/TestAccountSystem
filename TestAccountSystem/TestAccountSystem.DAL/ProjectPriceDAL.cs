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
	public partial class ProjectPriceDAL
	{
        public static object Insert(ProjectPrice projectPrice)
		{
				string sql ="INSERT INTO ProjectPrice (BusinessNumber, BusinessName, ProjectNumber, ProjectName, BillingUnit, BillingPrice, Remark)  output inserted.ID VALUES (@BusinessNumber, @BusinessName, @ProjectNumber, @ProjectName, @BillingUnit, @BillingPrice, @Remark)";
				SqlParameter[] para = new SqlParameter[]
					{
						new SqlParameter("@BusinessNumber", ToDBValue(projectPrice.BusinessNumber)),
						new SqlParameter("@BusinessName", ToDBValue(projectPrice.BusinessName)),
						new SqlParameter("@ProjectNumber", ToDBValue(projectPrice.ProjectNumber)),
						new SqlParameter("@ProjectName", ToDBValue(projectPrice.ProjectName)),
						new SqlParameter("@BillingUnit", ToDBValue(projectPrice.BillingUnit)),
						new SqlParameter("@BillingPrice", ToDBValue(projectPrice.BillingPrice)),
						new SqlParameter("@Remark", ToDBValue(projectPrice.Remark)),
					};
					
				return SqlHelper.ExecuteScalar(sql,CommandType.Text, para);
		}

        public static int DeleteByID(int iD)
		{
            string sql = "DELETE FROM ProjectPrice WHERE ID = @ID";

           SqlParameter[] para = new SqlParameter[]
			{
				new SqlParameter("@ID", iD)
			};
		
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text,para);
		}
		
				
        public static int Update(ProjectPrice projectPrice)
        {
            string sql =
                @"UPDATE ProjectPrice SET  BusinessNumber = @BusinessNumber 
                , BusinessName = @BusinessName 
                , ProjectNumber = @ProjectNumber 
                , ProjectName = @ProjectName 
                , BillingUnit = @BillingUnit 
                , BillingPrice = @BillingPrice 
                , Remark = @Remark 
                 WHERE ID = @ID";

			SqlParameter[] para = new SqlParameter[]
			{
				new SqlParameter("@ID", projectPrice.ID)
					,new SqlParameter("@BusinessNumber", ToDBValue(projectPrice.BusinessNumber))
					,new SqlParameter("@BusinessName", ToDBValue(projectPrice.BusinessName))
					,new SqlParameter("@ProjectNumber", ToDBValue(projectPrice.ProjectNumber))
					,new SqlParameter("@ProjectName", ToDBValue(projectPrice.ProjectName))
					,new SqlParameter("@BillingUnit", ToDBValue(projectPrice.BillingUnit))
					,new SqlParameter("@BillingPrice", ToDBValue(projectPrice.BillingPrice))
					,new SqlParameter("@Remark", ToDBValue(projectPrice.Remark))
			};
			return SqlHelper.ExecuteNonQuery(sql, CommandType.Text,para);
        }		
		
        public static ProjectPrice GetByID(int iD)
        {
            string sql = "SELECT * FROM ProjectPrice WHERE ID = @ID";
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
		
		public static ProjectPrice ToModel(SqlDataReader reader)
		{
			ProjectPrice projectPrice = new ProjectPrice();

			projectPrice.ID = (int)ToModelValue(reader,"ID");
			projectPrice.BusinessNumber = (string)ToModelValue(reader,"BusinessNumber");
			projectPrice.BusinessName = (string)ToModelValue(reader,"BusinessName");
			projectPrice.ProjectNumber = (string)ToModelValue(reader,"ProjectNumber");
			projectPrice.ProjectName = (string)ToModelValue(reader,"ProjectName");
			projectPrice.BillingUnit = (string)ToModelValue(reader,"BillingUnit");
			projectPrice.BillingPrice = (decimal)ToModelValue(reader,"BillingPrice");
			projectPrice.Remark = (string)ToModelValue(reader,"Remark");
			return projectPrice;
		}
		
		public static int GetTotalCount()
		{
			string sql = "SELECT count(*) FROM ProjectPrice";
			return (int)SqlHelper.ExecuteScalar(sql, CommandType.Text);
		}
		
		public static List<ProjectPrice> GetPagedData(int startIndex,int endIndex)
		{
			string sql = "SELECT * from(SELECT *,row_number() over(order by ID desc) rownum FROM ProjectPrice ) t where rownum>=@startIndex and rownum<=@endIndex";
			using(SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text,
				new SqlParameter("@startIndex",startIndex),
				new SqlParameter("@endIndex",endIndex)))
			{
				return ToModels(reader);					
			}
		}
		
		public static List<ProjectPrice> GetAll()
		{
			string sql = "SELECT * FROM ProjectPrice";
			using(SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text))
			{
				return ToModels(reader);			
			}
		}
		
		protected static List<ProjectPrice> ToModels(SqlDataReader reader)
		{
			var list = new List<ProjectPrice>();
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
	}
}
