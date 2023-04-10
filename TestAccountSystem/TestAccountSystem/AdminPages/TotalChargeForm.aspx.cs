using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TestAccountSystem.DAL;

namespace TestAccountSystem.AdminPages
{
    public partial class TotalChargeForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
                bindDropDownList();
            }
        }
        private void BindGridView()
        {
            string condition = "(status='待验船' or status='验船中' or status='完成' )"+LqueryCondition.Text.Trim();
            string sortExpression = grid.Attributes["SortExpression"] == null ? "RegisterNumber" : grid.Attributes["SortExpression"];
            bool isASCDirection = false;
            if (grid.Attributes["SortDirection"] == "ASC")
            {
                isASCDirection = true;
            }
            int totalCounts;
            string roleId = Session["roleId"].ToString();
            switch (roleId)
            {
                case "1":break;
                case "2":break;
                case "3": roleId = " 1=1 and "; break;
                case "4":roleId = " cashier='"+Session["RealName"]+"' and "; break;
                case "5":roleId = " 1=1 and "; break;
            }
            totalCounts = (int)SqlHelper.GetCountNumber("InspectionRegistration", "ID", roleId+condition);
            AspNetPager1.RecordCount = totalCounts;
            if (totalCounts > 0)
            {
                grid.DataSource = SqlHelper.GetPagedDataTable("InspectionRegistration", roleId + condition, sortExpression, isASCDirection, AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
                grid.DataBind();
            }
            else
            {
                showGridViewTitle();
            }
        }
        private void bindDropDownList() {
            DataTable dt = SqlHelper.Select("realname", "alluser", "roleId=4", "username");
            DropDownList1.DataSource = dt;
            DropDownList1.DataTextField = "realname";
            DropDownList1.DataValueField = "realname";
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0,new ListItem("请选择",""));
            DropDownList1.SelectedIndex = 0;
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
        private void showGridViewTitle()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("ID");
            dt.Columns.Add("RegisterNumber");
            dt.Columns.Add("ShipRegistrationNumber");
            dt.Columns.Add("ApplicantCompany");
            dt.Columns.Add("BusinessName");
            dt.Columns.Add("cashier");
            dt.Columns.Add("Amount");
            //dt.Columns.Add("payer");
            //dt.Columns.Add("payTime");
            //dt.Columns.Add("remark1");
            if (dt.Rows.Count == 0)
            {
                DataRow dr = dt.NewRow();
                dt.Rows.Add(dr);
            }
            grid.DataSource = dt;
            grid.DataBind();
            grid.Rows[0].Visible = false;
        }
        protected void ddlpagesize_SelectedIndexChanged(object sender, EventArgs e)
        {
            AspNetPager1.PageSize = Convert.ToInt32(ddlpagesize.SelectedValue);
            BindGridView();
        }
        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            BindGridView();
        }

        protected void LbtnDetail_Click(object sender, EventArgs e)
        {
            string registerNum = (sender as LinkButton).CommandArgument;
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "open('?registerNum=" + registerNum + "&type=detail');", true);

        }

        protected void btnQuery_Click(object sender, EventArgs e)
        {
            //string condition=" and 1=1 ";
            //if (txtRegisterNumber.Text != "")
            //{
            //    condition += " and RegisterNumber='" + txtRegisterNumber.Text.Trim() + "'";
            //}
            //if (DropDownList1.SelectedIndex != 0)
            //{
            //    condition += " and cashier='" + DropDownList1.SelectedValue + "'";
            //}
            //  LqueryCondition.Text = condition;
            LqueryCondition.Text = " and RegisterNumber like '%" + txtRegisterNumber.Text.Trim() + "%' and cashier like '%" + DropDownList1.SelectedValue + "%'";
            BindGridView();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}