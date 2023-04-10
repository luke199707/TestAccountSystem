//============================================================
// author:wangzhenkun
//============================================================

using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TestAccountSystem.Model;
using System.ComponentModel.Design;

namespace TestAccountSystem.DAL
{
    public partial class FunctionModelDAL
    {
        public static object Insert(FunctionModel functionModel)
        {
            string sql = "INSERT INTO FunctionModel (parentId, name, code, currentId, url, css, target, remark)  output inserted.id VALUES (@parentId, @name, @code, @currentId, @url, @css, @target, @remark)";
            SqlParameter[] para = new SqlParameter[]
                {
                        new SqlParameter("@parentId", ToDBValue(functionModel.parentId)),
                        new SqlParameter("@name", ToDBValue(functionModel.name)),
                        new SqlParameter("@code", ToDBValue(functionModel.code)),
                        new SqlParameter("@currentId", ToDBValue(functionModel.currentId)),
                        new SqlParameter("@url", ToDBValue(functionModel.url)),
                        new SqlParameter("@css", ToDBValue(functionModel.css)),
                        new SqlParameter("@target", ToDBValue(functionModel.target)),
                        new SqlParameter("@remark", ToDBValue(functionModel.remark)),
                };

            return SqlHelper.ExecuteScalar(sql, CommandType.Text, para);
        }

        public static int DeleteById(int id)
        {
            string sql = "DELETE FROM FunctionModel WHERE Id = @Id";

            SqlParameter[] para = new SqlParameter[]
             {
                new SqlParameter("@id", id)
             };

            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, para);
        }


