<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dailynecessity.aspx.cs" Inherits="WebApplication1.item_page.dailynecessity" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="../css/style.css" />
    <script type="text/javascript" src="../js/pdt_info.js"></script>
   <script type="text/javascript">
         var xmlHttp;
        
        function initial() { 
            var All_objs = new Array();
            var targetCookie = getCookie("LoginInfo");
            var test,div,div_demo;
                  
            chk_Islogin(targetCookie);
            All_item = get_All_item();
            var itemobjs = new item_objs(All_item);
            div = itemobjs.create_div_items();
            div_demo = document.getElementById("demolist");
            div_demo.appendChild(div);
            test = document.getElementById('return_msg').value;
            console.log(test);

       } 

        function chk_Islogin(targetCookie) {
            if (targetCookie != null) {
                //alert(targetCookie);
                document.getElementById("login").innerHTML = '<a href="javascript: void(0)" style="text-decoration:none;"><font color=#7786fb>' + targetCookie + '</font></a>';
                document.getElementById("register").style.display = "none";
                document.getElementById("logout").style.display = "inline-block";
            } else {
                document.getElementById("login").innerHTML = '<a href="../membership/login.aspx" style="text-decoration:none;"><font color=#7786fb>' +"登入"+ '</font></a>';
                document.getElementById("register").style.display = "inline-block";
                document.getElementById("logout").style.display = "none";
            }
        }

        function get_All_item() {
            var item_name, item_price, item_number, item_imgUrl;
            var cur_item_obj;
            var return_msg = document.getElementById('return_msg').value;
            var All_item = new Array();
            var str_split1 = return_msg.split('$');
            for (var i = 0; i < str_split1.length-1; i++) {
                var str_split2 = str_split1[i].split('@');
                item_name = str_split2[0];
                item_price = str_split2[1];
                item_number = str_split2[2];
                item_imgUrl = str_split2[3];
                cur_item_obj = new item_info(item_name, item_price, item_number, item_imgUrl);
                All_item.push(cur_item_obj);
            }

            return All_item;
        }

        function LogOut() {          
            DeleteCookie("LoginInfo");
            window.location.reload(); //重新載入頁面時，一樣會觸發body的onload函式
        }

        function getCookie(cname)
        {
          var name = cname + "=";
          var ca = document.cookie.split(';');
          for(var i=0; i<ca.length; i++) 
          {
            //var c = ca[i].trim();
            var c = ca[i];
              if (c.indexOf(name) ==0) {
                  //alert(c);
                  return c.substring(name.length, c.length);              
              }
            }
            return null;
        }

        function DeleteCookie(name) {
            document.cookie = name + "=" + "; expires="
                + new Date(2010, 11, 24, 10, 33, 30, 0).toUTCString() + ";path=/;";    
            //document.getElementById("login").innerHTML = '<font color=#7786fb>' +"登入"+ '</font>';
            //document.getElementById("register").style.display = "inline-block";
            //document.getElementById("logout").style.display = "none";
        }

        function CheckIsLogIn(tag) {
            var targetCookie = getCookie("LoginInfo");

            if (targetCookie != null) {
                 location.href = "../membership/shopping_car.aspx";
            } else {
                alert("請先登入會員");
                return false;
            }
        }

        function show_msg(tag) {
            var alltag = document.getElementsByClassName("Msg_dialog");
            for (var i = 0; i < alltag.length; i++) {
                alltag.item(i).style.display = 'none';
            }
            var id = tag.id;          
            var c = id.split('_');
            var div_tag;
            id = c[0];
            id = id + '_Msg';        
            div_tag = document.getElementById(id);
            div_tag.style.display = '';
        }

        function Addtoshoppningcar(tag) {

         var targetCookie = getCookie("LoginInfo");

            if (targetCookie != null) {
                show_msg(tag);
            } else {
                alert("請先登入會員");
                return false;
            }

         //var web_site_root = get_web_application_root_url();
         //var Query_url = web_site_root + "AjaxTest.aspx?name=" + input_name; //解決 IE 中文問題

         //var Query_url = "AjaxTest.aspx?name=" + input_name + "&TimeStamp=" + new Date().getTime(); //加了 1 個現在時間 tag,可以確保 url 每次都不同,避免瀏覽器快取,而不發出 request
         var Query_url = "AddtoShopcar.aspx?name=" + tag.id +","+ new Date();   //1:GET訪問瀏覽器認為是等冪的
         //就是一個相同的URL只有一個結果[相同是指整個URL字符串完全匹配]
         //所以第二次訪問的時候如果URL字符串沒變化瀏覽器是直接拿出了第一次訪問的結果
         //POST則認為是一個變動性訪問（瀏覽器認為POST的提交必定是有改變的）
         //防止GET的等冪訪問就在URL後面加上？+new Date(); ，[總之就是使每次訪問的URL字符串不一樣的]
         //由於在問號後面加上「new Date()」只是改變查詢的參數，並不會改變要查詢的位置(就是說問號前面的東西是一樣的)

         createXMLHttpRequest();

         xmlHttp.onreadystatechange = handleStateChange;
         xmlHttp.open("GET", Query_url, true);//true 表示"非同步"
         //xmlHttp.open("GET", Query_url, false);//true 表示不要  "非同步"
         //直接XMLHttpRequest的 open方法可以達到「不把整個網頁post back回去」

         xmlHttp.send(null);

         //return this.xmlHttp_For_update_cart.responseText; //不要" 非同步時,才可以這樣用 .

        }

        function close_msg(a) {
            var tag = a.parentNode.parentNode.parentNode
            //var tag2 = document.getElementsByClassName('Msg_dialog');
            tag.style.display = 'none';
            //tag2.style.display = 'none';
        }

        function createXMLHttpRequest() {
         if (window.ActiveXObject) {
             xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
             //		alert("Microsoft.XMLHTTP");
         }
         else if (window.ActiveXObject) {
             xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
             //		alert("Msxml2.XMLHTTP");
         }
         else if (window.XMLHttpRequest) {
             xmlHttp = new XMLHttpRequest();
             //		alert("window.XMLHttpRequest");
         }
         else {
             alert("createXMLHttpRequest fail!!");
         }
     }

        //因為是非同步,所以當 readyState 狀態有變的時候,此函式就會被呼叫,所以此函式會一直被呼叫直到 readyState == 4 或 reguest timeout 掉
        function handleStateChange() {
         // 	alert(xmlHttp.readyState);
         if (xmlHttp.readyState == 4) {

             //		alert(xmlHttp.status);
             //當若是向本機取得時 xmlHttp.status 會回應為 0 (aptana IE 預覽就是如此)
             //若是使用 aptana run 或 debug 時,Firefox 會建立一個 web server
             if (xmlHttp.status == 200 || xmlHttp.status == 0) {
                 //alert("The server response is: " + xmlHttp.responseText);
             }

         }
     }

        //取得網站程式根目錄 url, 例如  http://localhost:4431 (用開發用 webserver 上時) 或 http://www.beginmap.com/appcenter (在 iis 上時 )
        function get_web_application_root_url() {

         var url;
         var split_text;

         split_text = window.location.href.split("/");

         //用開發用 webserver 上時 例如 http://localhost:4431/index.aspx  或 http://localhost:4431/cart/cart.aspx
         //在 iis 上時 ,例如 http://localhost/appcenter/index.aspx   或 http://localhost/appcenter/cart/cart.aspx

         var index = split_text[2].indexOf(":");

         if (index != -1)
             url = split_text[0] + "//" + split_text[2];
         else
             url = split_text[0] + "//" + split_text[2] + "/" + split_text[3];

         return url;
     }

    </script>
