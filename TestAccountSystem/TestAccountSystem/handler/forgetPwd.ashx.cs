using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using CommonHelper;
using TestAccountSystem.DAL;

namespace TestAccountSystem.handler
{
    /// <summary>
    /// forgetPwd 的摘要说明
    /// </summary>
    public class forgetPwd : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string email = context.Request["email"].Trim();
            object obj = CustomerDAL.GetByNameEmail(email);
            if (obj != null)
            {
                string str = Guid.NewGuid().ToString().Substring(0, 3);
                //发送新生成的密码到邮箱
                MailMessage mailmsg = new MailMessage();
                //mailmsg.From = new MailAddress("wang1429180372@126.com", "船级社公司");
                mailmsg.From = new MailAddress("zjh18296137364@126.com", "船级社公司");
                mailmsg.To.Add(new MailAddress(email, ""));
                mailmsg.Subject = "尊敬的用户您好";
                mailmsg.SubjectEncoding = System.Text.Encoding.UTF8;
                mailmsg.Body = DateTime.Now + ",您的密码重置为" + str;
                mailmsg.BodyEncoding = System.Text.Encoding.UTF8;
                //SmtpClient client = new SmtpClient("smtp.126.com");
                //client.Credentials = new NetworkCredential("wang1429180372@126.com", "GRDCGOUASMNEBSTH");
                SmtpClient client = new SmtpClient("smtp.126.com");
                client.Credentials = new NetworkCredential("zjh18296137364@126.com", "BRMOZHQVWQFCYGAG");//第二参数为邮箱smtp服务授权码                
                try
                {
                     client.Send(mailmsg);
                    if ((CustomerDAL.Update(common.GetStringToMD5(str), Convert.ToInt32(obj)) > 0) && (AllUserDAL.Update(email, common.GetStringToMD5(str)) > 0))
                    {
                        context.Response.Write("ok");

                    }
                    else
                    {
                        context.Response.Write("no");
                    }
                }
                catch (Exception)
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