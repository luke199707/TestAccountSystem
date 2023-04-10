using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Text;
using System.Web;
using System.Web.UI.WebControls;
using System.Linq;
using System.Web.UI;
using NPOI.HSSF.UserModel;
using NPOI.SS.UserModel;
using NPOI.HPSF;
using NPOI.SS.Util;

namespace CommonHelper
{
    public class ExcelHelper
    {
        /// <summary>
        /// NPOI简单Demo，快速入门代码
        /// </summary>
        /// <param name="dtSource"></param>
        /// <param name="strFileName"></param>
        /// <remarks>NPOI认为Excel的第一个单元格是：(0，0)</remarks>
        public static void ExportEasy(DataTable dtSource, string strFileName)
        {
            HSSFWorkbook workbook = new HSSFWorkbook();
            ISheet sheet = workbook.CreateSheet();

            //填充表头
            IRow dataRow = sheet.CreateRow(0);
            foreach (DataColumn column in dtSource.Columns)
            {
                dataRow.CreateCell(column.Ordinal).SetCellValue(column.ColumnName);
            }


            //填充内容
            for (int i = 0; i < dtSource.Rows.Count; i++)
            {
                dataRow = sheet.CreateRow(i + 1);
                for (int j = 0; j < dtSource.Columns.Count; j++)
                {
                    dataRow.CreateCell(j).SetCellValue(dtSource.Rows[i][j].ToString());
                }
            }


            //保存
            using (MemoryStream ms = new MemoryStream())
            {
                using (FileStream fs = new FileStream(strFileName, FileMode.Create, FileAccess.Write))
                {
                    workbook.Write(ms);
                    ms.Flush();
                    ms.Position = 0;
                    byte[] data = ms.ToArray();
                    fs.Write(data, 0, data.Length);
                    fs.Flush();
                }
            }
            //sheet.Dispose();
            //workbook.Dispose();
        }


        public static void ExportDocByWeb(string templetFileName,string ReportFileName)
        {
           

            FileInfo filet = new FileInfo(templetFileName);

            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.Charset = "GB2312";
            HttpContext.Current.Response.ContentEncoding = System.Text.Encoding.UTF8;
            //添加头信息，为"文件下载/另存为"对话框指定为默认文件名
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=" + HttpContext.Current.Server.UrlEncode(ReportFileName));
            //HttpContext.Current.Response.Buffer = false;
            HttpContext.Current.Response.Buffer = true;
            HttpContext.Current.Response.AddHeader("Content-Length", filet.Length.ToString());//添加头信息 指定文件大小 让浏览器能够显示下载进度
            HttpContext.Current.Response.ContentType = "application/octet-stream";
            HttpContext.Current.Response.WriteFile(filet.FullName);     //把文件流发送到客户端  
            //HttpContext.Current.Response.Write("<script>alert('导出成功！');</script>");
            HttpContext.Current.Response.Write("<script type=\"text/javascript\">alert('导出成功！\n 点击页面底部相应文件查看详情。');</script>");
            HttpContext.Current.Response.End();  //停止页面的执行
        }

        #region Web导出为excel
        /// <summary>
        /// 用于Web导出
        /// </summary>
        /// <param name="dtSource"></param>
        /// <param name="strHeaderText"></param>
        /// <param name="strFileName"></param>
        ///  public static void ExportByWeb(DataTable dtSource, string strHeaderText, string strFileName)
        public static void ExportByWeb(DataTable dtSource, string title, string[] list)
        {
            //  string filepath = "../../Activity/files/";
            string filepath = "~/Activity/files/";
            if (!Directory.Exists(HttpContext.Current.Server.MapPath(filepath)))
            {
                Directory.CreateDirectory(HttpContext.Current.Server.MapPath(filepath));
            }
            // string ServerfilePath = HttpContext.Current.Server.MapPath("../../") + "Activity\\files\\";
            string ServerfilePath = HttpContext.Current.Server.MapPath("~/") + "Activity\\files\\";

            //获取时间戳中的s 3
            DateTime startTime = TimeZone.CurrentTimeZone.ToLocalTime(new DateTime(1970, 1, 1)); // 当地时区
            long time = (long)(DateTime.Now - startTime).TotalSeconds;
            ServerfilePath = ServerfilePath + title + time + ".xls";
            // string TempletFileName = HttpContext.Current.Server.MapPath("../../Activity/files/" + title + time + ".xls");
            string TempletFileName = HttpContext.Current.Server.MapPath("~/Activity/files/" + title + time + ".xls");
            string ReportFileName = title + time + ".xls";

            GridToExcelByNPOI(dtSource, ServerfilePath, title, list);
            FileInfo filet = new FileInfo(TempletFileName);


            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.Charset = "GB2312";
            HttpContext.Current.Response.ContentEncoding = System.Text.Encoding.UTF8;
            //添加头信息，为"文件下载/另存为"对话框指定为默认文件名
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=" + HttpContext.Current.Server.UrlEncode(ReportFileName));
            //HttpContext.Current.Response.Buffer = false;
            HttpContext.Current.Response.AddHeader("Content-Length", filet.Length.ToString());//添加头信息 指定文件大小 让浏览器能够显示下载进度
            HttpContext.Current.Response.ContentType = "application/vnd.ms-excel";
            HttpContext.Current.Response.WriteFile(filet.FullName);     //把文件流发送到客户端  
           // HttpContext.Current.Response.Write("<script>alert('导出成功！');</script>");
            HttpContext.Current.Response.End();  //停止页面的执行
            //HttpContext.Current.Response.Write("<script type=\"text/javascript\">alert('导出成功！\n 点击页面底部相应文件查看详情。');</script>");          
        }