</head>
<body onload="initial();"">
    <form  id="form1" runat="server">
         <div id="nav_bar" class="clearfix" style="background: #343030; margin: 0; height: 80px; position: relative; min-width: 1200px; width: 100%; top: 0px; left: 0px;">
            <div id="nav_container" class="clearfix" style="float: left; width: 70%; margin-bottom: 0px;height:70px;">
                <font style="color: #ffffff; margin-top: 20px; font-size: 2em; font-weight: bold; float: left;">生活用品店</font>
                <ul style=" margin-left: 30px; position: relative; margin-top: 30px; top: 0px; left: 100px;">
                    <li style="float: left; margin-left: 30px; list-style-type: none;"><a href="../item_page/beddingpage.aspx">商品市集</a></li>
                    <li style="float: left; margin-left: 30px; list-style-type: none;"><a href="javascript: CheckIsLogIn()">購物車</a></li>
                </ul>
            </div>
            <div id="login_section" style="display: inline-block;">
                <ul style="position: relative; left: 100px; margin-top: 30px;">
                    <li id="login" style="display: inline-block; list-style-type: none;"><a href="../membership/login.aspx" style="text-decoration:none;"><font color="#7786fb">登入</font></a></li>
                    <li id="register" style="display: inline-block; margin-left: 30px; list-style-type: none;"><a href="../membership/register.aspx" style="text-decoration:none;"><font color="#7786fb">註冊</font></a></li>
                    <li id="logout" style="display: none;  list-style-type: none; margin-left: 30px; text-decoration:none;"><a href="#" style="text-decoration:none;" onclick="LogOut(); "><font color="#7786fb">登出</font></a></li>
                </ul>               
            </div>
        </div>
        <div id="itemclass_bar" class="clearfix" style="background:#d8d3d3;height:40px;min-width:1200px;text-align:center;">
            <div style="display:inline-block;padding-top:10px;">
              <div style="display:inline-block;width:220px;text-align:center;"><a href="../item_page/beddingpage.aspx" style="text-decoration: none; font-weight: bold; color: #756e6e;">寢具</a></div>             
              <div style="display:inline-block;width:220px;text-align:center;"><a href="../item_page/FurniturePage.aspx" style="text-decoration: none; font-weight: bold; color: #756e6e;">傢俱收納</a></div>             
              <div style="display:inline-block;width:220px;text-align:center;"><a href="../item_page/tablewarepage.aspx" style="text-decoration: none; font-weight: bold; color: #756e6e;">鍋具餐廚</a></div>             
              <div style="display:inline-block;width:220px;text-align:center;"><a href="../item_page/dailynecessity.aspx" style="text-decoration: none; font-weight: bold; color: #756e6e;">生活用品</a></div>      
              <div style="display:inline-block;width:220px;text-align:center;"><a href="../item_page/travelitempage.aspx" style="text-decoration: none; font-weight: bold; color: #756e6e;">休閒樂活</a></div>             
            </div>
                                             
        </div>
        <div id="demolist" class="clearfix" style="margin-top: 20px; min-width: 1200px; min-height: 960px;">
           
        </div>
                <asp:HiddenField ID="return_msg" runat="server" />
    </form>
</body>
</html>
