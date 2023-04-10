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
    public partial class InspectProjectManagementForm : System.Web.UI.Page
    {
        protected string id = "";
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
                ddlbind();
            }
          //  txtProjectNumber.Attributes.Add("disabled", "disabled");

        }
        private void txtBNamebind()
        {
            if (ddlBusinessNumber.SelectedIndex==0)
            {
                txtBusinessName.Text = "";
                txtProjectNumber.Text = "";
                return;
            }
            string num = ddlBusinessNumber.SelectedValue;
            string sql2 = "select BusinessName from BusinessType where BusinessNumber=@BusinessNumber";
            SqlParameter[] para = new SqlParameter[]
            {
                new SqlParameter("@BusinessNumber", num)
            };
            txtBusinessName.Text = (string)SqlHelper.ExecuteScalar(sql2, CommandType.Text, para);
            //生成编号
            string sql = "select top(1)ProjectNumber from InspectProject where ProjectNumber like '" + num + "%' order by ProjectNumber desc";
            string currentCode = (string)SqlHelper.ExecuteScalar(sql, CommandType.Text);
            if (currentCode == null)
            {
                txtProjectNumber.Text = num + ".001";
            }
            else
            {
                int code = Convert.ToInt32(currentCode.Substring(currentCode.IndexOf('.') + 1));
                if (code < 9)
                {
                    code++;
                    txtProjectNumber.Text = num + ".00" + code;
                }
                else
                {
                    code++;
                    txtProjectNumber.Text = num + ".0" + code;
                }
            }
        }
        private void ddlbind()
        {
            string sql = "select BusinessNumber from BusinessType";
            ddlBusinessNumber.DataSource = SqlHelper.ExecuteDataTable(sql, CommandType.Text);
            ddlBusinessNumber.DataBind();
            //txtBNamebind();
        }
        private void gridviewbind()
        {
            EmptyTxt();
            string sortExpression = grid.Attributes["SortExpression"] == null ? "BusinessNumber" : grid.Attributes["SortExpression"];
            bool isASCDirection = true;
            if (grid.Attributes["SortDirection"] == "DESC")
            {
                isASCDirection = false;
            }
            int totalCounts = (int)SqlHelper.GetCountNumber("InspectProject", "ID", "1=1");
            if (totalCounts > 0)
            {
                AspNetPager1.RecordCount = totalCounts;
                grid.DataSource = SqlHelper.GetPagedData("InspectProject", "1=1", sortExpression, isASCDirection,
                                    AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
                grid.DataBind();
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
            ddlBusinessNumber.Attributes.Add("disabled", "");
            txtBusinessName.Attributes.Add("disabled", "");
            txtProjectNumber.Attributes.Add("disabled", "");
            txtProjectName.Attributes.Add("disabled", "");
            txtBillingUnit.Attributes.Add("disabled", "");
            txtBillingPrice.Attributes.Add("disabled", "");
            txtRemark.Attributes.Add("disabled", "");
        }
        //txt有效
        private void Enabledtxt()
        {
            //txtProjectNumber.Attributes.Remove("disabled");
            ddlBusinessNumber.Attributes.Remove("disabled");
            txtProjectName.Attributes.Remove("disabled");
            txtBillingUnit.Attributes.Remove("disabled");
            txtBillingPrice.Attributes.Remove("disabled");
            txtRemark.Attributes.Remove("disabled");
        }
        private void EmptyTxt()
        {
            ddlBusinessNumber.SelectedIndex = 0;
            txtBusinessName.Text = "";
            txtProjectNumber.Text = "";
            txtProjectName.Text = "";
            txtBillingUnit.Text = "";
            txtBillingPrice.Text = "";
            txtRemark.Text = "";
            hiddenid.Text = "";
        }
        private void ShowGridViewTitle()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("ID");
            dt.Columns.Add("BusinessNumber");
            dt.Columns.Add("BusinessName");
            dt.Columns.Add("ProjectNumber");
            dt.Columns.Add("ProjectName");
            dt.Columns.Add("BillingUnit");
            dt.Columns.Add("BillingPrice");
            dt.Columns.Add("Remark");

            if (dt.Rows.Count == 0)
            {
                DataRow dr = dt.NewRow();
                dt.Rows.Add(dr);
            }
            grid.DataSource = dt;
            grid.DataBind();
            grid.Rows[0].Visible = false;
        }

        private void ShowDetail(int id)
        {
            //取出数据
            InspectProject model = InspectProjectDAL.GetByID(id);
            //赋值
            try
            {
                ddlBusinessNumber.SelectedValue = model.BusinessNumber;
                txtBusinessName.Text = model.BusinessName;
                txtProjectNumber.Text = model.ProjectNumber;
                txtProjectName.Text = model.ProjectName;
                txtBillingUnit.Text = model.BillingUnit;
                txtBillingPrice.Text = model.BillingPrice.ToString();
                txtRemark.Text = model.Remark;
            }
            catch (Exception)
            {
                ddlBusinessNumber.SelectedIndex = 0;
                txtBusinessName.Text = "";
                txtProjectNumber.Text = model.ProjectNumber;
                txtProjectName.Text = model.ProjectName;
                txtBillingUnit.Text = model.BillingUnit;
                txtBillingPrice.Text = model.BillingPrice.ToString();
                txtRemark.Text = model.Remark;
                //throw;
            }
            finally
            {


                //隐藏的id
                hiddenid.Text = model.ID.ToString();

                Disabletxt();
                //按钮的变化
                IsBtnVisible(true, false, false, true, false, false, true);

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
            if (sortExpression == grid.Attributes["SortExpression"])
            {
                sortDirection = (grid.Attributes["SortDirection"].ToString() == sortDirection ? "DESC" : "ASC");
            }
            grid.Attributes["SortExpression"] = sortExpression;
            grid.Attributes["SortDirection"] = sortDirection;
            gridviewbind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            //清空所有的信息
            EmptyTxt();
           // txtBNamebind();

            //生成编号


            //改变显示
            //去除选中颜色
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
            }
            Enabledtxt();
            IsBtnVisible(false, true, true, false, false, false, false);
        }

        protected void btnCertain_Click(object sender, EventArgs e)
        {
            #region //判断插入名称和编码是否重复
            string sql1 = "select * from InspectProject where BusinessNumber=@BusinessNumber and ProjectNumber=@ProjectNumber";
            SqlParameter[] paras1 = new SqlParameter[]
            {
                new SqlParameter("@BusinessNumber",ddlBusinessNumber.SelectedValue),
                new SqlParameter("@ProjectNumber",txtProjectNumber.Text)
            };
            object o = SqlHelper.ExecuteScalar(sql1, CommandType.Text, paras1);
            if (o != null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('该业务类型中，该检验项目代码已经存在！')", true);
                return;
            }
            string sql2 = "select * from InspectProject where BusinessNumber=@BusinessNumber and ProjectName=@ProjectName";
            SqlParameter[] paras2 = new SqlParameter[]
            {
                new SqlParameter("@BusinessNumber",ddlBusinessNumber.SelectedValue),
                new SqlParameter("@ProjectName",txtProjectName.Text)
            };
            object oo = SqlHelper.ExecuteScalar(sql2, CommandType.Text, paras2);
            if (oo != null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('该业务类型中，该检验项目名称已经存在！')", true);
                return;
            }
            if (txtProjectNumber.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('检验项目代码不能为空！')", true);
                return;
            }
            if (txtProjectName.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('检验项目名称不能为空！')", true);
                return;
            }
            if (txtBillingUnit.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('计费单位不能为空！')", true);
                return;
            }
            if (txtBillingPrice.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('单位价格不能为空！')", true);
                return;
            }
            #endregion

            //获取要插入的数据
            InspectProject model = new InspectProject();
            model.BusinessNumber = ddlBusinessNumber.SelectedValue;
            model.BusinessName = txtBusinessName.Text;
            model.ProjectNumber = txtProjectNumber.Text;
            model.ProjectName = txtProjectName.Text;
            model.BillingUnit = txtBillingUnit.Text;
            model.BillingPrice = Convert.ToDecimal(txtBillingPrice.Text.Trim());
            model.Remark = txtRemark.Text;

            InspectProjectDAL.Insert(model);
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
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('请选择要修改的检验项目！')", true);
                return;
            }

            //改变显示
            Enabledtxt();

            IsBtnVisible(false, false, false, false, true, true, false);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            #region //判断更新后的名称和编码是否重复
            if ((int)SqlHelper.GetCountNumber("InspectProject", "ID", string.Format("BusinessNumber='{0}' and ProjectNumber='{1}' and ID<>'{2}'", ddlBusinessNumber.SelectedValue, txtProjectNumber.Text, hiddenid.Text)) != 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('该业务类型中，该检验项目代码已经存在！')", true);
                return;
            }
            if ((int)SqlHelper.GetCountNumber("InspectProject", "ID", string.Format("BusinessNumber='{0}' and ProjectName='{1}' and ID<>'{2}'", ddlBusinessNumber.SelectedValue, txtProjectName.Text, hiddenid.Text)) != 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('该业务类型中，该检验项目名称已经存在！')", true);
                return;
            }
            if (txtProjectNumber.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('检验项目代码不能为空！')", true);
                return;
            }
            if (txtProjectName.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('检验项目名称不能为空！')", true);
                return;
            }
            if (txtBillingUnit.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('计费单位不能为空！')", true);
                return;
            }
            if (txtBillingPrice.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('单位价格不能为空！')", true);
                return;
            }
            #endregion
            //获取要插入的数据
            InspectProject model = InspectProjectDAL.GetByID(Convert.ToInt32(hiddenid.Text));
            model.BusinessNumber = ddlBusinessNumber.SelectedValue;
            model.BusinessName = txtBusinessName.Text;
            model.ProjectNumber = txtProjectNumber.Text;
            model.ProjectName = txtProjectName.Text;
            model.BillingUnit = txtBillingUnit.Text;
            model.BillingPrice = Convert.ToDecimal(txtBillingPrice.Text.Trim());
            model.Remark = txtRemark.Text;

            InspectProjectDAL.Update(model);
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
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('请选择要删除的检验项目！')", true);
                return;
            }
            InspectProject model = InspectProjectDAL.GetByID(Convert.ToInt32(hiddenid.Text));
            InspectProjectDAL.DeleteByID(Convert.ToInt32(hiddenid.Text));
            gridviewbind();
        }

        protected void ddlpagesize_SelectedIndexChanged(object sender, EventArgs e)
        {
            AspNetPager1.PageSize = Convert.ToInt32(ddlpagesize.SelectedValue);
            gridviewbind();
        }

        protected void ddlBusinessNumber_TextChanged(object sender, EventArgs e)
        {
            txtBNamebind();
        }
    }
}