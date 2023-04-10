using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TestAccountSystem.DAL;
using TestAccountSystem.Model;

namespace TestAccountSystem.handler
{
    /// <summary>
    /// logDel 的摘要说明
    /// </summary>
    public class logDel : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            int id=int.Parse( context.Request["Id"]);
            if (TALogDAL.DeleteById(id)>0)
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