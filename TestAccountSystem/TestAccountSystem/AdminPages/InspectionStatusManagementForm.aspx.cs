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
    public partial class InspectionStatusManagementForm : System.Web.UI.Page
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
            hiddenRegisterNumber.Text = "";
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
                string strCondition = " and surveyor='"+Session["RealName"]+"'";
                if (state == "SURVEYOR2")
                {
                    strCondition += " and status='待验船'";
                }
                if (state == "SURVEYOR3")
                {
                    strCondition += " and status='验船中'";
                }
                if (state == "SURVEYOR4")
                {
                    strCondition += " and status='完成'";
                }
                if (txtRegisterNumber.Text != "")
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
               // gdvLogDetailbind();
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
                    case "4":
                    case "5": zhw = " and 1=1"; break;
                    default:
                        break;
                }
            }
            #endregion

            string condition = " (status='待验船' or status='验船中' or status='完成') and ";
            if (txtRegisterNumber.Text != "")
            {
                totalCounts = (int)SqlHelper.GetCountNumber("InspectionRegistration", "ID", condition + " RegisterNumber='" + txtRegisterNumber.Text.Trim() + "'" + zhw);
                AspNetPager1.RecordCount = totalCounts;
                grid.DataSource = SqlHelper.GetPagedData("InspectionRegistration", condition + " RegisterNumber='" + txtRegisterNumber.Text.Trim() + "'" + zhw, sortExpression, isASCDirection,
                                    AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
            }
            else
            {
                totalCounts = (int)SqlHelper.GetCountNumber("InspectionRegistration", "ID", condition + " 1=1 " + zhw);
                AspNetPager1.RecordCount = totalCounts;
                grid.DataSource = SqlHelper.GetPagedData("InspectionRegistration", condition + " 1=1 " + zhw, sortExpression, isASCDirection,
                                    AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
            }
            grid.DataBind();
          //  gdvLogDetailbind();
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
        }

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
                hiddenRegisterNumber.Text = model.RegisterNumber;
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
        protected void btnQueryLog_Click(object sender, EventArgs e)
        {
            string registerNum = (sender as LinkButton).CommandArgument;
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "open('?registerNum=" + registerNum + "');", true);
        }
        protected void btnStart_Click(object sender, EventArgs e)
        {
            string sqlUpdate = "update InspectionRegistration set Status=@Status,InspectionDate=@InspectionDate where RegisterNumber=@RegisterNumber";
            SqlParameter[] paras = new SqlParameter[] {
            new SqlParameter("@Status","验船中"),
            new SqlParameter("@InspectionDate",DateTime.Now),
            new SqlParameter("@RegisterNumber",(sender as LinkButton).CommandArgument)
            };
            if (SqlHelper.ExecuteNonQuery(sqlUpdate, CommandType.Text, paras) > 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('开始验船！')", true);
            }
            gridviewbind();
        }

        protected void btnEnd_Click(object sender, EventArgs e)
        {
            string sqlUpdate = "update InspectionRegistration set Status=@Status where RegisterNumber=@RegisterNumber";
            SqlParameter[] paras = new SqlParameter[] {
            new SqlParameter("@Status","完成"),
            new SqlParameter("@RegisterNumber",(sender as LinkButton).CommandArgument)
            };
            if (SqlHelper.ExecuteNonQuery(sqlUpdate, CommandType.Text, paras) > 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('验船完成！')", true);
            }
            gridviewbind();
        }
        protected void btnAddLog_Click(object sender, EventArgs e)
        {
            string registerNum = (sender as LinkButton).CommandArgument;
            Session["LogRegisterNumber"] = registerNum;
            Response.Redirect("AddLogFormW.aspx");
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
                string roleId = Session["roleId"].ToString();
                if ((grid.Rows[i].FindControl("LiteralStatus") as Literal).Text == "待验船")
                {
                    switch (roleId)
                    {
                        case "2":
                        case "5": (grid.Rows[i].FindControl("btnStart") as LinkButton).Visible = true; break;
                        default:
                            (grid.Rows[i].FindControl("btnStart") as LinkButton).Visible = false;
                            break;
                    }

                }
                if ((grid.Rows[i].FindControl("LiteralStatus") as Literal).Text == "验船中")
                {
                    switch (roleId)
                    {
                        case "2":
                        case "5": (grid.Rows[i].FindControl("btnEnd") as LinkButton).Visible = true;
                            (grid.Rows[i].FindControl("btnAddLog") as LinkButton).Visible = true; break;
                        default:
                            (grid.Rows[i].FindControl("btnAddLog") as LinkButton).Visible = false;
                            (grid.Rows[i].FindControl("btnEnd") as LinkButton).Visible = false;
                            break;
                    }
                }
                if ((grid.Rows[i].FindControl("LiteralStatus") as Literal).Text == "验船中"|| (grid.Rows[i].FindControl("LiteralStatus") as Literal).Text == "完成")
                {
                    (grid.Rows[i].FindControl("btnQueryLog") as LinkButton).Visible = true;
                }
              /*  if ((grid.Rows[i].FindControl("LiteralStatus") as Literal).Text == "验船中")
                {
                    switch (roleId)
                    {
                        case "2":
                        case "5": (grid.Rows[i].FindControl("btnAddLog") as LinkButton).Visible = true; break;
                        default:
                            (grid.Rows[i].FindControl("btnAddLog") as LinkButton).Visible = false;
                            break;
                    }

                }*/
            }
        }
        //------------------------------------------------------------------------------------------
        //gdvLogDetail部分
      /*  protected void btnEdit_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32((sender as Button).CommandArgument);
            Response.Redirect("AddLogForm.aspx?id=" + id);
        }

        protected void btnDel_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32((sender as Button).CommandArgument);
            InspectLogDAL.DeleteByID(id);
            gdvLogDetailbind();
        }
        private void gdvLogDetailbind()
        {
            string sortExpression = gdvLogDetail.Attributes["SortExpression"] == null ? "LogNumber" : gdvLogDetail.Attributes["SortExpression"];
            bool isASCDirection = true;
            if (gdvLogDetail.Attributes["SortDirection"] == "DESC")
            {
                isASCDirection = false;
            }
            int totalCounts;
            totalCounts = (int)SqlHelper.GetCountNumber("InspectLog", "ID", string.Format("RegisterNumber='{0}'", hiddenRegisterNumber.Text));
            AspNetPager2.RecordCount = totalCounts;
            if (totalCounts > 0)
            {
                LogDiv.Visible = true;
                gdvLogDetail.DataSource = SqlHelper.GetPagedData("InspectLog", string.Format("RegisterNumber='{0}'", hiddenRegisterNumber.Text), sortExpression, isASCDirection,
                                AspNetPager2.StartRecordIndex, AspNetPager2.EndRecordIndex);
                gdvLogDetail.DataBind();
            }
            else
            {
                LogDiv.Visible = false;
                ShowgdvDetailTitle();
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
            gdvLogDetailbind();
        }
        protected void ddlpagesize2_SelectedIndexChanged(object sender, EventArgs e)
        {
            AspNetPager2.PageSize = Convert.ToInt32(ddlpagesize2.SelectedValue);
            gdvLogDetailbind();
        }
        protected void AspNetPager2_PageChanged(object sender, EventArgs e)
        {
            gdvLogDetailbind();
        }
        private void ShowgdvDetailTitle()
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

        //数据绑定后激发
        protected void gdvLogDetail_DataBound(object sender, EventArgs e)
        {
            if (Session["roleId"] == null)
            {
                Response.Redirect("../AdminLayout/Redirect.aspx?type=reLogin");
                return;
            }
            for (int i = 0; i < gdvLogDetail.Rows.Count; i++)
            {
                string roleId = Session["roleId"].ToString();
                switch (roleId)
                {
                    case "2":
                    case "5":
                        (gdvLogDetail.Rows[i].FindControl("btnEdit") as Button).Visible = true;
                        (gdvLogDetail.Rows[i].FindControl("btnDel") as Button).Visible = true; break;
                    default:
                        (gdvLogDetail.Rows[i].FindControl("btnDel") as Button).Visible = false;
                        (gdvLogDetail.Rows[i].FindControl("btnEdit") as Button).Visible = false;
                        break;
                }
            }
        }*/
    }

}