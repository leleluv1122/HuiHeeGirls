<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="res/index.css">
<style>
.error {
	color: red;
}

table {
	table-layout: fixed;
	word-break: break-all;
}
</style>
<title>게시글 작성</title>
</head>
<body>
	<%@ include file="nav.jsp"%>
	<div class="container">
		<table>
			<tr>
				<td style="width: 85%;">
					<h1>글작성</h1>
					<hr /> 
					<form:form method="post" modelAttribute="board">
						<div class="form-group">
							<label>제목:</label>
							<form:input path="title" class="form-control w200" />
						</div>
						<div class="form-group">
							<!-- <label>작성자:</label> -->
							<%-- <sec:authorize access="not authenticated">
								<form:input type="hidden" path="user" value="0" readonly="true"  class="form-control w200" />
							</sec:authorize>  --%>
							<sec:authorize access="authenticated">
								<sec:authentication property="user.id" var="currentid" />
								<form:input type="hidden" path="user" value="${currentid}" readonly="true" class="form-control w200" />
							</sec:authorize>
						</div>
						<div class="form-group">
							<label>내용:</label>
							<form:input path="detail" class="form-control w200" />
						</div>
						<button type="submit" style="background-color:#F3969A;" onclick="return confirm('작성 하시겠습니까?')"
							class="btn">작성</button>
					</form:form>
				</td>
			</tr>
		</table>

	</div>
	<%@ include file="bottom.jsp"%>
</body>
</html>
