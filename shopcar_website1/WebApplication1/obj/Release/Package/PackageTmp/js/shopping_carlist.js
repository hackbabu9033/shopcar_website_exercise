function Shopcar_Obj(member_Name, item_number, item_Url, item_Name, item_price, item_count) {   
    this.member_Name = member_Name;
    this.item_number = item_number;
    this.item_Url = item_Url;
    this.item_Name = item_Name;
    this.item_price = item_price;
    this.item_count = item_count;

    this.createAn_item = function (price_sum) {

        var div, div_header, div_pur_pdt;
        div = document.createElement("div");
        div_header = this.create_header();
        div_pur_pdt = this.create_purchase_pdt(price_sum);

        div.className = "An_item";
        div.id = this.item_number;
        div.appendChild(div_header);
        div.appendChild(div_pur_pdt);
        return div;
    };

    this.create_header = function () {
        var div, div_child;
        div = document.createElement("div");
        div_child = document.createElement("div");
        div.className = "header";
        div.style = "border-bottom:1px solid #d8d3d3;";
        div_child.className = "header";
        div_child.innerHTML = "商品資訊：";
        div.appendChild(div_child);

        return div;
    };

    this.create_purchase_pdt = function (price_sum) {
        var div, div_item_img, div_item_info
            , div_item_num, div_shopcarinfo;
        div = document.createElement("div");
        div_item_img = this.create_item_img();
        div_item_info = this.create_item_info();
        div_item_num = this.create_item_num();
        div_shopcarinfo = this.create_shopcar_info(price_sum);

        div.style = "padding:5px;";
        div.appendChild(div_item_img);
        div.appendChild(div_item_info);
        div.appendChild(div_item_num);
        div.appendChild(div_shopcarinfo);

        return div;
    };

    this.create_item_img = function () {
        var div, img, span;
        div = document.createElement("div");
        img = document.createElement("img");
        span = document.createElement("span");

        div.className = "item_img clearfix";
        img.src = this.item_Url;
        img.alt = "圖片顯示錯誤";
        img.width = "150";
        img.height = "112.5";
        span.appendChild(img);
        div.appendChild(span);

        return div;
    };

    this.create_item_info = function () {
        var div, div_productname, div_price, br, price;
        div = document.createElement("div");
        div_productname = document.createElement("div");
        br = document.createElement("br");
        div_price = document.createElement("div");
        price = document.createElement("p");

        div.className = "item_info clearfix";
        div_productname.className = "fontitem_name";
        div_productname.innerHTML = this.item_Name;
        div_price.className = "item_price";
        price.className = "inline";
        price.style = "color:#ff0000;";
        price.innerHTML = this.item_price;
        div_price.innerHTML = "售價：";
        div_price.appendChild(price);
        div.appendChild(div_productname);
        div.appendChild(br);
        div.appendChild(div_price);

        return div;
    };

    this.create_item_num = function () {
        var div, num_chk, div_tot, div_remove, br, p_price;
        div = document.createElement("div");
        num_chk = this.create_item_num_chk();
        div_tot = this.create_div_tot();
        div_remove = this.create_div_remove();

        div.className = "item_num clearfix";
        div.appendChild(num_chk);
        div.appendChild(div_tot);
        div.appendChild(div_remove);

        return div;
    };

    this.create_item_num_chk = function () {
        var div, div_decr, div_incr, div_num, decre_href, incre_href;
        div = document.createElement("div");
        var decre_id = this.item_number + "_decreClick"
        var incre_id = this.item_number + "_increClick";
        var count_id = this.item_number + "_count";
        //div_num = document.createElement("div");
        //div_decr = document.createElement("div");
        //div_incr = document.createElement("div");
        //div_num.style = "display:inline;";
        //div_decr.style = "display:inline;";
        //div_incr.style = "display:inline;";
        //decre_href = document.createElement("a");
        //incre_href = document.createElement("a");

        div.className = "item_num_check";
        //decre_href.href = "javascript:void(0);";
        //decre_href.className = "a_change_item_count";
        //decre_href.innerHTML = "-";
        //decre_href.onclick = "decre_count(this)";
        //decre_href.id = this.item_number + "_decreClick";
        //div_decr.appendChild(decre_href);
        //incre_href.href = "javascript:void(0);";
        //incre_href.className = "a_change_item_count";
        //incre_href.innerHTML = "+";
        //incre_href.onclick = "incre_count(this)";
        //incre_href.id = this.item_number + "_increClick";
        //div_incr.appendChild(incre_href);
        //div_num.innerHTML = this.item_count;
        //div_num.id = this.item_number + "_count";
        //div.appendChild(div_incr);
        //div.appendChild(div_num);
        //div.appendChild(div_decr);

        div.innerHTML = "<div style='display: inline; '><a href='javascript: void (0);' id='" + decre_id + "' onclick='decre_count(this)' class='a_change_item_count'>-</a></div>"
            + "<div id='" + count_id + "' style='display: inline;'>" + this.item_count + "</div>" +
            "<div style='display: inline;'><a href='javascript: void (0);' id='" + incre_id+"' onclick='incre_count(this)' class='a_change_item_count'>+</a></div>"

        return div;
    };

    this.create_div_tot = function () {
        var div, pdt_price, pdt_num, sum_price;

        pdt_price = this.item_price;
        pdt_num = this.item_count;
        sum_price = pdt_price * pdt_num;
        div = document.createElement("div");

        div.style = "";
        div.innerHTML = "&nbsp&nbsp&nbsp&nbsp&nbsp" +
            "總計：<font class='inline org' id='" + this.item_number + "_pdtsubtot'>"
            + sum_price + "</font>元";

        return div;
    };

    this.create_div_remove = function () {
        var div, a, br;
        div = document.createElement("div");
        
        div.innerHTML = "<br />"
            + "<p><a id='" + this.item_number+"' onclick='remove_item(this)' class='p_remove' href='javascript:void(0);'>移除</a></p >";
        return div;
    };

    this.create_shopcar_info = function (price_sum) {
        var div, div_subtotal, div_tot_price_count, subtotal
            , pdt_price, pdt_count, br
            , btn_paybill, btn_goshop;

        //cliam: get tot_sum_price from all obj
        pdt_price = this.item_price;
        pdt_count = this.item_count;

        subtotal = pdt_price * pdt_count;
        div = document.createElement("div");
        div_subtotal = document.createElement("div");
        div_tot_price_count = document.createElement("div");
        br = document.createElement("br");
        btn_paybill = document.createElement("div");
        btn_goshop = document.createElement("div");

        div_subtotal.className = "clearfix";
        div_subtotal.innerHTML = "小計：" + "<font class='org' id='" + this.item_number + "_subtot'>"
            + subtotal + "</font>";
        div_tot_price_count.className = "clearfix";
        div_tot_price_count.innerHTML = "訂單總計：" + "<font class='org' name='tot_count'>"
            + price_sum + "</font>";

        btn_paybill.className = "clearfix";
        btn_paybill.innerHTML = "<input type='button' value='前往結帳'"
            + "class='fontbold btn_model_1' />";
        btn_goshop.innerHTML = "<input type='button' value='繼續購物'"
            + "class='fontbold btn_model_2' />";

        div.className = "shopcar_info clearfix";
        div.appendChild(div_subtotal);
        div.innerHTML += " <br />";
        div.appendChild(div_tot_price_count);
        div.innerHTML += " <br />";
        div.appendChild(btn_paybill);
        div.innerHTML += " <br />";
        div.appendChild(btn_goshop);

        return div;
    };
}