        public static void GridToExcelByNPOI(DataTable dt, string strExcelFileName, string tableTitle, string[] list)
        {
            try
            {
                int columnsNum = dt.Columns.Count;
                HSSFWorkbook workbook = new HSSFWorkbook();
                ISheet sheet = workbook.CreateSheet("Sheet1");
                ICellStyle HeadercellStyle = workbook.CreateCellStyle();
                HeadercellStyle.BorderBottom = NPOI.SS.UserModel.BorderStyle.THIN;
                HeadercellStyle.BorderLeft = NPOI.SS.UserModel.BorderStyle.THIN;
                HeadercellStyle.BorderRight = NPOI.SS.UserModel.BorderStyle.NONE;
                HeadercellStyle.BorderTop = NPOI.SS.UserModel.BorderStyle.THIN;
                HeadercellStyle.Alignment = NPOI.SS.UserModel.HorizontalAlignment.CENTER;
                //字体
                NPOI.SS.UserModel.IFont headerfont = workbook.CreateFont();
                headerfont.Boldweight = (short)FontBoldWeight.BOLD;
                HeadercellStyle.SetFont(headerfont);
                ////第1行                
                //IRow act_title = sheet.CreateRow(0);
                //act_title.Height = 20 * 20;
                ////1、左侧标题
                //sheet.AddMergedRegion(new CellRangeAddress(0, 0, 0, columnsNum - 4));
                //ICell cell_title = act_title.CreateCell(0);
                //cell_title.SetCellValue(tableTitle);
                //ICellStyle cell_titleStyle = workbook.CreateCellStyle();
                //cell_titleStyle.BorderTop = NPOI.SS.UserModel.BorderStyle.THIN;
                //cell_titleStyle.BorderLeft = NPOI.SS.UserModel.BorderStyle.THIN;
                //cell_titleStyle.BorderRight = NPOI.SS.UserModel.BorderStyle.NONE;
                //cell_titleStyle.Alignment = NPOI.SS.UserModel.HorizontalAlignment.CENTER;
                //cell_title.CellStyle = cell_titleStyle;
                //IFont titleFont = workbook.CreateFont();
                //titleFont.Boldweight = (short)FontBoldWeight.NORMAL;
                //titleFont.FontHeight = 18;
                //titleFont.FontHeightInPoints = 18;
                //cell_title.CellStyle.SetFont(titleFont);
                ////2、右侧时间
                //sheet.AddMergedRegion(new CellRangeAddress(0, 0, columnsNum - 3, columnsNum - 1));
                //string exportTime = "导出时间" + "   " + DateTime.Now.ToString();
                //ICell cell_exportTime = act_title.CreateCell(columnsNum - 3);
                //cell_exportTime.SetCellValue(exportTime);
                //ICellStyle cell_exportTimeStyle = workbook.CreateCellStyle();
                //cell_exportTimeStyle.BorderTop = NPOI.SS.UserModel.BorderStyle.THIN;
                //cell_exportTimeStyle.BorderRight = NPOI.SS.UserModel.BorderStyle.THIN;
                //cell_exportTimeStyle.BorderLeft = NPOI.SS.UserModel.BorderStyle.NONE;
                //cell_exportTimeStyle.Alignment = NPOI.SS.UserModel.HorizontalAlignment.CENTER;
                //cell_exportTime.CellStyle = cell_exportTimeStyle;



                IRow act_title = sheet.CreateRow(0);
                act_title.Height = 20 * 20;
                sheet.SetColumnWidth(0, 20 * 256);
                ICell cell_title = act_title.CreateCell(0);
                cell_title.SetCellValue(tableTitle);
                ICellStyle cell_titleStyle = workbook.CreateCellStyle();
                cell_titleStyle.BorderTop = NPOI.SS.UserModel.BorderStyle.THIN;
                cell_titleStyle.BorderLeft = NPOI.SS.UserModel.BorderStyle.THIN;
                cell_titleStyle.BorderRight = NPOI.SS.UserModel.BorderStyle.NONE;
                cell_titleStyle.Alignment = NPOI.SS.UserModel.HorizontalAlignment.CENTER;
                cell_title.CellStyle = cell_titleStyle;
                IFont titleFont = workbook.CreateFont();
                titleFont.Boldweight = (short)FontBoldWeight.NORMAL;
                titleFont.FontHeight = 18;
                titleFont.FontHeightInPoints = 18;
                cell_title.CellStyle.SetFont(titleFont);



                sheet.AddMergedRegion(new CellRangeAddress(0, 0, 0, columnsNum - 4));
                sheet.AddMergedRegion(new CellRangeAddress(0, 0, columnsNum - 3, columnsNum - 1));
                ICell cell_titleExportTime = act_title.CreateCell(columnsNum - 3);
                cell_titleExportTime.SetCellValue("导出时间" + "   " + DateTime.Now.ToString());
                cell_titleExportTime.CellStyle.BorderLeft = NPOI.SS.UserModel.BorderStyle.NONE;
                cell_title.CellStyle.BorderRight = NPOI.SS.UserModel.BorderStyle.NONE;
                cell_titleExportTime.CellStyle.BorderLeft = NPOI.SS.UserModel.BorderStyle.NONE;
                //用 column name 作为列名
                int icolIndex = 0;
                IRow headerRow = sheet.CreateRow(1);
                string num = dt.Rows.Count.ToString();
                foreach (DataColumn item in dt.Columns)
                {
                    ICell cell = headerRow.CreateCell(icolIndex);
                    cell.SetCellValue(item.ColumnName);
                    cell.CellStyle = HeadercellStyle;
                    icolIndex++;
                }
                ICellStyle cellStyle = workbook.CreateCellStyle();
                //为避免日期格式化被Excel自动替换，所以设定format为『@』 表示一率当成text來看
                cellStyle.DataFormat = HSSFDataFormat.GetBuiltinFormat("@");
                cellStyle.BorderBottom = NPOI.SS.UserModel.BorderStyle.THIN;
                cellStyle.BorderLeft = NPOI.SS.UserModel.BorderStyle.THIN;
                cellStyle.BorderRight = NPOI.SS.UserModel.BorderStyle.THIN;
                cellStyle.BorderTop = NPOI.SS.UserModel.BorderStyle.THIN;
                IFont cellFont = workbook.CreateFont();
                cellFont.Boldweight = (short)FontBoldWeight.NORMAL;
                cellStyle.SetFont(cellFont);
                //建立内容行
                int iRowIndex = 2;
                int iCellIndex = 0;
                foreach (DataRow Rowitem in dt.Rows)
                {
                    IRow dateRow = sheet.CreateRow(iRowIndex);
                    foreach (DataColumn Colitem in dt.Columns)
                    {
                        ICell cell = dateRow.CreateCell(iCellIndex);
                        cell.SetCellValue(Rowitem[Colitem].ToString());
                        cell.CellStyle = cellStyle;
                        iCellIndex++;
                    }
                    iCellIndex = 0;
                    iRowIndex++;
                }
                //设置表尾
                IRow tailRow = sheet.CreateRow(iRowIndex);
                sheet.AddMergedRegion(new CellRangeAddress(iRowIndex, iRowIndex, 0, columnsNum - 1));
                string totalinfo = "";
                foreach (string aa in list)
                {
                    totalinfo = totalinfo + "      " + aa;
                }
                ICell cell0 = tailRow.CreateCell(0);
                cell0.SetCellValue(totalinfo);
                cell0.CellStyle.Alignment = NPOI.SS.UserModel.HorizontalAlignment.RIGHT;
                cell0.CellStyle.BorderBottom = NPOI.SS.UserModel.BorderStyle.THIN;
                cell0.CellStyle.BorderLeft = NPOI.SS.UserModel.BorderStyle.THIN;
                cell0.CellStyle.BorderRight = NPOI.SS.UserModel.BorderStyle.THIN;
                cell0.CellStyle.SetFont(headerfont);
                //自适应列宽度
                for (int i = 0; i < icolIndex; i++)
                {
                    sheet.AutoSizeColumn(i);
                }
                //写Excel
                FileStream file = new FileStream(strExcelFileName, FileMode.OpenOrCreate);
                workbook.Write(file);
                file.Flush();
                file.Close();

            }
            catch (Exception ex)
            {
                Console.Write(ex);
            }
            finally { };
        }

