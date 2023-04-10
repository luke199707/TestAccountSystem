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
using CommonHelper;

namespace TestAccountSystem.AdminPages
{
    public partial class InspectionChargeForm : System.Web.UI.Page
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

            string state = Request.QueryString["flag"];
            if (state != null)
            {
                string strCondition = " and 1=1";
                if (state == "CUSTOMER3")
                {
                    strCondition = " and status='待缴费' and remark='" + Session["RealName"] + "'";
                }
                if (state== "ADMIN4")
                {
                    strCondition = " and status='待缴费'";
                }
                if (txtRegisterNumber.Text != "")
                {
                    totalCounts = (int)SqlHelper.GetCountNumber("InspectionRegistration", "ID", "  RegisterNumber='" + txtRegisterNumber.Text.Trim() + "' " + strCondition);
                    AspNetPager1.RecordCount = totalCounts;
                    grid.DataSource = SqlHelper.GetPagedData("InspectionRegistration", "  RegisterNumber='" + txtRegisterNumber.Text.Trim() + "' " + strCondition, sortExpression, isASCDirection,
                                        AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
                }
                else
                {
                    totalCounts = (int)SqlHelper.GetCountNumber("InspectionRegistration", "ID", "   1=1 " + strCondition);
                    AspNetPager1.RecordCount = totalCounts;
                    grid.DataSource = SqlHelper.GetPagedData("InspectionRegistration", "  1=1 " + strCondition, sortExpression, isASCDirection,
                                        AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
                }
                grid.DataBind();
                return;
            }

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
                    case "2": zhw = " and surveyor='" + Session["RealName"].ToString() + "'"; break;
                    case "3":
                    case "4":// zhw = " and status='待缴费'"; break;
                    case "5": zhw = " and (status='待验船' or status='验船中' or status='完成' or status='待缴费')"; break;
                    default:
                        break;
                }
            }
            #endregion
            string para = Request.QueryString["flag1"];
            string str = "1=1 ";
            if (para != null)
            {
                commonDiv.Visible = false;
                customerDiv.Visible = true;
                str = "(status='待验船' or status='验船中' or status='完成' or status='待缴费')";
            }


