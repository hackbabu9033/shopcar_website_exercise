<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication1.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="../css/style.css" />
    <script type="text/javascript">
        
        function initial() {                   
            //document.cookie = "LoginInfo="+ "; expires="
            //    + new Date(2010, 11, 24, 10, 33, 30, 0).toUTCString() + ";path=/;";            
            //alert(document.cookie);   
        }

    

        function check_for_signin() {
            if (document.getElementById("txt_Account").value == "" ||
                document.getElementById("txt_Password").value == "") {
                document.getElementById("error_msg").innerHTML = "請輸入帳號跟密碼";
                return false;
            } else {
                //var userid = document.getElementById("txt_Account").value;
                ////document.cookie = "LoginInfo=" + userid + "; expires="
                ////    + new Date(2020, 11, 24, 10, 33, 30, 0).toUTCString()+";path=/;"; //如果想跨網頁保存cookie，須將path設置為"/"，確保整個專案的網頁都能讀取到cookie
                //document.cookie = "LoginInfo=" + userid 
                //    +";path=/;";
                
            }
        }

    </script>
</head>
<body onload="initial();">
    <form id="form1" runat="server">
         <div id="nav_bar" style="background: #343030; margin: 0; height: 70px; position: relative; min-width: 1200px; width: 100%;">
            <div id="nav_container" style="float: left; width: 70%; margin-bottom: 0px;">
                <h1 style="color: #ffffff; margin-top: 20px; font-size: 2em; font-weight: bold; float: left;">生活用品店</h1>
                <ul style="float: left; margin-left: 30px; position: relative; margin-top: 30px;">
                    <li style="float: left; margin-left: 30px; list-style-type: none;"><a href="#">會員資料</a></li>
                    <li style="float: left; margin-left: 30px; list-style-type: none;"><a href="#">購物車</a></li>
                    <li style="float: left; margin-left: 30px; list-style-type: none;"><a href="#">商品市集</a></li>
                    <li style="float: left; margin-left: 30px; list-style-type: none;"><a href="#">網站管理</a></li>
                </ul>
            </div>
            <div id="login_section" style="display: inline-block;">
                <ul style="position: relative; left: 100px; margin-top: 30px;">
                    <li style="display: inline-block; list-style-type: none; text-decoration:none;" ><a  href="http://localhost:52068/membership/login.aspx" style="text-decoration:none;"><font color="#7786fb">登入</font></a></li>
                    <li style="display: inline-block; margin-left: 30px; list-style-type: none; text-decoration:none;"><a href="http://localhost:52068/membership/register.aspx" style="text-decoration:none;"><font color="#7786fb">註冊</font></a></li>
                </ul>
            </div>
        </div>
        <table id="regiter" style="margin-top: 30px; margin-left: 250px;position:relative;width:60%;">
            <tr>
                <td>
                    <h1>登入</h1>                    
                </td>
            </tr>
            <tr><td style="height:10px;"></td></tr>
            <tr style="">
                <td style="display:inline-block;">                 
                    <h4 style="display:inline-block;vertical-align:central;">輸入您的電子郵件帳戶</h4>
                    <br />
                    <asp:TextBox ID="txt_Account" runat="server" style="display:inline-block;vertical-align:central;" Width="220px">a</asp:TextBox>
                </td>
            </tr>
            <tr style="">
                <td style="display:inline-block;">                 
                    <h4 style="display:inline-block;vertical-align:central;">輸入您的密碼</h4>
                    <br />
                    <asp:TextBox ID="txt_Password" runat="server" style="display:inline-block;vertical-align:central;" Width="220px">a</asp:TextBox>
                </td>
            </tr>            
            <tr>
                <td style="position: relative; height: 20px;">
                    <asp:Label ID="error_msg" runat="server" Text="" Style="color:#ff0000;font-size:1em;font-weight:normal;"></asp:Label>
                    <asp:Button ID="register_btn" runat="server" Text="登入" Style="position: absolute; left: 48%; top: 3px; width: 53px; right: 286px;" 
                         OnClick="LogIn" OnClientClick="return check_for_signin();"/>                                      
                    
                </td>
            </tr>
        </table>


    </form>
</body>
</html>
