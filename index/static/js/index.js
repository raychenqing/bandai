/**
 * Created by tarena on 18-8-3.
 */
$(function(){
  startload();
  //网页加载时要运行的操作
  loadGoods_1(1);
  loadGoods_2(1);
  loadGoods_3(1);

  check_login();
});

//新品内容
function loadGoods_1(page){
  $.get('/all_type_goods/','page='+page+'&type='+1,function(obj){
        var html="";
        html+="<div class='item'>";
        //将 obj.type 转换为 json 对象
        jsonType=JSON.parse(obj.type);
          html+="<p class='title'>";
            html+="<img src='/"+jsonType.picture+"'>";
          html+="</p>";
          html+="<ul>";
        //获得页面数和当前页面号
        var pages = obj.pages
        var index_n = obj.index_num
          //将obj.goods由字符串转换为json数组
          jsonGoods=JSON.parse(obj.goods);
          //循环遍历jsonGoods中的每一项内容,构建<li></li>
          $.each(jsonGoods,function(j,good){
            html+="<li";
            if((j+1)%5==0){
              html+=" class='no-margin'";
            }
            html+=">";
            //加载li中的内容
            html+="<p>";
              html+="<img src='/"+good.fields.picture+"'>";
            html+="</p>";
            html+="<div class='content'>";
              html+="<a href='javascript:add_cart("+good.pk+");' class='cart'>"
                html+="<img src='/static/images/cart.png'>";
              html+="</a>";
              html+="<span style='line-height:20px;font-weight:700;color:#c00;'>&yen; "+good.fields.price+"</span>";
              html+="<p><a href='/detail/"+good.pk+"'>"+good.fields.title+"</a></p>";
            html+="</div>";
            html+="</li>";
          });
          html+="</ul>";
          html+="<div class='items' style='padding-left:300px'><a href='javascript:previous_1("+index_n+");' class='items_previous'><上一页</a>"
          //对页面总数进行判断分为三种不同情况(始终只显示5页，开头，居中，尾部)
          //不超过5页
          if(pages<=5){
            var n=1;
            for(;;){   
              if(n>pages){
                break;
              }else if(n == index_n){
                html+="<b  class='items_pages_off'>"+n+"</b>";
              }else{
                html+="<a href='javascript:jumppage_1("+n+");' class='items_pages'>"+n+"</a>";
              }
              n++;
            }
          }else if(pages>5　&&　index_n<=3){
            //超过5页，当前页面小于等于3，最后面加...
            var n=1;
            for(;;){    
              if(n>5){
                break;
              }else if(n == index_n){
                html+="<b  class='items_pages_off'>"+n+"</b>";
              }else{
                html+="<a href='javascript:jumppage_1("+n+");' class='items_pages'>"+n+"</a>";
              }
              n++;
            }            
            html+="<span>...</span>";
          }else if(pages>5　&&　index_n>3 && index_n<pages-2){
            //超过5页，当前页面大于3，且当前页小于最大页-2,前后都有...
            html+="<span>...</span>";            
            var n=index_n-2;　//从当前页-2开始循环
            for(;;){   
              if(n>index_n+2){
                break;
              }else if(n == index_n){
                html+="<b  class='items_pages_off'>"+n+"</b>";
              }else{
                html+="<a href='javascript:jumppage_1("+n+");' class='items_pages'>"+n+"</a>";
              }
              n++;
            }
            html+="<span>...</span>";
          }else{
            //只有前面有...
            html+="<span>...</span>";            
            var n=pages-5;　//从末页-5开始循环
            for(;;){   
              if(n>pages){
                break;
              }else if(n == index_n){
                html+="<b  class='items_pages_off'>"+n+"</b>";
              }else{
                html+="<a href='javascript:jumppage_1("+n+");' class='items_pages'>"+n+"</a>";
              }
              n++;
            }
          }
          html+="<a href='javascript:next_1("+index_n+","+pages+");' class='items_next'>下一页></a>&nbsp"
          html += "共"+pages+"页，到第"
          html += "<input style='width:30px;' type='text' id='cur_page_1' value='"+index_n+"'"
          html += 'onkeyup="if(this.value.length==1){this.value=this.value.replace'
          html += "(/[^1-9]/g,'')}else{this.value=this.value.replace(/[^0-9]/g,'')}"
          html += '" onpaste="if(this.value.length==1){this.value=this.value.replace'
          html += "(/[^1-9]/g,'')}else{this.value=this.value.replace(/[^0-9]/g,'')}"
          html += '" onblur="if(this.value>'+pages+'){this.value='+pages+'}">'
          html+="页<input type='button' value='确定' onclick='anchorjump_1()'>"
        html+="</div></div>";
      //将拼好的show的内容填充到#main元素中
      $("#content1").html(html);
  },'json');
}

