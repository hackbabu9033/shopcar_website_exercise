using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.cs;

namespace WebApplication1
{
    public partial class FurniturePage : System.Web.UI.Page
    {
        string connstring = GlobalData.connstr;
        string item_type = "furniture";
        string return_item_msg = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            List<item_info> items_info = new List<item_info>();
            if (!IsPostBack)
            {
                items_info = item_info.Return_items(connstring, item_type);
                for (int i = 0; i < items_info.Count; i++)
                {
                    return_item_msg += items_info[i].item_name.Trim() + "@";
                    return_item_msg += items_info[i].item_price.ToString().Trim() + "@";
                    return_item_msg += items_info[i].item_number.Trim() + "@";
                    return_item_msg += items_info[i].item_imgUrl.Trim() + "@";
                    return_item_msg += "$";
                }
                return_msg.Value = return_item_msg;
            }
        }
    }
}