        #region Web导出为excel
        /// <summary>
        /// 用于Web导出
        /// </summary>
        /// <param name="dtSource"></param>
        /// <param name="strHeaderText"></param>
        /// <param name="strFileName"></param>
        /// 专门为团体票导出使用
        ///  public static void ExportByWeb(DataTable dtSource, string strHeaderText, string strFileName)
        public static void ExportByWeblxt(DataTable dtSource, string title, string[] list, string tick)
        {
            //  string filepath = "../../Activity/files/";
            string filepath = "~/Activity/files/";
            if (!Directory.Exists(HttpContext.Current.Server.MapPath(filepath)))
            {
                Directory.CreateDirectory(HttpContext.Current.Server.MapPath(filepath));
            }
            // string ServerfilePath = HttpContext.Current.Server.MapPath("../../") + "Activity\\files\\";
            string ServerfilePath = HttpContext.Current.Server.MapPath("~/") + "Activity\\files\\";

            //获取时间戳中的s 3
            DateTime startTime = TimeZone.CurrentTimeZone.ToLocalTime(new DateTime(1970, 1, 1)); // 当地时区
            long time = (long)(DateTime.Now - startTime).TotalSeconds;
            ServerfilePath = ServerfilePath + title + time + ".xls";
            // string TempletFileName = HttpContext.Current.Server.MapPath("../../Activity/files/" + title + time + ".xls");
            string TempletFileName = HttpContext.Current.Server.MapPath("~/Activity/files/" + title + time + ".xls");
            string ReportFileName = title + time + ".xls";

            GridToExcelByNPOIlxt(dtSource, ServerfilePath, title, list, tick);
            FileInfo filet = new FileInfo(TempletFileName);
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.Charset = "GB2312";
            HttpContext.Current.Response.ContentEncoding = System.Text.Encoding.UTF8;
            //添加头信息，为"文件下载/另存为"对话框指定为默认文件名
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=" + HttpContext.Current.Server.UrlEncode(ReportFileName));
            HttpContext.Current.Response.AddHeader("Content-Length", filet.Length.ToString());//添加头信息 指定文件大小 让浏览器能够显示下载进度
            HttpContext.Current.Response.ContentType = "application/ms-excel";
            //HttpContext.Current.Response.ContentType = "application/vnd.ms-excel";
            HttpContext.Current.Response.WriteFile(filet.FullName);     //把文件流发送到客户端  
            HttpContext.Current.Response.Write("<script>alert('导出成功！');</script>");
            HttpContext.Current.Response.End();  //停止页面的执行
            //HttpContext.Current.Response.Write("<script type=\"text/javascript\">alert('导出成功！\n 点击页面底部相应文件查看详情。');</script>");          
        }

    
        #endregion
        public static void GridToExcelByNPOIlxt(DataTable dt, string strExcelFileName, string tableTitle, string[] list, string tick)
        {
            try
            {
                int columnsNum = dt.Columns.Count;
                HSSFWorkbook workbook = new HSSFWorkbook();
                ISheet sheet = workbook.CreateSheet("Sheet1");
                ICellStyle HeadercellStyle = workbook.CreateCellStyle();
                HeadercellStyle.BorderBottom = NPOI.SS.UserModel.BorderStyle.THIN;
                HeadercellStyle.BorderLeft = NPOI.SS.UserModel.BorderStyle.THIN;
                HeadercellStyle.BorderRight = NPOI.SS.UserModel.BorderStyle.NONE;
                HeadercellStyle.BorderTop = NPOI.SS.UserModel.BorderStyle.THIN;
                HeadercellStyle.Alignment = NPOI.SS.UserModel.HorizontalAlignment.CENTER;
                //字体
                NPOI.SS.UserModel.IFont headerfont = workbook.CreateFont();
                headerfont.Boldweight = (short)FontBoldWeight.BOLD;
                HeadercellStyle.SetFont(headerfont);


                IRow act_title = sheet.CreateRow(0);
                act_title.Height = 20 * 20;
                sheet.SetColumnWidth(0, 20 * 256);
                ICell cell_title = act_title.CreateCell(0);
                cell_title.SetCellValue(tableTitle);
                ICellStyle cell_titleStyle = workbook.CreateCellStyle();
                cell_titleStyle.BorderTop = NPOI.SS.UserModel.BorderStyle.THIN;
                cell_titleStyle.BorderLeft = NPOI.SS.UserModel.BorderStyle.THIN;
                cell_titleStyle.BorderRight = NPOI.SS.UserModel.BorderStyle.NONE;
                cell_titleStyle.Alignment = NPOI.SS.UserModel.HorizontalAlignment.CENTER;
                cell_title.CellStyle = cell_titleStyle;
                IFont titleFont = workbook.CreateFont();
                titleFont.Boldweight = (short)FontBoldWeight.NORMAL;
                titleFont.FontHeight = 11;
                titleFont.FontHeightInPoints = 11;
                cell_title.CellStyle.SetFont(titleFont);
                sheet.AddMergedRegion(new CellRangeAddress(0, 0, 0, 3));
                sheet.AddMergedRegion(new CellRangeAddress(0, 0, 4, 6));
                ICell cell_titleExportTime = act_title.CreateCell(4);
                cell_titleExportTime.SetCellValue("导出时间" + "   " + DateTime.Now.ToString());
                cell_titleExportTime.CellStyle.BorderLeft = NPOI.SS.UserModel.BorderStyle.NONE;
                cell_title.CellStyle.BorderRight = NPOI.SS.UserModel.BorderStyle.NONE;
                cell_titleExportTime.CellStyle.BorderLeft = NPOI.SS.UserModel.BorderStyle.NONE;
                IRow tworow = sheet.CreateRow(1);
                tworow.Height = 20 * 20;
                sheet.SetColumnWidth(0, 20 * 256);
                ICell cell_title1 = tworow.CreateCell(0);
                cell_title1.SetCellValue(tick);
                ICellStyle cell_titleStyle1 = workbook.CreateCellStyle();
                cell_titleStyle1.BorderTop = NPOI.SS.UserModel.BorderStyle.THIN;
                cell_titleStyle1.BorderLeft = NPOI.SS.UserModel.BorderStyle.THIN;
                cell_titleStyle1.BorderRight = NPOI.SS.UserModel.BorderStyle.NONE;
                cell_titleStyle1.Alignment = NPOI.SS.UserModel.HorizontalAlignment.CENTER;
                cell_title1.CellStyle = cell_titleStyle1;

                titleFont.Boldweight = (short)FontBoldWeight.NORMAL;
                titleFont.FontHeight = 11;
                titleFont.FontHeightInPoints = 11;
                cell_title1.CellStyle.SetFont(titleFont);
                sheet.AddMergedRegion(new CellRangeAddress(1, 1, 0, 6));

                //用 column name 作为列名
                int icolIndex = 0;
                IRow headerRow = sheet.CreateRow(2);
                string num = dt.Rows.Count.ToString();
                foreach (DataColumn item in dt.Columns)
                {
                    ICell cell = headerRow.CreateCell(icolIndex);
                    cell.SetCellValue(item.ColumnName);
                    cell.CellStyle = HeadercellStyle;
                    icolIndex++;
                }
                ICellStyle cellStyle = workbook.CreateCellStyle();
                //为避免日期格式化被Excel自动替换，所以设定format为『@』 表示一率当成text來看
                cellStyle.DataFormat = HSSFDataFormat.GetBuiltinFormat("@");
                cellStyle.BorderBottom = NPOI.SS.UserModel.BorderStyle.THIN;
                cellStyle.BorderLeft = NPOI.SS.UserModel.BorderStyle.THIN;
                cellStyle.BorderRight = NPOI.SS.UserModel.BorderStyle.THIN;
                cellStyle.BorderTop = NPOI.SS.UserModel.BorderStyle.THIN;
                IFont cellFont = workbook.CreateFont();
                cellFont.Boldweight = (short)FontBoldWeight.NORMAL;
                cellStyle.SetFont(cellFont);
                //建立内容行
                int iRowIndex = 3;
                int iCellIndex = 0;
                foreach (DataRow Rowitem in dt.Rows)
                {
                    IRow dateRow = sheet.CreateRow(iRowIndex);
                    foreach (DataColumn Colitem in dt.Columns)
                    {
                        ICell cell = dateRow.CreateCell(iCellIndex);
                        cell.SetCellValue(Rowitem[Colitem].ToString());
                        cell.CellStyle = cellStyle;
                        iCellIndex++;
                    }
                    iCellIndex = 0;
                    iRowIndex++;
                }
                //设置表尾
                IRow tailRow = sheet.CreateRow(iRowIndex);
                sheet.AddMergedRegion(new CellRangeAddress(iRowIndex, iRowIndex, 0, columnsNum - 1));
                string totalinfo = "";
                foreach (string aa in list) {
                    totalinfo = totalinfo + "      " + aa;
                }
                ICell cell0 = tailRow.CreateCell(0);
                cell0.SetCellValue(totalinfo);
                cell0.CellStyle.Alignment = NPOI.SS.UserModel.HorizontalAlignment.RIGHT;
                cell0.CellStyle.BorderBottom = NPOI.SS.UserModel.BorderStyle.THIN;
                cell0.CellStyle.BorderLeft = NPOI.SS.UserModel.BorderStyle.THIN;
                cell0.CellStyle.BorderRight = NPOI.SS.UserModel.BorderStyle.THIN;
                cell0.CellStyle.SetFont(headerfont);
                //自适应列宽度
                for (int i = 0; i < icolIndex; i++)
                {
                    sheet.AutoSizeColumn(i);
                }
                //写Excel
                FileStream file = new FileStream(strExcelFileName, FileMode.OpenOrCreate);
                workbook.Write(file);
                file.Flush();
                file.Close();

            }
            catch (Exception ex)
            {
                Console.Write(ex);
            }
            finally { };
        }
        private void GridToExcelByNPOI(DataTable dt, string strExcelFileName, string title, string num)
        {
            try
            {
                HSSFWorkbook workbook = new HSSFWorkbook();
                ISheet sheet = workbook.CreateSheet("Sheet1");

                ICellStyle HeadercellStyle = workbook.CreateCellStyle();
                HeadercellStyle.BorderBottom = NPOI.SS.UserModel.BorderStyle.THIN;
                HeadercellStyle.BorderLeft = NPOI.SS.UserModel.BorderStyle.THIN;
                HeadercellStyle.BorderRight = NPOI.SS.UserModel.BorderStyle.THIN;
                HeadercellStyle.BorderTop = NPOI.SS.UserModel.BorderStyle.THIN;
                HeadercellStyle.Alignment = NPOI.SS.UserModel.HorizontalAlignment.CENTER;
                //字体
                NPOI.SS.UserModel.IFont headerfont = workbook.CreateFont();
                headerfont.Boldweight = (short)FontBoldWeight.BOLD;
                HeadercellStyle.SetFont(headerfont);
                //第1行
                IRow act_title = sheet.CreateRow(0);
                act_title.Height = 20 * 20;
                sheet.SetColumnWidth(0, 20 * 256);
                ICell cell_title = act_title.CreateCell(0);
                cell_title.SetCellValue(title);
                cell_title.CellStyle = HeadercellStyle;
                sheet.AddMergedRegion(new CellRangeAddress(0, 0, 0, 5));
                //用 column name 作为列名
                int icolIndex = 0;
                IRow headerRow = sheet.CreateRow(1);
                foreach (DataColumn item in dt.Columns)
                {
                    ICell cell = headerRow.CreateCell(icolIndex);
                    cell.SetCellValue(item.ColumnName);
                    cell.CellStyle = HeadercellStyle;
                    icolIndex++;
                }

                ICellStyle cellStyle = workbook.CreateCellStyle();
                //为避免日期格式化被Excel自动替换，所以设定format为『@』 表示一率当成text來看
                cellStyle.DataFormat = HSSFDataFormat.GetBuiltinFormat("@");
                cellStyle.BorderBottom = NPOI.SS.UserModel.BorderStyle.THIN;
                cellStyle.BorderLeft = NPOI.SS.UserModel.BorderStyle.THIN;
                cellStyle.BorderRight = NPOI.SS.UserModel.BorderStyle.THIN;
                cellStyle.BorderTop = NPOI.SS.UserModel.BorderStyle.THIN;
                IFont cellFont = workbook.CreateFont();
                cellFont.Boldweight = (short)FontBoldWeight.NORMAL;
                cellStyle.SetFont(cellFont);
                //建立内容行
                int iRowIndex = 2;
                int iCellIndex = 0;
                foreach (DataRow Rowitem in dt.Rows)
                {
                    IRow dateRow = sheet.CreateRow(iRowIndex);
                    foreach (DataColumn Colitem in dt.Columns)
                    {
                        ICell cell = dateRow.CreateCell(iCellIndex);
                        cell.SetCellValue(Rowitem[Colitem].ToString());
                        cell.CellStyle = cellStyle;
                        iCellIndex++;
                    }
                    iCellIndex = 0;
                    iRowIndex++;
                }
                //设置表尾
                IRow titleRow = sheet.CreateRow(iRowIndex);
                ICell cell1 = titleRow.CreateCell(0);
                cell1.SetCellValue("");
                ICell cell2 = titleRow.CreateCell(1);
                cell2.SetCellValue("");
                ICell cell3 = titleRow.CreateCell(2);
                cell3.SetCellValue("已报名额：");
                ICell cell4 = titleRow.CreateCell(3);
                cell4.SetCellValue(num);
                ICell cell5 = titleRow.CreateCell(4);
                cell5.SetCellValue("导出时间：");
                ICell cell6 = titleRow.CreateCell(5);
                cell6.SetCellValue(DateTime.Now.ToString());
                cell1.CellStyle = cell2.CellStyle = cell3.CellStyle = cell4.CellStyle = cell5.CellStyle = cell6.CellStyle = HeadercellStyle;
                //自适应列宽度
                for (int i = 0; i < icolIndex; i++)
                {
                    sheet.AutoSizeColumn(i);
                }
                //写Excel
                FileStream file = new FileStream(strExcelFileName, FileMode.OpenOrCreate);
                workbook.Write(file);
                file.Flush();
                file.Close();
            }
            catch (Exception ex)
            {
                Console.Write(ex);
            }
            finally { };
        }