function anchorjump_1(){
  var num = $('#cur_page_1').val();
  jumppage_1(num);
}

function jumppage_1(num){
  loadGoods_1(num);

}

function previous_1(n){
  if(n>1){loadGoods_1(n-1)};
}

function next_1(n,maxpage){
  if(n<maxpage){loadGoods_1(n+1)};
  //$($('.items_pages_off')[0]).attr('class','items_pages')
  var inp = $('.items_pages_off')[0]
  inp.class='items_pages'
  //inp.class = 'items_pages'
}




//截单内容
function loadGoods_2(page){
  $.get('/all_type_goods/','page='+page+'&type='+2,function(obj){
        var html="";
        html+="<div class='item'>";
        //将 obj.type 转换为 json 对象
        jsonType=JSON.parse(obj.type);
          html+="<p class='title'>";
            html+="<img src='/"+jsonType.picture+"'>";
          html+="</p>";
          html+="<ul>";
        //获得页面数和当前页面号
        var pages = obj.pages
        var index_n = obj.index_num
          //将obj.goods由字符串转换为json数组
          jsonGoods=JSON.parse(obj.goods);
          //循环遍历jsonGoods中的每一项内容,构建<li></li>
          $.each(jsonGoods,function(j,good){
            html+="<li";
            if((j+1)%5==0){
              html+=" class='no-margin'";
            }
            html+=">";
            //加载li中的内容
            html+="<p>";
              html+="<img src='/"+good.fields.picture+"'>";
            html+="</p>";
            html+="<div class='content'>";
              html+="<a href='javascript:add_cart("+good.pk+");' class='cart'>"
                html+="<img src='/static/images/cart.png'>";
              html+="</a>";
              html+="<span style='line-height:20px;font-weight:700;color:#c00;'>&yen; "+good.fields.price+"</span>";
              html+="<p><a href='/detail/"+good.pk+"'>"+good.fields.title+"</a></p>";
            html+="</div>";
            html+="</li>";
          });
          html+="</ul>";
          html+="<div class='items' style='padding-left:300px'><a href='javascript:previous_2("+index_n+");' class='items_previous'><上一页</a>"
          //对页面总数进行判断分为三种不同情况(始终只显示5页，开头，居中，尾部)
          //不超过5页
          if(pages<=5){
            var n=1;
            for(;;){   
              if(n>pages){
                break;
              }else if(n == index_n){
                html+="<b  class='items_pages_off'>"+n+"</b>";
              }else{
                html+="<a href='javascript:jumppage_2("+n+");' class='items_pages'>"+n+"</a>";
              }
              n++;
            }
          }else if(pages>5　&&　index_n<=3){
            //超过5页，当前页面小于等于3，最后面加...
            var n=1;
            for(;;){    
              if(n>5){
                break;
              }else if(n == index_n){
                html+="<b  class='items_pages_off'>"+n+"</b>";
              }else{
                html+="<a href='javascript:jumppage_2("+n+");' class='items_pages'>"+n+"</a>";
              }
              n++;
            }            
            html+="<span>...</span>";
          }else if(pages>5　&&　index_n>3 && index_n<pages-2){
            //超过5页，当前页面大于3，且当前页小于最大页-2,前后都有...
            html+="<span>...</span>";            
            var n=index_n-2;　//从当前页-2开始循环
            for(;;){   
              if(n>index_n+2){
                break;
              }else if(n == index_n){
                html+="<b  class='items_pages_off'>"+n+"</b>";
              }else{
                html+="<a href='javascript:jumppage_2("+n+");' class='items_pages'>"+n+"</a>";
              }
              n++;
            }
            html+="<span>...</span>";
          }else{
            //只有前面有...
            html+="<span>...</span>";            
            var n=pages-5;　//从末页-5开始循环
            for(;;){   
              if(n>pages){
                break;
              }else if(n == index_n){
                html+="<b  class='items_pages_off'>"+n+"</b>";
              }else{
                html+="<a href='javascript:jumppage_2("+n+");' class='items_pages'>"+n+"</a>";
              }
              n++;
            }
          }
          html+="<a href='javascript:next_2("+index_n+","+pages+");' class='items_next'>下一页></a>&nbsp"          
          html += "共"+pages+"页，到第"
          html += "<input style='width:30px;' type='text' id='cur_page_2' value='"+index_n+"'"
          html += 'onkeyup="if(this.value.length==1){this.value=this.value.replace'
          html += "(/[^1-9]/g,'')}else{this.value=this.value.replace(/[^0-9]/g,'')}"
          html += '" onpaste="if(this.value.length==1){this.value=this.value.replace'
          html += "(/[^1-9]/g,'')}else{this.value=this.value.replace(/[^0-9]/g,'')}"
          html += '" onblur="if(this.value>'+pages+'){this.value='+pages+'}">'
          html+="页<input type='button' value='确定' onclick='anchorjump_2()'>"
        html+="</div></div>";
      //将拼好的show的内容填充到#main元素中
      $("#content2").html(html);

  },'json');
}

