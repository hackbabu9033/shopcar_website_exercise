<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="WebApplication1.register" %>

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

    
        

    </script>
   
</head>
<body>
    <form id="form1" runat="server">
         <div id="nav_bar" style="background: #343030; margin: 0; height: 70px; position: relative; min-width: 1200px; width: 100%;">
            <div id="nav_container" style="float: left; width: 70%; margin-bottom: 0px;">
                <h1 style="color: #ffffff; margin-top: 20px; font-size: 2em; font-weight: bold; float: left;">生活用品店</h1>
                <ul style="float: left; margin-left: 30px; position: relative; margin-top: 30px;">
                    <li style="float: left; margin-left: 30px; list-style-type: none;"><a href="#">商品市集</a></li>
                    <li style="float: left; margin-left: 30px; list-style-type: none;"><a href="http://localhost:52068/membership/shopping_car.aspx">購物車</a></li>
                </ul>
            </div>
            <div id="login_section" style="display: inline-block;">
                <ul style="position: relative; left: 100px; margin-top: 30px;">
                    <li style="display: inline-block; list-style-type: none;"><a href="http://localhost:52068/membership/login.aspx"><font color="#7786fb">登入</font></a></li>
                    <li style="display: inline-block; margin-left: 30px; list-style-type: none;"><a href="http://localhost:52068/membership/register.aspx"><font color="#7786fb">註冊</font></a></li>
                    <li id="logout" style="display: none;  list-style-type: none; margin-left: 30px; text-decoration:none;"><a href="#" style="text-decoration:none;" onclick="LogOut(); "><font color="#7786fb">登出</font></a></li>
                </ul>
            </div>
        </div>
        <div id="regiter" class="registertable" style="width:500px;">
            <div style="margin-top: 30px;text-align:center;"><font class="registertable_font registertable_header">註冊會員</font></div>            
            <div style="margin-top: 30px;"><font class="registertable_font">會員帳號</font></div>
            <div style="text-align:center;">
                <asp:TextBox ID="txt_UserAccount"  Width="450px" BorderColor="#b6b0b0" Height="20px" runat="server"></asp:TextBox>
            </div>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="請輸入6~12碼的英文或數字" ControlToValidate="txt_UserAccount" 
                Display="Dynamic" ValidationExpression="\w{6,12}" CssClass="registertable_errorMsg"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="請輸入會員帳號" ControlToValidate="txt_UserAccount" 
                Display="Dynamic" CssClass="registertable_errorMsg"></asp:RequiredFieldValidator>
            <div style="margin-top: 30px;"><font class="registertable_font">密碼</font></div>
            <div style="text-align:center;">
                <asp:TextBox ID="txt_UserPassword"  Width="450px" BorderColor="#b6b0b0" Height="20px" runat="server"></asp:TextBox>
            </div>   
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="請輸入6~12碼的英文或數字" ControlToValidate="txt_UserPassword"
                Display="Dynamic" ValidationExpression="\w{6,12}" CssClass="registertable_errorMsg"></asp:RegularExpressionValidator>                        
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="請輸入會員密碼" ControlToValidate="txt_UserPassword" 
                Display="Dynamic" CssClass="registertable_errorMsg"></asp:RequiredFieldValidator>
            <div style="margin-top: 30px;"><font class="registertable_font">確認密碼</font></div>
            <div style="text-align:center;">
                <asp:TextBox ID="txt_UserPassword_confirm"  Width="450px" BorderColor="#b6b0b0" Height="20px" runat="server"></asp:TextBox>
            </div>
            <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="與密碼不符，請再確認" ControlToValidate="txt_UserPassword" 
                Display="Dynamic" CssClass="registertable_errorMsg" OnServerValidate="chk_pwdconfirm"></asp:CustomValidator>
            <div style="margin-top: 30px;"><font class="registertable_font">名稱</font></div>
            <div style="text-align:center;">
                <asp:TextBox ID="txt_UserName"  Width="450px" BorderColor="#b6b0b0" Height="20px" runat="server"></asp:TextBox>
            </div>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="請輸入名稱" ControlToValidate="txt_UserName" 
                Display="Dynamic" CssClass="registertable_errorMsg"></asp:RequiredFieldValidator>
            <div style="margin-top: 30px;">
                <asp:Button ID="Button1" CssClass="registertable_btn" runat="server" Text="註冊" Font-Bold="True" 
                    ForeColor="White" OnClick="Register" OnClientClick=""/></div>
        </div>
    </form>
</body>
</html>
