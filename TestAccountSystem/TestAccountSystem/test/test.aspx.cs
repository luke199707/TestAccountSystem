using System;
using CommonHelper;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TestAccountSystem.DAL;
using TestAccountSystem.Model;
using System.Data;
using TestAccountSystem.BLL;

namespace TestAccountSystem.test
{
    public partial class test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["UserName"] == null)
            //{
            //    Response.Redirect("AdminLayout/Redirect.aspx?type=reLogin");
            //    return;
            //}
            if (!IsPostBack)
            {
                BindGridView();
                txtUnable();
                btnAble(true, false, false, true, false, false, true);
            }
        }
        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            BindGridView();
        }
        protected void ddlpagesize_SelectedIndexChanged(object sender, EventArgs e)
        {
            AspNetPager1.PageSize = Convert.ToInt32(ddlpagesize.SelectedValue);
            BindGridView();
        }
        private void BindGridView()
        {
            string sortExpression = gvTable.Attributes["SortExpression"] == null ? "ID" : gvTable.Attributes["SortExpression"];
            bool isASCDirection = gvTable.Attributes["SortDirection"] == "ASC" ? true : false;
            string condition = "1=1" + queryCondition.Text.Trim();
            // MsgDal dao = new MsgDal();
            int totals = (int)SqlHelper.GetCountNumber("UNITINFO", "Id", condition);
            if (totals > 0)
            {
                AspNetPager1.RecordCount = totals;
                DataTable dt = SqlHelper.GetPagedDataTable("UNITINFO", condition, sortExpression, isASCDirection, AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);//AspNetPager1.EndRecordIndex
                gvTable.DataSource = dt;
                gvTable.DataBind();
            }
            else
            {
                AspNetPager1.RecordCount = totals;
                ShowGridViewTitle();
            }

            #region
            //   DataTable dt = SqlHelper.GetPagedDataTable("Msg", condition, sortExpression, isASCDirection, AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);//AspNetPager1.EndRecordIndex
            //   gvTable.DataSource = dt;
            // gvTable.DataBind();
            // string condition = "1 = 1" + queryCondition.Text;
            //  int totalCounts = (int)SqlHelper.GetCountNumber("IR_IntroductionLetter", "ID", condition);
            //if (totalCounts > 0)
            //{
            //   // AspNetPager1.RecordCount = totalCounts;
            //    DataTable dt = SqlHelper.GetPagedDataTable("IR_IntroductionLetter", condition, sortExpression, isASCDirection, AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
            //    gvTable.DataSource = dt;
            //    gvTable.DataBind();

            //}
            //else
            //{
            //    AspNetPager1.RecordCount = totalCounts;
            //    ShowGridViewTitle();
            //}
            #endregion
        }
        private void ShowGridViewTitle()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Id");
            dt.Columns.Add("unitId");
            dt.Columns.Add("unitName");
            dt.Columns.Add("postalCode");
            dt.Columns.Add("address");
            if (dt.Rows.Count == 0)
            {
                DataRow dr = dt.NewRow();
                dt.Rows.Add(dr);
            }
            gvTable.DataSource = dt;
            gvTable.DataBind();
            gvTable.Rows[0].Visible = false;
        }
        protected void gvTable_Sorting(object sender, GridViewSortEventArgs e)
        {
            string sortExpression = e.SortExpression.ToString();
            string sortDirection = "ASC";
            if (sortExpression == gvTable.Attributes["SortExpression"])
            {
                sortDirection = (gvTable.Attributes["SortDirection"].ToString() == sortDirection ? "DESC" : "ASC");
            }
            gvTable.Attributes["SortExpression"] = sortExpression;
            gvTable.Attributes["SortDirection"] = sortDirection;
            BindGridView();
        }
        protected void gvTable_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            Button btnDetail = e.Row.FindControl("btnDetail") as Button;

            if (btnDetail != null)
            {
                //把该行的onclick事件绑定成按钮的点击事件
                e.Row.Attributes["onclick"] = String.Format("javascript:document.getElementById('{0}').click()", btnDetail.ClientID);
                //鼠标样子
                e.Row.Attributes["style"] = "cursor:pointer";
            }

        }
        protected void gvTable_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "btnDetailCommand")
            {
                ShowDetail(Convert.ToInt32(e.CommandArgument));
            }
        }

        private void ShowDetail(int id)
        {
            UnitInfo info = UnitInfoDAL.GetById(id);
            txtHiddenId.Text = id.ToString();
            txtId.Text = info.unitId;
            txtName.Text = info.unitName;
            txtlevel.Text = info.unitLevel;
            txtUpCompany.Text = info.superiorUnits;
            txtPostalCode.Text = info.postalCode;
            txtOpenBank.Text = info.rmbOpenUnit;
            txtBankAccount.Text = info.rankAccount;
            txtFBank.Text = info.wOpenUnit;
            txtbankAccount2.Text = info.wbankAccount;
            txtFax.Text = info.faxNumber;
            txtEmail.Text = info.unitEmaill;
            txtPerson.Text = info.person;
            txtphone.Text = info.pPhone;
            txtAddress.Text = info.address;
            for (int i = 0; i < gvTable.Rows.Count; i++)
            {
                if (i % 2 == 0)
                {
                    gvTable.Rows[i].BackColor = gvTable.RowStyle.BackColor;
                }
                else
                {
                    gvTable.Rows[i].BackColor = gvTable.AlternatingRowStyle.BackColor;
                }
                Literal literalId = this.gvTable.Rows[i].FindControl("LiteralId") as Literal;

                //如果是显示行则背景色为黄色
                if (Convert.ToInt32(literalId.Text) == id)
                {
                    gvTable.Rows[i].BackColor = System.Drawing.Color.LightYellow;
                }
            }
        }
        private void txtUnable()
        {
            txtId.Attributes.Add("disabled", "disabled");
            txtName.Attributes.Add("disabled", "disabled");
            txtlevel.Attributes.Add("disabled", "disabled");
            txtUpCompany.Attributes.Add("disabled", "disabled");
            txtPostalCode.Attributes.Add("disabled", "disabled");
            txtOpenBank.Attributes.Add("disabled", "disabled");
            txtBankAccount.Attributes.Add("disabled", "disabled");
            txtFBank.Attributes.Add("disabled", "disabled");
            txtbankAccount2.Attributes.Add("disabled", "disabled");
            txtFax.Attributes.Add("disabled", "disabled");
            txtEmail.Attributes.Add("disabled", "disabled");
            txtPerson.Attributes.Add("disabled", "disabled");
            txtphone.Attributes.Add("disabled", "disabled");
            txtAddress.Attributes.Add("disabled", "disabled");
        }
        private void txtAble()
        {
            txtId.Attributes.Remove("disabled");
            txtName.Attributes.Remove("disabled");
            txtlevel.Attributes.Remove("disabled");
            txtUpCompany.Attributes.Remove("disabled");
            txtPostalCode.Attributes.Remove("disabled");
            txtOpenBank.Attributes.Remove("disabled");
            txtBankAccount.Attributes.Remove("disabled");
            txtFBank.Attributes.Remove("disabled");
            txtbankAccount2.Attributes.Remove("disabled");
            txtFax.Attributes.Remove("disabled");
            txtEmail.Attributes.Remove("disabled");
            txtPerson.Attributes.Remove("disabled");
            txtphone.Attributes.Remove("disabled");
            txtAddress.Attributes.Remove("disabled");
        }
        private void txtClear()
        {
            txtHiddenId.Text = "";
            txtId.Text = "";
            txtName.Text = "";
            txtlevel.Text = "";
            txtUpCompany.Text = "";
            txtPostalCode.Text = "";
            txtOpenBank.Text = "";
            txtBankAccount.Text = "";
            txtFBank.Text = "";
            txtbankAccount2.Text = "";
            txtFax.Text = "";
            txtEmail.Text = "";
            txtPerson.Text = "";
            txtphone.Text = "";
            txtAddress.Text = "";
        }
        private void btnAble(bool btn2, bool btn3, bool btn4, bool btn5, bool btn6, bool btn7, bool btn8)
        {
            btnAdd.Visible = btn2;
            btnAddSubmit.Visible = btn3;
            btnAddCancel.Visible = btn4;
            btnUpdate.Visible = btn5;
            btnUpSubmit.Visible = btn6;
            btnUpCancel.Visible = btn7;
            btnDel.Visible = btn8;
        }
        //添加按钮
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            txtClear();
            txtAble();
            txtId.Attributes.Add("disabled", "disabled");
            string maxId = UnitInfoDAL.GetMaxUnitId();
            if (maxId == null)
            {
                CodeRegulation1 model = CodeRegulationDAL.GetByName("分社编码规则");
                if (model == null)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('分社编码规则为空！');bindDatePicker()", true);
                    return;
                }
                maxId = model.example;
                txtId.Text = maxId;
            }
            else
            {
                txtId.Text = CodeRegulationDAL.GetCode("分社编码规则", maxId);
            }

            btnAble(false, true, true, false, false, false, false);
        }
        private void Refresh()
        {

            BindGridView();
            txtUnable();
            btnAble(true, false, false, true, false, false, true);
            txtClear();
        }
        //添加按钮的提交按钮
        protected void btnAddSubmit_Click(object sender, EventArgs e)
        {
            UnitInfo model = new UnitInfo();
            model.unitId = txtId.Text.Trim();
            model.unitName = txtName.Text.Trim();
            if (model.unitId == "" || model.unitName == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('编号或名称不能为空！');bindDatePicker()", true);
                return;
            }
            //需要添加一步验证公司编号和姓名是否重复
            if (UnitInfoDAL.QueryIdAndName(model.unitId, model.unitName) != null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('编号或名称已存在，请重新填写！');bindDatePicker()", true);
                return;
            }
            model.unitLevel = txtlevel.Text.Trim();
            model.superiorUnits = txtUpCompany.Text.Trim();
            model.postalCode = txtPostalCode.Text.Trim();
            model.rmbOpenUnit = txtOpenBank.Text.Trim();
            model.rankAccount = txtBankAccount.Text.Trim();
            model.wOpenUnit = txtFBank.Text.Trim();
            model.wbankAccount = txtbankAccount2.Text.Trim();
            model.faxNumber = txtFax.Text.Trim();
            model.unitEmaill = txtEmail.Text.Trim();
            model.person = txtPerson.Text.Trim();
            model.pPhone = txtphone.Text.Trim();
            model.address = txtAddress.Text.Trim();
            if (UnitInfoDAL.Insert(model) != null)
            {
                // LogBLL.LogInsert(Session["UserName"].ToString(), "添加分社", "添加了一个分社信息", Session["roleId"].ToString());
                //Response.Redirect("unitManager.aspx");
                //Refresh();
                InsertLog("添加分社信息","添加分社信息成功："+model.unitName);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('添加失败了！');bindDatePicker()", true);
                return;
            }
        }
        //添加按钮的取消按钮
        protected void btnAddCancel_Click(object sender, EventArgs e)
        {
            btnAble(true, false, false, true, false, false, true);
            txtClear();
            txtUnable();
        }
        //修改按钮
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (txtHiddenId.Text.Trim() == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('未选中任何信息，无法修改！');bindDatePicker()", true);
                return;
            }
            txtAble();
            txtId.Attributes.Add("disabled", "disabled");
            btnAble(false, false, false, false, true, true, false);
        }
        //修改后的保存按钮
        protected void btnUpSubmit_Click(object sender, EventArgs e)
        {

            UnitInfo model = new UnitInfo();
            model.id = int.Parse(txtHiddenId.Text.Trim() ?? "0");
            model.unitId = txtId.Text.Trim();
            model.unitName = txtName.Text.Trim();
            if (model.unitId == "" || model.unitName == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('编号或名称不能为空！');bindDatePicker()", true);
                return;
            }
            if ((int)SqlHelper.GetCountNumber("UnitInfo", "ID", string.Format("unitName='{0}' and ID<>{1}", model.unitName, txtHiddenId.Text.Trim())) != 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "key", "alert('分社名称已经存在！')", true);
                return;
            }
            model.unitLevel = txtlevel.Text.Trim();
            model.superiorUnits = txtUpCompany.Text.Trim();
            model.postalCode = txtPostalCode.Text.Trim();
            model.rmbOpenUnit = txtOpenBank.Text.Trim();
            model.rankAccount = txtBankAccount.Text.Trim();
            model.wOpenUnit = txtFBank.Text.Trim();
            model.wbankAccount = txtbankAccount2.Text.Trim();
            model.faxNumber = txtFax.Text.Trim();
            model.unitEmaill = txtEmail.Text.Trim();
            model.person = txtPerson.Text.Trim();
            model.pPhone = txtphone.Text.Trim();
            model.address = txtAddress.Text.Trim();
            if (UnitInfoDAL.Update(model) > 0)
            {
                txtClear();
                // LogBLL.LogInsert(Session["UserName"].ToString(), "修改分社", "修改了一个分社信息", Session["roleId"].ToString());
                //Response.Redirect("unitManager.aspx");
                // Refresh();
                InsertLog("修改分社信息","修改分社信息成功："+model.id);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('修改信息失败了！');bindDatePicker()", true);
                return;
            }


        }
        //修改的取消按钮
        protected void btnUpCancel_Click(object sender, EventArgs e)
        {
            txtClear();
            btnAble(true, false, false, true, false, false, true);
            txtUnable();
        }
        //删除按钮
        protected void btnDel_Click(object sender, EventArgs e)
        {
            if (txtHiddenId.Text.Trim() == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('未选中任何信息，无法删除！');bindDatePicker()", true);
                return;
            }
            int id = int.Parse(txtHiddenId.Text.Trim() ?? "0");
            if (UnitInfoDAL.DeleteById(id) > 0)
            {
                txtClear();
                // LogBLL.LogInsert(Session["UserName"].ToString(), "删除分社", "删除了一个分社信息", Session["roleId"].ToString());
                //Response.Redirect("unitManager.aspx");
                //  Refresh();
                InsertLog("删除分社","删除分社成功:"+id);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('删除失败，请重新尝试！');bindDatePicker()", true);
            }

        }
        private void InsertLog(string operation,string description) {
            try
            {
                LogBLL.LogInsert(Session["UserName"].ToString(), operation, description, Session["roleId"].ToString());
                //Response.Redirect("unitManager.aspx");
                // Refresh();
            }
            catch (Exception)
            {
            }
            finally {
                Refresh();
            }
        }
        //搜索按钮
        protected void Button1_Click(object sender, EventArgs e)
        {
            queryCondition.Text = SearchHelper.ApproxSearch("unitinfo", TextBox1.Text);
            BindGridView();
        }
    }
}