        //public static void ExportPDF(string localFilePath, DataTable dtSource, string HorV)
        //{
        //    //iTextSharp.text.io.StreamUtil.AddToResourceSearch("iTextAsian.dll"); 
        //    //iTextSharp.text.io.StreamUtil.AddToResourceSearch("iTextAsianCmaps.dll");
        //    BaseFont bf;
        //    //string basepath = Application.StartupPath;
        //    try
        //    {
        //        // bf = BaseFont.CreateFont(basepath + "\\FONTS\\STSONG.TTF", BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);
        //        bf = BaseFont.CreateFont("..\\..\\Fonts\\STSong-Light", BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);
        //    }
        //    catch
        //    {
        //        bf = BaseFont.CreateFont("C:\\WINDOWS\\Fonts\\STSONG.TTF", BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);
        //    }
        //    iTextSharp.text.Font font = new iTextSharp.text.Font(bf);
        //    iTextSharp.text.Document pdf;
        //    if (string.IsNullOrEmpty(HorV))
        //        pdf = new iTextSharp.text.Document();
        //    else
        //        pdf = new iTextSharp.text.Document(PageSize.A4.Rotate());

        //    PdfPTable table = new PdfPTable(dtSource.Columns.Count);

        //    table.HorizontalAlignment = Element.ALIGN_CENTER;

