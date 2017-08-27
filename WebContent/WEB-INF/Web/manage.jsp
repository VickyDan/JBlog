<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}"
	scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>婧雪蔷薇杂记  VickyDan's Miscellanea</title>

<link rel="stylesheet" type="text/css"
	href="${path}/assests/JS/jquery-easyui-1.5.1/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css"
	href="${path}/assests/JS/jquery-easyui-1.5.1/themes/icon.css" />
<link rel="stylesheet" type="text/css"
	href="${path}/assests/JS/jquery-easyui-1.5.1/demo/demo.css" />
<link rel="stylesheet" type="text/css" href="${path}/assests/CSS/commom.css">
<script type="text/javascript"
	src="${path}/assests/JS/jquery-easyui-1.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="${path}/assests/JS/jquery-easyui-1.5.1/jquery.easyui.min.js"></script>
</head>
<body >
<div class="wrapper">
	<div class="title"></div>
	
	<div class="content" style="min-height: 600px;">
		<table id="dg" title="关于我的文章" style="margin: 0 auto;width: 800px;">
			<thead>
				<tr>
					<th data-options="field:'check'"></th>
					<th data-options="field:'id',width:80">编号</th>
					<th data-options="field:'title',width:100">标题</th>
					<th data-options="field:'tag',width:80,align:'right'">类别</th>
					<th data-options="field:'createDate',width:80,align:'right'">创建时间</th>
					<th data-options="field:'updateDate',width:250">修改时间</th>
					<th data-options="field:'reads',width:60,align:'center'">阅读量</th>
					<th data-options="field:'type',width:60,align:'center'">状态</th>
					<th
						data-options="field:'do',width:60,align:'center',formatter:formatfunc">操作</th>
				</tr>
			</thead>
		</table>

	</div>
	<div class="footer">
		<p>&copy 2017 婧雪蔷薇</p>
	</div>
	</div>
</body>

<script type="text/javascript">
   $('#dg').datagrid({
	   fitColumns:true,
       width:920,
       method:'post',
       loadMsg:'正在加载数据中......',
       toolbar:[{
    	   text:'增加',
    	   iconCls:'icon-add',
    	   handler:function(){ 
    		   var articleId=-1;
    		   window.location.assign('${path}/goEdit?id='+articleId);
    	   }
       },'-',{
    	   text:'删除',
    	   iconCls:'icon-cut',
    	   handler:function(){
    		   
    	   }
       },'-',{
    	   text:'刷新',
    	   iconCls:'icon-reload',
    	   handler:function(){
    		$('#dg').reload();
    	   }
       }
       ],
       url:'${path}/articles',
       singleSelect:true,
       
   });
   
   function formatfunc(value,row,index){
	   var e = '<a href="#"  onclick="editrow('
			+ index
			+ ')"><img src="${path}/assets/img/pencil.png" style="margin-left: 12px;vertical-align:middle;" title="编辑"/></a> ';
	   var d = '<a href="#"  onclick="deleterow('
			+ index
			+ ')"><img src="${path}/assets/img/edit_remove.png" style="margin-left: 12px;vertical-align:middle;" title="删除"/></a>';
	   return e + d;
   }
   
   function edit(index){
	   $('#dg').datagrid('selectRow',index);
	   var row=$('#dg').datagrid('getSelected');
	   window.location.href("${path}/goEdit?id="+row.id);
   }
   function deleteRow(index){
	   $('#dg').datagrid('selectRow',index);
	   var row=$('#dg').datagrid('getSelected');
	   $.messager.confirm('Confirm','确认删除'+row.title+'?',function(r){
		  if(r){
			  $.ajax({
				  url:'${path}/delete',
				  data:'id='+row.id,
				  type:'post',
				  timeout:6000,
				  success:function(data){
					  if(data=="success"){
						  $('#dg').datagrid('deleteRow',index);
						  $.messager.alert('提示','删除成功','info');
						  $('#dg').datagrid('reload');
					  }else{
						  $.messager.alert('提示','删除失败！请稍后重试','info')
					  }
				  },
				  error:function(){
					$.messager.alert('提示','Something Wrong','error');
				  }
			  });
		  } 
	   });
   }
</script>
</html>