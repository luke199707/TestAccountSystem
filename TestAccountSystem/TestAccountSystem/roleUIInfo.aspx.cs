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
using Wuqi.Webdiyer;
namespace TestAccountSystem
{
    public partial class roleUIInfo : System.Web.UI.Page
    {
        public string _Id="1";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["Id"]!=null)
            {
                _Id = Request.QueryString["Id"];
            }
            
            if (Session["UserName"] == null)
            {
                Response.Redirect("AdminLayout/Redirect.aspx?type=reLogin");
                return;
            }
            if (!IsPostBack)
            {
                bindData();
                btnIsVisible(true, false, false, true, false, false, true);
                txtRoleName.Attributes.Add("disabled", "disabled");
            }
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
            bindData();
        }
        private void Refresh()
        {
            bindData();
            btnIsVisible(true, false, false, true, false, false, true);
            txtRoleName.Attributes.Add("disabled", "disabled");
            txtClear();
        }
        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            bindData();
        }
        protected void ddlpagesize_SelectedIndexChanged(object sender, EventArgs e)
        {
            AspNetPager1.PageSize = Convert.ToInt32(ddlpagesize.SelectedValue);
            bindData();
        }
        private void bindData()
        {
            string sortExpression = gvTable.Attributes["SortExpression"] == null ? "ID" : gvTable.Attributes["SortExpression"];
            bool isASCDirection = gvTable.Attributes["SortDirection"] == "ASC" ? false : true;
            string condition = "1=1" + queryCondition.Text;
            int totals = (int)SqlHelper.GetCountNumber("roleinfo", "Id", condition);
            if (totals > 0)
            {
                AspNetPager1.RecordCount = totals;
                DataTable dt = SqlHelper.GetPagedDataTable("roleinfo", condition, sortExpression, isASCDirection, AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
                gvTable.DataSource = dt;
                gvTable.DataBind();
            }
            else
            {
                AspNetPager1.RecordCount = 0;
                ShowGridViewTitle();
            }

        }
        private void ShowGridViewTitle()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Id");
            dt.Columns.Add("roleId");
            dt.Columns.Add("roleName");

            if (dt.Rows.Count == 0)
            {
                DataRow dr = dt.NewRow();
                dt.Rows.Add(dr);
            }
            gvTable.DataSource = dt;
            gvTable.DataBind();
            gvTable.Rows[0].Visible = false;
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
        //添加按钮
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            txtRoleName.Attributes.Remove("disabled");
            txtClear();
            btnIsVisible(false, true, true, false, false, false, false);
        }
        //添加按钮中的提交按钮
        protected void btnAddSubmit_Click(object sender, EventArgs e)
        {
            int roleid = (int)RoleInfoDAL.GetRoleId() + 1;
            string name = txtRoleName.Text.Trim();
            RoleInfo info = RoleInfoDAL.GetByName(name);
            RoleInfo model = new RoleInfo();

            if (name != "" && info == null)
            {
                model.roleId = roleid;
                model.roleName = name;
                if ((int)RoleInfoDAL.Insert(model) > 0)
                {
                    //LogBLL.LogInsert(Session["UserName"].ToString(), "添加角色", "添加了一个角色信息", Session["roleId"].ToString());
                    //添加成功
                    // Response.Redirect("roleUIInfo.aspx");
                    //  Refresh();
                    InsertLog("添加角色","添加角色成功："+name);
                }
                else
                {
                    //添加失败
                    //_strMsg = "<script>alert('添加角色失败了');</script>";
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('添加失败，请重新尝试！');bindDatePicker()", true);
                }

            }
            else
            {
                //文本框或用户名重复为空，提醒用户
                // _strMsg = "<script>alert('文本框或角色名重复，请重新添加');</script>";
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('文本框或角色名重复，请重新添加！');bindDatePicker()", true);
            }
            txtClear();
            btnIsVisible(true, false, false, true, false, false, true);
        }
        //添加按钮中的取消按钮
        protected void btnAddCancel_Click(object sender, EventArgs e)
        {
            txtRoleName.Attributes.Add("disabled", "disabled");
            txtClear();
            btnIsVisible(true, false, false, true, false, false, true);
        }
        //修改按钮 
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            //int id = int.Parse(txtId.Text.Trim().ToString());
            if (txtId.Text.Trim().ToString() == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('未选中任何信息，无法修改！');bindDatePicker()", true);
                return;
            }
            txtRoleName.Attributes.Remove("disabled");
            btnIsVisible(false, false, false, false, true, true, false);
        }
        //修改中的保存按钮
        protected void btnUpSubmit_Click(object sender, EventArgs e)
        {
            txtRoleName.Attributes.Add("disabled", "disabled");
            string rolename = txtRoleName.Text.Trim();
            int roleId = int.Parse(txtRoleId.Text.Trim());
            int id = int.Parse(txtId.Text.Trim() ?? "0");
            if ((int)SqlHelper.GetCountNumber("RoleInfo", "ID", string.Format("roleName='{0}' and ID<>{1}", rolename, txtId.Text.Trim())) != 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "key", "alert('角色名称已经存在！')", true);
                return;
            }

            RoleInfo model = new RoleInfo();
            model.id = id;
            model.roleId = roleId;
            model.roleName = rolename;
            if (RoleInfoDAL.Update(model) > 0)
            {
                // LogBLL.LogInsert(Session["UserName"].ToString(), "修改角色信息", "修改了一个角色信息", Session["roleId"].ToString());
                // Refresh();
                // Response.Redirect("roleUIInfo.aspx");
                InsertLog("修改角色信息","修改了一个角色信息:"+model.roleName);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('修改信息失败，请重新尝试！');bindDatePicker()", true);
            }

            txtClear();
            btnIsVisible(true, false, false, true, false, false, true);
        }
        //修改中的取消按钮
        protected void btnUpCancel_Click(object sender, EventArgs e)
        {

            txtRoleName.Attributes.Add("disabled", "disabled");
            btnIsVisible(true, false, false, true, false, false, true);
        }
        //删除按钮
        protected void btnDel_Click(object sender, EventArgs e)
        {
            if (txtId.Text.Trim().ToString() == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('未选中任何信息，无法删除！');bindDatePicker()", true);
                return;
            }
            int id = int.Parse(txtId.Text ?? "0");
            if (RoleInfoDAL.DeleteById(id) > 0)
            {
                //  LogBLL.LogInsert(Session["UserName"].ToString(), "删除角色", "删除了一个角色信息", Session["roleId"].ToString());
                //Response.Redirect("roleUIInfo.aspx");
                //  Refresh();
                InsertLog("删除角色","删除角色成功:"+id);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('删除失败，请重新尝试！');bindDatePicker()", true);
            }
        }
        //搜索按钮-----模糊查询
        protected void Button1_Click(object sender, EventArgs e)
        {
            queryCondition.Text = SearchHelper.ApproxSearch("RoleInfo", TextBox1.Text.Trim());
            bindData();
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
        private void ShowDetail(int id)
        {
            //txtRoleName.Attributes.Remove("disabled");
            // txtId.Text = id.ToString();
            RoleInfo info = RoleInfoDAL.GetById(id);
            txtRoleName.Text = info.roleName;
            txtId.Text = info.id.ToString();
            txtRoleId.Text = info.roleId.ToString();
            //   TextBox1.Text = "name";
            //数据行的交替显示     GridViewUser.Rows.Count是数据行的总行数
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
            IRid.Text = Convert.ToString(info.id);
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
                //Response.Redirect("roleUIInfo.aspx");
                Refresh();
            }


        }
        private void txtClear()
        {
            txtId.Text = "";
            txtRoleId.Text = "";
            txtRoleName.Text = "";
        }
        protected void gvTable_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "btnDetailCommand")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                ShowDetail(id);
            }
        }
    }
}