
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TestAccountSystem.DAL;

namespace TestAccountSystem.AdminPages
{
    public partial class ShowChargeDialog : System.Web.UI.Page
    {
        public string _registerNum;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
              BindGridView();
            }

        }
        private void BindGridView()
        {
            string registerNum = Request.QueryString["registerNum"];
            _registerNum = registerNum;
            string sortExpression = grid.Attributes["SortExpression"] == null ? "ProjectNumber" : grid.Attributes["SortExpression"];
            bool isASCDirection = true;
            if (grid.Attributes["SortDirection"] == "ASC")
            {
                isASCDirection = false;
            }
            int totalCounts;
            totalCounts = (int)SqlHelper.GetCountNumber("ChargeProject", "ID", string.Format("RegisterNumber='{0}'", registerNum));
            AspNetPager2.RecordCount = totalCounts;
            if (totalCounts > 0)
            {
                grid.DataSource = SqlHelper.GetPagedData("ChargeProject", string.Format("RegisterNumber='{0}'", registerNum), sortExpression, isASCDirection,
                                AspNetPager2.StartRecordIndex, AspNetPager2.EndRecordIndex);
                grid.DataBind();
            }
            else
            {
                ShowGridViewTitle();
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
            BindGridView();
        }
  

        private void ShowGridViewTitle()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("ID");
            dt.Columns.Add("RegisterNumber");
            dt.Columns.Add("BusinessNumber");
            dt.Columns.Add("BusinessName");
            dt.Columns.Add("ProjectNumber");
            dt.Columns.Add("ProjectName");
            dt.Columns.Add("BillingUnit");
            dt.Columns.Add("BillingPrice");
            dt.Columns.Add("Quantity");
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
        protected void grid_DataBound(object sender, EventArgs e)
        {
            for (int i = 0; i < grid.Rows.Count; i++)
            {
                string str=(grid.Rows[i].FindControl("LiteralBillingPrice") as Literal).Text.Trim();
                string str1 = (grid.Rows[i].FindControl("LiteralQuantity") as Literal).Text.Trim();
                decimal price = Convert.ToDecimal(str==""?"0.0":str);
                int quantity = Convert.ToInt32(str1==""?"0":str1);
                decimal amount = price * quantity;
                (grid.Rows[i].FindControl("LiteralAmount") as Literal).Text = amount.ToString();
                //(grid.Rows[i].FindControl("btnExportOnly") as Button).Visible = true;
            }
        }
        protected void ddlpagesize2_SelectedIndexChanged(object sender, EventArgs e)
        {
            AspNetPager2.PageSize = Convert.ToInt32(ddlpagesize2.SelectedValue);
            BindGridView();
        }
        protected void AspNetPager2_PageChanged(object sender, EventArgs e)
        {
            BindGridView();
        }
    }
}