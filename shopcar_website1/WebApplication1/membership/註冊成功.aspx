<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="註冊成功.aspx.cs" Inherits="WebApplication1.membership.註冊成功" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="../css/style.css" />
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
                    <li style="display: inline-block; list-style-type: none;"><a href="../membership/login.aspx">登入</a></li>
                    <li style="display: inline-block; margin-left: 30px; list-style-type: none;"><a href="../membership/register.aspx">註冊</a></li>
                </ul>
            </div>
        </div>

        <table style="margin-top: 30px; margin-left: 250px;position:relative;width:60%;">
             <tr>
                <td>
                    <h1>恭喜您註冊成功!</h1>
                    <h3>現在您可以從右上角的登入來進入</h3>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
