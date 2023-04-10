using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TestAccountSystem.DAL;
using TestAccountSystem.Model;
using System.Data;
using System.Data.SqlClient;

namespace TestAccountSystem.AdminPages
{
    public partial class InspectionBillingMeasureForm : System.Web.UI.Page
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
                ddlbind();
                gridviewbind();
            }
        }
        
        private void ddlbind()
        {
            string sql = "select BusinessName from BusinessType";
            ddlBusinessName.DataSource = SqlHelper.ExecuteDataTable(sql, CommandType.Text);
            ddlBusinessName.DataBind();
        }
        private void gridviewbind()
        {
            string sortExpression = grid.Attributes["SortExpression"] == null ? "ProjectNumber" : grid.Attributes["SortExpression"];
            bool isASCDirection = true;
            if (grid.Attributes["SortDirection"] == "DESC")
            {
                isASCDirection = false;
            }
            int totalCounts = (int)SqlHelper.GetCountNumber("InspectProject", "ID", string.Format("BusinessName='{0}'", ddlBusinessName.SelectedValue));
            AspNetPager1.RecordCount = totalCounts;
            grid.DataSource = SqlHelper.GetPagedData("InspectProject", string.Format("BusinessName='{0}'", ddlBusinessName.SelectedValue), sortExpression, isASCDirection,
                                AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
            grid.DataBind();
        }

        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            gridviewbind();
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
        protected void ddlpagesize_SelectedIndexChanged(object sender, EventArgs e)
        {
            AspNetPager1.PageSize = Convert.ToInt32(ddlpagesize.SelectedValue);
            gridviewbind();
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
        protected void ddlBusinessName_TextChanged(object sender, EventArgs e)
        {
            gridviewbind();
        }

        protected void btnBilling_Click(object sender, EventArgs e)
        {
            decimal amount = 0;
            for (int i = 0; i < grid.Rows.Count; i++)
            {
                if ((grid.Rows[i].FindControl("cbkAdd") as CheckBox).Checked)
                {
                    decimal price = Convert.ToDecimal((grid.Rows[i].FindControl("LiteralBillingPrice") as Literal).Text);
                    int quantity = Convert.ToInt32((grid.Rows[i].FindControl("txtQuantity") as TextBox).Text);
                    amount += price * quantity;
                }
            }
            //取业务类型K1-K5，C1-C5系数
            string sqlcoefficient = "select * from BusinessType where BusinessName=@BusinessName";
            SqlParameter[] parascoefficient = new SqlParameter[]
            {
                new SqlParameter("@BusinessName",ddlBusinessName.SelectedValue)
            };
            SqlDataReader readercoefficient = SqlHelper.ExecuteDataReader(sqlcoefficient, CommandType.Text, parascoefficient);
            if (readercoefficient.Read())
            {
                decimal K1 = readercoefficient.GetDecimal(3);
                decimal K2 = readercoefficient.GetDecimal(4);
                decimal K3 = readercoefficient.GetDecimal(5);
                decimal K4 = readercoefficient.GetDecimal(6);
                decimal K5 = readercoefficient.GetDecimal(7);
                decimal C1 = readercoefficient.GetDecimal(8);
                decimal C2 = readercoefficient.GetDecimal(9);
                decimal C3 = readercoefficient.GetDecimal(10);
                decimal C4 = readercoefficient.GetDecimal(11);
                decimal C5 = readercoefficient.GetDecimal(12);
                amount = amount * K1 * K2 * K3 * K4 * K5 * C1 * C2 * C3 * C4 * C5;
                txtAmount.Text = amount.ToString().Substring(0, amount.ToString().IndexOf('.') + 3);
            }
            else
            {
                txtAmount.Text = "0.00";
            }

           
        }
    }
}