        //    PdfPCell cell;
        //    for (int i = 0; i < dtSource.Rows.Count + 1; i++)
        //    {
        //        for (int j = 0; j < dtSource.Columns.Count; j++)
        //        {
        //            if (i == 0)
        //            {
        //                cell = new PdfPCell(new Phrase(dtSource.Columns[j].ColumnName, font));
        //            }
        //            else
        //            {
        //                cell = new PdfPCell(new Phrase(dtSource.Rows[i - 1][j].ToString(), font));
        //            }
        //            table.AddCell(cell);
        //        }
        //    }

        //    using (FileStream fs = new FileStream(localFilePath, FileMode.Create, FileAccess.Write))
        //    {
        //        PdfWriter.GetInstance(pdf, fs);
        //        pdf.Open();
        //        pdf.Add(table);
        //        pdf.Close();
        //    }
        //}
    }
    public static class ExportData
    {
        /// <summary> /// 导出Pdf /// </summary> 
        /// <param name="path">文件保存路径</param> 
        /// <param name="dtSource">数据源</param> 
        /// <param name="HorV">页面横竖（为空表示竖，有非空值为横）</param> 


        /// <summary>
        /// DataTable导出到Excel的MemoryStream
        /// </summary>
        /// <param name="dtSource">源DataTable</param>
        /// <param name="strHeaderText">表头文本</param>
        /// <returns></returns>
        public static MemoryStream Export(DataTable dtSource, string strHeaderText)
        {
            HSSFWorkbook workbook = new HSSFWorkbook();// 创建 一个Excel文件 
            ISheet sheet = workbook.CreateSheet();// 创建一个Excel的Sheet  
            #region 右击文件 属性信息
            {
                DocumentSummaryInformation dsi = PropertySetFactory.CreateDocumentSummaryInformation();
                dsi.Company = "http://www.yongfa365.com/";
                workbook.DocumentSummaryInformation = dsi;

                SummaryInformation si = PropertySetFactory.CreateSummaryInformation();
                si.Author = "杨益良"; //填加xls文件作者信息
                si.ApplicationName = "NPOI测试程序"; //填加xls文件创建程序信息
                si.LastAuthor = "杨益良2"; //填加xls文件最后保存者信息
                si.Comments = "说明信息"; //填加xls文件作者信息
                si.Title = "NPOI测试"; //填加xls文件标题信息
                si.Subject = "NPOI测试Demo";//填加文件主题信息
                si.CreateDateTime = DateTime.Now;
                workbook.SummaryInformation = si;
            }
            #endregion

            HSSFCellStyle dateStyle = workbook.CreateCellStyle() as HSSFCellStyle;
            HSSFDataFormat format = workbook.CreateDataFormat() as HSSFDataFormat;

            try
            {
                dateStyle.DataFormat = format.GetFormat("yyyy-mm-dd");
            }
            catch
            {
            }

            //取得列宽
            int[] arrColWidth = new int[dtSource.Columns.Count];
            foreach (DataColumn item in dtSource.Columns)
            {
                arrColWidth[item.Ordinal] = Encoding.GetEncoding(936).GetBytes(item.ColumnName.ToString()).Length;
            }
            for (int i = 0; i < dtSource.Rows.Count; i++)
            {
                for (int j = 0; j < dtSource.Columns.Count; j++)
                {
                    int intTemp = Encoding.GetEncoding(936).GetBytes(dtSource.Rows[i][j].ToString()).Length;
                    if (intTemp > arrColWidth[j])
                    {
                        arrColWidth[j] = intTemp;
                    }
                }
            }



            int rowIndex = 0;

            foreach (DataRow row in dtSource.Rows)
            {
                #region 新建表，填充表头，填充列头，样式
                if (rowIndex == 65535 || rowIndex == 0)
                {
                    if (rowIndex != 0)
                    {
                        sheet = workbook.CreateSheet();
                    }
                    #region 表头及样式
                    {
                        IRow headerRow = sheet.CreateRow(0);
                        headerRow.HeightInPoints = 25;
                        headerRow.CreateCell(0).SetCellValue(strHeaderText);

                        ICellStyle headStyle = workbook.CreateCellStyle();

                        headStyle.Alignment = NPOI.SS.UserModel.HorizontalAlignment.CENTER;

                        IFont font = workbook.CreateFont();
                        font.FontHeightInPoints = 20;
                        font.Boldweight = 700;
                        headStyle.SetFont(font);
                        headerRow.GetCell(0).CellStyle = headStyle;
                        sheet.AddMergedRegion(new CellRangeAddress(0, 0, 0, dtSource.Columns.Count - 1));
                        //headerRow.Dispose();
                    }
                    #endregion


                    #region 列头及样式
                    {
                        IRow headerRow = sheet.CreateRow(1);
                        ICellStyle headStyle = workbook.CreateCellStyle();
                        headStyle.Alignment = NPOI.SS.UserModel.HorizontalAlignment.CENTER;
                        IFont font = workbook.CreateFont();
                        font.FontHeightInPoints = 10;
                        font.Boldweight = 700;
                        headStyle.SetFont(font);
                        foreach (DataColumn column in dtSource.Columns)
                        {
                            headerRow.CreateCell(column.Ordinal).SetCellValue(column.ColumnName);
                            headerRow.GetCell(column.Ordinal).CellStyle = headStyle;

                            //设置列宽
                            sheet.SetColumnWidth(column.Ordinal, (arrColWidth[column.Ordinal] + 1) * 256);
                        }
                        //headerRow.Dispose();
                    }
                    #endregion

                    rowIndex = 2;
                }
                #endregion


                #region 填充内容
                foreach (DataColumn column in dtSource.Columns)
                {
                    IRow dataRow = sheet.CreateRow(rowIndex);
                    ICell newCell = dataRow.CreateCell(column.Ordinal);

                    string drValue = row[column].ToString();

                    switch (column.DataType.ToString())
                    {
                        case "System.String"://字符串类型
                            newCell.SetCellValue(drValue);
                            break;
                        case "System.DateTime"://日期类型
                            DateTime dateV;
                            DateTime.TryParse(drValue, out dateV);
                            newCell.SetCellValue(dateV);

                            newCell.CellStyle = dateStyle;//格式化显示
                            break;
                        case "System.Boolean"://布尔型
                            bool boolV = false;
                            bool.TryParse(drValue, out boolV);
                            newCell.SetCellValue(boolV);
                            break;
                        case "System.Int16"://整型
                        case "System.Int32":
                        case "System.Int64":
                        case "System.Byte":
                            int intV = 0;
                            int.TryParse(drValue, out intV);
                            newCell.SetCellValue(intV);
                            break;
                        case "System.Decimal"://浮点型
                        case "System.Double":
                            double doubV = 0;
                            double.TryParse(drValue, out doubV);
                            newCell.SetCellValue(doubV);
                            break;
                        case "System.DBNull"://空值处理
                            newCell.SetCellValue("");
                            break;
                        default:
                            newCell.SetCellValue("");
                            break;
                    }

                }
                #endregion

                rowIndex++;
            }
            using (MemoryStream ms = new MemoryStream())
            {
                workbook.Write(ms);
                ms.Flush();
                ms.Position = 0;
                //sheet.Dispose();
                //workbook.Dispose();
                return ms;
            }
        }

