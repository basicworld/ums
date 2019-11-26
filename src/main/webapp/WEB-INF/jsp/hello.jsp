<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>开始使用layui</title>
<link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>

	<!-- 你的HTML代码 -->
	<ul class="layui-nav" lay-filter="">
		<li class="layui-nav-item"><a href="">最新活动</a></li>
		<li class="layui-nav-item layui-this"><a href="">产品</a></li>
		<li class="layui-nav-item"><a href="">大数据</a></li>
		<li class="layui-nav-item"><a href="javascript:;">解决方案</a>
			<dl class="layui-nav-child">
				<!-- 二级菜单 -->
				<dd>
					<a href="">移动模块</a>
				</dd>
				<dd>
					<a href="">后台模版</a>
				</dd>
				<dd>
					<a href="">电商平台</a>
				</dd>
			</dl></li>
		<li class="layui-nav-item"><a href="">社区</a></li>
	</ul>


	<script src="layui/layui.js"></script>
	<script>
		layui.config({
			base : 'js/' //你存放新模块的目录，注意，不是layui的模块目录
		}).use('index'); //加载入口
	</script>
</body>
</html>
