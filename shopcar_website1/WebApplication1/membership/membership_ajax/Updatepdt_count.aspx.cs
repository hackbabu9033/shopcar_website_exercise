using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.item_page;

namespace WebApplication1.membership.membership_ajax
{
    public partial class Updatepdt_count : System.Web.UI.Page
    {
        string connstring = GlobalData.connstr;
        protected void Page_Load(object sender, EventArgs e)
        {
            string UserName;
            string Querystring;
            string[] str_split;
            string str_number;
            string str_count;
            string[] items_number;
            int[] items_count;
            int tot_count;

            Querystring = HttpContext.Current.Request.QueryString["name"];
            
            if (Request.Cookies["LoginInfo"] != null)
            {
                UserName = Request.Cookies["LoginInfo"].Value;

                if (HttpContext.Current.Request.QueryString["name"] == null)
                {
                    HttpContext.Current.Response.Clear();
                    HttpContext.Current.Response.Write("nodata");
                    HttpContext.Current.Response.Flush();
                    HttpContext.Current.Response.End();
                }
                else
                {
                    str_split = Querystring.Split('$');
                    tot_count = str_split.Length-1;
                    items_number = new string[tot_count];
                    items_count = new int[tot_count];
                    for (int i=0;i< tot_count; i++)
                    {
                        str_number = str_split[i].Split(',')[0];
                        str_count = str_split[i].Split(',')[1];
                        items_number[i] = str_number;
                        items_count[i] = Int32.Parse(str_count);
                    }

                    shopping_carlist.updateitem_count(connstring, UserName, items_number, items_count);
                }

                HttpContext.Current.Response.Clear();
                //HttpContext.Current.Response.Write("testsuccess");
                HttpContext.Current.Response.Flush();
                HttpContext.Current.Response.End();  //停止回應，就不會再回傳其它東西了(比如tag)
            }
        }
    }
}