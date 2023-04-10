using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TestAccountSystem.DAL;
using TestAccountSystem.Model;

namespace TestAccountSystem.handler
{
    /// <summary>
    /// getImgName 的摘要说明
    /// </summary>
    public class getImgName : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            int id = int.Parse(context.Request["Id"]);
            InspectLog model = InspectLogDAL.GetByID(id);
            if (model!=null)
            {
                context.Response.Write(model.Remark);
            }
            else
            {
                context.Response.Write("fail");
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