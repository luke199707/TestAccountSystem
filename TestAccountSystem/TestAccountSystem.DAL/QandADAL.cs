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
	public partial class QandADAL
	{
        public static object Insert(QandA qandA)
		{
				string sql ="INSERT INTO QandA (question, answer, remark1, remark2, remark3)  output inserted.id VALUES (@question, @answer, @remark1, @remark2, @remark3)";
				SqlParameter[] para = new SqlParameter[]
					{
						new SqlParameter("@question", ToDBValue(qandA.question)),
						new SqlParameter("@answer", ToDBValue(qandA.answer)),
						new SqlParameter("@remark1", ToDBValue(qandA.remark1)),
						new SqlParameter("@remark2", ToDBValue(qandA.remark2)),
						new SqlParameter("@remark3", ToDBValue(qandA.remark3)),
					};
					
				return SqlHelper.ExecuteScalar(sql,CommandType.Text, para);
		}

        public static int DeleteById(int id)
		{
            string sql = "DELETE FROM QandA WHERE Id = @Id";

           SqlParameter[] para = new SqlParameter[]
			{
				new SqlParameter("@id", id)
			};
		
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text,para);
		}
		
				
        public static int Update(QandA qandA)
        {
            string sql =
                @"UPDATE QandA SET  question = @question 
                , answer = @answer 
                , remark1 = @remark1 
                , remark2 = @remark2 
                , remark3 = @remark3 
                 WHERE id = @id";

			SqlParameter[] para = new SqlParameter[]
			{
				new SqlParameter("@id", qandA.id)
					,new SqlParameter("@question", ToDBValue(qandA.question))
					,new SqlParameter("@answer", ToDBValue(qandA.answer))
					,new SqlParameter("@remark1", ToDBValue(qandA.remark1))
					,new SqlParameter("@remark2", ToDBValue(qandA.remark2))
					,new SqlParameter("@remark3", ToDBValue(qandA.remark3))
			};
			return SqlHelper.ExecuteNonQuery(sql, CommandType.Text,para);
        }		
		
        public static QandA GetById(int id)
        {
            string sql = "SELECT * FROM QandA WHERE Id = @Id";
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
		
		public static QandA ToModel(SqlDataReader reader)
		{
			QandA qandA = new QandA();

			qandA.id = (int)ToModelValue(reader,"id");
			qandA.question = (string)ToModelValue(reader,"question");
			qandA.answer = (string)ToModelValue(reader,"answer");
			qandA.remark1 = (string)ToModelValue(reader,"remark1");
			qandA.remark2 = (string)ToModelValue(reader,"remark2");
			qandA.remark3 = (string)ToModelValue(reader,"remark3");
			return qandA;
		}
		
		public static int GetTotalCount()
		{
			string sql = "SELECT count(*) FROM QandA";
			return (int)SqlHelper.ExecuteScalar(sql, CommandType.Text);
		}
		
		public static List<QandA> GetPagedData(int startIndex,int endIndex)
		{
			string sql = "SELECT * from(SELECT *,row_number() over(order by id desc) rownum FROM QandA ) t where rownum>=@startIndex and rownum<=@endIndex";
			using(SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text,
				new SqlParameter("@startIndex",startIndex),
				new SqlParameter("@endIndex",endIndex)))
			{
				return ToModels(reader);					
			}
		}
		
		public static List<QandA> GetAll()
		{
			string sql = "SELECT * FROM QandA";
			using(SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text))
			{
				return ToModels(reader);			
			}
		}
		
		protected static List<QandA> ToModels(SqlDataReader reader)
		{
			var list = new List<QandA>();
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
	}
}
