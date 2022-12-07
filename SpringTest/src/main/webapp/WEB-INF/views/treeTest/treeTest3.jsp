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
			
			$.ajax({
				type : 'get',
				url : '/getData',
				contentType : 'application/json; charset=utf-8',
				success : function(result){
					
					console.log(result);
					
					console.log(result[0].codeNm)
					
					$.each(result,function(i,e){
						console.log(e);
						var codeNm = e.codeNm;
						var codeId = e.codeId;
						var parentId = e.parentId;
						var codeLvl = e.codeLvl;
						var li = '<li id="'+ codeId +'"><img src="${pageContext.request.contextPath }/resources/jquery-treeview-master/images/file.gif"></li>';
						
						 if(parentId == null) {

								$("#codeList").append(li);

								} else {
									console.log("들어옴?")
								var parentLi = $("li[id='"+ parentId +"']");
								      parentLi.find("img").attr("src","${pageContext.request.contextPath }/resources/jquery-treeview-master/images/folder.gif");

								      var bUl = parentLi.find("ul");

							   // 하위 그룹이 없으면 li로 추가

								      // 하위 그룹이 있으면 ul로 추가

								      if(bUl.length == 0) {

								          li = "<ul>" + li + "</ul>";

								          parentLi.append(li);

								      } else {


								         bUl.append(li);
								      }
							  }
					})
				} 
					
				
			})
			
			$("#codeList").treeview();
		});
		
		
		
		
	</script>

	</head>
	<body>

	<h1 id="banner"><a href="http://bassistance.de/jquery-plugins/jquery-plugin-treeview/">jQuery Treeview Plugin</a> Demo</h1>
	<div id="main">

	<h4>Sample 1 - default</h4>
	
	<ul id="codeList" class="filetree treeview">
	

	</ul> 


</div>

</body>
</html>