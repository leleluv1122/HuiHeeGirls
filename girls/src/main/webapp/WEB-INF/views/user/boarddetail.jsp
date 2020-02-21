<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
</style>

<title>게시글 상세페이지</title>
</head>
<body>
	<%@ include file="nav.jsp"%>
	<div class="container">
		<div class="col-xs-12" style="margin: 15px auto;">
			<label style="font-size: 20px;"><span
				class="glyphicon glyphicon-list-alt"></span>게시글 상세</label>
		</div>
		<table style="width: 100%;">
			<colgroup>
				<col width="20%" />
				<col width="*" />
			</colgroup>
			<c:forEach var="board" items="${board}">
				<tr>
					<td style="background-color: #f2f9ff; text-align: center;">제목</td>
					<td style="background-color: #f2f9ff;">${board.title }</td>
				</tr>
				<tr>
					<td style="text-align: center;">작성자</td>
					<td>${board.user.name }</td>
				</tr>
				<tr>
					<td style="background-color: #f2f9ff; text-align: center;">시간</td>
					<td style="background-color: #f2f9ff;"><fmt:formatDate
							value="${board.created_date}" pattern="yyyy.MM.dd HH:mm:ss" /></td>
				</tr>
				<tr>
					<td style="text-align: center;">내용</td>
					<td>${board.detail }</td>
				</tr>
			</c:forEach>
		</table>
		<div id="buttons">
			<a class="btn btn-default" href="/guest/boardlist?${ pagination.queryString }">
				<i class="glyphicon glyphicon-list"></i> 목록으로
			</a>
			<br />
			<br />
		</div>
	<br />

	</div>
	<%@ include file="bottom.jsp"%>
</body>
</html>
