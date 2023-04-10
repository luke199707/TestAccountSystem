using CommonHelper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TestAccountSystem.BLL;
using TestAccountSystem.DAL;
using TestAccountSystem.Model;

namespace TestAccountSystem
{
    public partial class CustomerManager : System.Web.UI.Page
    {
        public string GetState(string bl1, string bl2)
        {
            string result;
            if (bl1 == "True" && bl2 == "True")
            {
                result = "可用";
            }
            else
            {
                result = "禁用";
            }
            return result;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("AdminLayout/Redirect.aspx?type=reLogin");
                return;
            }
            if (!IsPostBack)
            {
                txtUnable();
                btnIsVisible(true, false, false, true, false, false, true);
                BindGridView();
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
            string condition = "1=1 " + queryCondition.Text.Trim();
            // MsgDal dao = new MsgDal();
            int totals = (int)SqlHelper.GetCountNumber("Customer", "Id", condition);
            if (totals > 0)
            {
                AspNetPager1.RecordCount = totals;
                DataTable dt = SqlHelper.GetPagedDataTable("Customer", condition, sortExpression, isASCDirection, AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);//AspNetPager1.EndRecordIndex
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
            dt.Columns.Add("userName");
            dt.Columns.Add("Email");
            dt.Columns.Add("CompanyName");
            dt.Columns.Add("isUseful");
            dt.Columns.Add("State");
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
            for (int i = 0; i < gvTable.Rows.Count; i++)
            {
                Literal literal = gvTable.Rows[i].FindControl("lState") as Literal;
                LinkButton btnBan = gvTable.Rows[i].FindControl("LbtnBan") as LinkButton;
                LinkButton btnAllow = gvTable.Rows[i].FindControl("LbtnAllow") as LinkButton;
                if (literal.Text == "可用")
                {
                    btnBan.Visible = true;
                }
                else
                {
                    btnAllow.Visible = true;
                }
            }

        }
        protected void gvTable_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = int.Parse(e.CommandArgument.ToString());
            if (e.CommandName == "btnDetailCommand")
            {
                ShowDetail(Convert.ToInt32(e.CommandArgument));               
            }
            if (e.CommandName == "btnBan")//禁用
            {
                BanOrAllow(id, false);
            }
            if (e.CommandName == "btnAllow")//启用
            {
                BanOrAllow(id, true);
            }
        }
        private void BanOrAllow(int id, bool bol)
        {
           Customer modle= CustomerDAL.GetById(id);
            modle.isUseFul = bol;
            CustomerDAL.Update(modle);
           AllUser model= AllUserDAL.GetByName(modle.userName);
            model.isUseful = bol;
            AllUserDAL.Update(model);
            BindGridView();
        }
        private void Refresh()
        {

            BindGridView();
            txtClear();
            txtUnable();
            btnIsVisible(true, false, false, true, false, false, true);
        }
        private void ShowDetail(int id)
        {
            txtId.Text = id.ToString();
            Customer model = CustomerDAL.GetById(id);
            txtName.Text = model.userName;
            txtEmail.Text = model.email;
            txtCompanyId.Text = model.customerNumber;
            txtCompanyName.Text = model.companyName;
            txtCompanyAddress.Text = model.address;
            txtOpenBank.Text = model.openUnit;
            txtBankAccount.Text = model.bankAccount;
            txtPerson.Text = model.legalPerson;
            txtPhone.Text = model.phone;

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
            IRid.Text = Convert.ToString(model.id);
        }
        private void txtUnable()
        {
            txtName.Attributes.Add("disabled", "disabled");
            txtEmail.Attributes.Add("disabled", "disabled");
            txtCompanyId.Attributes.Add("disabled", "disabled");
            txtCompanyName.Attributes.Add("disabled", "disabled");
            txtCompanyAddress.Attributes.Add("disabled", "disabled");
            txtOpenBank.Attributes.Add("disabled", "disabled");
            txtBankAccount.Attributes.Add("disabled", "disabled");
            txtPerson.Attributes.Add("disabled", "disabled");
            txtPhone.Attributes.Add("disabled", "disabled");
        }
        private void txtAble()
        {
            txtName.Attributes.Remove("disabled");
            txtEmail.Attributes.Remove("disabled");
            txtCompanyId.Attributes.Remove("disabled");
            txtCompanyName.Attributes.Remove("disabled");
            txtCompanyAddress.Attributes.Remove("disabled");
            txtOpenBank.Attributes.Remove("disabled");
            txtBankAccount.Attributes.Remove("disabled");
            txtPerson.Attributes.Remove("disabled");
            txtPhone.Attributes.Remove("disabled");
        }
        private void btnIsVisible(bool btn1, bool btn2, bool btn3, bool btn4, bool btn5, bool btn6, bool btn7)
        {
            btnAdd.Visible = btn1;
            btnAddSubmit.Visible = btn2;
            btnAddCancel.Visible = btn3;
            btnUpdate.Visible = btn4;
            btnUpSubmit.Visible = btn5;
            btnUpCancel.Visible = btn6;
            btnDel.Visible = btn7;
        }
        private void txtClear()
        {
            txtId.Text = "";
            txtName.Text = "";
            txtEmail.Text = "";
            txtCompanyId.Text = "";
            txtCompanyName.Text = "";
            txtCompanyAddress.Text = "";
            txtOpenBank.Text = "";
            txtBankAccount.Text = "";
            txtPerson.Text = "";
            txtPhone.Text = "";
        }
        //搜索
        protected void Button1_Click(object sender, EventArgs e)
        {
            queryCondition.Text = SearchHelper.ApproxSearch("Customer", TextBox1.Text);
            BindGridView();
        }
        //添加
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            txtClear();
            txtAble();
            btnIsVisible(false, true, true, false, false, false, false);
        }
        //添加按钮的提交
        protected void btnAddSubmit_Click(object sender, EventArgs e)
        {
            string username = txtName.Text.Trim();
            if (username == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('用户名不能为空！');bindDatePicker()", true);
                return;
            }
            string email = txtEmail.Text.Trim();
            if (email == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('邮箱用来找回密码用，不能为空！');bindDatePicker()", true);
                return;
            }
            if (CustomerDAL.GetByName(username) != null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('用户名已经存在！');bindDatePicker()", true);
                return;
            }
            if (CustomerDAL.GetByNameEmail(email) != null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('此邮箱已经存在！');bindDatePicker()", true);
                return;
            }
            Customer cu = new Customer();
            AllUser al = new AllUser();
            cu.userName = al.userName = username;
            cu.pwd = al.pwd = common.GetStringToMD5("123");
            cu.email = al.email = email;
            cu.customerNumber = txtCompanyId.Text.Trim();
            cu.companyName = txtCompanyName.Text.Trim();
            cu.address = txtCompanyAddress.Text.Trim();
            cu.openUnit = txtOpenBank.Text.Trim();
            cu.bankAccount = txtBankAccount.Text.Trim();
            cu.legalPerson = txtPerson.Text.Trim();
            cu.phone = txtPhone.Text.Trim();
            cu.state = al.state = true;
            cu.isUseFul = al.isUseful = true;
            al.roleId = 1;
            if (CustomerDAL.Insert(cu) != null)
            {
                if (AllUserDAL.Insert(al) != null)
                {
                    InsertLog("添加客户", "添加了一个客户信息:"+al.userName);
                    //try
                    //{
                    //    LogBLL.LogInsert(Session["UserName"].ToString(), "添加客户", "添加了一个客户信息", Session["roleId"].ToString());

                    //}
                    //catch (Exception)
                    //{

                    //    throw;
                    //}
                    //Refresh();
                    //Response.Redirect("CustomerManager.aspx");
                }

            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('添加客户失败了！');bindDatePicker()", true);
                return;
            }
        }
        //添加按钮的取消
        protected void btnAddCancel_Click(object sender, EventArgs e)
        {
            txtClear();
            txtUnable();
            btnIsVisible(true, false, false, true, false, false, true);
        }
        //修改
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (txtId.Text.Trim() == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('未选中任何信息，无法修改！');bindDatePicker()", true);
                return;
            }
            btnIsVisible(false, false, false, false, true, true, false);
            txtAble();
        }
        //修改的保存
        protected void btnUpSubmit_Click(object sender, EventArgs e)
        {
            string username = txtName.Text.Trim();
            if (username == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('用户名不能为空！');bindDatePicker()", true);
                return;
            }
            string email = txtEmail.Text.Trim();
            if (email == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('邮箱用来找回密码用，不能为空！');bindDatePicker()", true);
                return;
            }
            if ((int)SqlHelper.GetCountNumber("customer", "ID", string.Format("username='{0}' and ID<>{1}", username, txtId.Text.Trim())) != 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "key", "alert('用户名已经存在！')", true);
                return;
            }
            Customer customer = CustomerDAL.GetById(int.Parse(txtId.Text.Trim()));
            int alluserid = (int)AllUserDAL.GetId(customer.userName, customer.pwd);
            Customer cu = new Customer();
            //AllUser al = new AllUser();
            //al.id = alluserid;
            cu.id = int.Parse(txtId.Text.Trim());
            cu.userName = username;
            cu.email = email;
            cu.customerNumber = txtCompanyId.Text.Trim();
            cu.companyName = txtCompanyName.Text.Trim();
            cu.address = txtCompanyAddress.Text.Trim();
            cu.openUnit = txtOpenBank.Text.Trim();
            cu.bankAccount = txtBankAccount.Text.Trim();
            cu.legalPerson = txtPerson.Text.Trim();
            cu.phone = txtPhone.Text.Trim();
            if (CustomerDAL.UpdatePart(cu) > 0)
            {
                if (AllUserDAL.Update(cu.email, cu.userName, alluserid) > 0)
                {
                    InsertLog("修改客户信息", "修改了一个客户信息:"+cu.id);
                    //try
                    //{
                    //    LogBLL.LogInsert(Session["UserName"].ToString(), "修改客户信息", "修改了一个客户信息", Session["roleId"].ToString());

                    //}
                    //catch (Exception)
                    //{

                    //    throw;
                    //}
                    //Refresh();
                    //Response.Redirect("CustomerManager.aspx");
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('用户信息修改失败！');bindDatePicker()", true);
                return;
            }
        }
        //修改的取消
        protected void btnUpCancel_Click(object sender, EventArgs e)
        {
            txtClear();
            txtUnable();
            btnIsVisible(true, false, false, true, false, false, true);
        }
        //删除
        protected void btnDel_Click(object sender, EventArgs e)
        {
            if (txtId.Text.Trim() == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('未选中任何信息，无法删除！');bindDatePicker()", true);
                return;
            }
            int id = int.Parse(txtId.Text.Trim());
            Customer customer = CustomerDAL.GetById(id);
            int alluserid = (int)AllUserDAL.GetId(customer.userName, customer.pwd);
            if (CustomerDAL.DeleteById(id) > 0)
            {
                if (AllUserDAL.DeleteById(alluserid) > 0)
                {
                    InsertLog("删除客户","删除客户："+customer.userName);
                    //Response.Redirect("CustomerManager.aspx");
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('客户信息删除失败！');bindDatePicker()", true);
                return;
            }
        }
        private void InsertLog(string operation, string description)
        {
            try
            {
                LogBLL.LogInsert(Session["UserName"].ToString(), operation, description, Session["roleId"].ToString());
            }
            catch (Exception)
            {
            }
            finally
            {
                Refresh();
            }
        }
    }
}