$(function(){
  //为 name=uphone 的元素绑定 blur 事件
  $("input[name='uphone']").blur(function(){
    // $.get(url,data,callback,type);
    check_phone();
  });
  //为　#formReg 绑定　submit 事件
  $("#formReg").submit(function(){
      //判断用户手机号的合法性
      if($("#uphone-show").html() != "此号码验证可用"){
        alert('请输入正确的手机号码')
        return false;
      }
      //判断密码框是否合法
      var pattern = /^\w{6,16}$/;
      if(!pattern.test($("#upwd").val())){
        alert('请正确输入6-16位数字字母_组成的密码！')
        return false;
      }
      if(!pattern.test($("#cpwd").val())){
        alert('请正确输入6-16位数字字母_组成的密码！')
        return false;
      }
      //判断两次密码输入是否一致
      if($("#upwd").val() != $('#cpwd').val()){
        alert('两次密码不一致，请重新输入')
        return false;
      }
      //判断其他框不能为空
      if($("input[name='uname']").val()==''){
        alert('用户名不能为空')
        return false;
      }
      if($("input[name='address']").val()==''){
        alert('地址信息不能为空')
        return false;
      } 
      if($("input[name='uemail']").val()==''){
        alert('邮箱信息不能为空')
        return false;
      }
      alert('恭喜您！注册成功！') 
  });
});

/**
 * 验证手机号码是否存在的操作(异步)
 * 返回值:{status:状态码,msg:状态文本}*/
function check_phone(){
  //验证手机号码是否合法
  var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
  if(!myreg.test($("input[name='uphone']").val()))
    {
      $("#uphone-show").html("无效的手机号码");
    }else{
      $.get(
        '/checkphone/',
        "uphone="+$("input[name='uphone']").val(),function(data){
          //data : 成功时响应的数据
          data = JSON.parse(data);
          $("#uphone-show").html(data.msg);
        });
    }
}














