using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TestAccountSystem.DAL;
using TestAccountSystem.Model;

namespace TestAccountSystem.AdminPages
{
    public partial class ShowPayerDialog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string registerNum = Request.QueryString["registerNum"];
            InspectionRegistration model = InspectionRegistrationDAL.GetByRegisterNumber(registerNum);
            if (model != null)
            {
                txtId.Text = registerNum;
                txtId.Attributes.Add("disabled", "");
                txtMoney.Text = model.Amount.ToString();
                txtMoney.Attributes.Add("disabled","");
                txtCompany.Text = model.ApplicantCompany;
                txtCompany.Attributes.Add("disabled","");
                txtShip.Text = model.ShipRegistrationNumber;
                txtShip.Attributes.Add("disabled","");
            }
            string type = Request.QueryString["type"];
            if (type!=null)
            {
                btnSave.Visible = false;
                divPeople.Visible = true;
                // txtPeople.Attributes.Add("disabled","");
                txtPeople.Text = model.cashier;
                txtRemark.Text = model.remark1;
                txtRemark.Attributes.Add("disabled","");
                txtTime.Text = model.payTime.ToString();
                txtPayer.Text = model.payer;
                txtPayer.Attributes.Add("disabled","");
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string registerNum = Request.QueryString["registerNum"];
            string name = Session["RealName"].ToString();
            string sqlUpdate = "update InspectionRegistration set Status=@Status,cashier=@cashier,payer=@payer,payTime=@payTime,remark1=@remark1 where RegisterNumber=@RegisterNumber";
            SqlParameter[] paras = new SqlParameter[] {
            new SqlParameter("@Status","待验船"),
            new SqlParameter("@cashier",name),
            new SqlParameter("@RegisterNumber",registerNum),
            new SqlParameter("@payer",txtPayer.Text.Trim()),
                new SqlParameter("@payTime",DateTime.Now),
                new SqlParameter("@remark1",txtRemark.Text.Trim())
            };
            if (SqlHelper.ExecuteNonQuery(sqlUpdate, CommandType.Text, paras) > 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "select", "window.parent.AfterSelectProject();", true);

                //  ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('收费人：" + name + ",收费完成！')", true);
            }

        }
    }
}