function anchorjump_2(){
  var num = $('#cur_page_2').val();
  jumppage_2(num);
}


function jumppage_2(num){
  loadGoods_2(num); 
}

function previous_2(n){
  if(n>1){loadGoods_2(n-1)};
}

function next_2(n,maxpage){
  if(n<maxpage){loadGoods_2(n+1)};
}



//人气商品
function loadGoods_3(page){
  $.get('/all_type_goods/','page='+page+'&type='+3,function(obj){
        var html="";
        html+="<div class='item'>";
        //将 obj.type 转换为 json 对象
        jsonType=JSON.parse(obj.type);
          html+="<p class='title'>";
            html+="<img src='/"+jsonType.picture+"'>";
          html+="</p>";
          html+="<ul>";
        //获得页面数和当前页面号
        var pages = obj.pages
        var index_n = obj.index_num
          //将obj.goods由字符串转换为json数组
          jsonGoods=JSON.parse(obj.goods);
          //循环遍历jsonGoods中的每一项内容,构建<li></li>
          $.each(jsonGoods,function(j,good){
            html+="<li";
            if((j+1)%5==0){
              html+=" class='no-margin'";
            }
            html+=">";
            //加载li中的内容
            html+="<p>";
              html+="<img src='/"+good.fields.picture+"'>";
            html+="</p>";
            html+="<div class='content'>";
              html+="<a href='javascript:add_cart("+good.pk+");' class='cart'>"
                html+="<img src='/static/images/cart.png'>";
              html+="</a>";
              html+="<span style='line-height:20px;font-weight:700;color:#c00;'>&yen; "+good.fields.price+"</span>";
              html+="<p><a href='/detail/"+good.pk+"'>"+good.fields.title+"</a></p>";
            html+="</div>";
            html+="</li>";
          });
          html+="</ul>";
          html+="<div class='items' style='padding-left:300px'><a href='javascript:previous_3("+index_n+");' class='items_previous'><上一页</a>"
          //对页面总数进行判断分为三种不同情况(始终只显示5页，开头，居中，尾部)
          //不超过5页
          if(pages<=5){
            var n=1;
            for(;;){   
              if(n>pages){
                break;
              }else if(n == index_n){
                html+="<b  class='items_pages_off'>"+n+"</b>";
              }else{
                html+="<a href='javascript:jumppage_3("+n+");' class='items_pages'>"+n+"</a>";
              }
              n++;
            }
          }else if(pages>5　&&　index_n<=3){
            //超过5页，当前页面小于等于3，最后面加...
            var n=1;
            for(;;){    
              if(n>5){
                break;
              }else if(n == index_n){
                html+="<b  class='items_pages_off'>"+n+"</b>";
              }else{
                html+="<a href='javascript:jumppage_3("+n+");' class='items_pages'>"+n+"</a>";
              }
              n++;
            }            
            html+="<span>...</span>";
          }else if(pages>6　&&　index_n>3 && index_n<pages-2){
            //超过5页，当前页面大于3，且当前页小于最大页-2,前后都有...
            html+="<span>...</span>";            
            var n=index_n-2;　//从当前页-2开始循环
            for(;;){   
              if(n>index_n+2){
                break;
              }else if(n == index_n){
                html+="<b  class='items_pages_off'>"+n+"</b>";
              }else{
                html+="<a href='javascript:jumppage_3("+n+");' class='items_pages'>"+n+"</a>";
              }
              n++;
            }
            html+="<span>...</span>";
          }else{
            //只有前面有...
            html+="<span>...</span>";            
            var n=pages-4;　//从末页-4开始循环
            for(;;){   
              if(n>pages){
                break;
              }else if(n == index_n){
                html+="<b  class='items_pages_off'>"+n+"</b>";
              }else{
                html+="<a href='javascript:jumppage_3("+n+");' class='items_pages'>"+n+"</a>";
              }
              n++;
            }
          } 
          html += "<a href='javascript:next_3("+index_n+","+pages+");' class='items_next'>下一页></a>&nbsp"
          html += "共"+pages+"页，到第"
          html += "<input style='width:30px;' type='text' id='cur_page_3' value='"+index_n+"'"
          html += 'onkeyup="if(this.value.length==1){this.value=this.value.replace'
          html += "(/[^1-9]/g,'')}else{this.value=this.value.replace(/[^0-9]/g,'')}"
          html += '" onpaste="if(this.value.length==1){this.value=this.value.replace'
          html += "(/[^1-9]/g,'')}else{this.value=this.value.replace(/[^0-9]/g,'')}"
          html += '" onblur="if(this.value>'+pages+'){this.value='+pages+'}">'
          html+="页<input type='button' value='确定' onclick='anchorjump_3()'>"
        html+="</div></div>";
      //将拼好的show的内容填充到#main元素中
      $("#content3").html(html);
  },'json');
}

