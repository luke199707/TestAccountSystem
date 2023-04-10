using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TestAccountSystem.DAL;
using TestAccountSystem.Model;
using System.Data.SqlClient;
using System.Data;
namespace TestAccountSystem.AdminPages
{
    public partial class AddLogForm : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("../AdminLayout/Redirect.aspx?type=reLogin");
                return;
            }
            string id = Request.QueryString["id"];
            if (!IsPostBack)
            {
                if (id == null)
                {
                    txtRegisterNumber.Text = Session["LogRegisterNumber"].ToString();
                    txtInspector.Text = Session["RealName"].ToString();
                    btnIsVisible(true, false);
                }
                else
                {
                    int ID = Convert.ToInt32(id);
                    hiddenIdEdit.Text = ID.ToString();
                    Edit(ID);
                    btnIsVisible(false, true);
                }

            }
            txtLogNumber.Text = DateTime.Now.ToString();
            //if (id != null)
            //{
            //    int ID = Convert.ToInt32(id);
            //    hiddenIdEdit.Text = ID.ToString();
            //    Edit(ID);
            //    btnIsVisible(false, true);
            //}
        }
        private void Edit(int id)
        {
            InspectLog model = InspectLogDAL.GetByID(id);
            if (model != null)
            {
                txtLogNumber.Text = "";
                txtLogNumber.Text = DateTime.Now.ToString();
                txtRegisterNumber.Text = model.RegisterNumber;
                txtInspector.Text = model.Inspector;
                txtLocation.Text = model.Location;
               // txtRemark.Text = model.Remark;
                txtInspectionContent.Text = model.InspectionContent;
            }

        }
        //private void txtAble()
        //{
        //    txtLocation.Attributes.Remove("ReadOnly");
        //    txtRemark.Attributes.Remove("ReadOnly");
        //    txtInspectionContent.Attributes.Remove("ReadOnly");
        //}
        private void btnIsVisible(bool btn1, bool btn2)
        {
            btnSave.Visible = btn1;
            btnUpdate.Visible = btn2;
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            #region //判断插入名称和编码是否重复
            if ((int)SqlHelper.GetCountNumber("InspectLog", "ID", string.Format("LogNumber='{0}'", txtLogNumber.Text)) != 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('该日志编号已经存在！')", true);
                return;
            }
            if ((int)SqlHelper.GetCountNumber("InspectionRegistration", "ID", string.Format("RegisterNumber='{0}'", txtRegisterNumber.Text)) == 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('该订单不存在！')", true);
                return;
            }
            if (txtRegisterNumber.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('检验订单编号不能为空！')", true);
                return;
            }
            if (txtInspector.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('检验人名称不能为空！')", true);
                return;
            }
            if (txtLocation.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('地点不能为空！')", true);
                return;
            }
            if (txtInspectionContent.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('检验内容不能为空！')", true);
                return;
            }
            #endregion

            //获取要插入的数据
            InspectLog model = new InspectLog();
            model.LogNumber = txtLogNumber.Text.Trim();
            model.RegisterNumber = txtRegisterNumber.Text.Trim();
            model.Inspector = txtInspector.Text.Trim();
            model.InspectionContent = txtInspectionContent.Text.Trim();
            model.Location = txtLocation.Text.Trim();
            model.Time = DateTime.Now;
            //model.Remark = txtRemark.Text;

            object o = InspectLogDAL.Insert(model);

            if (o != null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('保存成功！')", true);
                Response.Redirect("InspectionStatusManagementForm.aspx");
            }
        }
        private void upLoadImage() { 
        
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if ((int)SqlHelper.GetCountNumber("InspectLog", "ID", string.Format("LogNumber='{0}'", txtLogNumber.Text)) != 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('该日志编号已经存在！')", true);
                return;
            }
            if ((int)SqlHelper.GetCountNumber("InspectionRegistration", "ID", string.Format("RegisterNumber='{0}'", txtRegisterNumber.Text)) == 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('该订单不存在！')", true);
                return;
            }
            if (txtRegisterNumber.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('检验订单编号不能为空！')", true);
                return;
            }
            if (txtInspector.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('检验人名称不能为空！')", true);
                return;
            }
            if (txtLocation.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('地点不能为空！')", true);
                return;
            }
            if (txtInspectionContent.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('检验内容不能为空！')", true);
                return;
            }
            if (hiddenIdEdit.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('编辑失败！')", true);
                return;
            }
            int id = Convert.ToInt32(hiddenIdEdit.Text.Trim());
            InspectLog model = InspectLogDAL.GetByID(id);
            if (model != null)
            {
                hiddenIdEdit.Text = "";
                model.LogNumber = txtLogNumber.Text.Trim();
                model.Inspector = Session["UserName"].ToString();
                model.Time = DateTime.Now;
              //  model.Remark = txtRemark.Text.Trim();
                model.Location = txtLocation.Text.Trim();
                model.InspectionContent = txtInspectionContent.Text.Trim();
                if (InspectLogDAL.Update(model)>0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('保存成功！')", true);
                    Response.Redirect("InspectionStatusManagementForm.aspx");
                }
            }
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("InspectionStatusManagementForm.aspx");
        }
    }
}