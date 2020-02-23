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
<link rel="stylesheet" href="${R}res/index.css">

<!-- check box -->
<script src="/resources/jquery/jquery-3.3.1.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
}

.imgg {
	width: 150px;
	height: auto;
}
</style>

<title>히히걸즈</title>
</head>
<body>
	<%@ include file="nav.jsp"%>
	<sec:authorize access="authenticated">
		<sec:authentication property="user.id" var="currentid" />
	</sec:authorize>
	<div class="container">

		<table style="">
			<colgroup>
				<col width="5%" />
				<col width="22%" />
				<col width="30%" />
				<col width="15%" />
				<col width="10%" />
				<col width="*" />
			</colgroup>
			<thead>
				<tr>
					<th><input type="checkbox" name="allCheck" id="allCheck" /><label
						for="allCheck"></label> <script>
							$("#allCheck").click(function() {
								var chk = $("#allCheck").prop("checked");
								if (chk) {
									$(".chBox").prop("checked", true);
								} else {
									$(".chBox").prop("checked", false);
								}
							});
						</script></th>
					<th>이미지</th>
					<th>상품정보</th>
					<th>판매가</th>
					<th>수량</th>
					<th>합계</th>
					<th>선택</th>
				</tr>
			</thead>
			<c:forEach var="b" items="${basket}">
				<tbody>
					<tr style="height: 170px;">
						<td><input type="checkbox" name="chBox" class="chBox"
							value="${b.id}" /> <script>
								$(".chBox").click(function() {
									$("#allCheck").prop("checked", false);
								});
							</script></td>
						<td><img src="/images/${b.product.image_url}" class="imgg"></td>
						<td>${b.product.name}</td>
						<td>${b.product.price}</td>
						<td>${b.count}</td>
						<td>-</td>
						<td>
							<button class="btn btn-dark">주문하기</button> <br /> <br />
							<button class="btn">삭제</button>
						</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
		<hr />
		<br /> <br />
		<div style="text-align:center;">
			<button class="btn"
				style="font-size: 16px; width: 140px; height: 40px; background-color: #F3969A;">
				<span class="glyphicon glyphicon-ok" style="margin: 4px;"></span>전체상품주문
			</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button class="btn"
				style="font-size: 16px; width: 140px; height: 40px;">
				<span class="glyphicon glyphicon-check" style="margin: 4px;"></span>선택상품주문
			</button>
			<button type="button" class="btn"
				style="font-size: 16px; width: 140px; height: 40px; background-color: #FFCE67;">
				<span class="glyphicon glyphicon-remove" style="margin: 4px;"></span>
				선택삭제
			</button>
		</div>
		<br /> <br /> <br />
		<hr />


	</div>
	<%@ include file="bottom.jsp"%>
</body>
</html>
