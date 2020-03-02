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
<title>관리자 메인 페이지</title>
<style>
li .page {
	margin: 10px;
	font-size: medium;
}

a   {
	color:black;
}
</style>
</head>
<body>
	<%@ include file="nav.jsp"%>
	<div class="container">
		<h1>관리자 페이지</h1>
		<div class="page">
			<ol style="margin: 10px; font-size: medium;">
				<li><a style="color:black;" href="/admin/upload">상품 업로드</a></li>
				<li><a style="color:black;" href="/admin/orderlist">고객주문 목록</a></li>
			</ol>
		</div>
	</div>
	<br />
	<br />
	<br />
	<%@ include file="bottom.jsp"%>
</body>
</html>