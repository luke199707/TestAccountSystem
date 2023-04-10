using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TestAccountSystem.DAL;

namespace TestAccountSystem.handler
{
    /// <summary>
    /// ddel 的摘要说明
    /// </summary>
    public class ddel : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            int id=int.Parse(context.Request["Id"]??"0");
            if (DepartmentDAL.DeleteById(id)>0)
            {
                context.Response.Write("ok");
                return;
            }
            context.Response.Write("no");
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