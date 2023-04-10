using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TestAccountSystem.DAL;
using TestAccountSystem.Model;

namespace TestAccountSystem.AdminPages
{
    public partial class Index : System.Web.UI.Page
    {
        public string _num1 = "0";
        public string _num2 = "0";
        public string _num3 = "0";
        public string _num4 = "0";
        public string _num5 = "0";
        public string _num6 = "0";
        public string _title1 = "数据信息";
        public string _title2 = "数据信息";
        public string _title3 = "数据信息";
        public string _title4 = "数据信息";
        public string _title5 = "数据信息";
        public string _title6 = "数据信息";
        public string _URL1 = "#";
        public string _URL2 = "#";
        public string _URL3 = "#";
        public string _URL4 = "#";
        public string _URL5 = "#";
        public string _URL6 = "#";

        protected void Page_Load(object sender, EventArgs e)
        {
            string username = Session["UserName"].ToString();
            AllUser ad = AllUserDAL.GetByName(username);           
            LoadIndex(ad);
            if (!IsPostBack)
            {

                Customer model = CustomerDAL.GetByName(username);
                if (model != null)
                {
                    if (model.roleId == 1 && (model.address == null || model.bankAccount == null || model.companyName == null || model.customerNumber == null || model.phone == null || model.openUnit == null || model.legalPerson == null))
                    {
                        Response.Redirect("../CustomerPages/defaultMsg.aspx");//<a href="../CustomerPages/default.aspx">../CustomerPages/default.aspx</a>
                    }
                }
            }

        }
        private void LoadIndex(AllUser alluser)
        {
            //string str = " and 1=1 ";
            if (alluser != null)
            {
                switch (alluser.roleId)
                {
                    case 1://客户
                        _title1 = "审核未通过信息条数";
                        _title2 = "待审核数据信息条数";
                        _title3 = "待缴费数据信息条数";
                        _title4 = "正在检验中数据信息条数";
                        _title5 = "检验完成数据信息条数";
                        string str1 = " and remark='" + Session["RealName"] + "'";

                        _num1 = SqlHelper.GetCountNumber("InspectionRegistration", "ID", "status='审核未通过'" + str1).ToString();
                        _num2 = SqlHelper.GetCountNumber("InspectionRegistration", "ID", "status='待审核'" + str1).ToString();
                        _num3 = SqlHelper.GetCountNumber("InspectionRegistration", "ID", "status='待缴费'" + str1).ToString();
                        _num4 = SqlHelper.GetCountNumber("InspectionRegistration", "ID", "status='验船中'" + str1).ToString();
                        _num5 = SqlHelper.GetCountNumber("InspectionRegistration", "ID", "status='完成'" + str1).ToString();
                        //  _num6 = (int)SqlHelper.GetCountNumber("InspectionRegistration", "ID", "status='待缴费'" + str);
                        //string strr = " and status='审核未通过'";
                        _URL1 = "QueryRegistrationForm.aspx?flag=CUSTOMER1";
                        _URL2 = "QueryRegistrationForm.aspx?flag=CUSTOMER2";
                        _URL3 = "InspectionChargeForm.aspx?flag=CUSTOMER3";
                        _URL4 = "QueryRegistrationForm.aspx?flag=CUSTOMER4";
                        _URL5 = "QueryRegistrationForm.aspx?flag=CUSTOMER5";
                        break;



                    case 2://验船师
                        _title1 = "待审核数据信息条数";
                        _title2 = "等待检验数据信息条数";
                        _title3 = "正在检验中数据信息条数";
                        _title4 = "检验完成数据信息条数";
                        //   _title5 = "检验完成数据信息条数";
                        string str2 = " and surveyor='" + alluser.realName + "'";

                        _num1 = SqlHelper.GetCountNumber("InspectionRegistration", "ID", "status='待审核'" + str2).ToString();
                        _num2 = SqlHelper.GetCountNumber("InspectionRegistration", "ID", "status='待验船'" + str2).ToString();
                        _num3 = SqlHelper.GetCountNumber("InspectionRegistration", "ID", "status='验船中'" + str2).ToString();
                        _num4 = SqlHelper.GetCountNumber("InspectionRegistration", "ID", "status='完成'" + str2).ToString();

                        _URL1 = "CheckRegisterForm.aspx";//?flag=SURVEYOR1
                        _URL2 = "InspectionStatusManagementForm.aspx?flag=SURVEYOR2";
                        _URL3 = "InspectionStatusManagementForm.aspx?flag=SURVEYOR3";
                        _URL4 = "InspectionStatusManagementForm.aspx?flag=SURVEYOR4";
                        break;

                    case 3://单位领导 
                        _title1 = "收费总金额";
                        _title2 = "全部检验订单信息条数";
                        _title3 = "待审核数据信息条数";
                        _title4 = "待缴费数据信息条数";
                        _title5 = "正在检验中数据信息条数";
                        _title6 = "检验完成数据信息条数";
                        double total = 0;
                        string sql = "select amount from InspectionRegistration where status='验船中' or status='待验船' or status='完成'";
                        using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, System.Data.CommandType.Text))
                        {
                            while (reader.Read())
                            {
                                total += Convert.ToDouble(reader.GetDecimal(0));
                            }
                        }
                        _num1 = total.ToString();
                        _num2 = SqlHelper.GetCountNumber("InspectionRegistration", "ID", "status!='保存' and status!='审核未通过'").ToString();
                        _num3 = SqlHelper.GetCountNumber("InspectionRegistration", "ID", "status='待审核'").ToString();
                        _num4 = SqlHelper.GetCountNumber("InspectionRegistration", "ID", "status='待缴费'").ToString();
                        _num5 = SqlHelper.GetCountNumber("InspectionRegistration", "ID", "status='验船中'").ToString();
                        _num6 = SqlHelper.GetCountNumber("InspectionRegistration", "ID", "status='完成'").ToString();

                        // _URL1 = "QueryRegistrationForm.aspx?flag=LEADER1";
                        _URL2 = "QueryRegistrationForm.aspx?flag=LEADER2";
                        _URL3 = "QueryRegistrationForm.aspx?flag=LEADER3";
                        _URL4 = "QueryRegistrationForm.aspx?flag=LEADER4";
                        _URL5 = "QueryRegistrationForm.aspx?flag=LEADER5";
                        _URL6 = "QueryRegistrationForm.aspx?flag=LEADER6";
                        break;



                    case 4://财务 
                        _title1 = "已收费总金额";
                        _title2 = "完成收费订单信息条数";
                        _title3 = "等待计费信息条数";
                        _title4 = "待缴费数据信息条数";
                        double total1 = 0;
                        int index = 0;
                        string sql1 = "select amount from InspectionRegistration where (status='验船中' or status='待验船' or status='完成') and cashier='" + Session["RealName"] + "'";
                        using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql1, System.Data.CommandType.Text))
                        {
                            if (reader.HasRows)
                            {
                                while (reader.Read())
                                {
                                    index++;
                                    total1 += Convert.ToDouble(reader.GetDecimal(0));
                                }
                            }
                        }
                        _num1 = total1.ToString();
                        _num2 = index.ToString();
                        _num3 = SqlHelper.GetCountNumber("InspectionRegistration", "ID", "status='待计费'").ToString();
                        _num4 = SqlHelper.GetCountNumber("InspectionRegistration", "ID", "status='待缴费'").ToString();
                        _URL2 = "TotalChargeForm.aspx";
                        _URL3 = "InspectionBillingForm.aspx";
                        _URL4 = "InspectionChargeForm.aspx";
                        break;