        public static int Update(FunctionModel functionModel)
        {
            string sql =
                @"UPDATE FunctionModel SET  parentId = @parentId 
                , name = @name 
                , code = @code 
                , currentId = @currentId 
                , url = @url 
                , css = @css 
                , target = @target 
                , remark = @remark 
                 WHERE id = @id";

            SqlParameter[] para = new SqlParameter[]
            {
                new SqlParameter("@id", functionModel.id)
                    ,new SqlParameter("@parentId", ToDBValue(functionModel.parentId))
                    ,new SqlParameter("@name", ToDBValue(functionModel.name))
                    ,new SqlParameter("@code", ToDBValue(functionModel.code))
                    ,new SqlParameter("@currentId", ToDBValue(functionModel.currentId))
                    ,new SqlParameter("@url", ToDBValue(functionModel.url))
                    ,new SqlParameter("@css", ToDBValue(functionModel.css))
                    ,new SqlParameter("@target", ToDBValue(functionModel.target))
                    ,new SqlParameter("@remark", ToDBValue(functionModel.remark))
            };
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, para);
        }



        public static FunctionModel GetById(int id)
        {
            string sql = "SELECT * FROM FunctionModel WHERE Id = @Id";
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

        public static FunctionModel ToModel(SqlDataReader reader)
        {
            FunctionModel functionModel = new FunctionModel();

            functionModel.id = (int)ToModelValue(reader, "id");
            functionModel.parentId = (string)ToModelValue(reader, "parentId");
            functionModel.name = (string)ToModelValue(reader, "name");
            functionModel.code = (string)ToModelValue(reader, "code");
            functionModel.currentId = (string)ToModelValue(reader, "currentId");
            functionModel.url = (string)ToModelValue(reader, "url");
            functionModel.css = (string)ToModelValue(reader, "css");
            functionModel.target = (string)ToModelValue(reader, "target");
            functionModel.remark = (string)ToModelValue(reader, "remark");
            return functionModel;
        }

        public static int GetTotalCount()
        {
            string sql = "SELECT count(*) FROM FunctionModel";
            return (int)SqlHelper.ExecuteScalar(sql, CommandType.Text);
        }

        public static List<FunctionModel> GetPagedData(int startIndex, int endIndex)
        {
            string sql = "SELECT * from(SELECT *,row_number() over(order by id desc) rownum FROM FunctionModel ) t where rownum>=@startIndex and rownum<=@endIndex";
            using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text,
                new SqlParameter("@startIndex", startIndex),
                new SqlParameter("@endIndex", endIndex)))
            {
                return ToModels(reader);
            }
        }

        public static List<FunctionModel> GetAll()
        {
            string sql = "SELECT * FROM FunctionModel";
            using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text))
            {
                return ToModels(reader);
            }
        }

        protected static List<FunctionModel> ToModels(SqlDataReader reader)
        {
            var list = new List<FunctionModel>();
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





        //----------------------------------------从下面开始自己添加，不是生成的-------------------------------------
        /// <summary>
        /// 得到该用户的一级菜单
        /// </summary>
        /// <param name="id">用户id</param>
        /// <returns></returns>
        public static List<FunctionModel> GetFirstLevel(string userName)
        {
            //	string sql = "select f.* from Customer c inner join RoleRightInfo r on r.roleId=c.roleId inner join FunctionModel f on f.code = r.rightcode where c.userName=@username";
            string sql = "select f.* from AllUser c inner join RoleRightInfo r on r.roleId=c.roleId inner join FunctionModel f on f.code = r.rightcode where c.userName=@username";
            using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text, new SqlParameter("@username", userName)))
            {
                return ToModels(reader);
            }
        }

        /// <summary>
        /// 根据父节点标识，加载其下方的二级节点
        /// </summary>
        /// <param name="parentId">父节点标识</param>
        /// <returns></returns>
        public static List<FunctionModel> GetByParentID(string parentId)
        {
            string sql = "select * from FunctionModel where parentId=@parentId";
            using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text, new SqlParameter("@parentId", parentId)))
            {
                return ToModels(reader);
            }
        }

        public static FunctionModel GetByCurrentID(string currentId)
        {
            string sql = "select * from FunctionModel where currentId=@currentId";
            using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text, new SqlParameter("@currentId", currentId)))
            {
                if (reader.Read())
                {
                    return ToModel(reader);
                }
                return null;
            }
        }

        public static int DeleteByCurrentId(string currentId)
        {
            string sql = "DELETE FROM FunctionModel WHERE currentId = @currentId";

            SqlParameter[] para = new SqlParameter[]
             {
                new SqlParameter("@currentId", currentId)
             };

            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, para);
        }
        /// <summary>
        /// 用来更改功能模块数据，比如名称，url，css，target
        /// </summary>
        /// <returns></returns>
        public static int UpdateName(FunctionModel model) {
            string sql = "update FunctionModel set name=@name,url=@url,css=@css,target=@target where currentId=@currentId";
            SqlParameter[] sp = { new SqlParameter("@name",model.name),
            new SqlParameter("@url",model.url),
            new SqlParameter("@css",model.css),
            new SqlParameter("@target",model.target),
            new SqlParameter("@currentId",model.currentId)};
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, sp);
        }

        //public static List<FunctionModel> GetByParentID1(string parentId)
        //{
        //    string sql = "select * from FunctionModel where parentId=@parentId";
        //    using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text, new SqlParameter("@parentId", parentId)))
        //    {
        //        return ToModels(reader);
        //    }
        //}
        public static FunctionModel GetByCurrentID(string currentId,string roleid)
        {
            int roleId = Convert.ToInt32(roleid);
            string sql = "select * from FunctionModel where currentId=@currentId and roleId=@roleId";
            SqlParameter[] sp = { new SqlParameter("@currentId", currentId),new SqlParameter("@roleId",roleId) };
            using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text,sp))
            {
                if (reader.Read())
                {
                    return ToModel(reader);
                }
                return null;
            }
        }

        //获取该用户的附加权限的一级菜单
        public static List<FunctionModel> GetFuJiaFirstLevel(string userId)
        {
            //	string sql = "select f.* from Customer c inner join RoleRightInfo r on r.roleId=c.roleId inner join FunctionModel f on f.code = r.rightcode where c.userName=@username";
            string sql = "select f.* from UserRight u inner join FunctionModel f on u.code=f.code where u.userId=@userId";
            using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text, new SqlParameter("@userId", userId)))
            {
                return ToModels(reader);
            }
        }
    }
}
