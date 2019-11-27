<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<script>
	function logout() {
		var $ = layui.$;
		delToken();
		$(window).attr('location', 'login');
	}
	function unregist() {
		var $ = layui.$;
		delToken();
		$(window).attr('location', 'home');
	}
	//用户登录弹出层
	function showLoginModal() {
		var $ = layui.$;
		layer.open({
			type : 1,
			title : '登录',
			area : '400px',
			content : $("#loginRegModal").html(),
			btn : [ '登录', '关闭' ],
			yes : function(index, layero) {
				layero.find('form').find('button[lay-submit]').click();
			},
			shadeClose : false,
			success : function(layero, index) {
				//lay-filter='layerEditFilter'		id='orgModalSubmitBtn'
				var form = layero.find('form');
				form.find("#loginRegModalSubmitBtn").attr("lay-filter", "loginFilter");
				form.find("#password_confirm_div").css("display", "none");
			}
		});
	}
	// 用户登录提交
	layui.use('form', function() {
		var form = layui.form;
		//监听提交
		form.on('submit(loginFilter)', function(data) {
			console.log(data.field);
			layer.close(layer.index);
			var $ = layui.$;
			$.ajax({
				url : "userLogin",
				data : data.field,
				type : "Post",
				dataType : "json",
				success : function(resp) {
					layer.msg(resp.msg);
					console.log("resp.token=" + resp.token);
					setToken(resp.token);
					$(window).attr('location', 'home');
				},
				error : function(resp) {
					layer.msg('登录失败');
				}
			});
			return false;
		});
	});
</script>
<script>
	layui.use('layer', function() {
		// testlogin
		var $ = layui.$;
		var token = getToken();
		console.log(">>>" + token + "<<<");
		if (token == "" || token === null) {
			$("#nologin_div").css("display", "block");
			$("#logined_div").css("display", "none");
		} else {
			$("#nologin_div").css("display", "none");
			$("#logined_div").css("display", "block");
			$("#sys_user_name").text(token);
		}

		// logout

	});
</script>
<div class="layui-layout layui-layout-admin">
	<div class="layui-header">
		<div class="layui-logo">UMS 用户管理系统</div>
		<!-- 头部区域（可配合layui已有的水平导航） -->
		<ul class="layui-nav layui-layout-left">
			<li class="layui-nav-item"><a href="">待开发</a></li>
			<li class="layui-nav-item"><a href="">待开发</a></li>
			<li class="layui-nav-item"><a href="">待开发</a></li>
			<li class="layui-nav-item"><a href="javascript:;">待开发</a>
				<dl class="layui-nav-child">
					<dd>
						<a href="">邮件管理</a>
					</dd>
					<dd>
						<a href="">消息管理</a>
					</dd>
					<dd>
						<a href="">授权管理</a>
					</dd>
				</dl></li>
		</ul>
		<ul class="layui-nav layui-layout-right" style="display: none"
			id="logined_div">
			<li class="layui-nav-item"><a href="javascript:;"> <img
					src="http://t.cn/RCzsdCq" class="layui-nav-img"> <span
					id="sys_user_name"></span>
			</a>
				<dl class="layui-nav-child">
					<dd>
						<a href="">修改密码</a>
					</dd>
					<dd>
						<a href="#" onclick="unregist()">注销登录</a>
					</dd>
				</dl></li>
			<li class="layui-nav-item"><a onclick="logout()">退出</a></li>
		</ul>
		<ul class="layui-nav layui-layout-right" id="nologin_div"
			style="display: block;">
			<li class="layui-nav-item"><a onclick="showLoginModal()">登录</a></li>
		</ul>
	</div>
	<!-- layui-header -->