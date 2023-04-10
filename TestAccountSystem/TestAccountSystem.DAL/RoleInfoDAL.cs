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
	public partial class RoleInfoDAL
	{
        public static object Insert(RoleInfo roleInfo)
		{
				string sql ="INSERT INTO RoleInfo (roleId, roleName)  output inserted.id VALUES (@roleId, @roleName)";
				SqlParameter[] para = new SqlParameter[]
					{
						new SqlParameter("@roleId", ToDBValue(roleInfo.roleId)),
						new SqlParameter("@roleName", ToDBValue(roleInfo.roleName)),
					};
					
				return SqlHelper.ExecuteScalar(sql,CommandType.Text, para);
		}

        public static int DeleteById(int id)
		{
            string sql = "DELETE FROM RoleInfo WHERE Id = @Id";

           SqlParameter[] para = new SqlParameter[]
			{
				new SqlParameter("@id", id)
			};
		
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text,para);
		}
		
				
        public static int Update(RoleInfo roleInfo)
        {
            string sql =
                @"UPDATE RoleInfo SET  roleId = @roleId 
                , roleName = @roleName 
                 WHERE id = @id";

			SqlParameter[] para = new SqlParameter[]
			{
				new SqlParameter("@id", roleInfo.id)
					,new SqlParameter("@roleId", ToDBValue(roleInfo.roleId))
					,new SqlParameter("@roleName", ToDBValue(roleInfo.roleName))
			};
			return SqlHelper.ExecuteNonQuery(sql, CommandType.Text,para);
        }		
		
        public static RoleInfo GetById(int id)
        {
            string sql = "SELECT * FROM RoleInfo WHERE Id = @Id";
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
		
		public static RoleInfo ToModel(SqlDataReader reader)
		{
			RoleInfo roleInfo = new RoleInfo();

			roleInfo.id = (int)ToModelValue(reader,"id");
			roleInfo.roleId = (int)ToModelValue(reader,"roleId");
			roleInfo.roleName = (string)ToModelValue(reader,"roleName");
			return roleInfo;
		}
		
		public static int GetTotalCount()
		{
			string sql = "SELECT count(*) FROM RoleInfo";
			return (int)SqlHelper.ExecuteScalar(sql, CommandType.Text);
		}
		
		public static List<RoleInfo> GetPagedData(int startIndex,int endIndex)
		{
			string sql = "SELECT * from(SELECT *,row_number() over(order by id desc) rownum FROM RoleInfo ) t where rownum>=@startIndex and rownum<=@endIndex";
			using(SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text,
				new SqlParameter("@startIndex",startIndex),
				new SqlParameter("@endIndex",endIndex)))
			{
				return ToModels(reader);					
			}
		}
		
		public static List<RoleInfo> GetAll()
		{
			string sql = "SELECT * FROM RoleInfo";
			using(SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text))
			{
				return ToModels(reader);			
			}
		}
		
		protected static List<RoleInfo> ToModels(SqlDataReader reader)
		{
			var list = new List<RoleInfo>();
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

		//------------------------------下面添加的-------------------------
		public static object GetRoleId() {
			string sql = "select MAX(roleId) from RoleInfo";
			return SqlHelper.ExecuteScalar(sql, CommandType.Text);
		}
		public static RoleInfo GetByName(string name) {
			string sql = "select * from RoleInfo where roleName=@name";
            using (SqlDataReader reader=SqlHelper.ExecuteDataReader(sql,CommandType.Text,new SqlParameter("@name",name)))
            {
                if (reader.Read())
                {
					return ToModel(reader);
                }
				return null;
            }
		}
		public static RoleInfo GetByRoleId(int id)
		{
			string sql = "SELECT * FROM RoleInfo WHERE roleid = @Id";
			using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text, new SqlParameter("@Id", id)))
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
		//public static object GetByRoleName(string rolename) {
		//	string sql = "select roleid from RoleInfo where rolename=@rolename";
		//	return SqlHelper.ExecuteScalar(CommandType.Text, sql, new SqlParameter("@rolename", rolename));
		//}
	}
}