            if (txtRegisterNumber.Text != "")
            {
                totalCounts = (int)SqlHelper.GetCountNumber("InspectionRegistration", "ID", str + " and RegisterNumber='" + txtRegisterNumber.Text.Trim() + "' " + zhw);
                AspNetPager1.RecordCount = totalCounts;
                grid.DataSource = SqlHelper.GetPagedData("InspectionRegistration", str + " and RegisterNumber='" + txtRegisterNumber.Text.Trim() + "' " + zhw, sortExpression, isASCDirection,
                                    AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
            }
            else
            {
                totalCounts = (int)SqlHelper.GetCountNumber("InspectionRegistration", "ID", str + "  and 1=1 " + zhw);
                AspNetPager1.RecordCount = totalCounts;
                grid.DataSource = SqlHelper.GetPagedData("InspectionRegistration", str + " and 1=1 " + zhw, sortExpression, isASCDirection,
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
        //protected void LinkButton1_Click(object sender, EventArgs e)
        //{
        //    string registerNum = (sender as LinkButton).CommandArgument;
        //    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "open('?registerNum=" + registerNum + "');", true);
        //}
        protected void btnCharge_Click(object sender, EventArgs e)
        {
            string registerNum = (sender as LinkButton).CommandArgument;
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "open('?registerNum=" + registerNum + "');", true);
            //string name = Session["UserName"].ToString();
            //string sqlUpdate = "update InspectionRegistration set Status=@Status,cashier=@cashier where RegisterNumber=@RegisterNumber";
            //SqlParameter[] paras = new SqlParameter[] {
            //new SqlParameter("@Status","待验船"),
            //new SqlParameter("@cashier",name),
            //new SqlParameter("@RegisterNumber",(sender as Button).CommandArgument)
            //};
            //if (SqlHelper.ExecuteNonQuery(sqlUpdate, CommandType.Text, paras) > 0)
            //{
            //    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('收费人："+name+",收费完成！')", true);
            //}
            gridviewbind();
        }

        protected void grid_DataBound(object sender, EventArgs e)
        {
            if (Session["roleId"] == null)
            {
                Response.Redirect("../AdminLayout/Redirect.aspx?type=reLogin");
                return;
            }
            for (int i = 0; i < grid.Rows.Count; i++)
            {
                if ((grid.Rows[i].FindControl("LiteralStatus") as Literal).Text == "待缴费")
                {
                    string roleId = Session["roleId"].ToString();
                    switch (roleId)
                    {
                        //case "1": (grid.Rows[i].FindControl("btnCharge") as Button).Visible = false; break;//客户
                        //case "2": (grid.Rows[i].FindControl("btnCharge") as Button).Visible = false; break; //验船师
                        //case "3": (grid.Rows[i].FindControl("btnCharge") as Button).Visible = false; break;//单位领导
                        case "4": (grid.Rows[i].FindControl("btnCharge") as LinkButton).Visible = true; break;//财务
                        //case "5": (grid.Rows[i].FindControl("btnCharge") as Button).Visible = false; break;//admin
                        default: (grid.Rows[i].FindControl("btnCharge") as LinkButton).Visible = false; break;
                    }
                    // (grid.Rows[i].FindControl("btnCharge") as Button).Visible = true;
                }
                if ((grid.Rows[i].FindControl("LiteralStatus") as Literal).Text == "待验船" || (grid.Rows[i].FindControl("LiteralStatus") as Literal).Text == "验船中" || (grid.Rows[i].FindControl("LiteralStatus") as Literal).Text == "完成")
                {
                    (grid.Rows[i].FindControl("btnExportOne") as LinkButton).Visible = true;
                }
            }
        }
        protected void btnExport_Click(object sender, EventArgs e)
        {
            string str;
            string roleId = Session["roleId"].ToString();
            switch (roleId)
            {
                case "1": str = " and i.remark='" + Session["RealName"].ToString() + "'"; break;
                case "2": str = " and i.Surveyor='" + Session["RealName"].ToString() + "'"; break;
                default: str = " and 1=1"; break;

            }
            string sql = "select i.RegisterNumber '登记单编号', i.ShipRegistrationNumber '船舶编号', i.ApplicantCompany '申请公司名称', i.ApplicationProject '申请项目', ProjectName '检验项目',BillingPrice '检验项目单价',Quantity '数量',OrderDate '开单日期', Amount '总金额', payer '缴费人',i.cashier '收费操作员',Surveyor '验船师',i.Remark '提交人' from InspectionRegistration i inner join ChargeProject c on i.RegisterNumber = c.RegisterNumber where i.Amount is not null and i.status!='待缴费'" + str;
            //string sql = "select * from InspectionRegistration inner join ChargeProject on InspectionRegistration.RegisterNumber=ChargeProject.RegisterNumber ";       
            DataTable dt = SqlHelper.ExecuteDataTable(sql, CommandType.Text);
            if (dt.Rows.Count <= 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('当前没有数据，无需导出！')", true);
                return;
            }
            string[] list = { };
            ExcelHelper.ExportByWeb(dt, "检验项目收费明细(全部订单)", list);
        }
        protected void btnExportOne_Click(object sender, EventArgs e)
        {
            string sql = "select i.RegisterNumber '登记单编号', i.ShipRegistrationNumber '船舶编号', i.ApplicantCompany '申请公司名称', i.ApplicationProject '申请项目',ProjectName '检验项目',BillingPrice '检验项目单价',Quantity '数量',OrderDate '开单日期', Amount '总金额'," +
                "payer '缴费人',i.cashier '收费人',Surveyor '验船师',i.Remark '提交人' from InspectionRegistration i inner join ChargeProject c on i.RegisterNumber = c.RegisterNumber where i.RegisterNumber=@RegisterNumber";
            SqlParameter[] paras = new SqlParameter[] {
            new SqlParameter("@RegisterNumber",(sender as LinkButton).CommandArgument)
            };
            DataTable dt = SqlHelper.ExecuteDataTable(sql, CommandType.Text, paras);
            string[] list = { };
            ExcelHelper.ExportByWeb(dt, "检验项目收费明细", list);
        }
    }
}