<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>
<script src="js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="layui/css/layui.css">
<link rel="stylesheet" href="css/adminLogin.css">
</head>
<body>
	<div class="wrap">
		<img src="img/back.jpeg" class="imgStyle">
		<div class="loginForm">
			<form class="layui-form" action="">

				<div class="logoHead">
					<h2>UMS用户登录</h2>
				</div>
				<div style="margin: 0 30px;">
					<div id="name_div" class='layui-form-item mb30'>
						<div class=''>
							<input type='text' id='name' name='name' lay-verify='required'
								autocomplete='off' placeholder='请输入用户名' class='layui-input'>
						</div>
					</div>
					<div id="password_div" class='layui-form-item mb30'>
						<div class=''>
							<input type='password' id='password' name='password'
								lay-verify='required' autocomplete='off' placeholder='请输入密码'
								class='layui-input'>
						</div>
					</div>
					<div class='layui-form-item mt20'>
						<div class='layui-input-block' style="align-items: center;">
							<button class='layui-btn' lay-submit lay-filter='loginFilter'
								id="loginBtn">登录</button>
							<button type='reset' class='layui-btn layui-btn-primary'
								id="loginRegister">注册</button>
						</div>
					</div>
				</div>
			</form>

		</div>
	</div>
	<script src="layui/layui.js" type="text/javascript"></script>
	<script src="js/index.js" type="text/javascript"></script>
	<script type="text/javascript">
		delToken();
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
</body>
<div class="registerPage">
	<div class="registerDiv">
		<br>
		<form class='layui-form' action='' method='Post'>
			<div style='display: none' class='layui-form-item'>
				<label class='layui-form-label'>ID</label>
				<div class='layui-input-block'>
					<input type='text' id='id' name='id' lay-verify='id'
						autocomplete='off' class='layui-input' readonly='readonly'>
				</div>
			</div>
			<div id="name_div" class='layui-form-item'>
				<label class='layui-form-label addRedStar'>用户名</label>
				<div class='layui-input-block'>
					<input type='text' id='name' name='name' lay-verify='required'
						autocomplete='off' placeholder='请输入用户名' class='layui-input'>
				</div>
			</div>
			<div id="password_div" class='layui-form-item'>
				<label class='layui-form-label addRedStar'>密码</label>
				<div class='layui-input-block'>
					<input type='password' id='password' name='password'
						lay-verify='required' autocomplete='off' placeholder='请输入密码'
						class='layui-input'>
				</div>
			</div>
			<div id="password_confirm_div" class='layui-form-item'>
				<label class='layui-form-label'>确认密码</label>
				<div class='layui-input-block'>
					<input type='password' id='password2' name='password2'
						lay-verify='password' autocomplete='off' placeholder='请再次输入密码'
						class='layui-input'>
				</div>
			</div>
			<div style='display: none' class='layui-form-item'>
				<div class='layui-input-block'>
					<button class='layui-btn' lay-submit lay-filter='regFilter'
						id='loginRegModalSubmitBtn'>立即提交</button>
					<button type='reset' class='layui-btn layui-btn-primary'>重置</button>
				</div>
			</div>
		</form>
	</div>
</div>
</html>

