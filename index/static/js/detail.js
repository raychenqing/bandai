/**
 * Created by tarena on 18-8-3.
 */
$(function(){
  startload();
  check_login();
  check_aoi();
});

function check_login(){
  $.get('/check_login/',function(data){
    var html="";
    if(data.loginStatus == 0){
      html+="<a href='/login/'>[登录] </a>";
      html+="<a href='/register/'>[注册有惊喜]</a>";
    }
    else{
      html+="欢迎:"+data.uname;
      html+="&nbsp;&nbsp;&nbsp;&nbsp;";
      html+="<a href='/logout/'>[退出]</a>";
      update_cart();
    }
    $("#login-info").html(html);
  },'json');
}

/** 添加商品至购物车(异步) 
   参数 good_id:需要添加至购物车的商品的id
**/
function add_cart(good_id){
  $.get('/check_login/',function(data){
    if(data.loginStatus == 0){
      alert('请先登录...');
    }else{
      //向add_cart发送异步请求，并将good_id作为参数传递过去
      $.post('/add_cart/',{
        'good_id':good_id,
        'csrfmiddlewaretoken':$.cookie('csrftoken')
      },function(data){
        if(data.status == 1){
          alert('添加购物车成功')
          update_cart();
        }else{
          alert(data.statusText)
        }
      },'json');
    };
  },'json');
}

function buynow(good_id){
  $.get('/check_login/',function(data){
    var data = JSON.parse(data)
    if(data.loginStatus == 0){
      alert('请先登录...');
    }else{
      window.location.assign("/balance?msg="+good_id+" "+$("#gcount").val())
    }
  })
}


function startload(){
    // 下拉菜单
    var address = document.getElementsByClassName('address')[0];
    var select = document.getElementsByClassName('select')[0];
    var currentAdress = document.getElementsByClassName('currentAddress')[0];
    //children属性用来获取当前元素节点的所有子节点数组
    var adds = select.children;
    address.onmouseover = function(){
        //下拉菜单显示
        select.style.display = 'block';
    };
    for (var i = 0; i < adds.length; i++) {
        adds[i].onclick = function(){
            //传值,将当前点击元素的值传递给显示栏
            currentAdress.innerHTML = this.innerHTML;
        };
    }
    address.onmouseout = function(){
        select.style.display = 'none';
    }; 
  var show="";  
  show+="<i></i><span class='fa fa-shopping-cart'></span><a id='nav_cart_a' href='javascript:junmp_cart();'>购物车0件</a>"
  $("#nav_cart").html(show);
  var html="";
  html+="<a class='buy_a_on' href='javascript:buynow("+gid+");'>立即购买</a>"
  $("#buynow").html(html)
  var html="";
  html+="<a class='buy_a_on' href='javascript:add_cart("+gid+");'>加入购物车</a>"
  $("#add_cart").html(html)
  var html="";
  html += "<button onclick='sub_count()'>-</button>"
  html += "<input type='text' id='gcount' value='1'" 
  html += 'onkeyup="if(this.value.length==1){this.value=this.value.replace'
  html += "(/[^1-9]/g,'')}else{this.value=this.value.replace(/[^0-9]/g,'')}"
  html += '" onpaste="if(this.value.length==1){this.value=this.value.replace'
  html += "(/[^1-9]/g,'')}else{this.value=this.value.replace(/[^0-9]/g,'')}"
  html += '" onblur="if(this.value.length==0){this.value=1}else if(this.value>aoi){this.value=aoi}">'
  html += "<button onclick='add_count()'>+</button>"
  $("#ncontrol").html(html)
};

//减按钮函数
function sub_count(){
  var count = $("#gcount").val();
  if (count>1){
  $("#gcount").val(--count);
  }else{
  $("#gcount").val(count);
  }
};
//加按钮函数
function add_count(){
  var count = $("#gcount").val();
  if (count == aoi){alert("库存不足，请勿继续添加")}else{
  $("#gcount").val(++count);}
};



function update_cart(){
  $.get('/check_cart/',function(data){
    var ccount = JSON.parse(data).ccount
    $("#nav_cart_a").html(" 购物车"+ccount+"件")
  }
)};

function junmp_cart(){
  $.get('/check_login/',function(data){
    var data = JSON.parse(data)
    if(data.loginStatus == 0){
      alert('请先登录...');
    }else{
      window.location.assign("/cart")
    }
  }
)};


function check_aoi(){
  //确认库存数量是否为0，为零则提示客户此商品无库存，并将购买及加入购物车变灰
  if (aoi==0){
    $($("#add_cart").children()[0]).attr('href','')
    $($("#add_cart").children()[0]).attr('class','buy_a_off')
    $($("#buynow").children()[0]).attr('href','')
    $($("#buynow").children()[0]).attr('class','buy_a_off')
    alert("此商品卖完啦！再去挑挑别的吧");
  }
}
