using CommonHelper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TestAccountSystem.BLL;
using TestAccountSystem.DAL;
using TestAccountSystem.Model;

namespace TestAccountSystem
{
    public partial class UpdatePwd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("AdminLayout/Redirect.aspx?type=reLogin");
                return;
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Session["sessionId"] == null)
            {
                Response.Redirect("AdminLayout/Redirect.aspx?type=reLogin");
                return;
            }
            string oldpwd = txtOldPwd.Text.Trim();
            string newpwd1 = txtNewPwd1.Text.Trim();
            string newpwd2 = txtNewPwd2.Text.Trim();
            if (oldpwd == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('旧密码不能为空！');bindDatePicker()", true);
                return;
            }
            if (newpwd1 == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('新密码不能为空！');bindDatePicker()", true);
                return;
            }
            if (newpwd2 == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('确认密码不能为空！');bindDatePicker()", true);
                return;
            }
            int id = int.Parse(Session["sessionId"].ToString());
            AllUser model = AllUserDAL.GetById(id);
            if (model.pwd != common.GetStringToMD5(oldpwd))
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('旧密码错误！');bindDatePicker()", true);
                return;
            }
            if (newpwd1 != newpwd2)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('输入的新密码两次不一致！');bindDatePicker()", true);
                return;
            }
            if (newpwd1 == oldpwd)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('新密码与旧密码相同，重新输入新密码！');bindDatePicker()", true);
                return;
            }
            if (AllUserDAL.UpdatePwd(common.GetStringToMD5(newpwd1), id) > 0)
            {
                try
                {
                    LogBLL.LogInsert(Session["UserName"].ToString(), "修改密码", "修改密码成功", Session["roleId"].ToString());
                }
                catch (Exception)
                {
                }
                finally
                {

                    // ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('密码更新成功，请重新登录！');bindDatePicker()", true);
                    Response.Redirect("AdminLayout/Redirect.aspx?type=updatepwd");
                    //return;
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('密码更新失败了！');bindDatePicker()", true);
                return;
            }


        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtOldPwd.Text = "";
            txtNewPwd1.Text = "";
            txtNewPwd2.Text = "";
        }
    }
}