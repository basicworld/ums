<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<br>
<div class="layui-container">
	<div class="layui-row">
		<div class="demoTable">
			搜索：
			<div class="layui-inline">
				<input class="layui-input" name="keyword" id="demoReload"
					autocomplete="off">
			</div>
			<button id="reload_btn" class="layui-btn  layui-btn-radius"
				data-type="reload">搜索</button>
			<button id="add_org_btn"
				class="layui-btn  layui-btn-radius layui-btn-primary">新增机构</button>
			<table class="layui-hide" id="home_table"
				lay-filter="home_table_filter"></table>
		</div>

	</div>
	<div class="layui-row"></div>
</div>
<div class="modal_edit" style="display: none">13242134</div>
<script>
	layui.use('table', function() {
		var table = layui.table;

		//方法级渲染
		table.render({
			elem : '#home_table',
			url : 'orgQuery',
			cols : [ [ {
				checkbox : true,
				fixed : true
			}, {
				field : 'id',
				title : 'ID',
				width : 80,
				sort : true,
				fixed : true
			}, {
				field : 'fullname',
				title : '机构全称',
				width : 200
			}, {
				field : 'briefname',
				title : '机构简称',
				width : 180
			}, {
				field : 'orgcode',
				title : '统一社会信用代码',
				width : 180
			}, {
				field : 'contact.name',
				title : '联系人姓名',
				width : 120,
				templet : function(d) {
					if (d.contact == null) {
						return '';
					} else {
						return d.contact.name;
					}
				}
			}, {
				field : 'contact.email',
				title : '联系人邮箱',
				width : 200,
				templet : function(d) {
					if (d.contact == null) {
						return '';
					} else {
						return d.contact.email;
					}
				}
			}

			, {
				fixed : 'right',
				title : '操作',
				width : 165,
				align : 'center',
				toolbar : '#home_table_bar'
			}

			] ],
			id : 'testReload',
			page : true,
			height : 400
		});

		var $ = layui.$, active = {
			reload : function() {
				var demoReload = $('#demoReload');

				//执行重载
				table.reload('testReload', {
					page : {
						curr : 1
					//重新从第 1 页开始
					},
					where : {
						keyword : demoReload.val()
					}
				}, 'data');
			}
		};

		$('.demoTable .layui-btn').on('click', function() {
			var type = $(this).data('type');
			active[type] ? active[type].call(this) : '';
		});
	});
</script>

