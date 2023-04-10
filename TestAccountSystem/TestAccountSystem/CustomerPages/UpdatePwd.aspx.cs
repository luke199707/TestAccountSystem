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

namespace TestAccountSystem.CustomerPages
{
    public partial class UpdatePwd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("../AdminLayout/Redirect.aspx?type=reLogin");
                return;
            }
            else
            {
                Customer model = CustomerDAL.GetByName(Session["UserName"].ToString());
                if ( model.address == null || model.bankAccount == null || model.companyName == null || model.customerNumber == null || model.phone == null || model.openUnit == null || model.legalPerson == null)
                {
                    Response.Redirect("defaultMsg.aspx");//<a href="../CustomerPages/default.aspx">../CustomerPages/default.aspx</a>
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
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

            AllUser au = AllUserDAL.GetByName(Session["UserName"].ToString());
            if (au.pwd != common.GetStringToMD5(oldpwd))
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
            Customer cu = CustomerDAL.GetByName(Session["UserName"].ToString());
            string strnewpwd = common.GetStringToMD5(newpwd1);
            cu.pwd = strnewpwd;
            au.pwd = strnewpwd;
            if (AllUserDAL.Update(au) > 0)
            {
                if (CustomerDAL.Update(cu) > 0)
                {
                   
                    LogBLL.LogInsert(Session["UserName"].ToString(), "修改密码", "修改密码", Session["roleId"].ToString());
                    Session.Remove("sessionId");
                    Session.Remove("UserName");
                    Session.Remove("roleId");
                    Session.Abandon();
                    // ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('密码更新成功，请重新登录！');bindDatePicker()", true);
                    Response.Redirect("../AdminLayout/Redirect.aspx?type=updatepwd");
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