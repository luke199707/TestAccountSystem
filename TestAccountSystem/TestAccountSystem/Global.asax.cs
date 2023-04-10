using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace TestAccountSystem
{
    public class Global : System.Web.HttpApplication
    {
        public static int onLineUserNum = 0;
        public static int onLineAdminNum = 0;
        protected void Application_Start(object sender, EventArgs e)
        {
            onLineUserNum = 0;
            onLineAdminNum = 0;
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Application.Lock();
            string str = Session["roleId"]==null?"0":Session["roleId"].ToString();
            if (Session["roleId"] == "5")
            {
                onLineAdminNum++;
            }
            else if (Session["roleId"] != "5")
            {
                onLineUserNum++;
            }
            Application.UnLock();
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {
            Application.Lock();
            if (Session["roleId"] != null && Session["roleId"] != "5" && onLineUserNum > 0)
            {
                onLineUserNum--;
            }
            else if (Session["roleId"] != null && Session["roleId"] == "5" && onLineAdminNum > 0)
            {
                onLineAdminNum--;
            }
            Application.UnLock();
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}