        #endregion

        #region 杨益良写Web导出，不带表头，因为导入的时候如果有表头的话，列的读取就不正确了，所以导出的时候也不带表头

        /// <summary>
        /// 用于Web导出
        /// </summary>
        /// <param name="dtSource"></param>
        /// <param name="strHeaderText"></param>
        /// <param name="strFileName"></param>
        public static void ExportByWeb(DataTable dtSource, string strFileName)
        {

            HttpContext curContext = HttpContext.Current;

            // 设置编码和附件格式
            curContext.Response.ContentType = "application/vnd.ms-excel";
            curContext.Response.ContentEncoding = Encoding.UTF8;
            curContext.Response.Charset = "";
            curContext.Response.AppendHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(strFileName, Encoding.UTF8));
            curContext.Response.BinaryWrite(Export(dtSource).GetBuffer());
            curContext.Response.End();
        }


        /// <summary>
        /// DataTable导出到Excel的MemoryStream
        /// </summary>
        /// <param name="dtSource">源DataTable</param>
        /// <param name="strHeaderText">表头文本</param>
        /// <returns></returns>
        public static MemoryStream Export(DataTable dtSource)
        {
            HSSFWorkbook workbook = new HSSFWorkbook();
            ISheet sheet = workbook.CreateSheet();

            #region 右击文件 属性信息
            {
                DocumentSummaryInformation dsi = PropertySetFactory.CreateDocumentSummaryInformation();
                dsi.Company = "http://www.yongfa365.com/";
                workbook.DocumentSummaryInformation = dsi;

                SummaryInformation si = PropertySetFactory.CreateSummaryInformation();
                si.Author = "杨益良"; //填加xls文件作者信息
                si.ApplicationName = "NPOI测试程序"; //填加xls文件创建程序信息
                si.LastAuthor = "杨益良2"; //填加xls文件最后保存者信息
                si.Comments = "说明信息"; //填加xls文件作者信息
                si.Title = "NPOI测试"; //填加xls文件标题信息
                si.Subject = "NPOI测试Demo";//填加文件主题信息
                si.CreateDateTime = DateTime.Now;
                workbook.SummaryInformation = si;
            }
            #endregion

            ICellStyle dateStyle = workbook.CreateCellStyle();
            IDataFormat format = workbook.CreateDataFormat();
            try
            {
                dateStyle.DataFormat = format.GetFormat("yyyy-mm-dd");
            }
            catch
            {
            }

            //取得列宽
            int[] arrColWidth = new int[dtSource.Columns.Count];
            foreach (DataColumn item in dtSource.Columns)
            {
                arrColWidth[item.Ordinal] = Encoding.GetEncoding(936).GetBytes(item.ColumnName.ToString()).Length;
            }
            for (int i = 0; i < dtSource.Rows.Count; i++)
            {
                for (int j = 0; j < dtSource.Columns.Count; j++)
                {
                    int intTemp = Encoding.GetEncoding(936).GetBytes(dtSource.Rows[i][j].ToString()).Length;
                    if (intTemp > arrColWidth[j])
                    {
                        arrColWidth[j] = intTemp;
                    }
                }
            }



            int rowIndex = 0;

            foreach (DataRow row in dtSource.Rows)
            {
                #region 新建表，填充表头，填充列头，样式
                if (rowIndex == 65535 || rowIndex == 0)
                {
                    if (rowIndex != 0)
                    {
                        sheet = workbook.CreateSheet();
                    }

                    #region 列头及样式
                    {
                        IRow headerRow = sheet.CreateRow(1);


                        ICellStyle headStyle = workbook.CreateCellStyle();
                        headStyle.Alignment = NPOI.SS.UserModel.HorizontalAlignment.CENTER;
                        IFont font = workbook.CreateFont();
                        font.FontHeightInPoints = 10;
                        font.Boldweight = 700;
                        headStyle.SetFont(font);


                        foreach (DataColumn column in dtSource.Columns)
                        {
                            headerRow.CreateCell(column.Ordinal).SetCellValue(column.ColumnName);
                            headerRow.GetCell(column.Ordinal).CellStyle = headStyle;

                            //设置列宽
                            sheet.SetColumnWidth(column.Ordinal, (arrColWidth[column.Ordinal] + 1) * 256);

                        }
                        //headerRow.Dispose();
                    }
                    #endregion

                    rowIndex = 1;
                }
                #endregion


                #region 填充内容
                foreach (DataColumn column in dtSource.Columns)
                {
                    IRow dataRow = sheet.CreateRow(rowIndex);
                    ICell newCell = dataRow.CreateCell(column.Ordinal);

                    string drValue = row[column].ToString();

                    switch (column.DataType.ToString())
                    {
                        case "System.String"://字符串类型
                            newCell.SetCellValue(drValue);
                            break;
                        case "System.DateTime"://日期类型
                            DateTime dateV;
                            DateTime.TryParse(drValue, out dateV);
                            newCell.SetCellValue(dateV);

                            newCell.CellStyle = dateStyle;//格式化显示
                            break;
                        case "System.Boolean"://布尔型
                            bool boolV = false;
                            bool.TryParse(drValue, out boolV);
                            newCell.SetCellValue(boolV);
                            break;
                        case "System.Int16"://整型
                        case "System.Int32":
                        case "System.Int64":
                        case "System.Byte":
                            int intV = 0;
                            int.TryParse(drValue, out intV);
                            newCell.SetCellValue(intV);
                            break;
                        case "System.Decimal"://浮点型
                        case "System.Double":
                            double doubV = 0;
                            double.TryParse(drValue, out doubV);
                            newCell.SetCellValue(doubV);
                            break;
                        case "System.DBNull"://空值处理
                            newCell.SetCellValue("");
                            break;
                        default:
                            newCell.SetCellValue("");
                            break;
                    }

                }
                #endregion

                rowIndex++;
            }


            using (MemoryStream ms = new MemoryStream())
            {
                workbook.Write(ms);
                ms.Flush();
                ms.Position = 0;
                //sheet.Dispose();
                // workbook.Dispose();

                return ms;
            }



        }

