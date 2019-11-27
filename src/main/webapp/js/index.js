/**
 * 项目JS主入口 以依赖layui的layer和form模块为例
 */
layui.define([ 'layer', 'form', 'element' ], function(exports) {
	var layer = layui.layer, form = layui.form;

	var element = layui.element;

	exports('index', {}); // 注意，这里是模块输出的核心，模块名必须和use时的模块名一致
});

function delToken(){
	setCookie("token", null, -1);
}

function getToken(){
	return getCookie("token");
}

function setToken(token){
	setCookie("token", token, 72000);
}

function setCookie(c_name,value,expireSeconds)
{
  var date=new Date(); 
  date.setTime(date.getTime()+expireSeconds*1000); //设置date为当前时间+expireSeconds秒
  document.cookie=c_name+"="+value+"; expires="+date.toGMTString(); //将date赋值给expires
}

function getCookie(c_name)
{
  if (document.cookie.length>0)
    {
    c_start=document.cookie.indexOf(c_name + "=")
    if (c_start!=-1)
      { 
      c_start=c_start + c_name.length+1 
      c_end=document.cookie.indexOf(";",c_start)
      if (c_end==-1) c_end=document.cookie.length
      return unescape(document.cookie.substring(c_start,c_end))
      } 
    }
  return ""
}
