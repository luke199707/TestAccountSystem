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
    public partial class QueryRegistrationForm : System.Web.UI.Page
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
            if (state!=null)
            {
                string strCondition=" 1=1";
                //客户
                if (state == "CUSTOMER1")
                {
                    strCondition = " and status='审核未通过' and remark='" + Session["RealName"] + "'";
                }
                if (state== "CUSTOMER2")
                {
                    strCondition = " and status='待审核' and remark='" + Session["RealName"] + "'";
                }
                if (state == "CUSTOMER3")
                {
                    strCondition = " and status='待缴费' and remark='" + Session["RealName"] + "'";
                }
                if (state == "CUSTOMER4")
                {
                    strCondition = " and status='验船中' and remark='" + Session["RealName"] + "'";
                }
                if (state == "CUSTOMER5")
                {
                    strCondition = " and status='完成' and remark='" + Session["RealName"] + "'";
                }
                ////验船师
                //if (state== "SURVEYOR1")
                //{
                //    strCondition = " and status='待审核' and surveyor='"+Session["UserName"]+"'";
                //}
                //if (state == "SURVEYOR2")
                //{
                //    strCondition = " and status='待验船' and surveyor='" + Session["UserName"] + "'";
                //}
                //if (state == "SURVEYOR3")
                //{
                //    strCondition = " and status='验船中' and surveyor='" + Session["UserName"] + "'";
                //}
                //if (state == "SURVEYOR4")
                //{
                //    strCondition = " and status='完成' and surveyor='" + Session["UserName"] + "'";
                //}
                //单位领导           
                if (state == "LEADER2")
                {
                    strCondition = " and status!='保存' and status!='审核未通过'";
                }
                if (state == "LEADER3")
                {
                    strCondition = " and status='待审核'";
                }
                if (state == "LEADER4")
                {
                    strCondition = " and status='待缴费'";
                }
                if (state == "LEADER5")
                {
                    strCondition = " and status='验船中'";
                }
                if (state == "LEADER6")
                {
                    strCondition = " and status='完成'";
                }


                //admin
                if (state== "ADMIN1")
                {
                    strCondition = " and status!='保存' and status!='审核未通过' ";
                }
                if (state == "ADMIN2")
                {
                    strCondition = " and status='待审核'";
                }
                if (state == "ADMIN3")
                {
                    strCondition = " and status='待计费'";
                }
                if (state == "ADMIN4")
                {
                    strCondition = " and status='待缴费'";
                }
                if (state == "ADMIN5")
                {
                    strCondition = " and status='验船中'";
                }
                if (state == "ADMIN6")
                {
                    strCondition = " and status='完成'";
                }

                if (txtRegisterNumber.Text!="")
                {
                    totalCounts = (int)SqlHelper.GetCountNumber("InspectionRegistration", "ID", " RegisterNumber='" + txtRegisterNumber.Text.Trim() + "'" + strCondition);
                    AspNetPager1.RecordCount = totalCounts;
                    grid.DataSource = SqlHelper.GetPagedData("InspectionRegistration", " RegisterNumber='" + txtRegisterNumber.Text.Trim() + "'" + strCondition, sortExpression, isASCDirection,
                                        AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
                }
                else
                {
                    totalCounts = (int)SqlHelper.GetCountNumber("InspectionRegistration", "ID", " 1=1 " + strCondition);
                    AspNetPager1.RecordCount = totalCounts;
                    grid.DataSource = SqlHelper.GetPagedData("InspectionRegistration", " 1=1 " + strCondition, sortExpression, isASCDirection,
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
                    case "2": zhw = " and status!='保存' and surveyor='" + Session["RealName"].ToString() + "'"; break;
                    case "3":
                    case "4":
                    case "5": zhw = " and status!='保存' and 1=1"; break;
                    default:
                        break;
                }
            }
            #endregion
            if (txtRegisterNumber.Text != "")
            {
                totalCounts = (int)SqlHelper.GetCountNumber("InspectionRegistration", "ID", " RegisterNumber='" + txtRegisterNumber.Text.Trim() + "'" + zhw);
                AspNetPager1.RecordCount = totalCounts;
                grid.DataSource = SqlHelper.GetPagedData("InspectionRegistration", " RegisterNumber='" + txtRegisterNumber.Text.Trim() + "'" + zhw, sortExpression, isASCDirection,
                                    AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
            }
            else
            {
                #region zhw
                //string zhw = null;
                //if (Session["roleId"] == null)
                //{
                //    Response.Redirect("../AdminLayout/Redirect.aspx?type=reLogin");
                //    return;
                //}
                //else
                //{

                //    string roleId = Session["roleId"].ToString();
                //    switch (roleId)
                //    {
                //        case "1": zhw = " 1=1"; break;
                //        case "2": zhw = " and surveyor='" + Session["UserName"].ToString() + "'"; break;
                //        case "3":
                //        case "4":
                //        case "5": zhw = " and 1=1"; break;
                //        default:
                //            break;
                //    }
                //}
                #endregion
                totalCounts = (int)SqlHelper.GetCountNumber("InspectionRegistration", "ID", " 1=1 " + zhw);
                AspNetPager1.RecordCount = totalCounts;
                grid.DataSource = SqlHelper.GetPagedData("InspectionRegistration", " 1=1 " + zhw, sortExpression, isASCDirection,
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
        protected void lbtnEdit_Click(object sender, EventArgs e)
        {
            string registerNum = (sender as LinkButton).CommandArgument;
            Session["showdetailRegisterNumber"] = registerNum;
            Response.Redirect("RegistrationEditForm.aspx");
        }
        protected void lbtnQuery_Click(object sender, EventArgs e)
        {
            string registerNum = (sender as LinkButton).CommandArgument;
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "open('?registerNum=" + registerNum + "');", true);
        }
        protected void lbtnQueryReason_Click(object sender, EventArgs e)
        {
            string registerNum = (sender as LinkButton).CommandArgument;
            //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "key", "alert('编码名称不能为空！')", true);
            //return;
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "openOpinion('?registerNum=" + registerNum + "&type=customer');", true);
        }
        protected void lbtnSee_Click(object sender, EventArgs e)
        {
            string registerNum = (sender as LinkButton).CommandArgument;
            //Session["showdetailRegisterNumber"] = registerNum;
            Response.Redirect("ShowRegisterInfo.aspx?RegisterNumber=" + registerNum + " &type=QueryRegisterForm");
        }
        protected void grid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //找到该行的按钮
            Button btnDetail = e.Row.FindControl("btnDetail") as Button;

            if (btnDetail != null)
            {
                //把该行的onclick事件绑定成按钮的点击事件
                e.Row.Attributes["onclick"] = String.Format("javascript:document.getElementById('{0}').click()", btnDetail.ClientID);
                //鼠标样子
                e.Row.Attributes["style"] = "cursor:pointer";
            }
            for (int i = 0; i < grid.Rows.Count; i++)
            {
                if ((grid.Rows[i].FindControl("LiteralStatus") as Literal).Text.Trim() == "保存" || (grid.Rows[i].FindControl("LiteralStatus") as Literal).Text.Trim() == "审核未通过")
                {
                    (grid.Rows[i].FindControl("lbtnEdit") as LinkButton).Visible = true;
                }
                if ((grid.Rows[i].FindControl("LiteralStatus") as Literal).Text.Trim() == "验船中" || (grid.Rows[i].FindControl("LiteralStatus") as Literal).Text.Trim() == "完成")
                {
                    (grid.Rows[i].FindControl("lbtnQuery") as LinkButton).Visible = true;
                }
                if ((grid.Rows[i].FindControl("LiteralStatus") as Literal).Text.Trim() == "审核未通过")
                {
                    (grid.Rows[i].FindControl("lbtnQueryReason") as LinkButton).Visible = true;
                }
                //else
                //{
                //    (grid.Rows[i].FindControl("lbtnQuery") as LinkButton).Visible = true;
                //}
            }
        }

        //private void gdvLogDetailbind()
        //{
        //    string sortExpression = gdvLogDetail.Attributes["SortExpression"] == null ? "LogNumber" : gdvLogDetail.Attributes["SortExpression"];
        //    bool isASCDirection = true;
        //    if (gdvLogDetail.Attributes["SortDirection"] == "DESC")
        //    {
        //        isASCDirection = false;
        //    }
        //    int totalCounts;
        //    totalCounts = (int)SqlHelper.GetCountNumber("InspectLog", "ID", string.Format("RegisterNumber='{0}'", hiddenid.Text));
        //    AspNetPager2.RecordCount = totalCounts;
        //    if (totalCounts > 0)
        //    {
        //        gdvLogDetail.DataSource = SqlHelper.GetPagedData("InspectLog", string.Format("RegisterNumber='{0}'", hiddenid.Text), sortExpression, isASCDirection,
        //                        AspNetPager2.StartRecordIndex, AspNetPager2.EndRecordIndex);
        //        gdvLogDetail.DataBind();
        //    }
        //    else
        //    {
        //        ShowgdvDetailTitle();
        //    }

        //}
        //protected void gdvLogDetail_Sorting(object sender, GridViewSortEventArgs e)
        //{
        //    string sortExpression = e.SortExpression.ToString();
        //    string sortDirection = "ASC";
        //    if (sortExpression == gdvLogDetail.Attributes["SortExpression"])
        //    {
        //        sortDirection = (gdvLogDetail.Attributes["SortDirection"].ToString() == sortDirection ? "DESC" : "ASC");
        //    }
        //    gdvLogDetail.Attributes["SortExpression"] = sortExpression;
        //    gdvLogDetail.Attributes["SortDirection"] = sortDirection;
        //    gdvLogDetailbind();
        //}
        //protected void ddlpagesize2_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    AspNetPager2.PageSize = Convert.ToInt32(ddlpagesize2.SelectedValue);
        //    gdvLogDetailbind();
        //}
        //protected void AspNetPager2_PageChanged(object sender, EventArgs e)
        //{
        //    gdvLogDetailbind();
        //}
        //private void ShowgdvDetailTitle()
        //{
        //    DataTable dt = new DataTable();
        //    dt.Columns.Add("ID");
        //    dt.Columns.Add("LogNumber");
        //    dt.Columns.Add("RegisterNumber");
        //    dt.Columns.Add("Inspector");
        //    dt.Columns.Add("Location");
        //    dt.Columns.Add("Time");
        //    dt.Columns.Add("InspectionContent");
        //    dt.Columns.Add("Remark");

        //    if (dt.Rows.Count == 0)
        //    {
        //        DataRow dr = dt.NewRow();
        //        dt.Rows.Add(dr);
        //    }
        //    gdvLogDetail.DataSource = dt;
        //    gdvLogDetail.DataBind();
        //    gdvLogDetail.Rows[0].Visible = false;
        //}
        protected void grid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "btnDetailCommand")
            {
                ShowDetail(Convert.ToInt32(e.CommandArgument));
            }
        }
        private void ShowDetail(int id)
        {
            InspectionRegistration model = InspectionRegistrationDAL.GetByID(id);
            if (model != null)
            {
                hiddenid.Text = model.RegisterNumber;
            }

            // gdvLogDetailbind();

            //数据行的交替显示     GridViewUser.Rows.Count是数据行的总行数
            for (int i = 0; i < grid.Rows.Count; i++)
            {
                if (i % 2 == 0)
                {
                    grid.Rows[i].BackColor = grid.RowStyle.BackColor;
                }
                else
                {
                    grid.Rows[i].BackColor = grid.AlternatingRowStyle.BackColor;
                }
                Literal literalId = this.grid.Rows[i].FindControl("LiteralId") as Literal;

                //如果是显示行则背景色为黄色
                if (Convert.ToInt32(literalId.Text) == id)
                {
                    grid.Rows[i].BackColor = System.Drawing.Color.LightYellow;
                }
            }

        }
    }
}