using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using CommonHelper;
using TestAccountSystem.DAL;
using TestAccountSystem.Model;

namespace TestAccountSystem.handler
{
    /// <summary>
    /// confirmPwd 的摘要说明
    /// </summary>
    public class confirmPwd : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string pwd1 = context.Request["txtpwd1"];
            string name = context.Session["UserName"].ToString();
            Customer model = CustomerDAL.GetByName(name);
            if (model.pwd == common.GetStringToMD5(pwd1))
            {
                context.Response.Write("ok");
            }
            else
            {
                context.Response.Write("no");
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