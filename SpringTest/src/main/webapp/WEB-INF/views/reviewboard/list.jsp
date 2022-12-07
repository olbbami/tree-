<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="content">
	<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow"></nav>
	<!-- End of Topbar -->

	<!-- Begin Page Content -->
	<div class="container-fluid">
		<!-- Page Heading -->
		<h1 class="h3 mb-4 text-gray-800">REVIEW</h1>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
			</div>
			<div class="card-body">
				<div class="row">
					<div class="col-md-9"></div>
					<div class="col-md-3">
						<form id="searchForm" class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
							<input type="hidden" name="page" id="page"/>
							<div class="input-group">
								<select>
									<option <c:if test="${searchType == 'title' }"><c:out value="selected"/></c:if>>제목</option>
									<option <c:if test="${searchType == 'writer' }"><c:out value="selected"/></c:if>>작성자</option>
								</select> <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
								<div class="input-group-append">
									<button class="btn btn-primary" type="button">
										<i class="fas fa-search fa-sm"></i>
									</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:set value="${pagingVO.dataList }" var="reviewList" />
							<c:choose>
								<c:when test="${empty reviewList }">
									<tr>
										<td colspan="5">조회하신 게시글이 존재하지 않습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${reviewList }" var="review">
										<tr>
											<td>${review.reNo }</td>
											<td><a href="/review/detail.do?reNo=${review.reNo }">${review.reTitle }</a></td>
											<td>${review.reWriter }</td>
											<td>${review.reDate }</td>
											<td>${review.reHit }</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					<div class="paging_simple_numbers" id="pagingArea">
						${pagingVO.pagingHTML }
					</div>
				</div>
				<div class="row">
					<div class="col-md-11"></div>
					<div class="col-md-1">
						<button type="button" id="newBtn" class="btn btn-primary">등록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	$(function(){
		var newBtn = $("#newBtn");
		var searchForm = $("#searchForm"); 
		var pagingArea = $("#pagingArea"); 
		
		newBtn.on("click",function(){
			location.href = "/review/form.do";
		})
		
		pagingArea.on("click","a", function(event){
			event.preventDefault(); 
			var pageNo = $(this).data("page"); 
			console.log(pageNo)
			searchForm.find("#page").val(pageNo); 
			searchForm.submit();  
		});  
	})
</script>