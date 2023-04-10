using CommonHelper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TestAccountSystem.DAL;

namespace TestAccountSystem
{
    public partial class LogManager : System.Web.UI.Page
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
                BindGridView();
            }
        }
        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            BindGridView();
        }
        protected void ddlpagesize_SelectedIndexChanged(object sender, EventArgs e)
        {
            AspNetPager1.PageSize = Convert.ToInt32(ddlpagesize.SelectedValue);
            BindGridView();
        }
        private void BindGridView()
        {
            string sortExpression = gvTable.Attributes["SortExpression"] == null ? "ID" : gvTable.Attributes["SortExpression"];
            bool isASCDirection = gvTable.Attributes["SortDirection"] == "ASC" ? true : false;
            string condition = "1=1 and remark!='客户'" + queryCondition.Text.Trim();
            int totals = (int)SqlHelper.GetCountNumber("TALog", "Id", condition);
            if (totals > 0)
            {
                AspNetPager1.RecordCount = totals;
                DataTable dt = SqlHelper.GetPagedDataTable("TALog", condition, sortExpression, isASCDirection, AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex);//AspNetPager1.EndRecordIndex
                gvTable.DataSource = dt;
                gvTable.DataBind();
            }
            else
            {
                AspNetPager1.RecordCount = totals;
                ShowGridViewTitle();
            }   
        }
        private void ShowGridViewTitle()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Id");
            dt.Columns.Add("Name");
            dt.Columns.Add("Remark");
            dt.Columns.Add("IP");
            dt.Columns.Add("Operation");
            dt.Columns.Add("Time1");
            if (dt.Rows.Count == 0)
            {
                DataRow dr = dt.NewRow();
                dt.Rows.Add(dr);
            }
            gvTable.DataSource = dt;
            gvTable.DataBind();
            gvTable.Rows[0].Visible = false;
        }
        protected void gvTable_Sorting(object sender, GridViewSortEventArgs e)
        {
            string sortExpression = e.SortExpression.ToString();
            string sortDirection = "ASC";
            if (sortExpression == gvTable.Attributes["SortExpression"])
            {
                sortDirection = (gvTable.Attributes["SortDirection"].ToString() == sortDirection ? "DESC" : "ASC");
            }
            gvTable.Attributes["SortExpression"] = sortExpression;
            gvTable.Attributes["SortDirection"] = sortDirection;
            BindGridView();
        }
        protected void gvTable_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            Button btnDetail = e.Row.FindControl("btnDetail") as Button;

            if (btnDetail != null)
            {
                //把该行的onclick事件绑定成按钮的点击事件
                e.Row.Attributes["onclick"] = String.Format("javascript:document.getElementById('{0}').click()", btnDetail.ClientID);
                //鼠标样子
                e.Row.Attributes["style"] = "cursor:pointer";
            }

        }
        private void ShowDetail(int id)
        {
            for (int i = 0; i < gvTable.Rows.Count; i++)
            {
                if (i % 2 == 0)
                {
                    gvTable.Rows[i].BackColor = gvTable.RowStyle.BackColor;
                }
                else
                {
                    gvTable.Rows[i].BackColor = gvTable.AlternatingRowStyle.BackColor;
                }
                Literal literalId = this.gvTable.Rows[i].FindControl("LiteralId") as Literal;

                //如果是显示行则背景色为黄色
                if (Convert.ToInt32(literalId.Text) == id)
                {
                    gvTable.Rows[i].BackColor = System.Drawing.Color.LightYellow;
                }
            }
            // IRid.Text = Convert.ToString(model.id);
        }
        protected void gvTable_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "btnDetailCommand")
            {
                ShowDetail(Convert.ToInt32(e.CommandArgument));
            }
            if (e.CommandName== "btnDel")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                TALogDAL.DeleteById(id);
                BindGridView();
            }
        }

        //搜索
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            queryCondition.Text = SearchHelper.ApproxSearch("TALog", TextBox1.Text);
            BindGridView();
        }


        ////打印
        //protected void btnPrint_Click(object sender, EventArgs e)
        //{

        //}
        //导出
        protected void btnExport_Click(object sender, EventArgs e)
        {
            string sql = "select Name as '操作人', Operation as '操作', Description as '操作描述', Time1 as '操作时间', Ip as 'IP地址', Remark as '操作人角色' from TALog order by Time1 desc";
            DataTable dt = SqlHelper.ExecuteDataTable(sql, CommandType.Text);
            if (dt.Rows.Count<=0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('当前无日志信息，无需导出！');bindDatePicker()", true);
                return;
            }
            string[] list = { "", "", "", "" };
            ExcelHelper.ExportByWeb(dt, "系统日志", list);
            // ExcelHelper.ExportDocByWeb("test.doc","aaa.doc");
            //  ExportData.ExportByWeb(dt, "test.xls");
            //ExportByWeb(dt, "test", "test.xlsx");
            //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('日志导出成功！');bindDatePicker()", true);
            //return;
            //ExportExcel();
            ////exportData();
            ////// OutputClient();
            ////HttpContext curContext = HttpContext.Current;
            ////string str = "test.xlsx";
            ////// 设置编码和附件格式
            ////curContext.Response.Clear();
            ////curContext.Response.Buffer = true;
            //////  curContext.Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            ////// curContext.Response.ContentType = "application/vnd.ms-excel;charset=utf-8";application/octet-stream
            ////curContext.Response.ContentType = "application/vnd.ms-excel;";
            ////curContext.Response.ContentEncoding = Encoding.GetEncoding("GB2312");
            ////curContext.Response.Charset = "GB2312";
            ////curContext.Response.AppendHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(str, Encoding.UTF8));

            ////curContext.Response.WriteFile(@"E:\桌面\test.xlsx"); //ExportExcel().ToArray()
            ////curContext.Response.Flush();
            ////curContext.Response.End();
        }



        //public static void ExportByWeb(DataTable dtSource, string strHeaderText, string strFileName)
        //{

        //    HttpContext curContext = HttpContext.Current;

        //    // 设置编码和附件格式
        //    curContext.Response.ContentType = "application/vnd.ms-excel";
        //    curContext.Response.ContentEncoding = Encoding.UTF8;
        //    curContext.Response.Charset = "";
        //    curContext.Response.AppendHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(strFileName, Encoding.UTF8));

        //    curContext.Response.BinaryWrite(Export(dtSource, strHeaderText).GetBuffer());
        //    curContext.Response.End();
        //    // HttpContext.Current.ApplicationInstance.CompleteRequest();

        //}
        //public static MemoryStream Export(DataTable dtSource, string strHeaderText)
        //{
        //    HSSFWorkbook workbook = new HSSFWorkbook();
        //    HSSFSheet sheet = workbook.CreateSheet();

        //    #region 右击文件 属性信息
        //    {
        //        DocumentSummaryInformation dsi = PropertySetFactory.CreateDocumentSummaryInformation();
        //        dsi.Company = "http://www.yongfa365.com/";
        //        workbook.DocumentSummaryInformation = dsi;

        //        SummaryInformation si = PropertySetFactory.CreateSummaryInformation();
        //        si.Author = "杨益良"; //填加xls文件作者信息
        //        si.ApplicationName = "NPOI测试程序"; //填加xls文件创建程序信息
        //        si.LastAuthor = "杨益良2"; //填加xls文件最后保存者信息
        //        si.Comments = "说明信息"; //填加xls文件作者信息
        //        si.Title = "NPOI测试"; //填加xls文件标题信息
        //        si.Subject = "NPOI测试Demo";//填加文件主题信息
        //        si.CreateDateTime = DateTime.Now;
        //        workbook.SummaryInformation = si;
        //    }
        //    #endregion

        //    HSSFCellStyle dateStyle = workbook.CreateCellStyle() as HSSFCellStyle;
        //    HSSFDataFormat format = workbook.CreateDataFormat() as HSSFDataFormat;

        //    try
        //    {
        //        dateStyle.DataFormat = format.GetFormat("yyyy-mm-dd");
        //    }
        //    catch
        //    {
        //    }

        //    //取得列宽
        //    int[] arrColWidth = new int[dtSource.Columns.Count];
        //    foreach (DataColumn item in dtSource.Columns)
        //    {
        //        arrColWidth[item.Ordinal] = Encoding.GetEncoding(936).GetBytes(item.ColumnName.ToString()).Length;
        //    }
        //    for (int i = 0; i < dtSource.Rows.Count; i++)
        //    {
        //        for (int j = 0; j < dtSource.Columns.Count; j++)
        //        {
        //            int intTemp = Encoding.GetEncoding(936).GetBytes(dtSource.Rows[i][j].ToString()).Length;
        //            if (intTemp > arrColWidth[j])
        //            {
        //                arrColWidth[j] = intTemp;
        //            }
        //        }
        //    }



        //    int rowIndex = 0;

        //    foreach (DataRow row in dtSource.Rows)
        //    {
        //        #region 新建表，填充表头，填充列头，样式
        //        if (rowIndex == 65535 || rowIndex == 0)
        //        {
        //            if (rowIndex != 0)
        //            {
        //                sheet = workbook.CreateSheet();
        //            }

        //            #region 表头及样式
        //            {
        //                HSSFRow headerRow = sheet.CreateRow(0);
        //                headerRow.HeightInPoints = 25;
        //                headerRow.CreateCell(0).SetCellValue(strHeaderText);

        //                HSSFCellStyle headStyle = workbook.CreateCellStyle();
        //                headStyle.Alignment = CellHorizontalAlignment.CENTER;
        //                HSSFFont font = workbook.CreateFont();
        //                font.FontHeightInPoints = 20;
        //                font.Boldweight = 700;
        //                headStyle.SetFont(font);

        //                headerRow.GetCell(0).CellStyle = headStyle;

        //                sheet.AddMergedRegion(new Region(0, 0, 0, dtSource.Columns.Count - 1));
        //                headerRow.Dispose();
        //            }
        //            #endregion


        //            #region 列头及样式
        //            {
        //                HSSFRow headerRow = sheet.CreateRow(1);


        //                HSSFCellStyle headStyle = workbook.CreateCellStyle();
        //                headStyle.Alignment = CellHorizontalAlignment.CENTER;
        //                HSSFFont font = workbook.CreateFont();
        //                font.FontHeightInPoints = 10;
        //                font.Boldweight = 700;
        //                headStyle.SetFont(font);


        //                foreach (DataColumn column in dtSource.Columns)
        //                {
        //                    headerRow.CreateCell(column.Ordinal).SetCellValue(column.ColumnName);
        //                    headerRow.GetCell(column.Ordinal).CellStyle = headStyle;

        //                    //设置列宽
        //                    sheet.SetColumnWidth(column.Ordinal, (arrColWidth[column.Ordinal] + 1) * 256);

        //                }
        //                headerRow.Dispose();
        //            }
        //            #endregion

        //            rowIndex = 2;
        //        }
        //        #endregion


        //        #region 填充内容
        //        foreach (DataColumn column in dtSource.Columns)
        //        {
        //            HSSFRow dataRow = sheet.CreateRow(rowIndex);
        //            HSSFCell newCell = dataRow.CreateCell(column.Ordinal);

        //            string drValue = row[column].ToString();

        //            switch (column.DataType.ToString())
        //            {
        //                case "System.String"://字符串类型
        //                    newCell.SetCellValue(drValue);
        //                    break;
        //                case "System.DateTime"://日期类型
        //                    DateTime dateV;
        //                    DateTime.TryParse(drValue, out dateV);
        //                    newCell.SetCellValue(dateV);

        //                    newCell.CellStyle = dateStyle;//格式化显示
        //                    break;
        //                case "System.Boolean"://布尔型
        //                    bool boolV = false;
        //                    bool.TryParse(drValue, out boolV);
        //                    newCell.SetCellValue(boolV);
        //                    break;
        //                case "System.Int16"://整型
        //                case "System.Int32":
        //                case "System.Int64":
        //                case "System.Byte":
        //                    int intV = 0;
        //                    int.TryParse(drValue, out intV);
        //                    newCell.SetCellValue(intV);
        //                    break;
        //                case "System.Decimal"://浮点型
        //                case "System.Double":
        //                    double doubV = 0;
        //                    double.TryParse(drValue, out doubV);
        //                    newCell.SetCellValue(doubV);
        //                    break;
        //                case "System.DBNull"://空值处理
        //                    newCell.SetCellValue("");
        //                    break;
        //                default:
        //                    newCell.SetCellValue("");
        //                    break;
        //            }

        //        }
        //        #endregion

        //        rowIndex++;
        //    }


        //    using (MemoryStream ms = new MemoryStream())
        //    {
        //        workbook.Write(ms);
        //        ms.Flush();
        //        ms.Position = 0;
        //        sheet.Dispose();
        //        workbook.Dispose();

        //        return ms;
        //    }



        //}
        //private void exportData()
        //{
        //    //创建工作薄对象
        //    HSSFWorkbook wk = new HSSFWorkbook();
        //    //在工作薄中创建一个工作表并给其命名
        //    HSSFSheet sheet = wk.CreateSheet("日志信息_船级社检验计费管理系统");
        //    string sql = "select Name, Operation, Description, Time1, Ip, Remark from TALog order by Time1 desc";
        //    HSSFRow row = sheet.CreateRow(0);
        //    row.CreateCell(0).SetCellValue("序号");
        //    row.CreateCell(1).SetCellValue("操作人");
        //    row.CreateCell(2).SetCellValue("角色");
        //    row.CreateCell(3).SetCellValue("IP地址");
        //    row.CreateCell(4).SetCellValue("操作时间");
        //    row.CreateCell(5).SetCellValue("操作类型");
        //    row.CreateCell(6).SetCellValue("操作描述");
        //    using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text))
        //    {
        //        if (reader.HasRows)
        //        {
        //            int index = 1;
        //            while (reader.Read())
        //            {
        //                row = sheet.CreateRow(index);
        //                row.CreateCell(0).SetCellValue(index);
        //                index++;
        //                //string a = reader.GetInt32(0).ToString();
        //                row.CreateCell(1).SetCellValue(reader.IsDBNull(0) ? "null" : reader.GetString(0));
        //                row.CreateCell(2).SetCellValue(reader.IsDBNull(5) ? "null" : reader.GetString(5));//空值报错
        //                row.CreateCell(3).SetCellValue(reader.IsDBNull(4) ? "null" : reader.GetString(4));
        //                row.CreateCell(4).SetCellValue(reader.GetDateTime(3));
        //                row.CreateCell(5).SetCellValue(reader.IsDBNull(1) ? "null" : reader.GetString(1));
        //                row.CreateCell(6).SetCellValue(reader.IsDBNull(2) ? "null" : reader.GetString(2));
        //            }
        //        }
        //    }
        //    //写入到磁盘            
        //    using (FileStream fs = new FileStream(@"E:\桌面\" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".xls", FileMode.OpenOrCreate, FileAccess.Write))
        //    {
        //        wk.Write(fs);

        //    }
        //}

        //private MemoryStream ExportExcel()
        //{
        //    //创建工作薄对象
        //    HSSFWorkbook wk = new HSSFWorkbook();
        //    //在工作薄中创建一个工作表并给其命名
        //    HSSFSheet sheet = wk.CreateSheet("日志信息_船级社检验计费管理系统");
        //    string sql = "select Name, Operation, Description, Time1, Ip, Remark from TALog order by Time1 desc";
        //    HSSFRow row = sheet.CreateRow(0);
        //    row.CreateCell(0).SetCellValue("序号");
        //    row.CreateCell(1).SetCellValue("操作人");
        //    row.CreateCell(2).SetCellValue("角色");
        //    row.CreateCell(3).SetCellValue("IP地址");
        //    row.CreateCell(4).SetCellValue("操作时间");
        //    row.CreateCell(5).SetCellValue("操作类型");
        //    row.CreateCell(6).SetCellValue("操作描述");
        //    using (SqlDataReader reader = SqlHelper.ExecuteDataReader(sql, CommandType.Text))
        //    {
        //        if (reader.HasRows)
        //        {
        //            int index = 1;
        //            while (reader.Read())
        //            {
        //                row = sheet.CreateRow(index);
        //                row.CreateCell(0).SetCellValue(index);
        //                index++;
        //                //string a = reader.GetInt32(0).ToString();
        //                row.CreateCell(1).SetCellValue(reader.IsDBNull(0) ? "null" : reader.GetString(0));
        //                row.CreateCell(2).SetCellValue(reader.IsDBNull(5) ? "null" : reader.GetString(5));//空值报错
        //                row.CreateCell(3).SetCellValue(reader.IsDBNull(4) ? "null" : reader.GetString(4));
        //                row.CreateCell(4).SetCellValue(reader.GetDateTime(3));
        //                row.CreateCell(5).SetCellValue(reader.IsDBNull(1) ? "null" : reader.GetString(1));
        //                row.CreateCell(6).SetCellValue(reader.IsDBNull(2) ? "null" : reader.GetString(2));
        //            }
        //        }
        //    }
        //    using (MemoryStream ms = new MemoryStream())
        //    {
        //        wk.Write(ms);
        //        ms.Flush();
        //        ms.Position = 0;
        //        sheet.Dispose();
        //        wk.Dispose();
        //        return ms;
        //    }

        //}
    }
}