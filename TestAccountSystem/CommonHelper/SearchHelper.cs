
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CommonHelper
{
    public class SearchHelper
    {
        public static string ApproxSearch(string tableName,string condition)
        {
            List<string> list = GetTableInfo.GetByTableName(tableName);
            string res = "";
            if (list != null)
            {
                foreach (string col in list)
                {
                    res += col + " like '%" + condition + "%' or ";
                }//"ID like % text值 + % or RetailTicketTypeId like "
                if (res != "")
                {
                    res = res.Substring(0, res.Length - 3);
                }
                res = "and (" + res + ")";
            }
            return res;
        }
        //时间查询
        public static string TimeSearch(string tableName,string field, int index)
        {
            string res = "";
            switch (index)
            {
                case 0:
                    res = "";
                    break;
                case 1:
                    res = string.Format("and datediff(day,"+ field + ",getdate())=0");//一天
                    break;
                case 2:
                    res = string.Format("and  (  Convert(datetime," + field + ") between dateadd(wk,-1,getdate()) and getdate()  )");//一周
                    break;
                case 3:
                    res = string.Format("and  (  Convert(datetime," + field + ") between dateadd(mm,-1,getdate()) and getdate()  )");//一个月
                    break;
                case 4:
                    res = string.Format("and  (  Convert(datetime," + field + ") between dateadd(mm,-3,getdate()) and getdate()  )");//三个月
                    break;
                case 5:
                    res = string.Format("and  (  Convert(datetime," + field + ") between dateadd(mm,-6,getdate()) and getdate()  )");//六个月
                    break;
                case 6:
                    res = string.Format("and  (  Convert(datetime," + field + ") between dateadd(mm,-12,getdate()) and getdate()  )");//一年
                    break;
            }

            return res;
        }


      }
}
