<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div id="content">

	<c:set value="등록" var="name"></c:set>
	<c:if test="${status eq 'u' }">
		<c:set value="수정" var="name"></c:set>
	</c:if>
	
	<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow"></nav>
	<!-- End of Topbar -->

	<!-- Begin Page Content -->
	<div class="container-fluid">
		<!-- Page Heading -->
		<h1 class="h3 mb-4 text-gray-800">REVIEW ${name }</h1>

		<div class="row">

			<!-- Earnings (Monthly) Card Example -->
			<div class="col-xl-12 col-md-12 mb-12">
				<div class="card border-left-primary shadow h-100 py-2">
					
					<form:form action="/review/insert.do" method="post" id="reviewForm" modelAttribute="reviewVO">
					<c:if test="${status eq 'u' }">
						<input type="hidden" name="reNo" value="${review.reNo }"/>
					</c:if>
					
					<div class="card-header">
						<input type="text" class="form-control" id="reTitle" name="reTitle" value="${review.reTitle }" placeholder="제목을 입력해주세요.">
					</div>
					<div class="card-body">
						<textarea cols="30" class="form-control" rows="10" id="reContent" name="reContent" value="${review.reContent }"></textarea>
					</div>
					
					<div class="form-group">

						<div class="custom-file">
							<label for="inputDescription">파일 선택</label> <input type="file" class="custom-file-input" id="customFile"> <label class="custom-file-label" for="customFile">파일을 선택해주세요</label>
						</div>
					</div>
					
					</form:form>
					
					<div class="row">
						<div class="col-md-10"></div>
						<div class="col-md-2">
							<input type="button" value="${name }" id="formBtn" class="btn btn-info">
							<a href="/review/list.do">
							<input type="button" value="목록" class="btn btn-primary">
							</a>
						</div>
					</div>
				</div>


			</div>
		</div>
	</div>
</div>

<script>
$(function(){
	CKEDITOR.replace("reContent", {
		filebrowserUploadUrl : "${pageContext.request.contextPath}/imageUpload.do"
	})
	
	var formBtn = $("#formBtn"); 
	
	formBtn.on("click",function(){
		if($("#reTitle").val() == null || $("#reTitle").val() == ""){
			alert("제목을 입력해주세요."); 
			$("#reTitle").focus(); 
			return false; 
		}
		
		if($(this).val() == "수정"){
			$("#reviewForm").attr("action", "/review/update.do"); 
		}
		
		$("#reviewForm").submit();
		
		
	})
})

</script>