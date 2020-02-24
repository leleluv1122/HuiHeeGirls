<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<!-- check box -->
<script src="/resources/jquery/jquery-3.3.1.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>주문 페이지</title>
<style>
table {
	table-layout: fixed;
	word-break: break-all;
	width: 90%;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

td {
	text-align: center;
	font-size: 12px;
	color: #333333;
	font-weight: bold;
}

.imgg {
	width: 130px;
	height: auto;
}
</style>
</head>
<body>
	<%@ include file="nav.jsp"%>
	<div class="container">
		<table style="width: 80%">
			<colgroup>
				<col width="20%" />
				<col width="20%" />
				<col width="20%" />
				<col width="20%" />
				<col width="20%" />
			</colgroup>
			<thead>
				<tr>
					<th>상품이미지</th>
					<th>상품정보</th>
					<th>색상</th>
					<th>수량</th>
					<th>합계</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<c:forEach var="b" items="${basket}">
						<c:if test="${b.id == id}">
							<td><img src="/images/${b.product.image_url}" class="imgg"></td>
							<td>${b.product.name}</td>
							<td>${b.color.color}</td>
							<td>${b.count}</td>
							<td><span><fmt:formatNumber
										value="${(b.product.price-(b.product.discount*b.product.price)/100)* b.count}"
										pattern="###,###,###" />원</span></td>
						</c:if>
					</c:forEach>
				</tr>
			</tbody>
		</table>

	</div>
	<%@ include file="bottom.jsp"%>
</body>
</html>