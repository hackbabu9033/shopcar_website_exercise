using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class login : System.Web.UI.Page
    {
        string connstring= GlobalData.connstr;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }

        }

        protected void LogIn(object sender, EventArgs e)
        {
            string Querycmd;
            string UserAccount;
            string UserPassword;
            string UserName="";
            HttpCookie username = new HttpCookie("LoginInfo");// 建立名為LoginInfo的cookie


            #region 設定cookie日期與保存期限
            username.Value = DateTime.Now.ToString();
            username.Expires = DateTime.Now.AddDays(1); 
            //username.Expires = DateTime.Now.AddDays(-1); //dotnet 建立之 cookie 要由後端刪除,比較會成功

            #endregion

            UserAccount = txt_Account.Text;
            UserPassword = txt_Password.Text;
            Querycmd = "Select * From member_info Where email_account=" +"'"+UserAccount + "'" +
                " And password=" + "'" + UserPassword + "'";

            SqlConnection conn = new SqlConnection(connstring);
            conn.Open();

            SqlCommand cmd = new SqlCommand(Querycmd,conn);
            SqlDataReader dr = cmd.ExecuteReader();
            if(!dr.HasRows)
            {
                error_msg.Text = "登入錯誤：該帳戶不存在，請重新輸入";
                return;
            }
            else
            {
                if (dr.Read())
                {
                    UserName = dr["member_name"].ToString().Trim();
                    username.Value = UserName;
                }                
            }

            conn.Close();
            dr.Close();

            Response.Cookies.Add(username);//要執行這行才能確保切換到別的網頁時，剛剛建立的cookie會存在

           // HiddenField1.Value = UserName;
            Response.Redirect("../item_page/beddingpage.aspx");

        }
    }
}