<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<base href="/form1/" />
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
<title>회원가입</title>
</head>
<body>
	<%@ include file="nav.jsp"%>
	<div class="container">
		<table style="margin:20px;">
			<tr>
				<td style="width: 85%;">
					<h1>회원 가입</h1>
					<hr /> <form:form method="post"
						modelAttribute="userRegistrationModel" autocomplete="off">
						<div class="form-group">
							<label>아이디:</label>
							<form:input path="userid" class="form-control w200" />
							<form:errors path="userid" class="error" />
						</div>
						<div class="form-group">
							<label>비밀번호:</label>
							<form:password path="passwd1" class="form-control w200" />
							<form:errors path="passwd1" class="error" />
						</div>
						<div class="form-group">
							<label>비밀번호 확인:</label>
							<form:password path="passwd2" class="form-control w200" />
							<form:errors path="passwd2" class="error" />
						</div>
						<div class="form-group">
							<label>이름:</label>
							<form:input path="name" class="form-control w200" />
							<form:errors path="name" class="error" />
						</div>
						<div class="form-group">
							<label>이메일:</label>
							<form:input path="email" class="form-control w300" />
							<form:errors path="email" class="error" />
						</div>
						<div class="form-group">
							<label>전화번호:</label>
							<form:input path="phone" class="form-control w300" />
							<form:errors path="phone" class="error" />
						</div>
						<div class="form-group">
							<label>주소:</label>
							<form:input path="address" class="form-control w300" />
							<form:errors path="address" class="error" />
						</div>
						<div class="form-group">
							<label>상세주소:</label>
							<form:input path="address_detail" class="form-control w300" />
							<form:errors path="address_detail" class="error" />
						</div>
						<button type="submit" onclick="return confirm('회원가입 하시겠습니까?')"
							class="btn" style="background-color:#F3969A;">
							<i class="glyphicon glyphicon-user"></i> 회원가입
						</button>
					</form:form>
				</td>
			</tr>
		</table>

	</div>
	<%@ include file="bottom.jsp"%>
</body>
</html>
