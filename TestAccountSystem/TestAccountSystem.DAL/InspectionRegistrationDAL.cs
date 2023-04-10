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
	public partial class InspectionRegistrationDAL
	{
        public static object Insert(InspectionRegistration inspectionRegistration)
		{
				string sql ="INSERT INTO InspectionRegistration (RegisterNumber, ShipRegistrationNumber, ApplicantCompany, Applicant, ApplicationProject, TaxpayerIdentificationNumber, ApplicantCompanyAddress, ApplicantPhone, BankAccount, BusinessName, InspectionName, InspectionDate, OrderDate, Currency, Amount, Surveyor, Status, Reviewer, Remark, cashier, reason, payer, payTime, remark1, remark2)  output inserted.ID VALUES (@RegisterNumber, @ShipRegistrationNumber, @ApplicantCompany, @Applicant, @ApplicationProject, @TaxpayerIdentificationNumber, @ApplicantCompanyAddress, @ApplicantPhone, @BankAccount, @BusinessName, @InspectionName, @InspectionDate, @OrderDate, @Currency, @Amount, @Surveyor, @Status, @Reviewer, @Remark, @cashier, @reason, @payer, @payTime, @remark1, @remark2)";
				SqlParameter[] para = new SqlParameter[]
					{
						new SqlParameter("@RegisterNumber", ToDBValue(inspectionRegistration.RegisterNumber)),
						new SqlParameter("@ShipRegistrationNumber", ToDBValue(inspectionRegistration.ShipRegistrationNumber)),
						new SqlParameter("@ApplicantCompany", ToDBValue(inspectionRegistration.ApplicantCompany)),
						new SqlParameter("@Applicant", ToDBValue(inspectionRegistration.Applicant)),
						new SqlParameter("@ApplicationProject", ToDBValue(inspectionRegistration.ApplicationProject)),
						new SqlParameter("@TaxpayerIdentificationNumber", ToDBValue(inspectionRegistration.TaxpayerIdentificationNumber)),
						new SqlParameter("@ApplicantCompanyAddress", ToDBValue(inspectionRegistration.ApplicantCompanyAddress)),
						new SqlParameter("@ApplicantPhone", ToDBValue(inspectionRegistration.ApplicantPhone)),
						new SqlParameter("@BankAccount", ToDBValue(inspectionRegistration.BankAccount)),
						new SqlParameter("@BusinessName", ToDBValue(inspectionRegistration.BusinessName)),
						new SqlParameter("@InspectionName", ToDBValue(inspectionRegistration.InspectionName)),
						new SqlParameter("@InspectionDate", ToDBValue(inspectionRegistration.InspectionDate)),
						new SqlParameter("@OrderDate", ToDBValue(inspectionRegistration.OrderDate)),
						new SqlParameter("@Currency", ToDBValue(inspectionRegistration.Currency)),
						new SqlParameter("@Amount", ToDBValue(inspectionRegistration.Amount)),
						new SqlParameter("@Surveyor", ToDBValue(inspectionRegistration.Surveyor)),
						new SqlParameter("@Status", ToDBValue(inspectionRegistration.Status)),
						new SqlParameter("@Reviewer", ToDBValue(inspectionRegistration.Reviewer)),
						new SqlParameter("@Remark", ToDBValue(inspectionRegistration.Remark)),
						new SqlParameter("@cashier", ToDBValue(inspectionRegistration.cashier)),
						new SqlParameter("@reason", ToDBValue(inspectionRegistration.reason)),
						new SqlParameter("@payer", ToDBValue(inspectionRegistration.payer)),
						new SqlParameter("@payTime", ToDBValue(inspectionRegistration.payTime)),
						new SqlParameter("@remark1", ToDBValue(inspectionRegistration.remark1)),
						new SqlParameter("@remark2", ToDBValue(inspectionRegistration.remark2)),
					};
					
				return SqlHelper.ExecuteScalar(sql,CommandType.Text, para);
		}

        public static int DeleteByID(int iD)
		{
            string sql = "DELETE FROM InspectionRegistration WHERE ID = @ID";

           SqlParameter[] para = new SqlParameter[]
			{
				new SqlParameter("@ID", iD)
			};
		
            return SqlHelper.ExecuteNonQuery(sql, CommandType.Text,para);
		}
		
				
        public static int Update(InspectionRegistration inspectionRegistration)
        {
            string sql =
                @"UPDATE InspectionRegistration SET  RegisterNumber = @RegisterNumber 
                , ShipRegistrationNumber = @ShipRegistrationNumber 
                , ApplicantCompany = @ApplicantCompany 
                , Applicant = @Applicant 
                , ApplicationProject = @ApplicationProject 
                , TaxpayerIdentificationNumber = @TaxpayerIdentificationNumber 
                , ApplicantCompanyAddress = @ApplicantCompanyAddress 
                , ApplicantPhone = @ApplicantPhone 
                , BankAccount = @BankAccount 
                , BusinessName = @BusinessName 
                , InspectionName = @InspectionName 
                , InspectionDate = @InspectionDate 
                , OrderDate = @OrderDate 
                , Currency = @Currency 
                , Amount = @Amount 
                , Surveyor = @Surveyor 
                , Status = @Status 
                , Reviewer = @Reviewer 
                , Remark = @Remark 
                , cashier = @cashier 
                , reason = @reason 
                , payer = @payer 
                , payTime = @payTime 
                , remark1 = @remark1 
                , remark2 = @remark2 
                 WHERE ID = @ID";

			SqlParameter[] para = new SqlParameter[]
			{
				new SqlParameter("@ID", inspectionRegistration.ID)
					,new SqlParameter("@RegisterNumber", ToDBValue(inspectionRegistration.RegisterNumber))
					,new SqlParameter("@ShipRegistrationNumber", ToDBValue(inspectionRegistration.ShipRegistrationNumber))
					,new SqlParameter("@ApplicantCompany", ToDBValue(inspectionRegistration.ApplicantCompany))
					,new SqlParameter("@Applicant", ToDBValue(inspectionRegistration.Applicant))
					,new SqlParameter("@ApplicationProject", ToDBValue(inspectionRegistration.ApplicationProject))
					,new SqlParameter("@TaxpayerIdentificationNumber", ToDBValue(inspectionRegistration.TaxpayerIdentificationNumber))
					,new SqlParameter("@ApplicantCompanyAddress", ToDBValue(inspectionRegistration.ApplicantCompanyAddress))
					,new SqlParameter("@ApplicantPhone", ToDBValue(inspectionRegistration.ApplicantPhone))
					,new SqlParameter("@BankAccount", ToDBValue(inspectionRegistration.BankAccount))
					,new SqlParameter("@BusinessName", ToDBValue(inspectionRegistration.BusinessName))
					,new SqlParameter("@InspectionName", ToDBValue(inspectionRegistration.InspectionName))
					,new SqlParameter("@InspectionDate", ToDBValue(inspectionRegistration.InspectionDate))
					,new SqlParameter("@OrderDate", ToDBValue(inspectionRegistration.OrderDate))
					,new SqlParameter("@Currency", ToDBValue(inspectionRegistration.Currency))
					,new SqlParameter("@Amount", ToDBValue(inspectionRegistration.Amount))
					,new SqlParameter("@Surveyor", ToDBValue(inspectionRegistration.Surveyor))
					,new SqlParameter("@Status", ToDBValue(inspectionRegistration.Status))
					,new SqlParameter("@Reviewer", ToDBValue(inspectionRegistration.Reviewer))
					,new SqlParameter("@Remark", ToDBValue(inspectionRegistration.Remark))
					,new SqlParameter("@cashier", ToDBValue(inspectionRegistration.cashier))
					,new SqlParameter("@reason", ToDBValue(inspectionRegistration.reason))
					,new SqlParameter("@payer", ToDBValue(inspectionRegistration.payer))
					,new SqlParameter("@payTime", ToDBValue(inspectionRegistration.payTime))
					,new SqlParameter("@remark1", ToDBValue(inspectionRegistration.remark1))
					,new SqlParameter("@remark2", ToDBValue(inspectionRegistration.remark2))
			};
			return SqlHelper.ExecuteNonQuery(sql, CommandType.Text,para);
        }		
		
        public static InspectionRegistration GetByID(int iD)
        {
            string sql = "SELECT * FROM InspectionRegistration WHERE ID = @ID";
            using(SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text, new SqlParameter("@ID", iD)))
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
		
		public static InspectionRegistration ToModel(SqlDataReader reader)
		{
			InspectionRegistration inspectionRegistration = new InspectionRegistration();

			inspectionRegistration.ID = (int)ToModelValue(reader,"ID");
			inspectionRegistration.RegisterNumber = (string)ToModelValue(reader,"RegisterNumber");
			inspectionRegistration.ShipRegistrationNumber = (string)ToModelValue(reader,"ShipRegistrationNumber");
			inspectionRegistration.ApplicantCompany = (string)ToModelValue(reader,"ApplicantCompany");
			inspectionRegistration.Applicant = (string)ToModelValue(reader,"Applicant");
			inspectionRegistration.ApplicationProject = (string)ToModelValue(reader,"ApplicationProject");
			inspectionRegistration.TaxpayerIdentificationNumber = (string)ToModelValue(reader,"TaxpayerIdentificationNumber");
			inspectionRegistration.ApplicantCompanyAddress = (string)ToModelValue(reader,"ApplicantCompanyAddress");
			inspectionRegistration.ApplicantPhone = (string)ToModelValue(reader,"ApplicantPhone");
			inspectionRegistration.BankAccount = (string)ToModelValue(reader,"BankAccount");
			inspectionRegistration.BusinessName = (string)ToModelValue(reader,"BusinessName");
			inspectionRegistration.InspectionName = (string)ToModelValue(reader,"InspectionName");
			inspectionRegistration.InspectionDate = (DateTime?)ToModelValue(reader,"InspectionDate");
			inspectionRegistration.OrderDate = (DateTime?)ToModelValue(reader,"OrderDate");
			inspectionRegistration.Currency = (string)ToModelValue(reader,"Currency");
			inspectionRegistration.Amount = (decimal?)ToModelValue(reader,"Amount");
			inspectionRegistration.Surveyor = (string)ToModelValue(reader,"Surveyor");
			inspectionRegistration.Status = (string)ToModelValue(reader,"Status");
			inspectionRegistration.Reviewer = (string)ToModelValue(reader,"Reviewer");
			inspectionRegistration.Remark = (string)ToModelValue(reader,"Remark");
			inspectionRegistration.cashier = (string)ToModelValue(reader,"cashier");
			inspectionRegistration.reason = (string)ToModelValue(reader,"reason");
			inspectionRegistration.payer = (string)ToModelValue(reader,"payer");
			inspectionRegistration.payTime = (DateTime?)ToModelValue(reader,"payTime");
			inspectionRegistration.remark1 = (string)ToModelValue(reader,"remark1");
			inspectionRegistration.remark2 = (string)ToModelValue(reader,"remark2");
			return inspectionRegistration;
		}
		
		public static int GetTotalCount()
		{
			string sql = "SELECT count(*) FROM InspectionRegistration";
			return (int)SqlHelper.ExecuteScalar(sql, CommandType.Text);
		}
		
		public static List<InspectionRegistration> GetPagedData(int startIndex,int endIndex)
		{
			string sql = "SELECT * from(SELECT *,row_number() over(order by ID desc) rownum FROM InspectionRegistration ) t where rownum>=@startIndex and rownum<=@endIndex";
			using(SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text,
				new SqlParameter("@startIndex",startIndex),
				new SqlParameter("@endIndex",endIndex)))
			{
				return ToModels(reader);					
			}
		}
		
		public static List<InspectionRegistration> GetAll()
		{
			string sql = "SELECT * FROM InspectionRegistration";
			using(SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text))
			{
				return ToModels(reader);			
			}
		}
		
		protected static List<InspectionRegistration> ToModels(SqlDataReader reader)
		{
			var list = new List<InspectionRegistration>();
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

		public static InspectionRegistration GetByRegisterNumber(string RegisterNumber)
		{
			string sql = "SELECT * FROM InspectionRegistration WHERE RegisterNumber = @RegisterNumber";
			using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text, new SqlParameter("@RegisterNumber", RegisterNumber)))
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

		#region  zhw
		//获取登记单最大的编号
		public static InspectionRegistration GetMaxDid()
		{
			string sql = "select top(1)* from InspectionRegistration order by ID desc";
			using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text))
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
		#endregion

		public static int DeleteByRegisterNumber(string RegisterNumber)
		{
			string sql = "DELETE FROM InspectionRegistration WHERE RegisterNumber = @RegisterNumber";

			SqlParameter[] para = new SqlParameter[]
			 {
				new SqlParameter("@RegisterNumber", RegisterNumber)
			 };

			return SqlHelper.ExecuteNonQuery(sql, CommandType.Text, para);
		}
	}
}
