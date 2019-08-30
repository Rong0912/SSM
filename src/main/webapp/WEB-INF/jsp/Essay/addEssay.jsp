<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/frontResource/css/list.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/frontResource/css/home.css">
<link href="${pageContext.request.contextPath}/frontResource/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/frontResource/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/frontResource/JS/other/jquery.caret.min.js"></script>
<

<!--富文本编辑器	 -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.6/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.6/summernote.js"></script>


<script type="text/javascript" src="${pageContext.request.contextPath}/frontResource/JS/Essay/EssayAjax.js"></script>
<style type="text/css">
	#editor {
		background-color: #fff;
	}
</style>

<title>Add Essay --Answer</title>
</head>
<body>

	<%@ include file="/WEB-INF/staticSource/header.jsp"%>

	<div class="container">
		<br>
		<br>
		<br>
		<div class="form-group">
			<%--@declare id="inputtile"--%><label for="InputTile">随笔标题：</label>
			<input type="text" class="form-control" name="essayTitle" id="essayTitle" placeholder="标题" value=""
				   required>
		</div>
		<div class="form-group">
			<textarea style="display: none" class="form-control" rows="8"  name="essayContent" id="essayContent"  required>
			</textarea>
			<div style="padding: 5px 0; color:#999999">随笔正文：</div>
			<div id="editor">
			</div>

			<script type="text/javascript">
                $(document).ready(function() {
                    $('#editor').summernote({
                        height: 300,                 // set editor height
                        minHeight: 100,             // set minimum height of editor
                        maxHeight: 800,             // set maximum height of editor
                        focus: false                  // set focus to editable area after initializing summernote
                    });
                });
			</script>
		</div>
		<%--<div class="form-group">
			<textarea id="demo1" class="form-control tag-editor-hidden-src " rows="1" readonly="readonly"
					  style="display: block;"></textarea>
		</div>--%>
		<%--<script>
			$('#demo1').tagEditor({
				autocomplete: {
					delay: 0, // show suggestions immediately
					position: { collision: 'flip' }, // automatic menu position up/down
					source: '/YourAnswer/api/Topic',
				},
				forceLowercase: false,
				placeholder: '选择相关话题标签'
			});
		</script>
--%>
		<div>
			<span id="addEssayMessage" class="text-left text-danger"></span>
		</div>
		<button id="addEssayBtn" class="btn btn-default">提交</button>

	</div>
	
	<%@ include file="/WEB-INF/staticSource/footer.jsp"%>


</body>
</html>