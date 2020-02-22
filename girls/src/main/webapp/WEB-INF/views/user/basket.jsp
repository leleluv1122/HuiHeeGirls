<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

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
<link rel="stylesheet" href="${R}res/index.css">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
table {
	table-layout: fixed;
	word-break: break-all;
}
td {
	margin: 15px;
	line-height: 300%;
	padding-right: 30px;
}
.imgg{
	width:150px;
	height:auto;
}
</style>

<title>히히걸즈</title>
</head>
<body>
	<%@ include file="nav.jsp"%>
	<sec:authorize access="authenticated">
		<sec:authentication property="user.id" var="currentid" />
	</sec:authorize>
	<div class="container">
		<table>
			<thead>
				<tr>
					<th>이미지</th>
					<th>상품정보</th>
					<th>판매가</th>
					<th>수량</th>
					<th>합계</th>
				</tr>
			</thead>
			<c:forEach var="b" items="${basket}">
				<tbody>
					<tr>
						<td><img src="${b.product.image_url}" class="imgg"></td>
						<td>${b.product.name}</td>
						<td>${b.product.price}</td>
						<td>${b.count}</td>
						<td>-</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</div>
	<%@ include file="bottom.jsp"%>
</body>
</html>
