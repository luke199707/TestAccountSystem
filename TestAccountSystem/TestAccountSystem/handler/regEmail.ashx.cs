using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TestAccountSystem.DAL;

namespace TestAccountSystem.handler
{
    /// <summary>
    /// regEmail 的摘要说明
    /// </summary>
    public class regEmail : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string email = context.Request["email"].Trim();
            // string sql = "";
            if (email != null)
            {
                if (AllUserDAL.UpdateState(email) > 0&&CustomerDAL.UpdateState(email)>0)
                {
                    context.Response.Redirect("../AdminLogin.aspx");
                }


            }
            else
            {
                context.Response.Write(email);
            }

        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}