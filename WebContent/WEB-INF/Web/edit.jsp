<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"
	scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${path}/assests/CSS/commom.css">
<script type="text/javascript" charset="utf-8"
	src="${path}/assests/JS/ueditor1_4_3_3-utf8-jsp/utf8-jsp/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${path}/assests/JS/ueditor1_4_3_3-utf8-jsp/utf8-jsp/ueditor.all.js"></script>
<!-- 手动加载语言 -->
<script type="text/javascript" charset="utf-8"
	src="${path}/assests/JS/ueditor1_4_3_3-utf8-jsp/utf8-jsp/lang/zh-cn/zh-cn.js"></script>

</head>
<body style="text-align: center; margin: 0; background: #454545;">
	<div class="wrapper"
		style="background-color: #dde1e5; position: relative;">
		<div class="content">
			<span>题目:<input type="text" id="title" name="title"
				style="width: 760px;"></span><br> <span>标签:<input
				type="text" id="tag" name="tag" style="width: 760px;"></span>
			<div id="container"
				style="min-height: 320px; width: 800px; margin: 0 auto;"></div>
			<input type="button" value="提交" onclick="return show()">
			<input type="button" value="重置" onclick="">
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
			});
	
	
</script>
</html>