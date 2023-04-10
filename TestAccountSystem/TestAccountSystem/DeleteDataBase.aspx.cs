using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using TestAccountSystem.BLL;

namespace TestAccountSystem
{
    public partial class DeleteDataBase : System.Web.UI.Page
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


        #region 删除

        private void BindDeleteDataBase()
        {
            ddlDeleteDataBase.Items.Clear();
            ddlDeleteDataBase.Items.Add("请选择");
            string[] files = Directory.GetFiles(Server.MapPath(@"~/DataBaseBak/"));

            foreach (string file in files)
            {
                ddlDeleteDataBase.Items.Add(file.Replace(Server.MapPath(@"~/DataBaseBak/"), "").Replace("\\", "").ToString());
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("AdminLayout/Redirect.aspx?type=reLogin");
                return;
            }
            string name = ddlDeleteDataBase.SelectedValue;
            if (name == "请选择")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('请选择要删除的备份数据库！')", true);
                return;
            }
            string filePath = Server.MapPath(@"~/DataBaseBak/" + name);

            LabelDeleteTip.Text = filePath;

            File.Delete(filePath);
            // PE_LogDAL.AdminInsert("删除数据库", Session["Admin"].ToString() + "删除数据库" + name);
            try
            {
                LogBLL.LogInsert(Session["UserName"].ToString(), "删除数据库备份", "删除了一个数据库备份文件:"+filePath, Session["roleId"].ToString());
            }
            catch (Exception)
            {
            }
            finally
            {

                LabelDeleteTip.Text = "删除成功！";
                txtDeleteName.Text = "";
                txtDeleteCreateTime.Text = "";
                BindDeleteDataBase();
            }
        }

        protected void ddlDeleteDataBase_SelectedIndexChanged(object sender, EventArgs e)
        {
            string name = ddlDeleteDataBase.SelectedValue;
            txtDeleteName.Text = name;
            txtDeleteCreateTime.Text = File.GetCreationTime(Server.MapPath(@"~\DataBaseBak\" + name)).ToString();
            LabelDeleteTip.Text = "";
        }
        #endregion


    }
}