        #endregion



        #region winform导出
        /// <summary>
        /// DataTable导出到Excel文件
        /// </summary>
        /// <param name="dtSource">源DataTable</param>
        /// <param name="strHeaderText">表头文本</param>
        /// <param name="strFileName">保存位置</param>
        public static void Export(DataTable dtSource, string strHeaderText, string strFileName)
        {
            using (MemoryStream ms = Export(dtSource, strHeaderText))
            {
                using (FileStream fs = new FileStream(strFileName, FileMode.Create, FileAccess.Write))
                {
                    byte[] data = ms.ToArray();
                    fs.Write(data, 0, data.Length);
                    fs.Flush();
                }
            }
        }


        /// <summary>
        /// DataTable导出到Excel文件
        /// </summary>
        /// <param name="dtSource">源DataTable</param>
        /// <param name="strHeaderText">表头文本</param>
        /// <param name="strFileName">保存位置</param>
        public static void Export(string strFileName, DataTable dtSource)
        {
            using (MemoryStream ms = Export(dtSource))
            {
                using (FileStream fs = new FileStream(strFileName, FileMode.Create, FileAccess.Write))
                {
                    byte[] data = ms.ToArray();
                    fs.Write(data, 0, data.Length);
                    fs.Flush();
                }
            }
        }
        #endregion



