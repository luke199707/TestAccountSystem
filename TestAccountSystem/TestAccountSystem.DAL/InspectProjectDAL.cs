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
	public partial class InspectProjectDAL
	{
        public static object Insert(InspectProject inspectProject)
		{
				string sql ="INSERT INTO InspectProject (BusinessNumber, BusinessName, ProjectNumber, ProjectName, BillingUnit, BillingPrice, Remark)  output inserted.ID VALUES (@BusinessNumber, @BusinessName, @ProjectNumber, @ProjectName, @BillingUnit, @BillingPrice, @Remark)";
				SqlParameter[] para = new SqlParameter[]
					{
						new SqlParameter("@BusinessNumber", ToDBValue(inspectProject.BusinessNumber)),
						new SqlParameter("@BusinessName", ToDBValue(inspectProject.BusinessName)),
						new SqlParameter("@ProjectNumber", ToDBValue(inspectProject.ProjectNumber)),
						new SqlParameter("@ProjectName", ToDBValue(inspectProject.ProjectName)),
						new SqlParameter("@BillingUnit", ToDBValue(inspectProject.BillingUnit)),
						new SqlParameter("@BillingPrice", ToDBValue(inspectProject.BillingPrice)),
						new SqlParameter("@Remark", ToDBValue(inspectProject.Remark)),
					};
					
				return SqlHelper.ExecuteScalar(sql,CommandType.Text, para);
		}

        public static int DeleteByID(int iD)
		{
            string sql = "DELETE FROM InspectProject WHERE ID = @ID";

           SqlParameter[] para = new SqlParameter[]
			{
				new SqlParameter("@ID", iD)
			};
		
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text,para);
		}
		
				
        public static int Update(InspectProject inspectProject)
        {
            string sql =
                @"UPDATE InspectProject SET  BusinessNumber = @BusinessNumber 
                , BusinessName = @BusinessName 
                , ProjectNumber = @ProjectNumber 
                , ProjectName = @ProjectName 
                , BillingUnit = @BillingUnit 
                , BillingPrice = @BillingPrice 
                , Remark = @Remark 
                 WHERE ID = @ID";

			SqlParameter[] para = new SqlParameter[]
			{
				new SqlParameter("@ID", inspectProject.ID)
					,new SqlParameter("@BusinessNumber", ToDBValue(inspectProject.BusinessNumber))
					,new SqlParameter("@BusinessName", ToDBValue(inspectProject.BusinessName))
					,new SqlParameter("@ProjectNumber", ToDBValue(inspectProject.ProjectNumber))
					,new SqlParameter("@ProjectName", ToDBValue(inspectProject.ProjectName))
					,new SqlParameter("@BillingUnit", ToDBValue(inspectProject.BillingUnit))
					,new SqlParameter("@BillingPrice", ToDBValue(inspectProject.BillingPrice))
					,new SqlParameter("@Remark", ToDBValue(inspectProject.Remark))
			};
			return SqlHelper.ExecuteNonQuery(sql, CommandType.Text,para);
        }		
		
        public static InspectProject GetByID(int iD)
        {
            string sql = "SELECT * FROM InspectProject WHERE ID = @ID";
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
		
		public static InspectProject ToModel(SqlDataReader reader)
		{
			InspectProject inspectProject = new InspectProject();

			inspectProject.ID = (int)ToModelValue(reader,"ID");
			inspectProject.BusinessNumber = (string)ToModelValue(reader,"BusinessNumber");
			inspectProject.BusinessName = (string)ToModelValue(reader,"BusinessName");
			inspectProject.ProjectNumber = (string)ToModelValue(reader,"ProjectNumber");
			inspectProject.ProjectName = (string)ToModelValue(reader,"ProjectName");
			inspectProject.BillingUnit = (string)ToModelValue(reader,"BillingUnit");
			inspectProject.BillingPrice = (decimal)ToModelValue(reader,"BillingPrice");
			inspectProject.Remark = (string)ToModelValue(reader,"Remark");
			return inspectProject;
		}
		
		public static int GetTotalCount()
		{
			string sql = "SELECT count(*) FROM InspectProject";
			return (int)SqlHelper.ExecuteScalar(sql, CommandType.Text);
		}
		
		public static List<InspectProject> GetPagedData(int startIndex,int endIndex)
		{
			string sql = "SELECT * from(SELECT *,row_number() over(order by ID desc) rownum FROM InspectProject ) t where rownum>=@startIndex and rownum<=@endIndex";
			using(SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text,
				new SqlParameter("@startIndex",startIndex),
				new SqlParameter("@endIndex",endIndex)))
			{
				return ToModels(reader);					
			}
		}
		
		public static List<InspectProject> GetAll()
		{
			string sql = "SELECT * FROM InspectProject";
			using(SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text))
			{
				return ToModels(reader);			
			}
		}
		
		protected static List<InspectProject> ToModels(SqlDataReader reader)
		{
			var list = new List<InspectProject>();
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
