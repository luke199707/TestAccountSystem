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
	public partial class InspectorLogDAL
	{
        public static object Insert(InspectorLog inspectorLog)
		{
				string sql ="INSERT INTO InspectorLog (LogNumber, RegisterNumber, Time, Location, Inspector, InspectionContent, Annex, Remark)  output inserted.ID VALUES (@LogNumber, @RegisterNumber, @Time, @Location, @Inspector, @InspectionContent, @Annex, @Remark)";
				SqlParameter[] para = new SqlParameter[]
					{
						new SqlParameter("@LogNumber", ToDBValue(inspectorLog.LogNumber)),
						new SqlParameter("@RegisterNumber", ToDBValue(inspectorLog.RegisterNumber)),
						new SqlParameter("@Time", ToDBValue(inspectorLog.Time)),
						new SqlParameter("@Location", ToDBValue(inspectorLog.Location)),
						new SqlParameter("@Inspector", ToDBValue(inspectorLog.Inspector)),
						new SqlParameter("@InspectionContent", ToDBValue(inspectorLog.InspectionContent)),
						new SqlParameter("@Annex", ToDBValue(inspectorLog.Annex)),
						new SqlParameter("@Remark", ToDBValue(inspectorLog.Remark)),
					};
					
				return SqlHelper.ExecuteScalar(sql,CommandType.Text, para);
		}

        public static int DeleteByID(int iD)
		{
            string sql = "DELETE FROM InspectorLog WHERE ID = @ID";

           SqlParameter[] para = new SqlParameter[]
			{
				new SqlParameter("@ID", iD)
			};
		
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text,para);
		}
		
				
        public static int Update(InspectorLog inspectorLog)
        {
            string sql =
                @"UPDATE InspectorLog SET  LogNumber = @LogNumber 
                , RegisterNumber = @RegisterNumber 
                , Time = @Time 
                , Location = @Location 
                , Inspector = @Inspector 
                , InspectionContent = @InspectionContent 
                , Annex = @Annex 
                , Remark = @Remark 
                 WHERE ID = @ID";

			SqlParameter[] para = new SqlParameter[]
			{
				new SqlParameter("@ID", inspectorLog.ID)
					,new SqlParameter("@LogNumber", ToDBValue(inspectorLog.LogNumber))
					,new SqlParameter("@RegisterNumber", ToDBValue(inspectorLog.RegisterNumber))
					,new SqlParameter("@Time", ToDBValue(inspectorLog.Time))
					,new SqlParameter("@Location", ToDBValue(inspectorLog.Location))
					,new SqlParameter("@Inspector", ToDBValue(inspectorLog.Inspector))
					,new SqlParameter("@InspectionContent", ToDBValue(inspectorLog.InspectionContent))
					,new SqlParameter("@Annex", ToDBValue(inspectorLog.Annex))
					,new SqlParameter("@Remark", ToDBValue(inspectorLog.Remark))
			};
			return SqlHelper.ExecuteNonQuery(sql, CommandType.Text,para);
        }		
		
        public static InspectorLog GetByID(int iD)
        {
            string sql = "SELECT * FROM InspectorLog WHERE ID = @ID";
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
		
		public static InspectorLog ToModel(SqlDataReader reader)
		{
			InspectorLog inspectorLog = new InspectorLog();

			inspectorLog.ID = (int)ToModelValue(reader,"ID");
			inspectorLog.LogNumber = (string)ToModelValue(reader,"LogNumber");
			inspectorLog.RegisterNumber = (string)ToModelValue(reader,"RegisterNumber");
			inspectorLog.Time = (DateTime)ToModelValue(reader,"Time");
			inspectorLog.Location = (string)ToModelValue(reader,"Location");
			inspectorLog.Inspector = (string)ToModelValue(reader,"Inspector");
			inspectorLog.InspectionContent = (string)ToModelValue(reader,"InspectionContent");
			inspectorLog.Annex = (string)ToModelValue(reader,"Annex");
			inspectorLog.Remark = (string)ToModelValue(reader,"Remark");
			return inspectorLog;
		}
		
		public static int GetTotalCount()
		{
			string sql = "SELECT count(*) FROM InspectorLog";
			return (int)SqlHelper.ExecuteScalar(sql, CommandType.Text);
		}
		
		public static List<InspectorLog> GetPagedData(int startIndex,int endIndex)
		{
			string sql = "SELECT * from(SELECT *,row_number() over(order by ID desc) rownum FROM InspectorLog ) t where rownum>=@startIndex and rownum<=@endIndex";
			using(SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text,
				new SqlParameter("@startIndex",startIndex),
				new SqlParameter("@endIndex",endIndex)))
			{
				return ToModels(reader);					
			}
		}
		
		public static List<InspectorLog> GetAll()
		{
			string sql = "SELECT * FROM InspectorLog";
			using(SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text))
			{
				return ToModels(reader);			
			}
		}
		
		protected static List<InspectorLog> ToModels(SqlDataReader reader)
		{
			var list = new List<InspectorLog>();
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
