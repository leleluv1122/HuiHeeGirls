<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
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
<link rel="stylesheet" href="${R}res/index.css">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>QnA</title>
</head>
<body>
	<%@ include file="nav.jsp"%>
	<div class="container">
		<div class="qna">
			<table  class="table table-hover">
				<thead>
					<tr>
						<th>Contents</th>
						<th>Name</th>
						<th>Date</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="q" items="${qnalist}">
						<tr>
							<td><a style="color: black; cursor: pointer"
								href="/guest/qna_password/${q.id}">${q.title.title}</a></td>
							<td>${q.writer}</td>
							<td><fmt:formatDate value="${q.date}"
									pattern="yyyy.MM.dd HH:mm:ss" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<br /><br /><br />
	<%@ include file="bottom.jsp"%>
</body>
</html>