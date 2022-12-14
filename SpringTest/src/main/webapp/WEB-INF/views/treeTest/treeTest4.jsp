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
	
	.mymenu:hover {
	  background: #CE93D8;
	  border-left: 3px solid #9C27B0;
	}
	#codeList span{
		font-size : 15px;
	}
	
	.filetree li { padding: 3px 0 15px 16px; }
	
	#mycontent{
		display : inline-block;
	}
	
	
	
	#contextmenu {
	text-align: left;
	}

	.modal.modal-overlay {
		width: 100%;
		height: 100%;
		position: absolute;
		left: 0;
		top: 0;
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		background: rgba(255, 255, 255, 0.25);
		box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
		backdrop-filter: blur(1.5px);
		-webkit-backdrop-filter: blur(1.5px);
		border-radius: 10px;
		border: 1px solid rgba(255, 255, 255, 0.18);
	}
	
	.modal .modal-window {
		background: rgba(69, 139, 197, 0.70);
		box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
		backdrop-filter: blur(13.5px);
		-webkit-backdrop-filter: blur(13.5px);
		border-radius: 10px;
		border: 1px solid rgba(255, 255, 255, 0.18);
		width: 400px;
		height: 500px;
		position: relative;
		top: -100px;
		padding: 10px;
	}
	
	.modal .title {
		padding-left: 10px;
		display: inline;
		text-shadow: 1px 1px 2px gray;
		color: white;
	}
	
	.modal .title h2 {
		display: inline;
	}
	
	.modal .close-area {
		display: inline;
		float: right;
		padding-right: 10px;
		cursor: pointer;
		text-shadow: 1px 1px 2px gray;
		color: white;
	}
	
	.modal .content {
		margin-top: 20px;
		padding: 0px 10px;
		text-shadow: 1px 1px 2px gray;
		color: white;
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
						console.log(e);
						// ????????????????????? ??? ???????????????, ????????????????????? ??? ?????????????????? ????????? codeId, parentId??? ??????????????? ???????????? ?????? ????????? ????????? ?????? ????????? ????????? 
						if(e.empId == null){
							var codeId = e.deptId;
							var codeNm = e.deptName;
							var parentId = e.parentId;
						}else{
							var codeNm = e.empName;
							var codeId = e.empId;
							var parentId = e.deptId;
						}
						
// 						var codeLvl = e.codeLvl;
						var li = '<li onselectstart="return false" ondragstart="return false" id="'+ codeId +'"><img style="display : none;" src="${pageContext.request.contextPath }/resources/jquery-treeview-master/images/file.gif"><img width="15" height="14" src="${pageContext.request.contextPath }/resources/dist/img/avatar.png"><span onclick="oneclick(this)">'+codeNm+'</span></li>';
						
						// ?????? ????????? ???????????? li?????????????????? ?????? ??????, ???????????? ????????? ???????????? li??? ???????????? ?????? ??????????????? ????????? ?????? ????????? ???????????? ?????? ????????? ???????????? ????????? ???????????? ????????? ??????? ?????? ???????????? 
						
						 if(parentId == null) { // ????????? ?????? li????????? 
								$("#codeList").append(li);
																
						 		
						 		
						 
								} else {  // ????????? ?????? li???????????? else?????? ????????? 
								var parentLi = $("li[id='"+ parentId +"']");
									  var div = '<div onclick=myclick(this) class="hitarea expandable-hitarea"></div>'	
									  parentLi.addClass("expandable")
									  
									  // ?????? ?????? li???????????? ?????????????????? div????????? ??? ???????????? ?????? ??? ?????? (find?????? ????????? ?????? ???????????? ?????? ?????? ????????? div????????? append???????????? ??????) 
									  if(parentLi.find("div").length == 0){
										  parentLi.append(div);	
										  
									  }

										// ??????????????? img?????? ?????? ??? ????????????img????????? ??? ????????? ????????? ???????????? ??? 
									      parentLi.children("img").attr("src","${pageContext.request.contextPath }/resources/jquery-treeview-master/images/folder.gif");
										  parentLi.children("img").css("display","none");	  
									 
									  // ?????? li????????? ????????????(ul)  
								      var bUl = parentLi.children("ul");
									

										
								      if(bUl.length == 0) {
								          li = "<ul style='display : none;'>" + li + "</ul>";
											
								          parentLi.append(li);

								      } else {
								    	  
								    	  
										 bUl.append(li);
								      }
							  }
					})
				
					
					
					// ????????? Ul?????? ??? ????????? li??????????????? ??????????????? ????????? 
					var ulArr = $("ul li:last-child");
					for(let i = 0; i < ulArr.length; i++){
						
						// li?????? ?????? div ????????? ???????????? ???????????????(?????? li????????? ????????????) ?????? ????????? ???????????? ????????? ?????? ??? 
						if($(ulArr[i]).find("div").length != 0){
							$(ulArr[i]).attr("class","closed expandable lastExpandable");
							$(ulArr[i]).children("div").attr("class","hitarea closed-hitarea expandable-hitarea lastExpandable-hitarea");
														
						}else{
							$(ulArr[i]).addClass("last");
							
						}
						
					}	
					
					// ?????? li ???????????? ???????????? ???????????? ?????????  
