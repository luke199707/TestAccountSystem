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
    public partial class BusinessTypeManagementForm : System.Web.UI.Page
    {
        protected string id = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"]==null)
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
            EmptyTxt();
            string sortExpression = gdvBusiness.Attributes["SortExpression"] == null ? "BusinessNumber" : gdvBusiness.Attributes["SortExpression"];
            bool isASCDirection = true;
            if (gdvBusiness.Attributes["SortDirection"] == "DESC")
            {
                isASCDirection = false;
            }
            int totalCounts = (int)SqlHelper.GetCountNumber("BusinessType", "ID", "1=1");
            if (totalCounts > 0)
            {
                AspNetPager1.RecordCount = totalCounts;
                gdvBusiness.DataSource = SqlHelper.GetPagedData("BusinessType", "1=1", sortExpression, isASCDirection,
                                    AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
                gdvBusiness.DataBind();
            }
            else
            {
                ShowGridViewTitle();
            }

            //显示一条数据的详细信息
            if (id != "")
            {
                ShowDetail(Convert.ToInt32(id));
            }
            //按钮的变化
            IsBtnVisible(true, false, false, true, false, false, true);
            Disabletxt();
        }

        private void IsBtnVisible(bool Add, bool Certain, bool AddCancel, bool Update, bool Save, bool UpdateCancel, bool Del)
        {
            btnAdd.Visible = Add;
            btnCertain.Visible = Certain;
            btnAddCancel.Visible = AddCancel;
            btnUpdate.Visible = Update;
            btnSave.Visible = Save;
            btnUpdateCancel.Visible = UpdateCancel;
            btnDel.Visible = Del;
        }

        //txt失效
        private void Disabletxt()
        {
            txtBusinessNumber.Attributes.Add("disabled", "");
            txtBusinessName.Attributes.Add("disabled", "");
            txtK1.Attributes.Add("disabled", "");
            txtK2.Attributes.Add("disabled", "");
            txtK3.Attributes.Add("disabled", "");
            txtK4.Attributes.Add("disabled", "");
            txtK5.Attributes.Add("disabled", "");
            txtC1.Attributes.Add("disabled", "");
            txtC2.Attributes.Add("disabled", "");
            txtC3.Attributes.Add("disabled", "");
            txtC4.Attributes.Add("disabled", "");
            txtC5.Attributes.Add("disabled", "");
            txtRemark.Attributes.Add("disabled", "");
        }
        //txt有效
        private void Enabledtxt()
        {
            txtBusinessName.Attributes.Remove("disabled");
            txtK1.Attributes.Remove("disabled");
            txtK2.Attributes.Remove("disabled");
            txtK3.Attributes.Remove("disabled");
            txtK4.Attributes.Remove("disabled");
            txtK5.Attributes.Remove("disabled");
            txtC1.Attributes.Remove("disabled");
            txtC2.Attributes.Remove("disabled");
            txtC3.Attributes.Remove("disabled");
            txtC4.Attributes.Remove("disabled");
            txtC5.Attributes.Remove("disabled");
            txtRemark.Attributes.Remove("disabled");
        }
        private void EmptyTxt()
        {
            hiddenid.Text = "";
            txtBusinessNumber.Text = "";
            txtBusinessName.Text = "";
            txtK1.Text = "";
            txtK2.Text = "";
            txtK3.Text = "";
            txtK4.Text = "";
            txtK5.Text = "";
            txtC1.Text = "";
            txtC2.Text = "";
            txtC3.Text = "";
            txtC4.Text = "";
            txtC5.Text = "";
            txtRemark.Text = "";
        }
        private void ShowGridViewTitle()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("ID");
            dt.Columns.Add("BusinessNumber");
            dt.Columns.Add("BusinessName");
            dt.Columns.Add("K1");
            dt.Columns.Add("K2");
            dt.Columns.Add("K3");
            dt.Columns.Add("K4");
            dt.Columns.Add("K5");
            dt.Columns.Add("C1");
            dt.Columns.Add("C2");
            dt.Columns.Add("C3");
            dt.Columns.Add("C4");
            dt.Columns.Add("C5");
            dt.Columns.Add("Remark");

            if (dt.Rows.Count == 0)
            {
                DataRow dr = dt.NewRow();
                dt.Rows.Add(dr);
            }
            gdvBusiness.DataSource = dt;
            gdvBusiness.DataBind();
            gdvBusiness.Rows[0].Visible = false;
        }

        private void ShowDetail(int id)
        {
            //取出数据
            BusinessType model = BusinessTypeDAL.GetByID(id);
            //赋值
            txtBusinessNumber.Text = model.BusinessNumber;
            txtBusinessName.Text = model.BusinessName;
            txtK1.Text = model.K1.ToString();
            txtK2.Text = model.K2.ToString();
            txtK3.Text = model.K3.ToString();
            txtK4.Text = model.K4.ToString();
            txtK5.Text = model.K5.ToString();
            txtC1.Text = model.C1.ToString();
            txtC2.Text = model.C2.ToString();
            txtC3.Text = model.C3.ToString();
            txtC4.Text = model.C4.ToString();
            txtC5.Text = model.C5.ToString();
            txtRemark.Text = model.Remark;

            //隐藏的业务代码
            hiddenid.Text = model.ID.ToString();//-----------------------------------------------

            Disabletxt();
            //按钮的变化
            IsBtnVisible(true, false, false, true, false, false, true);

            //数据行的交替显示     GridViewUser.Rows.Count是数据行的总行数
            for (int i = 0; i < gdvBusiness.Rows.Count; i++)
            {
                if (i % 2 == 0)
                {
                    gdvBusiness.Rows[i].BackColor = gdvBusiness.RowStyle.BackColor;
                }
                else
                {
                    gdvBusiness.Rows[i].BackColor = gdvBusiness.AlternatingRowStyle.BackColor;
                }
                Literal literalId = this.gdvBusiness.Rows[i].FindControl("LiteralId") as Literal;

                //如果是显示行则背景色为黄色
                if (Convert.ToInt32(literalId.Text) == id)
                {
                    gdvBusiness.Rows[i].BackColor = System.Drawing.Color.LightYellow;
                }
            }

        }
        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            gridviewbind();
        }

        protected void GridViewDepart_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "btnDetailCommand")
            {
                ShowDetail(Convert.ToInt32(e.CommandArgument));
            }
        }

        protected void GridViewDepart_RowDataBound(object sender, GridViewRowEventArgs e)
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

        protected void grid_Sorting(object sender, GridViewSortEventArgs e)
        {
            string sortExpression = e.SortExpression.ToString();
            string sortDirection = "ASC";
            if (sortExpression == gdvBusiness.Attributes["SortExpression"])
            {
                sortDirection = (gdvBusiness.Attributes["SortDirection"].ToString() == sortDirection ? "DESC" : "ASC");
            }
            gdvBusiness.Attributes["SortExpression"] = sortExpression;
            gdvBusiness.Attributes["SortDirection"] = sortDirection;
            gridviewbind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            //清空所有的信息
            EmptyTxt();
            //改变显示
            //去除选中颜色
            for (int i = 0; i < gdvBusiness.Rows.Count; i++)
            {
                if (i % 2 == 0)
                {
                    gdvBusiness.Rows[i].BackColor = gdvBusiness.RowStyle.BackColor;
                }
                else
                {
                    gdvBusiness.Rows[i].BackColor = gdvBusiness.AlternatingRowStyle.BackColor;
                }
            }
            BusinessType maxCode = BusinessTypeDAL.GetMaxCode();
            if (maxCode == null)
            {
                //如果没有grid数据则设置为001
                txtBusinessNumber.Text = "001";
            }
            else
            {
                //编码的位数
                int num = 3;
                string code = maxCode.BusinessNumber;
                int maxnum = Convert.ToInt32(code.Substring(code.Length - num));
                txtBusinessNumber.Text = (maxnum + 1).ToString().PadLeft(num, '0');
            }
            Enabledtxt();
            IsBtnVisible(false, true, true, false, false, false, false);
        }

        protected void btnCertain_Click1(object sender, EventArgs e)
        {
            //#region //判断插入名称和编码是否重复
            if ((int)SqlHelper.GetCountNumber("BusinessType", "ID", string.Format("BusinessNumber='{0}'", txtBusinessNumber.Text)) != 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('该业务代码已经存在！')", true);
                return;
            }
            if ((int)SqlHelper.GetCountNumber("BusinessType", "ID", string.Format("BusinessName='{0}'", txtBusinessName.Text)) != 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('该业务名称已经存在！')", true);
                return;
            }
            if (txtBusinessName.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('业务名称不能为空！')", true);
                return;
            }
            if (txtK1.Text == "" || txtK2.Text == "" || txtK3.Text == "" || txtK4.Text == "" || txtK5.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('价目系数参数不能为空！')", true);
                return;
            }
            if (txtC1.Text == "" || txtC2.Text == "" || txtC3.Text == "" || txtC4.Text == "" || txtC5.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('价目系数参数不能为空！')", true);
                return;
            }
            //#endregion

            //获取要插入的数据
            BusinessType model = new BusinessType();
            model.BusinessNumber = txtBusinessNumber.Text;
            model.BusinessName = txtBusinessName.Text;
            model.K1 = Convert.ToDecimal(txtK1.Text);
            model.K2 = Convert.ToDecimal(txtK2.Text);
            model.K3 = Convert.ToDecimal(txtK3.Text);
            model.K4 = Convert.ToDecimal(txtK4.Text);
            model.K5 = Convert.ToDecimal(txtK5.Text);
            model.C1 = Convert.ToDecimal(txtC1.Text);
            model.C2 = Convert.ToDecimal(txtC2.Text);
            model.C3 = Convert.ToDecimal(txtC3.Text);
            model.C4 = Convert.ToDecimal(txtC4.Text);
            model.C5 = Convert.ToDecimal(txtC5.Text);
            model.Remark = txtRemark.Text;
            BusinessTypeDAL.Insert(model);
            //重新绑定刷新
            gridviewbind();
        }

        protected void btnAddCancel_Click(object sender, EventArgs e)
        {
            gridviewbind();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (hiddenid.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('请选择要修改的业务！')", true);
                return;
            }

            //改变显示
            Enabledtxt();
            IsBtnVisible(false, false, false, false, true, true, false);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

            #region //判断修改后的业务名称是否重复
            if ((int)SqlHelper.GetCountNumber("BusinessType", "ID", string.Format("BusinessName='{0}' and ID<>'{1}'", txtBusinessName.Text, hiddenid.Text)) != 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('该业务名称已经存在！')", true);
                return;
            }
            if (txtBusinessNumber.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('业务代码不能为空！')", true);
                return;
            }
            if (txtBusinessName.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('业务名称不能为空！')", true);
                return;
            }
            if (txtK1.Text == "" || txtK2.Text == "" || txtK3.Text == "" || txtK4.Text == "" || txtK5.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('价目系数参数不能为空！')", true);
                return;
            }
            if (txtC1.Text == "" || txtC2.Text == "" || txtC3.Text == "" || txtC4.Text == "" || txtC5.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('价目系数参数不能为空！')", true);
                return;
            }
            #endregion
            //获取要插入的数据
            BusinessType model = BusinessTypeDAL.GetByID(Convert.ToInt32(hiddenid.Text));
            model.BusinessNumber = txtBusinessNumber.Text;
            model.BusinessName = txtBusinessName.Text;
            model.K1 = Convert.ToDecimal(txtK1.Text);
            model.K2 = Convert.ToDecimal(txtK2.Text);
            model.K3 = Convert.ToDecimal(txtK3.Text);
            model.K4 = Convert.ToDecimal(txtK4.Text);
            model.K5 = Convert.ToDecimal(txtK5.Text);
            model.C1 = Convert.ToDecimal(txtC1.Text);
            model.C2 = Convert.ToDecimal(txtC2.Text);
            model.C3 = Convert.ToDecimal(txtC3.Text);
            model.C4 = Convert.ToDecimal(txtC4.Text);
            model.C5 = Convert.ToDecimal(txtC5.Text);
            model.Remark = txtRemark.Text;
            BusinessTypeDAL.Update(model);
            gridviewbind();
        }

        protected void btnUpdateCancel_Click(object sender, EventArgs e)
        {
            gridviewbind();
        }

        protected void btnDel_Click(object sender, EventArgs e)
        {
            if (hiddenid.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('请选择要删除的管理员！')", true);
                return;
            }
            BusinessTypeDAL.DeleteByID(Convert.ToInt32(hiddenid.Text));
            gridviewbind();
        }

        protected void ddlpagesize_SelectedIndexChanged(object sender, EventArgs e)
        {
            AspNetPager1.PageSize = Convert.ToInt32(ddlpagesize.SelectedValue);
            gridviewbind();
        }

        
    }   
}