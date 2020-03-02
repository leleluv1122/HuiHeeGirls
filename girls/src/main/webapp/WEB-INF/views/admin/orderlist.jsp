<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:url var="R" value="/" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>회원 주문내역</title>
</head>
<body>
	<%@ include file="nav.jsp"%>
	<div class="container">
		<table class="table table-hover">
			<colgroup>
				<col width="18%" />
				<col width="18%" />
				<col width="18%" />
				<col width="*" />
			</colgroup>
			<thead>
				<tr>
					<th>주문번호</th>
					<th>총금액</th>
					<th>고객번호</th>
					<th>주문상태</th>
				</tr>
			</thead>
			<tbody>
				<form:form method="post" modelAttribute="orders">
					<c:forEach var="o" items="${order}">


						<tr>
							<td><a href="#">${o.id}</a></td>
							<!-- /admin/orderdetail/${o.id} -->
							<td><span><fmt:formatNumber value="${o.amount}"
										pattern="###,###,###" /></span></td>
							<td>${o.user.id }</td>

							<c:if test="${o.status.id == '3'}">
								<td>${o.status.name}</td>
							</c:if>
							<c:if test="${o.status.id != '3'}">
								<form:hidden path="rid" value="${o.rid}" />
								<td><form:select path="status" class="form-control w200"
										itemValue="id" itemLabel="name" items="${status}" />
									<button type="submit" class="btn btn-dark"
										onclick="return confirm('배송상태를 변경하시겠습니까?')">변경</button></td>

							</c:if>
							<%-- <td>${o.status.name }</td> --%>

						</tr>
					</c:forEach>


				</form:form>
			</tbody>
		</table>


	</div>
	<%@ include file="bottom.jsp"%>
</body>
</html>