        /// <summary>读取excel
        /// 默认第一行为标头
        /// </summary>
        /// <param name="strFileName">excel文档路径</param>
        /// <returns></returns>
        public static DataTable Import(string strFileName)
        {
            DataTable dt = new DataTable();

            HSSFWorkbook hssfworkbook;
            using (FileStream file = new FileStream(strFileName, FileMode.Open, FileAccess.Read))
            {
                hssfworkbook = new HSSFWorkbook(file);
            }
            ISheet sheet = hssfworkbook.GetSheetAt(0);
            // System.Collections.IEnumerator rows = sheet.GetRowEnumerator();

            IRow headerRow = sheet.GetRow(0);
            int cellCount = headerRow.LastCellNum;

            for (int j = 0; j < cellCount; j++)
            {
                ICell cell = headerRow.GetCell(j);
                dt.Columns.Add(cell.ToString());
            }

            for (int i = (sheet.FirstRowNum + 1); i <= sheet.LastRowNum; i++)
            {
                IRow row = sheet.GetRow(i);
                DataRow dataRow = dt.NewRow();

                for (int j = row.FirstCellNum; j < cellCount; j++)
                {
                    if (row.GetCell(j) != null)
                        try
                        {
                            dataRow[j] = row.GetCell(j).ToString();
                        }
                        catch
                        {
                        }
                }

                dt.Rows.Add(dataRow);
            }
            return dt;
        }

        public static DataTable Import(Stream ExcelFileStream, string SheetName, int HeaderRowIndex)
        {
            HSSFWorkbook workbook = new HSSFWorkbook(ExcelFileStream);
            ISheet sheet = workbook.GetSheet(SheetName);

            DataTable table = new DataTable();

            IRow headerRow = sheet.GetRow(HeaderRowIndex);
            int cellCount = headerRow.LastCellNum;

            for (int i = headerRow.FirstCellNum; i < cellCount; i++)
            {
                DataColumn column = new DataColumn(headerRow.GetCell(i).StringCellValue);
                table.Columns.Add(column);
            }

            int rowCount = sheet.LastRowNum;

            for (int i = (sheet.FirstRowNum + 1); i < sheet.LastRowNum; i++)
            {
                IRow row = sheet.GetRow(i);
                DataRow dataRow = table.NewRow();

                for (int j = row.FirstCellNum; j < cellCount; j++)
                    dataRow[j] = row.GetCell(j).ToString();
            }

            ExcelFileStream.Close();
            workbook = null;
            sheet = null;
            return table;
        }

        public static DataTable Import(Stream ExcelFileStream, int SheetIndex, int HeaderRowIndex)
        {
            HSSFWorkbook workbook = new HSSFWorkbook(ExcelFileStream);
            ISheet sheet = workbook.GetSheetAt(SheetIndex);

            DataTable table = new DataTable();

            IRow headerRow = sheet.GetRow(HeaderRowIndex);
            int cellCount = headerRow.LastCellNum;

            for (int i = headerRow.FirstCellNum; i < cellCount; i++)
            {
                DataColumn column = new DataColumn(headerRow.GetCell(i).StringCellValue);
                table.Columns.Add(column);
            }

            int rowCount = sheet.LastRowNum;

            for (int i = (sheet.FirstRowNum + 1); i < sheet.LastRowNum; i++)
            {
                IRow row = sheet.GetRow(i);
                DataRow dataRow = table.NewRow();

                for (int j = row.FirstCellNum; j < cellCount; j++)
                {
                    if (row.GetCell(j) != null)
                        dataRow[j] = row.GetCell(j).ToString();
                }

                table.Rows.Add(dataRow);
            }

            ExcelFileStream.Close();
            workbook = null;
            sheet = null;
            return table;
        }


    }
}