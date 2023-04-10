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
    public partial class StatisticsInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string page = Request.QueryString["page"];
                if (page == "2")
                {
                    surveyorDiv.Visible = true;
                }
                if (page == "4")
                {
                    financeDiv.Visible = true;
                }
                bindDropDownList(page);
                bindGridView();
            }
        }
        private void bindGridView()
        {
            string condition = "Status!='保存' and Status!='审核未通过' " + LiteralCondition.Text.Trim() + LiteralTimeCondition.Text;
            string sortExpression = grid.Attributes["SortExpression"] == null ? "RegisterNumber" : grid.Attributes["SortExpression"];
            bool isASCDirection = false;
            if (grid.Attributes["SortDirection"] == "ASC")
            {
                isASCDirection = true;
            }
            int totals = 0;
            totals = (int)SqlHelper.GetCountNumber("InspectionRegistration", "id", condition);
            AspNetPager1.RecordCount = totals;
            if (totals > 0)
            {
                DataTable dt = SqlHelper.GetPagedDataTable("InspectionRegistration", condition, sortExpression, isASCDirection, AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
                string a;
                double money = 0;
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    a = dt.Rows[i]["Amount"].ToString();
                    if (a != "")
                    {
                        money += double.Parse(a);
                    }
                }
                txtmoney.Text = money.ToString();
                grid.DataSource = dt;
                grid.DataBind();
            }
            else
            {
                txtmoney.Text = "0";
                showGridViewTitle();
            }
        }


        private void bindDropDownList(string page)
        {
            if (page == "2")
            {
                DataTable dt = SqlHelper.Select("realname", "Alluser", "state=1 and isUseful=1 and roleId=2", "realName");
                ddlSurveyor.DataSource = dt;
                ddlSurveyor.DataValueField = "realName";
                ddlSurveyor.DataTextField = "realName";
                ddlSurveyor.DataBind();
                ddlSurveyor.Items.Insert(0, new ListItem("请选择", ""));
                ddlSurveyor.SelectedIndex = 0;
                return;
            }
            if (page=="4")
            {
                DataTable dt1 = SqlHelper.Select("realname", "Alluser", "state=1 and isUseful=1 and roleId=4", "realName");
                ddlCashier.DataSource = dt1;
                ddlCashier.DataValueField = "realName";
                ddlCashier.DataTextField = "realName";
                ddlCashier.DataBind();
                ddlCashier.Items.Insert(0, new ListItem("请选择", ""));
                ddlCashier.SelectedIndex = 0;
                return;
            }            
        }
        protected void ddlpagesize_SelectedIndexChanged(object sender, EventArgs e)
        {
            AspNetPager1.PageSize = Convert.ToInt32(ddlpagesize.SelectedValue);
            bindGridView();
        }
        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            bindGridView();
        }
        private void showGridViewTitle()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("RegisterNumber");
            dt.Columns.Add("ID");
            dt.Columns.Add("ShipRegistrationNumber");
            dt.Columns.Add("ApplicantCompany");
            dt.Columns.Add("OrderDate");
            dt.Columns.Add("Surveyor");
            dt.Columns.Add("Status");
            dt.Columns.Add("Amount");
            dt.Columns.Add("cashier");
            if (dt.Rows.Count == 0)
            {
                DataRow dr = dt.NewRow();
                dt.Rows.Add(dr);
            }
            grid.DataSource = dt;
            grid.DataBind();
            grid.Rows[0].Visible = false;
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
            bindGridView();
        }

        protected void btnQueryAll_Click(object sender, EventArgs e)
        {
            LiteralTimeCondition.Text = "";
            string startTime = txtStartTime.Text.Trim();
            string endTime = txtEndTime.Text.Trim();
            DateTime result, result1;
            if (DateTime.TryParse(startTime, out result) && DateTime.TryParse(endTime, out result1))
            {
                LiteralTimeCondition.Text = " and OrderDate>='" + result + "' and OrderDate<='" + result1 + "'";
            }
            else if (DateTime.TryParse(startTime, out result))
            {
                LiteralTimeCondition.Text = " and OrderDate>='" + result + "'";
            }
            else if (DateTime.TryParse(endTime, out result1))
            {
                LiteralTimeCondition.Text = " and OrderDate<='" + result1 + "'";
            }
            bindGridView();
        }

        protected void ddlSurveyor_SelectedIndexChanged(object sender, EventArgs e)
        {
            //下拉列表的改变事件
            LiteralCondition.Text = "";
            if (ddlSurveyor.SelectedIndex != 0)
            {
                LiteralCondition.Text = " and Surveyor='" + ddlSurveyor.SelectedValue + "'";
            }
            // bindGridView();
        }

        protected void ddlCashier_SelectedIndexChanged(object sender, EventArgs e)
        {
            //下拉列表的改变事件
            LiteralCondition.Text = "";
            if (ddlCashier.SelectedIndex != 0)
            {
                LiteralCondition.Text = " and cashier='" + ddlCashier.SelectedValue + "'";
            }
        }
    }
}