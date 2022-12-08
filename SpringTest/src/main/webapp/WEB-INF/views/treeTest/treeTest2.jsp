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
					
// 					console.log(result);
					
// 					console.log(result[0].codeNm)
					
					$.each(result,function(i,e){
// 						console.log(e);
						var codeNm = e.codeNm;
						var codeId = e.codeId;
						var parentId = e.parentId;
						var codeLvl = e.codeLvl;
						var li = '<li id="'+ codeId +'"><img src="${pageContext.request.contextPath }/resources/jquery-treeview-master/images/file.gif">'+codeNm+'</li>';
						
						 if(parentId == null) {
							 	li = '<li id="'+ codeId +'"><img src="${pageContext.request.contextPath }/resources/jquery-treeview-master/images/file.gif">'+codeNm+'</li>';
								$("#codeList").append(li);

								} else {
// 									console.log("들어옴?")
								var parentLi = $("li[id='"+ parentId +"']");
									  var div = '<div onclick=myclick(this) class="hitarea expandable-hitarea"></div>'	
									  parentLi.addClass("expandable")
									  
// 									  console.log(parentLi.find("div"));
									  if(parentLi.find("div").length == 0){
// 										  console.log("들어왔어?")
										  parentLi.append(div);	
										  
									  }

// 									  if(parentLi.find("img").length == 1){
									      parentLi.children("img").attr("src","${pageContext.request.contextPath }/resources/jquery-treeview-master/images/folder.gif");
										  
// 									  }
									  
								      var bUl = parentLi.children("ul");
									
// 								     console.log(bUl) 
							   // 하위 그룹이 없으면 li로 추가

								      // 하위 그룹이 있으면 ul로 추가

								      if(bUl.length == 0) {
								          li = "<ul style='display : none;'>" + li + "</ul>";
											
// 											console.log("파일4 들어옴?? " + li)
								          parentLi.append(li);

								      } else {
								    	  
// 								    	  console.log(bUl.find("li"))
								    	  
// 										 bUl.find("li").last().removeClass("last"); 
										 bUl.append(li);
								      }
							  }
					})
				
					
					
					// <li class="closed expandable lastExpandable">   
					// <div class="hitarea closed-hitarea expandable-hitarea lastExpandable-hitarea">
					
				
					var ulArr = $("ul li:last-child");
					console.log(ulArr)
					for(let i = 0; i < ulArr.length; i++){
						console.log(ulArr[i]);
						
						if($(ulArr[i]).find("div").length != 0){
							console.log("이제 들어오겠네  ㅋㅋ ")
							$(ulArr[i]).attr("class","closed expandable lastExpandable");
							$(ulArr[i]).children("div").attr("class","hitarea closed-hitarea expandable-hitarea lastExpandable-hitarea");
														
						}else{
							$(ulArr[i]).addClass("last");
							
						}
						
					}	
				
				} 
					
				
			})
			
			
			
			
			$("#codeList").treeview();
			
			
			
			
		});
		
		function myclick(a){
			

			
			var myul = $(a).parent().children("ul");
			if(myul.css("display")=="none"){
				myul.css("display","block");
				
				
			}else{
				myul.css("display","none");
				
				
			}
			
			if($(a).attr("class") == "hitarea expandable-hitarea"){
				$(a).attr("class", "hitarea collapsable-hitarea")
				return;
			}
	
			if($(a).attr("class") == "hitarea collapsable-hitarea"){
				
				$(a).attr("class", "hitarea expandable-hitarea")
				return;
			}
			
			
			// <li class="closed expandable lastExpandable">   
			// <div class="hitarea closed-hitarea expandable-hitarea lastExpandable-hitarea">
			
			
			
			if($(a).attr("class") == "hitarea closed-hitarea expandable-hitarea lastExpandable-hitarea"){
				$(a).attr("class", "hitarea closed-hitarea collapsable-hitarea lastCollapsable-hitarea")
				$(a).parent().attr("class","closed collapsable lastCollapsable");
				return;
			}
			
			if($(a).attr("class") == "hitarea closed-hitarea collapsable-hitarea lastCollapsable-hitarea"){
				$(a).attr("class", "hitarea closed-hitarea expandable-hitarea lastExpandable-hitarea")
				$(a).parent().attr("class","closed expandable lastExpandable");
				return;
				
				
			}
			
			
		}
		
		
		
		
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