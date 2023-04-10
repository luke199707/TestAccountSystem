using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TestAccountSystem.DAL;
using TestAccountSystem.Model;

namespace TestAccountSystem.handler
{
    /// <summary>
    /// customerdel 的摘要说明
    /// </summary>
    public class customerdel : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            int id = int.Parse(context.Request["Id"]);
            Customer customer = CustomerDAL.GetById(id);
            int alluserid = (int)AllUserDAL.GetId(customer.userName, customer.pwd);
            if (CustomerDAL.DeleteById(id) > 0)
            {
                if (AllUserDAL.DeleteById(alluserid) > 0)
                {
                    context.Response.Write("ok");                    
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