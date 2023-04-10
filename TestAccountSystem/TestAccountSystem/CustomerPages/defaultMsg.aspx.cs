using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TestAccountSystem.DAL;
using TestAccountSystem.Model;

namespace TestAccountSystem.CustomerPages
{
    public partial class defaultMsg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("../AdminLayout/Redirect.aspx?type=reLogin");
                return;
            }
            if (!IsPostBack)
            {
                btnChange(true, false, false);
                txtDisabled();
                //bindData();
            }
        }
        #region
        /*private void bindData()
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("../AdminLayout/Redirect.aspx?type=reLogin");
                return;
            }
            Customer model = CustomerDAL.GetByName(Session["UserName"].ToString());//Session["UserName"].ToString()
            if (model != null)
            {
                if (model.roleId == 1 && (model.address == null || model.bankAccount == null || model.companyName == null || model.customerNumber == null || model.phone == null || model.openUnit == null || model.legalPerson == null))
                {
                    Response.Redirect("default.aspx");//<a href="../CustomerPages/default.aspx">../CustomerPages/default.aspx</a>
                }
                else
                {
                    hiddenId.Text = model.id.ToString();
                    txtId.Text = model.customerNumber;
                    txtName.Text = model.companyName;
                    txtAddress.Text = model.address;
                    txtbank.Text = model.openUnit;
                    txtBankAccount.Text = model.bankAccount;
                    txtPerson.Text = model.legalPerson;
                    txtPhone.Text = model.phone;
                }
            }
        }*/
        #endregion
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("../AdminLayout/Redirect.aspx?type=reLogin");
                return;
            }
            btnChange(false, true, true);
            txtAbled();
           // bindData();
        }
        protected void btnCertain_Click(object sender, EventArgs e)
        {
            if ((int)SqlHelper.GetCountNumber("customer", "ID", string.Format("customerNumber='{0}'", txtId.Text.Trim())) != 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "key", "alert('公司编码已经存在！')", true);
                return;
            }
            if ((int)SqlHelper.GetCountNumber("customer", "ID", string.Format("companyName='{0}'", txtName.Text.Trim())) != 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "key", "alert('公司名称已经存在！')", true);
                return;
            }         
            if (txtId.Text=="")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "onekey", "alert('公司编码不能为空！')", true);
                return;
            }
            if (txtName.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "onekey", "alert('公司名称不能为空！')", true);
                return;
            }
            if (txtAddress.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "onekey", "alert('公司地址不能为空！')", true);
                return;
            }
            if (txtbank.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "onekey", "alert('开户银行不能为空！')", true);
                return;
            }
            if (txtBankAccount.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "onekey", "alert('银行账号不能为空！')", true);
                return;
            }
            if (txtPerson.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "onekey", "alert('公司法人不能为空！')", true);
                return;
            }
            if (txtPhone.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "onekey", "alert('联系电话不能为空！')", true);
                return;
            }
            if (Session["UserName"] == null)
            {
                Response.Redirect("../AdminLayout/Redirect.aspx?type=reLogin");
                return;
            }
            Customer model = CustomerDAL.GetByName(Session["UserName"].ToString());
            if (model != null)
            {
                model.customerNumber = txtId.Text.Trim();
                model.companyName = txtName.Text.Trim();
                model.address = txtAddress.Text.Trim();
                model.openUnit = txtbank.Text.Trim();
                model.bankAccount = txtBankAccount.Text.Trim();
                model.legalPerson = txtPerson.Text.Trim();
                model.phone = txtPhone.Text.Trim();
                CustomerDAL.Update(model);
                //bindData();
                txtDisabled();
                btnChange(true, false, false);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "onekey", "alert('保存信息失败！')", true);
                return;
            }
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
           // bindData();
            txtDisabled();
            btnChange(true, false, false);
        }
        private void btnChange(bool btnupdate, bool btncertain, bool btncancel)
        {
            btnAdd.Visible = btnupdate;
            btnCertain.Visible = btncertain;
            btnCancel.Visible = btncancel;
        }
        private void txtDisabled()
        {
            txtId.Attributes.Add("disabled", "disabled");
            txtName.Attributes.Add("disabled", "disabled");
            txtAddress.Attributes.Add("disabled", "disabled");
            txtbank.Attributes.Add("disabled", "disabled");
            txtBankAccount.Attributes.Add("disabled", "disabled");
            txtPerson.Attributes.Add("disabled", "disabled");
            txtPhone.Attributes.Add("disabled", "disabled");
        }
        private void txtAbled()
        {
            txtId.Attributes.Remove("disabled");
            txtName.Attributes.Remove("disabled");
            txtAddress.Attributes.Remove("disabled");
            txtAddress.Attributes.Remove("disabled");
            txtbank.Attributes.Remove("disabled");
            txtBankAccount.Attributes.Remove("disabled");
            txtPerson.Attributes.Remove("disabled");
            txtPhone.Attributes.Remove("disabled");
        }
    }
}