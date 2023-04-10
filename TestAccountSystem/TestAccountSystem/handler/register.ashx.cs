using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using CommonHelper;
using TestAccountSystem.DAL;
using TestAccountSystem.Model;

namespace TestAccountSystem.handler
{
    /// <summary>
    /// register 的摘要说明
    /// </summary>
    public class register : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            Customer model1 = new Customer();
            AllUser model = new AllUser();
            string name = context.Request["name"].Trim();
            string pwd = common.GetStringToMD5(context.Request["pwd"].Trim());
            string email = context.Request["email"].Trim();
            model.userName = name;
            model.pwd = pwd;
            model.email = email;
            model1.userName = name;
            model1.pwd = pwd;
            model1.email = email;
            model1.legalPerson = name;
            if (model.userName == "" || model.pwd == "" || model.email == "")
            {
                context.Response.Write("nono");
                return;
            }
            model.isUseful = true;//账户是否可用
            model.state = false;//用来邮箱验证，献给其默认值
            model1.isUseFul = true;
            model1.state = false;
            //CustomerDAL dao = new CustomerDAL();
            //dao.Insert(model);

            if (AllUserDAL.GetByName(model.userName) != null)
            {
                context.Response.Write("exists");
                return;
            }
            if (AllUserDAL.GetByEmail(email) != null)
            {
                context.Response.Write("existsEmail");
                return;
            }
            if ((int)AllUserDAL.Insert(model) > 0)
            {
                CustomerDAL.Insert(model1);

                //----------------------邮件验证开始----------------------------------------
                MailMessage mailmsg = new MailMessage();
                //mailmsg.From = new MailAddress("wang1429180372@126.com", "船级社公司");
                mailmsg.From = new MailAddress("zjh18296137364@126.com", "船级社公司");
                mailmsg.To.Add(new MailAddress(email, ""));//"1429180372@qq.com"
                mailmsg.Subject = "尊敬的用户您好";                                                                    //<a href="handler/regEmail.ashx">handler/regEmail.ashx</a>
                mailmsg.Body = "点击 <a href='https://localhost:44368/handler/regEmail.ashx?email=" + email + "'>注册</a> 按钮以完成账号注册";//"重置密码为"+ "https://localhost:44368/AdminLogin.aspx";
                mailmsg.IsBodyHtml = true;
                //SmtpClient client = new SmtpClient("smtp.126.com");
                //client.Credentials = new NetworkCredential("wang1429180372@126.com", "GRDCGOUASMNEBSTH");
                SmtpClient client = new SmtpClient("smtp.126.com");
                client.Credentials = new NetworkCredential("zjh18296137364@126.com", "BRMOZHQVWQFCYGAG");
                try
                {
                    client.Send(mailmsg);
                    context.Response.Write("ok");
                }
                catch (Exception)
                {
                   // context.Response.Write("no");
                    throw;
                }

                //  Response.Write("ok");
                //----------------------邮件验证结束-------------------------------------------
                

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
        #region
        //public void sendEmail() {
        //    MailMessage mailmsg = new MailMessage();
        //    mailmsg.From = new MailAddress("wang1429180372@126.com", "船级社公司");
        //    mailmsg.To.Add(new MailAddress("1429180371@qq.com", "ssss"));
        //    mailmsg.Subject = "尊敬的用户您好";                                                                    //<a href="handler/regEmail.ashx">handler/regEmail.ashx</a>
        //    mailmsg.Body = "<a href='https://localhost:44368/handler/regEmail.ashx?email=qqqqq@qq.com'>点击注册</a>";//"重置密码为"+ "https://localhost:44368/AdminLogin.aspx";
        //    mailmsg.IsBodyHtml = true;
        //    SmtpClient client = new SmtpClient("smtp.126.com");
        //    client.Credentials = new NetworkCredential("wang1429180372@126.com", "GRDCGOUASMNEBSTH");
        //    client.Send(mailmsg);
        //  //  Response.Write("ok");

        //}
        #endregion
    }
}