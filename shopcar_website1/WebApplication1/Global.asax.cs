using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace WebApplication1
{
    public class Global : System.Web.HttpApplication
    {
        public string conn_login;
        

        /// <summary>
        /// 當有使用者連線進來，程式起來時會觸發的事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Application_Start(object sender, EventArgs e)
        {
            //***  在此 Application_Start() 內,不可使用 try catch 方式寫程式,否則會造成程式碼無法中斷且會產生 bug

            string connectstring = System.Configuration.ConfigurationManager.AppSettings["SysData_SqlDbConnectionstring"].ToString();

            GlobalData.connstr = connectstring;



        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}