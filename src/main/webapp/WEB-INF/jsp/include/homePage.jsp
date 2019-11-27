<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<div class="layui-body" style="left: 0;">
	<!-- 内容主体区域 -->
	<div style="padding: 0;">
		<br>
		<div class="layui-container">
			<div class="layui-row">
				<div class="demoTable">
					<div class="layui-inline">
						<input class="layui-input" name="keyword" id="keyword_id"
							autocomplete="off" style="width: 240px;">
					</div>
					<button id="reload_btn" class="layui-btn  layui-btn-radius"
						data-type="reload">搜索</button>
					<button id="add_org_btn"
						class="layui-btn  layui-btn-radius layui-btn-primary"
						data-type="addOrgBtn">新增机构</button>
					<table class="layui-hide" id="home_table"
						lay-filter="home_table_filter"></table>
				</div>

			</div>
			<div class="layui-row"></div>
		</div>
	</div>
</div>
<script>
	// 表格渲染
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
			height : 450
		});

		var $ = layui.$, active = {
			reload : function() {
				//执行重载
				table.reload('testReload', {
					page : {
						curr : 1
					//重新从第 1 页开始
					},
					where : {
						keyword : $('#keyword_id').val()
					}
				}, 'data');
			},
			addOrgBtn : function() {
				showAddOrgModal();
			}

		};

		$('.demoTable .layui-btn').on('click', function() {
			var type = $(this).data('type');
			active[type] ? active[type].call(this) : '';
		});
	});
</script>

<script>
	// 表格动作
	layui.use('table', function() {
		var table = layui.table;
		//监听表格复选框选择
		table.on('checkbox(home_table_filter)', function(obj) {
			console.log(obj)
		});
		//监听工具条
		table.on('tool(home_table_filter)', function(obj) {
			var data = obj.data;
			if (obj.event === 'detail') {
				layer.open({
					title : '详细信息',
					area : '600px',
					content : $("#orgShowModal").html(),
					btn : [ '关闭' ],
					shadeClose : false,
					success : function(layero, index) {
						table = layero.find('table');
						table.find("#id").text(data.id);
						table.find("#fullname").text(data.fullname);
						table.find("#briefname").text(data.briefname);
						table.find("#orgcode").text(data.orgcode);
						table.find("#contact_id").text(data.contact.id);
						table.find("#contact_name").text(data.contact.name);
						table.find("#contact_email").text(data.contact.email);
						table.find("#contact_phone").text(data.contact.phone);
						table.find("#contact_address").text(data.contact.address);
					}
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

				layer.open({
					type : 1,
					title : '详细信息',
					area : '600px',
					content : $("#orgModal").html(),
					btn : [ '保存', '关闭' ],
					yes : function(index, layero) {
						layero.find('form').find('button[lay-submit]').click();
					},
					shadeClose : false,
					success : function(layero, index) {
						// 弹出层赋值
						var form = layero.find('form');
						form.find("#orgModalSubmitBtn").attr("lay-filter", "layerEditFilter");
						form.find("#id").val(data.id);
						form.find("#fullname").val(data.fullname);
						form.find("#briefname").val(data.briefname);
						form.find("#orgcode").val(data.orgcode);
						form.find("#contact_id").val(data.contact.id);
						form.find("#contact_name").val(data.contact.name);
						form.find("#contact_email").val(data.contact.email);
						form.find("#contact_phone").val(data.contact.phone);
						form.find("#contact_address").val(data.contact.address);
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
	// 弹出层更新

	layui.use('form', function() {
		var form = layui.form;
		//监听提交
		form.on('submit(layerEditFilter)', function(data) {
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
<script>
	// 新增机构弹出层
	function showAddOrgModal() {
		var $ = layui.$;
		layer.open({
			type : 1,
			title : '添加机构',
			area : '600px',
			content : $("#orgModal").html(),
			btn : [ '保存', '关闭' ],
			yes : function(index, layero) {
				layero.find('form').find('button[lay-submit]').click();
			},
			shadeClose : false,
			success : function(layero, index) {
				//lay-filter='layerEditFilter'		id='orgModalSubmitBtn'
				var form = layero.find('form');
				form.find("#orgModalSubmitBtn").attr("lay-filter", "layerAddFilter");
			}
		});
	}
	// 弹出层新增
	layui.use('form', function() {
		var form = layui.form;
		//监听提交
		form.on('submit(layerAddFilter)', function(data) {
			console.log(data.field);
			layer.close(layer.index);
			var $ = layui.$;
			$.ajax({
				url : "orgAdd",
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
