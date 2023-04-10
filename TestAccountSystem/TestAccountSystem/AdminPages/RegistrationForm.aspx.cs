using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TestAccountSystem.Model;
using TestAccountSystem.DAL;
using System.Data;
using System.Text;

namespace TestAccountSystem.AdminPages
{
    public partial class RegistrationForm : System.Web.UI.Page
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

                BindDrowDownList();
                //if (Session["showdetailRegisterNumber"] != null)
                //{
                //    showDetail();
                //}
            }
            #region zhw

            if (Session["UserName"] == null)
            {
                Response.Redirect("../AdminLayout/Redirect.aspx?type=reLogin");
                return;
            }
            BindTxt(Session["UserName"].ToString());
            if (Request.QueryString["Id"] != null)
            {
                showDetail(Request.QueryString["Id"]);
            }
            else
            {
                txtRegisterNumber.Attributes.Add("disabled", "disabled");
                txtRegisterNumber.Text = GetRegisterNumber();
            }

            #endregion
        }
        #region  zhw
        //zhw---自动生成检验登记单编号
        private string GetRegisterNumber()
        {
            InspectionRegistration model = InspectionRegistrationDAL.GetMaxDid();
            if (model == null)
            {
                CodeRegulation1 cr = CodeRegulationDAL.GetByName("检验登记单编码规则");
                if (cr == null)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('部门编码规则为空！');bindDatePicker()", true);
                    return "";
                }
                StringBuilder sb = new StringBuilder();
                sb.Append(cr.prefix);
                sb.Append(cr.connector1);
                sb.Append(DateTime.Now.ToString(cr.timeType));
                sb.Append(cr.connector2);
                sb.Append(cr.startSerial);
                return sb.ToString();
            }
            else
            {
                return CodeRegulationDAL.GetCode("检验登记单编码规则", model.RegisterNumber);
            }
        }
        private void BindDrowDownList()
        {
            //绑定下拉列表
            #region  绑定货币种类
            DictInfo mode = DictInfoDAL.GetByName("货币种类");
            if (mode == null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('货币种类为空！');bindDatePicker()", true);
                return;
            }
            DataTable dtcurrency = SqlHelper.Select("name", "dictInfo", "parentId=" + mode.id.ToString(), "ID ASC");
            ddlCurrency.DataSource = dtcurrency;
            ddlCurrency.DataTextField = "name";
            ddlCurrency.DataValueField = "name";
            ddlCurrency.DataBind();
            ListItem item = new ListItem("请选择", "请选择");
            ddlCurrency.Items.Insert(0, item);
            ddlCurrency.SelectedIndex = 0;
            #endregion
            #region 绑定验船师
            DataTable dtSurveyor = SqlHelper.Select("realname", "alluser", "roleId=2 and state=1 and isuseful=1", "username ASC");
            ddlSurveyor.DataSource = dtSurveyor;
            ddlSurveyor.DataTextField = "realname";
            ddlSurveyor.DataValueField = "realname";
            ddlSurveyor.DataBind();
            ddlSurveyor.Items.Insert(0, item);
            ddlSurveyor.SelectedIndex = 0;
            #endregion
            #region 绑定申请项目
            DictInfo mode1 = DictInfoDAL.GetByName("业务分类");
            if (mode == null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('业务分类为空！');bindDatePicker()", true);
                return;
            }
            DataTable dtApplicationProject = SqlHelper.Select("name", "dictInfo", "parentId=" + mode1.id.ToString(), "ID ASC");
            ddlApplicationProject.DataSource = dtApplicationProject;
            ddlApplicationProject.DataTextField = "name";
            ddlApplicationProject.DataValueField = "name";
            ddlApplicationProject.DataBind();
            ddlApplicationProject.Items.Insert(0, item);
            #endregion
        }
        private void BindTxt(string username)
        {
            Customer model = CustomerDAL.GetByName(username);
            if (model != null)
            {
                txtApplicantCompany.Text = model.companyName;
                txtApplicant.Text = model.legalPerson;
                txtApplicantCompanyAddress.Text = model.address;
                txtApplicantPhone.Text = model.phone;
                txtBankAccount.Text = model.bankAccount;
                txtApplicantCompany.Attributes.Add("disabled", "disabled");
                txtApplicant.Attributes.Add("disabled", "disabled");
                txtApplicantCompanyAddress.Attributes.Add("disabled", "disabled");
                txtApplicantPhone.Attributes.Add("disabled", "disabled");
                txtBankAccount.Attributes.Add("disabled", "disabled");
            }
            //else
            //{
            //    txtApplicantCompany.Text = "";
            //    txtApplicant.Text = "";
            //    txtApplicantCompanyAddress.Text = "";
            //    txtApplicantPhone.Text = "";
            //    txtBankAccount.Text = "";
            //}
        }
        public void showDetail(string id)
        {
            string RegisterNumber = id;
            //string RegisterNumber = (string)Session["showdetailRegisterNumber"];
            InspectionRegistration rmodel = InspectionRegistrationDAL.GetByRegisterNumber(RegisterNumber);
            txtRegisterNumber.Text = rmodel.RegisterNumber;
            txtShipRegisterNumber.Text = rmodel.ShipRegistrationNumber;
            txtInspectionName.Text = rmodel.InspectionName;
            ddlSurveyor.Text = rmodel.Surveyor;
            ddlCurrency.Text = rmodel.Currency;
            //txtOrderDate.Text = rmodel.OrderDate.ToString();
            //  ddlBusinessName.Text = rmodel.BusinessName;
            txtApplicantCompany.Text = rmodel.ApplicantCompany;
            txtApplicant.Text = rmodel.Applicant;
            txtApplicantCompanyAddress.Text = rmodel.ApplicantCompanyAddress;
            txtApplicantPhone.Text = rmodel.ApplicantPhone;
            txtBankAccount.Text = rmodel.BankAccount;
            ddlApplicationProject.Text = rmodel.ApplicationProject;
            txtTaxpayerIdentificationNumber.Text = rmodel.TaxpayerIdentificationNumber;
            txtRemark.Text = rmodel.Remark;
            txtRegisterNumber.Attributes.Add("readonly", "");
        }
        #endregion

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("../AdminLayout/Redirect.aspx?type=reLogin");
                return;
            }
            #region
            //if (txtApplicantCompany.Text.Trim() == "" || txtRegisterNumber.Text.Trim() == "" || txtShipRegisterNumber.Text.Trim() == "" || txtApplicant.Text.Trim() == "" || ddlApplicationProject.SelectedValue.Trim() == "" || txtTaxpayerIdentificationNumber.Text.Trim() == "" || txtApplicantCompanyAddress.Text.Trim() == "" || txtApplicantPhone.Text.Trim() == "" || txtBankAccount.Text.Trim() == "" || ddlSurveyor.SelectedIndex==0|| ddlCurrency.SelectedIndex==0)
            //{
            //    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('信息填写不完整，无法保存！')", true);
            //    return;
            //}

            //登记单基本信息封装
            //InspectionRegistration irtModel = new InspectionRegistration();

            //irtModel.RegisterNumber = txtRegisterNumber.Text.Trim();
            //irtModel.ShipRegistrationNumber = txtShipRegisterNumber.Text.Trim();
            //irtModel.ApplicantCompany = txtApplicantCompany.Text.Trim();
            //irtModel.Applicant = txtApplicant.Text.Trim();
            //irtModel.ApplicationProject = ddlApplicationProject.SelectedValue;
            //irtModel.TaxpayerIdentificationNumber = txtTaxpayerIdentificationNumber.Text.Trim();
            //irtModel.ApplicantCompanyAddress = txtApplicantCompanyAddress.Text.Trim();
            //irtModel.ApplicantPhone = txtApplicantPhone.Text.Trim();
            //irtModel.BankAccount = txtBankAccount.Text.Trim();
            //irtModel.BusinessName = ddlBusinessName.SelectedValue.Trim();
            //irtModel.InspectionName = txtInspectionName.Text.Trim();
            //irtModel.OrderDate = DateTime.Now;
            //irtModel.InspectionDate = DateTime.Now;
            //irtModel.Surveyor = ddlSurveyor.SelectedValue.Trim();
            //irtModel.Status = "保存";
            //irtModel.Remark = txtRemark.Text.Trim();
            //irtModel.Currency = ddlCurrency.SelectedValue.Trim();
            //irtModel.Remark = Session["UserName"].ToString();//zhw
            //

            ////查询数据库中是否存在该订单号 
            //object o = InspectionRegistrationDAL.GetByRegisterNumber(txtRegisterNumber.Text.Trim());
            //if (o == null)
            //{
            //    object o2 = InspectionRegistrationDAL.Insert(irtModel);
            //    if (o2 == null)
            //    {
            //        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('保存失败！')", true);
            //        return;
            //    }
            //    LiteralHiddenState.Text = "SaveFinish";
            //    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('保存成功！')", true);
            //    return;
            //}
            //else
            //{
            //    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('该订单号已存在！')", true);
            //    return;
            //}
            #endregion
            Insert();
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            if (LiteralHiddenState.Text == "")
            {
                // Boolean flag = Insert();
                if (Insert() == false)
                {
                    return;
                }
                Session["RegisterNumber"] = txtRegisterNumber.Text.Trim();

            }
            else
            {
                Session["RegisterNumber"] = CodeRegulationDAL.GetCodeReduce("检验登记单编码规则", txtRegisterNumber.Text.Trim());//zhw
            }

            Session["ShipRegistrationNumber"] = txtShipRegisterNumber.Text.Trim();
            //Session["BusinessName"] = ddlBusinessName.SelectedValue;

            Response.Redirect("ShipInfoForm.aspx");
        }
        private Boolean Insert()
        {
            if (txtApplicantCompany.Text.Trim() == "" || txtRegisterNumber.Text.Trim() == "" || txtShipRegisterNumber.Text.Trim() == "" || txtApplicant.Text.Trim() == "" || ddlApplicationProject.SelectedValue.Trim() == "" || txtTaxpayerIdentificationNumber.Text.Trim() == "" || txtApplicantCompanyAddress.Text.Trim() == "" || txtApplicantPhone.Text.Trim() == "" || txtBankAccount.Text.Trim() == "" || ddlSurveyor.SelectedIndex == 0 || ddlCurrency.SelectedIndex == 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('信息填写不完整，无法保存！')", true);
                return false;
            }
            //登记单基本信息封装
            #region
            InspectionRegistration irtModel = new InspectionRegistration();

            irtModel.RegisterNumber = txtRegisterNumber.Text.Trim();
            irtModel.ShipRegistrationNumber = txtShipRegisterNumber.Text.Trim();
            irtModel.ApplicantCompany = txtApplicantCompany.Text.Trim();
            irtModel.Applicant = txtApplicant.Text.Trim();
            irtModel.ApplicationProject = ddlApplicationProject.SelectedValue;
            irtModel.TaxpayerIdentificationNumber = txtTaxpayerIdentificationNumber.Text.Trim();
            irtModel.ApplicantCompanyAddress = txtApplicantCompanyAddress.Text.Trim();
            irtModel.ApplicantPhone = txtApplicantPhone.Text.Trim();
            irtModel.BankAccount = txtBankAccount.Text.Trim();
            //irtModel.BusinessName = ddlBusinessName.SelectedValue.Trim();
            irtModel.InspectionName = txtInspectionName.Text.Trim();
            irtModel.OrderDate = DateTime.Now;
            irtModel.InspectionDate = DateTime.Now;
            irtModel.Surveyor = ddlSurveyor.SelectedValue.Trim();
            irtModel.Status = "保存";
           // irtModel.Remark = txtRemark.Text.Trim();
            irtModel.Currency = ddlCurrency.SelectedValue.Trim();
            irtModel.Remark = Session["RealName"].ToString();//zhw


            //查询数据库中是否存在该订单号 
            object o = InspectionRegistrationDAL.GetByRegisterNumber(txtRegisterNumber.Text.Trim());
            if (o == null)
            {
                object o2 = InspectionRegistrationDAL.Insert(irtModel);
                if (o2 == null)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('保存失败！')", true);
                    return false;
                }
                LiteralHiddenState.Text = "SaveFinish";
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('保存成功！')", true);
                return true;
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('该订单号已存在！')", true);
                return false;
            }
            #endregion
        }

    }
}