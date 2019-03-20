using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class register : System.Web.UI.Page
    {
        string connstring;
        bool confirm_result=true;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            connstring =GlobalData.connstr;
            if (!IsPostBack)
            {

            }
        }

        protected void Register(object sender, EventArgs e)
        {
            string insertcmd;
            string UserName;
            string UserAccount;
            string UserPassword;
            SqlCommand cmd;

            if (confirm_result) { 

            UserName = txt_UserName.Text;
            UserAccount = txt_UserAccount.Text;
            UserPassword = txt_UserPassword.Text;

            insertcmd = "INSERT INTO member_info (member_name,email_account,password)"
                + "Values('" + UserName + "','" + UserAccount + "','" + UserPassword + "')";

            SqlConnection conn = new SqlConnection(connstring);
            conn.Open();

            try
            {
                cmd = new SqlCommand(insertcmd, conn);
                int affectCount = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }

            conn.Close();
            Response.Redirect("../membership/註冊成功.aspx");

            }
        }

        protected void chk_pwdconfirm(object source, ServerValidateEventArgs args)
        {
            string input, pwd;
            input = txt_UserPassword_confirm.Text;
            pwd = txt_UserPassword.Text;
            if (input == pwd)
                args.IsValid = true;
            else
            {
                args.IsValid = false;
                confirm_result = false;
            }

        }
    }
}