using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.item_page;

namespace WebApplication1.membership
{
    public partial class GetuserShopcar : System.Web.UI.Page
    {
        string connstring = GlobalData.connstr;
        protected void Page_Load(object sender, EventArgs e)
        {
            string UserName;
            string Querystring;
            string item_number;
            List<shopping_carlist> Client_shoppinglist;
            string QueryResult = "";


            Querystring = HttpContext.Current.Request.QueryString["name"];
            item_number = Querystring.Split(',')[0];

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
                    Client_shoppinglist = shopping_carlist.Get_Shoppingcarlist(connstring, UserName);
                    for (int i = 0; i < Client_shoppinglist.Count; i++)
                    {

                        QueryResult += Client_shoppinglist[i].UserName + "@";
                        QueryResult += Client_shoppinglist[i].item_number + "@";
                        QueryResult += Client_shoppinglist[i].item_imgUrl + "@";
                        QueryResult += Client_shoppinglist[i].item_Name + "@";
                        QueryResult += Client_shoppinglist[i].item_price + "@";
                        QueryResult += Client_shoppinglist[i].item_count.ToString() + "@";

                        QueryResult += "$";
                    }

                }

                HttpContext.Current.Response.Clear();
                HttpContext.Current.Response.Write(QueryResult);
                HttpContext.Current.Response.Flush();
                HttpContext.Current.Response.End();  //停止回應，就不會再回傳其它東西了(比如tag)
            }
        }
    }
}