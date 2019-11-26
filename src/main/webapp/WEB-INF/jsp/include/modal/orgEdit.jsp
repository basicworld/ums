<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>
<form class='layui-form' action=''>
	<div class='layui-form-item'>
		<label class='layui-form-label'>ID</label>
		<div class='layui-input-block'>
			<input type='text' name='id' lay-verify='id' autocomplete='off'
				class='layui-input' readonly='readonly'>
		</div>
	</div>
	<div class='layui-form-item'>
		<label class='layui-form-label'>机构全称</label>
		<div class='layui-input-block'>
			<input type='text' name='fullname' lay-verify='fullname' autocomplete='off'
				placeholder='请输入标题' class='layui-input'>
		</div>
	</div>
	<div class='layui-form-item'>
		<label class='layui-form-label'>机构简称</label>
		<div class='layui-input-block'>
			<input type='text' name='briefname' lay-verify='briefname' autocomplete='off'
				placeholder='请输入标题' class='layui-input'>
		</div>
	</div>
</form>