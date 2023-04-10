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
	public partial class DictInfoDAL
	{
        public static object Insert(DictInfo dictInfo)
		{
				string sql = "INSERT INTO DictInfo (parentId, name, code, remark1, remark2)  output inserted.id VALUES (@parentId, @name, @code, @remark1, @remark2)";//select ident_current('DictInfo')
			SqlParameter[] para = new SqlParameter[]
					{
						new SqlParameter("@parentId", ToDBValue(dictInfo.parentId)),
						new SqlParameter("@name", ToDBValue(dictInfo.name)),
						new SqlParameter("@code", ToDBValue(dictInfo.code)),
						new SqlParameter("@remark1", ToDBValue(dictInfo.remark1)),
						new SqlParameter("@remark2", ToDBValue(dictInfo.remark2)),
					};
					
				return SqlHelper.ExecuteScalar(sql,CommandType.Text, para);
		}

        public static int DeleteById(int id)
		{
            string sql = "DELETE FROM DictInfo WHERE Id = @Id";

           SqlParameter[] para = new SqlParameter[]
			{
				new SqlParameter("@id", id)
			};
		
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text,para);
		}
		
				
        public static int Update(DictInfo dictInfo)
        {
            string sql =
                @"UPDATE DictInfo SET  parentId = @parentId 
                , name = @name 
                , code = @code 
                , remark1 = @remark1 
                , remark2 = @remark2 
                 WHERE id = @id";

			SqlParameter[] para = new SqlParameter[]
			{
				new SqlParameter("@id", dictInfo.id)
					,new SqlParameter("@parentId", ToDBValue(dictInfo.parentId))
					,new SqlParameter("@name", ToDBValue(dictInfo.name))
					,new SqlParameter("@code", ToDBValue(dictInfo.code))
					,new SqlParameter("@remark1", ToDBValue(dictInfo.remark1))
					,new SqlParameter("@remark2", ToDBValue(dictInfo.remark2))
			};
			return SqlHelper.ExecuteNonQuery(sql, CommandType.Text,para);
        }		
		
        public static DictInfo GetById(int id)
        {
            string sql = "SELECT * FROM DictInfo WHERE Id = @Id";
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
		
		public static DictInfo ToModel(SqlDataReader reader)
		{
			DictInfo dictInfo = new DictInfo();

			dictInfo.id = (int)ToModelValue(reader,"id");
			dictInfo.parentId = (string)ToModelValue(reader,"parentId");
			dictInfo.name = (string)ToModelValue(reader,"name");
			dictInfo.code = (string)ToModelValue(reader,"code");
			dictInfo.remark1 = (string)ToModelValue(reader,"remark1");
			dictInfo.remark2 = (string)ToModelValue(reader,"remark2");
			return dictInfo;
		}
		
		public static int GetTotalCount()
		{
			string sql = "SELECT count(*) FROM DictInfo";
			return (int)SqlHelper.ExecuteScalar(sql, CommandType.Text);
		}
		
		public static List<DictInfo> GetPagedData(int startIndex,int endIndex)
		{
			string sql = "SELECT * from(SELECT *,row_number() over(order by id desc) rownum FROM DictInfo ) t where rownum>=@startIndex and rownum<=@endIndex";
			using(SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text,
				new SqlParameter("@startIndex",startIndex),
				new SqlParameter("@endIndex",endIndex)))
			{
				return ToModels(reader);					
			}
		}
		
		public static List<DictInfo> GetAll()
		{
			string sql = "SELECT * FROM DictInfo";
			using(SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text))
			{
				return ToModels(reader);			
			}
		}
		
		protected static List<DictInfo> ToModels(SqlDataReader reader)
		{
			var list = new List<DictInfo>();
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
		////----------------------------添加--------------------------------
		public static List<DictInfo> GetListById(int id)
		{
			string sql = "SELECT * FROM DictInfo where id=@id";
			using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text,new SqlParameter("@id",id)))
			{
				return ToModels(reader);
			}
		}
		public static List<DictInfo> GetListByParentId(string parentId)
		{
			string sql = "SELECT * FROM DictInfo where parentId=@parentId";
			using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text, new SqlParameter("@parentId", parentId)))
			{
				return ToModels(reader);
			}
		}

		public static int DeleteByCode(string code)
		{
			string likecode = code + "%";
			string sql = "DELETE FROM DictInfo WHERE code like @code";
			return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, new SqlParameter("@code", likecode));
		}
		public static DictInfo GetByParentId(string parentId)
		{
			string sql = "SELECT top(1)* FROM DictInfo WHERE parentId = @parentId order by code desc";
			using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text, new SqlParameter("@parentId", parentId)))
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
		public static DictInfo GetByCode(string code)
		{
			string likecode = code + "%";
			string sql = "SELECT top(1)* FROM DictInfo where code like @code order by code desc";
			using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text, new SqlParameter("@code", likecode)))
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
		public static DictInfo GetByName(string name)
		{
			string sql = "SELECT * FROM DictInfo WHERE name = @name  and parentId='1'";
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

	}
}
