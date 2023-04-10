using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ParisECommerce.ckeditor
{
    /// <summary>
    /// ImageUpload 的摘要说明
    /// </summary>
    public class ImageUpload : IHttpHandler
    {
        HttpRequest httpRequest;
        HttpResponse httpResponse;
        string uploadDir = "../ckeditor/upload/image";
        public void ProcessRequest(HttpContext context)
        {
            httpRequest = context.Request;
            httpResponse = context.Response;

            string funcNum = httpRequest.QueryString["CKEditorFuncNum"];
            string fileName = null;
            string errorMsg = null;
            string extName = string.Empty;
            string fileURL = string.Empty;
            string script = @"
            <script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction({0}, '{1}', '{2}');</script> ";

            HttpPostedFile myfile = httpRequest.Files[0];
            GetFileName(myfile.FileName, ref extName);
            fileName = Guid.NewGuid().ToString() + "." + extName;

            try
            {
                fileURL = uploadDir + "/" + fileName;
                myfile.SaveAs(System.Web.HttpContext.Current.Server.MapPath(uploadDir) + "\\" + fileName);
                errorMsg = null;
            }
            catch (Exception ex)
            {
                fileURL = null;
                errorMsg = ex.Message;
            }

            httpResponse.Write(string.Format(script, funcNum, fileURL, errorMsg));
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        private void GetFileName(string fullName, ref string extName)
        {
            if (fullName == "")
            {
                extName = null;
            }
            else
            {
                int last;
                last = fullName.LastIndexOf(@".");
                extName = fullName.Substring(last + 1, fullName.Length - last - 1);
            }
        }
    }
}