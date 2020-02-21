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
<style>
table {
	table-layout: fixed;
	word-break: break-all;
}
</style>

<title>히히걸즈</title>
</head>
<body>
	<%@ include file="nav.jsp"%>
	<div class="container">
		<form:form method="get" modelAttribute="pagination"
			class="form-inline mb5">
			<form:hidden path="pg" value="1" />
			<form:select path="ob" class="form-control autosubmit"
				itemValue="value" itemLabel="label" items="${ orderBy }" />
			<form:select path="sb" class="form-control ml20" itemValue="value"
				itemLabel="label" items="${ searchBy }" />
			<form:input path="st" class="form-control" placeholder="검색문자열" />
			<button type="submit" class="btn btn-default">
				<i class="glyphicon glyphicon-search"></i> 검색
			</button>
			<c:if test="${ pagination.sb > 0 || pagination.ob > 0}">
				<a class="btn btn-default" href="boardlist?pg=1"> <i
					class="glyphicon glyphicon-ban-circle"></i> 검색취소
				</a>
			</c:if>
			<div class="pull-right">
				<span>페이지 크기:</span>
				<form:select path="sz" class="form-control autosubmit">
					<form:option value="10" />
					<form:option value="15" />
					<form:option value="30" />
				</form:select>
			</div>
		</form:form>

		<div class="col-xs-12" style="margin: 15px auto;">
			<label style="font-size: 20px;"><span
				class="glyphicon glyphicon-list-alt"></span>게시글 목록</label> <a
				class="btn btn-primary btn-sm" style="float: right;"
				href="${R}user/board">글쓰기</a>
		</div>
		<div class="col-xs-12">
			<table class="table table-hover">
				<tr>
					<th>Title</th>
					<th>Writer</th>
					<th>Date</th>
				</tr>
				<c:forEach var="l" items="${list}">
					<tr>
						<td><a style="color: black; cursor: pointer"
							href="${R}user/boarddetail/${l.id}">${l.title}</a></td>
						<td>${l.user.name}</td>
						<td><fmt:formatDate value="${l.created_date}"
								pattern="yyyy.MM.dd HH:mm:ss" /></td>
					</tr>
				</c:forEach>
			</table>
			<my:pagination pageSize="${ pagination.sz }"
				recordCount="${ pagination.recordCount }" queryStringName="pg" />
		</div>


	</div>
	<%@ include file="bottom.jsp"%>
</body>
</html>
