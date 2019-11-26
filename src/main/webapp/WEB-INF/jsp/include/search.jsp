<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<br>
<div class="layui-container">
	<div class="layui-row">
		<form class="layui-form" action="">
			<div class="layui-col-md3">
				<div></div>
			</div>
			<div class="layui-col-md6">
				<div class="layui-form-item">
					<label class="layui-form-label"></label>
					<div class="layui-input-block">
						<input type="text" name="title" required lay-verify="required"
							placeholder="请输入机构名称或统一社会信用代码" autocomplete="off"
							class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-col-md3">
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit lay-filter="formDemo">搜索</button>
						<button type="reset" class="layui-btn layui-btn-primary">清空</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>

<script>
	//Demo
	layui.use('form', function() {
		var form = layui.form;

		//监听提交
		form.on('submit(formDemo)', function(data) {
			layer.msg(JSON.stringify(data.field));
			return false;
		});
	});
</script>