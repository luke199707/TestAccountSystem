using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;

using System.Data.SqlClient;
using TestAccountSystem.DAL;
using TestAccountSystem.Model;
using TestAccountSystem.BLL;

namespace TestAccountSystem
{
    public partial class QandAEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("AdminLayout/Redirect.aspx?type=reLogin");
                return;
            }
            if (!IsPostBack)
            {
                BindGridView();
                BindDropDownList();
            }
        }

        private void BindDropDownList()
        {
            ddlQuestionType.Items.Clear();
            DictInfo model = DictInfoDAL.GetByName("常见问题");
            if (model != null)
            {
                DataTable dt=SqlHelper.Select("name", "DictInfo","parentId='"+model.id.ToString()+"'","id");
                ddlQuestionType.DataSource = dt;
                ddlQuestionType.DataValueField = "name";
                ddlQuestionType.DataTextField = "name";
                ddlQuestionType.DataBind();
            }
            ddlQuestionType.Items.Insert(0,new ListItem("请选择",""));
            ddlQuestionType.SelectedIndex = 0;
        }

        private void BindGridView()
        {
            string sortExpression = gvTable.Attributes["SortExpression"] == null ? "ID" : gvTable.Attributes["SortExpression"];
            bool isASCDirection = gvTable.Attributes["SortDirection"] == "ASC" ? true : false;
            int totalCounts = (int)SqlHelper.GetCountNumber("QandA", "ID", "1=1");
            AspNetPager1.RecordCount = totalCounts;
            if (totalCounts > 0)
            {
                DataTable dt = SqlHelper.GetPagedDataTable("QandA", "1=1", sortExpression, isASCDirection, AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);
                gvTable.DataSource = dt;
                gvTable.DataBind();
            }
            else
            {
                ShowGridViewTitle();
            }

            //显示一条数据的详细信息
            //if (hiddenId.Text != "")
            //{
            //    ShowDetail(Convert.ToInt32(hiddenId.Text));
            //}
            //else
            //{
            //    EmptyInput();
            //}

            ChangeBtnStatus("NONE");
        }

        private void ShowGridViewTitle()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("ID");
            dt.Columns.Add("Question");
            dt.Columns.Add("answer");
            dt.Columns.Add("remark1");
            if (dt.Rows.Count == 0)
            {
                DataRow dr = dt.NewRow();
                dt.Rows.Add(dr);
            }
            gvTable.DataSource = dt;
            gvTable.DataBind();
            gvTable.Rows[0].Visible = false;
        }

        protected void gvTable_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "btnDetailCommand")
            {
                ShowDetail(Convert.ToInt32(e.CommandArgument));
            }
        }

        private void ShowDetail(int id)
        {
            QandA model = QandADAL.GetById(id);
            txtQuestion.Text = model.question;
            txtAnswer.Text = model.answer;
            ddlQuestionType.Text = model.remark2;
            hiddenId.Text = id.ToString();
            for (int i = 0; i < gvTable.Rows.Count; i++)
            {
                if (i % 2 == 0)
                {
                    gvTable.Rows[i].BackColor = gvTable.RowStyle.BackColor;
                }
                else
                {
                    gvTable.Rows[i].BackColor = gvTable.AlternatingRowStyle.BackColor;
                }
                Literal literalId = this.gvTable.Rows[i].FindControl("LiteralId") as Literal;

                //如果是显示行则背景色为黄色
                if (Convert.ToInt32(literalId.Text) == id)
                {
                    gvTable.Rows[i].BackColor = System.Drawing.Color.LightYellow;
                }
            }
        }

        protected void gvTable_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            Button btnDetail = e.Row.FindControl("btnDetail") as Button;
            if (btnDetail != null)
            {
                e.Row.Attributes["onclick"] = String.Format("javascript:document.getElementById('{0}').click()", btnDetail.ClientID);
                e.Row.Attributes["style"] = "cursor:pointer";
            }
        }

        protected void gvTable_Sorting(object sender, GridViewSortEventArgs e)
        {
            string sortExpression = e.SortExpression.ToString();
            string sortDirection = "ASC";
            if (sortExpression == gvTable.Attributes["SortExpression"])
            {
                sortDirection = (gvTable.Attributes["SortDirection"].ToString() == sortDirection ? "DESC" : "ASC");
            }
            gvTable.Attributes["SortExpression"] = sortExpression;
            gvTable.Attributes["SortDirection"] = sortDirection;
            BindGridView();
        }

        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            BindGridView();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            EmptyInput();
            ChangeBtnStatus("ADD");
            ddlQuestionType.SelectedIndex = 0;
        }

        protected void btnModify_Click(object sender, EventArgs e)
        {
            if (hiddenId.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "key", "alert('请选择要修改的问题！')", true);
                return;
            }
            ChangeBtnStatus("MODIFY");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (hiddenId.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "key", "alert('请选择要删除的问题！')", true);
                return;
            }
            QandADAL.DeleteById(int.Parse(hiddenId.Text.Trim()));

            // LogBLL.LogInsert(Session["UserName"].ToString(),"删除常见问题","删除了XXX",Session["roleId"].ToString());
            EmptyInput();
            ddlQuestionType.SelectedIndex = 0;
            BindGridView();
        }
        //添加按钮的保存按钮
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtQuestion.Text.Trim() == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('问题不能为空！'); ", true);
                return;
            }
            if (txtAnswer.Text.Trim() == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('回答不能为空！'); ", true);
                return;
            }
            if (ddlQuestionType.SelectedIndex==0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('请选择问题类型！'); ", true);
                return;
            }
            QandA model = new QandA();
            model.question = txtQuestion.Text.Trim();
            model.answer = txtAnswer.Text.Trim();
            model.remark1 = DateTime.Now.ToString();
            model.remark2 = ddlQuestionType.SelectedValue;
            QandADAL.Insert(model);
            // LogBLL.LogInsert(Session["UserName"].ToString(),"添加问题","添加XXX问题",Session["roleId"].ToString());
            //EmptyInput();
            BindGridView();
        }
        //修改按钮的保存按钮
        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            if (txtQuestion.Text.Trim() == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('问题不能为空！'); ", true);
                return;
            }
            if (txtAnswer.Text.Trim() == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('回答不能为空！'); ", true);
                return;
            }
            if (ddlQuestionType.SelectedIndex==0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('请选择问题类型！'); ", true);
                return;
            }
            if ((int)SqlHelper.GetCountNumber("QandA", "ID", string.Format("question='{0}' and ID<>{1}", txtQuestion.Text.Trim(), hiddenId.Text.Trim())) != 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "key", "alert('问题题目已经存在！')", true);
                return;
            }
            QandA model = new QandA();
            model.id = int.Parse(hiddenId.Text.Trim());
            model.question = txtQuestion.Text.Trim();
            model.answer = txtAnswer.Text.Trim();
            model.remark1 = DateTime.Now.ToString();
            model.remark2 = ddlQuestionType.SelectedValue;
            QandADAL.Update(model);
            //LogBLL.LogInsert(Session["UserName"].ToString(), "修改常见问题", "修改了XXX", Session["roleId"].ToString());
            BindGridView();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
           // EmptyInput();
            ChangeBtnStatus("CANCEL");
            BindGridView();
        }

        private void ChangeBtnStatus(string operation)
        {
            switch (operation)
            {
                case "NONE":
                    {
                        btnAdd.Visible = true;
                        btnCancel.Visible = false;
                        btnConfirm.Visible = false;
                        btnDelete.Visible = true;
                        btnModify.Visible = true;
                        btnSave.Visible = false;


                        txtQuestion.Enabled = false;
                        txtAnswer.Enabled = false;
                        ddlQuestionType.Enabled = false;
                        // ckEditor.ReadOnly = true;

                        break;
                    }
                case "ADD":
                    {
                        btnAdd.Visible = false;
                        btnDelete.Visible = false;
                        btnModify.Visible = false;
                        btnCancel.Visible = true;
                        btnSave.Visible = true;
                        btnConfirm.Visible = false;


                        txtQuestion.Enabled = true;
                        txtAnswer.Enabled = true;
                        ddlQuestionType.Enabled = true;
                        // ckEditor.ReadOnly = false;
                        break;
                    }
                case "MODIFY":
                    {
                        btnAdd.Visible = false;
                        btnDelete.Visible = false;
                        btnModify.Visible = false;
                        btnCancel.Visible = true;
                        btnSave.Visible = false;
                        btnConfirm.Visible = true;

                        txtQuestion.Enabled = true;
                        txtAnswer.Enabled = true;
                        ddlQuestionType.Enabled = true;
                        // ckEditor.ReadOnly = false;
                        break;
                    }
                case "CANCEL":
                    {
                        btnAdd.Visible = true;
                        btnCancel.Visible = false;
                        btnConfirm.Visible = false;
                        btnDelete.Visible = true;
                        btnModify.Visible = true;
                        btnSave.Visible = false;


                        txtQuestion.Enabled = false;
                        txtAnswer.Enabled = false;
                        ddlQuestionType.Enabled = false;
                        // ckEditor.ReadOnly = false;
                        break;
                    }
            }
        }

        private void EmptyInput()
        {
            txtQuestion.Text = "";
            txtAnswer.Text = "";
            //txtHiddenId.Text = "";
            hiddenId.Text = "";
        }

        public string FormatDateTime(string datetime)
        {
            if (datetime != "")
            {
                return DateTime.Parse(datetime).ToString("yyyy-MM-dd hh:mm:ss");
            }
            else
            {
                return "";
            }
        }

        protected void ddlpagesize_SelectedIndexChanged(object sender, EventArgs e)
        {
            AspNetPager1.PageSize = Convert.ToInt32(ddlpagesize.SelectedValue);
            BindGridView();
        }
    }
}