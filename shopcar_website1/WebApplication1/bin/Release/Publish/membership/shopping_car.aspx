<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="shopping_car.aspx.cs" Inherits="WebApplication1.membership.shopping_car" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="../css/style.css" />
    <link  href="img/bitbug_favicon2.ico" />
    <script type="text/javascript" src="../js/shopping_carlist.js"></script>
    <script type="text/javascript">
        var xmlHttp,Objs,obj_Shopcar_Objs;
        
        function get_numbersAndcounts(items_number,items_count) {
            obj_Shopcar_Objs.get_items_NameAndCount(items_number,items_count);
        }

        window.onbeforeunload = function () {
            var websiteRootUrl = get_web_application_root_url();
            var Userid = getCookie("LoginInfo");                        
            var tot_count = Objs.length;
            this.console.log(tot_count);
            var items_number = obj_Shopcar_Objs.get_items_number();
            var items_count = obj_Shopcar_Objs.get_items_Count();
            for (var i = 0; i < tot_count; i++) 
                console.log('number:'+items_number[i]+',count:'+items_count[i]);

            var Query_url = websiteRootUrl + "/membership/membership_ajax/Updatepdt_count.aspx?name=";  

            for (var i = 0; i < tot_count; i++) 
                Query_url += items_number[i] + ',' + items_count[i] + '$';

            Query_url += new Date();
            
            createXMLHttpRequest();
            xmlHttp.onreadystatechange = handleStateChange;
            //xmlHttp.open("GET", Query_url, true);//true 表示"非同步"
            xmlHttp.open("GET", Query_url, false);
            //直接XMLHttpRequest的 open方法可以達到「不把整個網頁post back回去」
            xmlHttp.send(null);
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

        function handleStateChange() {
         // 	alert(xmlHttp.readyState);
         if (xmlHttp.readyState == 4) {

             //		alert(xmlHttp.status);
             //當若是向本機取得時 xmlHttp.status 會回應為 0 (aptana IE 預覽就是如此)
             //若是使用 aptana run 或 debug 時,Firefox 會建立一個 web server
             if (xmlHttp.status == 200 || xmlHttp.status == 0) {
                 var QueryResult = document.getElementById("Query_result");
                 QueryResult.value = xmlHttp.responseText;
             }

         }
        }

        function get_web_application_root_url() {

         var url;
         var split_text;

         split_text = window.location.href.split("/");

         //開發用 webserver 上時 例如 http://localhost:4431/index.aspx  或 http://localhost:4431/cart/cart.aspx
         //在 iis 上時 ,例如 http://localhost/appcenter/index.aspx   或 http://localhost/appcenter/cart/cart.aspx

         var index = split_text[2].indexOf(":");

         if (index != -1)
             url = split_text[0] + "//" + split_text[2];
         else
             url = split_text[0] + "//" + split_text[2] + "/" + split_text[3];

         return url;
        }

        function initial() {                        
            var div_shoppinglist,div_Anitem,form1,queryresult;
            form1 = document.getElementById("form1");           
            var UserID = getCookie("LoginInfo");
            var websiteRootUrl = get_web_application_root_url();
            var Query_url = websiteRootUrl+"/membership/membership_ajax/GetuserShopcar.aspx?name=" + UserID + "," + new Date();   //1:GET訪問瀏覽器認為是等冪的
            createXMLHttpRequest();
            xmlHttp.onreadystatechange = handleStateChange;
            //xmlHttp.open("GET", Query_url, true);//true 表示"非同步"
            xmlHttp.open("GET", Query_url, false);
            //直接XMLHttpRequest的 open方法可以達到「不把整個網頁post back回去」
            xmlHttp.send(null);

            queryresult = document.getElementById("Query_result").value;
            Objs = GetShopcarObjs(queryresult);
            obj_Shopcar_Objs = new Shopcar_Objs(Objs);

            obj_Shopcar_Objs.get_tot_price_sum();
            div_purchaselist = obj_Shopcar_Objs.create_div_items();
            form1.appendChild(div_purchaselist);
        }

        function GetShopcarObjs(queryresult) {
            var return_Qurystr = queryresult;

            var ShopcarObjs = new Array();
            var member_Name, item_number, item_Url,item_Name,item_price,item_count,cur_shopcarObj;
            var Qurystr_split1 = return_Qurystr.split('$');
            for (var i = 0; i < Qurystr_split1.length - 1; i++) {
                var Qurystr_split2 = Qurystr_split1[i].split('@');                
                member_Name = Qurystr_split2[0];
                item_number = Qurystr_split2[1];
                item_Url = Qurystr_split2[2];
                item_Name = Qurystr_split2[3];
                item_price = Qurystr_split2[4];
                item_count = Qurystr_split2[5];                
                cur_shopcarObj = new Shopcar_Obj(member_Name, item_number, item_Url,item_Name,item_price,item_count);
                ShopcarObjs.push(cur_shopcarObj);
            }
            return ShopcarObjs;
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
        
        function createShoplist(ShopcarObjs,tot_money) {
            var item_name,item_price,item_count,img_url;
            for (var i = 0; i < ShopcarObjs.length; i++) {
                item_name = ShopcarObjs[i].item_Name;
                item_count = ShopcarObjs[i].item_count; 
                img_url = ShopcarObjs[i].item_Url;
                item_price = ShopcarObjs[i].item_price;
            }
        }       

        function remove_item(remove_tag) {
            var items_number = obj_Shopcar_Objs.get_items_number();
            var temp,price,count,del_item_subtot,pdt_number;
            var websiteRootUrl = get_web_application_root_url();
            var r = confirm("確認要將此商品從購物車刪除?");
            var item_num = remove_tag.id;
           
            var index = items_number.indexOf(item_num);
            var item_div = document.getElementById(item_num);
            
            //var item_id = item.id;
            var div_shoplist = document.getElementById('shopping_list');
            //item.style.display = "none";
            if (r != true) 
                return false;       
            
            var Query_url = websiteRootUrl+"/membership/membership_ajax/remove_item.aspx?name=" + item_num + "," + new Date();   //1:GET訪問瀏覽器認為是等冪的
            //alert(Query_url);

            createXMLHttpRequest();
            xmlHttp.onreadystatechange = handleStateChange;
            xmlHttp.open("GET", Query_url, true);
            xmlHttp.send(null);

            //更新總金額
            temp = parseInt(obj_Shopcar_Objs.price_sum);
            price = parseInt(obj_Shopcar_Objs.ShopcarObjs[index].item_price);
            count = parseInt(obj_Shopcar_Objs.ShopcarObjs[index].item_count);
            temp = temp - price * count;
            
            obj_Shopcar_Objs.price_sum = temp;

            //將此商品從購物車中除去
            div_shoplist.removeChild(item_div);

            //更新訂單總計
            pdt_number = document.getElementsByName('tot_count').length;
            for (var i = 0; i < pdt_number; i++) {
                document.getElementsByName('tot_count')[i].innerHTML = temp;
            }
        }      

        function decre_count(clicktag) {
            var items_number = obj_Shopcar_Objs.get_items_number();
            var item_number = clicktag.id.split('_')[0];
            var index = items_number.indexOf(item_number);
            var items_count = obj_Shopcar_Objs.get_items_Count();
            var temp,pdt_count,pdt_number,price;

            var count = document.getElementById(item_number + '_count').innerHTML;
            temp = parseInt(count);
            if (temp > 1) {
                temp = temp - 1;
                pdt_count = temp;
                document.getElementById(item_number + '_count').innerHTML = pdt_count;
                obj_Shopcar_Objs.ShopcarObjs[index].item_count = pdt_count;

                //取得總金額
                temp = parseInt(obj_Shopcar_Objs.price_sum);
                temp = temp - parseInt(obj_Shopcar_Objs.ShopcarObjs[index].item_price);
                obj_Shopcar_Objs.price_sum = temp;

                //update"小計"
                temp = parseInt(document.getElementById(item_number + '_subtot').innerHTML);
                price = parseInt(obj_Shopcar_Objs.ShopcarObjs[index].item_price);
                temp = temp - price;
                document.getElementById(item_number + '_subtot').innerHTML = temp;
                temp = parseInt(obj_Shopcar_Objs.price_sum);

                //update"總計"
                document.getElementById(item_number + '_pdtsubtot').innerHTML = price * pdt_count;

                //update"訂單總計"
                pdt_number = document.getElementsByName('tot_count').length;
                for (var i = 0; i < pdt_number; i++) {
                    document.getElementsByName('tot_count')[i].innerHTML = temp;
                }
            }                        
           
        }

        function incre_count(clicktag) {
            var items_number = obj_Shopcar_Objs.get_items_number();
            var item_number = clicktag.id.split('_')[0];
            var index = items_number.indexOf(item_number);
            var items_count = obj_Shopcar_Objs.get_items_Count();
            var temp,pdt_count,pdt_number,price;

            if (temp > 20) {
                alert('每筆訂單數量最大數量為20');
                return false;
            }
            //將該商品的購買數量加1
            var count = document.getElementById(item_number + '_count').innerHTML;
            temp = parseInt(count);
            temp = temp + 1;
            pdt_count = temp;
            document.getElementById(item_number + '_count').innerHTML = pdt_count;
            obj_Shopcar_Objs.ShopcarObjs[index].item_count = pdt_count;

            //取得總金額
            temp = parseInt(obj_Shopcar_Objs.price_sum);
            temp += parseInt(obj_Shopcar_Objs.ShopcarObjs[index].item_price);
            obj_Shopcar_Objs.price_sum = temp;

            //update"小計"
            temp = parseInt(document.getElementById(item_number + '_subtot').innerHTML);
            price = parseInt(obj_Shopcar_Objs.ShopcarObjs[index].item_price);
            temp = temp + price;
            document.getElementById(item_number + '_subtot').innerHTML = temp;
            temp = parseInt(obj_Shopcar_Objs.price_sum);

            //update"總計"
            document.getElementById(item_number + '_pdtsubtot').innerHTML = price * pdt_count;

            //update"訂單總計"
            pdt_number = document.getElementsByName('tot_count').length;
            for (var i = 0; i < pdt_number; i++) {
                document.getElementsByName('tot_count')[i].innerHTML = temp;
            }
        }

        


        //因為是非同步,所以當 readyState 狀態有變的時候,此函式就會被呼叫,所以此函式會一直被呼叫直到 readyState == 4 或 reguest timeout 掉

        //取得網站程式根目錄 url, 例如  http://localhost:4431 (用開發用 webserver 上時) 或 http://www.beginmap.com/appcenter (在 iis 上時 )
    </script>
</head>
<body onload="initial();"  style="background:#d8d3d3;">
    <form id="form1" runat="server">
        <div id="nav_bar" style="background: #343030; margin: 0; height: 70px; position: relative; min-width: 1200px; width: 100%;">
            <div id="nav_container" style="float: left; width: 70%; margin-bottom: 0px;">
                <h1 style="color: #ffffff; margin-top: 20px; font-size: 2em; font-weight: bold; float: left;">生活用品店</h1>
                <ul style="float: left; margin-left: 30px; position: relative; margin-top: 30px;">
                    <li style="float: left; margin-left: 30px; list-style-type: none;"><a href="#">會員資料</a></li>
                    <li style="float: left; margin-left: 30px; list-style-type: none;"><a href="http://localhost:52068/item_page/beddingpage.aspx">商品市集</a></li>
                    <li style="float: left; margin-left: 30px; list-style-type: none;"><a href="#">網站管理</a></li>
                    <li style="float: left; margin-left: 30px; list-style-type: none;"><a href="http://localhost:52068/membership/shopping_car.aspx">購物車</a></li>
                </ul>
            </div>
            <div id="login_section" style="display: inline-block;">
                <ul style="position: relative; left: 100px; margin-top: 30px;">
                    <li id="login" style="display: inline-block; list-style-type: none;"><a href="http://localhost:52068/membership/login.aspx" style="text-decoration:none;"><font color="#7786fb">登入</font></a></li>
                    <li id="register" style="display: inline-block; margin-left: 30px; list-style-type: none;"><a href="http://localhost:52068/membership/register.aspx" style="text-decoration:none;"><font color="#7786fb">註冊</font></a></li>
                    <li id="logout" style="display: none;  list-style-type: none; margin-left: 30px; text-decoration:none;"><a href="#" style="text-decoration:none;" onclick="LogOut(); "><font color="#7786fb">登出</font></a></li>
                </ul>

            </div>
        </div>                                            
       
        <asp:HiddenField ID="Query_result" runat="server" Value="-1" />
    </form>
</body> 
</html>
