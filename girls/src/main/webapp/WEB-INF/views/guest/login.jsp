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
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="${R}res/index.css">
<title>로그인</title>
</head>
<body>
	<%@ include file="nav.jsp"%>
	<div class="container">
		<table>
			<tr>

				<td style="width: 85%;">
					<form method="post" action="login_processing">
						<div class="form-group">
							<label>아이디:</label> <input type="text" name="loginId"
								class="form-control w200" />
						</div>
						<div class="form-group">
							<label>비밀번호:</label> <input type="password" name="passwd"
								class="form-control w200" />
						</div>
						<hr />
						<div>
							<button type="submit" class="btn" style="background-color:#F3969A;">
								<span class="glyphicon glyphicon-ok"></span> 로그인
							</button>
						</div>
					</form> <c:if test="${ param.error != null }">
						<div class="mt5">로그인 실패</div>
					</c:if>
				</td>
			</tr>
		</table>

	</div>

	<%@ include file="bottom.jsp"%>
</body>
</html>

