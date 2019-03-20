using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebApplication1.cs
{
    public class item_info
    {
        #region 屬性
        public string item_name;
        public int item_price;
        public string item_number;
        public string item_imgUrl;
        #endregion

        #region 建構子

        public item_info(string item_name, int item_price,string item_number, string item_imgsrc)
        {
            this.item_name = item_name;
            this.item_price = item_price;
            this.item_number = item_number;
            this.item_imgUrl = item_imgsrc;
        }

        #endregion

        #region 方法

        /// <summary>
        /// 回傳一商品類型的商品集合
        /// </summary>
        /// <param name="connstring"></param>
        /// <returns></returns>
        public static List<item_info> Return_items(string connstring,string item_type)
        {
            List<item_info> items_info = new List<item_info>();
            string item_name;
            int item_price;
            string item_number;
            string item_imgUrl;
            string Querycmd = "Select * From item_info where item_type='"+ item_type +"'" ;
            SqlConnection conn = new SqlConnection(connstring);
            conn.Open();

            SqlCommand cmd1 = new SqlCommand(Querycmd, conn);
            SqlDataReader dr = cmd1.ExecuteReader();
            while (dr.Read())
            {
                item_name = dr["item_name"].ToString().Trim();
                item_price = Int32.Parse(dr["item_price"].ToString().Trim());
                item_number = dr["item_number"].ToString().Trim();
                item_imgUrl = dr["item_imgUrl"].ToString().Trim();
                item_info item = new item_info(item_name, item_price, item_number, item_imgUrl);
                items_info.Add(item);
            }
            return items_info;
        }      

        /// <summary>
        /// 透過商品標號取得其圖片的Url
        /// </summary>
        /// <param name="connstring"></param>
        /// <param name="item_number"></param>
        /// <returns></returns>
        public static string Get_itemUrl(string connstring,string item_number)
        {
            string item_imgUrl="";
            string Querycmd = "Select * From item_info Where item_number='" + item_number + "'";

            SqlConnection conn = new SqlConnection(connstring);
            conn.Open();

            SqlCommand cmd1 = new SqlCommand(Querycmd, conn);
            SqlDataReader dr = cmd1.ExecuteReader();


            if (dr.Read())
            {
                item_imgUrl = dr["item_imgUrl"].ToString().Trim();
            }
            cmd1.Dispose();
            dr.Close();
            conn.Close();
            return item_imgUrl;
        }

        /// <summary>
        /// 透過商品標號取得商品名稱
        /// </summary>
        /// <param name="connstring"></param>
        /// <param name="item_number"></param>
        /// <returns></returns>
        public static string Get_itemName(string connstring, string item_number)
        {
            string item_name = "";
            string Querycmd = "Select * From item_info Where item_number='" + item_number + "'";

            SqlConnection conn = new SqlConnection(connstring);
            conn.Open();

            SqlCommand cmd1 = new SqlCommand(Querycmd, conn);
            SqlDataReader dr = cmd1.ExecuteReader();


            if (dr.Read())
            {
                item_name = dr["item_name"].ToString().Trim();
            }
            cmd1.Dispose();
            dr.Close();
            conn.Close();
            return item_name;
        }

        /// <summary>
        /// 透過商品標號取得商品價格
        /// </summary>
        /// <param name="connstring"></param>
        /// <param name="item_number"></param>
        /// <returns></returns>
        public static string Get_itemPrice(string connstring, string item_number)
        {
            string item_price = "";
            string Querycmd = "Select * From item_info Where item_number='" + item_number + "'";

            SqlConnection conn = new SqlConnection(connstring);
            conn.Open();

            SqlCommand cmd1 = new SqlCommand(Querycmd, conn);
            SqlDataReader dr = cmd1.ExecuteReader();


            if (dr.Read())
            {
                item_price = dr["item_price"].ToString().Trim();
            }
            cmd1.Dispose();
            dr.Close();
            conn.Close();
            return item_price;
        }

        /// <summary>
        /// 取得商品購買數
        /// </summary>
        /// <param name="connstring"></param>
        /// <param name="item_number"></param>
        /// <returns></returns>
        public static int item_count(string connstring, string item_number)
        {
            int item_count=1;
            string Querycmd = "Select * From member_ShopInfo Where item_number='" + item_number + "'";

            SqlConnection conn = new SqlConnection(connstring);
            conn.Open();

            SqlCommand cmd1 = new SqlCommand(Querycmd, conn);
            SqlDataReader dr = cmd1.ExecuteReader();


            if (dr.Read())
            {
                if (Int32.TryParse(dr["item_count"].ToString(), out item_count)) { }
                else
                {

                }
            }
            cmd1.Dispose();
            dr.Close();
            conn.Close();
            return item_count;
        }

        #endregion
    }
}