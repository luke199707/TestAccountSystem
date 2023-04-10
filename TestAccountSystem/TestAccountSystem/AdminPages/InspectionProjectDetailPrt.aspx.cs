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
using CommonHelper;

namespace TestAccountSystem.AdminPages
{
    public partial class InspectionProjectDetailPrt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("../AdminLayout/Redirect.aspx?type=reLogin");
                return;
            }
            btnDisabled();
            if (!IsPostBack)
            {
                gridviewbind();
            }
        }
        #region zhw
        private void btnDisabled()
        {
            if (Session["roleId"] == null)
            {
                Response.Redirect("../AdminLayout/Redirect.aspx?type=reLogin");
                return;
            }
            string roleId = Session["roleId"].ToString();
            switch (roleId)
            {
                case "1":
                    btnExport.Visible = false; break;
                case "2":
                default:
                    break;
            }
        }
        #endregion
        private void gridviewbind()
        {
            string sortExpression = grid.Attributes["SortExpression"] == null ? "RegisterNumber" : grid.Attributes["SortExpression"];
            bool isASCDirection = false;
            if (grid.Attributes["SortDirection"] == "ASC")
            {
                isASCDirection = true;
            }
            int totalCounts;
            #region zhw
            string zhw = null;
            if (Session["roleId"] == null)
            {
                Response.Redirect("../AdminLayout/Redirect.aspx?type=reLogin");
                return;
            }
            else
            {
                string roleId = Session["roleId"].ToString();
                switch (roleId)
                {
                    case "1": zhw = " and remark='" + Session["RealName"].ToString() + "'"; break;
                    case "2":
                        List<string> list = ChargeProjectDAL.GetList(Session["UserName"].ToString());
                        if (list.Count > 0)
                        {
                            zhw = "and RegisterNumber in (";
                            for (int i = 0; i < list.Count; i++)
                            {
                                zhw += "'" + list[i] + "',";
                                //string.Format("and RegisterNumber in ");

                            }
                            zhw += "'1')";
                        }
                        else
                        {
                            zhw = "and RegisterNumber in ('-1')";
                        }
                        break;
                    //zhw = " and i.surveyor='" + Session["UserName"].ToString() + "'"; break;//--------
                    case "3":
                    case "4":
                    case "5": zhw = " and 1=1"; break;
                    default:
                        break;
                }
            }
            #endregion
            if (txtRegisterNumber.Text.Trim() != "")
            {
                DataTable dt = SqlHelper.GetGroupData("ChargeProject", "RegisterNumber", "RegisterNumber", string.Format("RegisterNumber='{0}' ", txtRegisterNumber.Text.Trim()) + zhw, "RegisterNumber", true);
                totalCounts = dt.Rows.Count;
                AspNetPager1.RecordCount = totalCounts;
                grid.DataSource = SqlHelper.GetPagedGroupDataTable("ChargeProject", "MIN(ID)as 'ID',RegisterNumber,MAX(BusinessNumber) as 'BusinessNumber',MAX(BusinessName)as 'BusinessName',MAX(Remark)as 'Remark'", "RegisterNumber,BusinessNumber,BusinessName,remark", string.Format("RegisterNumber='{0}' ", txtRegisterNumber.Text.Trim()) + zhw, sortExpression, isASCDirection, AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);

                //select c.*,i.Remark from ChargeProject c inner join InspectionRegistration i on c.RegisterNumber=i.RegisterNumber
                //totalCounts = (int)SqlHelper.GetCountNumber("ChargeProject", "ID", string.Format("RegisterNumber='{0}' ", txtRegisterNumber.Text.Trim()) + zhw);
                //AspNetPager1.RecordCount = totalCounts;
                //grid.DataSource = SqlHelper.GetPagedData("ChargeProject", string.Format("RegisterNumber='{0}' ", txtRegisterNumber.Text.Trim()) + zhw, sortExpression, isASCDirection,
                //                    AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
            }
            else
            {
                //totalCounts = (int)SqlHelper.GetCountNumber("ChargeProject", "ID", "1=1 " + zhw);
                //AspNetPager1.RecordCount = totalCounts;
                //grid.DataSource = SqlHelper.GetPagedData("ChargeProject", "1=1 " + zhw, sortExpression, isASCDirection,
                //                    AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
                DataTable dt = SqlHelper.GetGroupData("ChargeProject", "RegisterNumber", "RegisterNumber", " 1=1 " + zhw, "RegisterNumber", true);
                totalCounts = dt.Rows.Count;
                AspNetPager1.RecordCount = totalCounts;
                grid.DataSource = SqlHelper.GetPagedGroupDataTable("ChargeProject", "MIN(ID)as 'ID',RegisterNumber,MAX(BusinessNumber) as 'BusinessNumber',MAX(BusinessName)as 'BusinessName',MAX(Remark)as 'Remark'", "RegisterNumber,BusinessNumber,BusinessName,remark", " 1=1 " + zhw, sortExpression, isASCDirection, AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
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
        #region zhw
        protected void btnExport_Click(object sender, EventArgs e)
        {
            string sql, str;
            string roleId = Session["roleId"].ToString();
            switch (roleId)
            {
                case "2": str = " and i.Surveyor='" + Session["UserName"].ToString() + "'"; break;
                default: str = " and 1=1"; break;

            }
            if (txtRegisterNumber.Text == "")
            {
                sql = "select c.RegisterNumber '登记单编号',i.ShipRegistrationNumber '船舶编号', i.ApplicantCompany '申请公司名称', c.BusinessName '业务类型',ProjectName '检验项目', BillingPrice '检验项目单价', Quantity '数量', c.Remark '提交人' from ChargeProject c inner join InspectionRegistration i on c.RegisterNumber=i.RegisterNumber where 1=1 " + str;
            }
            else
            {
                //sql = "select * from ChargeProject where RegisterNumber=@RegisterNumber "+str;
                sql = "select c.RegisterNumber '登记单编号',i.ShipRegistrationNumber '船舶编号', i.ApplicantCompany '申请公司名称', c.BusinessName '业务类型',ProjectName '检验项目', BillingPrice '检验项目单价', Quantity '数量', c.Remark '提交人' from ChargeProject c inner join InspectionRegistration i on c.RegisterNumber=i.RegisterNumber where c.RegisterNumber='" + txtRegisterNumber.Text.Trim() + "'" + str;
            }
            DataTable dt = SqlHelper.ExecuteDataTable(sql, CommandType.Text);
            if (dt.Rows.Count <= 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('当前没有数据，无需导出！')", true);
                return;
            }
            string[] list = { };
            ExcelHelper.ExportByWeb(dt, "检验项目明细(全部)", list);
        }
        #endregion
        //protected void grid_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    //for (int i = 0; i < grid.Rows.Count; i++)
        //    //{
        //    //    (grid.Rows[i].FindControl("btnExportOnly")as Button).Visible
        //    //}
        //}


        //protected void lbtnProgress_Click(object sender, EventArgs e)
        //{
        //    string registerNum = (sender as LinkButton).CommandArgument;
        //    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "open1('?registerNum=" + registerNum + "');", true);
        //}


        protected void grid_DataBound(object sender, EventArgs e)
        {
            for (int i = 0; i < grid.Rows.Count; i++)
            {
                //decimal price = Convert.ToDecimal((grid.Rows[i].FindControl("LiteralBillingPrice") as Literal).Text);
                //int quantity = Convert.ToInt32((grid.Rows[i].FindControl("LiteralQuantity") as Literal).Text);
                //decimal amount = price * quantity;
                //(grid.Rows[i].FindControl("LiteralAmount") as Literal).Text = amount.ToString();
                (grid.Rows[i].FindControl("lbtnExportOnly") as LinkButton).Visible = true;
                //LinkButton btn = grid.Rows[i].FindControl("lbtnExportOnly") as LinkButton;
                //ScriptManager.GetCurrent(this).RegisterAsyncPostBackControl(btn);
            }
        }
        //protected void btnExportOnly_Click(object sender, EventArgs e)
        //{
        //    string id = (sender as Button).CommandArgument;
        //    string sql = "select * from ChargeProject where RegisterNumber=@RegisterNumber";
        //    DataTable dt = SqlHelper.ExecuteDataTable(sql, CommandType.Text, new SqlParameter("@RegisterNumber", id));
        //    string[] list = { };
        //    ExcelHelper.ExportByWeb(dt, "项目明细", list);
        //string sql = null;
        //if (txtRegisterNumber.Text == "")
        //{
        //    sql = "select * from ChargeProject";
        //}
        //else
        //{
        //    sql = "select * from ChargeProject where RegisterNumber=@RegisterNumber";
        //}
        //DataTable dt = SqlHelper.ExecuteDataTable(sql, CommandType.Text);
        //string[] list = { };
        //ExcelHelper.ExportByWeb(dt, "项目明细", list);
        //}

        protected void grid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string registerNum = e.CommandArgument.ToString();
            if (e.CommandName == "btnDetail")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "open('?registerNum=" + registerNum + "');", true);
            }
            if (e.CommandName == "btnExportOnly")
            {
                string sql = "select RegisterNumber '登记单编号',BusinessName '业务类型',ProjectName '检验项目', BillingPrice '检验项目单价', Quantity '数量', Remark '提交人' from ChargeProject where RegisterNumber=@RegisterNumber";
                DataTable dt = SqlHelper.ExecuteDataTable(sql, CommandType.Text, new SqlParameter("@RegisterNumber", registerNum));
                string[] list = { };
                ExcelHelper.ExportByWeb(dt, "检验项目明细", list);
            }
        }
    }
}