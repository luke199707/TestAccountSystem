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
namespace TestAccountSystem.AdminPages
{
    public partial class InspectionBillingForm : System.Web.UI.Page
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
            string condition = "status!='保存' and status!='审核未通过' and status!='待审核' and ";
            if (txtRegisterNumber.Text.Trim() != "")
            {
                totalCounts = (int)SqlHelper.GetCountNumber("InspectionRegistration", "ID", condition+ string.Format("RegisterNumber='{0}' ", txtRegisterNumber.Text.Trim())+zhw);//status = '待计费' and
                AspNetPager1.RecordCount = totalCounts;
                grid.DataSource = SqlHelper.GetPagedData("InspectionRegistration",condition+ string.Format("RegisterNumber='{0}' ", txtRegisterNumber.Text.Trim())+zhw, sortExpression, isASCDirection,
                                    AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
            }
            else
            {
                totalCounts = (int)SqlHelper.GetCountNumber("InspectionRegistration", "ID", condition+"1=1 " + zhw);
                AspNetPager1.RecordCount = totalCounts;
                grid.DataSource = SqlHelper.GetPagedData("InspectionRegistration", condition+"1=1 " + zhw, sortExpression, isASCDirection,
                                    AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
            }

            grid.DataBind();
            gdvDetailbind();
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

        protected void btnQueryProject_Click(object sender, EventArgs e)
        {
            string registerNum = (sender as LinkButton).CommandArgument;
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "open('?registerNum=" + registerNum + "');", true);
        }
        protected void btnBilling_Click(object sender, EventArgs e)
        {
            //订单检验项目加载
            hiddenRegisterNumber.Text = (sender as LinkButton).CommandArgument;
            gdvDetailbind();
            //计算检验项目总费用
            decimal amount = 0;
            for (int i = 0; i < gdvDetail.Rows.Count; i++)
            {
                amount += Convert.ToDecimal((gdvDetail.Rows[i].FindControl("LiteralAmount") as Literal).Text.Trim());
            }
            //取业务类型K1-K5，C1-C5系数
            string sqlRegisterNumber = "select BusinessName from ChargeProject where RegisterNumber=@RegisterNumber";
            SqlParameter[] parasRegisterNumber = new SqlParameter[]
            {
                new SqlParameter("@RegisterNumber",(sender as LinkButton).CommandArgument)
            };
            SqlDataReader reader = SqlHelper.ExecuteDataReader(sqlRegisterNumber, CommandType.Text, parasRegisterNumber);
            string BusinessName = "";
            if (reader.Read())
            {
                BusinessName = reader.GetString(0);
            }

            string sqlcoefficient = "select * from BusinessType where BusinessName=@BusinessName";
            SqlParameter[] parascoefficient = new SqlParameter[]
            {
                new SqlParameter("@BusinessName",BusinessName)
            };
            SqlDataReader readercoefficient = SqlHelper.ExecuteDataReader(sqlcoefficient,CommandType.Text,parascoefficient);
            if (readercoefficient.Read())
            {
                decimal K1 = readercoefficient.GetDecimal(3);
                decimal K2 = readercoefficient.GetDecimal(4);
                decimal K3 = readercoefficient.GetDecimal(5);
                decimal K4 = readercoefficient.GetDecimal(6);
                decimal K5 = readercoefficient.GetDecimal(7);
                decimal C1 = readercoefficient.GetDecimal(8);
                decimal C2 = readercoefficient.GetDecimal(9);
                decimal C3 = readercoefficient.GetDecimal(10);
                decimal C4 = readercoefficient.GetDecimal(11);
                decimal C5 = readercoefficient.GetDecimal(12);
                amount = amount * K1 * K2 * K3 * K4 * K5 * C1 * C2 * C3 * C4 * C5;
            }
            
            //更新订单检验费用总额
            string updatesql = "update InspectionRegistration set Status=@Status,Amount=@Amount,BusinessName=@BusinessName where RegisterNumber=@RegisterNumber";
            SqlParameter[] paras = new SqlParameter[]
            {
                new SqlParameter("@Status","待缴费"),
                new SqlParameter("@Amount",amount),
                new SqlParameter("@BusinessName",Session["RealName"].ToString()),//此字段用来记录 点击计费的人是谁
                new SqlParameter("@RegisterNumber",(sender as LinkButton).CommandArgument)
            };

            int count = SqlHelper.ExecuteNonQuery(updatesql, CommandType.Text, paras);
            if (count > 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('计费完成！')", true);
            }
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
            { string roleId = Session["roleId"].ToString();
                if ((grid.Rows[i].FindControl("LiteralStatus") as Literal).Text.Trim() == "待计费")
                {
                    switch (roleId)
                    {
                        case "4": (grid.Rows[i].FindControl("btnBilling") as LinkButton).Visible = true;break;                      
                        default:
                            (grid.Rows[i].FindControl("btnBilling") as LinkButton).Visible = false;
                            break;
                    }
                    
                }
            }
        }
        private void ShowDetail(int id)
        {
            InspectionRegistration model = InspectionRegistrationDAL.GetByID(id);
            hiddenRegisterNumber.Text = model.RegisterNumber;
            //gdvDetailbind();

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

        //------------------------------------------------------------------------------------------
        //gdvDetail部分
        private void gdvDetailbind()
        {
            string sortExpression = gdvDetail.Attributes["SortExpression"] == null ? "RegisterNumber" : gdvDetail.Attributes["SortExpression"];
            bool isASCDirection = true;
            if (gdvDetail.Attributes["SortDirection"] == "DESC")
            {
                isASCDirection = false;
            }
            int totalCounts;
            totalCounts = (int)SqlHelper.GetCountNumber("ChargeProject", "ID", string.Format("RegisterNumber='{0}'", hiddenRegisterNumber.Text));
            AspNetPager2.RecordCount = totalCounts;
            if (totalCounts > 0)
            {
                detailDiv.Visible = true;
                gdvDetail.DataSource = SqlHelper.GetPagedData("ChargeProject", string.Format("RegisterNumber='{0}'", hiddenRegisterNumber.Text), sortExpression, isASCDirection,
                                AspNetPager2.StartRecordIndex, AspNetPager2.EndRecordIndex);
                gdvDetail.DataBind();
            }
            else
            {
                detailDiv.Visible = false;
                ShowgdvDetailTitle();
            }

        }
        protected void gdvDetail_Sorting(object sender, GridViewSortEventArgs e)
        {
            string sortExpression = e.SortExpression.ToString();
            string sortDirection = "ASC";
            if (sortExpression == gdvDetail.Attributes["SortExpression"])
            {
                sortDirection = (gdvDetail.Attributes["SortDirection"].ToString() == sortDirection ? "DESC" : "ASC");
            }
            gdvDetail.Attributes["SortExpression"] = sortExpression;
            gdvDetail.Attributes["SortDirection"] = sortDirection;
            gdvDetailbind();
        }
        protected void ddlpagesize2_SelectedIndexChanged(object sender, EventArgs e)
        {
            AspNetPager2.PageSize = Convert.ToInt32(ddlpagesize2.SelectedValue);
            gdvDetailbind();
        }
        protected void AspNetPager2_PageChanged(object sender, EventArgs e)
        {
            gdvDetailbind();
        }
        private void ShowgdvDetailTitle()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("ID");
            dt.Columns.Add("RegisterNumber");
            dt.Columns.Add("BusinessNumber");
            dt.Columns.Add("BusinessName");
            dt.Columns.Add("ProjectNumber");
            dt.Columns.Add("ProjectName");
            dt.Columns.Add("BillingUnit");
            dt.Columns.Add("BillingPrice");
            dt.Columns.Add("Quantity");
            dt.Columns.Add("Remark");

            if (dt.Rows.Count == 0)
            {
                DataRow dr = dt.NewRow();
                dt.Rows.Add(dr);
            }
            gdvDetail.DataSource = dt;
            gdvDetail.DataBind();
            gdvDetail.Rows[0].Visible = false;
        }

        protected void gdvDetail_DataBound(object sender, EventArgs e)
        {
            for (int i = 0; i < gdvDetail.Rows.Count; i++)
            {
                if ((gdvDetail.Rows[i].FindControl("LiteralBillingPrice") as Literal).Text != "" && (gdvDetail.Rows[i].FindControl("LiteralQuantity") as Literal).Text != "")
                {
                    decimal price = Convert.ToDecimal((gdvDetail.Rows[i].FindControl("LiteralBillingPrice") as Literal).Text);
                    int quantity = Convert.ToInt32((gdvDetail.Rows[i].FindControl("LiteralQuantity") as Literal).Text);
                    decimal amount = price * quantity;
                    (gdvDetail.Rows[i].FindControl("LiteralAmount") as Literal).Text = amount.ToString();
                }

            }
        }
    }
}