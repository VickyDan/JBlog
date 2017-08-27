<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"
	scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>婧雪蔷薇杂记  VickyDan's Miscellanea</title>
<link rel="stylesheet" type="text/css" href="${path}/assests/CSS/commom.css">
<script type="text/javascript" charset="utf-8" src="${path}/assests/JS/jquery-easyui-1.5.1/jquery.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${path}/assests/JS/ueditor1_4_3_3-utf8-jsp/utf8-jsp/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${path}/assests/JS/ueditor1_4_3_3-utf8-jsp/utf8-jsp/ueditor.all.js"></script>
<!-- 手动加载语言 -->
<script type="text/javascript" charset="utf-8"
	src="${path}/assests/JS/ueditor1_4_3_3-utf8-jsp/utf8-jsp/lang/zh-cn/zh-cn.js"></script>

</head>
<body>
	<div class="wrapper">
		<div class="title"></div>
		<div class="content">
			<span>题目:<input type="text" id="title" name="title"
				style="width: 760px;" value="${title}"></span><br><br><span>标签:<input
				type="text" id="tag" name="tag" style="width: 760px;" value="${tag}"></span>
				<br><br>
			<div id="container"
				style="min-height: 320px; width: 800px; margin: 0 auto;"></div>
			<input type="button" value="提交" onclick="return submit()">
			<input type="button" value="重置" onclick="return reset()">
		</div>
		<div class="footer">
			<p>&copy 2017 婧雪蔷薇</p>
		</div>
	</div>
</body>
<script type="text/javascript">
	
    /* UE.Editor.prototype._bkGetActionUrl=UE.Editor.prototype.getActionUrl;
	UE.Editor.prototype.getActionUrl=function(action){
		if(action=='uploadimage'){
			return "${path}/uploadimage";
		}
	}   */
	var ue = UE.getEditor('container',
			{
				toolbars : [ [ 'source', 'undo', 'redo', 'bold', 'italic',
						'underline', 'fontfamily', 'fontsize', 'forecolor',
						'touppercase', 'tolowercase', 'insertorderedlist',
						'insertunorderedlist', 'simpleupload', 'link',
						'searchreplace', 'autotypeset', 'help' ] ],
				autoHeightEnabled : true,
				autoFloatEnabled : true,
			// serverUrl:'${path}/updateArticle'
				initialContent:'${content}'
			   
			});
	
	function submit(){
		var html;
		var title,tag;
		title=document.getElementById("title");
		tag=document.getElementById("tag");
		var ctitle=title.value;
		var ctag=tag.value;
		   if(ctitle==null){
			   alert("文章标题为空，请检查后重试！")
		   }
		   else if(ue.hasContents()){
			  html=ue.getContent();
			  $.ajax({
				  url:'${path}/updateArticle',
				  type:'post',
				  data:{title:ctitle,tag:ctag,content:html,id:'${id}'},
				  dataType:'json',
				  success:function(data){
					  if(data=='success'){
						  alert("保存成功");

					  }
					  else{
						  alert("请稍后重试");
					  }
				  },
				  error:function(data){
					  
				  }
					  
			  });
			}
		   else{
			 alert("您编辑的内容为空，请检查后重试！！")
		   }
		
	}
	function reset(){
		ue.reset();
	}
	
</script>
</html>