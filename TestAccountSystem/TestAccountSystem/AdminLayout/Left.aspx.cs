using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using TestAccountSystem.DAL;
using TestAccountSystem.Model;

namespace TestAccountSystem.AdminLayout
{
    public partial class Left : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] == null && Session["UserName"] == null)
            {
                Response.Write("<script>window.parent.frames.location.href='Redirect.aspx?type=reLogin'</script>");//<a href="Redirect.aspx">Redirect.aspx</a>
            }
            else
            {
                if (!IsPostBack)
                {
                    LoadDefaultUserRight(Session["UserName"].ToString());
                    Console.WriteLine("首次加载");
                }
                else
                {

                }
            }
        }

        /// <summary>
        /// 根据用户名加载菜单
        /// </summary>
        /// <param name="name"></param>
        private void LoadDefaultUserRight(string name)
        {
            List<FunctionModel> listbasic = FunctionModelDAL.GetFirstLevel(name);//list
            //获取附加权限的一级菜单
            List<FunctionModel> listfujia = FunctionModelDAL.GetFuJiaFirstLevel(Session["sessionId"].ToString());
            //然后把两个集合取并集
            List<FunctionModel> list = listbasic.Union(listfujia).ToList();

            HtmlGenericControl control = new HtmlGenericControl();
            if (list != null)
            {
                control.InnerHtml += "<ul class='nav nav-list'>";
                control.InnerHtml += "<li class='active'><a href='../AdminPages/Index.aspx' target='right'><i class='fa fa-dashboard fa-fw'></i><span class='menu-text'> 控制台 </span></a></li>";
                for (int i = 0; i < list.Count; i++)
                {
                    control.InnerHtml += string.Format("<li><a href='#' class='dropdown-toggle'><i class='{0}'></i><span  class='menu-text'>{1} </span><b class='arrow fa fa-angle-down fa-fw'></b></a>", list[i].css, list[i].name);
                    control.InnerHtml += "<ul class='submenu'>";
                    //开始
                    List<RoleRightInfo> list1 = RoleRightInfoDAL.GetChildNode(list[i].currentId, Session["roleId"].ToString());
                    //结束
                    //附加权限的二级菜单
                    List<UserRight> list22 = UserRightDAL.GetChildNode(list[i].currentId, Session["sessionId"].ToString());
                    //结束
                    if (list1 != null)
                    {
                        for (int j = 0; j < list1.Count; j++)
                        {
                            FunctionModel mo = FunctionModelDAL.GetByCurrentID(list1[j].rightCode);
                            control.InnerHtml += string.Format("<li><a href='{0}' target='right'>{1}</a></li>", mo.url, mo.name);
                            for (int m = 0; m < list22.Count; m++)
                            {
                                if (list1[j].rightCode == list22[m].code)
                                {
                                    list22.RemoveAt(m);
                                }
                            }
                        }
                    }
                    if (list22 != null)//list22!=null
                    {
                        for (int k = 0; k < list22.Count; k++)
                        {
                            FunctionModel mo = FunctionModelDAL.GetByCurrentID(list22[k].code);
                            control.InnerHtml += string.Format("<li><a href='{0}' target='right'>{1}</a></li>", mo.url, mo.name);
                        }
                    }
                    #region
                    //if (childlist != null)-----------------暂时注释
                    //{
                    //    for (int j = 0; j < childlist.Count; j++)
                    //    {
                    //        control.InnerHtml += string.Format("<li><a href='{0}' target='right'>{1}</a></li>", childlist[j].url, childlist[j].name);
                    //    }
                    //}
                    #endregion
                    control.InnerHtml += "</ul>";
                    control.InnerHtml += "</li>";
                }
                #region
                //先根据用户对应的Id拿到附加权限的集合，如果此集合不为空，
                /*  List<UserRight> userrightlist= UserRightDAL.GetListByUserId(Session["sessionId"].ToString());

                  if (userrightlist!=null)
                  {
                      for (int i = 0; i < userrightlist.Count; i++)
                      {
                          for (int j = 0; j < list.Count; j++)
                          {//则与角色权限对应的列表List集合比较是否有一集菜单重复，
                              if (userrightlist[i].code.Length==3)
                              {
                                  if (userrightlist[i].code == list[j].currentId)
                                  {
                                      //一级菜单删除该项
                                      userrightlist.RemoveAt(i);
                                  }
                                  else
                                  {
                                        //添加该项  以及所有的子项
                                  }
                              }
                              else
                              {

                              }
                          }
                      }*/
                #endregion
            }
            //若没有重复则直接加载附加的权限，有重复则在分别比较二级菜单，出现没有的则加载进去     
            control.InnerHtml += "</ul>";
            sidebar.Controls.Add(control);

        }

    }
}