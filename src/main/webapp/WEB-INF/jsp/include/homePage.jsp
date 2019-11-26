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
			<button class="layui-btn" data-type="reload">搜索</button>
		</div>

		<table class="layui-hide" id="home_table" lay-filter="home_table_filter"></table>
	</div>
</div>
<div class="modal_edit" style="display: none">
13242134

</div>
<script>
layui.use('table', function(){
  var table = layui.table;
  
  //方法级渲染
  table.render({
    elem: '#home_table'
    ,url: 'orgQuery'
    ,cols: [[
      {checkbox: true, fixed: true}
      ,{field:'id', title: 'ID', width:80, sort: true, fixed: true}
      ,{field:'fullname', title: '机构全称', width:200}
      ,{field:'briefname', title: '机构简称', width:180}
      ,{field:'orgcode', title: '统一社会信用代码', width:180}
      ,{field:'contact.name', title: '联系人姓名', width:120, templet: function(d){ if(d.contact==null){return '';} else{return d.contact.name;} }}
      ,{field:'contact.email', title: '联系人邮箱', width:200, templet: function(d){ if(d.contact==null){return '';} else{return d.contact.email;} }}
      
      ,{fixed: 'right', title:'操作', width: 165, align:'center', toolbar: '#home_table_bar'}

    ]]
    ,id: 'testReload'
    ,page: true
    ,height: 400
  });
  
  var $ = layui.$, active = {
    reload: function(){
      var demoReload = $('#demoReload');
      
      //执行重载
      table.reload('testReload', {
        page: {
          curr: 1 //重新从第 1 页开始
        }
        ,where: {
          key: {
            keyword: demoReload.val()
          }
        }
      }, 'data');
    }
  };
  
  $('.demoTable .layui-btn').on('click', function(){
    var type = $(this).data('type');
    active[type] ? active[type].call(this) : '';
  });
});
</script>

<script>
layui.use('table', function(){
  var table = layui.table;
  //监听表格复选框选择
  table.on('checkbox(home_table_filter)', function(obj){
    console.log(obj)
  });
  //监听工具条
  table.on('tool(home_table_filter)', function(obj){
    var data = obj.data;
    if(obj.event === 'detail'){
    	layer.open({
    		  title: '详细信息',
    		  area: '600px' ,
    		  content: "<table class='layui-table' > <colgroup> <col width='150'> <col width='400'> </colgroup> <tbody> "
    		  +"<tr> <td>ID</td> <td>"+data.id+"</td> </tr> "
    		  +"<tr> <td>机构全称</td> <td>"+data.fullname+"</td> </tr> "
    		  +"<tr> <td>机构简称</td> <td>"+data.briefname+"</td> </tr>"
    		  +"<tr> <td>统一社会信用代码</td> <td>"+data.orgcode+"</td> </tr>"
    		  +"<tr> <td>联系人姓名</td> <td>"+ data.contact.name +"</td> </tr>"
    		  +"<tr> <td>联系人邮箱</td> <td>"+data.contact.email+"</td> </tr>"
    		  +"<tr> <td>联系人电话</td> <td>"+data.contact.phone+"</td> </tr>"
    		  +"<tr> <td>联系地址</td> <td>"+data.contact.address+"</td> </tr>"
    		  +"</tbody> </table>",
    		  btn: ['关闭'],
    		  shadeClose: false,
    		}); 
    } else if(obj.event === 'del'){
      layer.confirm('确定删除机构【'+data.fullname+'】吗？', function(index){
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
    } else if(obj.event === 'edit'){
    	layer.open({
    		type:2,
  		  title: '详细信息',
  		  area: '600px' ,
  		  content: "modal/orgEdit",
  		  btn: ['保存','关闭'],
  		  shadeClose: false,
  		}); 
    }
  });
  
  var $ = layui.$, active = {
    getCheckData: function(){ //获取选中数据
      var checkStatus = table.checkStatus('idTest')
      ,data = checkStatus.data;
      layer.alert(JSON.stringify(data));
    }
    ,getCheckLength: function(){ //获取选中数目
      var checkStatus = table.checkStatus('idTest')
      ,data = checkStatus.data;
      layer.msg('选中了：'+ data.length + ' 个');
    }
    ,isAll: function(){ //验证是否全选
      var checkStatus = table.checkStatus('idTest');
      layer.msg(checkStatus.isAll ? '全选': '未全选')
    }
  };
  
  $('.demoTable .layui-btn').on('click', function(){
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