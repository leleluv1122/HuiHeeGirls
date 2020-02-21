<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<!-- <link rel="stylesheet" href="/res/index.css"> -->

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
table {
	table-layout: fixed;
	word-break: break-all;
}

.imgg {
	width: 200px;
	height: auto;
}
</style>

<title>히히걸즈</title>
</head>
<body>
	<%@ include file="nav.jsp"%>
	<div class="container">
		<c:forEach var="p" items="${product}">
			<c:if test="${p.category.id ==idd }">
				<table>
					<tr>
						<td><img src="/images/${p.image_url}" class="imgg"></td>
					</tr>
					<tr>
						<td>${p.name}</td>
					</tr>
					<tr>
						<td>가격:</td>
						<td><fmt:formatNumber value="${p.price}"
								pattern="###,###,###" /></td>
						<td>색상:</td>
						<td>${p.color}</td>
					</tr>

				</table>
			</c:if>
		</c:forEach>
	</div>
	<%@ include file="bottom.jsp"%>
</body>
</html>
