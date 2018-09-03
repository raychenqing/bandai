$(function(){        
    cartload();
});

function cartload(){        
    //生成表头
    var $headtr = $("<tr><th class='select'><input id='sel_all' \
        type='checkbox' value='false'>\
        <p id='sel_all_word'>全选</p></th>\
        <th>商品</th>\
        <th>单价</th>\
        <th>购买数量</th>\
        <th>价格</th>\
        <th>操作</th></tr>");
    $("#head").append($headtr)
    //定义全选按钮的点击事件
    $("#sel_all").click(function(){
        if (this.value == "false"){
            //设置值为true
            $(this).val("true");
            //将所有产品的checkbox打勾
            var arr = document.getElementsByClassName("inp_sel")
            for ( var i = 0; i <arr.length; i++){
                arr[i].checked = true;
                arr[i].setAttribute("value","true");
            }
            //获取所有产品的总价，更新合计处的价格
            var arr = document.getElementsByClassName("gtotal")
            var n = 0.00
            for ( var i = 0; i <arr.length; i++){
                n += arr[i].innerHTML*1.00;
            }
            $("#totalprice").html(n.toFixed(2))
            //获取所有产品的总数，更新合计处的数量
            var arr = document.getElementsByClassName("gCount")
            var n = 0;
            for ( var i = 0; i <arr.length; i++){
                n += arr[i].innerHTML*1;
            }
            $("#totalcount").html(n)
        }else{
            $(this).val("false");
            var arr = document.getElementsByClassName("inp_sel")
            for ( var i = 0; i <arr.length; i++){
                arr[i].checked = false
                arr[i].setAttribute("value","false")
            }
            $("#totalprice").html("0.00")
            $("#totalcount").html(0)
        }
    })
    //生成表格尾部的合计数量，总价，以及结算按钮
    var html = ''
    html += "<span>已选商品 </span>"
    html += "<span id='totalcount'>0</span>"
    html += "<span> 件</span>"
    html += "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"
    html += "<span>合计(不含运费): &yen; </span>"
    html += "<span id='totalprice'>0.00</span>"
    html += "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"
    html += "<input type='button' id='balance' value='结算'>"
    $("#buttom").html(html)
    
    $("#balance")[0].onclick = function(){
        var arr = document.getElementsByClassName("inp_sel")
        var msg = ''
        for ( var i = 0; i <arr.length; i++){
            if (arr[i].getAttribute("value") == "true"){
                msg += arr[i].getAttribute("name");
                msg += ' ';
            }
        }
        if (msg==''){
            alert("未选择商品进行结算");
        }else if($('#totalprice').html() == 0){
            alert("商品信息错误,请勿对缺货商品下单");
        }else{ 
            window.location.assign("/balance?msg="+msg);
        }
    }

    $.get('/loadcart/', function(data){
        if (data != false){
            $.each(data,function(i,obj){
                good = JSON.parse(obj.good)
                var gpicture = good[0].fields['picture'];
                var gname = good[0].fields['title'];
                var gprice = good[0].fields['price'];
                var gcount = obj.gcount;
                var aoi = good[0].fields['aoi'];
                var gid = good[0].pk;        
                //创建4个td
                var $tdselect = $("<td class='select'></td>");
                if (aoi == 0){
                    var $inp_checkbox = $('');
                }else{
                    var $inp_checkbox = $("<input type='checkbox' class='inp_sel'\
                                             value='false' name='"+gid+"'>")
                    $inp_checkbox[0].onclick = function(){
                        //点击产品checkbox
                        if (this.value == "false"){
                            //如果value为false，会将自身value设为true
                            //同时判断页面上所有产品checkbox是否全部处于选中状态，
                            //若全部选中，则将全选按钮设置为全选状态
                            $(this).val("true");
                            var arr = document.getElementsByClassName("inp_sel")
                            var j = 0;
                            for ( var i = 0; i <arr.length; i++){
                                if (arr[i].getAttribute("value") == "true"){
                                j++;}
                            }
                            if (j == arr.length){
                                document.getElementById("sel_all").checked = true
                                $("#sel_all").val("true")
                                $("#sel_all_word").html("反选");
                            }
                            //取得此checkbox对应的总价，加入合计总价 
                            $("#totalprice").html((
                                Number($(this).parent().next().next().next().next().html())
                                +Number($("#totalprice").html())).toFixed(2))
                            //取得此checkbox对应的数量，加入合计总数
                            $("#totalcount").html(
                                Number($(this).parent().next().next().next().html())
                                +Number($("#totalcount").html()))
                        }else{
                            //如果value为true，会将自身value设为false
                            //同时将全选按钮设置为非全选状态
                            $(this).val("false");
                            document.getElementById("sel_all").checked = false
                            $("#sel_all").val("false")
                            $("#sel_all_word").html("全选");
                            //取得此checkbox对应的总价，从合计总价中减去 
                            $("#totalprice").html((Number($("#totalprice").html())
                                -Number($(this).parent().next().next().next().next().html())).toFixed(2))
                            //取得此checkbox对应的数量，从合计总数中减去
                            $("#totalcount").html(Number($("#totalcount").html())
                                -Number($(this).parent().next().next().next().html()))                
                        }
                    }
                }
                var $tdName = $("<td class='gName'><img src='/"+gpicture+"'><span>"+gname+"</span></td>");
                var $tdPrice = $("<td class='gPrice'>"+gprice+"</td>");
                //判断若无库存，数量显示商品已售完
                if (aoi == 0){
                    var $tdtotal = $("<td class='gtotal'></td>");
                    var $tdCount = $("<td class='gCount'>商品已售完</td>"); 
                    var $btnUpdate = $(""); 
                }else{                               
                    var $tdtotal = $("<td class='gtotal'>"+(gprice*gcount).toFixed(2)+"</td>");
                    var $tdCount = $("<td class='gCount'>"+gcount+"</td>");            
                    var $btnUpdate = $("<button>修改</button>");
                    $btnUpdate[0].onclick = function(){
                        //this 表示的是除法当前事件的DOM对象
                        //判断是修改按钮还是确定按钮
                        if (this.innerHTML == "修改"){
                            //执行修改操作
                            $(this).html("确定");
                            var $tdCount=$(this).parent().prev().prev();                   
                            var count = $tdCount.html();
                            $tdCount.empty()
                            var html = ''
                            html += "<input type='text' " 
                            html += 'onkeyup="if(this.value.length==1){this.value=this.value.replace'
                            html += "(/[^1-9]/g,'')}else{this.value=this.value.replace(/[^0-9]/g,'')}"
                            html += '" onpaste="if(this.value.length==1){this.value=this.value.replace'
                            html += "(/[^1-9]/g,'')}else{this.value=this.value.replace(/[^0-9]/g,'')}"
                            html += '" onblur="if(this.value.length==0){this.value=1}else if(this.value>'+aoi+'){this.value='+aoi+'}">'
                            var $gnew_count = $(html);
                            $gnew_count.val(count);
                            var $gadd = $("<button>"+"+"+"</button>");
                            var $gsub = $("<button>"+"-"+"</button>");
                            $tdCount.append($gsub)
                            $tdCount.append($gnew_count)
                            $tdCount.append($gadd)
                            //减按钮函数
                            $gsub.click(function(){
                                var count = $gnew_count.val();
                                if (count>1){
                                    $gnew_count.val(--count);
                                }else{
                                    $gnew_count.val(count);
                                }
                            });
                            //加按钮函数
                            $gadd.click(function(){
                                var count = $gnew_count.val();
                                if (count < aoi){
                                    $gnew_count.val(++count);
                                }
                            });                 
                        }else{
                            $(this).html("修改");
                            var $new_input =$($(this).parent().prev().prev().children()[1]);
                            var $tdCount=$(this).parent().prev().prev();
                            var count = $new_input.val()
                            //异步修改数据库
                            $.get('/update_cart/','good_id='+gid+'&new_count='+count,function(data){
                                if(data.status == 1){
                                    //修改成功
                                    alert(data.statusText)
                                    //执行确定操作
                                    $tdCount.empty()
                                    $tdCount.text(count)
                                    $tdtotal.empty()
                                    $tdtotal.text((count*gprice).toFixed(2))
                                    //判断此产品是否被选中,若被选中，则更新总价和总数，否则不做更改
                                    if ($($tdCount.prev().prev().prev().children()[0]).val()=='true'){
                                        //更新总数量                    
                                        //获取所有产品的总数，更新合计处的数量
                                        var arr = document.getElementsByClassName("gCount")
                                        var n = 0;
                                        for ( var i = 0; i <arr.length; i++){
                                            //如果钩被选中，则叠加
                                            if(arr[i].parentNode.firstChild.firstChild.value=='true'){
                                                n += arr[i].innerHTML*1;
                                            }                        
                                        }
                                        $("#totalcount").html(n)
                                        //更新总价格的变量
                                        var arr = document.getElementsByClassName("gtotal")
                                        var n = 0.00
                                        for ( var i = 0; i <arr.length; i++){
                                            //如果钩被选中，则叠加
                                            if(arr[i].parentNode.firstChild.firstChild.value=='true'){
                                            n += arr[i].innerHTML*1.00;
                                            }
                                        }
                                        $("#totalprice").html(n.toFixed(2))
                                    }
                                }else{
                                    //修改失败
                                    alert(data.statusText+'已为您将数量修改为目前最大库存')
                                    $.get('/check_aoi/','good_id='+gid,function(data){
                                        var aoi = data.aoi
                                        $tdCount.empty()
                                        if (aoi == 0){
                                            $tdCount.text('商品已售完')
                                            $tdCount.next().next().children()[0].remove()
                                            $tdCount.prev().prev().prev().children()[0].remove()
                                        }else{
                                            $tdCount.text(aoi)
                                        }
                                    },'json');
                                }
                            },'json');
                        }   
                    }
                }
                var $btnDelete = $("<button>删除</button>")        
                $btnDelete[0].onclick = function(){
                    if(confirm("确认删除吗?")){
                        //异步删除数据库
                        $.get('/delete_cart/','good_id='+gid,function(data){
                            if(data.status == 1){
                                alert('修改成功')
                            }else{
                                alert('修改失败')
                            }
                        },'json');        
                        //判断此产品是否被选中
                        if ($($(this).parent().prev().prev().prev().prev().prev().children()[0]).val()=='true'){
                        //若选中，则从总价格和总件数中减去此条被删除的数据，否则不做修改
                        var totalprice = $("#totalprice").html()   
                        $("#totalprice").html((totalprice-$(this).parent().prev().html()).toFixed(2))
                        var totalcount = $("#totalcount").html()
                        $("#totalcount").html(totalcount-$(this).parent().prev().prev().html())
                        }                        
                        //使用this删除此条
                        $(this.parentNode.parentNode).remove();           
                    }
                }        
                var $tdOper = $("<td class='gOper'></td>")
                $tdOper.append($btnUpdate);
                $tdOper.append($btnDelete);
                $tdselect.append($inp_checkbox);
                //创建一个tr,将4个td追加到tr中
                var $tr = $("<tr></tr>")
                $tr.append($tdselect)
                $tr.append($tdName)
                $tr.append($tdPrice)
                $tr.append($tdCount)
                $tr.append($tdtotal)
                $tr.append($tdOper)
                //将创建好的tr追加到table 里去
                $("#body").append($tr)
            })
        }else{
            alert("购物车空空如也，快去选购吧！")
        }
    },'json');
};

