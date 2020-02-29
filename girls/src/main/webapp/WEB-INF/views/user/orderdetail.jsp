<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
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
<link rel="stylesheet" href="${R}res/index.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>주문 내역 상세조회</title>
<style>
.imgg {
	height: 80px;
	width: auto;
}

.order {
	border: 5px solid #eee;
	padding: 10px 20px;
	margin: 20px 0;
}

.order span {
	font-size: 13px;
	display: inline-block;
	align-items: center;
}

table {
	table-layout: fixed;
	word-break: break-all;
}
</style>
</head>
<body>
	<%@ include file="nav.jsp"%>
	<div class="container">
		<table class="table table-hover" style="width: 100%;">
			<colgroup>
				<col width="13%" />
				<col width="33%" />
			</colgroup>
			<thead>
				<tr>
					<th>이미지</th>
					<th>상품명</th>
					<th>판매가</th>
					<th>수량</th>
					<th>처리상태</th>
				</tr>
			</thead>
			<c:forEach var="o" items="${order}">
				<tbody>
					<tr>
						<td><a href="/guest/productdetail/${o.product.id}"><img
								src="/images/${o.product.image_url}" class="imgg"></a></td>
						<td>${o.product.name}<br /> <label>color:
								${o.color.color }</label></td>
						<td><span><fmt:formatNumber
									value="${o.product.price-(o.product.discount*o.product.price)/100}"
									pattern="###,###,###" /></span></td>
						<td>${o.count}</td>
						<c:forEach var="oo" items="${oo}">
							<td>${oo.status.name }<br /> <c:if
									test="${oo.status.id == '3'}">
									<a href="#" class="btn btn-dark">후기작성</a>
								</c:if>
							</td>
						</c:forEach>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</div>
	<%@ include file="bottom.jsp"%>

</body>
</html>