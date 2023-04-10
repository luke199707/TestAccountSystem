using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TestAccountSystem.BLL;

namespace TestAccountSystem.AdminLayout
{
    public partial class Top : System.Web.UI.Page
    {
        public string adminUser { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lbSystemTime.InnerText = DateTime.Now.Year + "年" + DateTime.Now.Month + "月" + DateTime.Now.Day + "日"; 
                adminUser =Session["RealName"].ToString();
                /*if (Session["Admin"] == null)
                {
                    Response.Redirect("../AdminLayout/Redirect.aspx?type=reLogin");
                    return;
                }*/
                //else
                //{
                //    //Album_Administrator ad = Album_AdministratorDAL.GetByName(Session["Admin"].ToString());
                //    // WT_Role ro = WT_RoleDAL.GetByCode(ad.role_code);


                //}
            }
        }

        protected void lbLogout_Click(object sender, EventArgs e)
        {
            LogBLL.LogInsert(Session["UserName"].ToString(), "点击退出系统", "退出了系统", Session["roleId"].ToString());
            Session.Abandon();
            Session.Remove("UserName");
            Session.Remove("roleId");
            Session.Remove("RealName");
            Session.Remove("sessionId");
            Response.Write("<script>parent.location.assign('../AdminLogin.aspx');</script>");
        }
    }
}