function anchorjump_3(){
  var num = $('#cur_page_3').val();
  jumppage_3(num);
};

function jumppage_3(num){
  loadGoods_3(num); 
}

function previous_3(n){
  if(n>1){loadGoods_3(n-1)};
}

function next_3(n,maxpage){
  if(n<maxpage){loadGoods_3(n+1)};
}

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
  $("a[id='user_orders']").click(function(){
    $.get('/check_login/',function(data){
      if(data.loginStatus == 0){
        alert('请先登录...');
      }else{
        window.location.assign("/user_orders")
      }
    },'json');
  })
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
          alert(data.statusText)
          update_cart();
        }else{
          alert(data.statusText)
        }
      },'json');
    };
  },'json');
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
	var banner = document.getElementById('banner');
	var wrapper = document.getElementsByClassName('wrapper')[0];
	var loopImg = wrapper.children;
	var imgIndex = 0;
	var numIndexs = document.getElementsByClassName('imgInfo')[0].children;
	var timerID;
	timerID = setInterval(autoPlay,3000);
	function autoPlay(){
		loopImg[imgIndex].style.display='none';
		for (var i = 0; i < numIndexs.length; i++) {
			numIndexs[i].style.backgroundColor = 'gray';
		}
		imgIndex = ++ imgIndex == loopImg.length? 0 : imgIndex;
		loopImg[imgIndex].style.display='block';
		numIndexs[imgIndex].style.backgroundColor='red';
	}

	banner.onmouseover = function(){
		clearInterval(timerID);
	}
	banner.onmouseout = function(){
		timerID = setInterval(autoPlay,3000);
	}
  var show="";
  
  show+="<i></i><span class='fa fa-shopping-cart'></span><a id='nav_cart_a' href='javascript:junmp_cart();'>购物车0件</a>"
  $("#nav_cart").html(show);
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