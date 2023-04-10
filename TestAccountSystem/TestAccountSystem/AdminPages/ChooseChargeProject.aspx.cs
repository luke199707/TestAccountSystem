using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TestAccountSystem.DAL;
using TestAccountSystem.Model;
using System.Data;
namespace TestAccountSystem.AdminPages
{
    public partial class ChooseChargeProject : System.Web.UI.Page
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
                if (Session["RegisterNumber"] != null)
                {
                    txtRegisterNumber.Text = (string)Session["RegisterNumber"];
                }
                gridviewbind();
                ddlbind();

            }
            txtRegisterNumber.Attributes.Add("disabled", "disabled");
        }
       /* private void txtBNamebind()
        {
            string num = ddlBusinessNumber.SelectedValue;
            string sql2 = "select BusinessName from BusinessType where BusinessNumber=@BusinessNumber";
            SqlParameter[] para = new SqlParameter[]
            {
                new SqlParameter("@BusinessNumber", num)
            };
            txtBusinessName.Text = (string)SqlHelper.ExecuteScalar(sql2, CommandType.Text, para);
        }*/
        private void ddlbind()
        {
            string sql = "select BusinessNumber,BusinessName from BusinessType";
            ddlBusinessNumber.DataSource = SqlHelper.ExecuteDataTable(sql, CommandType.Text);
            ddlBusinessNumber.DataValueField = "BusinessNumber";
            ddlBusinessNumber.DataTextField = "BusinessName";
            ddlBusinessNumber.DataBind();
            //txtBNamebind();
        }
        private void gridviewbind()
        {
            string sortExpression = grid.Attributes["SortExpression"] == null ? "ProjectNumber" : grid.Attributes["SortExpression"];
            bool isASCDirection = true;
            if (grid.Attributes["SortDirection"] == "DESC")
            {
                isASCDirection = false;
            }
            int totalCounts = (int)SqlHelper.GetCountNumber("InspectProject", "ID", "BusinessNumber=" + ddlBusinessNumber.SelectedValue);
            AspNetPager1.RecordCount = totalCounts;
            grid.DataSource = SqlHelper.GetPagedData("InspectProject", "BusinessNumber=" + ddlBusinessNumber.SelectedValue, sortExpression, isASCDirection,
                                AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
            grid.DataBind();
        }

        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            gridviewbind();
        }
        protected void GridViewDepart_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "btnDetailCommand")
            {
                //ShowDetail(Convert.ToInt32(e.CommandArgument));
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
        protected void GridViewDepart_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //找到该行的按钮
            //Button btnDetail = e.Row.FindControl("btnDetail") as Button;

            //if (btnDetail != null)
            //{
            //    //把该行的onclick事件绑定成按钮的点击事件
            //    e.Row.Attributes["onclick"] = String.Format("javascript:document.getElementById('{0}').click()", btnDetail.ClientID);
            //    //鼠标样子
            //    e.Row.Attributes["style"] = "cursor:pointer";
            //}
        }
        protected void ddlpagesize_SelectedIndexChanged(object sender, EventArgs e)
        {
            AspNetPager1.PageSize = Convert.ToInt32(ddlpagesize.SelectedValue);
            gridviewbind();
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("../AdminLayout/Redirect.aspx?type=reLogin");
                return;
            }
            //判断检验登记单号是否为空，是否存在
            if (txtRegisterNumber.Text.Trim() == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('检验登记单编号不能为空！')", true);
                return;
            }
            if (InspectionRegistrationDAL.GetByRegisterNumber(txtRegisterNumber.Text.Trim()) == null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('不存在该检验订单！')", true);
                return;
            }
            string sql = "select * from ChargeProject where RegisterNumber=@RegisterNumber";
            SqlParameter[] para1 = new SqlParameter[] {
                new SqlParameter("@RegisterNumber",txtRegisterNumber.Text.Trim())
                };
            object o = SqlHelper.ExecuteScalar(sql, CommandType.Text, para1);
            if (o != null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('该检验订单已经选择检验项目！')", true);
                return;
            }
            //判断是否选择检验项目
            int c = 0;
            for (int i = 0; i < grid.Rows.Count; i++)
            {
                CheckBox cbk = grid.Rows[i].FindControl("cbkAdd") as CheckBox;
                if (cbk.Checked)
                {
                    c++;
                }
            }
            if (c == 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('还未勾选检验项目！')", true);
                return;
            }
            //将选中的项目加入数据库
            for (int i = 0; i < grid.Rows.Count; i++)
            {
                CheckBox cbk = grid.Rows[i].FindControl("cbkAdd") as CheckBox;
                if (cbk.Checked == true)
                {
                    ChargeProject model = new ChargeProject();
                    model.RegisterNumber = txtRegisterNumber.Text.Trim();
                    model.BusinessNumber = (grid.Rows[i].FindControl("LiteralBusinessNumber") as Literal).Text.Trim();
                    model.BusinessName = (grid.Rows[i].FindControl("LiteralBusinessName") as Literal).Text.Trim();
                    model.ProjectNumber = (grid.Rows[i].FindControl("LiteralProjectNumber") as Literal).Text.Trim();
                    model.ProjectName = (grid.Rows[i].FindControl("LiteralProjectName") as Literal).Text.Trim();
                    model.BillingUnit = (grid.Rows[i].FindControl("LiteralBillingUnit") as Literal).Text.Trim();
                    model.BillingPrice = Convert.ToDecimal((grid.Rows[i].FindControl("LiteralBillingPrice") as Literal).Text.Trim());
                    model.Quantity = Convert.ToInt32((grid.Rows[i].FindControl("txtQuantity") as TextBox).Text.Trim());
                    model.Remark = Session["RealName"].ToString();
                    ChargeProjectDAL.Insert(model);
                }
            }
            //全部订单信息填写完成，提交后改变订单状态为待审核。
            string updateSql = "update InspectionRegistration set Status=@Status where RegisterNumber=@RegisterNumber";
            SqlParameter[] para2 = new SqlParameter[] {
                new SqlParameter("@Status","待审核"),
                new SqlParameter("@RegisterNumber",txtRegisterNumber.Text.Trim())
                };
            SqlHelper.ExecuteNonQuery(updateSql, CommandType.Text, para2);
            Response.Redirect("ShowRegisterInfo.aspx?RegisterNumber="+txtRegisterNumber.Text.Trim()+ "&type=ChooseChargeProject");
        }

        protected void cbkAddAll_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox cbkall = sender as CheckBox;
            for (int i = 0; i < grid.Rows.Count; i++)
            {
                CheckBox cbk = grid.Rows[i].FindControl("cbkAdd") as CheckBox;
                cbk.Checked = cbkall.Checked;
            }
        }
        protected void ddlBusinessNumber_TextChanged(object sender, EventArgs e)
        {
            //txtBNamebind();
            gridviewbind();
        }
    }
}