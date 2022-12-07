<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="content">
	<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow"></nav>
	<!-- End of Topbar -->

	<!-- Begin Page Content -->
	<div class="container-fluid">
		<!-- Page Heading -->
		<h1 class="h3 mb-4 text-gray-800">REVIEW</h1>

		<div class="row">

			<!-- Earnings (Monthly) Card Example -->
			<div class="col-xl-12 col-md-12 mb-12">
				<div class="card border-left-primary shadow h-100 py-2">
					<div class="card-header">
						${reviewVo.reTitle }
						<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">${reviewVO.reWriter } ${reviewVO.reDate } ${reviewVO.reHit }</div>
					</div>
					<div class="card-body">${reviewVo.reContent }</div>
					<div class="row">
						<div class="col-md-10"></div>
						<div class="col-md-2">
							<button type="button" id="updateBtn" class="btn btn-info">수정</button>
							<button type="button" id="delBtn" class="btn btn-danger">삭제</button>
							<button type="button" id="listBtn" class="btn btn-primary">목록</button>
						</div>
					</div>
				</div>

			</div>
			
			<form action="/review/update.do" method="get" id="nFrm">
				<input type="hidden" name="reNo" value="${reviewVO.reNo }"/> 
			</form>
			
		</div>
	</div>
</div>

<script>
$(function(){
	var nFrm = $("#nFrm");
	var listBtn = $("#listBtn");
	var updateBtn = $("#updateBtn"); 
	var delBtn = $("#delBtn"); 
	
	listBtn.on("click", function(){
		location.href = "/review/list.do";
	})
	
	updateBtn.on("click", function(){
		nFrm.submit();
	})
	
	delBtn.on("click", function(){
		if(confirm("정말로 삭제하시겠습니까?")){
			nFrm.attr("method", "post");
			nFrm.attr("action","/review/delete.do");
			nFrm.submit(); 
		}else{
			nFrm.reset(); 
		}
	})
})
</script>