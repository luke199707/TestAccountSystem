using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TestAccountSystem.Model;
using TestAccountSystem.DAL;
using System.Data.SqlClient;
using System.Data;



namespace TestAccountSystem.AdminPages
{
    public partial class InspectionProjectDetailPrintingForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gridviewbind();
            }
        }
        private void gridviewbind()
        {
            string sortExpression = grid.Attributes["SortExpression"] == null ? "RegisterNumber" : grid.Attributes["SortExpression"];
            bool isASCDirection = true;
            if (grid.Attributes["SortDirection"] == "DESC")
            {
                isASCDirection = false;
            }
            int totalCounts;
            if (txtRegisterNumber.Text.Trim()!="")
            {
                totalCounts = (int)SqlHelper.GetCountNumber("ChargeProject", "ID", string.Format("RegisterNumber='{0}'",txtRegisterNumber.Text.Trim()));
                AspNetPager1.RecordCount = totalCounts;
                grid.DataSource = SqlHelper.GetPagedData("ChargeProject", string.Format("RegisterNumber='{0}'", txtRegisterNumber.Text.Trim()), sortExpression, isASCDirection,
                                    AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
            }
            else
            {
                totalCounts = (int)SqlHelper.GetCountNumber("ChargeProject", "ID", "1=1");
                AspNetPager1.RecordCount = totalCounts;
                grid.DataSource = SqlHelper.GetPagedData("ChargeProject", "1=1", sortExpression, isASCDirection,
                                    AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
            }
            
            grid.DataBind();
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
        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            gridviewbind();
        }
        protected void btnQuery_Click(object sender, EventArgs e)
        {
            gridviewbind();
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            
        }

        protected void grid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            
        }

        protected void grid_DataBound(object sender, EventArgs e)
        {
            for (int i = 0; i < grid.Rows.Count; i++)
            {
                decimal price = Convert.ToDecimal((grid.Rows[i].FindControl("LiteralBillingPrice") as Literal).Text);
                int quantity = Convert.ToInt32((grid.Rows[i].FindControl("LiteralQuantity") as Literal).Text);
                decimal amount = price * quantity;
                (grid.Rows[i].FindControl("LiteralAmount") as Literal).Text = amount.ToString();
            }
        }
    }
}