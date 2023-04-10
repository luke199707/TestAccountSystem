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
    public partial class CustomerDAL
    {
        public static object Insert(Customer customer)
        {
            string sql = "INSERT INTO Customer (userName, pwd, email, customerNumber, address, companyName, openUnit, bankAccount, legalPerson, phone, state, isUseFul,roleId)  output inserted.id VALUES (@userName, @pwd, @email, @customerNumber, @address, @companyName, @openUnit, @bankAccount, @legalPerson, @phone, @state, @isUseFul,@roleId)";
            SqlParameter[] para = new SqlParameter[]
                {
                        new SqlParameter("@userName", ToDBValue(customer.userName)),
                        new SqlParameter("@pwd", ToDBValue(customer.pwd)),
                        new SqlParameter("@email", ToDBValue(customer.email)),
                        new SqlParameter("@customerNumber", ToDBValue(customer.customerNumber)),
                        new SqlParameter("@address", ToDBValue(customer.address)),
                        new SqlParameter("@companyName", ToDBValue(customer.companyName)),
                        new SqlParameter("@openUnit", ToDBValue(customer.openUnit)),
                        new SqlParameter("@bankAccount", ToDBValue(customer.bankAccount)),
                        new SqlParameter("@legalPerson", ToDBValue(customer.legalPerson)),
                        new SqlParameter("@phone", ToDBValue(customer.phone)),
                        new SqlParameter("@state", ToDBValue(customer.state)),
                        new SqlParameter("@isUseFul", ToDBValue(customer.isUseFul)),
                        new SqlParameter("@roleId",1)
                };

            return SqlHelper.ExecuteScalar(sql, CommandType.Text, para);
        }

        public static int DeleteById(int id)
        {
            string sql = "DELETE FROM Customer WHERE Id = @Id";

            SqlParameter[] para = new SqlParameter[]
             {
                new SqlParameter("@id", id)
             };

            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, para);
        }


        public static int Update(Customer customer)
        {
            string sql =
                @"UPDATE Customer SET  userName = @userName 
                , pwd = @pwd 
                , email = @email 
                , customerNumber = @customerNumber 
                , address = @address 
                , companyName = @companyName 
                , openUnit = @openUnit 
                , bankAccount = @bankAccount 
                , legalPerson = @legalPerson 
                , phone = @phone 
                , state = @state 
                , isUseFul = @isUseFul 
                 WHERE id = @id";

            SqlParameter[] para = new SqlParameter[]
            {
                new SqlParameter("@id", customer.id)
                    ,new SqlParameter("@userName", ToDBValue(customer.userName))
                    ,new SqlParameter("@pwd", ToDBValue(customer.pwd))
                    ,new SqlParameter("@email", ToDBValue(customer.email))
                    ,new SqlParameter("@customerNumber", ToDBValue(customer.customerNumber))
                    ,new SqlParameter("@address", ToDBValue(customer.address))
                    ,new SqlParameter("@companyName", ToDBValue(customer.companyName))
                    ,new SqlParameter("@openUnit", ToDBValue(customer.openUnit))
                    ,new SqlParameter("@bankAccount", ToDBValue(customer.bankAccount))
                    ,new SqlParameter("@legalPerson", ToDBValue(customer.legalPerson))
                    ,new SqlParameter("@phone", ToDBValue(customer.phone))
                    ,new SqlParameter("@state", ToDBValue(customer.state))
                    ,new SqlParameter("@isUseFul", ToDBValue(customer.isUseFul))
            };
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, para);
        }

        public static Customer GetById(int id)
        {
            string sql = "SELECT * FROM Customer WHERE Id = @Id";
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

        public static Customer ToModel(SqlDataReader reader)
        {
            Customer customer = new Customer();

            customer.id = (int)ToModelValue(reader, "id");
            customer.userName = (string)ToModelValue(reader, "userName");
            customer.pwd = (string)ToModelValue(reader, "pwd");
            customer.email = (string)ToModelValue(reader, "email");
            customer.customerNumber = (string)ToModelValue(reader, "customerNumber");
            customer.address = (string)ToModelValue(reader, "address");
            customer.companyName = (string)ToModelValue(reader, "companyName");
            customer.openUnit = (string)ToModelValue(reader, "openUnit");
            customer.bankAccount = (string)ToModelValue(reader, "bankAccount");
            customer.legalPerson = (string)ToModelValue(reader, "legalPerson");
            customer.phone = (string)ToModelValue(reader, "phone");
            customer.state = (bool)ToModelValue(reader, "state");
            customer.isUseFul = (bool)ToModelValue(reader, "isUseFul");

            //------------
            customer.roleId = (int)ToModelValue(reader, "roleId");
            //--------------
            return customer;
        }

        public static int GetTotalCount()
        {
            string sql = "SELECT count(*) FROM Customer";
            return (int)SqlHelper.ExecuteScalar(sql, CommandType.Text);
        }

        public static List<Customer> GetPagedData(int startIndex, int endIndex)
        {
            string sql = "SELECT * from(SELECT *,row_number() over(order by id desc) rownum FROM Customer ) t where rownum>=@startIndex and rownum<=@endIndex";
            using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text,
                new SqlParameter("@startIndex", startIndex),
                new SqlParameter("@endIndex", endIndex)))
            {
                return ToModels(reader);
            }
        }

        public static List<Customer> GetAll()
        {
            string sql = "SELECT * FROM Customer";
            using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text))
            {
                return ToModels(reader);
            }
        }

        protected static List<Customer> ToModels(SqlDataReader reader)
        {
            var list = new List<Customer>();
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

        ////--------------------------------------------------添加的下面，不是生成的------------------------------
        public static Customer GetByName(string username)
        {
            string sql = "select * from dbo.Customer where userName=@username";
            using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text, new SqlParameter("@username", username)))
            {
                if (reader.Read())
                {
                    return ToModel(reader);
                }
                return null;
            }
        }

        //根据账户和邮箱重置密码
        public static object GetByNameEmail(string email)
        {
            string sql = "select id from Customer where roleId=1  and email=@email";
            //SqlParameter[] sp = { new SqlParameter("@username",name),
            //new SqlParameter("@email",email)};
            //  return int.Parse(SqlHelper.ExecuteScalar(sql, CommandType.Text, sp) == null ? "-1" : SqlHelper.ExecuteScalar(sql, CommandType.Text, sp).ToString());
            return SqlHelper.ExecuteScalar(sql,CommandType.Text, new SqlParameter("@email", email));
        }

        //重置密码，更新新的密码
        public static int Update(string pwd, int id)
        {
            string sql = "UPDATE Customer SET  pwd = @pwd where id=@id";
            SqlParameter[] sp = { new SqlParameter("@pwd",pwd),
            new SqlParameter("@id",id)};
            return (int)SqlHelper.ExecuteNonQuery(sql, CommandType.Text, sp);
        }
        public static int DeleteByName(string  username)
        {
            string sql = "DELETE FROM Customer WHERE username = @username";

            SqlParameter[] para = new SqlParameter[]
             {
                new SqlParameter("@username", username)
             };

            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, para);
        }

        public static int UpdateState(string email)
        {
            string sql = "update Customer set state=1 where email=@email";
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, new SqlParameter("@email", email));
        }
        public static int UpdatePart(Customer customer)
        {
            string sql =
                @"UPDATE Customer SET  userName = @userName                
                , email = @email 
                , customerNumber = @customerNumber 
                , address = @address 
                , companyName = @companyName 
                , openUnit = @openUnit 
                , bankAccount = @bankAccount 
                , legalPerson = @legalPerson 
                , phone = @phone 
                 WHERE id = @id";

            SqlParameter[] para = new SqlParameter[]
            {
                new SqlParameter("@id", customer.id)
                    ,new SqlParameter("@userName", ToDBValue(customer.userName))                  
                    ,new SqlParameter("@email", ToDBValue(customer.email))
                    ,new SqlParameter("@customerNumber", ToDBValue(customer.customerNumber))
                    ,new SqlParameter("@address", ToDBValue(customer.address))
                    ,new SqlParameter("@companyName", ToDBValue(customer.companyName))
                    ,new SqlParameter("@openUnit", ToDBValue(customer.openUnit))
                    ,new SqlParameter("@bankAccount", ToDBValue(customer.bankAccount))
                    ,new SqlParameter("@legalPerson", ToDBValue(customer.legalPerson))
                    ,new SqlParameter("@phone", ToDBValue(customer.phone))
            };
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, para);
        }
    }
}
