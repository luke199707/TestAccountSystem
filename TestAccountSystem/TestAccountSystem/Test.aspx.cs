using CommonHelper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TestAccountSystem.DAL;

namespace TestAccountSystem
{
    public partial class Test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string flag = Request.QueryString["flag"];
                int height = 550;
                int width = 1300;
                if (flag == "7")
                {
                    #region 近一周登记单情况
                    {
                        DateTime currentTime = DateTime.Now;
                        string[] month = new string[7];
                        month[0] = currentTime.ToString("yyyy/MM/dd");
                        for (int i = 1; i < 7; i++)
                        {
                            month[i] = currentTime.AddDays(-i).Date.ToString("yyyy/MM/dd");
                        }
                        Array.Reverse(month);

                        int index = 0;
                        int index1 = 0;
                        int index2 = 0;
                        int index3 = 0;
                        int index4 = 0;
                        int index5 = 0;
                        int index6 = 0;
                        DataTable dt = SqlHelper.Select("*", "InspectionRegistration", "OrderDate>='" + month[0] + "' and OrderDate<='" + currentTime + "' and status!='保存' and status!='审核未通过'", "id");
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            string datetime = ((DateTime)dt.Rows[i]["OrderDate"]).ToString("yyyy/MM/dd");
                            if (datetime.Contains(month[0]))
                            {
                                index++;
                            }
                            else if (datetime.Contains(month[1]))
                            {
                                index1++;
                            }
                            else if (datetime.Contains(month[2]))
                            {
                                index2++;
                            }
                            else if (datetime.Contains(month[3]))
                            {
                                index3++;
                            }
                            else if (datetime.Contains(month[4]))
                            {
                                index4++;
                            }
                            else if (datetime.Contains(month[5]))
                            {
                                index5++;
                            }
                            else if (datetime.Contains(month[6]))
                            {
                                index6++;
                            }
                        }
                        string[] data = { index + "", index1 + "", index2 + "", index3 + "", index4 + "", index5 + "", index6 + "" };
                        string[] a = { "50", "45", "40", "35", "30", "25", "20", "15", "10", "5", "0" };
                        createImage(width, height, month, a, "近一周登记单信息", 5, data, "RegistrationStatsics");
                    }
                    #endregion
                }
                if (flag == "180")
                {
                    #region 近半年登记单情况
                    {
                        DateTime datetime = DateTime.Now;
                        string currentTime = datetime.ToString("yyyy/MM");
                        DateTime minTime = datetime.AddMonths(-5);
                        string[] xlist = new string[6];
                        xlist[0] = currentTime;
                        for (int i = 1; i < 6; i++)
                        {
                            xlist[i] = datetime.AddMonths(-i).ToString("yyyy/MM");
                        }
                        Array.Reverse(xlist);
                        int index1 = 0;
                        int index2 = 0;
                        int index3 = 0;
                        int index4 = 0;
                        int index5 = 0;
                        int index6 = 0;
                        DataTable dt = SqlHelper.Select("*", "InspectionRegistration", "OrderDate>='" + minTime + "' and OrderDate<='" + datetime + "' and status!='保存' and status!='审核未通过'", "id");
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            string time = ((DateTime)dt.Rows[i]["OrderDate"]).ToString("yyyy/MM");
                            if (time.Contains(xlist[0]))
                            {
                                index1++;
                            }
                            else if (time.Contains(xlist[1]))
                            {
                                index2++;
                            }
                            else if (time.Contains(xlist[2]))
                            {
                                index3++;
                            }
                            else if (time.Contains(xlist[3]))
                            {
                                index4++;
                            }
                            else if (time.Contains(xlist[4]))
                            {
                                index5++;

                            }
                            else if (time.Contains(xlist[5]))
                            {
                                index6++;
                            }
                        }
                        string[] data = { index1 + "", index2 + "", index3 + "", index4 + "", index5 + "", index6 + "" };
                        string[] ylist = { "225", "200", "175", "150", "125", "100", "75", "50", "25", "0" };
                        createImage(width, height, xlist, ylist, "近半年登记单信息", 25, data, "RegistrationStatsics");
                    }
                    #endregion
                }
                if (flag == "365")
                {
                    #region 近一年登记单情况
                    {
                        DateTime datetime = DateTime.Now;
                        string currentTime = datetime.ToString("yyyy/MM");
                        DateTime minTime = datetime.AddMonths(-11);//前12个月日期，距今天为止最小日期
                        string[] xlist = new string[12];
                        xlist[0] = currentTime;
                        for (int i = 1; i < 12; i++)
                        {
                            xlist[i] = datetime.AddMonths(-i).ToString("yyyy/MM");
                        }
                        Array.Reverse(xlist);
                        int index1 = 0;
                        int index2 = 0;
                        int index3 = 0;
                        int index4 = 0;
                        int index5 = 0;
                        int index6 = 0;
                        int index7 = 0, index8 = 0, index9 = 0, index10 = 0, index11 = 0, index12 = 0;
                        DataTable dt = SqlHelper.Select("*", "InspectionRegistration", "OrderDate>='" + minTime + "' and OrderDate<='" + datetime + "' and status!='保存' and status!='审核未通过'", "id");
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            string time = ((DateTime)dt.Rows[i]["OrderDate"]).ToString("yyyy/MM");
                            if (time.Contains(xlist[0]))
                            {
                                index1++;
                            }
                            else if (time.Contains(xlist[1]))
                            {
                                index2++;
                            }
                            else if (time.Contains(xlist[2]))
                            {
                                index3++;
                            }
                            else if (time.Contains(xlist[3]))
                            {
                                index4++;
                            }
                            else if (time.Contains(xlist[4]))
                            {
                                index5++;
                            }
                            else if (time.Contains(xlist[5]))
                            {
                                index6++;
                            }
                            else if (time.Contains(xlist[6]))
                            {
                                index7++;
                            }
                            else if (time.Contains(xlist[7]))
                            {
                                index8++;
                            }
                            else if (time.Contains(xlist[8]))
                            {
                                index9++;
                            }
                            else if (time.Contains(xlist[9]))
                            {
                                index10++;
                            }
                            else if (time.Contains(xlist[10]))
                            {
                                index11++;
                            }
                            else if (time.Contains(xlist[11]))
                            {
                                index12++;
                            }
                        }
                        string[] data = { index1 + "", index2 + "", index3 + "", index4 + "", index5 + "", index6 + "", index7 + "", index8 + "", index9 + "", index10 + "", index11 + "", index12 + "" };
                        string[] ylist = { "360", "320", "280", "240", "200", "160", "120", "80", "40", "0" };
                        createImage(width, height, xlist, ylist, "近一年登记单信息", 40, data, "RegistrationStatsics");
                    }
                    #endregion
                }
                if (flag == "7money")
                {
                    DateTime currentTime = DateTime.Now;
                    string[] day = new string[7];
                    day[0] = currentTime.ToString("yyyy/MM/dd");
                    for (int i = 1; i < 7; i++)
                    {
                        day[i] = currentTime.AddDays(-i).Date.ToString("yyyy/MM/dd");
                    }
                    Array.Reverse(day);
                    double index1 = 0.0, index2 = 0.0, index3 = 0.0, index4 = 0.0, index5 = 0.0, index6 = 0.0, index7 = 0.0;
                    DataTable dt = SqlHelper.Select("*", "InspectionRegistration", "Amount>0", "id");
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        string datetime = ((DateTime)dt.Rows[i]["OrderDate"]).ToString("yyyy/MM/dd");
                        double money = Convert.ToDouble(dt.Rows[i]["Amount"]);
                        if (datetime.Contains(day[0]))
                        {
                            index1 += money;
                        }
                        else if (datetime.Contains(day[1]))
                        {
                            index2 += money;
                        }
                        else if (datetime.Contains(day[2]))
                        {
                            index3 += money;
                        }
                        else if (datetime.Contains(day[3]))
                        {
                            index4 += money;
                        }
                        else if (datetime.Contains(day[4]))
                        {
                            index5 += money;
                        }
                        else if (datetime.Contains(day[5]))
                        {
                            index6 += money;
                        }
                        else if (datetime.Contains(day[6]))
                        {
                            index7 += money;
                        }
                    }
                    string[] data = { index1 + "", index2 + "", index3 + "", index4 + "", index5 + "", index6 + "", index7 + "" };
                    string[] ylist = { "50000","45000","40000","35000","30000", "25000", "20000", "15000", "10000", "5000", "0" };
                    createImage(width, height, day, ylist, "近一周收费金额信息", 5000, data, "MoneyStatsics");//MoneyStatsics-RegistrationStatsics
                }
                if (flag == "180money")
                {
                    DateTime datetime = DateTime.Now;
                    string currentTime = datetime.ToString("yyyy/MM");
                    DateTime minTime = datetime.AddMonths(-5);
                    string[] xlist = new string[6];
                    xlist[0] = currentTime;
                    for (int i = 1; i < 6; i++)
                    {
                        xlist[i] = datetime.AddMonths(-i).ToString("yyyy/MM");
                    }
                    Array.Reverse(xlist);
                    double index1 = 0.0, index2 = 0.0, index3 = 0.0, index4 = 0.0, index5 = 0.0, index6 = 0.0;
                    DataTable dt = SqlHelper.Select("*", "InspectionRegistration", "OrderDate>='" + minTime + "' and OrderDate<='" + datetime + "' and Amount>0", "id");
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        string time = ((DateTime)dt.Rows[i]["OrderDate"]).ToString("yyyy/MM");
                        //string datetime = ((DateTime)dt.Rows[i]["OrderDate"]).ToString("yyyy/MM/dd");
                        double money = Convert.ToDouble(dt.Rows[i]["Amount"]);
                        if (time.Contains(xlist[0]))
                        {
                            index1 += money;
                        }
                        else if (time.Contains(xlist[1]))
                        {
                            index2 += money;
                        }
                        else if (time.Contains(xlist[2]))
                        {
                            index3 += money;
                        }
                        else if (time.Contains(xlist[3]))
                        {
                            index4 += money;
                        }
                        else if (time.Contains(xlist[4]))
                        {
                            index5 += money;
                        }
                        else if (time.Contains(xlist[5]))
                        {
                            index6 += money;
                        }
                    }
                    string[] data = { index1 + "", index2 + "", index3 + "", index4 + "", index5 + "", index6 + "" };
                    string[] ylist = { "100000","900000","800000","700000","600000", "500000", "400000", "300000", "200000", "100000", "0" };
                    createImage(width, height, xlist, ylist, "近半年收费金额信息", 100000, data, "MoneyStatsics");
                }
                if (flag == "365money")
                {
                    DateTime datetime = DateTime.Now;
                    string currentTime = datetime.ToString("yyyy/MM");
                    DateTime minTime = datetime.AddMonths(-11);//前12个月日期，距今天为止最小日期
                    string[] xlist = new string[12];
                    xlist[0] = currentTime;
                    for (int i = 1; i < 12; i++)
                    {
                        xlist[i] = datetime.AddMonths(-i).ToString("yyyy/MM");
                    }
                    Array.Reverse(xlist);
                    double index1 = 0.0, index2 = 0.0, index3 = 0.0, index4 = 0.0, index5 = 0.0, index6 = 0.0, index7 = 0.0, index8 = 0.0, index9 = 0.0, index10 = 0.0, index11 = 0.0, index12 = 0.0;
                    DataTable dt = SqlHelper.Select("*", "InspectionRegistration", "OrderDate>='" + minTime + "' and OrderDate<='" + datetime + "' and Amount>0", "id");
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        double money = Convert.ToDouble(dt.Rows[i]["Amount"]);
                        string time = ((DateTime)dt.Rows[i]["OrderDate"]).ToString("yyyy/MM");
                        if (time.Contains(xlist[0]))
                        {
                            index1 += money;
                        }
                        else if (time.Contains(xlist[1]))
                        {
                            index2 += money;
                        }
                        else if (time.Contains(xlist[2]))
                        {
                            index3 += money;
                        }
                        else if (time.Contains(xlist[3]))
                        {
                            index4 += money;
                        }
                        else if (time.Contains(xlist[4]))
                        {
                            index5 += money;
                        }
                        else if (time.Contains(xlist[5]))
                        {
                            index6 += money;
                        }
                        else if (time.Contains(xlist[6]))
                        {
                            index7 += money;
                        }
                        else if (time.Contains(xlist[7]))
                        {
                            index8 += money;
                        }
                        else if (time.Contains(xlist[8]))
                        {
                            index9 += money;
                        }
                        else if (time.Contains(xlist[9]))
                        {
                            index10 += money;
                        }
                        else if (time.Contains(xlist[10]))
                        {
                            index11 += money;
                        }
                        else if (time.Contains(xlist[11]))
                        {
                            index12 += money;
                        }
                        string[] data = { index1 + "", index2 + "", index3 + "", index4 + "", index5 + "", index6 + "", index7 + "", index8 + "", index9 + "", index10 + "", index11 + "", index12 + "" };
                        string[] ylist = { "5000000","4500000","4000000","3500000","3000000", "2500000", "2000000", "1500000", "1000000", "500000", "0" };
                        createImage(width, height, xlist, ylist, "近一年收费金额信息", 500000, data, "MoneyStatsics");
                    }
                }
            }
            //private void CreateImage()
            //{
            //    int height = 500, width = 1000;
            //    Bitmap image = new Bitmap(width, height);
            //    //创建Graphics类对象
            //    Graphics g = Graphics.FromImage(image);

            //    try
            //    {
            //        //清空图片背景色
            //        g.Clear(Color.White);

            //        Font font = new Font("Arial", 10, FontStyle.Regular);
            //        Font font1 = new Font("宋体", 20, FontStyle.Bold);

            //        LinearGradientBrush brush = new LinearGradientBrush(new Rectangle(0, 0, image.Width, image.Height),
            //        Color.Blue, Color.BlueViolet, 1.2f, true);
            //        g.FillRectangle(Brushes.WhiteSmoke, 0, 0, width, height);
            //        // Brush brush1 = new SolidBrush(Color.Blue);

            //        g.DrawString(" 成绩统计柱状图", font1, brush, new PointF(70, 30));
            //        //画图片的边框线
            //        g.DrawRectangle(new Pen(Color.Black), 0, 0, image.Width, image.Height);


            //        Pen mypen = new Pen(brush, 1);
            //        //绘制线条
            //        int x = 100;
            //        for (int i = 0; i < 24; i++)//绘制除边框以外的竖向线条
            //        {
            //            g.DrawLine(mypen, x, 80, x, 340);//(100,80),(100,340)
            //            x = x + 40;
            //        }
            //        Pen mypen1 = new Pen(Color.Black, 2);
            //        x = 60;
            //        g.DrawLine(mypen1, x, 80, x, 340);//绘制最左边竖线（大黑线）


            //        int y = 80;
            //        for (int i = 0; i < 10; i++)//绘制除边框以外的横向线条
            //        {
            //            g.DrawLine(mypen, 60, y, 980, y);//(60,106),(620,106)
            //            y = y + 26;
            //        }
            //        g.DrawLine(mypen1, 60, y, 980, y);//绘制最下边横向线条（大黑线）

            //        //x轴
            //        String[] n = { "一月份", "二月份", "三月份", "四月份", "五月份", "六月份", "七月份", "八月份", "九月份", "十月份", "十一月", "十二月" };
            //        x = 78;
            //        for (int i = 0; i < n.Length; i++)
            //        {
            //            g.DrawString(n[i].ToString(), font, Brushes.Blue, x, 348); //设置文字内容及输出位置
            //            x = x + 80;//设置文字在横坐标的位置
            //        }

            //        //y轴
            //        String[] m = { "250", "225", "200", "175", "150", "125", "100", " 75", " 50", " 25", " 0" };
            //        y = 72;
            //        for (int i = 0; i < 10; i++)
            //        {
            //            g.DrawString(m[i].ToString(), font, Brushes.Blue, 25, y); //设置文字内容及输出位置
            //            y = y + 26;//一个竖格之间的距离是26
            //        }

            //        int[] Count1 = new int[7];
            //        int[] Count2 = new int[7];

            //        // SqlConnection Con = new SqlConnection("Server=(Local);Database=committeeTraining;Uid=sa;Pwd=**");
            //        //   Con.Open();
            //        // string cmdtxt2 = "SELECT * FROM ##Count where Company='" + this.ddlTaget.SelectedItem.Text.Trim() + "'";
            //        //SqlDataAdapter da = new SqlDataAdapter(cmdtxt2, Con);
            //        // DataSet ds = new DataSet();
            //        //da.Fill(ds);

            //        Count1[0] = Convert.ToInt32(100);
            //        Count1[1] = Convert.ToInt32(110);
            //        Count1[2] = Convert.ToInt32(120);
            //        Count1[3] = Convert.ToInt32(130);

            //        Count1[4] = Count1[0] + Count1[1];
            //        Count1[5] = Count1[2] + Count1[3];

            //        Count1[6] = Convert.ToInt32(120);

            //        Count2[0] = Convert.ToInt32(110);
            //        Count2[1] = Convert.ToInt32(80);
            //        Count2[2] = Convert.ToInt32(90);
            //        Count2[3] = Convert.ToInt32(75);

            //        Count2[4] = Count2[0] + Count2[1];
            //        Count2[5] = Count2[2] + Count2[3];

            //        Count2[6] = Convert.ToInt32(30);

            //        //绘制柱状图.
            //        x = 80;
            //        Font font2 = new System.Drawing.Font("Arial", 10, FontStyle.Bold);
            //        SolidBrush mybrush = new SolidBrush(Color.Red);
            //        SolidBrush mybrush2 = new SolidBrush(Color.Green);

            //        //第一期
            //        g.FillRectangle(mybrush, x, 340 - Count1[0], 20, Count1[0]);
            //        g.DrawString(Count1[0].ToString(), font2, Brushes.Red, x, 340 - Count1[0] - 15);

            //        x = x + 20;
            //        g.FillRectangle(mybrush2, x, 340 - Count2[0], 20, Count2[0]);
            //        g.DrawString(Count2[0].ToString(), font2, Brushes.Green, x, 340 - Count2[0] - 15);


            //        //第二期
            //        x = x + 60;
            //        g.FillRectangle(mybrush, x, 340 - Count1[1], 20, Count1[1]);
            //        g.DrawString(Count1[1].ToString(), font2, Brushes.Red, x, 340 - Count1[1] - 15);


            //        x = x + 20;
            //        g.FillRectangle(mybrush2, x, 340 - Count2[1], 20, Count2[1]);
            //        g.DrawString(Count2[1].ToString(), font2, Brushes.Green, x, 340 - Count2[1] - 15);


            //        //第三期
            //        x = x + 60;
            //        g.FillRectangle(mybrush, x, 340 - Count1[2], 20, Count1[2]);
            //        g.DrawString(Count1[2].ToString(), font2, Brushes.Red, x, 340 - Count1[2] - 15);

            //        x = x + 20;
            //        g.FillRectangle(mybrush2, x, 340 - Count2[2], 20, Count2[2]);
            //        g.DrawString(Count2[2].ToString(), font2, Brushes.Green, x, 340 - Count2[2] - 15);

            //        //第四期
            //        x = x + 60;
            //        g.FillRectangle(mybrush, x, 340 - Count1[3], 20, Count1[3]);
            //        g.DrawString(Count1[3].ToString(), font2, Brushes.Red, x, 340 - Count1[3] - 15);

            //        x = x + 20;
            //        g.FillRectangle(mybrush2, x, 340 - Count2[3], 20, Count2[3]);
            //        g.DrawString(Count2[3].ToString(), font2, Brushes.Green, x, 340 - Count2[3] - 15);

            //        //上半年
            //        x = x + 60;
            //        g.FillRectangle(mybrush, x, 340 - Count1[4], 20, Count1[4]);
            //        g.DrawString(Count1[4].ToString(), font2, Brushes.Red, x, 340 - Count1[4] - 15);

            //        x = x + 20;
            //        g.FillRectangle(mybrush2, x, 340 - Count2[4], 20, Count2[4]);
            //        g.DrawString(Count2[4].ToString(), font2, Brushes.Green, x, 340 - Count2[4] - 15);

            //        //下半年
            //        x = x + 60;
            //        g.FillRectangle(mybrush, x, 340 - Count1[5], 20, Count1[5]);
            //        g.DrawString(Count1[5].ToString(), font2, Brushes.Red, x, 340 - Count1[5] - 15);

            //        x = x + 20;
            //        g.FillRectangle(mybrush2, x, 340 - Count2[5], 20, Count2[5]);
            //        g.DrawString(Count2[5].ToString(), font2, Brushes.Green, x, 340 - Count2[5] - 15);

            //        //全年
            //        x = x + 60;
            //        g.FillRectangle(mybrush, x, 340 - Count1[6], 20, Count1[6]);
            //        g.DrawString(Count1[6].ToString(), font2, Brushes.Red, x, 340 - Count1[6] - 15);


            //        x = x + 20;
            //        g.FillRectangle(mybrush2, x, 340 - Count2[6], 20, Count2[6]);
            //        g.DrawString(Count2[6].ToString(), font2, Brushes.Green, x, 340 - Count2[6] - 15);


            //        //绘制标识
            //        Font font3 = new System.Drawing.Font("Arial", 10, FontStyle.Regular);
            //        g.DrawRectangle(new Pen(Brushes.Blue), 170, 400, 250, 50); //绘制范围框
            //        g.FillRectangle(Brushes.Red, 270, 410, 20, 10); //绘制小矩形
            //        g.DrawString("报名人数", font3, Brushes.Red, 292, 408);

            //        g.FillRectangle(Brushes.Green, 270, 430, 20, 10);
            //        g.DrawString("通过人数", font3, Brushes.Green, 292, 428);

            //        System.IO.MemoryStream ms = new System.IO.MemoryStream();
            //        image.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
            //        Response.ClearContent();
            //        Response.ContentType = "image/Jpeg";
            //        Response.BinaryWrite(ms.ToArray());
            //    }
            //    finally
            //    {
            //        g.Dispose();
            //        image.Dispose();
            //    }
            //}
        }

        private void createImage(int width, int height, string[] xList, string[] yList, string title, int yDifference, string[] dataSource, string type)
        {
            Bitmap image = new Bitmap(width, height);
            //创建Graphics类对象
            Graphics g = Graphics.FromImage(image);
            try
            {
                //清空图片背景色
                g.Clear(Color.White);

                Font font = new Font("Arial", 10, FontStyle.Regular);
                Font font1 = new Font("宋体", 20, FontStyle.Bold);

                LinearGradientBrush brush = new LinearGradientBrush(new Rectangle(0, 0, image.Width, image.Height),
                Color.Blue, Color.BlueViolet, 1.2f, true);
                g.FillRectangle(Brushes.WhiteSmoke, 0, 0, width, height);
                // Brush brush1 = new SolidBrush(Color.Blue);

                g.DrawString(title, font1, brush, new PointF(70, 30));
                //画图片的边框线
                g.DrawRectangle(new Pen(Color.Black), 0, 0, image.Width - 1, image.Height - 1);

                Pen mypen = new Pen(brush, 1);
                //绘制线条
                int x = 100;
                int yLineLength = 40 * (yList.Length - 1) + 80;//动态确定竖线的长度//--------26
                for (int i = 0; i < xList.Length * 2; i++)//绘制除边框以外的竖向线条
                {
                    g.DrawLine(mypen, x, 80, x, yLineLength);//(100,80),(100,340)
                    x = x + 40;
                }
                Pen mypen1 = new Pen(Color.Black, 2);
                x = 60;
                g.DrawLine(mypen1, x, 80, x, yLineLength);//绘制最左边竖线（大黑线）


                int y = 80;
                int xLineLength = 40 * xList.Length * 2 + 60;//动态确定横线的长度
                for (int i = 0; i < yList.Length - 1; i++)//绘制除边框以外的横向线条
                {
                    g.DrawLine(mypen, 60, y, xLineLength, y);//(60,106),(620,106)
                    y = y + 40;
                }
                g.DrawLine(mypen1, 60, y, xLineLength, y);//绘制最下边横向线条（大黑线）

                //x轴

                x = 78;
                for (int i = 0; i < xList.Length; i++)
                {
                    g.DrawString(xList[i].ToString(), font, Brushes.Blue, x, yLineLength + 10); //设置文字内容及输出位置
                    x = x + 80;//设置文字在横坐标的位置
                }

                //y轴

                y = 72;
                for (int i = 0; i < yList.Length; i++)
                {
                    g.DrawString(yList[i].ToString(), font, Brushes.Blue, 25, y); //设置文字内容及输出位置
                    y = y + 40;//一个竖格之间的距离是26
                }

                //绘制柱状图.
                x = 90;
                Font font2 = new System.Drawing.Font("Arial", 10, FontStyle.Bold);
                SolidBrush mybrush = new SolidBrush(Color.Red);
                SolidBrush mybrush2 = new SolidBrush(Color.Green);
                if (type == "RegistrationStatsics")
                {//加载登记单数据
                    for (int i = 0; i < xList.Length; i++)//通过遍历加载数据
                    {
                        int num = int.Parse(dataSource[i]);//模拟数据
                        int differenceLength = (40 - yDifference) * num / yDifference;//差值
                        g.FillRectangle(mybrush, x, yLineLength - num - differenceLength, 20, num + differenceLength);
                        g.DrawString(num.ToString(), font2, Brushes.Red, x, yLineLength - num - 15 - differenceLength);
                        x = x + 80;
                    }
                }
                else if (type == "MoneyStatsics")
                {//加载金额数据
                    for (int i = 0; i < xList.Length; i++)
                    {
                        //int num = int.Parse(dataSource[i]);//模拟数据
                        double money = double.Parse(dataSource[i]);
                        int num = (int)Math.Round(money, 0);
                        int num1 = yDifference - 40;
                        string str = common.Mut(num1.ToString(), num.ToString());
                        long nums = -long.Parse(str);
                        long differenceLength = nums / yDifference;//差值
                        g.FillRectangle(mybrush, x, yLineLength - num - differenceLength, 20, num + differenceLength);
                        g.DrawString(money.ToString(), font2, Brushes.Red, x, yLineLength - num - 15 - differenceLength);
                        x = x + 80;
                    }
                }


                System.IO.MemoryStream ms = new System.IO.MemoryStream();
                image.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
                Response.ClearContent();
                Response.ContentType = "image/Jpeg";
                Response.BinaryWrite(ms.ToArray());
            }
            finally
            {
                g.Dispose();
                image.Dispose();
            }
        }
    }
}