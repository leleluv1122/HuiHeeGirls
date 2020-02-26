<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:url var="R" value="/" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.4.1/minty/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4HfFay3AYJnEmbgRzxYWJk/Ka5jIimhB/Fssk7NGT9Tj3rkEChpSxLK0btOGzf2I"
	crossorigin="anonymous">
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
td:nth-child(1) {
	width: 100px;
	height: 50px;
}
</style>
<title>답변</title>
</head>
<body>
	<%@ include file="nav.jsp"%>

	<div class="container">
		<c:forEach var="q" items="${qna}">
			<c:if test="${q.id == idd}">
				<table>
					<tr>
						<td>제목:</td>
						<td>${q.title.title}</td>
					</tr>
					<tr>
						<td>작성자:</td>
						<td>${q.writer}</td>
					</tr>
					<tr>
						<td>작성시간:</td>
						<td><fmt:formatDate value="${q.date}"
								pattern="yyyy.MM.dd HH:mm:ss" /></td>
					</tr>
					<tr>
						<td>내용:</td>
						<td>${q.detail}</td>
					</tr>
				</table>
			</c:if>
		</c:forEach>

	</div>
	<br />
	<br />
	<%@ include file="bottom.jsp"%>
</body>
</html>
