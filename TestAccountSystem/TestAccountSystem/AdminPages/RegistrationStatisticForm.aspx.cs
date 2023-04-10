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
    public partial class RegistrationStatisticForm : System.Web.UI.Page
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
                ddlpagesize.SelectedValue = AspNetPager1.PageSize.ToString();
                gridviewbind();
            }
        }
        private void gridviewbind()
        {
            string sortExpression = grid.Attributes["SortExpression"] == null ? "RegisterNumber" : grid.Attributes["SortExpression"];
            bool isASCDirection = false;
            string condition = "1=1 " + LiteraDDLState.Text + LiteraShip.Text;
            if (grid.Attributes["SortDirection"] == "ASC")
            {
                isASCDirection = true;
            }
            //string RegisterNumber = txtRegisterNumber.Text.Trim();
            string ShipRegistrationNumber = txtShipRegistrationNumber.Text.Trim();
            //string BusinessName = ddlBusinessName.SelectedValue;
            // string Surveyor = txtSurveyor.Text.Trim();
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
                    case "1": zhw = " and status!='保存' and remark='" + Session["RealName"].ToString() + "'"; break;
                    case "2": zhw = " and status!='保存'and status!='审核未通过' and surveyor='" + Session["RealName"].ToString() + "'"; break;
                    case "3":
                    case "4":
                    case "5": zhw = " and status!='保存' and 1=1"; break;
                    default:
                        break;
                }
            }
            #endregion
            //#region 条件判断
            //if (RegisterNumber != "" && ShipRegistrationNumber == "" && BusinessName == "请选择")
            //{
            //    totalCounts = (int)SqlHelper.GetCountNumber("InspectionRegistration", "ID", string.Format("RegisterNumber='{0}' ", RegisterNumber)+zhw);
            //    AspNetPager1.RecordCount = totalCounts;
            //    grid.DataSource = SqlHelper.GetPagedData("InspectionRegistration", string.Format("RegisterNumber='{0}' ", RegisterNumber)+zhw, sortExpression, isASCDirection,
            //                        AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
            //}
            //else if (RegisterNumber != "" && ShipRegistrationNumber != "" && BusinessName == "请选择" )
            //{
            //    totalCounts = (int)SqlHelper.GetCountNumber("InspectionRegistration", "ID", string.Format("RegisterNumber='{0}' and ShipRegistrationNumber='{1}' ", RegisterNumber,ShipRegistrationNumber)+zhw);
            //    AspNetPager1.RecordCount = totalCounts;
            //    grid.DataSource = SqlHelper.GetPagedData("InspectionRegistration", string.Format("RegisterNumber='{0}' and ShipRegistrationNumber='{1}' ", RegisterNumber, ShipRegistrationNumber)+zhw, sortExpression, isASCDirection,
            //                        AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
            //}
            //else if (RegisterNumber != "" && ShipRegistrationNumber == "" && BusinessName != "请选择" )
            //{
            //    totalCounts = (int)SqlHelper.GetCountNumber("InspectionRegistration", "ID", string.Format("RegisterNumber='{0}' and BusinessName='{1}' ", RegisterNumber, BusinessName)+zhw);
            //    AspNetPager1.RecordCount = totalCounts;
            //    grid.DataSource = SqlHelper.GetPagedData("InspectionRegistration", string.Format("RegisterNumber='{0}' and BusinessName='{1}' ", RegisterNumber, BusinessName)+zhw, sortExpression, isASCDirection,
            //                        AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
            //}
            //else if (RegisterNumber != "" && ShipRegistrationNumber == "" && BusinessName == "请选择" )
            //{
            //    totalCounts = (int)SqlHelper.GetCountNumber("InspectionRegistration", "ID", string.Format("RegisterNumber='{0}' and Surveyor='{1}' ", RegisterNumber, Surveyor)+zhw);
            //    AspNetPager1.RecordCount = totalCounts;
            //    grid.DataSource = SqlHelper.GetPagedData("InspectionRegistration", string.Format("RegisterNumber='{0}' and Surveyor='{1}' ", RegisterNumber, Surveyor)+zhw, sortExpression, isASCDirection,
            //                        AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
            //}
            //else if (RegisterNumber == "" && ShipRegistrationNumber != "" && BusinessName == "请选择")
            //{
            //    totalCounts = (int)SqlHelper.GetCountNumber("InspectionRegistration", "ID", string.Format("ShipRegistrationNumber='{0}' ", ShipRegistrationNumber)+zhw);
            //    AspNetPager1.RecordCount = totalCounts;
            //    grid.DataSource = SqlHelper.GetPagedData("InspectionRegistration", string.Format("ShipRegistrationNumber='{0}' ", ShipRegistrationNumber)+zhw, sortExpression, isASCDirection,
            //                        AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
            //}
            //else if (RegisterNumber == "" && ShipRegistrationNumber != "" && BusinessName != "请选择" )
            //{
            //    totalCounts = (int)SqlHelper.GetCountNumber("InspectionRegistration", "ID", string.Format("ShipRegistrationNumber='{0}' and BusinessName='{1}' ", ShipRegistrationNumber, BusinessName)+zhw);
            //    AspNetPager1.RecordCount = totalCounts;
            //    grid.DataSource = SqlHelper.GetPagedData("InspectionRegistration", string.Format("ShipRegistrationNumber='{0}' and BusinessName='{1}' ", ShipRegistrationNumber, BusinessName)+zhw, sortExpression, isASCDirection,
            //                        AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
            //}
            //else if (RegisterNumber == "" && ShipRegistrationNumber != "" && BusinessName == "请选择" )
            //{
            //    totalCounts = (int)SqlHelper.GetCountNumber("InspectionRegistration", "ID", string.Format("ShipRegistrationNumber='{0}' and Surveyor='{1}' ", ShipRegistrationNumber, Surveyor)+zhw);
            //    AspNetPager1.RecordCount = totalCounts;
            //    grid.DataSource = SqlHelper.GetPagedData("InspectionRegistration", string.Format("ShipRegistrationNumber='{0}' and Surveyor='{1}' ", ShipRegistrationNumber, Surveyor)+zhw, sortExpression, isASCDirection,
            //                        AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
            //}
            //else if (RegisterNumber == "" && ShipRegistrationNumber == "" && BusinessName != "请选择"  )
            //{
            //    totalCounts = (int)SqlHelper.GetCountNumber("InspectionRegistration", "ID", string.Format("BusinessName='{0}' ", BusinessName)+zhw);
            //    AspNetPager1.RecordCount = totalCounts;
            //    grid.DataSource = SqlHelper.GetPagedData("InspectionRegistration", string.Format("BusinessName='{0}' ", BusinessName)+zhw, sortExpression, isASCDirection,
            //                        AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
            //}
            //else if (RegisterNumber == "" && ShipRegistrationNumber == "" && BusinessName != "请选择")
            //{
            //    totalCounts = (int)SqlHelper.GetCountNumber("InspectionRegistration", "ID", string.Format("BusinessName='{0}' and Surveyor='{1}' ", BusinessName, Surveyor)+zhw);
            //    AspNetPager1.RecordCount = totalCounts;
            //    grid.DataSource = SqlHelper.GetPagedData("InspectionRegistration", string.Format("BusinessName='{0}' and Surveyor='{1}' ", BusinessName, Surveyor)+zhw, sortExpression, isASCDirection,
            //                        AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
            //}
            //else if (RegisterNumber == "" && ShipRegistrationNumber == "" && BusinessName == "请选择" )
            //{
            //    totalCounts = (int)SqlHelper.GetCountNumber("InspectionRegistration", "ID", string.Format("Surveyor='{0}' ", Surveyor)+zhw);
            //    AspNetPager1.RecordCount = totalCounts;
            //    grid.DataSource = SqlHelper.GetPagedData("InspectionRegistration", string.Format("Surveyor='{0}' ", Surveyor)+zhw, sortExpression, isASCDirection,
            //                        AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
            //}
            //else if (RegisterNumber != "" && ShipRegistrationNumber != "" && BusinessName != "请选择" && Surveyor == "")
            //{
            //    totalCounts = (int)SqlHelper.GetCountNumber("InspectionRegistration", "ID", string.Format("RegisterNumber='{0}' and ShipRegistrationNumber='{1}' and BusinessName='{2}' ", RegisterNumber, ShipRegistrationNumber, BusinessName)+zhw);
            //    AspNetPager1.RecordCount = totalCounts;
            //    grid.DataSource = SqlHelper.GetPagedData("InspectionRegistration", string.Format("RegisterNumber='{0}' and ShipRegistrationNumber='{1}' and BusinessName='{2}' ", RegisterNumber, ShipRegistrationNumber, BusinessName)+zhw, sortExpression, isASCDirection,
            //                        AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
            //}
            //else if (RegisterNumber != "" && ShipRegistrationNumber != "" && BusinessName == "请选择" && Surveyor != "")
            //{
            //    totalCounts = (int)SqlHelper.GetCountNumber("InspectionRegistration", "ID", string.Format("RegisterNumber='{0}' and ShipRegistrationNumber='{1}' and Surveyor='{2}' ", RegisterNumber, ShipRegistrationNumber, Surveyor)+zhw);
            //    AspNetPager1.RecordCount = totalCounts;
            //    grid.DataSource = SqlHelper.GetPagedData("InspectionRegistration", string.Format("RegisterNumber='{0}' and ShipRegistrationNumber='{1}' and Surveyor='{2}' ", RegisterNumber, ShipRegistrationNumber, Surveyor)+zhw, sortExpression, isASCDirection,
            //                        AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
            //}
            //else if (RegisterNumber == "" && ShipRegistrationNumber != "" && BusinessName != "请选择" && Surveyor != "")
            //{
            //    totalCounts = (int)SqlHelper.GetCountNumber("InspectionRegistration", "ID", string.Format("BusinessName='{0}' and ShipRegistrationNumber='{1}' and Surveyor='{2}' ", BusinessName, ShipRegistrationNumber, Surveyor)+zhw);
            //    AspNetPager1.RecordCount = totalCounts;
            //    grid.DataSource = SqlHelper.GetPagedData("InspectionRegistration", string.Format("BusinessName='{0}' and ShipRegistrationNumber='{1}' and Surveyor='{2}' ", BusinessName, ShipRegistrationNumber, Surveyor)+zhw, sortExpression, isASCDirection,
            //                        AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
            //}
            //else if (RegisterNumber != "" && ShipRegistrationNumber != "" && BusinessName != "请选择" && Surveyor != "")
            //{
            //    totalCounts = (int)SqlHelper.GetCountNumber("InspectionRegistration", "ID", string.Format("RegisterNumber='{0}' and ShipRegistrationNumber='{1}' and BusinessName='{2}' and Surveyor='{3}' ", RegisterNumber, ShipRegistrationNumber, BusinessName, Surveyor)+zhw);
            //    AspNetPager1.RecordCount = totalCounts;
            //    grid.DataSource = SqlHelper.GetPagedData("InspectionRegistration", string.Format("RegisterNumber='{0}' and ShipRegistrationNumber='{1}' and BusinessName='{2}' and Surveyor='{3}' ", RegisterNumber, ShipRegistrationNumber, BusinessName, Surveyor)+zhw, sortExpression, isASCDirection,
            //                        AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
            //}
            //else
            //{
            //    totalCounts = (int)SqlHelper.GetCountNumber("InspectionRegistration", "ID", "1=1 "+zhw);
            //    AspNetPager1.RecordCount = totalCounts;
            //    grid.DataSource = SqlHelper.GetPagedData("InspectionRegistration", "1=1 "+zhw, sortExpression, isASCDirection,
            //                        AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
            //}
            //#endregion
            totalCounts = (int)SqlHelper.GetCountNumber("InspectionRegistration", "ID", condition + zhw);
            AspNetPager1.RecordCount = totalCounts;
            grid.DataSource = SqlHelper.GetPagedData("InspectionRegistration", condition + zhw, sortExpression, isASCDirection,
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

        protected void btnSerach_Click(object sender, EventArgs e)
        {
            LiteraShip.Text = "";
            if (txtShipRegistrationNumber.Text != "")
            {
                LiteraShip.Text = " and ShipRegistrationNumber='" + txtShipRegistrationNumber.Text.Trim() + "'";
            }

            gridviewbind();
        }



        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {
            LiteraDDLState.Text = "";
            if (ddlState.SelectedIndex != 0)
            {
                LiteraDDLState.Text = " and status='" + ddlState.SelectedValue + "'";
            }
        }
    }
}