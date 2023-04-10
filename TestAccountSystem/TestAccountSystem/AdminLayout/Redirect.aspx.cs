using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestAccountSystem.AdminLayout
{
    public partial class Redirect : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["type"] != null)
            {
                string operation = Request.QueryString["type"].ToString();
                switch (operation)
                {
                    case "reLogin":
                        {
                            divInfo.InnerHtml = "对不起，由于您长时间未操作，需要重新登录本系统！<br />" +
                           "系统5秒后将自动跳到<a href='../AdminLogin.aspx' target='_parent'>船级社检验计费管理系统</a>..." +
                           "还剩<span id='time' style='font-weight:bold;color:Red;'>5</span>秒！<br />" +
                           "系统如果没有自动跳转，请点击<a href='../AdminLogin.aspx' target='_parent'>船级社检验计费管理系统</a>...";
                            Response.Write("<script>var i = 5;window.onload=function page_cg(){ document.getElementById('time').innerHTML = i;i--;if(i==0){window.parent.location.assign('../AdminLogin.aspx');}setTimeout(page_cg,1000);}</script>");
                            break;
                        }
                    case "updatepwd":
                        {
                            divInfo.InnerHtml = "您修改密码成功，需要重新登录本系统！<br />" +
                           "系统5秒后将自动跳到<a href='../AdminLogin.aspx' target='_parent'>船级社检验计费管理系统</a>..." +
                           "还剩<span id='time' style='font-weight:bold;color:Red;'>5</span>秒！<br />" +
                           "系统如果没有自动跳转，请点击<a href='../AdminLogin.aspx' target='_parent'>船级社检验计费管理系统</a>...";
                            Response.Write("<script>var i = 5;window.onload=function page_cg(){ document.getElementById('time').innerHTML = i;i--;if(i==0){window.parent.location.assign('../AdminLogin.aspx');}setTimeout(page_cg,1000);}</script>");
                            break;
                        }
                    case "pay":
                        {
                            string flag = Request.QueryString["flag"].ToString();
                            if (flag == "0")
                            {
                                string rReciptCode = Request.QueryString["dreceiptcode"].ToString();

                                divInfo.InnerHtml = "恭喜您，您对会员的货运订单" + rReciptCode + "在线代支付成功！<br />" +
                               "系统5秒后将自动跳到<a href='../AdminBusinessManage/DeliveryReceiptList.aspx?status=2'>货运订单列表</a>..." +
                               "还剩<span id='time' style='font-weight:bold;color:Red;'>5</span>秒！<br />" +
                               "系统如果没有自动跳转，请点击<a href='../AdminBusinessManage/DeliveryReceiptList.aspx?status=2'>货运订单列表</a>...";
                                Response.Write("<script>var i = 5;window.onload=function page_cg(){ document.getElementById('time').innerHTML = i;i--;if(i==0){window.location.assign('../AdminBusinessManage/DeliveryReceiptList.aspx?status=2');}setTimeout(page_cg,1000);}</script>");
                                break;
                            }
                            else
                            {
                                string rReciptCode = Request.QueryString["dreceiptcode"].ToString();
                                divInfo.InnerHtml = "对不起，您对会员的货运订单" + rReciptCode + "在线代支付失败！<br />" +
                                "系统5秒后将自动跳到<a href='../AdminBusinessManage/DeliveryReceiptList.aspx?status=2'>货运订单列表</a>..." +
                                "还剩<span id='time' style='font-weight:bold;color:Red;'>5</span>秒！<br />" +
                                "系统如果没有自动跳转，请点击<a href='../AdminBusinessManage/DeliveryReceiptList.aspx?status=2'>巴黎e站</a>...";
                                Response.Write("<script>var i = 5;window.onload=function page_cg(){ document.getElementById('time').innerHTML = i;i--;if(i==0){window.location.assign('../AdminBusinessManage/DeliveryReceiptList.aspx?status=2');}setTimeout(page_cg,1000);}</script>");
                                break;
                            }

                        }
                    case "post":
                        {
                            string flag = Request.QueryString["flag"].ToString();
                            if (flag == "0")
                            {
                                string rReciptCode = Request.QueryString["dreceiptcode"].ToString();

                                divInfo.InnerHtml = "恭喜您，您对会员的货运订单" + rReciptCode + "打包发货成功！<br />" +
                               "系统5秒后将自动跳到<a href='../AdminBusinessManage/DeliveryReceiptList.aspx?status=3'>货运订单列表</a>..." +
                               "还剩<span id='time' style='font-weight:bold;color:Red;'>5</span>秒！<br />" +
                               "系统如果没有自动跳转，请点击<a href='../AdminBusinessManage/DeliveryReceiptList.aspx?status=3'>货运订单列表</a>...";
                                Response.Write("<script>var i = 5;window.onload=function page_cg(){ document.getElementById('time').innerHTML = i;i--;if(i==0){window.location.assign('../AdminBusinessManage/DeliveryReceiptList.aspx?status=3');}setTimeout(page_cg,1000);}</script>");
                                break;
                            }
                            else
                            {
                                string rReciptCode = Request.QueryString["dreceiptcode"].ToString();
                                divInfo.InnerHtml = "   对不起，您对会员的货运订单" + rReciptCode + "打包发货失败！<br />" +
                                "系统5秒后将自动跳到<a href='../AdminBusinessManage/DeliveryReceiptList.aspx?status=3'>货运订单列表</a>..." +
                                "还剩<span id='time' style='font-weight:bold;color:Red;'>5</span>秒！<br />" +
                                "系统如果没有自动跳转，请点击<a href='../AdminBusinessManage/DeliveryReceiptList.aspx?status=3'>巴黎e站</a>...";
                                Response.Write("<script>var i = 5;window.onload=function page_cg(){ document.getElementById('time').innerHTML = i;i--;if(i==0){window.location.assign('../AdminBusinessManage/DeliveryReceiptList.aspx?status=3');}setTimeout(page_cg,1000);}</script>");
                                break;
                            }

                        }
                    case "sendMail":
                        {
                            divInfo.InnerHtml = "恭喜您，您的邮件已成功发送！<br />" +
                            "系统5秒后将自动跳到<a href='../GuestBookManage/SendEmail.aspx'>发送邮件</a>..." +
                            "还剩<span id='time' style='font-weight:bold;color:Red;'>5</span>秒！<br />" +
                            "系统如果没有自动跳转，请点击<a href='../GuestBookManage/SendEmail.aspx'>发送邮件</a>...";
                            Response.Write("<script>var i = 5;window.onload=function page_cg(){ document.getElementById('time').innerHTML = i;i--;if(i==0){window.location.assign('../GuestBookManage/SendEmail.aspx');}setTimeout(page_cg,1000);}</script>");
                            break;
                        }
                    default:
                        {
                            Response.Redirect("../AdminLogin.aspx");
                            break;
                        }
                }
            }
        }
    }
}