//============================================================
// author:wangzhenkun
//============================================================

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using TestAccountSystem.Model;
namespace TestAccountSystem.DAL
{
    public partial class TALogDAL
	{
        public static object Insert(TALog tALog)
		{
				string sql ="INSERT INTO TALog (Name, Operation, Description, Time1, Ip, Remark, IpDesc, remark1, remark2)  output inserted.Id VALUES (@Name, @Operation, @Description, @Time1, @Ip, @Remark, @IpDesc, @remark1, @remark2)";
				SqlParameter[] para = new SqlParameter[]
					{
						new SqlParameter("@Name", ToDBValue(tALog.name)),
						new SqlParameter("@Operation", ToDBValue(tALog.operation)),
						new SqlParameter("@Description", ToDBValue(tALog.description)),
						new SqlParameter("@Time1", ToDBValue(tALog.time1)),
						new SqlParameter("@Ip", ToDBValue(tALog.ip)),
						new SqlParameter("@Remark", ToDBValue(tALog.remark)),
						new SqlParameter("@IpDesc", ToDBValue(tALog.ipDesc)),
						new SqlParameter("@remark1", ToDBValue(tALog.remark1)),
						new SqlParameter("@remark2", ToDBValue(tALog.remark2)),
					};
					
				return SqlHelper.ExecuteScalar(sql,CommandType.Text, para);
		}

        public static int DeleteById(int id)
		{
            string sql = "DELETE FROM TALog WHERE Id = @Id";

           SqlParameter[] para = new SqlParameter[]
			{
				new SqlParameter("@Id", id)
			};
		
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text,para);
		}
		
				
        public static int Update(TALog tALog)
        {
            string sql =
                @"UPDATE TALog SET  Name = @Name 
                , Operation = @Operation 
                , Description = @Description 
                , Time1 = @Time1 
                , Ip = @Ip 
                , Remark = @Remark 
                , IpDesc = @IpDesc 
                , remark1 = @remark1 
                , remark2 = @remark2 
                 WHERE Id = @Id";

			SqlParameter[] para = new SqlParameter[]
			{
				new SqlParameter("@Id", tALog.id)
					,new SqlParameter("@Name", ToDBValue(tALog.name))
					,new SqlParameter("@Operation", ToDBValue(tALog.operation))
					,new SqlParameter("@Description", ToDBValue(tALog.description))
					,new SqlParameter("@Time1", ToDBValue(tALog.time1))
					,new SqlParameter("@Ip", ToDBValue(tALog.ip))
					,new SqlParameter("@Remark", ToDBValue(tALog.remark))
					,new SqlParameter("@IpDesc", ToDBValue(tALog.ipDesc))
					,new SqlParameter("@remark1", ToDBValue(tALog.remark1))
					,new SqlParameter("@remark2", ToDBValue(tALog.remark2))
			};
			return SqlHelper.ExecuteNonQuery(sql, CommandType.Text,para);
        }		
		
        public static TALog GetById(int id)
        {
            string sql = "SELECT * FROM TALog WHERE Id = @Id";
            using(SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text, new SqlParameter("@Id", id)))
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
		
		public static TALog ToModel(SqlDataReader reader)
		{
			TALog tALog = new TALog();

			tALog.id = (int)ToModelValue(reader,"Id");
			tALog.name = (string)ToModelValue(reader,"Name");
			tALog.operation = (string)ToModelValue(reader,"Operation");
			tALog.description = (string)ToModelValue(reader,"Description");
			tALog.time1 = (DateTime?)ToModelValue(reader,"Time1");
			tALog.ip = (string)ToModelValue(reader,"Ip");
			tALog.remark = (string)ToModelValue(reader,"Remark");
			tALog.ipDesc = (string)ToModelValue(reader,"IpDesc");
			tALog.remark1 = (string)ToModelValue(reader,"remark1");
			tALog.remark2 = (string)ToModelValue(reader,"remark2");
			return tALog;
		}
		
		public static int GetTotalCount()
		{
			string sql = "SELECT count(*) FROM TALog";
			return (int)SqlHelper.ExecuteScalar(sql, CommandType.Text);
		}
		
		public static List<TALog> GetPagedData(int startIndex,int endIndex)
		{
			string sql = "SELECT * from(SELECT *,row_number() over(order by Id desc) rownum FROM TALog ) t where rownum>=@startIndex and rownum<=@endIndex";
			using(SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text,
				new SqlParameter("@startIndex",startIndex),
				new SqlParameter("@endIndex",endIndex)))
			{
				return ToModels(reader);					
			}
		}
		
		public static List<TALog> GetAll()
		{
			string sql = "SELECT * FROM TALog";
			using(SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text))
			{
				return ToModels(reader);			
			}
		}
		
		protected static List<TALog> ToModels(SqlDataReader reader)
		{
			var list = new List<TALog>();
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


		//---------------------------------下面添加的---------------------
		public static object AdminInsert(TALog talog)
		{
            #region
            //PE_Log pE_Log = new PE_Log();
            //pE_Log.IsManager = true;
            //pE_Log.IP = CommonHelper.GetClientIP();
            //System.Web.UI.Page page = new Page();
            //pE_Log.Name = page.Session["Admin"].ToString();
            //pE_Log.Time = DateTime.Now;
            //pE_Log.Operation = operation;
            //pE_Log.Description = description;

            //pE_Log.IPDesc = getIDDescQQ(pE_Log.IP);
            //return PE_LogDAL.Insert(pE_Log);
            #endregion
            return TALogDAL.Insert(talog);
		}
		
	}
}
