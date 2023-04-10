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
    public partial class CodeRegulationDAL
    {
        public static object Insert(CodeRegulation1 codeRegulation)
        {
            string sql = "INSERT INTO codeRegulation (name, prefix, connector1, timeType, connector2, digistNum, startSerial, example, remark1, remark2)  output inserted.id VALUES (@name, @prefix, @connector1, @timeType, @connector2, @digistNum, @startSerial, @example, @remark1, @remark2)";
            SqlParameter[] para = new SqlParameter[]
                {
                        new SqlParameter("@name", ToDBValue(codeRegulation.name)),
                        new SqlParameter("@prefix", ToDBValue(codeRegulation.prefix)),
                        new SqlParameter("@connector1", ToDBValue(codeRegulation.connector1)),
                        new SqlParameter("@timeType", ToDBValue(codeRegulation.timeType)),
                        new SqlParameter("@connector2", ToDBValue(codeRegulation.connector2)),
                        new SqlParameter("@digistNum", ToDBValue(codeRegulation.digistNum)),
                        new SqlParameter("@startSerial", ToDBValue(codeRegulation.startSerial)),
                        new SqlParameter("@example", ToDBValue(codeRegulation.example)),
                        new SqlParameter("@remark1", ToDBValue(codeRegulation.remark1)),
                        new SqlParameter("@remark2", ToDBValue(codeRegulation.remark2)),
                };

            return SqlHelper.ExecuteScalar(sql, CommandType.Text, para);
        }

        public static int DeleteById(int id)
        {
            string sql = "DELETE FROM codeRegulation WHERE Id = @Id";

            SqlParameter[] para = new SqlParameter[]
             {
                new SqlParameter("@id", id)
             };

            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, para);
        }


        public static int Update(CodeRegulation1 codeRegulation)
        {
            string sql =
                @"UPDATE codeRegulation SET  name = @name 
                , prefix = @prefix 
                , connector1 = @connector1 
                , timeType = @timeType 
                , connector2 = @connector2 
                , digistNum = @digistNum 
                , startSerial = @startSerial 
                , example = @example 
                , remark1 = @remark1 
                , remark2 = @remark2 
                 WHERE id = @id";

            SqlParameter[] para = new SqlParameter[]
            {
                new SqlParameter("@id", codeRegulation.id)
                    ,new SqlParameter("@name", ToDBValue(codeRegulation.name))
                    ,new SqlParameter("@prefix", ToDBValue(codeRegulation.prefix))
                    ,new SqlParameter("@connector1", ToDBValue(codeRegulation.connector1))
                    ,new SqlParameter("@timeType", ToDBValue(codeRegulation.timeType))
                    ,new SqlParameter("@connector2", ToDBValue(codeRegulation.connector2))
                    ,new SqlParameter("@digistNum", ToDBValue(codeRegulation.digistNum))
                    ,new SqlParameter("@startSerial", ToDBValue(codeRegulation.startSerial))
                    ,new SqlParameter("@example", ToDBValue(codeRegulation.example))
                    ,new SqlParameter("@remark1", ToDBValue(codeRegulation.remark1))
                    ,new SqlParameter("@remark2", ToDBValue(codeRegulation.remark2))
            };
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, para);
        }

        public static CodeRegulation1 GetById(int id)
        {
            string sql = "SELECT * FROM codeRegulation WHERE Id = @Id";
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

        public static CodeRegulation1 ToModel(SqlDataReader reader)
        {
            CodeRegulation1 codeRegulation = new CodeRegulation1();

            codeRegulation.id = (int)ToModelValue(reader, "id");
            codeRegulation.name = (string)ToModelValue(reader, "name");
            codeRegulation.prefix = (string)ToModelValue(reader, "prefix");
            codeRegulation.connector1 = (string)ToModelValue(reader, "connector1");
            codeRegulation.timeType = (string)ToModelValue(reader, "timeType");
            codeRegulation.connector2 = (string)ToModelValue(reader, "connector2");
            codeRegulation.digistNum = (int?)ToModelValue(reader, "digistNum");
            codeRegulation.startSerial = (string)ToModelValue(reader, "startSerial");
            codeRegulation.example = (string)ToModelValue(reader, "example");
            codeRegulation.remark1 = (string)ToModelValue(reader, "remark1");
            codeRegulation.remark2 = (string)ToModelValue(reader, "remark2");
            return codeRegulation;
        }

        public static int GetTotalCount()
        {
            string sql = "SELECT count(*) FROM codeRegulation";
            return (int)SqlHelper.ExecuteScalar(sql, CommandType.Text);
        }

        public static List<CodeRegulation1> GetPagedData(int startIndex, int endIndex)
        {
            string sql = "SELECT * from(SELECT *,row_number() over(order by id desc) rownum FROM codeRegulation ) t where rownum>=@startIndex and rownum<=@endIndex";
            using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text,
                new SqlParameter("@startIndex", startIndex),
                new SqlParameter("@endIndex", endIndex)))
            {
                return ToModels(reader);
            }
        }

        public static List<CodeRegulation1> GetAll()
        {
            string sql = "SELECT * FROM codeRegulation";
            using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text))
            {
                return ToModels(reader);
            }
        }

        protected static List<CodeRegulation1> ToModels(SqlDataReader reader)
        {
            var list = new List<CodeRegulation1>();
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
        //--------------------------------添加---------------------------
        //根据规则名称获取对应的编码规则
        public static CodeRegulation1 GetByName(string name)
        {
            string sql = "SELECT id, name, prefix, connector1, timeType, connector2, digistNum, startSerial, example, remark1, remark2 FROM codeRegulation WHERE name = @name";
            using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text, new SqlParameter("@name", name)))
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
        //name传的是规则名,currentMaxID是一个表中当前最大的编码
        public static string GetCode(string name, string currentMaxID)
        {
            CodeRegulation1 cmodel = GetByName(name);
            StringBuilder sb = new StringBuilder();
            sb.Append(cmodel.prefix);
            sb.Append(cmodel.connector1);
            sb.Append(DateTime.Now.ToString(cmodel.timeType));
            sb.Append(cmodel.connector2);
            //  int index = ;
            int newid = int.Parse(currentMaxID.Substring(currentMaxID.Length - (int)cmodel.digistNum)) + 1;
            string maxid = newid.ToString();
            for (int i = maxid.Length; i < cmodel.digistNum; i++)
            {
                maxid = "0" + maxid;
            }
            sb.Append(maxid);
            return sb.ToString();
        }
        public static string GetCodeReduce(string name, string currentMaxID)
        {
            CodeRegulation1 cmodel = GetByName(name);
            StringBuilder sb = new StringBuilder();
            sb.Append(cmodel.prefix);
            sb.Append(cmodel.connector1);
            sb.Append(DateTime.Now.ToString(cmodel.timeType));
            sb.Append(cmodel.connector2);
            //  int index = ;
            int newid = int.Parse(currentMaxID.Substring(currentMaxID.Length - (int)cmodel.digistNum)) - 1;
            string maxid = newid.ToString();
            for (int i = maxid.Length; i < cmodel.digistNum; i++)
            {
                maxid = "0" + maxid;
            }
            sb.Append(maxid);
            return sb.ToString();
        }

    }
}
