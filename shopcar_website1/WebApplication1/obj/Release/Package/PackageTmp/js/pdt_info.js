function item_info(item_name, item_price, item_number, item_imgUrl) {
    this.item_name = item_name;
    this.item_price = item_price;
    this.item_number = item_number;
    this.item_imgUrl = item_imgUrl;
    

    this.create_div_pdt = function () {
        var div, div_iteminfo,div_img;
        div = document.createElement("div");
        div_img = this.create_div_img();
        div_iteminfo = this.create_div_iteminfo();
        div.className = "pdt";

        div.appendChild(div_img);
        div.appendChild(div_iteminfo);
        return div;
    }

    this.create_div_img = function () {
        var div, img;
        div = document.createElement("div");
        img = document.createElement("img");

        div.style = "width:360px;text-align:center;margin-top: 30px;";
        img.src = item_imgUrl;
        img.alt = "圖片顯示錯誤";
        img.width = "300";
        img.height = "250";
        div.appendChild(img);
       
        return div;
    }

    this.create_div_iteminfo = function () {
        var div_pdtinfo,div_addMsg;

        div_pdtinfo = document.createElement("div");
        div_pdtinfo.style = "width: 300px;height:100%; margin-left: 30px;margin-top: 10px; border-top: 1px solid #d8d3d3;position:relative; ";
        div_pdtinfo.innerHTML = "<h3 class='item_pdtname'>" + this.item_name + "</h3><h4>NT <font class='item_pdtprice'>$" + this.item_price+"</font></h4>"
            + "<input type='button' id='" + this.item_number+'_test'+"' value='加入購物車' style='position:absolute;left:61%; bottom:19%; height: 24px; width: 91px;' onclick='Addtoshoppningcar(this);' /> ";
        div_addMsg = this.create_div_infoWindow();

        div_pdtinfo.appendChild(div_addMsg);
        return div_pdtinfo;

    }

    this.create_div_infoWindow = function () {
        var div, div_triangle,div_Msg;
        div = document.createElement("div");
        div_triangle = document.createElement("div");
        div_Msg = this.create_div_Msg();

        div.id = this.item_number + "_Msg";
        div.className = "Msg_dialog";
        div.style = "display:none;";
        div_triangle.style = "width: 0;height: 0;border-style: solid;border-width: 0 5px 10px 5px;border-color: transparent transparent #808080"+
            " transparent;position:absolute;left:50%;top:-15%;";

        div.appendChild(div_triangle);
        div.appendChild(div_Msg);
        return div;    
    }

    this.create_div_Msg = function () {
        var div, div_close, div_infoMsg, div_shopcar_href
            ,font_Msg,a_hrefShopcar;

        div = document.createElement("div");
        div_close = document.createElement("div");
        div_close.innerHTML = "<a href='javascript: void (0);' onclick='close_msg(this)' style='position:relative;left:95%;'>"
            + "<img src='../img/cancel.jpg' alt='圖片顯示錯誤' width='10px' height='10px' /></a>";
        div_infoMsg = document.createElement("div");
        div_shopcar_href = document.createElement("div");
        font_Msg = document.createElement("font");
        font_href = document.createElement("font");
        a_hrefShopcar = document.createElement("a");

        div_infoMsg.style = "margin-top:5px;";
        font_Msg.style = "font-size:15px;";
        font_Msg.innerHTML = "已經加入至您的購物車";
        div_shopcar_href.style = "margin-top:5px;";
        a_hrefShopcar.style = "text-decoration:none;position:relative;margin:3px 0px;font-size:15px";
        a_hrefShopcar.href = "http://localhost:52068/membership/shopping_car.aspx";
        a_hrefShopcar.innerHTML = "前往購物車";

        div_infoMsg.appendChild(font_Msg);
        div_shopcar_href.appendChild(a_hrefShopcar);
        div.appendChild(div_close);
        div.appendChild(div_infoMsg);
        div.appendChild(div_shopcar_href);

        return div;
    }
}

function item_objs(All_item_obj) {
    this.itemObjs = All_item_obj;

    this.create_div_items = function () {
        var div = document.createElement("div");
        var div_pdtrow, div_Anpdt;

        div.style = "display: inline-block;margin-left:20%;";
        div_pdtrow = document.createElement("div");
        div_pdtrow.className = "pdt_row";
        //alert(this.itemObjs.length);
        for (var i = 0; i < this.itemObjs.length; i++) {
            div_Anpdt = this.itemObjs[i].create_div_pdt();            
            div_pdtrow.appendChild(div_Anpdt);
            if (i % 2 != 0) {
                div.appendChild(div_pdtrow);
                div_pdtrow = document.createElement("div");
                div_pdtrow.className = "pdt_row";
            }
            if (i % 2 == 0 && i == this.itemObjs.length-1)
                div.appendChild(div_pdtrow);
        }

        return div;
    };
}


function Keyword_Service() {
    this.Get_An_Keyword = Get_An_Keyword;
    function Get_An_Keyword(An_Keyword_String) {
        var KeywordObjs = new Array();
        var Text_After_Splite = An_Keyword_String.split("$");
        for (var i = 0; i < Text_After_Splite.length; i++) {
            if (Text_After_Splite[i] !== "") {
                var Text_After_Splite2 = Text_After_Splite[i].split("@");
                var Name = Text_After_Splite2[0];
                var FullName = Text_After_Splite2[1];
                var X = Text_After_Splite2[2];
                var Y = Text_After_Splite2[3];
                var Orignal_TableName = Text_After_Splite2[4];
                var Index_In_Orignal_Table = Text_After_Splite2[5];
                var Index = Text_After_Splite2[6];
                var Current_KeywordObj = new KeywordObj(Name, FullName, X, Y, Orignal_TableName, Index_In_Orignal_Table, Index);
                KeywordObjs.push(Current_KeywordObj);
            }
        }
        return KeywordObjs;
    }
}