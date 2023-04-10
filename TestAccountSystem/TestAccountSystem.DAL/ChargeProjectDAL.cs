//============================================================
// author:yangyiliang
//============================================================

using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TestAccountSystem.Model;

namespace TestAccountSystem.DAL
{
    public partial class ChargeProjectDAL
    {
        public static object Insert(ChargeProject chargeProject)
        {
            string sql = "INSERT INTO ChargeProject (BusinessNumber, BusinessName, RegisterNumber, ProjectNumber, ProjectName, BillingUnit, BillingPrice, Quantity, Remark)  output inserted.ID VALUES (@BusinessNumber, @BusinessName, @RegisterNumber, @ProjectNumber, @ProjectName, @BillingUnit, @BillingPrice, @Quantity, @Remark)";
            SqlParameter[] para = new SqlParameter[]
                {
                        new SqlParameter("@BusinessNumber", ToDBValue(chargeProject.BusinessNumber)),
                        new SqlParameter("@BusinessName", ToDBValue(chargeProject.BusinessName)),
                        new SqlParameter("@RegisterNumber", ToDBValue(chargeProject.RegisterNumber)),
                        new SqlParameter("@ProjectNumber", ToDBValue(chargeProject.ProjectNumber)),
                        new SqlParameter("@ProjectName", ToDBValue(chargeProject.ProjectName)),
                        new SqlParameter("@BillingUnit", ToDBValue(chargeProject.BillingUnit)),
                        new SqlParameter("@BillingPrice", ToDBValue(chargeProject.BillingPrice)),
                        new SqlParameter("@Quantity", ToDBValue(chargeProject.Quantity)),
                        new SqlParameter("@Remark", ToDBValue(chargeProject.Remark)),
                };

            return SqlHelper.ExecuteScalar(sql, CommandType.Text, para);
        }

        public static int DeleteByID(int iD)
        {
            string sql = "DELETE FROM ChargeProject WHERE ID = @ID";

            SqlParameter[] para = new SqlParameter[]
             {
                new SqlParameter("@ID", iD)
             };

            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, para);
        }
        public static int DeleteByRegisterNumber(string RegisterNumber)
        {
            string sql = "DELETE FROM ChargeProject WHERE RegisterNumber = @RegisterNumber";

            SqlParameter[] para = new SqlParameter[]
             {
                new SqlParameter("@RegisterNumber", RegisterNumber)
             };

            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, para);
        }


        public static int Update(ChargeProject chargeProject)
        {
            string sql =
                @"UPDATE ChargeProject SET  BusinessNumber = @BusinessNumber 
                , BusinessName = @BusinessName 
                , RegisterNumber = @RegisterNumber 
                , ProjectNumber = @ProjectNumber 
                , ProjectName = @ProjectName 
                , BillingUnit = @BillingUnit 
                , BillingPrice = @BillingPrice 
                , Quantity = @Quantity 
                , Remark = @Remark 
                 WHERE ID = @ID";

            SqlParameter[] para = new SqlParameter[]
            {
                new SqlParameter("@ID", chargeProject.ID)
                    ,new SqlParameter("@BusinessNumber", ToDBValue(chargeProject.BusinessNumber))
                    ,new SqlParameter("@BusinessName", ToDBValue(chargeProject.BusinessName))
                    ,new SqlParameter("@RegisterNumber", ToDBValue(chargeProject.RegisterNumber))
                    ,new SqlParameter("@ProjectNumber", ToDBValue(chargeProject.ProjectNumber))
                    ,new SqlParameter("@ProjectName", ToDBValue(chargeProject.ProjectName))
                    ,new SqlParameter("@BillingUnit", ToDBValue(chargeProject.BillingUnit))
                    ,new SqlParameter("@BillingPrice", ToDBValue(chargeProject.BillingPrice))
                    ,new SqlParameter("@Quantity", ToDBValue(chargeProject.Quantity))
                    ,new SqlParameter("@Remark", ToDBValue(chargeProject.Remark))
            };
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, para);
        }

        public static ChargeProject GetByID(int iD)
        {
            string sql = "SELECT * FROM ChargeProject WHERE ID = @ID";
            using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text, new SqlParameter("@ID", iD)))
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

        public static ChargeProject ToModel(SqlDataReader reader)
        {
            ChargeProject chargeProject = new ChargeProject();

            chargeProject.ID = (int)ToModelValue(reader, "ID");
            chargeProject.BusinessNumber = (string)ToModelValue(reader, "BusinessNumber");
            chargeProject.BusinessName = (string)ToModelValue(reader, "BusinessName");
            chargeProject.RegisterNumber = (string)ToModelValue(reader, "RegisterNumber");
            chargeProject.ProjectNumber = (string)ToModelValue(reader, "ProjectNumber");
            chargeProject.ProjectName = (string)ToModelValue(reader, "ProjectName");
            chargeProject.BillingUnit = (string)ToModelValue(reader, "BillingUnit");
            chargeProject.BillingPrice = (decimal)ToModelValue(reader, "BillingPrice");
            chargeProject.Quantity = (int)ToModelValue(reader, "Quantity");
            chargeProject.Remark = (string)ToModelValue(reader, "Remark");
            return chargeProject;
        }

        public static int GetTotalCount()
        {
            string sql = "SELECT count(*) FROM ChargeProject";
            return (int)SqlHelper.ExecuteScalar(sql, CommandType.Text);
        }

        public static List<ChargeProject> GetPagedData(int startIndex, int endIndex)
        {
            string sql = "SELECT * from(SELECT *,row_number() over(order by ID desc) rownum FROM ChargeProject ) t where rownum>=@startIndex and rownum<=@endIndex";
            using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text,
                new SqlParameter("@startIndex", startIndex),
                new SqlParameter("@endIndex", endIndex)))
            {
                return ToModels(reader);
            }
        }

        public static List<ChargeProject> GetAll()
        {
            string sql = "SELECT * FROM ChargeProject";
            using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text))
            {
                return ToModels(reader);
            }
        }

        protected static List<ChargeProject> ToModels(SqlDataReader reader)
        {
            var list = new List<ChargeProject>();
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
        //不同角色能够打印的项目明细个数是不同的
        public static List<string> GetList(string Surveyor)
        {
            List<string> list = new List<string>();
            string sql = "select c.RegisterNumber from ChargeProject  c inner join InspectionRegistration i on c.RegisterNumber=i.RegisterNumber where i.Surveyor=@Surveyor";
            using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text, new SqlParameter("@Surveyor", Surveyor)))
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        list.Add(reader.GetString(0));
                    }
                }
            }
            return list;
        }

        public static List<ChargeProject> GetByRegisterNumber(string registerNum)
        {
            string sql = "SELECT * FROM ChargeProject WHERE RegisterNumber = @registerNum";
            using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text, new SqlParameter("@registerNum", registerNum)))
            {
                if (reader.HasRows)
                {
                    return ToModels(reader);
                }
                else
                {
                    return null;
                }
            }
        }

    }
}
