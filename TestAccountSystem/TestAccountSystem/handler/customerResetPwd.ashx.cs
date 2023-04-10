using CommonHelper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TestAccountSystem.DAL;
using TestAccountSystem.Model;

namespace TestAccountSystem.handler
{
    /// <summary>
    /// customerResetPwd 的摘要说明
    /// </summary>
    public class customerResetPwd : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            if (context.Request["Id"] == null)
            {
                context.Response.Write("no");
                return;
            }
            int id = int.Parse(context.Request["Id"]);
            Customer cu = CustomerDAL.GetById(id);
            object obj = AllUserDAL.GetId(cu.userName, cu.pwd);
            if (obj == null)
            {
                context.Response.Write("no");
                return;
            }
            int aid = Convert.ToInt32(obj);
            if (AllUserDAL.UpdatePwd(common.GetStringToMD5("123"), aid) > 0)
            {
                if (CustomerDAL.Update(common.GetStringToMD5("123"), id) > 0)
                {
                    context.Response.Write("ok");
                }
                else
                {
                    context.Response.Write("no");
                }
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