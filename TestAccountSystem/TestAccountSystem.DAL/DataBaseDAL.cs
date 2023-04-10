using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace TestAccountSystem.DAL
{
   public class DataBaseDAL
    {
       public static int BackUp(string savePath)
       {
           string sql = string.Format("backup database TestAccountSystem to disk='{0}' with init", savePath);
           return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, null);
       }

        //因为多帐套的原因，所以备份数据库的时候需要传递数据库的名称
        //public static int BackUp(string dbName, string savePath)
        //{
        //    string sql = string.Format("backup database {0} to disk='{1}' with init", dbName, savePath);
        //    return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, null);
        //}

        public static int Restore(string dbName, string filePath)
        {
            string sql = string.Format("Alter database {0} Set Offline With rollback immediate; ", dbName);
            sql += string.Format("restore database {0} from disk='{1}' With Replace;", dbName, filePath);
            sql += string.Format("Alter database {0} Set Online With Rollback immediate;", dbName);
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, null);
        }
    }
}
