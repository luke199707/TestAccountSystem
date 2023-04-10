using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TestAccountSystem.DAL;
using TestAccountSystem.Model;
//using IR.Model;
//using IR.DAL;

namespace TestAccountSystem
{
    public partial class UserMenuDialog1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("AdminLayout/Redirect.aspx?type=reLogin");
                return;
            }
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "scroll1", "SetScrollTop(1,'panelUser','PanelScroll');", true);
            if (!IsPostBack)
            {
                BindTree();
                /*   TreeView1.Attributes.Add("onclick", "postBackByObject()");
                   BindTree();
                   TreeView1.ExpandDepth = 1;
                   string roleCode = Request.QueryString["RoleCode"];

                   IR_Role role = IR_RoleDAL.GetByCode(roleCode);
                   lbRoleName.InnerHtml = role.name + "权限分配";*/
            }
            TreeView1.Attributes.Add("onclick", "postBackByObject()");
        }

        //绑定树
        private void BindTree()
        {
            TreeView1.Nodes.Clear();
            LoadToTree("0", TreeView1.Nodes, Request["RoleCode"]);
        }
        private void LoadToTree(string code, TreeNodeCollection treeNodeCollection, string userId)
        {

            List<FunctionModel> list = new List<FunctionModel>();
            string sql = "select parentId, name,currentId,code from FunctionModel where parentId=@parentId";
            using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, System.Data.CommandType.Text, new SqlParameter("@parentId", code)))
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        FunctionModel model = new FunctionModel();
                        model.parentId = reader.GetString(0);
                        model.name = reader.GetString(1);
                        model.currentId = reader.GetString(2);
                        model.code = reader.GetString(3);
                        list.Add(model);
                    }
                }
            }
            foreach (var item in list)
            {
                //获取角色的所拥有的权限
                // int roleCode = Convert.ToInt32(Request.QueryString["RoleCode"].ToString());
                //  List<RoleRightInfo> roleList = RoleRightInfoDAL.GetByRoleId(roleCode);
              List<UserRight> alluserList= UserRightDAL.GetListByUserId(userId);
                //LoadToTree(item.AreaId, node.Nodes);//递归加载子节点,加载一个父节点然后递归加载子节点
                TreeNode node = new TreeNode();
                node.Text = item.name;
                node.Value = item.currentId;
                treeNodeCollection.Add(node);

                //如果角色有该权限，绑定的时候复选框是选中的状态
                foreach (UserRight alluser in alluserList)
                {
                    if (node.Value == alluser.code)
                    {
                        node.Checked = true;
                        //break;
                    }
                    if (node.Checked)
                    {
                        node.Parent.Checked = true;
                        node.Parent.Parent.Checked = true;
                    }
                }
                LoadToTree(item.currentId, node.ChildNodes, userId);

            }


        }

        //递归绑定树
        /*    private void LoadDataToTree(TreeNodeCollection treeNodeCollection, List<IR_AdminMenu> list)
           {
              foreach (IR_AdminMenu item in list)
               {
                   TreeNode node = new TreeNode();
                   node.Text = item.name;
                   node.ToolTip = item.code;
                   // node.Value = item.id.ToString();
                   node.Value = item.TermId.ToString();
                   treeNodeCollection.Add(node);

                   //获取角色的所拥有的权限
                   string roleCode = Request.QueryString["RoleCode"];
                   List<IR_RoleRight> rightCodeList = IR_RoleRightDAL.GetRightByRoleCode(roleCode);

                   //如果角色有该权限，绑定的时候复选框是选中的状态
                   foreach (IR_RoleRight roleright in rightCodeList)
                   {
                       if (item.code == roleright.rightCode)
                       {
                           node.Checked = true;
                           break;
                       }
                   }
                   List<IR_AdminMenu> listSub = IR_AdminMenuDAL.GetByParentID(item.TermId);
                   LoadDataToTree(node.ChildNodes, listSub);

           }}*/



        //将角色权限全部删除，然后再将所选权限全部插入
        protected void btnSave_Click(object sender, EventArgs e)
        {
            //if (Session["Admin"] == null)
            //{
            //    Response.Redirect("../../AdminLayout/Redirect.aspx?type=reLogin");
            //    return;
            //}
            // string roleCode = Request.QueryString["RoleCode"];
            // IR_RoleRightDAL.DeleteByRoleCode(roleCode);
            string userId = Request["RoleCode"];
            UserRightDAL.DeleteByUserId(userId);   //RoleRightInfoDAL.DeleteByRoleId(roleid);


            foreach (TreeNode node in TreeView1.CheckedNodes)
            {
                //RoleRightInfo mod = new RoleRightInfo();
                //mod.roleId = roleid;
                UserRight ur = new UserRight();
                ur.userId = Request["RoleCode"];
                if (node.Value == "1")
                {
                    continue;
                }
                if (node.Value.Length == 2)
                {
                    ur.code = "0" + node.Value;
                }
                else
                {
                    ur.code = node.Value;
                }
                UserRightDAL.Insert(ur);
                //RoleRightInfoDAL.Insert(mod);
                // IR_RoleRight roleRight = new IR_RoleRight();
                //roleRight.roleCode = roleCode;
                //roleRight.rightCode = node.ToolTip;

                //   IR_RoleRightDAL.Insert(roleRight);
            }

            //Response.Redirect("RoleManage.aspx");
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "select", "window.parent.AfterSelectProject();", true);
            return;
        }

        //复选框发生变化事件
        protected void TreeView1_TreeNodeCheckChanged(object sender, TreeNodeEventArgs e)
        {
            ParentChecked(e.Node);
            ChildsNodesCheckChange(e.Node);
        }

        //迭代遍历如果一个节点是选中那个它的父节点也选中
        private void ParentChecked(TreeNode node)
        {
            if (node.Checked == true)
            {
                if (node.Parent != null)
                {
                    node.Parent.Checked = true;
                    ParentChecked(node.Parent);
                }
            }
            if (node.Checked == false)
            {
                int flag = 0;
                if (node.Parent != null)
                {
                    foreach (TreeNode item in node.Parent.ChildNodes)
                    {
                        if (item.Checked == true)
                        {
                            //代表兄弟节点还有选中的
                            flag = 1;
                            break;
                        }
                    }
                }

                //如果flag == 0，代表兄弟节点都没有选中,父节点也取消选中，继续递归，如果没有取消父节点选中就不需要再递归。
                if (flag == 0)
                {
                    if (node.Parent != null)
                    {
                        node.Parent.Checked = false;
                        ParentChecked(node.Parent);
                    }

                }
            }
        }
        //迭代遍历，如果有子节点，子节点的选中状态和改变节点状态一致
        private void ChildsNodesCheckChange(TreeNode node)
        {
            if (node.Checked == true)
            {
                if (node.ChildNodes.Count > 0)
                {
                    foreach (TreeNode item in node.ChildNodes)
                    {
                        item.Checked = true;
                        ChildsNodesCheckChange(item);
                    }
                }
            }
            else if (node.Checked == false)
            {
                if (node.ChildNodes.Count > 0)
                {
                    foreach (TreeNode item in node.ChildNodes)
                    {
                        item.Checked = false;
                        ChildsNodesCheckChange(item);
                    }
                }
            }
        }
    }
}