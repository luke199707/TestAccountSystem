using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TestAccountSystem.DAL;

namespace TestAccountSystem.handler
{
    /// <summary>
    /// rDel 的摘要说明
    /// </summary>
    public class rDel : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            int id = int.Parse(context.Request["Id"]??"0");
            if (RoleInfoDAL.DeleteById(id)>0)
            {
                //删除成功
                context.Response.Write("ok");
               // context.Response.Redirect("../roleUIInfo.aspx");
            }
            else
            {
                //删除失败
                context.Response.Write("no");
                //context.Response.Redirect("../roleUIInfo.aspx");
            }
           
           // context.Response.Write("Hello World");
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