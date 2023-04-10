using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TestAccountSystem.DAL;
using TestAccountSystem.Model;
using CommonHelper;
using System.Data;
using TestAccountSystem.BLL;

namespace TestAccountSystem
{
    public partial class UserList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("AdminLayout/Redirect.aspx?type=reLogin");
                return;
            }
            if (!IsPostBack)
            {
                txtName.Attributes.Add("disabled", "disabled");
                txtEmail.Attributes.Add("disabled", "disabled");
                btnIsVisible(true, false, false, true, false, false, true);
                //isVisible(false,false,false,false);
                BindGridView();
                BindDropdownList();
                isAbled();
            }
        }
        private void Refresh()
        {
            txtName.Attributes.Add("disabled", "disabled");
            txtEmail.Attributes.Add("disabled", "disabled");
            txtClear();
            btnIsVisible(true, false, false, true, false, false, true);
            //isVisible(false,false,false,false);
            BindGridView();
            BindDropdownList();
            isAbled();
        }
        public object getRoleNameByRoleID(string roleid)
        {
            string result;
            switch (roleid)
            {
                case "1": result = "客户"; break;
                case "2": result = "验船师"; break;
                case "3": result = "单位领导"; break;
                case "4": result = "财务"; break;
                case "5": result = "系统管理员"; break;
                default:
                    result = "未知角色"; break;
            }
            return result;
        }
        protected void BindDropdownList()
        {
            //绑定角色类别
            DataTable dtsex = SqlHelper.Select("*", "RoleInfo", "1=1", "ID ASC");
            DropDownList1.DataSource = dtsex;
            DropDownList1.DataTextField = "roleName";
            DropDownList1.DataValueField = "roleName";
            DropDownList1.DataBind();
            ListItem itemsex = new ListItem("请选择", "-1");
            DropDownList1.Items.Insert(0, itemsex);
            DropDownList1.SelectedIndex = 0;

            //绑定所属分社
            DataTable dtsex1 = SqlHelper.Select("*", "UnitInfo", "1=1", "ID ASC");
            DropDownList2.DataSource = dtsex1;
            DropDownList2.DataTextField = "unitName";
            DropDownList2.DataValueField = "unitId";
            DropDownList2.DataBind();
            ListItem itemsex1 = new ListItem("请选择", "-1");
            DropDownList2.Items.Insert(0, itemsex1);
            DropDownList2.SelectedIndex = 0;


            DropDownList3.Items.Clear();
            DropDownList3.Items.Insert(0, itemsex1);
            DropDownList3.SelectedIndex = 0;

        }
        private void isVisible(bool b1, bool b2, bool b3, bool b4)
        {
            TextBox2.Visible = b1;
            DropDownList1.Visible = b2;
            DropDownList2.Visible = b3;
            DropDownList3.Visible = b4;
        }
        private void isAbled()
        {
            TextBox2.Attributes.Add("disabled", "disabled");
            DropDownList1.Attributes.Add("disabled", "disabled");
            DropDownList2.Attributes.Add("disabled", "disabled");
            DropDownList3.Attributes.Add("disabled", "disabled");
            txtRealName.Attributes.Add("disabled", "disabled");
        }
        private void useful()
        {
            TextBox2.Attributes.Remove("disabled");
            DropDownList1.Attributes.Remove("disabled");
            DropDownList2.Attributes.Remove("disabled");
            DropDownList3.Attributes.Remove("disabled");
            txtRealName.Attributes.Remove("disabled");
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
            string sortExpression = gvTable.Attributes["SortExpression"] == null ? "roleId" : gvTable.Attributes["SortExpression"];
            bool isASCDirection = gvTable.Attributes["SortDirection"] == "ASC" ? true : false;
            string condition = "1=1 and roleId!=1" + queryCondition.Text.Trim();
            // MsgDal dao = new MsgDal();
            int totals = (int)SqlHelper.GetCountNumber("AllUser", "Id", condition);
            if (totals > 0)
            {
                AspNetPager1.RecordCount = totals;
                DataTable dt = SqlHelper.GetPagedDataTable("AllUser", condition, sortExpression, isASCDirection, AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);//AspNetPager1.EndRecordIndex
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
            dt.Columns.Add("RoleId");
            dt.Columns.Add("isUseful");
            dt.Columns.Add("realName");
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
            { Literal literal = gvTable.Rows[i].FindControl("lState") as Literal;
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
        private void ShowDetail(int id)
        {
            clearDropDownList();
            txtId.Text = id.ToString();
            AllUser model = AllUserDAL.GetById(id);
            txtName.Text = model.userName;
            txtEmail.Text = model.email;
            txtRealName.Text = model.realName;
            RoleInfo info = RoleInfoDAL.GetByRoleId(model.roleId);
            try
            {
                DropDownList1.Text = info.roleName;
                if (model.remark != null)
                {
                    Department dep = DepartmentDAL.GetById2(int.Parse(model.remark));
                    DropDownList2.Text = dep.unitId;

                    BindDropDownList3(dep.unitId);
                    DropDownList3.Text = dep.dName;
                }
            }
            catch (Exception)
            {

            }
            finally
            {

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
                BanOrAllow(id,true);
            }
        }
        private void BanOrAllow(int id,bool bol) {
            AllUser model = AllUserDAL.GetById(id);
            model.isUseful = bol;
            AllUserDAL.Update(model);
            BindGridView();
        }
        //搜索
        protected void Button1_Click(object sender, EventArgs e)
        {
            queryCondition.Text = SearchHelper.ApproxSearch("AllUser", TextBox1.Text);
            BindGridView();
        }
        //添加
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            txtClear();
            txtName.Attributes.Remove("disabled");
            txtEmail.Attributes.Remove("disabled");
            btnIsVisible(false, true, true, false, false, false, false);
            useful();
            // clearDropDownList();
            DDLSelectIndex();
        }
        private void DDLSelectIndex() {
            DropDownList1.SelectedIndex = 0;
            DropDownList2.SelectedIndex = 0;
            DropDownList3.SelectedIndex = 0;
        }
        //添加的提交
        protected void btnAddSubmit_Click(object sender, EventArgs e)
        {
            AllUser model = new AllUser();
            model.userName = txtName.Text.Trim();
            model.realName = txtRealName.Text.Trim();
            if (AllUserDAL.GetByName(model.userName) != null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('用户名已存在，请重新添加！');bindDatePicker()", true);
                return;
            }
            if (model.userName.Trim() == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('用户名不能为空，请重新添加！');bindDatePicker()", true);
                return;
            }
            model.email = txtEmail.Text.Trim();
            if (AllUserDAL.GetByEmail(model.email) != null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('邮箱已存在，请重新添加！');bindDatePicker()", true);
                return;
            }
            model.pwd = common.GetStringToMD5(TextBox2.Text.Trim());
            if (model.pwd.Trim() == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('您还没有设置默认密码！');bindDatePicker()", true);
                return;
            }
            RoleInfo tmp = RoleInfoDAL.GetByName(DropDownList1.SelectedValue.ToString());
            if (tmp == null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('您还没有选择角色类别！');bindDatePicker()", true);
                return;
            }
            model.roleId = tmp.roleId;
            string unitId = DropDownList2.SelectedValue.ToString();
            string name = DropDownList3.SelectedValue.ToString();
            object obj = DepartmentDAL.QueryByIdAndName1(unitId, name);
            if (obj != null)
            {
                int id = Convert.ToInt32(obj);
                model.remark = id.ToString();
            }
            if (AllUserDAL.Insert1(model) != null)
            {
                Insertlog("添加用户","添加了一个用户信息");
                 //   LogBLL.LogInsert(Session["UserName"].ToString(), "添加用户", "添加了一个用户信息", Session["roleId"].ToString());
                // BindGridView();
                //Response.Redirect("UserList.aspx");

            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('添加失败了！');bindDatePicker()", true);
                return;
            }


        }
        //添加的取消
        protected void btnAddCancel_Click(object sender, EventArgs e)
        {
            txtClear();
            txtName.Attributes.Add("disabled", "disabled");
            txtEmail.Attributes.Add("disabled", "disabled");
            btnIsVisible(true, false, false, true, false, false, true);
            isAbled();
            DDLSelectIndex();
        }
        //修改
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (txtId.Text.Trim().ToString() == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('未选中任何信息，无法修改！');bindDatePicker()", true);
                return;
            }
            txtName.Attributes.Remove("disabled");
            txtEmail.Attributes.Remove("disabled");
            useful();
            TextBox2.Attributes.Add("disabled", "disabled");
            btnIsVisible(false, false, false, false, true, true, false);
        }
        //修改的保存
        protected void btnUpSubmit_Click(object sender, EventArgs e)
        {
            int id = int.Parse(txtId.Text);
            //  AllUser model = AllUserDAL.GetById(id);

            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            AllUser user = new AllUser();
            user.id = id;
            user.userName = name;
            user.email = email;
            user.realName = txtRealName.Text.Trim();
            RoleInfo info = RoleInfoDAL.GetByName(DropDownList1.SelectedValue.ToString());
            if (info == null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('未选中角色！');bindDatePicker()", true);
                return;
            }
            if ((int)SqlHelper.GetCountNumber("AllUser", "ID", string.Format("username='{0}' and ID<>{1}", name, txtId.Text.Trim())) != 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "key", "alert('用户名已经存在！')", true);
                return;
            }
            user.roleId = info.roleId;
            string unitId = DropDownList2.SelectedValue.ToString();
            string name1 = DropDownList3.SelectedValue.ToString();
            object obj = DepartmentDAL.QueryByIdAndName1(unitId, name1);
            if (obj != null)
            {
                int id1 = Convert.ToInt32(obj);
                user.remark = id1.ToString();
            }
            if (AllUserDAL.UpdateNameEmail(user) > 0)// 
            {
                Insertlog("修改用户", "修改了一个用户信息");
                //LogBLL.LogInsert(Session["UserName"].ToString(), "修改用户", "修改了一个用户信息", Session["roleId"].ToString());
                //Response.Redirect("UserList.aspx");
                //Refresh();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('修改失败！');bindDatePicker()", true);
                return;
            }
        }
        //修改的取消
        protected void btnUpCancel_Click(object sender, EventArgs e)
        {
            txtName.Attributes.Add("disabled", "disabled");
            txtEmail.Attributes.Add("disabled", "disabled");
            btnIsVisible(true, false, false, true, false, false, true);
            txtClear();
            isAbled();
            //  clearDropDownList();
            DDLSelectIndex();
        }
        private void clearDropDownList()
        {
            DropDownList3.Items.Clear();
            ListItem itemsex1 = new ListItem("请选择", "-1");
            DropDownList3.Items.Insert(0, itemsex1);
            DropDownList3.SelectedIndex = 0;
            DropDownList2.SelectedIndex = 0;
            DropDownList1.SelectedIndex = 0;
            #region
            //DropDownList1.Items.Clear();
            //DropDownList2.Items.Clear();
            //DropDownList3.Items.Clear();
            //ListItem itemsex1 = new ListItem("请选择", "-1");
            //DropDownList3.Items.Insert(0, itemsex1);
            //DropDownList1.Items.Insert(0, itemsex1);
            //DropDownList2.Items.Insert(0, itemsex1);
            #endregion
        }
        //删除
        protected void btnDel_Click(object sender, EventArgs e)
        {
            if (txtId.Text.Trim().ToString() == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('未选中任何信息，无法删除！');bindDatePicker()", true);
                return;
            }
            int id = int.Parse(txtId.Text ?? "0");
            if (AllUserDAL.DeleteById(id) > 0)
            {
                    Insertlog("删除用户", "删除了一个用户信息");
              
                // LogBLL.LogInsert(Session["UserName"].ToString(), "删除用户", "删除了一个用户信息", Session["roleId"].ToString());
                // Response.Redirect("UserList.aspx");

            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('删除失败，请重新尝试！');bindDatePicker()", true);
            }
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
            txtRoleId.Text = "";
            txtName.Text = "";
            txtEmail.Text = "";
            txtRealName.Text = "";
        }
        private void BindDropDownList3(string unitId)
        {
            DropDownList3.Items.Clear();
            DataTable dtsex1 = SqlHelper.Select("*", "Department", "unitId='" + unitId + "'", "ID ASC");
            DropDownList3.DataSource = dtsex1;
            DropDownList3.DataTextField = "dName";
            DropDownList3.DataValueField = "dName";
            DropDownList3.DataBind();
            ListItem itemsex1 = new ListItem("请选择", "-1");
            DropDownList3.Items.Insert(0, itemsex1);
            DropDownList3.SelectedIndex = 0;
        }
        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            string unitId = DropDownList2.SelectedValue.ToString();
            DataTable dtsex1 = SqlHelper.Select("*", "Department", "unitId='" + unitId + "'", "ID ASC");
            DropDownList3.DataSource = dtsex1;
            DropDownList3.DataTextField = "dName";
            DropDownList3.DataValueField = "dName";
            DropDownList3.DataBind();
            ListItem itemsex1 = new ListItem("请选择", "-1");
            DropDownList3.Items.Insert(0, itemsex1);
            DropDownList3.SelectedIndex = 0;
        }
        private void Insertlog(string operation, string description)
        {
            try
            {
                LogBLL.LogInsert(Session["UserName"].ToString(), operation, description, Session["roleId"].ToString());
            }
            catch (Exception)
            {
            }
            finally { Refresh(); }

        }
    }
}