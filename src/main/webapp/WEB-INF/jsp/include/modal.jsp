<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!--查看按钮modal  -->
<div id="orgShowModal" style="display: none">
	<table class='layui-table'>
		<colgroup>
			<col width='150'>
			<col width='400'>
		</colgroup>
		<tbody>
			<tr>
				<td>ID</td>
				<td id="id"></td>
			</tr>
			<tr>
				<td>机构全称</td>
				<td id="fullname"></td>
			</tr>
			<tr>
				<td>机构简称</td>
				<td id="briefname"></td>
			</tr>
			<tr>
				<td>统一社会信用代码</td>
				<td id="orgcode"></td>
			</tr>
			<tr>
				<td>联系人姓名</td>
				<td id="contact_name"></td>
			</tr>
			<tr>
				<td>联系人邮箱</td>
				<td id="contact_email"></td>
			</tr>
			<tr>
				<td>联系人电话</td>
				<td id="contact_phone"></td>
			</tr>
			<tr>
				<td>联系地址</td>
				<td id="contact_address"></td>
			</tr>
		</tbody>
	</table>
</div>
<!-- 新增、编辑按钮modal  -->
<div id="orgModal" style="display: none">
	<br>
	<div id="" style='margin: 0 20px 0 0;'>
		<form class='layui-form' action='' method='Post'>
			<div style='display: none' class='layui-form-item'>
				<label class='layui-form-label'>ID</label>
				<div class='layui-input-block'>
					<input type='text' id='id' name='id' lay-verify='id'
						autocomplete='off' class='layui-input' readonly='readonly'>
				</div>
			</div>
			<div class='layui-form-item'>
				<label class='layui-form-label addRedStar'>机构全称</label>
				<div class='layui-input-block'>
					<input type='text' id='fullname' name='fullname'
						lay-verify='required' autocomplete='off' placeholder='请输入机构全称'
						class='layui-input'>
				</div>
			</div>
			<div class='layui-form-item'>
				<label class='layui-form-label'>机构简称</label>
				<div class='layui-input-block'>
					<input type='text' id='briefname' name='briefname'
						lay-verify='briefname' autocomplete='off' placeholder='请输入机构简称'
						class='layui-input'>
				</div>
			</div>
			<div class='layui-form-item'>
				<label class='layui-form-label addRedStar'>统一社会信用代码</label>
				<div class='layui-input-block'>
					<input type='text' id='orgcode' name='orgcode'
						lay-verify='required' autocomplete='off'
						placeholder='请输入18位统一社会信用代码' class='layui-input'>
				</div>
			</div>
			<div style='display: none' class='layui-form-item'>
				<label class='layui-form-label'>联系人ID</label>
				<div class='layui-input-block'>
					<input type='text' id='contact_id' name='contact_id'
						lay-verify='contact_id' autocomplete='off' class='layui-input'
						readonly='readonly'>
				</div>
			</div>
			<div class='layui-form-item'>
				<label class='layui-form-label addRedStar'>联系人姓名</label>
				<div class='layui-input-block'>
					<input type='text' id='contact_name' name='contact_name'
						lay-verify='required' autocomplete='off' placeholder='请输入联系人姓名'
						class='layui-input'>
				</div>
			</div>
			<div class='layui-form-item'>
				<label class='layui-form-label addRedStar'>联系人邮箱</label>
				<div class='layui-input-block'>
					<input type='text' id='contact_email' name='contact_email'
						lay-verify='required|email' autocomplete='off'
						placeholder='请输入联系人邮箱' class='layui-input'>
				</div>
			</div>
			<div class='layui-form-item'>
				<label class='layui-form-label'>联系人电话</label>
				<div class='layui-input-block'>
					<input type='text' id='contact_phone' name='contact_phone'
						lay-verify='contact_phone' autocomplete='off'
						placeholder='请输入联系人电话' class='layui-input'>
				</div>
			</div>
			<div class='layui-form-item'>
				<label class='layui-form-label'>联系地址</label>
				<div class='layui-input-block'>
					<input type='text' id='contact_address' name='contact_address'
						lay-verify='contact_address' autocomplete='off'
						placeholder='请输入联系地址' class='layui-input'>
				</div>
			</div>
			<div style='display: none' class='layui-form-item'>
				<div class='layui-input-block'>
					<button class='layui-btn' lay-submit lay-filter='layerEditFilter'
						id='orgModalSubmitBtn'>立即提交</button>
					<button type='reset' class='layui-btn layui-btn-primary'>重置</button>
				</div>
			</div>
		</form>
	</div>
</div>
<!-- 登陆注册modal -->
<div id="loginRegModal" style="display: none">
    <br>
    <div id="" style='margin: 0 20px 0 0;'>
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
                        autocomplete='off' class='layui-input'>
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
                    <input type='text' id='password2' name='password2'
                        lay-verify='password' autocomplete='off' placeholder='请再次输入密码'
                        class='layui-input'>
                </div>
            </div>
            <div style='display: none' class='layui-form-item'>
                <div class='layui-input-block'>
                    <button class='layui-btn' lay-submit lay-filter='loginRegFilter'
                        id='loginRegModalSubmitBtn'>立即提交</button>
                    <button type='reset' class='layui-btn layui-btn-primary'>重置</button>
                </div>
            </div>
        </form>
    </div>
</div>
