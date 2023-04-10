using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TestAccountSystem.BLL;
using TestAccountSystem.DAL;
using TestAccountSystem.Model;

namespace TestAccountSystem.CustomerPages
{
    public partial class _default : System.Web.UI.Page
    {
        public string strMsg { get; set; }
        public Customer model { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {//首次加载
                if (Session["UserName"] != null)
                {
                    //int id = int.Parse(Session["Id"].ToString() ?? "0");
                    //model = CustomerDAL.GetById(id);
                    model = CustomerDAL.GetByName(Session["UserName"].ToString());
                }
                else
                {
                    Response.Redirect("../AdminLayout/Redirect.aspx?type=reLogin");//<a href="../AdminLayout/Redirect.aspx">../AdminLayout/Redirect.aspx</a>
                }

            }
            else
            {//提交
                Customer customer = new Customer();
                // customer.id = model.id;
                customer.id = int.Parse(Session["Id"].ToString() ?? "0");
                //string aa= Request["txtId"];
                customer.userName = Session["UserName"].ToString();
                customer.pwd = Request["hiddenpwd"];
                customer.email = Request["hiddenEmail"];
                customer.state = true;
                customer.isUseFul = true;
                customer.customerNumber = Request["txtId"];
                customer.companyName = Request["txtName"];
                customer.address = Request["txtAddress"];
                customer.openUnit = Request["txtBank"];
                customer.bankAccount = Request["txtBankAccount"];
                customer.legalPerson = Request["txtPerson"];
                customer.phone = Request["txtPhone"];
                //int id = int.Parse(Session["Id"].ToString() ?? "0");
                //model = CustomerDAL.GetById(id);
                if (customer.customerNumber==""|| customer.companyName==""|| customer.address==""|| customer.openUnit==""|| customer.bankAccount==""|| customer.legalPerson==""|| customer.phone=="")
                {
                    int id = int.Parse(Session["Id"].ToString() ?? "0");
                    model = CustomerDAL.GetById(id);
                    strMsg = "以上信息均不能为空，请重新填写！";
                    return;
                }
                if (CustomerDAL.Update(customer) > 0)
                {//更新成功
                    model = customer;
                    strMsg = "信息提交成功！";
                    Response.Redirect("../AdminPages/Index.aspx");
                    LogBLL.LogInsert(Session["UserName"].ToString(),"填写信息","填写了公司基本信息","客户");
                    //  Response.Write("../AdminPages/Index.aspx");//< a href = "../AdminPages/Index.aspx" > .. / AdminPages / Index.aspx </ a >
                }
                else
                {
                    //失败
                    int id = int.Parse(Session["Id"].ToString() ?? "0");
                    model = CustomerDAL.GetById(id);
                    strMsg = "信息提交失败，请重新尝试！";
                }
            }
        }
    }
}