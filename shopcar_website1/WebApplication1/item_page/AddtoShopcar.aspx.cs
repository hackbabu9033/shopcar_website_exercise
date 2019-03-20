using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.item_page
{
    public partial class AddtoShopcar1 : System.Web.UI.Page
    {
        string connstring = GlobalData.connstr;
        protected void Page_Load(object sender, EventArgs e)
        {
            string UserName;
            string Querystring;
            string item_number;
            bool Isitem_inshoppingcar;

            Querystring = HttpContext.Current.Request.QueryString["name"];
            item_number = Querystring.Split('_')[0];

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
                    Isitem_inshoppingcar = shopping_carlist.IsitemInshoppingcar(connstring, UserName, item_number);
                    if (!Isitem_inshoppingcar)
                        shopping_carlist.AdditemtoShoppingcar(connstring, UserName, item_number);
                }

                HttpContext.Current.Response.Clear();
                //HttpContext.Current.Response.Write("testsuccess");
                HttpContext.Current.Response.Flush();
                HttpContext.Current.Response.End();  //停止回應，就不會再回傳其它東西了(比如tag)
            }
        }
    }
}