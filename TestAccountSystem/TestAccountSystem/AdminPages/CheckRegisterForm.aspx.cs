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
    public partial class CheckRegisterForm : System.Web.UI.Page
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
            //if (Request.QueryString["refresh"]=="ok")
            //{
            //    gridviewbind();
            //}
        }
        private void gridviewbind()
        {
            string sortExpression = grid.Attributes["SortExpression"] == null ? "RegisterNumber" : grid.Attributes["SortExpression"];
            bool isASCDirection = false;
            if (grid.Attributes["SortDirection"] == "ASC")
            {
                isASCDirection = true;
            }
            int totalCounts;
            /* string type = Request.QueryString["flag"];
             if (type!=null)
             {
                 if (type== "SURVEYOR1")
                 {
                     string flag = " and status='待审核' and surveyor='"+Session["RealName"]+"'";
                     if (txtRegisterNumber.Text != "")
                     {
                         totalCounts = (int)SqlHelper.GetCountNumber("InspectionRegistration", "ID", "RegisterNumber='" + txtRegisterNumber.Text.Trim() + "'" + flag);
                         AspNetPager1.RecordCount = totalCounts;
                         grid.DataSource = SqlHelper.GetPagedData("InspectionRegistration", "RegisterNumber='" + txtRegisterNumber.Text.Trim() + "'" + flag, sortExpression, isASCDirection,
                                             AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
                     }
                     else
                     {
                         totalCounts = (int)SqlHelper.GetCountNumber("InspectionRegistration", "ID",  "1=1 " + flag);
                         AspNetPager1.RecordCount = totalCounts;
                         grid.DataSource = SqlHelper.GetPagedData("InspectionRegistration", "1=1 " + flag, sortExpression, isASCDirection,
                                             AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
                     }
                     grid.DataBind();
                 }
                 return;
             }*/
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
                    case "4":
                    case "5": zhw = " and 1=1"; break;
                    default:
                        break;
                }
            }
            #endregion
            // string condition = "(status='待审核' or status='待缴费' or status='待计费' or status='验船中' or status='完成' or status='待验船') and ";
            if (txtRegisterNumber.Text != "")
            {
                totalCounts = (int)SqlHelper.GetCountNumber("InspectionRegistration", "ID", "status='待审核' and RegisterNumber='" + txtRegisterNumber.Text.Trim() + "'" + zhw);
                AspNetPager1.RecordCount = totalCounts;
                grid.DataSource = SqlHelper.GetPagedData("InspectionRegistration", "status='待审核' and RegisterNumber='" + txtRegisterNumber.Text.Trim() + "'" + zhw, sortExpression, isASCDirection,
                                    AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
            }
            else
            {
                totalCounts = (int)SqlHelper.GetCountNumber("InspectionRegistration", "ID", "status='待审核' and 1=1 " + zhw);
                AspNetPager1.RecordCount = totalCounts;
                grid.DataSource = SqlHelper.GetPagedData("InspectionRegistration", "status='待审核' and 1=1 " + zhw, sortExpression, isASCDirection,
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

        /*之前的方法
         * protected void btnOK_Click(object sender, EventArgs e)
        {
            string sqlUpdate = "update InspectionRegistration set Status=@Status,Reviewer=@Reviewer where RegisterNumber=@RegisterNumber";
            SqlParameter[] paras = new SqlParameter[] {
            new SqlParameter("@Status","待计费"),
            new SqlParameter("@Reviewer",Session["RealName"]),
            new SqlParameter("@RegisterNumber",(sender as LinkButton).CommandArgument)
            };
            if (SqlHelper.ExecuteNonQuery(sqlUpdate, CommandType.Text, paras) > 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('通过审核！')", true);
            }
            gridviewbind();
        }

        protected void btnRefuse_Click(object sender, EventArgs e)
        {
            string registerNum = (sender as LinkButton).CommandArgument;
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "open('?registerNum=" + registerNum + "');", true);
        }
        */
        protected void grid_DataBound(object sender, EventArgs e)
        {
            if (Session["roleId"] == null)
            {
                Response.Redirect("../AdminLayout/Redirect.aspx?type=reLogin");
                return;
            }
            for (int i = 0; i < grid.Rows.Count; i++)
            {
                if ((grid.Rows[i].FindControl("LiteralStatus") as Literal).Text == "待审核")
                {
                    string roleId = Session["roleId"].ToString();
                    /*  之前的方法
                     *  switch (roleId)
                       {
                           case "2":
                           case "3":
                               //  case "5":
                               (grid.Rows[i].FindControl("btnOK") as LinkButton).Visible = true;
                               (grid.Rows[i].FindControl("btnRefuse") as LinkButton).Visible = true; break;
                           default:
                               (grid.Rows[i].FindControl("btnOK") as LinkButton).Visible = false;
                               (grid.Rows[i].FindControl("btnRefuse") as LinkButton).Visible = false;
                               break;

                       }*/
                    switch (roleId)
                    {
                        case "2": (grid.Rows[i].FindControl("btnCheck") as LinkButton).Visible = true; break;
                        default:
                            break;
                    }
                }
            }
        }

        protected void btnQueryProject_Click(object sender, EventArgs e)
        {
            string registerNum = (sender as LinkButton).CommandArgument;
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "open1('?registerNum=" + registerNum + "');", true);
        }
        protected void btnCheck_Click(object sender, EventArgs e)
        {
            string registerNum = (sender as LinkButton).CommandArgument;
            Response.Redirect("ShowRegisterInfo.aspx?registerNum="+registerNum+"&type=CHECK");
            //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('点击了审核');", true);
        }
    }
}