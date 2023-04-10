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
    public partial class DepartmentDAL
    {
        public static object Insert(Department department)
        {
            string sql = "INSERT INTO Department (dId, unitId, dName, remark1, remark2)  output inserted.id VALUES (@dId, @unitId, @dName, @remark1, @remark2)";
            SqlParameter[] para = new SqlParameter[]
                {
                        new SqlParameter("@dId", ToDBValue(department.dId)),
                        new SqlParameter("@unitId", ToDBValue(department.unitId)),
                        new SqlParameter("@dName", ToDBValue(department.dName)),
                        new SqlParameter("@remark1", ToDBValue(department.remark1)),
                        new SqlParameter("@remark2", ToDBValue(department.remark2)),
                };

            return SqlHelper.ExecuteScalar(sql, CommandType.Text, para);
        }

        public static int DeleteById(int id)
        {
            string sql = "DELETE FROM Department WHERE Id = @Id";

            SqlParameter[] para = new SqlParameter[]
             {
                new SqlParameter("@id", id)
             };

            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, para);
        }


        public static int Update(Department department)
        {
            string sql =
                @"UPDATE Department SET  dId = @dId 
                , unitId = @unitId 
                , dName = @dName 
                , remark1 = @remark1 
                , remark2 = @remark2 
                 WHERE id = @id";

            SqlParameter[] para = new SqlParameter[]
            {
                new SqlParameter("@id", department.id)
                    ,new SqlParameter("@dId", ToDBValue(department.dId))
                    ,new SqlParameter("@unitId", ToDBValue(department.unitId))
                    ,new SqlParameter("@dName", ToDBValue(department.dName))
                    ,new SqlParameter("@remark1", ToDBValue(department.remark1))
                    ,new SqlParameter("@remark2", ToDBValue(department.remark2))
            };
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, para);
        }

        public static Department GetById(int id)
        {
            string sql = "SELECT * FROM Department WHERE Id = @Id";
            using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text, new SqlParameter("@Id", id)))
            {
                if (reader.Read())
                {
                    return ToModel1(reader);
                }
                else
                {
                    return null;
                }
            }
        }

        public static Department ToModel(SqlDataReader reader)
        {
            Department department = new Department();

            department.id = (int)ToModelValue(reader, "id");
            department.dId = (string)ToModelValue(reader, "dId");
            department.unitId = (string)ToModelValue(reader, "unitId");
            department.dName = (string)ToModelValue(reader, "dName");
            department.remark1 = (string)ToModelValue(reader, "remark1");
            department.remark2 = (string)ToModelValue(reader, "remark2");

            //-----------------
            department.unitName = (string)ToModelValue(reader, "unitName");
            return department;
        }

        public static int GetTotalCount()
        {
            string sql = "SELECT count(*) FROM Department";
            return (int)SqlHelper.ExecuteScalar(sql, CommandType.Text);
        }

        public static List<Department> GetPagedData(int startIndex, int endIndex)
        {
            string sql = "SELECT * from(SELECT *,row_number() over(order by id desc) rownum FROM Department ) t where rownum>=@startIndex and rownum<=@endIndex";
            using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text,
                new SqlParameter("@startIndex", startIndex),
                new SqlParameter("@endIndex", endIndex)))
            {
                return ToModels(reader);
            }
        }

        public static List<Department> GetAll()
        {
            string sql = "SELECT * FROM Department";
            using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text))
            {
                return ToModels(reader);
            }
        }

        protected static List<Department> ToModels(SqlDataReader reader)
        {
            var list = new List<Department>();
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
        //---------------------------------tianjia de --------
        public static Department GetById1(int id)
        {
            string sql = "select d.*,u.unitName from Department d inner join UnitInfo u on d.unitId=u.unitId where d.id=@Id";
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
        public static object QueryByIdAndName(string did, string name)
        {
            string sql = "select id from Department where dId=@did ";
            //SqlParameter[] sp = { new SqlParameter("@did",did) };
            return SqlHelper.ExecuteScalar(CommandType.Text, sql, new SqlParameter("@did", did));
        }
        public static object QueryByIdAndName1(string unitid, string name)
        {
            string sql = "select id from Department where unitid=@unitid and dname=@name ";
            SqlParameter[] sp = { new SqlParameter("@unitid", unitid), new SqlParameter("@name", name) };
            return SqlHelper.ExecuteScalar(CommandType.Text, sql, sp);
        }
        public static Department GetById2(int id)
        {
            string sql = "SELECT * FROM Department WHERE Id = @Id";
            using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text, new SqlParameter("@Id", id)))
            {
                if (reader.Read())
                {
                    return ToModel1(reader);
                }
                else
                {
                    return null;
                }
            }
        }
        public static Department ToModel1(SqlDataReader reader)
        {
            Department department = new Department();

            department.id = (int)ToModelValue(reader, "id");
            department.dId = (string)ToModelValue(reader, "dId");
            department.unitId = (string)ToModelValue(reader, "unitId");
            department.dName = (string)ToModelValue(reader, "dName");
            department.remark1 = (string)ToModelValue(reader, "remark1");
            department.remark2 = (string)ToModelValue(reader, "remark2");
            return department;
        }

        //select top(1) id, dId, unitId, dName, remark1, remark2 from Department order by id desc
        public static Department GetMaxDid()
        {
            string sql = "select top(1) id, dId, unitId, dName, remark1, remark2 from Department order by id desc";
            using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text))
            {
                if (reader.Read())
                {
                    return ToModel1(reader);
                }
                else
                {
                    return null;
                }
            }
        }
    }
}
