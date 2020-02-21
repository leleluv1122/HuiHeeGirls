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
<link rel="stylesheet" href="res/index.css">

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
</style>
<title>회원정보</title>
</head>
<body>
	<%@ include file="nav.jsp"%>
	<div class="container">
		<table>
			<tr>
				<td><b>이름</b></td>
				<td><sec:authentication property="user.name" /></td>
			</tr>
			<tr>
				<td><b>이메일</b></td>
				<td><sec:authentication property="user.email" /></td>
			</tr>
			<tr>
				<td><b>전화번호</b></td>
				<td><sec:authentication property="user.phone" /></td>
			</tr>
			<tr>
				<td><b>주소</b></td>
				<td><sec:authentication property="user.address" />
				<sec:authentication property="user.address_detail" />
				</td>
			</tr>



		</table>
	</div>
	<%@ include file="bottom.jsp"%>

</body>
</html>
