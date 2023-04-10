using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestAccountSystem.AdminPages
{
    public partial class InfoStatistics : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string page = Request.QueryString["page"];
                if (page == "1")
                {
                    breadcrumbs.Visible = true;
                    page1Div.Visible = true;
                    imageDiv.Visible = true;
                }
                else if (page == "2")
                {
                    moneyDiv.Visible = true;
                    page2Div.Visible = true;
                    imageDivPage2.Visible = true;
                }

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {//近一周

        }

        protected void Button2_Click(object sender, EventArgs e)
        {//近3个月

        }

        protected void Button3_Click(object sender, EventArgs e)
        {//近一年

        }
        /// <summary>
        /// 绘制柱形统计图
        /// </summary>
        /// <param name="width">图片宽</param>
        /// <param name="height">图片高</param>
        /// <param name="xList">x轴要显示的数据</param>
        /// <param name="yList">y轴要显示的数据</param>
        /// <param name="title">柱形图的标题</param>
        /// <param name="yDifference">表示y轴一个格子代表多大的数，即一个格子的上下差值</param>
        private void createImage(int width, int height, string[] xList, string[] yList, string title, int yDifference, string[] dataSource)
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
                int yLineLength = 26 * (yList.Length - 1) + 80;//动态确定竖线的长度
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
                    y = y + 26;
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
                    y = y + 26;//一个竖格之间的距离是26
                }

                //绘制柱状图.
                x = 90;
                Font font2 = new System.Drawing.Font("Arial", 10, FontStyle.Bold);
                SolidBrush mybrush = new SolidBrush(Color.Red);
                SolidBrush mybrush2 = new SolidBrush(Color.Green);

                //第一期
                //g.FillRectangle(mybrush, x, 26 * (yList.Length - 1) + 80 - 100 - 4, 20, 100 + 4);
                //g.DrawString(100.ToString(), font2, Brushes.Red, x, 26 * (yList.Length - 1) + 80 - 100 - 15);

                //x = x + 80;
                //g.FillRectangle(mybrush2, x, 26 * (yList.Length - 1) + 80 - 200 - 8, 20, 200 + 8);
                //g.DrawString(200.ToString(), font2, Brushes.Green, x, 26 * (yList.Length - 1) + 80 - 200 - 15);

                for (int i = 0; i < xList.Length; i++)//通过遍历加载数据
                {
                    int num = int.Parse(dataSource[i]);//模拟数据
                    int differenceLength = (26 - yDifference) * num / yDifference;//差值
                    g.FillRectangle(mybrush, x, yLineLength - num - differenceLength, 20, num + differenceLength);
                    g.DrawString(num.ToString(), font2, Brushes.Red, x, yLineLength - num - 15 - differenceLength);
                    x = x + 80;
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