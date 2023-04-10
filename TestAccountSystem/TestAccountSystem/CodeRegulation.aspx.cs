using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TestAccountSystem.BLL;
using TestAccountSystem.DAL;
using TestAccountSystem.Model;

namespace TestAccountSystem
{
    public partial class CodeRegulation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"]==null)
            {
                Response.Redirect("AdminLayout/Redirect.aspx?type=reLogin");
                return;
            }
            if (!IsPostBack)
            {
                Receiptgridviewbind();
                //int num = int.Parse("0012");
            }


        }
        #region 单据编码
        protected void AspNetPager1Receipt_PageChanged(object sender, EventArgs e)
        {
            Receiptgridviewbind();
        }

        private void Receiptgridviewbind()
        {
            string sortExpression = Receiptgrid.Attributes["SortExpression"] == null ? "ID" : Receiptgrid.Attributes["SortExpression"];
            bool isASCDirection = Receiptgrid.Attributes["SortDirection"] == "ASC" ? true : false;
            int totalCounts = (int)SqlHelper.GetCountNumber("codeRegulation", "ID", "1=1");
            if (totalCounts > 0)
            {
                AspNetPager1Receipt.RecordCount = totalCounts;
                Receiptgrid.DataSource = SqlHelper.GetPagedDataTable("codeRegulation", "1=1", sortExpression, isASCDirection, AspNetPager1Receipt.StartRecordIndex, AspNetPager1Receipt.EndRecordIndex);
                Receiptgrid.DataBind();
            }
            else
            {
                ShowReceiptgridViewTitle();
            }

            ////显示一条数据的详细信息
            //if (Receiptid != "")
            //{
            //    ReceiptShowDetail(Convert.ToInt32(Receiptid));
            //    Receiptid = "";
            //}

            ReceiptDisabletxt();
            //按钮的变化
            ReceiptIsBtnVisible(true, false, false, true, false, false, true);


        }

        private void ShowReceiptgridViewTitle()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("ID");
            dt.Columns.Add("Name");
            dt.Columns.Add("Prefix");
            dt.Columns.Add("Connector1");
            dt.Columns.Add("TimeType");
            dt.Columns.Add("Connector2");
            dt.Columns.Add("DigistNum");
            dt.Columns.Add("StartSerial");
            dt.Columns.Add("Example");
            //  dt.Columns.Add("Remark");

            if (dt.Rows.Count == 0)
            {
                DataRow dr = dt.NewRow();
                dt.Rows.Add(dr);
            }
            Receiptgrid.DataSource = dt;
            Receiptgrid.DataBind();
            Receiptgrid.Rows[0].Visible = false;
        }

        protected void ReceiptgridViewDepart_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //找到该行的按钮
            Button btnDetail = e.Row.FindControl("btnDetail") as Button;

            if (btnDetail != null)
            {
                //把该行的onclick事件绑定成按钮的点击事件
                e.Row.Attributes["onclick"] = String.Format("javascript:document.getElementById('{0}').click()", btnDetail.ClientID);
                e.Row.Attributes["style"] = "cursor:pointer";
            }
        }

        protected void ReceiptgridViewDepart_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "btnDetailCommand")
            {

                //显示选中行的详细信息
                ReceiptShowDetail(Convert.ToInt32(e.CommandArgument));
            }
        }

        private void ReceiptShowNullDetail()
        {
            txtReceiptName.Text =
            txtReceiptPrefix.Text =
            txtReceiptConnector1.Text =
            txtReceiptConnector2.Text =
            txtReceiptDigitsNum.Text =
            txtReceiptStartSerial.Text =
            txtReceiptExample.Text =
            txtReceiptRemark.Text =
            Receipthiddenid.Text = "";
            ddlReceiptTimeType.SelectedIndex = 0;
            ReceiptDisabletxt();
            //按钮的变化
            ReceiptIsBtnVisible(true, false, false, false, false, false, false);
        }

        private void ReceiptShowDetail(int id)
        {
            //取出数据
            CodeRegulation1 model = CodeRegulationDAL.GetById(id);
            ////赋值
            txtReceiptName.Text = model.name;
            txtReceiptPrefix.Text = model.prefix;
            txtReceiptConnector1.Text = model.connector1;
            ddlReceiptTimeType.SelectedValue = model.timeType;
            txtReceiptConnector2.Text = model.connector2;
            txtReceiptDigitsNum.Text = model.digistNum.ToString();
            txtReceiptStartSerial.Text = model.startSerial;
            txtReceiptExample.Text = model.example;
            txtReceiptRemark.Text = model.remark1;

            //隐藏的id
            Receipthiddenid.Text = model.id.ToString();

            ReceiptDisabletxt();
            //按钮的变化
            ReceiptIsBtnVisible(true, false, false, true, false, false, true);
            //数据行的交替显示     ReceiptgridViewUser.Rows.Count是数据行的总行数
            for (int i = 0; i < Receiptgrid.Rows.Count; i++)
            {
                if (i % 2 == 0)
                {
                    Receiptgrid.Rows[i].BackColor = Receiptgrid.RowStyle.BackColor;
                }
                else
                {
                    Receiptgrid.Rows[i].BackColor = Receiptgrid.AlternatingRowStyle.BackColor;
                }

                Literal literalId = this.Receiptgrid.Rows[i].FindControl("LiteralId") as Literal;

                //如果是显示行则背景色为黄色
                if (Convert.ToInt32(literalId.Text) == id)
                {
                    Receiptgrid.Rows[i].BackColor = System.Drawing.Color.LightYellow;
                }
            }

        }
        private void ReceiptEmptyTxt()
        {
            //清空所有的信息
            txtReceiptName.Text =
            txtReceiptPrefix.Text =
            txtReceiptConnector1.Text =
            txtReceiptConnector2.Text =
            txtReceiptDigitsNum.Text =
            txtReceiptStartSerial.Text =
            txtReceiptExample.Text =
            txtReceiptRemark.Text =
            Receipthiddenid.Text = "";
            ddlReceiptTimeType.SelectedIndex = 0;
        }

        //设置功能按钮的显示
        private void ReceiptIsBtnVisible(bool Add, bool Certain, bool AddCancel, bool Update, bool Save, bool UpdateCancel, bool Del)
        {
            btnReceiptAdd.Visible = Add;
            btnReceiptCertain.Visible = Certain;
            btnReceiptAddCancel.Visible = AddCancel;
            btnReceiptUpdate.Visible = Update;
            btnReceiptSave.Visible = Save;
            btnReceiptUpdateCancel.Visible = UpdateCancel;
            btnReceiptDel.Visible = Del;
        }

        protected void btnReceiptAdd_Click(object sender, EventArgs e)
        {
            ReceiptEmptyTxt();
            ReceiptIsBtnVisible(false, true, true, false, false, false, false);
            //改变显示

            //给流水号位数和起始流水号初始值
            //txtReceiptDigitsNum.Text = "4";
            //txtReceiptStartSerial.Text = "1";
            ReceiptEnabledtxt();

            for (int i = 0; i < Receiptgrid.Rows.Count; i++)
            {
                if (i % 2 == 0)
                {
                    Receiptgrid.Rows[i].BackColor = Receiptgrid.RowStyle.BackColor;
                }
                else
                {
                    Receiptgrid.Rows[i].BackColor = Receiptgrid.AlternatingRowStyle.BackColor;
                }
            }
        }

        //添加
        protected void btnReceiptCertain_Click(object sender, EventArgs e)
        {
            //if (Session["Admin"] == null)
            //{
            //    Response.Redirect("../AdminCenter/Redirect.aspx?type=reLogin");
            //    return;
            //}

            //#region //判断插入名称和编码是否重复
            if ((int)SqlHelper.GetCountNumber("codeRegulation", "ID", string.Format("Name='{0}'", txtReceiptName.Text.Trim())) != 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "key", "alert('该编码名称已经存在！')", true);
                return;
            }
            if ((int)SqlHelper.GetCountNumber("codeRegulation", "ID", string.Format("Prefix='{0}'", txtReceiptPrefix.Text.Trim())) != 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "key", "alert('该编码前缀已经存在！')", true);
                return;
            }
            if (txtReceiptName.Text.Trim() == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "key", "alert('编码名称不能为空！')", true);
                return;
            }
            if (txtReceiptPrefix.Text.Trim() == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "key", "alert('编码前缀不能为空！')", true);
                return;
            }
            //#endregion
            //获取要插入的数据
            CodeRegulation1 model = new CodeRegulation1(); int m;
            if (int.TryParse(txtReceiptDigitsNum.Text.Trim(), out m))
            {
                model.digistNum = m;
            }
            else
            {
                model.digistNum = 4;
               // model.digistNum = int.Parse(txtReceiptDigitsNum.Text == "" ? "4" : txtReceiptDigitsNum.Text.Trim());
            }

            model.startSerial = txtReceiptStartSerial.Text == "" ? "0001" : txtReceiptStartSerial.Text.Trim();
            if (model.digistNum != model.startSerial.Length)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "key", "alert('流水号位数与设置的位数不一致！')", true);
                return;
            }
            model.name = txtReceiptName.Text;
            model.prefix = txtReceiptPrefix.Text;
            model.connector1 = txtReceiptConnector1.Text;
            model.timeType = ddlReceiptTimeType.SelectedValue;
            model.connector2 = txtReceiptConnector2.Text;

            //model.Remark = txtReceiptRemark.Text;
            model.example = ReceiptConnectEmample();
            //  Receiptid = PE_ReceiptCodeDefineBLL.Insert(model).ToString();
            CodeRegulationDAL.Insert(model);
            // PE_LogDAL.AdminInsert("添加单据编码", Session["Admin"].ToString() + "添加单据编码" + model.name);
            //LogBLL.LogInsert(Session["UserName"].ToString(),"添加编码规则","添加编码规则:"+model.name,Session["roleId"].ToString());
            InsertLog("添加编码规则","添加编码规则:"+model.name);
            //重新绑定刷新
            // Receiptgridviewbind();
        }
        private void InsertLog(string operation,string description) {
            try
            {
                LogBLL.LogInsert(Session["UserName"].ToString(), operation, description, Session["roleId"].ToString());
            }
            catch (Exception)
            {
            }
            finally {
                Receiptgridviewbind();
            }
            
        }
        //添加的取消按钮
        protected void btnReceiptAddCancel_Click(object sender, EventArgs e)
        {
            ReceiptEmptyTxt();
            ReceiptIsBtnVisible(true, false, false, true, false, false, true);
            ReceiptDisabletxt();
        }
        //修改
        protected void btnReceiptUpdate_Click(object sender, EventArgs e)
        {

            if (Receipthiddenid.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "key", "alert('请选择要修改的编码规则！')", true);
                return;
            }
            ReceiptEnabledtxt();
            ReceiptIsBtnVisible(false, false, false, false, true, true, false);
        }
        //修改的保存
        protected void btnReceiptSave_Click(object sender, EventArgs e)
        {
            //#region //判断插入名称和编码是否重复
            if ((int)SqlHelper.GetCountNumber("codeRegulation", "ID", string.Format("name='{0}' and ID<>{1}", txtReceiptName.Text.Trim(), Receipthiddenid.Text.Trim())) != 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "key", "alert('编码名称已经存在！')", true);
                return;
            }
            if ((int)SqlHelper.GetCountNumber("codeRegulation", "ID", string.Format("Prefix='{0}' and ID<>{1}", txtReceiptPrefix.Text.Trim(), Receipthiddenid.Text.Trim())) != 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "key", "alert('编码前缀已经存在！')", true);
                return;
            }
            if (txtReceiptName.Text.Trim() == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "key", "alert('编码名称不能为空！')", true);
                return;
            }
            if (txtReceiptPrefix.Text.Trim() == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "key", "alert('编码前缀不能为空！')", true);
                return;
            }
            //#endregion
            ////获取要插入的数据
            CodeRegulation1 model = new CodeRegulation1();int m;
            if (int.TryParse(txtReceiptDigitsNum.Text.Trim(), out m))
            {
                model.digistNum = m;
            }
            else
            {
                model.digistNum = 4;
                // model.digistNum = int.Parse(txtReceiptDigitsNum.Text == "" ? "4" : txtReceiptDigitsNum.Text.Trim());
            }

            model.startSerial = txtReceiptStartSerial.Text == "" ? "0001" : txtReceiptStartSerial.Text.Trim();
            if (model.digistNum != model.startSerial.Length)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "key", "alert('流水号位数与设置的位数不一致！')", true);
                return;
            }
            model.name = txtReceiptName.Text;
            model.prefix = txtReceiptPrefix.Text;
            model.connector1 = txtReceiptConnector1.Text;
            model.timeType = ddlReceiptTimeType.SelectedValue;
            model.connector2 = txtReceiptConnector2.Text;
            model.id = Convert.ToInt32(Receipthiddenid.Text.Trim());
            model.example = ReceiptConnectEmample();
            //// model.Remark = "1";
            //model.Remark = txtReceiptRemark.Text;
            //PE_ReceiptCodeDefineBLL.Update(model);
            CodeRegulationDAL.Update(model);
            //PE_LogDAL.AdminInsert("修改单据编码", Session["Admin"].ToString() + "修改单据编码" + model.Name);
            // LogBLL.LogInsert(Session["UserName"].ToString(),"修改编码规则","修改编码规则："+model.id,Session["roleId"].ToString());
            InsertLog("修改编码规则","修改编码规则："+model.id);
            //Receiptid = model.ID.ToString();
            //Receiptgridviewbind();
        }
        //修改的取消
        protected void btnReceiptUpdateCancel_Click(object sender, EventArgs e)
        {
            Receiptgridviewbind();
            ReceiptIsBtnVisible(true, false, false, true, false, false, true);
            ReceiptDisabletxt();

        }
        //删除
        protected void btnReceiptDel_Click(object sender, EventArgs e)
        {

            if (Receipthiddenid.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "key", "alert('请选择要删除的编码规则！')", true);
                return;
            }
            //PE_ReceiptCodeDefineBLL.DeleteByID(Convert.ToInt32(Receipthiddenid.Text));
            CodeRegulationDAL.DeleteById(int.Parse(Receipthiddenid.Text.Trim()));
            // LogBLL.LogInsert(Session["UserName"].ToString(),"删除编码规则","删除编码规则：",Session["roleId"].ToString());
            InsertLog("删除编码规则","删除编码规则：");
            ReceiptEmptyTxt();
           // Receiptgridviewbind();
        }

        private void ReceiptDisabletxt()
        {
            txtReceiptName.Attributes.Add("disabled", "");
            txtReceiptPrefix.Attributes.Add("disabled", "");
            txtReceiptConnector1.Attributes.Add("disabled", "");
            ddlReceiptTimeType.Attributes.Add("disabled", "");
            txtReceiptConnector2.Attributes.Add("disabled", "");
            txtReceiptDigitsNum.Attributes.Add("disabled", "");
            txtReceiptStartSerial.Attributes.Add("disabled", "");
            txtReceiptRemark.Attributes.Add("disabled", "");
            txtReceiptExample.Attributes.Add("disabled", "");
        }

        private void ReceiptEnabledtxt()
        {
            txtReceiptName.Attributes.Remove("disabled");
            txtReceiptPrefix.Attributes.Remove("disabled");
            txtReceiptConnector1.Attributes.Remove("disabled");
            ddlReceiptTimeType.Attributes.Remove("disabled");
            txtReceiptConnector2.Attributes.Remove("disabled");
            txtReceiptDigitsNum.Attributes.Remove("disabled");
            txtReceiptStartSerial.Attributes.Remove("disabled");
            txtReceiptRemark.Attributes.Remove("disabled");
            //  txtExample.Attributes.Remove("disabled");
        }

        private string ReceiptConnectEmample()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(txtReceiptPrefix.Text).Append(txtReceiptConnector1.Text);
            sb.Append(DateTime.Now.ToString(ddlReceiptTimeType.SelectedValue));
            sb.Append(txtReceiptConnector2.Text);
            sb.Append(txtReceiptStartSerial.Text);
            #region
            // sb.Append(txtReceiptStartSerial.Text.PadLeft(Convert.ToInt32(txtReceiptDigitsNum.Text)));
            //if (txtReceiptDigitsNum.Text == "")
            //{
            //    sb.Append(txtReceiptStartSerial.Text);
            //}
            //else
            //{
            //    sb.Append(txtReceiptStartSerial.Text.PadLeft(Convert.ToInt32(txtReceiptDigitsNum.Text)));
            //}
            #endregion
            return sb.ToString();

        }

        protected void Receiptgrid_Sorting(object sender, GridViewSortEventArgs e)
        {
            string sortExpression = e.SortExpression.ToString();
            string sortDirection = "ASC";
            if (sortExpression == Receiptgrid.Attributes["SortExpression"])
            {
                sortDirection = (Receiptgrid.Attributes["SortDirection"].ToString() == sortDirection ? "DESC" : "ASC");
            }
            Receiptgrid.Attributes["SortExpression"] = sortExpression;
            Receiptgrid.Attributes["SortDirection"] = sortDirection;
            Receiptgridviewbind();
        }

        protected void ddlReceiptpagesize_SelectedIndexChanged(object sender, EventArgs e)
        {
            AspNetPager1Receipt.PageSize = Convert.ToInt32(ddlReceiptpagesize.SelectedValue);
            Receiptgridviewbind();
        }

        #endregion
    }
}