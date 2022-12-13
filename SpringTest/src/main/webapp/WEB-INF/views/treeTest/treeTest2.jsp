<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>

	<meta charset="UTF-8"/>
	<title>jQuery treeview</title>

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/jquery-treeview-master/jquery.treeview.css"/>
<!--     <link rel="stylesheet" href="/red-treeview.css" /> -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/jquery-treeview-master/demo/screen.css" />


	<style>
	#codeList{
		display : inline-block;
	
	}
	
	#codeList span{
		font-size : 15px;
	}
	
	.filetree li { padding: 3px 0 15px 16px; }
	
	#mycontent{
		display : inline-block;
	}
	
	</style>


<!-- 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script> -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/jquery-treeview-master/demo/jquery.cookie.js"></script>
	<script src="${pageContext.request.contextPath }/resources/jquery-treeview-master/jquery.treeview.js" type="text/javascript"></script>


	<script type="text/javascript">
	
		$(function() {
			
			$.ajax({
				type : 'get',
				url : '/getData',
				contentType : 'application/json; charset=utf-8',
				success : function(result){
					
					
					
					$.each(result,function(i,e){
						var codeNm = e.codeNm;
						var codeId = e.codeId;
						var parentId = e.parentId;
						var codeLvl = e.codeLvl;
						var li = '<li onselectstart="return false" ondragstart="return false" id="'+ codeId +'"><img style="display : none;" src="${pageContext.request.contextPath }/resources/jquery-treeview-master/images/file.gif"><img width="15" height="14" src="${pageContext.request.contextPath }/resources/dist/img/avatar.png"><span onclick="oneclick(this)">'+codeNm+'</span></li>';
						
						// 일단 각각의 노드들이 li태그요소라고 보면 되고, 처음에는 파일로 간주하여 li를 생성하고 이후 해당태그를 부모로 갖는 노드가 나타나면 해당 태그를 파일에서 폴더로 바꿔주는 느낌의 로직? 또는 알고리즘 
						
						 if(parentId == null) { // 부모가 없는 li요소들 
								$("#codeList").append(li);
																
						 		
						 		
						 
								} else {  // 부모가 있는 li요소들은 else문을 들어감 
								var parentLi = $("li[id='"+ parentId +"']");
									  var div = '<div onclick=myclick(this) class="hitarea expandable-hitarea"></div>'	
									  parentLi.addClass("expandable")
									  
									  // 모든 부모 li요소들은 직계자식으로 div태그를 단 한개씩만 가질 수 있음 (find해서 하나도 찾지 못했다는 것은 해당 태그에 div태그를 append해야함을 의미) 
									  if(parentLi.find("div").length == 0){
										  parentLi.append(div);	
										  
									  }

										// 부모요소의 img자식 태그 중 직계자식img태그만 그 모양을 폴더로 바꿔주면 됨 
									      parentLi.children("img").attr("src","${pageContext.request.contextPath }/resources/jquery-treeview-master/images/folder.gif");
										  parentLi.children("img").css("display","none");	  
									 
									  // 부모 li요소의 직계자식(ul)  
								      var bUl = parentLi.children("ul");
									

										
								      if(bUl.length == 0) {
								          li = "<ul style='display : none;'>" + li + "</ul>";
											
								          parentLi.append(li);

								      } else {
								    	  
								    	  
										 bUl.append(li);
								      }
							  }
					})
				
					
					
					// 각각의 Ul태그 중 마지막 li요소들만을 배열형태로 가져옴 
					var ulArr = $("ul li:last-child");
					console.log(ulArr)
					for(let i = 0; i < ulArr.length; i++){
						console.log(ulArr[i]);
						
						// li요소 안에 div 태그가 하나라도 존재한다면(해당 li요소가 폴더라면) 폴더 밑으로 아무것도 보이지 않게 함 
						if($(ulArr[i]).find("div").length != 0){
							console.log("이제 들어오겠네  ㅋㅋ ")
							$(ulArr[i]).attr("class","closed expandable lastExpandable");
							$(ulArr[i]).children("div").attr("class","hitarea closed-hitarea expandable-hitarea lastExpandable-hitarea");
														
						}else{
							$(ulArr[i]).addClass("last");
							
						}
						
					}	
					
					// 모든 li 요소들에 더블클릭 이벤트를 등록함  
// 					var liArr = $("li"); 
					
// 					for(let i = 0; i < liArr.length; i++){
// 						liArr[i].addEventListener("dblclick", function(){
// 							console.log("까꿍");
// 						})
// 					}


		        	// li중에서 폴더인 녀석들만 더블클릭 시 열고 접히는 이벤트를 줌 (이때 이벤트 버블링을 막아주는 코드 작성)
		        	var liArr2 = $("li");
// 		        	console.log("liArr2 check" + liArr2)
		        	
		        	for(let i = 0; i < liArr2.length; i++){
// 		     				console.log("더블클릭 체크"+liArr2[i])
		            		$(liArr2[i]).on("dblclick",function(e){
// 		     				console.log("더블클릭 체크(for문 안)"+liArr2[i])
		             			e.stopPropagation();
		             			console.log(liArr2[i])
		                		$(liArr2[i]).children("div").click();
			        	//  li중 폴더가 아닌 녀석들은 ajax를 통한 데이터 조회가 가능하도록 작성
							if($(liArr2[i]).children("img").attr("src") == "${pageContext.request.contextPath }/resources/jquery-treeview-master/images/file.gif"){
								
								console.log("파일 폴더 잘 구분해서 들어오는지 체크 :" + liArr2[i])
								// 파일의 데이터를 가져와서 body에 뿌려주는 ajax 코드 작성   
								
								var mynode = {
									codeId : $(liArr2[i]).attr("id")
								}
								
								$.ajax({
									type : "post",
									url : "/getTreeData",
									data : JSON.stringify(mynode),
									contentType : "application/json; charset=utf-8",
									dataType : "json",
									success : function(res){
// 										console.log(res);
										str = "<h2>"+res.codeId+"</h2>";
										
										$("#mycontent").html(str);
									}
								})
								
							}	
			        	
			        	
		            		}) // 더블클릭에 대한 이벤트 설정 끝 
		            		
// 		            		$(liArr2[i]).on("dragover",function(e){
		            			
// 		            			e.preventDefault(); 
// 		            			e.stopPropagation();
// 		            		})
	
// 		            		$(liArr2[i]).on("drop",function(e){
		            			
// 		            			e.preventDefault(); 
// 		            			e.stopPropagation();
// 		            			console.log("drop확인")
// 		            		})
		    				
		        		
		        	} // for문 끝 
		        	


					
				} // success  
				
				
 
				
					
				
			}) // ajax 끝 
			
			var mytree = $("#codeList");
			
            mytree.treeview({
                collapsed: true,
                animated: "medium",
                control:"#sidetreecontrol",
                persist: "location",
                dragAndDrop : true
            });
			
			
			
            	mytree.bind("tree.click",function(e) {

					e.preventDefault();
					var selected_node = e.node;  // 선택된 노드

					if ( mytree.tree("isNodeSelected", selected_node) ) {  // 선택된 노드가 이미 선택되어져 있는 상태라면

					mytree.tree("removeFromSelection", selected_node);  // 선택상태를 해제시킴

					} else {  // 선택된 노드가 선택되어져 있지 않은 상태라면

					mytree.tree("addToSelection", selected_node);  // 선택된 노드를 선택상태로 함

					}

					}

					);
			
			

  
            	
			
		}); // $(function(){}) 끝 
		
		

		
		
		
		// 폴더 클릭시 + , - 가 바뀜고 동시에 안의 폴더 및 파일들이 나타나게 하는 함수  
		function myclick(a){
			

			
			var myul = $(a).parent().children("ul");
			if(myul.css("display")=="none"){
				myul.css("display","block");
				
				
			}else{
				myul.css("display","none");
				
				
			}
			
			
			//마지막 li태그요소가 아닌 li요소들은 아래와 같은 과정을 거쳐서 +, - 를 전환해야함 
			if($(a).attr("class") == "hitarea expandable-hitarea"){
				$(a).attr("class", "hitarea collapsable-hitarea")
				return;
			}
	
			if($(a).attr("class") == "hitarea collapsable-hitarea"){
				
				$(a).attr("class", "hitarea expandable-hitarea")
				return;
			}
			
			
			
			// 각각의 UL태그 중에서 마지막 li태그요소가 마지막 폴더라면 아래와 같은코드를 거치도록 해야함
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
		
		
		// window 객체로 선언함 
		click_history = []; 
		
		function oneclick(a){
			
			click_history.push(a); 	
// 			console.log(click_history)
			
			if(click_history.length == 1){
				$(a).css("background-color","green");
				
			}else{
// 				console.log($(click_history[0]))
				$(click_history[0]).css("background-color","transparent");
				click_history.shift();
				$(a).css("background-color","green");
			}
		}
		
// 		function myclick2(a){
// 			console.log(a)
// 			console.log($(a).attr("id"))
			
// 			console.log($(a).children("img").attr("src"));
			
// 			console.log($(a).find("span").css("background-color"));
			
// 			//자식 중에 클릭된 파일이 있으면 
// 			var check = false;
// 			var arr = $(a).find("span");
// 			for(let i = 0; i < arr.length; i++){
// 				console.log(arr[i]);
// 				console.log(arr[i].style.backgroundColor)
// 				if(arr[i].style.backgroundColor == "green"){
// 					check = true;
// 				}
// 			}
			
// 			if(check){
				
// 				if($(a).children("img").attr("src") == "${pageContext.request.contextPath }/resources/jquery-treeview-master/images/folder.gif"){
// 	 				$(a).children("div").click();
					
// 				}else{
					
// 					return;
// 				}
				
				
// 			}
			
			
// // 			if($(a).find("span").css("background-color") == "rgb(0, 128, 0)"){
// // 				return;				
// // 			}else{ // 그게 아니라면 
// // 				$(a).children("div").click();
				
// // 			}
			
// 		} // myclick2의 끝 
		
		
	</script>

	</head>
	<body>

	<h1 id="banner"><a href="http://bassistance.de/jquery-plugins/jquery-plugin-treeview/">jQuery Treeview Plugin</a> Demo</h1>
	<div id="main">

	<h4>Sample 1 - default</h4>
	
	<ul id="codeList" class="filetree treeview">
	

	</ul> 

	<div id="mycontent"></div>


</div>





</body>
</html>