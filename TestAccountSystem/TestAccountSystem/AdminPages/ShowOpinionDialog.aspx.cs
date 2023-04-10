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
    public partial class ShowOpinionDialog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string registerNum = Request.QueryString["registerNum"];
            string type = Request.QueryString["type"];
            InspectionRegistration model = InspectionRegistrationDAL.GetByRegisterNumber(registerNum);
            if (model != null)
            {
                txtId.Text = model.RegisterNumber;
                txtCompany.Text = model.ApplicantCompany;
                txtId.Attributes.Add("disabled", "");
                txtCompany.Attributes.Add("disabled", "");
                if (type == "customer")
                {
                    divSurveyor.Visible = true;
                    txtSurveyor.Text = model.Surveyor;
                    txtReason.Text = model.reason;
                    txtReason.Attributes.Add("disabled","");
                    btnSave.Visible = false;
                }

            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {//审核不通过，保存意见
            string sql = "update InspectionRegistration set reason=@reason,Status=@Status,Reviewer=@Reviewer where RegisterNumber=@registerNum ";
            SqlParameter[] sp = { new SqlParameter("@reason", txtReason.Text.Trim()),
                new SqlParameter("@registerNum",txtId.Text.Trim()),
            new SqlParameter("@Status","审核未通过"),
            new SqlParameter("@Reviewer",Session["RealName"])};
            if (SqlHelper.ExecuteNonQuery(sql, System.Data.CommandType.Text, sp) > 0)
            {
               // ChargeProjectDAL.DeleteByRegisterNumber(txtId.Text.Trim());
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "select", "window.parent.AfterSelectProject();", true);
            }

        }
    }
}