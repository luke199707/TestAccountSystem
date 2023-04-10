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
    public partial class RoleRightInfoDAL
    {
        public static object Insert(RoleRightInfo roleRightInfo)
        {
            string sql = "INSERT INTO RoleRightInfo (roleId, rightCode)  output inserted.id VALUES (@roleId, @rightCode)";
            SqlParameter[] para = new SqlParameter[]
                {
                        new SqlParameter("@roleId", ToDBValue(roleRightInfo.roleId)),
                        new SqlParameter("@rightCode", ToDBValue(roleRightInfo.rightCode)),
                };

            return SqlHelper.ExecuteScalar(sql, CommandType.Text, para);
        }

        public static int DeleteById(int id)
        {
            string sql = "DELETE FROM RoleRightInfo WHERE Id = @Id";

            SqlParameter[] para = new SqlParameter[]
             {
                new SqlParameter("@id", id)
             };

            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, para);
        }


        public static int Update(RoleRightInfo roleRightInfo)
        {
            string sql =
                @"UPDATE RoleRightInfo SET  roleId = @roleId 
                , rightCode = @rightCode 
                 WHERE id = @id";

            SqlParameter[] para = new SqlParameter[]
            {
                new SqlParameter("@id", roleRightInfo.id)
                    ,new SqlParameter("@roleId", ToDBValue(roleRightInfo.roleId))
                    ,new SqlParameter("@rightCode", ToDBValue(roleRightInfo.rightCode))
            };
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, para);
        }

        public static RoleRightInfo GetById(int id)
        {
            string sql = "SELECT * FROM RoleRightInfo WHERE Id = @Id";
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

        public static RoleRightInfo ToModel(SqlDataReader reader)
        {
            RoleRightInfo roleRightInfo = new RoleRightInfo();

            roleRightInfo.id = (int)ToModelValue(reader, "id");
            roleRightInfo.roleId = (int)ToModelValue(reader, "roleId");
            roleRightInfo.rightCode = (string)ToModelValue(reader, "rightCode");
            return roleRightInfo;
        }

        public static int GetTotalCount()
        {
            string sql = "SELECT count(*) FROM RoleRightInfo";
            return (int)SqlHelper.ExecuteScalar(sql, CommandType.Text);
        }

        public static List<RoleRightInfo> GetPagedData(int startIndex, int endIndex)
        {
            string sql = "SELECT * from(SELECT *,row_number() over(order by id desc) rownum FROM RoleRightInfo ) t where rownum>=@startIndex and rownum<=@endIndex";
            using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text,
                new SqlParameter("@startIndex", startIndex),
                new SqlParameter("@endIndex", endIndex)))
            {
                return ToModels(reader);
            }
        }

        public static List<RoleRightInfo> GetAll()
        {
            string sql = "SELECT * FROM RoleRightInfo";
            using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text))
            {
                return ToModels(reader);
            }
        }

        protected static List<RoleRightInfo> ToModels(SqlDataReader reader)
        {
            var list = new List<RoleRightInfo>();
            while (reader.Read())
            {
                list.Add(ToModel(reader));
            }
            return list;
        }

        protected static object ToDBValue(object value)
        {
            if (value == null)
            {
                return DBNull.Value;
            }
            else
            {
                return value;
            }
        }

        protected static object ToModelValue(SqlDataReader reader, string columnName)
        {
            if (reader.IsDBNull(reader.GetOrdinal(columnName)))
            {
                return null;
            }
            else
            {
                return reader[columnName];
            }
        }

        //-------------------------------------------------添加的-------------------------------
        public static List<RoleRightInfo> GetByRoleId(int roleid)
        {
            string sql = "SELECT * FROM RoleRightInfo where roleId=@roleId";
            using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text, new SqlParameter("@roleId", roleid)))
            {
                return ToModels(reader);
            }
        }



        public static List<RoleRightInfo> GetChildNode(string currentId, string roleid)
        {
            string str = "0" + currentId + "0%";
            string sql = "select * from RoleRightInfo where rightCode like @rightCode and roleId=@role order by rightcode asc";
            SqlParameter[] sp = { new SqlParameter("@rightCode", str), new SqlParameter("@role", Convert.ToInt32(roleid)) };
            using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text, sp))
            {
                return ToModels(reader);
            }
        }

        //--------------------------------------------添加的-------
        public static int DeleteByRoleId(int roleId)
        {
            string sql = "delete from RoleRightInfo where roleId=@roleId";
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, new SqlParameter("@roleId", roleId));
            //throw new NotImplementedException();
        }
        public static int DeleteByRightCode(string code)
        {
            string rightCode;
            if (code.Length == 2)
            {
                rightCode = "0" + code + "%";
            }
            else
            {
                rightCode = code;
            }
            string sql = "delete from RoleRightInfo where rightCode like @code";
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, new SqlParameter("@code", rightCode));
            //throw new NotImplementedException();
        }
    }
}
