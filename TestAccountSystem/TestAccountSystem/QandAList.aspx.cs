using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TestAccountSystem.DAL;
using TestAccountSystem.Model;

namespace TestAccountSystem
{
    public partial class QandAList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("AdminLayout/Redirect.aspx?type=reLogin");
                return;
            }
            string roleid = Session["roleId"].ToString();
            if (roleid == "5")
            {
                dataBaseDiv.Visible = true;
            }
            BindDataList();
        }

        private void BindDataList()
        {
            // List<QandA> list1=QandADAL.GetAll();
            DataTable dt1 = SqlHelper.Select("*", "QandA", "remark2='系统常见问题'", "id");
            dlQAndA1.DataSource = dt1;
            dlQAndA1.DataBind();

            DataTable dt2 = SqlHelper.Select("*", "QandA", "remark2='登记单常见问题'", "id");
            dlQAndA2.DataSource = dt2;
            dlQAndA2.DataBind();

            DataTable dt3 = SqlHelper.Select("*", "QandA", "remark2='数据库常见问题'", "id");
            dlQAndA3.DataSource = dt3;
            dlQAndA3.DataBind();

        }
    }
}