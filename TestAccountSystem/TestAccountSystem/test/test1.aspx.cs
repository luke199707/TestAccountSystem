using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestAccountSystem.test
{
    public partial class test1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           string str= Mut("456789","456789");
            long result = long.Parse(str);
            Response.Write(result);
        }
        public static string Mut(string str1, string str2)
        {
            int l1 = str1.Length;
            int l2 = str2.Length;
            int[] re = new int[l1 + l2];
            int x;
            int y;
            for (int i = l1 - 1; i >= 0; i--)
            {
                x = (int)str1[i] - 48;      //等同于x=int.Parse(str1[i].ToString());
                for (int j = l2 - 1; j >= 0; j--)
                {
                    y = (int)str2[j] - 48;  //等同于y=int.Parse(str2[j].ToString());
                    re[l1 - i + l2 - j - 2] += x * y;  //关键,将单个的乘积放入对应的位置..
                }
            }

            int lastIndex = re.Length - 1;  //最高位所在的位置
            StringBuilder sb = new StringBuilder(re.Length);
            for (int i = 0; i < lastIndex; i++)
            {
                int t = re[i];
                if (t >= 10)
                {
                    re[i + 1] += t / 10;
                    t %= 10;
                    //re[i] = t;
                }
                sb.Insert(0, t.ToString());
            }
            if (re[lastIndex] != 0)
            {
                sb.Insert(0, re[lastIndex].ToString());
            }
            return sb.ToString();
        }
    }
}