                    case 5://管理员admin
                        _title1 = "全部检验订单信息条数";
                        _title2 = "待审核数据信息条数";
                        _title3 = "等待计费信息条数";
                        _title4 = "待缴费数据信息条数";
                        _title5 = "正在检验中数据信息条数";
                        _title6 = "检验完成数据信息条数";
                        // string str5 = " and surveyor='" + alluser.userName + "'";

                        _num1 = SqlHelper.GetCountNumber("InspectionRegistration", "ID", "status!='保存' and status!='审核未通过'").ToString();
                        _num2 = SqlHelper.GetCountNumber("InspectionRegistration", "ID", "status='待审核'").ToString();
                        _num3 = SqlHelper.GetCountNumber("InspectionRegistration", "ID", "status='待计费'").ToString();
                        _num4 = SqlHelper.GetCountNumber("InspectionRegistration", "ID", "status='待缴费'").ToString();
                        _num5 = SqlHelper.GetCountNumber("InspectionRegistration", "ID", "status='验船中'").ToString();
                        _num6 = SqlHelper.GetCountNumber("InspectionRegistration", "ID", "status='完成'").ToString();

                        _URL1 = "QueryRegistrationForm.aspx?flag=ADMIN1";
                        _URL2 = "QueryRegistrationForm.aspx?flag=ADMIN2";
                        _URL3 = "QueryRegistrationForm.aspx?flag=ADMIN3";
                        _URL4 = "InspectionChargeForm.aspx?flag=ADMIN4";
                        _URL5 = "QueryRegistrationForm.aspx?flag=ADMIN5";
                        _URL6 = "QueryRegistrationForm.aspx?flag=ADMIN6";
                        break;



                    default:
                        break;
                }
            }


        }
    }
}