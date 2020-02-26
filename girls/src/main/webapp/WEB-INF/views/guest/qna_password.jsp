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
</style>
<title>비밀번호 입력</title>
</head>
<body>
	<%@ include file="nav.jsp"%>

	<div class="container">

		<form method="post">
			<label>비밀번호 입력:</label> <input type="password" name="password"
				class="form-control w200" /><br />
			<button type="submit" class="btn" style="background-color: #F3969A;">
				<span class="glyphicon glyphicon-ok"></span> 확인
			</button>
		</form>
	</div>
	<br />
	<br />
	<%@ include file="bottom.jsp"%>
</body>
</html>
