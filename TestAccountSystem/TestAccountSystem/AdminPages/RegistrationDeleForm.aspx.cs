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
    public partial class RegistrationDeleForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["UserName"] == null)
            //{
            //    Response.Redirect("../AdminLayout/Redirect.aspx?type=reLogin");
            //    return;
            //}
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
            if (txtRegisterNumber.Text != "")
            {
                totalCounts = (int)SqlHelper.GetCountNumber("InspectionRegistration", "ID", "status!='保存' and RegisterNumber='" + txtRegisterNumber.Text.Trim()+"'"+zhw);
                AspNetPager1.RecordCount = totalCounts;
                grid.DataSource = SqlHelper.GetPagedData("InspectionRegistration", "status!='保存' and RegisterNumber='" + txtRegisterNumber.Text.Trim()+"'"+zhw, sortExpression, isASCDirection,
                                    AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
            }
            else
            {
                totalCounts = (int)SqlHelper.GetCountNumber("InspectionRegistration", "ID", "status!='保存' and 1=1 " + zhw);
                AspNetPager1.RecordCount = totalCounts;
                grid.DataSource = SqlHelper.GetPagedData("InspectionRegistration", "status!='保存' and 1=1 " + zhw, sortExpression, isASCDirection,
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

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string registerNum = (sender as LinkButton).CommandArgument;
            InspectionRegistrationDAL.DeleteByRegisterNumber(registerNum);
            ShipInfoDAL.DeleteByRegisterNumber(registerNum);
            ChargeProjectDAL.DeleteByRegisterNumber(registerNum);
            InspectLogDAL.DeleteByRegisterNum(registerNum);
            gridviewbind();
        }
    }
}