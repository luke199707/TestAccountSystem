using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TestAccountSystem.DAL;
using TestAccountSystem.Model;

namespace TestAccountSystem.AdminPages
{
    public partial class AddLogFormW : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("../AdminLayout/Redirect.aspx?type=reLogin");
                return;
            }
            string id = Request.QueryString["id"];
            if (!IsPostBack)
            {
                if (id == null)
                {
                    txtRegisterNumber.Text = Session["LogRegisterNumber"].ToString();
                    txtInspector.Text = Session["RealName"].ToString();
                    btnIsVisible(true, false);
                }
                else
                {
                    int ID = Convert.ToInt32(id);
                    hiddenIdEdit.Text = ID.ToString();
                    Edit(ID);
                    btnIsVisible(false, true);
                }

            }
            txtLogNumber.Text = DateTime.Now.ToString();
        }
        private void Edit(int id)
        {
            InspectLog model = InspectLogDAL.GetByID(id);
            if (model != null)
            {
                txtLogNumber.Text = "";
                txtLogNumber.Text = DateTime.Now.ToString();
                txtRegisterNumber.Text = model.RegisterNumber;
                txtInspector.Text = model.Inspector;
                txtLocation.Text = model.Location;
                // txtRemark.Text = model.Remark;
                txtInspectionContent.Text = model.InspectionContent;
            }

        }

        private void btnIsVisible(bool btn1, bool btn2)
        {
            btnSave.Visible = btn1;
            btnUpdate.Visible = btn2;
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            #region //判断插入名称和编码是否重复
            if ((int)SqlHelper.GetCountNumber("InspectLog", "ID", string.Format("LogNumber='{0}'", txtLogNumber.Text)) != 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('该日志编号已经存在！')", true);
                return;
            }
            if ((int)SqlHelper.GetCountNumber("InspectionRegistration", "ID", string.Format("RegisterNumber='{0}'", txtRegisterNumber.Text)) == 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('该订单不存在！')", true);
                return;
            }
            if (txtRegisterNumber.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('检验订单编号不能为空！')", true);
                return;
            }
            if (txtInspector.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('检验人名称不能为空！')", true);
                return;
            }
            if (txtLocation.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('地点不能为空！')", true);
                return;
            }
            if (txtInspectionContent.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('检验内容不能为空！')", true);
                return;
            }
            #endregion

            //获取要插入的数据
            InspectLog model = new InspectLog();
            model.LogNumber = txtLogNumber.Text.Trim();
            model.RegisterNumber = txtRegisterNumber.Text.Trim();
            model.Inspector = txtInspector.Text.Trim();
            model.InspectionContent = txtInspectionContent.Text.Trim();
            model.Location = txtLocation.Text.Trim();
            model.Time = DateTime.Now;
            string str = upLoadImage();
            if (str != "false")
            {
                model.Remark = str;
            }
            object o = InspectLogDAL.Insert(model);

            if (o != null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('保存成功！')", true);
                Response.Redirect("InspectionStatusManagementForm.aspx");
            }

        }
        private string upLoadImage()
        {
            if (FileUpload1.HasFile)
            {
                //数据字典动态设置上传文件大小限制
                // Term termLength = TermDAL.GetByParentID(TermDAL.GetByName("上传文件大小限制").ID)[0];
                //string upPath = "/up/";  //上传文件路径
                int upLength = int.Parse("5");  //上传文件大小application/x-zip-compressed
                string upFileType = "|image/jpeg|image/jpg|image/png|";

                string fileContentType = FileUpload1.PostedFile.ContentType;    //文件类型

                if (upFileType.IndexOf(fileContentType.ToLower()) > 0)
                {
                    string name = FileUpload1.PostedFile.FileName;                  // 客户端文件路径
                    FileInfo file = new FileInfo(name);                                                           // FileInfo file = new FileInfo(name);
                                                                                                                  //string fileName = name;

                    string fileName = DateTime.Now.ToString("yyyyMMddhhmmssfff") + file.Extension; // 文件名称，当前时间（yyyyMMddhhmmssfff）
                    //string webFilePath = Server.MapPath(upPath) + fileName;        // 服务器端文件路径
                    //string FilePath = upPath + fileName;   //页面中使用的路径
                    string fileUrl = Server.MapPath("../UpLoadImg") + "\\" + fileName;
                    if (!File.Exists(fileUrl))
                    {
                        if ((FileUpload1.FileBytes.Length / (1024 * 1024 * 1.0)) > upLength)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "upfileOK", "alert('大小超出 " + upLength + " M的限制，请处理后再上传！');", true);
                            return "false";
                        }
                        try
                        {
                            this.FileUpload1.PostedFile.SaveAs(fileUrl);  // 使用 SaveAs 方法保存文件
                            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('提示：文件上传成功！')", true);
                            return fileName;
                        }
                        catch (Exception ex)
                        {
                            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('提示：文件上传失败" + ex.Message + "！')", true);
                            return "false";
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('提示：文件已经存在，请重命名后上传！')", true);
                        return "false";
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('提示：文件类型不符" + fileContentType + "！')", true);
                    return "false";
                }
            }
            return "false";
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if ((int)SqlHelper.GetCountNumber("InspectLog", "ID", string.Format("LogNumber='{0}'", txtLogNumber.Text)) != 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('该日志编号已经存在！')", true);
                return;
            }
            if ((int)SqlHelper.GetCountNumber("InspectionRegistration", "ID", string.Format("RegisterNumber='{0}'", txtRegisterNumber.Text)) == 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('该订单不存在！')", true);
                return;
            }
            if (txtRegisterNumber.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('检验订单编号不能为空！')", true);
                return;
            }
            if (txtInspector.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('检验人名称不能为空！')", true);
                return;
            }
            if (txtLocation.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('地点不能为空！')", true);
                return;
            }
            if (txtInspectionContent.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('检验内容不能为空！')", true);
                return;
            }
            if (hiddenIdEdit.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('编辑失败！')", true);
                return;
            }
            int id = Convert.ToInt32(hiddenIdEdit.Text.Trim());
            InspectLog model = InspectLogDAL.GetByID(id);
            if (model != null)
            {
                hiddenIdEdit.Text = "";
                model.LogNumber = txtLogNumber.Text.Trim();
                model.Inspector = Session["UserName"].ToString();
                model.Time = DateTime.Now;
                //  model.Remark = txtRemark.Text.Trim();
                model.Location = txtLocation.Text.Trim();
                model.InspectionContent = txtInspectionContent.Text.Trim();
                if (InspectLogDAL.Update(model) > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('保存成功！')", true);
                    Response.Redirect("InspectionStatusManagementForm.aspx");
                }
            }
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("InspectionStatusManagementForm.aspx");
        }
    }
}