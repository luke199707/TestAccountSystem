using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TestAccountSystem.DAL;
using TestAccountSystem.Model;
using System.Net;
using System.Net.Mail;
using System.Data.SqlClient;
using TestAccountSystem.BLL;

namespace TestAccountSystem
{
    public partial class SystemModuleSetting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("AdminLayout/Redirect.aspx?type=reLogin");
                return;
            }
            if (!IsPostBack)
            {

                TreeView1.Nodes.Clear();

                LoadToTree("0", TreeView1.Nodes);
                btnIsAble(true, true, true, false, false, false, false);
                TreeView1.Nodes[0].Select();
                txtDisabled();
            }
        }
        // 发送邮件按钮     
        protected void Button1_Click(object sender, EventArgs e)
        {
            string email = "1429180372@qq.com";
            MailMessage mailmsg = new MailMessage();
            mailmsg.From = new MailAddress("wang1429180372@126.com", "船级社公司");
            mailmsg.To.Add(new MailAddress("1429180372@qq.com", "ssss"));
            mailmsg.Subject = "尊敬的用户您好";                                                                    //<a href="handler/regEmail.ashx">handler/regEmail.ashx</a>
            mailmsg.Body = "<a href='https://localhost:44368/handler/regEmail.ashx?email=" + email + "'>点击注册</a>";//"重置密码为"+ "https://localhost:44368/AdminLogin.aspx";
            mailmsg.IsBodyHtml = true;
            SmtpClient client = new SmtpClient("smtp.126.com");
            client.Credentials = new NetworkCredential("wang1429180372@126.com", "GRDCGOUASMNEBSTH");
            client.Send(mailmsg);
            Response.Write("ok");
            #region
            // MailMessage mailmsg = new MailMessage();
            // mailmsg.From = new MailAddress("wang1429180372@126.com","船级社");
            // mailmsg.To.Add(new MailAddress("wangchengwei324@126.com"));
            // mailmsg.Subject="欢迎您注册船级社账户";
            // mailmsg.Body = "重置密码为:";
            // SmtpClient sclient = new SmtpClient();//"smtp.126.com"
            // sclient.Host = "smtp.126.com";
            // //sclient.DeliveryMethod = SmtpDeliveryMethod.Network;
            // //sclient.EnableSsl = true;
            // //sclient.UseDefaultCredentials = false;
            // sclient.Credentials = new NetworkCredential("wang1429180372@126.com", "Wang318636483");
            // sclient.Port = 587;
            // sclient.EnableSsl = true;
            //sclient.Send(mailmsg);
            // Response.Write("Ok");

            //-------------------------------------------------------
            // System.Net.Mail.MailMessage msg = new System.Net.Mail.MailMessage();
            // msg.To.Add("wang1429180372@126.com");

            // /*  
            //  msg.To.Add("b@b.com");  
            // * msg.To.Add("b@b.com");  
            // * msg.To.Add("b@b.com");可以发送给多人  
            // */
            //// msg.CC.Add(c@c.com);
            // /*  
            // * msg.CC.Add("c@c.com");  
            // * msg.CC.Add("c@c.com");可以抄送给多人  
            // */
            // msg.From = new MailAddress("1429180372@qq.com", "船级社", System.Text.Encoding.UTF8);
            // /* 上面3个参数分别是发件人地址（可以随便写），发件人姓名，编码*/
            // msg.Subject = "这是测试邮件";//邮件标题   
            // msg.SubjectEncoding = System.Text.Encoding.UTF8;//邮件标题编码   
            // msg.Body = "邮件内容";//邮件内容   
            // msg.BodyEncoding = System.Text.Encoding.UTF8;//邮件内容编码   
            // msg.IsBodyHtml = false;//是否是HTML邮件   
            // msg.Priority = MailPriority.High;//邮件优先级   
            // SmtpClient client = new SmtpClient();
            // client.Credentials = new System.Net.NetworkCredential("1429180372@qq.com", "Wang1429180372");
            // //上述写你的GMail邮箱和密码   
            // client.Port = 587;//Gmail使用的端口   
            // client.Host = "smtp.gmail.com";
            // client.EnableSsl = true;//经过ssl加密   
            // object userState = msg;
            // try
            // {
            //     client.SendAsync(msg, userState);
            //     Response.Write("ok");
            //     //简单一点儿可以client.Send(msg);   
            //    // MessageBox.Show("发送成功");
            // }
            // catch (System.Net.Mail.SmtpException ex)
            // {
            //     Response.Write("no");
            //     //   MessageBox.Show(ex.Message, "发送邮件出错");
            // }

            //    System.Net.Mail.MailMessage msg = new System.Net.Mail.MailMessage();
            //    msg.To.Add("1429180372@qq.com");
            ////    msg.To.Add(b@b.com);
            //    /*  
            //    * msg.To.Add("b@b.com");  
            //    * msg.To.Add("b@b.com");  
            //    * msg.To.Add("b@b.com");可以发送给多人  
            //    */
            //  //  msg.CC.Add("c@c.com");
            //    /*  
            //    * msg.CC.Add("c@c.com");  
            //    * msg.CC.Add("c@c.com");可以抄送给多人  
            //    */
            //    msg.From = new MailAddress("wang1429180372@126.com", "dulei", System.Text.Encoding.UTF8);
            //    /* 上面3个参数分别是发件人地址（可以随便写），发件人姓名，编码*/
            //    msg.Subject = "这是测试邮件";//邮件标题   
            //msg.SubjectEncoding = System.Text.Encoding.UTF8;//邮件标题编码   
            //msg.Body = "邮件内容";//邮件内容   
            //msg.BodyEncoding = System.Text.Encoding.UTF8;//邮件内容编码   
            //msg.IsBodyHtml = false;//是否是HTML邮件   
            //msg.Priority = MailPriority.High;//邮件优先级   

            //SmtpClient client = new SmtpClient();
            //client.Credentials = new System.Net.NetworkCredential("wang1429180372@126.com", "Wang318636483");
            ////在71info.com注册的邮箱和密码   
            //client.Host = "smtp.126.com";
            //object userState = msg;
            //try
            //{
            //    client.SendAsync(msg, userState);
            //    Response.Write("ok");
            //    //简单一点儿可以client.Send(msg);   
            //    // MessageBox.Show("发送成功");
            //}
            //catch (System.Net.Mail.SmtpException ex)
            //{
            //    // MessageBox.Show(ex.Message, "发送邮件出错");
            //    Response.Write("nonono");
            //}
            #endregion
        }

        private void LoadToTree(string code, TreeNodeCollection treeNodeCollection)
        {

            List<FunctionModel> list = new List<FunctionModel>();
            string sql = "select parentId, name,currentId from FunctionModel where parentId=@parentId";
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
                        list.Add(model);
                    }
                }
            }
            foreach (var item in list)
            {

                //LoadToTree(item.AreaId, node.Nodes);//递归加载子节点,加载一个父节点然后递归加载子节点
                TreeNode node = new TreeNode();
                node.Text = item.name;
                node.Value = item.currentId;
                treeNodeCollection.Add(node);
                LoadToTree(item.currentId, node.ChildNodes);
            }

        }

        //删除节点  string parentId = TreeView1.SelectedValue;
        private void DelTreeNode(string parentId)
        {

            List<FunctionModel> list = FunctionModelDAL.GetByParentID(parentId);
            if (list.Count != 0)
            {
                foreach (var item in list)
                {
                    DelTreeNode(item.currentId);
                }
            }
            FunctionModelDAL.DeleteByCurrentId(parentId);
        }

        protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
        {
            gridviewbind();
            // TextBox2.Text = "sasasasa";
        }
        private void gridviewbind()
        {
            string code = TreeView1.SelectedValue;

            if (code != null)
            {
                ShowDetail(code);
            }
            txtDisabled();

        }
        private void ShowDetail(string id)
        {
            #region
            //IR_AdminMenu model = IR_AdminMenuDAL.GetByTermId(id);
            //if (TreeView1.SelectedNode.Depth == 0)
            //{
            //    txtParentCode.Text = "";
            //    txtParentName.Text = "无";
            //    txtName.Text = model.name;
            //    txtCode.Text = model.code;
            //}
            //else if (TreeView1.SelectedNode.Depth == 1)
            //{
            //    string[] codes = model.code.Split('.');
            //    txtParentName.Text = TreeView1.SelectedNode.Parent.Text.Split(' ').Last();
            //    txtParentCode.Text = TreeView1.SelectedNode.Parent.Text.Split(' ').First();
            //    txtName.Text = model.name;
            //    txtCode.Text = model.code;
            //    txtUrl.Text = model.url;
            //    txtIconCSS.Text = model.icon_css;
            //    txtTarget.Text = model.target;
            //    txtIndex.Text = model.index_id.ToString();
            //}
            //else if (TreeView1.SelectedNode.Depth == 2)
            //{
            //    string[] codes = model.code.Split('.');
            //    txtParentName.Text = TreeView1.SelectedNode.Parent.Text.Split(' ').Last();
            //    txtParentCode.Text = TreeView1.SelectedNode.Parent.Text.Split(' ').First();
            //    //txtCode.Text = codes.Last();
            //    txtCode.Text = model.code;
            //    txtName.Text = model.name;
            //    txtUrl.Text = model.url;
            //    txtIconCSS.Text = model.icon_css;
            //    txtTarget.Text = model.target;
            //    txtIndex.Text = model.index_id.ToString();
            //}
            #endregion
            FunctionModel model = FunctionModelDAL.GetByCurrentID(id);
            if (TreeView1.SelectedNode.Depth == 0)
            {
                TextBox2.Text = "无";
                txtCode.Text = model.currentId;
                txtname.Text = model.name;
                txturl.Text = model.url;
                txtcss.Text = model.css;
                txtTarget.Text = model.target;
                TextBox8.Text = model.id.ToString();
            }
            if (TreeView1.SelectedNode.Depth == 1)
            {
                TextBox2.Text = TreeView1.SelectedNode.Parent.Text.Split(' ').Last();
                txtCode.Text = model.currentId;
                txtname.Text = model.name;
                txturl.Text = model.url;
                txtcss.Text = model.css;
                txtTarget.Text = model.target;
                TextBox8.Text = model.id.ToString();
            }
            if (TreeView1.SelectedNode.Depth == 2)
            {
                TextBox2.Text = TreeView1.SelectedNode.Parent.Text.Split(' ').Last();
                txtCode.Text = model.currentId;
                txtname.Text = model.name;
                txturl.Text = model.url;
                txtcss.Text = model.css;
                txtTarget.Text = model.target;
                TextBox8.Text = model.id.ToString();
            }

        }

        private void txtDisabled()
        {
            TextBox2.Attributes.Add("disabled", "disabled");
            txtCode.Attributes.Add("disabled", "disabled");
            txtname.Attributes.Add("disabled", "disabled");
            txturl.Attributes.Add("disabled", "disabled");
            txtcss.Attributes.Add("disabled", "disabled");
            txtTarget.Attributes.Add("disabled", "disabled");
            TextBox8.Attributes.Add("disabled", "disabled");
        }
        private void txtAble()
        {
            //TextBox2.Attributes.Remove("disabled");
            //txtCode.Attributes.Remove("disabled");
            txtname.Attributes.Remove("disabled");
            txturl.Attributes.Remove("disabled");
            txtcss.Attributes.Remove("disabled");
            txtTarget.Attributes.Remove("disabled");
            //  TextBox8.Attributes.Remove("disabled");
        }
        private void btnIsAble(bool btn2, bool btn3, bool btn4, bool btn5, bool btn6, bool btn7, bool btn8)
        {
            btnAdd.Visible = btn2;
            btnUpdate.Visible = btn3;
            btnDel.Visible = btn4;
            btnAddSubmit.Visible = btn5;
            btnAddCancel.Visible = btn6;
            btnUpSubmit.Visible = btn7;
            btnUpCancel.Visible = btn8;
        }
        private void clearTxt()
        {
            txtname.Text = "";
            txturl.Text = "";
            txtcss.Text = "";
            txtTarget.Text = "";
        }

        //添加按钮
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (TreeView1.SelectedValue == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('未选中任何节点！');bindDatePicker()", true);
                return;
            }
            if (TreeView1.SelectedNode.Depth == 2)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('不能在添加下级节点了！');bindDatePicker()", true);
                return;
            }
            string parentId = TreeView1.SelectedValue;
            string max = "00";
            string str1;
            List<FunctionModel> list = FunctionModelDAL.GetByParentID(parentId);
            if (list.Count != 0)
            {
                foreach (var item in list)
                {
                    if (string.Compare(item.currentId, max) > 0)
                    {
                        max = item.currentId;
                    }

                }
                //截取后两位字符串
                string str = max.Substring(max.Length - 2, 2);
                //截取前几位
                str1 = max.Substring(0, max.Length - 2);
                int num = int.Parse(str);
                if (num < 9)
                {//前面多加一个0
                    num += 1;
                    str1 = str1 + "0" + num;
                }
                else
                {
                    num += 1;
                    str1 = str1 + num;
                }
            }
            else
            {
                str1 = "0" + parentId + "001";
            }
            #region
            ////截取后两位字符串
            //string str = max.Substring(max.Length - 2, 2);
            ////截取前几位
            //string str1 = max.Substring(0, max.Length - 2);
            //int num = int.Parse(str);
            //if (num < 9)
            //{//前面多加一个0
            //    num += 1;
            //    str1 = str1 + "0" + num;
            //}
            //else
            //{
            //    num += 1;
            //    str1 = str1 + num;
            //}
            #endregion
            txtCode.Text = str1;
            clearTxt();
            txtAble();
            btnIsAble(false, false, false, true, true, false, false);
        }

        //修改按钮
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            txtAble();
            btnIsAble(false, false, false, false, false, true, true);


        }

        //删除按钮
        protected void btnDel_Click(object sender, EventArgs e)
        {
            if (TreeView1.SelectedNode.Depth == 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('不能删除根节点！');bindDatePicker()", true);
                return;
            }
            else
            {
                string id = TreeView1.SelectedValue;//currentId
                DelTreeNode(id);
                
                //删除菜单的时候，要将rolerightinfo中对应的项也删除
                RoleRightInfoDAL.DeleteByRightCode(id);
                DeleteNodes(TreeView1.SelectedNode);
                //////TreeView1.Nodes.Clear();
                //////LoadToTree("0", TreeView1.Nodes);
                ////// gridviewbind();
                clearTxt();
                TextBox2.Text = "";
                TextBox8.Text = "";
                txtCode.Text = "";
                btnIsAble(true, true, true, false, false, false, false);
                txtDisabled();
            }

        }
        /// <summary>
        /// 递归移除节点
        /// </summary>
        /// <param name="node"></param>
        private void DeleteNodes(TreeNode node)
        {
            //递归删除集合时不能用foreach，因为集合发生了改变
            for (int i = 0; i < node.ChildNodes.Count; i++)
            {
                DeleteNodes(node.ChildNodes[i]);
            }
            node.Parent.ChildNodes.Remove(node);
        }
        //点击添加按钮后的确定按钮
        protected void btnAddSubmit_Click(object sender, EventArgs e)
        {
            string parentId = TreeView1.SelectedValue;
            string currentId = txtCode.Text.Trim();
            string name = txtname.Text.Trim();
            string url = txturl.Text.Trim();
            string css = txtcss.Text.Trim();
            string target = txtTarget.Text.Trim();
            string code = "0" + currentId;//code
            FunctionModel model = new FunctionModel();
            model.parentId = parentId;
            model.currentId = currentId;
            model.name = name;
            model.url = url;
            model.css = css;
            model.target = target;
            model.code = code;
            if ((int)FunctionModelDAL.Insert(model) > 0)
            {
                //////TreeView1.Nodes.Clear();
                //////LoadToTree("0", TreeView1.Nodes);
                //gridviewbind();
                //  ------------ LogBLL.LogInsert(Session["UserName"].ToString(), "添加节点", "添加节点-" + model.name, Session["roleId"].ToString());
                btnIsAble(true, true, true, false, false, false, false);
                txtDisabled();

                //node.Text = item.name;
                //node.Value = item.currentId;
                TreeNode node = new TreeNode();
                node.Text = model.name;
                node.Value = model.currentId;
                if (TreeView1.SelectedNode!= null)
                {
                    TreeView1.SelectedNode.ChildNodes.Add(node);
                }
                gridviewbind();
                // TreeView1.SelectedNode.ChildNodes.Add(node);
                //showdetailid = termid.ToString();
            }
        }

        //点击添加按钮后的取消按钮
        protected void btnAddCancel_Click(object sender, EventArgs e)
        {
            btnIsAble(true, true, true, false, false, false, false);
            txtDisabled();
            //TreeView1.Nodes[0].Select();
        }

        //点击修改后的保存按钮
        protected void btnUpSubmit_Click(object sender, EventArgs e)
        {
            FunctionModel model = new FunctionModel();
            model.currentId = TreeView1.SelectedValue;
            model.name = txtname.Text.Trim();
            model.url = txturl.Text.Trim();
            model.css = txtcss.Text.Trim();
            model.target = txtTarget.Text.Trim();
            if (model.currentId != null)
            {
                FunctionModelDAL.UpdateName(model);
                //////TreeView1.Nodes.Clear();
                //////LoadToTree("0", TreeView1.Nodes);
                //gridviewbind();
                TreeView1.SelectedNode.Text = model.name;
                TreeView1.SelectedNode.Value = model.currentId;
                LogBLL.LogInsert(Session["UserName"].ToString(), "修改节点", "修改了节点信息-" + model.name, Session["roleId"].ToString());
                btnIsAble(true, true, true, false, false, false, false);
                txtDisabled();
                gridviewbind();
            }
        }
        //点击修改后的取消按钮
        protected void btnUpCancel_Click(object sender, EventArgs e)
        {
            btnIsAble(true, true, true, false, false, false, false);
            txtDisabled();
            //TreeView1.Nodes[0].Select();
        }
    }
}