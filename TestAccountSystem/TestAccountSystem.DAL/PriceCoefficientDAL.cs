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
	public partial class PriceCoefficientDAL
	{
        public static object Insert(PriceCoefficient priceCoefficient)
		{
				string sql ="INSERT INTO PriceCoefficient (BusinessNumber, BusinessName, PriceCoefficientNumber, PriceCoefficientName, K1, K2, K3, K4, K5, C1, C2, C3, C4, C5, Remark)  output inserted.ID VALUES (@BusinessNumber, @BusinessName, @PriceCoefficientNumber, @PriceCoefficientName, @K1, @K2, @K3, @K4, @K5, @C1, @C2, @C3, @C4, @C5, @Remark)";
				SqlParameter[] para = new SqlParameter[]
					{
						new SqlParameter("@BusinessNumber", ToDBValue(priceCoefficient.BusinessNumber)),
						new SqlParameter("@BusinessName", ToDBValue(priceCoefficient.BusinessName)),
						new SqlParameter("@PriceCoefficientNumber", ToDBValue(priceCoefficient.PriceCoefficientNumber)),
						new SqlParameter("@PriceCoefficientName", ToDBValue(priceCoefficient.PriceCoefficientName)),
						new SqlParameter("@K1", ToDBValue(priceCoefficient.K1)),
						new SqlParameter("@K2", ToDBValue(priceCoefficient.K2)),
						new SqlParameter("@K3", ToDBValue(priceCoefficient.K3)),
						new SqlParameter("@K4", ToDBValue(priceCoefficient.K4)),
						new SqlParameter("@K5", ToDBValue(priceCoefficient.K5)),
						new SqlParameter("@C1", ToDBValue(priceCoefficient.C1)),
						new SqlParameter("@C2", ToDBValue(priceCoefficient.C2)),
						new SqlParameter("@C3", ToDBValue(priceCoefficient.C3)),
						new SqlParameter("@C4", ToDBValue(priceCoefficient.C4)),
						new SqlParameter("@C5", ToDBValue(priceCoefficient.C5)),
						new SqlParameter("@Remark", ToDBValue(priceCoefficient.Remark)),
					};
					
				return SqlHelper.ExecuteScalar(sql,CommandType.Text, para);
		}

        public static int DeleteByID(int iD)
		{
            string sql = "DELETE FROM PriceCoefficient WHERE ID = @ID";

           SqlParameter[] para = new SqlParameter[]
			{
				new SqlParameter("@ID", iD)
			};
		
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text,para);
		}
		
				
        public static int Update(PriceCoefficient priceCoefficient)
        {
            string sql =
                @"UPDATE PriceCoefficient SET  BusinessNumber = @BusinessNumber 
                , BusinessName = @BusinessName 
                , PriceCoefficientNumber = @PriceCoefficientNumber 
                , PriceCoefficientName = @PriceCoefficientName 
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
				new SqlParameter("@ID", priceCoefficient.ID)
					,new SqlParameter("@BusinessNumber", ToDBValue(priceCoefficient.BusinessNumber))
					,new SqlParameter("@BusinessName", ToDBValue(priceCoefficient.BusinessName))
					,new SqlParameter("@PriceCoefficientNumber", ToDBValue(priceCoefficient.PriceCoefficientNumber))
					,new SqlParameter("@PriceCoefficientName", ToDBValue(priceCoefficient.PriceCoefficientName))
					,new SqlParameter("@K1", ToDBValue(priceCoefficient.K1))
					,new SqlParameter("@K2", ToDBValue(priceCoefficient.K2))
					,new SqlParameter("@K3", ToDBValue(priceCoefficient.K3))
					,new SqlParameter("@K4", ToDBValue(priceCoefficient.K4))
					,new SqlParameter("@K5", ToDBValue(priceCoefficient.K5))
					,new SqlParameter("@C1", ToDBValue(priceCoefficient.C1))
					,new SqlParameter("@C2", ToDBValue(priceCoefficient.C2))
					,new SqlParameter("@C3", ToDBValue(priceCoefficient.C3))
					,new SqlParameter("@C4", ToDBValue(priceCoefficient.C4))
					,new SqlParameter("@C5", ToDBValue(priceCoefficient.C5))
					,new SqlParameter("@Remark", ToDBValue(priceCoefficient.Remark))
			};
			return SqlHelper.ExecuteNonQuery(sql, CommandType.Text,para);
        }		
		
        public static PriceCoefficient GetByID(int iD)
        {
            string sql = "SELECT * FROM PriceCoefficient WHERE ID = @ID";
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
		
		public static PriceCoefficient ToModel(SqlDataReader reader)
		{
			PriceCoefficient priceCoefficient = new PriceCoefficient();

			priceCoefficient.ID = (int)ToModelValue(reader,"ID");
			priceCoefficient.BusinessNumber = (string)ToModelValue(reader,"BusinessNumber");
			priceCoefficient.BusinessName = (string)ToModelValue(reader,"BusinessName");
			priceCoefficient.PriceCoefficientNumber = (string)ToModelValue(reader,"PriceCoefficientNumber");
			priceCoefficient.PriceCoefficientName = (string)ToModelValue(reader,"PriceCoefficientName");
			priceCoefficient.K1 = (double)ToModelValue(reader,"K1");
			priceCoefficient.K2 = (double)ToModelValue(reader,"K2");
			priceCoefficient.K3 = (double)ToModelValue(reader,"K3");
			priceCoefficient.K4 = (double)ToModelValue(reader,"K4");
			priceCoefficient.K5 = (double)ToModelValue(reader,"K5");
			priceCoefficient.C1 = (double)ToModelValue(reader,"C1");
			priceCoefficient.C2 = (double)ToModelValue(reader,"C2");
			priceCoefficient.C3 = (double)ToModelValue(reader,"C3");
			priceCoefficient.C4 = (double)ToModelValue(reader,"C4");
			priceCoefficient.C5 = (double)ToModelValue(reader,"C5");
			priceCoefficient.Remark = (string)ToModelValue(reader,"Remark");
			return priceCoefficient;
		}
		
		public static int GetTotalCount()
		{
			string sql = "SELECT count(*) FROM PriceCoefficient";
			return (int)SqlHelper.ExecuteScalar(sql, CommandType.Text);
		}
		
		public static List<PriceCoefficient> GetPagedData(int startIndex,int endIndex)
		{
			string sql = "SELECT * from(SELECT *,row_number() over(order by ID desc) rownum FROM PriceCoefficient ) t where rownum>=@startIndex and rownum<=@endIndex";
			using(SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text,
				new SqlParameter("@startIndex",startIndex),
				new SqlParameter("@endIndex",endIndex)))
			{
				return ToModels(reader);					
			}
		}
		
		public static List<PriceCoefficient> GetAll()
		{
			string sql = "SELECT * FROM PriceCoefficient";
			using(SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text))
			{
				return ToModels(reader);			
			}
		}
		
		protected static List<PriceCoefficient> ToModels(SqlDataReader reader)
		{
			var list = new List<PriceCoefficient>();
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
