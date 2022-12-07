<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>

	<meta charset="UTF-8"/>
	<title>jQuery treeview</title>

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/jquery-treeview-master/jquery.treeview.css"/>
<!--     <link rel="stylesheet" href="/red-treeview.css" /> -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/jquery-treeview-master/demo/screen.css" />

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/jquery-treeview-master/demo/jquery.cookie.js"></script>
	<script src="${pageContext.request.contextPath }/resources/jquery-treeview-master/jquery.treeview.js" type="text/javascript"></script>

	<script type="text/javascript">
		$(function() {
			$("#brow").treeview();
		});
	</script>

	</head>
	<body>

	<h1 id="banner"><a href="http://bassistance.de/jquery-plugins/jquery-plugin-treeview/">jQuery Treeview Plugin</a> Demo</h1>
	<div id="main">

	<h4>Sample 1 - default</h4>
	<ul id="brow" class="filetree">
		<li><img src="${pageContext.request.contextPath }/resources/jquery-treeview-master/images/folder.gif" /> 
			<ul>
				<li>blabla <img src="../images/file.gif" /></li>
			</ul>
		</li>
		<li><img src="${pageContext.request.contextPath }/resources/jquery-treeview-master/images/folder.gif" />
			<ul>
				<li><img src="${pageContext.request.contextPath }/resources/jquery-treeview-master/images/folder.gif" />
					<ul id="folderdsfsd21">
						<li><img src="${pageContext.request.contextPath }/resources/jquery-treeview-master/images/file.gif" />text1</li>
						<li><img src="${pageContext.request.contextPath }/resources/jquery-treeview-master/images/file.gif" />text2</li>
					</ul>
				</li>
				<li><img src="${pageContext.request.contextPath }/resources/jquery-treeview-master/images/file.gif" /></li>
			</ul>
		</li>
		<li class="closed">this is closed! <img src="${pageContext.request.contextPath }/resources/jquery-treeview-master/images/folder.gif" />
			<ul>
				<li><img src="${pageContext.request.contextPath }/resources/jquery-treeview-master/images/file.gif" /></li>
			</ul>
		</li>
		<li><img src="${pageContext.request.contextPath }/resources/jquery-treeview-master/images/file.gif" /></li>
	</ul>

</div>

</body>
</html>