// 					var liArr = $("li"); 
					
// 					for(let i = 0; i < liArr.length; i++){
// 						liArr[i].addEventListener("dblclick", function(){
// 							console.log("??????");
// 						})
// 					}


		        	// li????????? ????????? ???????????? ???????????? ??? ?????? ????????? ???????????? ??? (?????? ????????? ???????????? ???????????? ?????? ??????)
		        	var liArr2 = $("li");
// 		        	console.log("liArr2 check" + liArr2)
		        	
		        	for(let i = 0; i < liArr2.length; i++){
// 		     				console.log("???????????? ??????"+liArr2[i])
		            		$(liArr2[i]).on("dblclick",function(e){
// 		     				console.log("???????????? ??????(for??? ???)"+liArr2[i])
		             			e.stopPropagation();
		                		$(liArr2[i]).children("div").click();
			        	//  li??? ????????? ?????? ???????????? ajax??? ?????? ????????? ????????? ??????????????? ??????
							if($(liArr2[i]).children("img").attr("src") == "${pageContext.request.contextPath }/resources/jquery-treeview-master/images/file.gif"){
								
								// ????????? ???????????? ???????????? body??? ???????????? ajax ?????? ??????   
								
								var mynode = {
									deptId : $(liArr2[i]).attr("id")
								}
								
								$.ajax({
									type : "post",
									url : "/getTreeData",
									data : JSON.stringify(mynode),
									contentType : "application/json; charset=utf-8",
									dataType : "json",
									success : function(res){
// 										console.log(res);

										str = "<h2>"+res.deptId+"</h2>";
										
										$("#mycontent").html(str);
									}
								})
								
							}	
			        	
			        	
		            		}) // ??????????????? ?????? ????????? ?????? ??? 
		            		
// 		            		$(liArr2[i]).on("dragover",function(e){
		            			
// 		            			e.preventDefault(); 
// 		            			e.stopPropagation();
// 		            		})
	
// 		            		$(liArr2[i]).on("drop",function(e){
		            			
// 		            			e.preventDefault(); 
// 		            			e.stopPropagation();
// 		            			console.log("drop??????")
// 		            		})
		    				
		        		
		        	} // for??? ??? 
		        	
					
		        	
	            	// ???????????? ?????? ????????? ?????? 
	            	var Contextmenu = !function() {
	        			var id = 'contextmenu';
	        			
	        			
	        			{
	        				var div = document.createElement('div');
	        				div.id = id;
	        				div.style = 'display:none;position:fixed;width:150px; height:200px; background: #fff;box-shadow:1px 1px 5px 0 rgba(0, 0, 0, 0.54)';

	        				var hTag1 = "<h2 class='mymenu' id='message'>?????? ?????????</h2>";
	        				var hTag2 = "<h2 class='mymenu' id='work'>?????? ????????????</h2>";
	        				var hTag3 = "<h2 class='mymenu' id='compliment'>????????????</h2>";
	        				$(div).append(hTag1);
	        				$(div).append(hTag2);
	        				$(div).append(hTag3);
							
	        				document.body.appendChild(div);
	        			}
	        			var div = document.getElementById(id);
	        			
	        			
	        			var allLi = document.querySelectorAll("li");
	        			
	        			for(let i = 0; i < allLi.length; i++){
	        				if($(allLi[i]).children("img").attr("src") == "${pageContext.request.contextPath }/resources/jquery-treeview-master/images/file.gif"){
								// ?????? li????????? ??? ????????? ???????????? ????????? ??? ????????? ????????? ???????????? ?????????    
	        					allLi[i].addEventListener("contextmenu",function(e){
	        						e.preventDefault();
									
	        						emp_idVal = $(allLi[i]).attr("id");
	        						
	        						
	        						
	                				var x = e.pageX + 'px';
	                				var y = e.pageY + 'px';
	                				div.style.display = 'block';
	                				div.style.left = x;
	                				div.style.top = y;
	        						
	        					})
	        					
	        				}
	        			}
	        			
	     					document.addEventListener("click",function(e){
	     						div.style.display = 'none'
	     						
	     					})
	        			
	        			
	        		}()  // var Contextmenu ??? 
	        		
	        		
	        		
	        		// ????????? ????????? ?????? ????????? 
