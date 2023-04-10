//============================================================
// author:wangzhenkun
//============================================================

using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TestAccountSystem.Model;

namespace TestAccountSystem.DAL
{
	public partial class UserRightDAL
	{
        public static object Insert(UserRight userRight)
		{
				string sql ="INSERT INTO UserRight (userId, code, remark1, remark2)  output inserted.id VALUES (@userId, @code, @remark1, @remark2)";
				SqlParameter[] para = new SqlParameter[]
					{
						new SqlParameter("@userId", ToDBValue(userRight.userId)),
						new SqlParameter("@code", ToDBValue(userRight.code)),
						new SqlParameter("@remark1", ToDBValue(userRight.remark1)),
						new SqlParameter("@remark2", ToDBValue(userRight.remark2)),
					};
					
				return SqlHelper.ExecuteScalar(sql,CommandType.Text, para);
		}

        public static int DeleteById(int id)
		{
            string sql = "DELETE FROM UserRight WHERE Id = @Id";

           SqlParameter[] para = new SqlParameter[]
			{
				new SqlParameter("@id", id)
			};
		
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text,para);
		}
		
				
        public static int Update(UserRight userRight)
        {
            string sql =
                @"UPDATE UserRight SET  userId = @userId 
                , code = @code 
                , remark1 = @remark1 
                , remark2 = @remark2 
                 WHERE id = @id";

			SqlParameter[] para = new SqlParameter[]
			{
				new SqlParameter("@id", userRight.id)
					,new SqlParameter("@userId", ToDBValue(userRight.userId))
					,new SqlParameter("@code", ToDBValue(userRight.code))
					,new SqlParameter("@remark1", ToDBValue(userRight.remark1))
					,new SqlParameter("@remark2", ToDBValue(userRight.remark2))
			};
			return SqlHelper.ExecuteNonQuery(sql, CommandType.Text,para);
        }		
		
        public static UserRight GetById(int id)
        {
            string sql = "SELECT * FROM UserRight WHERE Id = @Id";
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
		
		public static UserRight ToModel(SqlDataReader reader)
		{
			UserRight userRight = new UserRight();

			userRight.id = (int)ToModelValue(reader,"id");
			userRight.userId = (string)ToModelValue(reader,"userId");
			userRight.code = (string)ToModelValue(reader,"code");
			userRight.remark1 = (string)ToModelValue(reader,"remark1");
			userRight.remark2 = (string)ToModelValue(reader,"remark2");
			return userRight;
		}
		
		public static int GetTotalCount()
		{
			string sql = "SELECT count(*) FROM UserRight";
			return (int)SqlHelper.ExecuteScalar(sql, CommandType.Text);
		}
		
		public static List<UserRight> GetPagedData(int startIndex,int endIndex)
		{
			string sql = "SELECT * from(SELECT *,row_number() over(order by id desc) rownum FROM UserRight ) t where rownum>=@startIndex and rownum<=@endIndex";
			using(SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text,
				new SqlParameter("@startIndex",startIndex),
				new SqlParameter("@endIndex",endIndex)))
			{
				return ToModels(reader);					
			}
		}
		
		public static List<UserRight> GetAll()
		{
			string sql = "SELECT * FROM UserRight";
			using(SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text))
			{
				return ToModels(reader);			
			}
		}
		
		protected static List<UserRight> ToModels(SqlDataReader reader)
		{
			var list = new List<UserRight>();
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
		//-------------------------------添加的---------------
		public static int DeleteByUserId(string userid)
		{
			string sql = "DELETE FROM UserRight WHERE userId = @userid";

			SqlParameter[] para = new SqlParameter[]
			 {
				new SqlParameter("@userid", userid)
			 };

			return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, para);
		}
		public static List<UserRight> GetListByUserId(string userId)
		{
			string sql = "select id, userId, code, remark1, remark2 from UserRight where userId=@userId";
			using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text, new SqlParameter("@userId", userId)))
			{
				return ToModels(reader);
			}
		}
		public static List<UserRight> GetChildNode(string currentId,string userId)
		{
			string str = "0" + currentId + "0%";
			string sql = "select * from UserRight where userId=@userId and code like @str order by code asc";
			SqlParameter[] sp = { new SqlParameter("@str", str), new SqlParameter("@userId", Convert.ToInt32(userId)) };
			using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text, sp))
			{
				//return ToModels(reader);
				return ToModels(reader);
			}
		}
	}
}
