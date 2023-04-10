using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TestAccountSystem.DAL;
using TestAccountSystem.Model;

namespace TestAccountSystem.handler
{
    /// <summary>
    /// del 的摘要说明
    /// </summary>
    public class del : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            int id = int.Parse(context.Request["Id"] ?? "0");
            // string name = context.Request["name"].Trim();
            //AllUser model=AllUserDAL.GetById(id);
           // string name = model.userName;
            if (AllUserDAL.DeleteById(id) > 0) //&& CustomerDAL.DeleteByName(name) > 0
            {
                //把customer表 的roleID=1的项做逻辑删除
                context.Response.Write("ok");            }
            else
            {
                context.Response.Write("no");
            }

            // context.Response.Write(id);
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