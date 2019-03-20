<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdministratorPage.aspx.cs" Inherits="WebApplication1.AdministratorPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="../css/style.css" />
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }
    </style>
</head>
<body>
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
                    <li style="display: inline-block; list-style-type: none;"><a href="http://localhost:52068/login.aspx">登入</a></li>
                    <li style="display: inline-block; margin-left: 30px; list-style-type: none;"><a href="http://localhost:52068/register.aspx">註冊</a></li>
                </ul>
            </div>
        </div>
        <div>
            <table style="margin:30px;">
                <tr>
                    <td class="auto-style1"><h3>會員名稱&nbsp;
                        <asp:TextBox ID="TextBox1" runat="server" style="vertical-align:central;"></asp:TextBox></h3></td>
                    <td class="auto-style1">
                        </td>
                    <td class="auto-style1">
                        <asp:Button ID="Button1" runat="server" Text="查詢" /></td>
                </tr>
                <tr><td style="height:30px;"></td></tr>
                <tr>
                    <asp:GridView ID="GridView1" runat="server"></asp:GridView>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
