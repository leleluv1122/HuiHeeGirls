<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:url var="R" value="/" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet" media="screen">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="${R}res/index.css">
<title>관리자 업로드 페이지</title>
</head>
<body>
	<%@ include file="nav.jsp"%>
	<div class="container">
		<form:form method="post" modelAttribute="product" enctype="multipart/form-data">
			<div class="form-group">
				<label>상품명</label>
				<form:input path="name" class="form-control w200" />
			</div>
			<div class="form-group">
				<label>카테고리</label>
				<form:select path="category" class="form-control w200"
					itemValue="id" itemLabel="title" items="${category}" />
			</div>
			<div class="form-group">
				<label>가격</label>
				<form:input path="price" class="form-control w200" />
			</div>
			<div class="form-group">
				<label>할인율</label>
				<form:input path="discount" class="form-control w200" />
			</div>
			<div class="form-group">
				<label>설명</label>
				<form:input path="description" class="form-control w2h1" />
			</div>
			<div class="form-group">
				<label>메인사진</label>
				<form:input type="file" path="image_url" />
			</div>
			<button type="submit" onclick="return confirm('등록 하시겠습니까?')"
				class="btn" style="background-color: #F3969A;">
				등록
			</button>
		</form:form>
	</div>

	<%@ include file="bottom.jsp"%>
</body>
</html>