<script>
	layui
			.use(
					'table',
					function() {
						var table = layui.table;
						//监听表格复选框选择
						table.on('checkbox(home_table_filter)', function(obj) {
							console.log(obj)
						});
						//监听工具条
						table
								.on(
										'tool(home_table_filter)',
										function(obj) {
											var data = obj.data;
											if (obj.event === 'detail') {
												layer.open({
													title : '详细信息',
													area : '600px',
													content : "<table class='layui-table' > <colgroup> <col width='150'> <col width='400'> </colgroup> <tbody> " + "<tr> <td>ID</td> <td>" + data.id + "</td> </tr> " + "<tr> <td>机构全称</td> <td>" + data.fullname + "</td> </tr> "
															+ "<tr> <td>机构简称</td> <td>" + data.briefname + "</td> </tr>" + "<tr> <td>统一社会信用代码</td> <td>" + data.orgcode + "</td> </tr>" + "<tr> <td>联系人姓名</td> <td>" + data.contact.name + "</td> </tr>" + "<tr> <td>联系人邮箱</td> <td>" + data.contact.email
															+ "</td> </tr>" + "<tr> <td>联系人电话</td> <td>" + data.contact.phone + "</td> </tr>" + "<tr> <td>联系地址</td> <td>" + data.contact.address + "</td> </tr>" + "</tbody> </table>",
													btn : [ '关闭' ],
													shadeClose : false,
												});
											} else if (obj.event === 'del') {
												layer.confirm('确定删除机构【' + data.fullname + '】吗？', function(index) {
													$.ajax({
														url : "orgDelete",
														data : {
															'id' : data.id
														},
														type : "Post",
														dataType : "json",
														success : function(data) {
															obj.del();
															layer.msg(data.msg);
														},
														error : function(data) {
															layer.msg('执行删除失败，请稍后再试');
														}
													});

													layer.close(index);
												});
											} else if (obj.event === 'edit') {
												console.log(data);

												layer
														.open({
															type : 1,
															title : '详细信息',
															area : '600px',
															content : "<br><div style='margin: 0 20px 0 0;'><form class='layui-form' action='orgUpdate' method='Post'>"
																	+ "<div style='display:none' class='layui-form-item'> <label class='layui-form-label'>ID</label> <div class='layui-input-block'> <input type='text' id='id' name='id' lay-verify='id' autocomplete='off'class='layui-input' readonly='readonly'> </div> </div>"
																	+ "<div class='layui-form-item'> <label class='layui-form-label'>机构全称</label> <div class='layui-input-block'> <input type='text' id='fullname' name='fullname' lay-verify='fullname' autocomplete='off'placeholder='请输入标题' class='layui-input'> </div> </div>"
																	+ "<div class='layui-form-item'> <label class='layui-form-label'>机构简称</label> <div class='layui-input-block'> <input type='text' id='briefname' name='briefname' lay-verify='briefname' autocomplete='off'placeholder='请输入标题' class='layui-input'> </div> </div>"
																	+ "<div class='layui-form-item'> <label class='layui-form-label'>统一社会信用代码</label> <div class='layui-input-block'> <input type='text' id='orgcode' name='orgcode' lay-verify='orgcode' autocomplete='off'placeholder='请输入标题' class='layui-input'> </div> </div>"
																	+ "<div style='display:none' class='layui-form-item'> <label class='layui-form-label'>联系人ID</label> <div class='layui-input-block'> <input type='text' id='contact_id' name='contact_id' lay-verify='contact_id' autocomplete='off'class='layui-input' readonly='readonly'> </div> </div>"
																	+ "<div class='layui-form-item'> <label class='layui-form-label'>联系人姓名</label> <div class='layui-input-block'> <input type='text' id='contact_name' name='contact_name' lay-verify='contact_name' autocomplete='off'placeholder='请输入标题' class='layui-input'> </div> </div>"
																	+ "<div class='layui-form-item'> <label class='layui-form-label'>联系人邮箱</label> <div class='layui-input-block'> <input type='text' id='contact_email' name='contact_email' lay-verify='contact_email' autocomplete='off'placeholder='请输入标题' class='layui-input'> </div> </div>"
																	+ "<div class='layui-form-item'> <label class='layui-form-label'>联系人电话</label> <div class='layui-input-block'> <input type='text' id='contact_phone' name='contact_phone' lay-verify='contact_phone' autocomplete='off'placeholder='请输入标题' class='layui-input'> </div> </div>"
																	+ "<div class='layui-form-item'> <label class='layui-form-label'>联系地址</label> <div class='layui-input-block'> <input type='text' id='contact_address' name='contact_address' lay-verify='contact_address' autocomplete='off'placeholder='请输入标题' class='layui-input'> </div> </div>"
																	+ "<div style='display:none' class='layui-form-item'> <div class='layui-input-block'> <button class='layui-btn' lay-submit lay-filter='formDemo' id='formDemoSubmit'>立即提交</button> <button type='reset' class='layui-btn layui-btn-primary'>重置</button> </div> </div>"
																	+ "</form></div>",
															btn : [ '保存', '关闭' ],
															yes : function(index, layero) {
																layero.find('form').find('button[lay-submit]').click();
															},
															shadeClose : false,
															success : function() {
																console.log(data.contact.email);
																$("#id").val(data.id);
																$("#fullname").val(data.fullname);
																$("#briefname").val(data.briefname);
																$("#orgcode").val(data.orgcode);
																$("#contact_id").val(data.contact.id);
																$("#contact_name").val(data.contact.name);
																$("#contact_email").val(data.contact.email);
																$("#contact_phone").val(data.contact.phone);
																$("#contact_address").val(data.contact.address);
															}
														});
											}
										});

						var $ = layui.$, active = {
							getCheckData : function() { //获取选中数据
								var checkStatus = table.checkStatus('idTest'), data = checkStatus.data;
								layer.alert(JSON.stringify(data));
							},
							getCheckLength : function() { //获取选中数目
								var checkStatus = table.checkStatus('idTest'), data = checkStatus.data;
								layer.msg('选中了：' + data.length + ' 个');
							},
							isAll : function() { //验证是否全选
								var checkStatus = table.checkStatus('idTest');
								layer.msg(checkStatus.isAll ? '全选' : '未全选')
							}
						};

						$('.demoTable .layui-btn').on('click', function() {
							var type = $(this).data('type');
							active[type] ? active[type].call(this) : '';
						});
					});
</script>
<script type="text/html" id="home_table_bar">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script>
	//Demo

	layui.use('form', function() {
		var form = layui.form;
		//监听提交
		form.on('submit(formDemo)', function(data) {
			layer.close(layer.index);
			var $ = layui.$;
			$.ajax({
				url : "orgUpdate",
				data : data.field,
				type : "Post",
				dataType : "json",
				success : function(resp) {
					layer.msg(resp.msg);
					$("#reload_btn").click();
				},
				error : function(resp) {
					layer.msg('执行失败，请稍后再试');
				}
			});
			return false;
		});
	});
</script>