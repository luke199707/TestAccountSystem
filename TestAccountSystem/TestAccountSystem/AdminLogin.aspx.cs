using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CommonHelper;
using TestAccountSystem.BLL;
using TestAccountSystem.DAL;
using TestAccountSystem.Model;

namespace TestAccountSystem
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            string code = txtCode.Text.Trim();
            string name = txtName.Text.Trim();
            string pwd = txtPwd.Text.Trim();

            if (name == "")
            {
                message.Text = "*用户名不能为空！";
                return;
            }
            if (pwd == "")
            {
                message.Text = "*密码不能为空！";
                return;
            }
            //------------------------------------------------------------验证码暂时取消------------------------------------
            if (code == "")
            {
                message.Text = "验证码不能为空！";
                return;
            }

            if (Session["CheckCode"] == null)
            {
                message.Text = "验证码过期！";
                Random random = new Random();
                CodeImage.Src = "CodeValidate.aspx?id=" + random.Next();
                return;
            }
            if (code.ToLower() != Session["CheckCode"].ToString().ToLower())
            {
                message.Text = "验证码填写不正确！";
                Random random = new Random();
                CodeImage.Src = "CodeValidate.aspx?id=" + random.Next();
                return;
            }
            //---------------------------------------------------------------------------------------------------------------------
            Customer model1 = CustomerDAL.GetByName(name);
            AllUser model = AllUserDAL.GetByName(name);
            if (model == null)
            {
                message.Text = "*用户不存在！";
                return;
            }
            if (!model.state)
            {
                message.Text = "*用户未验证！";
                return;
            }
            if (!model.isUseful)
            {
                message.Text = "*用户被禁用！";
                return;
            }
            if (model.pwd != common.GetStringToMD5(pwd))
            {
                message.Text = "*密码错误！";
                return;
            }

            if (model.roleId==1)
            {
                Session["RealName"] = model1.legalPerson;
            }
            else
            {
                Session["RealName"] = model.realName;
            }
            Session["UserName"] = model.userName;
            Session["roleId"] = model.roleId;
            Session.Remove("CheckCode");
            // Session["Id"] = model1.id;
            Session["sessionId"] = model.id;
            LogBLL.LogInsert(Session["UserName"].ToString(),"登录系统", "登录系统成功",model.roleId.ToString());
            Response.Redirect("AdminLayout/Default.html");
        }


        protected void btnReset_Click1(object sender, EventArgs e)
        {
            txtCode.Text = txtName.Text = txtPwd.Text = "";
        }
    }
}