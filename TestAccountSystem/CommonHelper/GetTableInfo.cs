using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using TestAccountSystem.DAL;

namespace CommonHelper
{
    public class GetTableInfo
    {
        /// <summary>
        /// 获取表字段名
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <returns>list集合，有多少个string类型的字段有多少数据</returns>
        public static List<string> GetByTableName(string tableName)
        {
            string sql = "select name from sys.columns where object_id=object_id(@tablename) and type_name(user_type_id) in ('varchar','nvarchar','nchar')";//改动，可能是SQL server版本不同造成
            //string sql = "SELECT [TABLE_NAME],[COLUMN_NAME],[DATA_TYPE] FROM [IntroductionLetter].[INFORMATION_SCHEMA].[COLUMNS] WHERE [TABLE_NAME] = @tableName AND [DATA_TYPE] IN ('varchar','nvarchar','text','nchar')";
            using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text, new SqlParameter("@tableName", tableName)))
            {
                var list = new List<string>();
                while (reader.Read())
                {
                    if (reader.IsDBNull(reader.GetOrdinal("name")))//改动，可能是SQL server版本不同造成
                    {
                        
                    }
                    else
                    {
                        list.Add((string)reader["name"]);//改动，可能是SQL server版本不同造成
                    }
                }
                return list;
            }
        }



    }
}
