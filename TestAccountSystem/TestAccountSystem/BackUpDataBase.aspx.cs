using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using TestAccountSystem.DAL;
using TestAccountSystem.BLL;

namespace TestAccountSystem
{
    public partial class BackUpDataBase : System.Web.UI.Page
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
                BindDeleteDataBase();
            }
        }

        #region 备份
        //创建备份数据库名称
        protected void btnCreateName_Click(object sender, EventArgs e)
        {
            txtBackUpName.Text = "TestAccountSystem" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".bak";
        }

        //备份
        protected void btnBackUp_Click(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("AdminLayout/Redirect.aspx?type=reLogin");
                return;
            }
            string s = txtBackUpName.Text.Trim();
            if (s == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('请先生成备份数据库名称！')", true);
                return;
            }
            if (s.Split('.')[1] != "bak")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('备份的数据库文件名扩展名必须为“bak”')", true);
                return;
            }
            else
            {
                if (System.IO.File.Exists(Server.MapPath(@"~/DataBaseBak/" + s)))
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('您输入的备份数据库名已经存在，请重新输入！')", true);
                    return;
                }
                else
                {
                    string path = Server.MapPath("~/DataBaseBak/" + s).ToString();

                    DataBaseDAL.BackUp(path);
                    try
                    {
                        LogBLL.LogInsert(Session["UserName"].ToString(), "备份数据库", "备份了数据库", Session["roleId"].ToString());
                    }
                    catch (Exception)
                    {
                    }
                    finally
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", @"closebackupdialog()", true);
                        txtBackUpName.Text = "";
                    }


                }
            }

            BindDeleteDataBase();
        }
        #endregion

        private void BindDeleteDataBase()
        {
            ddlDeleteDataBase.Items.Clear();
            ddlDeleteDataBase.Items.Add("现有备份");
            string[] files = Directory.GetFiles(Server.MapPath(@"~/DataBaseBak/"));

            foreach (string file in files)
            {
                ddlDeleteDataBase.Items.Add(file.Replace(Server.MapPath(@"~/DataBaseBak/"), "").Replace("\\", "").ToString());
            }
        }
        protected void ddlDeleteDataBase_SelectedIndexChanged(object sender, EventArgs e)
        {
            string name = ddlDeleteDataBase.SelectedValue;
            txtDeleteName.Text = name;
            txtDeleteCreateTime.Text = File.GetCreationTime(Server.MapPath(@"~\DataBaseBak\" + name)).ToString();
        }

    }
}