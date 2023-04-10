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
	public partial class InspectLogDAL
	{
        public static object Insert(InspectLog inspectLog)
		{
				string sql ="INSERT INTO InspectLog (LogNumber, RegisterNumber, Location, Inspector, InspectionContent, Time, Remark)  output inserted.ID VALUES (@LogNumber, @RegisterNumber, @Location, @Inspector, @InspectionContent, @Time, @Remark)";
				SqlParameter[] para = new SqlParameter[]
					{
						new SqlParameter("@LogNumber", ToDBValue(inspectLog.LogNumber)),
						new SqlParameter("@RegisterNumber", ToDBValue(inspectLog.RegisterNumber)),
						new SqlParameter("@Location", ToDBValue(inspectLog.Location)),
						new SqlParameter("@Inspector", ToDBValue(inspectLog.Inspector)),
						new SqlParameter("@InspectionContent", ToDBValue(inspectLog.InspectionContent)),
						new SqlParameter("@Time", ToDBValue(inspectLog.Time)),
						new SqlParameter("@Remark", ToDBValue(inspectLog.Remark)),
					};
					
				return SqlHelper.ExecuteScalar(sql,CommandType.Text, para);
		}

        public static int DeleteByID(int iD)
		{
            string sql = "DELETE FROM InspectLog WHERE ID = @ID";

           SqlParameter[] para = new SqlParameter[]
			{
				new SqlParameter("@ID", iD)
			};
		
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text,para);
		}
		
				
        public static int Update(InspectLog inspectLog)
        {
            string sql =
                @"UPDATE InspectLog SET  LogNumber = @LogNumber 
                , RegisterNumber = @RegisterNumber 
                , Location = @Location 
                , Inspector = @Inspector 
                , InspectionContent = @InspectionContent 
                , Time = @Time 
                , Remark = @Remark 
                 WHERE ID = @ID";

			SqlParameter[] para = new SqlParameter[]
			{
				new SqlParameter("@ID", inspectLog.ID)
					,new SqlParameter("@LogNumber", ToDBValue(inspectLog.LogNumber))
					,new SqlParameter("@RegisterNumber", ToDBValue(inspectLog.RegisterNumber))
					,new SqlParameter("@Location", ToDBValue(inspectLog.Location))
					,new SqlParameter("@Inspector", ToDBValue(inspectLog.Inspector))
					,new SqlParameter("@InspectionContent", ToDBValue(inspectLog.InspectionContent))
					,new SqlParameter("@Time", ToDBValue(inspectLog.Time))
					,new SqlParameter("@Remark", ToDBValue(inspectLog.Remark))
			};
			return SqlHelper.ExecuteNonQuery(sql, CommandType.Text,para);
        }		
		
        public static InspectLog GetByID(int iD)
        {
            string sql = "SELECT * FROM InspectLog WHERE ID = @ID";
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
		
		public static InspectLog ToModel(SqlDataReader reader)
		{
			InspectLog inspectLog = new InspectLog();

			inspectLog.ID = (int)ToModelValue(reader,"ID");
			inspectLog.LogNumber = (string)ToModelValue(reader,"LogNumber");
			inspectLog.RegisterNumber = (string)ToModelValue(reader,"RegisterNumber");
			inspectLog.Location = (string)ToModelValue(reader,"Location");
			inspectLog.Inspector = (string)ToModelValue(reader,"Inspector");
			inspectLog.InspectionContent = (string)ToModelValue(reader,"InspectionContent");
			inspectLog.Time = (DateTime)ToModelValue(reader,"Time");
			inspectLog.Remark = (string)ToModelValue(reader,"Remark");
			return inspectLog;
		}
		
		public static int GetTotalCount()
		{
			string sql = "SELECT count(*) FROM InspectLog";
			return (int)SqlHelper.ExecuteScalar(sql, CommandType.Text);
		}
		
		public static List<InspectLog> GetPagedData(int startIndex,int endIndex)
		{
			string sql = "SELECT * from(SELECT *,row_number() over(order by ID desc) rownum FROM InspectLog ) t where rownum>=@startIndex and rownum<=@endIndex";
			using(SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text,
				new SqlParameter("@startIndex",startIndex),
				new SqlParameter("@endIndex",endIndex)))
			{
				return ToModels(reader);					
			}
		}
		
		public static List<InspectLog> GetAll()
		{
			string sql = "SELECT * FROM InspectLog";
			using(SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text))
			{
				return ToModels(reader);			
			}
		}
		
		protected static List<InspectLog> ToModels(SqlDataReader reader)
		{
			var list = new List<InspectLog>();
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
		public static InspectLog GetMaxCode()
		{
			string sql = "SELECT top(1) * FROM InspectLog order by LogNumber desc";
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
		public static int DeleteByRegisterNum(string RegisterNumber)
		{
			string sql = "DELETE FROM InspectLog WHERE RegisterNumber = @RegisterNumber";

			SqlParameter[] para = new SqlParameter[]
			 {
				new SqlParameter("@RegisterNumber", RegisterNumber)
			 };
			return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, para);
		}
	}
}