//	     			console.log(document.querySelectorAll(".mymenu"));
	            		var hTagArr = document.querySelectorAll(".mymenu")
	            		for(let i = 0; i < hTagArr.length; i++){
	            			hTagArr[i].addEventListener("click",function(){
	            	    		var idVal = $(hTagArr[i]).attr("id"); 
	            				
	            	    		modal = document.getElementById(idVal);
	            	    		console.log("????????? ????????? ??????");
	            	    		console.log($(modal).find("#unique_content"))
	            	    		
	            	    		if(idVal == "message"){
	            	    			
	            	    			var empObj = {
	            	    					empId : emp_idVal
	            	    			}
	            	    			
	            	    			$.ajax({
										type : "post",
										url : "/getEmpData",
										data : JSON.stringify(empObj),
										contentType : "application/json; charset=utf-8",
										dataType : "json",
										success : function(res){
//	 										console.log(res);
			            	    		var myStr = "????????????&nbsp;&nbsp;<input type='text' value='"+res.empName+"' disabled='disabled'/>";
			            	    		$(modal).find("#unique_content").html(myStr);
											
											
										}
									})
	            	    			
	            	    			
	            	    			
	            	    		}
	            	    		
	            	    		closeBtn = modal.querySelector(".close-area")
	            	    		closeBtn.addEventListener("click", e => {
	            		    		modalOff()
	            				}) 	
	            	    		modalOn();
	            			})
	            		}
	        		
	        		
	        		
		        	

					
				} // success  
				
				
 
				
					
				
			}) // ajax ??? 
			
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
					var selected_node = e.node;  // ????????? ??????

					if ( mytree.tree("isNodeSelected", selected_node) ) {  // ????????? ????????? ?????? ??????????????? ?????? ????????????

					mytree.tree("removeFromSelection", selected_node);  // ??????????????? ????????????

					} else {  // ????????? ????????? ??????????????? ?????? ?????? ????????????

					mytree.tree("addToSelection", selected_node);  // ????????? ????????? ??????????????? ???

					}

					}

					);
			
			



  					
        		  
        	
        		
        		
        		// ????????? btn-modal??? ????????? ??? ???????????? ????????? ???????????? ???????????? ???????????? ????????? ????????? ???????????? ?????? ???
        		// ????????? ??? ???????????? ???????????? ????????? ????????? id????????? ?????? onclick=myfunc(this)??? ????????? ????????? ?????? 
        		// ?????? ????????? ????????? ?????? ??????????????? ?????? ????????? ?????? ????????? ??? ??????
        		
        		
        		function modalOn() {
        		    modal.style.display = "flex"
        		}
        		
        		function isModalOn() {
        		    return modal.style.display === "flex"
        		}
        		
        		function modalOff() {
        		    modal.style.display = "none"
        		}
        		
        		
        		
        		
        		
        		
		}); // $(function(){}) ??? 

		
		console.log("????????? ?????? ??????????????? ??????!")
    	console.log($("li"))
    	console.log($("#1"))
		console.log("????????? ?????? ??????????????? ?????????!")
		
		
		
		
		// ?????? ????????? + , - ??? ????????? ????????? ?????? ?????? ??? ???????????? ???????????? ?????? ??????  
		function myclick(a){
			

			
			var myul = $(a).parent().children("ul");
			if(myul.css("display")=="none"){
				myul.css("display","block");
				
				
			}else{
				myul.css("display","none");
				
				
			}
			
			
			//????????? li??????????????? ?????? li???????????? ????????? ?????? ????????? ????????? +, - ??? ??????????????? 
			if($(a).attr("class") == "hitarea expandable-hitarea"){
				$(a).attr("class", "hitarea collapsable-hitarea")
				return;
			}
	
			if($(a).attr("class") == "hitarea collapsable-hitarea"){
				
				$(a).attr("class", "hitarea expandable-hitarea")
				return;
			}
			
			
			
			// ????????? UL?????? ????????? ????????? li??????????????? ????????? ???????????? ????????? ??????????????? ???????????? ?????????
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
		
		
		// window ????????? ????????? 
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
		
		
		
	</script>

	</head>
	<body>

	
	<ul id="codeList" class="filetree treeview"></ul> 

	<div id="mycontent"></div>


<!-- 	<div id="container"> -->
<!-- 		<button id="btn-modal">?????? ??? ?????? ??????</button> -->
<!-- <!-- 		<div id="lorem-ipsum"></div> --> 
<!-- 	</div> -->
	
	<div style="display : none;" id="message" class="modal modal-overlay">
		<div class="modal-window">
			<div class="title">
				<h2>???????????????</h2>
			</div>
			<div id="unique_content"></div>
			<div class="close-area">X</div>
			<div class="content">
				<p>????????????????????? ?????????????????????</p>
				<p>????????????????????? ?????????????????????</p>
				<p>????????????????????? ?????????????????????</p>
				<p>????????????????????? ?????????????????????</p>

			</div>
		</div>
	</div>
	
	<div style="display : none;" id="work" class="modal modal-overlay">
		<div class="modal-window">
			<div class="title">
				<h2>?????? ????????????</h2>
			</div>
			<div id="unique_content"></div>
			<div class="close-area">X</div>
			<div class="content">
				<p>????????????????????? ?????????????????????</p>
				<p>????????????????????? ?????????????????????</p>
				<p>????????????????????? ?????????????????????</p>
				<p>????????????????????? ?????????????????????</p>

			</div>
		</div>
	</div>
	
	<div style="display : none;" id="compliment" class="modal modal-overlay">
		<div class="modal-window">
			<div class="title">
				<h2>????????????</h2>
			</div>
			<div id="unique_content"></div>
			<div class="close-area">X</div>
			<div class="content">
				<p>????????????????????? ?????????????????????</p>
				<p>????????????????????? ?????????????????????</p>
				<p>????????????????????? ?????????????????????</p>
				<p>????????????????????? ?????????????????????</p>

			</div>
		</div>
	</div>




</body>
</html>