function Shopcar_Objs(Allshopcarobjs) {
    this.ShopcarObjs = Allshopcarobjs;
    this.price_sum;

    this.get_tot_price_sum = function () {
        var price_sum = 0, pdt_count = 0, pdt_price = 0, sub_tot = 0;

        for (var i = 0; i < this.ShopcarObjs.length; i++) {
            pdt_count = this.ShopcarObjs[i].item_count;
            pdt_price = this.ShopcarObjs[i].item_price;
            sub_tot = pdt_count * pdt_price;
            price_sum += sub_tot;
        }
        this.price_sum = price_sum;
        //alert(this.price_sum);
        //return price_sum;
    };

    this.create_div_items = function () {
        var div_list, div_An_item;

        div_list = document.createElement("div");
        div_list.id = "shopping_list";
        div_list.style = "margin:30px 0px;";
        div_An_item = document.createElement("div");

        for (var i = 0; i < this.ShopcarObjs.length; i++) {
            div_An_item = this.ShopcarObjs[i].createAn_item(this.price_sum);
            div_list.appendChild(div_An_item);
        }
        return div_list;
    };

    this.get_items_Count = function () {
        var tot_count = this.ShopcarObjs.length;
        var items_count = new Array(tot_count);
        for (var i = 0; i < tot_count; i++) 
            items_count[i] = this.ShopcarObjs[i].item_count;
        return items_count;
    };

    this.get_items_number = function () {
        var tot_count = this.ShopcarObjs.length;
        var items_number = new Array(tot_count);
        for (var i = 0; i < tot_count; i++)
            items_number[i] = this.ShopcarObjs[i].item_number;
        
        return items_number;
    };

}


function Shopcar_Service() {
    this.Get_An_Shopcar = Get_An_Shopcar;
    function Get_An_Shopcar(An_Shopcar_String) {
        var ShopcarObjs = new Array();
        var Text_After_Splite = An_Shopcar_String.split("$");
        return ShopcarObjs;
    }
};
