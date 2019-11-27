<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt'%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>

<head>
<link rel="stylesheet" href="layui/css/layui.css">
<link rel="stylesheet" href="css/style.css">
<script src="layui/layui.js"></script>
<script>
	layui.config({
		base : 'js/' //你存放新模块的目录，注意，不是layui的模块目录
	}).use('index'); //加载入口
	
</script>

</head>

<body>