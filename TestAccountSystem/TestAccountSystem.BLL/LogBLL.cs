using CommonHelper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TestAccountSystem.DAL;
using TestAccountSystem.Model;
namespace TestAccountSystem.BLL
{
    public class LogBLL
    {
        //PE_Log pE_Log = new PE_Log();
        //pE_Log.IsManager = true;
        //pE_Log.IP = CommonHelper.GetClientIP();
        //System.Web.UI.Page page = new Page();
        //pE_Log.Name = page.Session["Admin"].ToString();
        //pE_Log.Time = DateTime.Now;
        //pE_Log.Operation = operation;
        //pE_Log.Description = description;

        //pE_Log.IPDesc = getIDDescQQ(pE_Log.IP);
        public static void LogInsert(string username,string operation,string description,string roleId) {

            TALog talog = new TALog();
            talog.name = username;
            talog.ip = common.GetClientIP();//::1是IPv6地址 相当于IPV4的127.0.0.1        
            talog.time1 = DateTime.Now;
            talog.operation = operation;
            talog.description = description;
            talog.ipDesc = IPScaner.getIDDescQQ(talog.ip);
            string roleName;
            switch (roleId)
            {
                case "1":
                    roleName = "客户";break;
                case "2":roleName = "验船师";break;
                case "3":roleName = "单位领导";break;
                case "4":roleName = "财务";break;
                case "5":roleName = "系统管理员";break;
                default:
                    roleName = "未知身份";
                    break;
            }
            talog.remark = roleName;
            TALogDAL.AdminInsert(talog);
        }

    }
}
