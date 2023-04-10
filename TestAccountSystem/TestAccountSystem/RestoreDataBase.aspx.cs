using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TestAccountSystem.BLL;
using TestAccountSystem.DAL;

namespace TestAccountSystem
{
    public partial class RestoreDataBase : System.Web.UI.Page
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

                BindData();
            }

        }
        private void BindData()
        {

            ddlRestoreDataBase.Items.Clear();
            ddlRestoreDataBase.Items.Add("请选择");
            //E:\\桌面\\TestAccountSystem\\TestAccountSystem\\TestAccountSystem\\DataBaseBak\\TestAccountSystem20201120155529.bak
            string[] fileList = Directory.GetFiles(Server.MapPath(@"~/DataBaseBak/"));
            foreach (string item in fileList)
            {//item.Replace(Server.MapPath(@"~/DataBaseBak/"), "").Replace("\\", "").ToString()
                //string str = Server.MapPath(@"~/DataBaseBak/"); 
                ddlRestoreDataBase.Items.Add(item.Replace(Server.MapPath(@"~/DataBaseBak/"), ""));
            }
        }
        protected void btnRestore_Click(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("AdminLayout/Redirect.aspx?type=reLogin");
                return;//<a href="AdminLayout/Redirect.aspx">AdminLayout/Redirect.aspx</a>
            }
            string name = ddlRestoreDataBase.SelectedValue.Trim();
            if (name == "请选择")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('请选择要恢复的备份数据库！')", true);
                return;
            }
            string path = Server.MapPath(@"~/DataBaseBak/" + name);
            LogBLL.LogInsert(Session["UserName"].ToString(), "还原数据库", "还原了数据库", Session["roleId"].ToString());
            DataBaseDAL.Restore("TestAccountSystem", path);
            try
            {
                LogBLL.LogInsert(Session["UserName"].ToString(), "还原数据库", "还原数据库成功", Session["roleId"].ToString());
            }
            catch (Exception)
            {

            }
            finally
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "close", "closeModal()", true);
                txtRestoreName.Text = "";
                txtRestoreCreateTime.Text = "";
            }


            // BindData();
        }

        protected void ddlRestoreDataBase_SelectedIndexChanged(object sender, EventArgs e)
        {
            string name = ddlRestoreDataBase.SelectedValue;
            txtRestoreName.Text = name;
            txtRestoreCreateTime.Text = File.GetCreationTime(Server.MapPath(@"~\DataBaseBak\" + name)).ToString();
            LabelRestoreTip.Text = "";
        }
    }
}