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
	public partial class AllUserDAL
	{
        public static object Insert(AllUser allUser)
		{
				string sql ="INSERT INTO AllUser (userName, pwd, email, roleId, state, isUseful, remark, realName, remark1)  output inserted.id VALUES (@userName, @pwd, @email, @roleId, @state, @isUseful, @remark, @realName, @remark1)";
				SqlParameter[] para = new SqlParameter[]
					{
						new SqlParameter("@userName", ToDBValue(allUser.userName)),
						new SqlParameter("@pwd", ToDBValue(allUser.pwd)),
						new SqlParameter("@email", ToDBValue(allUser.email)),
						new SqlParameter("@roleId", ToDBValue(allUser.roleId)),
						new SqlParameter("@state", ToDBValue(allUser.state)),
						new SqlParameter("@isUseful", ToDBValue(allUser.isUseful)),
						new SqlParameter("@remark", ToDBValue(allUser.remark)),
						new SqlParameter("@realName", ToDBValue(allUser.realName)),
						new SqlParameter("@remark1", ToDBValue(allUser.remark1)),
					};
					
				return SqlHelper.ExecuteScalar(sql,CommandType.Text, para);
		}

        public static int DeleteById(int id)
		{
            string sql = "DELETE FROM AllUser WHERE Id = @Id";

           SqlParameter[] para = new SqlParameter[]
			{
				new SqlParameter("@id", id)
			};
		
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text,para);
		}
		
				
        public static int Update(AllUser allUser)
        {
            string sql =
                @"UPDATE AllUser SET  userName = @userName 
                , pwd = @pwd 
                , email = @email 
                , roleId = @roleId 
                , state = @state 
                , isUseful = @isUseful 
                , remark = @remark 
                , realName = @realName 
                , remark1 = @remark1 
                 WHERE id = @id";

			SqlParameter[] para = new SqlParameter[]
			{
				new SqlParameter("@id", allUser.id)
					,new SqlParameter("@userName", ToDBValue(allUser.userName))
					,new SqlParameter("@pwd", ToDBValue(allUser.pwd))
					,new SqlParameter("@email", ToDBValue(allUser.email))
					,new SqlParameter("@roleId", ToDBValue(allUser.roleId))
					,new SqlParameter("@state", ToDBValue(allUser.state))
					,new SqlParameter("@isUseful", ToDBValue(allUser.isUseful))
					,new SqlParameter("@remark", ToDBValue(allUser.remark))
					,new SqlParameter("@realName", ToDBValue(allUser.realName))
					,new SqlParameter("@remark1", ToDBValue(allUser.remark1))
			};
			return SqlHelper.ExecuteNonQuery(sql, CommandType.Text,para);
        }		
		
        public static AllUser GetById(int id)
        {
            string sql = "SELECT * FROM AllUser WHERE Id = @Id";
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
		
		public static AllUser ToModel(SqlDataReader reader)
		{
			AllUser allUser = new AllUser();

			allUser.id = (int)ToModelValue(reader,"id");
			allUser.userName = (string)ToModelValue(reader,"userName");
			allUser.pwd = (string)ToModelValue(reader,"pwd");
			allUser.email = (string)ToModelValue(reader,"email");
			allUser.roleId = (int)ToModelValue(reader,"roleId");
			allUser.state = (bool)ToModelValue(reader,"state");
			allUser.isUseful = (bool)ToModelValue(reader,"isUseful");
			allUser.remark = (string)ToModelValue(reader,"remark");
			allUser.realName = (string)ToModelValue(reader,"realName");
			allUser.remark1 = (string)ToModelValue(reader,"remark1");
			return allUser;
		}
		
		public static int GetTotalCount()
		{
			string sql = "SELECT count(*) FROM AllUser";
			return (int)SqlHelper.ExecuteScalar(sql, CommandType.Text);
		}
		
		public static List<AllUser> GetPagedData(int startIndex,int endIndex)
		{
			string sql = "SELECT * from(SELECT *,row_number() over(order by id desc) rownum FROM AllUser ) t where rownum>=@startIndex and rownum<=@endIndex";
			using(SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text,
				new SqlParameter("@startIndex",startIndex),
				new SqlParameter("@endIndex",endIndex)))
			{
				return ToModels(reader);					
			}
		}
		
		public static List<AllUser> GetAll()
		{
			string sql = "SELECT * FROM AllUser";
			using(SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text))
			{
				return ToModels(reader);			
			}
		}
		
		protected static List<AllUser> ToModels(SqlDataReader reader)
		{
			var list = new List<AllUser>();
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

		//------------------------------------------------
		//--------------------------下面是自己添加的------------------------
		public static AllUser GetByName(string username)
		{
			string sql = "select * from dbo.AllUser where userName=@username";
			using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text, new SqlParameter("@username", username)))
			{
				if (reader.Read())
				{
					return ToModel(reader);
				}
				return null;
			}
		}

		public static int Update(string email, string pwd)
		{
			string sql = "update AllUser set pwd=@pwd where email=@email";
			SqlParameter[] sp ={new SqlParameter("@pwd",pwd),
					new SqlParameter("@email",email)};
			return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, sp);
		}
		public static int Update(string email, string username, int id)
		{
			string sql = "update AllUser set username=@username ,email=@email where id=@id";
			SqlParameter[] sp ={new SqlParameter("@username",username),
					new SqlParameter("@email",email),
			new SqlParameter("@id",id)};
			return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, sp);
		}

		public static AllUser GetByEmail(string email)
		{
			string sql = "select * from dbo.AllUser where email=@email";
			using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text, new SqlParameter("@email", email)))
			{
				if (reader.Read())
				{
					return ToModel(reader);
				}
				return null;
			}
		}

		public static int UpdateState(string email)
		{
			string sql = "update AllUser set state=1 where email=@email";
			return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, new SqlParameter("@email", email));
		}

		public static int UpdateNameEmail(AllUser allUser)
		{
			string sql = "UPDATE AllUser SET  userName = @userName , email = @email ,roleid=@roleid,remark=@remark,realName=@realName  WHERE id = @id";
			SqlParameter[] para = new SqlParameter[]
			{
				new SqlParameter("@id", allUser.id)
					,new SqlParameter("@userName", ToDBValue(allUser.userName))
					,new SqlParameter("@email", ToDBValue(allUser.email))
					,new SqlParameter("@roleid",ToDBValue(allUser.roleId))
					,new SqlParameter("@remark",ToDBValue(allUser.remark))
					,new SqlParameter("@realName",ToDBValue(allUser.realName))
			};
			return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, para);
		}
		//------------------------------------
		public static object Insert1(AllUser allUser)
		{
			string sql = "INSERT INTO AllUser (userName, pwd, email, roleId, state, isUseful, remark,realName)  output inserted.id VALUES (@userName, @pwd, @email, @roleId, @state, @isUseful, @remark,@realName)";
			SqlParameter[] para = new SqlParameter[]
				{
						new SqlParameter("@userName", ToDBValue(allUser.userName)),
						new SqlParameter("@pwd", ToDBValue(allUser.pwd)),
						new SqlParameter("@email", ToDBValue(allUser.email)),
						new SqlParameter("@roleId", ToDBValue(allUser.roleId)),
						new SqlParameter("@state", true),
						new SqlParameter("@isUseful", true),
						new SqlParameter("@remark", ToDBValue(allUser.remark)),
						new SqlParameter("@realName", ToDBValue(allUser.realName))
				};

			return SqlHelper.ExecuteScalar(sql, CommandType.Text, para);
		}
		public static int UpdatePwd(string pwd, int id)
		{
			string sql = "update AllUser set pwd=@pwd where id=@id";
			SqlParameter[] sp = { new SqlParameter("@pwd",pwd)
			,new SqlParameter("@id",id)};
			return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, sp);
		}
		public static object GetId(string username, string pwd)
		{
			string sql = "select id from alluser where username=@username and pwd=@pwd";
			SqlParameter[] sp ={new SqlParameter("@username",username),
			new SqlParameter("@pwd",pwd)};
			return SqlHelper.ExecuteScalar(CommandType.Text, sql, sp);
		}
	}
}
