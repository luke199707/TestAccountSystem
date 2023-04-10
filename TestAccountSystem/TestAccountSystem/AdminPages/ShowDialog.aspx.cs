
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
    public partial class ShowDialog : System.Web.UI.Page
    {
        public string imageUrl;
        public string _registerNum;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                imageUrl = "../UpLoadImg/264dbcc2eba449685ce24115e4b5c2e0.jpg";
                BindGridView();
            }

        }
        private void BindGridView()
        {
            string registerNum = Request.QueryString["registerNum"];
            _registerNum = registerNum;
            string sortExpression = gdvLogDetail.Attributes["SortExpression"] == null ? "LogNumber" : gdvLogDetail.Attributes["SortExpression"];
            bool isASCDirection = true;
            if (gdvLogDetail.Attributes["SortDirection"] == "DESC")
            {
                isASCDirection = false;
            }
            int totalCounts;
            totalCounts = (int)SqlHelper.GetCountNumber("InspectLog", "ID", string.Format("RegisterNumber='{0}'", registerNum));
            AspNetPager2.RecordCount = totalCounts;
            if (totalCounts > 0)
            {
                gdvLogDetail.DataSource = SqlHelper.GetPagedData("InspectLog", string.Format("RegisterNumber='{0}'", registerNum), sortExpression, isASCDirection,
                                AspNetPager2.StartRecordIndex, AspNetPager2.EndRecordIndex);
                gdvLogDetail.DataBind();
            }
            else
            {
                ShowGridViewTitle();
            }

        }
        protected void gdvLogDetail_Sorting(object sender, GridViewSortEventArgs e)
        {
            string sortExpression = e.SortExpression.ToString();
            string sortDirection = "ASC";
            if (sortExpression == gdvLogDetail.Attributes["SortExpression"])
            {
                sortDirection = (gdvLogDetail.Attributes["SortDirection"].ToString() == sortDirection ? "DESC" : "ASC");
            }
            gdvLogDetail.Attributes["SortExpression"] = sortExpression;
            gdvLogDetail.Attributes["SortDirection"] = sortDirection;
            BindGridView();
        }
  

        private void ShowGridViewTitle()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("ID");
            dt.Columns.Add("LogNumber");
            dt.Columns.Add("RegisterNumber");
            dt.Columns.Add("Inspector");
            dt.Columns.Add("Location");
            dt.Columns.Add("Time");
            dt.Columns.Add("InspectionContent");
            dt.Columns.Add("Remark");

            if (dt.Rows.Count == 0)
            {
                DataRow dr = dt.NewRow();
                dt.Rows.Add(dr);
            }
            gdvLogDetail.DataSource = dt;
            gdvLogDetail.DataBind();
            gdvLogDetail.Rows[0].Visible = false;
        }


        protected void gvTeacherTable_RowDataBound(object sender, GridViewRowEventArgs e)
        {

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