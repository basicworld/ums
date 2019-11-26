<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>
<form class='layui-form' action=''>
    <div class='layui-form-item'> <label class='layui-form-label'>ID</label> <div class='layui-input-block'> <input type='text' name='id' lay-verify='id' autocomplete='off'class='layui-input' readonly='readonly'> </div> </div>
    <div class='layui-form-item'> <label class='layui-form-label'>机构全称</label> <div class='layui-input-block'> <input type='text' name='fullname' lay-verify='fullname' autocomplete='off'placeholder='请输入标题' class='layui-input'> </div> </div>
    <div class='layui-form-item'> <label class='layui-form-label'>机构简称</label> <div class='layui-input-block'> <input type='text' name='briefname' lay-verify='briefname' autocomplete='off'placeholder='请输入标题' class='layui-input'> </div> </div>
    <div class='layui-form-item'> <label class='layui-form-label'>统一社会信用代码</label> <div class='layui-input-block'> <input type='text' name='orgcode' lay-verify='orgcode' autocomplete='off'placeholder='请输入标题' class='layui-input'> </div> </div>
    <div class='layui-form-item'> <label class='layui-form-label'>联系人ID</label> <div class='layui-input-block'> <input type='text' name='contact.id' lay-verify='contact.id' autocomplete='off'class='layui-input' readonly='readonly'> </div> </div>
    <div class='layui-form-item'> <label class='layui-form-label'>联系人姓名</label> <div class='layui-input-block'> <input type='text' name='contact.name' lay-verify='contact.name' autocomplete='off'placeholder='请输入标题' class='layui-input'> </div> </div>
    <div class='layui-form-item'> <label class='layui-form-label'>联系人邮箱</label> <div class='layui-input-block'> <input type='text' name='contact.email' lay-verify='contact.email' autocomplete='off'placeholder='请输入标题' class='layui-input'> </div> </div>
    <div class='layui-form-item'> <label class='layui-form-label'>联系人电话</label> <div class='layui-input-block'> <input type='text' name='contact.phone' lay-verify='contact.phone' autocomplete='off'placeholder='请输入标题' class='layui-input'> </div> </div>
    <div class='layui-form-item'> <label class='layui-form-label'>联系地址</label> <div class='layui-input-block'> <input type='text' name='contact.address' lay-verify='contact.address' autocomplete='off'placeholder='请输入标题' class='layui-input'> </div> </div>
</form>