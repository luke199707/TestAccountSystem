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
    public partial class department : System.Web.UI.Page
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
                BindGridView();
                txtUnable();
                btnAble(true, false, false, true, false, false, true);
                BindDropdownList();
            }
        }
        public string GetUnitName(string unitId) {
           UnitInfo model= UnitInfoDAL.GetNameByUnitId(unitId);
            if (model==null)
            {
                return "";
            }
            else
            {
                return model.unitName;
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
        protected void BindDropdownList()
        {
            //DataTable dtsex = SqlHelper.Select("*", "UnitInfo", string.Format("Name='{0}'", "性别"), "ID ASC");
            //dtsex = SqlHelper.Select("*", "UnitInfo", string.Format("ParentID={0}", dtsex.Rows[0]["ID"]), "ID ASC");
            DataTable dtsex = SqlHelper.Select("*", "UnitInfo", "1=1", "ID ASC");
            //int parentid = Convert.ToInt32(dtsex.Rows[0]["ID"]);
            //List<IR_StandardTerm> Sex = IR_StandardTermDAL.GetByParentID(parentid);
            DropDownList1.DataSource = dtsex;
            DropDownList1.DataTextField = "unitName";
            DropDownList1.DataValueField = "unitId";
            DropDownList1.DataBind();
            ListItem itemsex = new ListItem("请选择", "-1");
            DropDownList1.Items.Insert(0, itemsex);
            DropDownList1.SelectedIndex = 0;
        }
        private void BindGridView()
        {
            string sortExpression = gvTable.Attributes["SortExpression"] == null ? "ID" : gvTable.Attributes["SortExpression"];
            bool isASCDirection = gvTable.Attributes["SortDirection"] == "ASC" ? false : true;
            string condition = "1=1" + queryCondition.Text.Trim();
            // MsgDal dao = new MsgDal();
            int totals = (int)SqlHelper.GetCountNumber("DEPARTMENT", "Id", condition);
            if (totals > 0)
            {
                AspNetPager1.RecordCount = totals;
                DataTable dt = SqlHelper.GetPagedDataTable("DEPARTMENT", condition, sortExpression, isASCDirection, AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);//AspNetPager1.EndRecordIndex
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
            dt.Columns.Add("dId");
            dt.Columns.Add("dName");
            dt.Columns.Add("unitId");
            dt.Columns.Add("remark1");
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
            DropDownList1.SelectedIndex = 0;
            //UnitInfo info = UnitInfoDAL.GetById(id);
            Department info = DepartmentDAL.GetById1(id);
            if (info == null)
            {
                Department depmodel = DepartmentDAL.GetById(id);
                txtHiddenId.Text = id.ToString();
                txtId.Text = depmodel.dId;
                txtName.Text = depmodel.dName;
                // TextBox2.Text = info.unitId;
                txtRemark.Text = depmodel.remark1;
                //DropDownList1.Text = info.unitId;
            }
            else
            {
                txtHiddenId.Text = id.ToString();
                txtId.Text = info.dId;
                txtName.Text = info.dName;
                // TextBox2.Text = info.unitId;
                txtRemark.Text = info.remark1;
                DropDownList1.Text = info.unitId;
                
            }
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
            //   TextBox2.Attributes.Add("disabled", "disabled");
            txtRemark.Attributes.Add("disabled", "disabled");
            DropDownList1.Attributes.Add("disabled", "disabled");
        }
        private void txtAble()
        {
            txtId.Attributes.Remove("disabled");
            txtName.Attributes.Remove("disabled");
            // TextBox2.Attributes.Remove("disabled");
            txtRemark.Attributes.Remove("disabled");
            DropDownList1.Attributes.Remove("disabled");
        }
        private void txtClear()
        {
            txtHiddenId.Text = "";
            txtId.Text = "";
            txtName.Text = "";
            //  TextBox2.Text = "";
            txtRemark.Text = "";
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
            Department model = DepartmentDAL.GetMaxDid();
            if (model == null)
            {
                CodeRegulation1 cr = CodeRegulationDAL.GetByName("部门编码规则");
                if (cr == null)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('部门编码规则为空！');bindDatePicker()", true);
                    return;
                }
                txtId.Text = cr.example;
            }
            else
            {
                txtId.Text = CodeRegulationDAL.GetCode("部门编码规则", model.dId);
            }

            btnAble(false, true, true, false, false, false, false);
        }

        //添加按钮的提交按钮
        protected void btnAddSubmit_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedIndex == 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('您还未选择所属分社！');bindDatePicker()", true);
                return;
            }
            Department model = new Department();
            //start----------生成编码规则

            //model.dId = CodeRegulationDAL.GetCode("部门编码规则", DepartmentDAL.GetMaxDid().dId);

            //end
            model.dId = txtId.Text.Trim();
            model.dName = txtName.Text.Trim();
            string str = DropDownList1.SelectedValue.ToString().Trim();//拿到下拉列表选项对应的value值
            model.unitId = str;
            if (model.dId == "" || model.dName == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('编号或名称不能为空，请重新填写！');bindDatePicker()", true);
                return;
            }
            //查询部门是否已经存在了
            if (DepartmentDAL.QueryByIdAndName(model.dId, model.dName) != null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('编号已存在，请重新填写！');bindDatePicker()", true);
                return;
            }
            //------------
            if (DepartmentDAL.QueryByIdAndName1(model.unitId, model.dName) != null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('此分设已经存在此部门，请重新填写！');bindDatePicker()", true);
                return;
            }

            model.remark1 = txtRemark.Text.Trim();
            if (DepartmentDAL.Insert(model) != null)
            {
                txtClear();
                //try
                //{
                //    LogBLL.LogInsert(Session["UserName"].ToString(), "添加部门", "添加了一个部门信息", Session["roleId"].ToString());

                //}
                //catch (Exception)
                //{

                //    throw;
                //}
                ////Response.Redirect("department.aspx");
                //Refresh();
                InsertLog("添加部门","添加了一个部门信息："+model.dName);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('添加失败了，请重新填写！');bindDatePicker()", true);
                return;
            }
            #region
            //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('编号或名称已存在，请重新填写！');bindDatePicker()", true);
            /* UnitInfo model = new UnitInfo();
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
             model.unitLevel = TextBox2.Text.Trim();
             model.superiorUnits = txtRemark.Text.Trim();
             if (UnitInfoDAL.Insert(model) != null)
             {
                 Response.Redirect("department.aspx");

             }
             else
             {
                 ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('添加失败了！');bindDatePicker()", true);
                 return;
             }
            */
            #endregion
        }
        private void Refresh()
        {
            BindGridView();
            txtUnable();
            btnAble(true, false, false, true, false, false, true);
            BindDropdownList();
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

            // UnitInfo model = new UnitInfo();
            Department model = new Department();
            model.id = int.Parse(txtHiddenId.Text.Trim() ?? "0");
            model.dId = txtId.Text.Trim();
            model.dName = txtName.Text.Trim();
            if (model.dId == "" || model.dName == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('编号或名称不能为空！');bindDatePicker()", true);
                return;
            }
            //  model.unitId = TextBox2.Text.Trim();
            model.unitId = DropDownList1.SelectedValue.ToString();
            model.remark1 = txtRemark.Text.Trim();
            if (DepartmentDAL.Update(model) > 0)
            {
                txtClear();
                // LogBLL.LogInsert(Session["UserName"].ToString(), "修改部门", "修改了一个部门信息", Session["roleId"].ToString());
                // Response.Redirect("department.aspx");
                // Refresh();
                InsertLog("修改部门","修改了一个部门信息:"+model.dName);
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
            if (DepartmentDAL.DeleteById(id) > 0)
            {
                txtClear();
                // LogBLL.LogInsert(Session["UserName"].ToString(), "删除部门", "删除添加了一个部门信息", Session["roleId"].ToString());
                // Response.Redirect("department.aspx");
                //Refresh();
                InsertLog("删除部门","删除了一个部门信息："+id);
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
            queryCondition.Text = SearchHelper.ApproxSearch("DEPARTMENT", TextBox1.Text);
            BindGridView();
        }
    }
}