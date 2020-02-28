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
<title>문의하기</title>
</head>
<body>
	<%@ include file="nav.jsp"%>

	<div class="container">
		<form:form method="post" modelAttribute="product_qna" autocomplete="off">
			<div class="form-group">
				<form:hidden path="product" value="${idd}" />
			</div>
			<br />
			<div class="form-group">
				<label>제목</label>
				<form:select path="title" class="form-control w200" itemValue="id"
					itemLabel="title" items="${qna_title}" required="required" />
			</div>
			<div class="form-group">
				<label>작성자</label>
				<sec:authorize access="authenticated">
					<sec:authentication property="user.name" var="current_name" />
					<form:input path="writer" value="${current_name}" readonly="true" />
				</sec:authorize>
				<sec:authorize access="not authenticated">
					<form:input path="writer" class="form-control w200" required="required" />
				</sec:authorize>
				<form:errors path="writer" class="error" />
			</div>
			<div class="form-group">
				<label>내용</label>
				<form:input path="detail" class="form-control w2h1" required="required" />
				<form:errors path="detail" class="error" />
			</div>
			<div class="form-group">
				<label>비밀번호</label>
				<form:password path="password" class="form-control w200" required="required" />
				<form:errors path="password" class="error" />
			</div>

			<button type="submit" onclick="return confirm('작성하시겠습니까?')"
				class="btn btn-dark">
				<i class="glyphicon glyphicon-pencil" style="padding-right: 3px;"></i>작성
			</button>
		</form:form>
	</div>
	<%@ include file="bottom.jsp"%>
</body>
</html>
