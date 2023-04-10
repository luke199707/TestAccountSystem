using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Web;


namespace CommonHelper
{
    public static class common
    {
        public static string GetStringToMD5(string str)
        {
            //1.创建md5对象
            //2.调用md5方法
            //3.拼接字符串，返回
            StringBuilder sb = new StringBuilder();
            byte[] buffer = Encoding.Default.GetBytes(str);
            using (MD5 md5 = MD5.Create())
            {
                buffer = md5.ComputeHash(buffer);
            }
            for (int i = 0; i < buffer.Length; i++)
            {
                sb.Append(buffer[i].ToString("x2"));
            }
            return sb.ToString();
        }
        public static string GetClientIP()
        {
            string result = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (null == result || result == String.Empty)
            {
                result = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }
            if (null == result || result == String.Empty)
            {
                result = HttpContext.Current.Request.UserHostAddress;
            }
            return result;
        }

        /// <summary>
        /// 大数相乘算法
        /// </summary>
        /// <param name="str1">乘数1</param>
        /// <param name="str2">乘数2</param>
        /// <returns></returns>
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
