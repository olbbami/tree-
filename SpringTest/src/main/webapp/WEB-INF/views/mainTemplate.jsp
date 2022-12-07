<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>REVIEW</title>

  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/sb-admin/vendor/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/sb-admin/css/sb-admin-2.min.css">
  <script src="${pageContext.request.contextPath }/resources/plugins/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>
</head>

<body id="page-top">
<div id="wrapper">
		<tiles:insertAttribute name="header" />
	  <div id="content-wrapper" class="d-flex flex-column">
	  	<div id="content">
			<tiles:insertAttribute name="content" /> 
		</div>	
		<tiles:insertAttribute name="footer"/>
	  </div>
</div>

<script src="${pageContext.request.contextPath }/resources/sb-admin/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/sb-admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/sb-admin/vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/sb-admin/js/sb-admin-2.min.js"></script>
</body>
</html>
