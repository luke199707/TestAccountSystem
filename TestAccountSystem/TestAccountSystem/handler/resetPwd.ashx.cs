using CommonHelper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TestAccountSystem.DAL;

namespace TestAccountSystem.handler
{
    /// <summary>
    /// resetPwd 的摘要说明
    /// </summary>
    public class resetPwd : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            if (context.Request["Id"] == null)
            {
                context.Response.Write("no"); return;
            }
            int id = int.Parse(context.Request["Id"]);
            if (AllUserDAL.UpdatePwd(common.GetStringToMD5("123"), id) > 0)
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