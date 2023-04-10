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
    public partial class InspectLogManagementForm : System.Web.UI.Page
    {
        protected string id = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("../AdminLayout/Redirect.aspx?type=reLogin");
                return;
            }
            if (!IsPostBack)
            {
                ddlpagesize.SelectedValue = AspNetPager1.PageSize.ToString();
                gridviewbind();
            }
        }
        private void gridviewbind()
        {
            EmptyTxt();
            string sortExpression = grid.Attributes["SortExpression"] == null ? "LogNumber" : grid.Attributes["SortExpression"];
            bool isASCDirection = true;
            if (grid.Attributes["SortDirection"] == "DESC")
            {
                isASCDirection = false;
            }
            int totalCounts = (int)SqlHelper.GetCountNumber("InspectLog", "ID", "1=1");
            if (totalCounts > 0)
            {
                AspNetPager1.RecordCount = totalCounts;
                grid.DataSource = SqlHelper.GetPagedData("InspectLog", "1=1", sortExpression, isASCDirection,
                                    AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
                grid.DataBind();
            }
            else
            {
                ShowGridViewTitle();
            }
            //按钮的变化
            IsBtnVisible(true, false, false, true, false, false, true);
            Disabletxt();
        }

        private void IsBtnVisible(bool Add, bool Certain, bool AddCancel, bool Update, bool Save, bool UpdateCancel, bool Del)
        {
            btnAdd.Visible = Add;
            btnCertain.Visible = Certain;
            btnAddCancel.Visible = AddCancel;
            btnUpdate.Visible = Update;
            btnSave.Visible = Save;
            btnUpdateCancel.Visible = UpdateCancel;
            btnDel.Visible = Del;
        }

        //txt失效
        private void Disabletxt()
        {
            txtLogNumber.Attributes.Add("disabled", "");
            txtRegisterNumber.Attributes.Add("disabled", "");
            txtInspector.Attributes.Add("disabled", "");
            txtInspectionContent.Attributes.Add("disabled", "");
            txtLocation.Attributes.Add("disabled", "");
            txtRemark.Attributes.Add("disabled", "");
        }
        //txt有效
        private void Enabledtxt()
        {
            txtRegisterNumber.Attributes.Remove("disabled");
            txtInspector.Attributes.Remove("disabled");
            txtInspectionContent.Attributes.Remove("disabled");
            txtLocation.Attributes.Remove("disabled");
            txtRemark.Attributes.Remove("disabled");
        }
        private void EmptyTxt()
        {
            txtLogNumber.Text = "";
            txtRegisterNumber.Text = "";
            txtInspector.Text = "";
            txtInspectionContent.Text = "";
            txtLocation.Text = "";
            txtRemark.Text = "";
            hiddenid.Text = "";
        }
        private void ShowGridViewTitle()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("ID");
            dt.Columns.Add("LogNumber");
            dt.Columns.Add("RegisterNumber");
            dt.Columns.Add("Location");
            dt.Columns.Add("Inspector");
            dt.Columns.Add("InspectionContent");
            dt.Columns.Add("Time");
            dt.Columns.Add("Remark");

            if (dt.Rows.Count == 0)
            {
                DataRow dr = dt.NewRow();
                dt.Rows.Add(dr);
            }
            grid.DataSource = dt;
            grid.DataBind();
            grid.Rows[0].Visible = false;
        }

        private void ShowDetail(int id)
        {
            //取出数据
            InspectLog model = InspectLogDAL.GetByID(id);
            //赋值
            txtLogNumber.Text = model.LogNumber;
            txtRegisterNumber.Text = model.RegisterNumber;
            txtInspector.Text = model.Inspector;
            txtInspectionContent.Text = model.InspectionContent;
            txtLocation.Text = model.Location;
            txtRemark.Text = model.Remark;

            //隐藏的id
            hiddenid.Text = model.ID.ToString();

            Disabletxt();
            //按钮的变化
            IsBtnVisible(true, false, false, true, false, false, true);

            //数据行的交替显示     GridViewUser.Rows.Count是数据行的总行数
            for (int i = 0; i < grid.Rows.Count; i++)
            {
                if (i % 2 == 0)
                {
                    grid.Rows[i].BackColor = grid.RowStyle.BackColor;
                }
                else
                {
                    grid.Rows[i].BackColor = grid.AlternatingRowStyle.BackColor;
                }
                Literal literalId = this.grid.Rows[i].FindControl("LiteralId") as Literal;

                //如果是显示行则背景色为黄色
                if (Convert.ToInt32(literalId.Text) == id)
                {
                    grid.Rows[i].BackColor = System.Drawing.Color.LightYellow;
                }
            }

        }
        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            gridviewbind();
        }

        protected void GridViewDepart_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "btnDetailCommand")
            {
                ShowDetail(Convert.ToInt32(e.CommandArgument));
            }
        }

        protected void GridViewDepart_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //找到该行的按钮
            Button btnDetail = e.Row.FindControl("btnDetail") as Button;

            if (btnDetail != null)
            {
                //把该行的onclick事件绑定成按钮的点击事件
                e.Row.Attributes["onclick"] = String.Format("javascript:document.getElementById('{0}').click()", btnDetail.ClientID);
                //鼠标样子
                e.Row.Attributes["style"] = "cursor:pointer";
            }
        }

        protected void grid_Sorting(object sender, GridViewSortEventArgs e)
        {
            string sortExpression = e.SortExpression.ToString();
            string sortDirection = "ASC";
            if (sortExpression == grid.Attributes["SortExpression"])
            {
                sortDirection = (grid.Attributes["SortDirection"].ToString() == sortDirection ? "DESC" : "ASC");
            }
            grid.Attributes["SortExpression"] = sortExpression;
            grid.Attributes["SortDirection"] = sortDirection;
            gridviewbind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            //清空所有的信息
            EmptyTxt();
            //改变显示
            //去除选中颜色
            for (int i = 0; i < grid.Rows.Count; i++)
            {
                if (i % 2 == 0)
                {
                    grid.Rows[i].BackColor = grid.RowStyle.BackColor;
                }
                else
                {
                    grid.Rows[i].BackColor = grid.AlternatingRowStyle.BackColor;
                }
            }
            InspectLog maxCode = InspectLogDAL.GetMaxCode();
            if (maxCode == null)
            {
                //如果没有grid数据则设置为001

                txtLogNumber.Text = "001";
            }
            else
            {
                //编码的位数
                int num = 3;
                string code = maxCode.LogNumber;
                int maxnum = Convert.ToInt32(code.Substring(code.Length - num));
                txtLogNumber.Text = (maxnum + 1).ToString().PadLeft(num, '0');
            }
            Enabledtxt();
            IsBtnVisible(false, true, true, false, false, false, false);
        }

        protected void btnCertain_Click(object sender, EventArgs e)
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
            model.Remark = txtRemark.Text;

            id = InspectLogDAL.Insert(model).ToString();
            
            gridviewbind();
        }

        protected void btnAddCancel_Click(object sender, EventArgs e)
        {
            gridviewbind();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (hiddenid.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('请选择要修改的日志！')", true);
                return;
            }

            //改变显示
            Enabledtxt();
            IsBtnVisible(false, false, false, false, true, true, false);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            #region //判断插入名称和编码是否重复
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
            InspectLog model = InspectLogDAL.GetByID(Convert.ToInt32(hiddenid.Text));
            model.LogNumber = txtLogNumber.Text.Trim();
            model.RegisterNumber = txtRegisterNumber.Text.Trim();
            model.Inspector = txtInspector.Text.Trim();
            model.InspectionContent = txtInspectionContent.Text.Trim();
            model.Location = txtLocation.Text.Trim();
            model.Remark = txtRemark.Text;

            InspectLogDAL.Update(model);
            
            gridviewbind();
        }

        protected void btnUpdateCancel_Click(object sender, EventArgs e)
        {
            gridviewbind();
        }

        protected void btnDel_Click(object sender, EventArgs e)
        {
            if (hiddenid.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('请选择要删除的日志！')", true);
                return;
            }
            InspectLog model = InspectLogDAL.GetByID(Convert.ToInt32(hiddenid.Text));
            InspectLogDAL.DeleteByID(Convert.ToInt32(hiddenid.Text));
            gridviewbind();
        }

        protected void ddlpagesize_SelectedIndexChanged(object sender, EventArgs e)
        {
            AspNetPager1.PageSize = Convert.ToInt32(ddlpagesize.SelectedValue);
            gridviewbind();
        }

        public string FormatDateTime(string datetime)
        {
            if (datetime != "")
            {
                return DateTime.Parse(datetime).ToString("yyyy-MM-dd");
            }
            else
            {
                return "";
            }
        }
    }
}