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
	public partial class UnitInfoDAL
	{
        public static object Insert(UnitInfo unitInfo)
		{
				string sql ="INSERT INTO UnitInfo (unitId, unitName, unitLevel, superiorUnits, postalCode, address, rmbOpenUnit, rankAccount, wOpenUnit, wbankAccount, faxNumber, unitEmaill, person, pPhone, bankOfDeposit, remark1, remark2, remark3, remark4, remark5, remark6, remark7)  output inserted.id VALUES (@unitId, @unitName, @unitLevel, @superiorUnits, @postalCode, @address, @rmbOpenUnit, @rankAccount, @wOpenUnit, @wbankAccount, @faxNumber, @unitEmaill, @person, @pPhone, @bankOfDeposit, @remark1, @remark2, @remark3, @remark4, @remark5, @remark6, @remark7)";
				SqlParameter[] para = new SqlParameter[]
					{
						new SqlParameter("@unitId", ToDBValue(unitInfo.unitId)),
						new SqlParameter("@unitName", ToDBValue(unitInfo.unitName)),
						new SqlParameter("@unitLevel", ToDBValue(unitInfo.unitLevel)),
						new SqlParameter("@superiorUnits", ToDBValue(unitInfo.superiorUnits)),
						new SqlParameter("@postalCode", ToDBValue(unitInfo.postalCode)),
						new SqlParameter("@address", ToDBValue(unitInfo.address)),
						new SqlParameter("@rmbOpenUnit", ToDBValue(unitInfo.rmbOpenUnit)),
						new SqlParameter("@rankAccount", ToDBValue(unitInfo.rankAccount)),
						new SqlParameter("@wOpenUnit", ToDBValue(unitInfo.wOpenUnit)),
						new SqlParameter("@wbankAccount", ToDBValue(unitInfo.wbankAccount)),
						new SqlParameter("@faxNumber", ToDBValue(unitInfo.faxNumber)),
						new SqlParameter("@unitEmaill", ToDBValue(unitInfo.unitEmaill)),
						new SqlParameter("@person", ToDBValue(unitInfo.person)),
						new SqlParameter("@pPhone", ToDBValue(unitInfo.pPhone)),
						new SqlParameter("@bankOfDeposit", ToDBValue(unitInfo.bankOfDeposit)),
						new SqlParameter("@remark1", ToDBValue(unitInfo.remark1)),
						new SqlParameter("@remark2", ToDBValue(unitInfo.remark2)),
						new SqlParameter("@remark3", ToDBValue(unitInfo.remark3)),
						new SqlParameter("@remark4", ToDBValue(unitInfo.remark4)),
						new SqlParameter("@remark5", ToDBValue(unitInfo.remark5)),
						new SqlParameter("@remark6", ToDBValue(unitInfo.remark6)),
						new SqlParameter("@remark7", ToDBValue(unitInfo.remark7)),
					};
					
				return SqlHelper.ExecuteScalar(sql,CommandType.Text, para);
		}

        public static int DeleteById(int id)
		{
            string sql = "DELETE FROM UnitInfo WHERE Id = @Id";

           SqlParameter[] para = new SqlParameter[]
			{
				new SqlParameter("@id", id)
			};
		
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text,para);
		}
		
				
        public static int Update(UnitInfo unitInfo)
        {
            string sql =
                @"UPDATE UnitInfo SET  unitId = @unitId 
                , unitName = @unitName 
                , unitLevel = @unitLevel 
                , superiorUnits = @superiorUnits 
                , postalCode = @postalCode 
                , address = @address 
                , rmbOpenUnit = @rmbOpenUnit 
                , rankAccount = @rankAccount 
                , wOpenUnit = @wOpenUnit 
                , wbankAccount = @wbankAccount 
                , faxNumber = @faxNumber 
                , unitEmaill = @unitEmaill 
                , person = @person 
                , pPhone = @pPhone 
                , bankOfDeposit = @bankOfDeposit 
                , remark1 = @remark1 
                , remark2 = @remark2 
                , remark3 = @remark3 
                , remark4 = @remark4 
                , remark5 = @remark5 
                , remark6 = @remark6 
                , remark7 = @remark7 
                 WHERE id = @id";

			SqlParameter[] para = new SqlParameter[]
			{
				new SqlParameter("@id", unitInfo.id)
					,new SqlParameter("@unitId", ToDBValue(unitInfo.unitId))
					,new SqlParameter("@unitName", ToDBValue(unitInfo.unitName))
					,new SqlParameter("@unitLevel", ToDBValue(unitInfo.unitLevel))
					,new SqlParameter("@superiorUnits", ToDBValue(unitInfo.superiorUnits))
					,new SqlParameter("@postalCode", ToDBValue(unitInfo.postalCode))
					,new SqlParameter("@address", ToDBValue(unitInfo.address))
					,new SqlParameter("@rmbOpenUnit", ToDBValue(unitInfo.rmbOpenUnit))
					,new SqlParameter("@rankAccount", ToDBValue(unitInfo.rankAccount))
					,new SqlParameter("@wOpenUnit", ToDBValue(unitInfo.wOpenUnit))
					,new SqlParameter("@wbankAccount", ToDBValue(unitInfo.wbankAccount))
					,new SqlParameter("@faxNumber", ToDBValue(unitInfo.faxNumber))
					,new SqlParameter("@unitEmaill", ToDBValue(unitInfo.unitEmaill))
					,new SqlParameter("@person", ToDBValue(unitInfo.person))
					,new SqlParameter("@pPhone", ToDBValue(unitInfo.pPhone))
					,new SqlParameter("@bankOfDeposit", ToDBValue(unitInfo.bankOfDeposit))
					,new SqlParameter("@remark1", ToDBValue(unitInfo.remark1))
					,new SqlParameter("@remark2", ToDBValue(unitInfo.remark2))
					,new SqlParameter("@remark3", ToDBValue(unitInfo.remark3))
					,new SqlParameter("@remark4", ToDBValue(unitInfo.remark4))
					,new SqlParameter("@remark5", ToDBValue(unitInfo.remark5))
					,new SqlParameter("@remark6", ToDBValue(unitInfo.remark6))
					,new SqlParameter("@remark7", ToDBValue(unitInfo.remark7))
			};
			return SqlHelper.ExecuteNonQuery(sql, CommandType.Text,para);
        }		
		
        public static UnitInfo GetById(int id)
        {
            string sql = "SELECT * FROM UnitInfo WHERE Id = @Id";
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
		
		public static UnitInfo ToModel(SqlDataReader reader)
		{
			UnitInfo unitInfo = new UnitInfo();

			unitInfo.id = (int)ToModelValue(reader,"id");
			unitInfo.unitId = (string)ToModelValue(reader,"unitId");
			unitInfo.unitName = (string)ToModelValue(reader,"unitName");
			unitInfo.unitLevel = (string)ToModelValue(reader,"unitLevel");
			unitInfo.superiorUnits = (string)ToModelValue(reader,"superiorUnits");
			unitInfo.postalCode = (string)ToModelValue(reader,"postalCode");
			unitInfo.address = (string)ToModelValue(reader,"address");
			unitInfo.rmbOpenUnit = (string)ToModelValue(reader,"rmbOpenUnit");
			unitInfo.rankAccount = (string)ToModelValue(reader,"rankAccount");
			unitInfo.wOpenUnit = (string)ToModelValue(reader,"wOpenUnit");
			unitInfo.wbankAccount = (string)ToModelValue(reader,"wbankAccount");
			unitInfo.faxNumber = (string)ToModelValue(reader,"faxNumber");
			unitInfo.unitEmaill = (string)ToModelValue(reader,"unitEmaill");
			unitInfo.person = (string)ToModelValue(reader,"person");
			unitInfo.pPhone = (string)ToModelValue(reader,"pPhone");
			unitInfo.bankOfDeposit = (string)ToModelValue(reader,"bankOfDeposit");
			unitInfo.remark1 = (string)ToModelValue(reader,"remark1");
			unitInfo.remark2 = (string)ToModelValue(reader,"remark2");
			unitInfo.remark3 = (string)ToModelValue(reader,"remark3");
			unitInfo.remark4 = (string)ToModelValue(reader,"remark4");
			unitInfo.remark5 = (string)ToModelValue(reader,"remark5");
			unitInfo.remark6 = (string)ToModelValue(reader,"remark6");
			unitInfo.remark7 = (string)ToModelValue(reader,"remark7");
			return unitInfo;
		}
		
		public static int GetTotalCount()
		{
			string sql = "SELECT count(*) FROM UnitInfo";
			return (int)SqlHelper.ExecuteScalar(sql, CommandType.Text);
		}
		
		public static List<UnitInfo> GetPagedData(int startIndex,int endIndex)
		{
			string sql = "SELECT * from(SELECT *,row_number() over(order by id desc) rownum FROM UnitInfo ) t where rownum>=@startIndex and rownum<=@endIndex";
			using(SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text,
				new SqlParameter("@startIndex",startIndex),
				new SqlParameter("@endIndex",endIndex)))
			{
				return ToModels(reader);					
			}
		}
		
		public static List<UnitInfo> GetAll()
		{
			string sql = "SELECT * FROM UnitInfo";
			using(SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text))
			{
				return ToModels(reader);			
			}
		}
		
		protected static List<UnitInfo> ToModels(SqlDataReader reader)
		{
			var list = new List<UnitInfo>();
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
		//---------------------------------------下面开始新添加的------------
		public static object QueryIdAndName(string unitId,string name) {
			string sql = "select id from UNITINFO where unitName=@name or unitid=@unitId";
			SqlParameter[] sp = { new SqlParameter("@name",name),
			new SqlParameter("@unitId",unitId)};
			return SqlHelper.ExecuteScalar(CommandType.Text, sql, sp);
		}
		public static string GetMaxUnitId()
		{
			string sql = "select top(1)unitId from unitinfo order by id desc";
			using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text))
			{
				if (reader.Read())
				{
					return reader.GetString(0);
				}
				else
				{
					return null;
				}
			}
		}
		public static UnitInfo GetNameByUnitId(string unitId)
		{
			string sql = "SELECT * FROM UnitInfo WHERE unitId = @unitId";
			using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text, new SqlParameter("@unitId", unitId)))
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
