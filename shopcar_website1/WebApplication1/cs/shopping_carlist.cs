using System.Collections.Generic;
using System.Data.SqlClient;
using WebApplication1.cs;

namespace WebApplication1.item_page
{
    public class shopping_carlist
    {
        #region 屬性
        
        public string UserName;
        public string item_number;
        public string item_imgUrl;
        public string item_Name;
        public string item_price;
        public int item_count;//該商品的購買總數

        #endregion

        #region 建構子

        public shopping_carlist(string UserName, string item_number, string item_imgUrl
            ,string item_Name,string item_price,int item_count)
        {
            this.UserName = UserName;
            this.item_number = item_number;
            this.item_imgUrl = item_imgUrl;
            this.item_Name = item_Name;
            this.item_price = item_price;
            this.item_count = item_count;
        }

        #endregion

        /// <summary>
        /// 檢測此商品是否以被加入購物車
        /// </summary>
        /// <param name="connectstring"></param>
        /// <param name="UserId"></param>
        /// <param name="item_number"></param>
        /// <returns></returns>
       
        #region 方法
        public static bool IsitemInshoppingcar(string connectstring, string UserId, string item_number)
        {            
            string Querycmd = "Select * From member_ShopInfo Where item_number='" + item_number + "'"
                + "And member_name='" + UserId + "'";

            SqlConnection conn = new SqlConnection(connectstring);
            conn.Open();
            SqlCommand cmd1 = new SqlCommand(Querycmd, conn);
            
            SqlDataReader dr = cmd1.ExecuteReader();

            cmd1.Dispose();

            if (!dr.HasRows)
            {
                dr.Close();                
                conn.Close();
                return false;
            }
            else
            {
                conn.Close();
                cmd1.Dispose();
                dr.Close();
                return true;
            }
        }


        /// <summary>
        /// 把當前商品加到使用者的購物車(只記商品標號item_num)
        /// </summary>
        /// <param name="connectstring"></param>
        /// <param name="UserId"></param>
        /// <param name="item_number"></param>
        public static void AdditemtoShoppingcar(string connectstring, string UserId, string item_number)
        {
            int item_count = 1;//預設商品購買數量為1

            string insertcmd = "Insert Into member_ShopInfo(member_name,item_number,item_count)"
                + "Values('"+ UserId +"','"+item_number+"','"+ item_count + "')";

            SqlConnection conn = new SqlConnection(connectstring);
            conn.Open();

            SqlCommand cmd = new SqlCommand(insertcmd, conn);
            int k = cmd.ExecuteNonQuery();

            conn.Close();
            cmd.Dispose();
        }

        /// <summary>
        /// 取得該使用者購物車中的所有商品
        /// </summary>
        /// <param name="connectstring"></param>
        /// <param name="UserId"></param>
        /// <returns></returns>
        public static List<shopping_carlist> Get_Shoppingcarlist(string connectstring, string UserId)
        {
            string Querycmd_UserItem = "Select * From member_ShopInfo Where member_name='" + UserId + "'";
            string member_name;
            string item_number="";
            string item_imgUrl="";
            string item_Name = "";
            string item_price = "";
            int item_count;


            List<shopping_carlist> shopping_Carlist = new List<shopping_carlist>();

            SqlConnection conn = new SqlConnection(connectstring);
            conn.Open();

            SqlCommand cmd = new SqlCommand(Querycmd_UserItem, conn);
            SqlDataReader dr = cmd.ExecuteReader();

            

            while (dr.Read())
            {
                member_name = dr["member_name"].ToString().Trim();
                item_number = dr["item_number"].ToString().Trim();
                
                //取得商品圖片的Url、名稱、價錢，購買數量
                item_imgUrl = item_info.Get_itemUrl(connectstring, item_number);
                item_Name = item_info.Get_itemName(connectstring, item_number);
                item_price = item_info.Get_itemPrice(connectstring, item_number);
                item_count = item_info.item_count(connectstring, item_number);
                shopping_carlist result = new shopping_carlist(member_name, item_number, item_imgUrl, item_Name, item_price,item_count);

                shopping_Carlist.Add(result);
            }           
            cmd.Dispose();
            dr.Close();
            conn.Close();

            return shopping_Carlist;
        }

        public static void removeitemfromshoppingcar(string connectstring, string UserId,string item_number)
        {
            string removecmd;
            string querycmd = "Select * From member_ShopInfo Where member_name='" + UserId + "'"+
                "and item_number='"+ item_number + "'"; 

            SqlConnection conn = new SqlConnection(connectstring);
            conn.Open();
                       

            removecmd = "Delete From member_ShopInfo Where member_name='" + UserId + "'" +
            "and item_number='" + item_number + "'";
                
            SqlCommand delcmd = new SqlCommand(removecmd,conn);
            int i = delcmd.ExecuteNonQuery();
            delcmd.Dispose();
         

            conn.Close();
        }
      

        /// <summary>
        /// 在使用者離開購物車頁面時，進行商品數量的更新
        /// </summary>
        /// <param name="connectstring"></param>
        /// <param name="UserId"></param>
        /// <param name="items_number"></param>
        /// <param name="items_count"></param>
        public static void updateitem_count(string connectstring, string UserId,
            string[] items_number,int[] items_count)
        {
            SqlCommand cmd;
            SqlConnection conn = new SqlConnection(connectstring);
            conn.Open();

            for(int i=0;i< items_number.Length;i++)
            {
                string update_cmd = "Update member_ShopInfo SET item_count='" + items_count[i]
                    +"' Where member_name='"+ UserId+"' And item_number='"+ items_number[i]+"'";
                cmd = new SqlCommand(update_cmd, conn);
                int k = cmd.ExecuteNonQuery();
                cmd.Dispose();
            }
            conn.Close();
        }
        #endregion
    }
}