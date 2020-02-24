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
<link rel="stylesheet" href="/res/index.css">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
/* table {
	table-layout: fixed;
	word-break: break-all;
}
 */
/*  div { width: 800px; padding: 5px; line-height: 180%; } */
.imgg {
	width: 250px;
	height: auto;
}

.pl {
	width: 220px;
	heigjt: 280px;
}
</style>

<title>히히걸즈</title>
<style>
.pl {
	margin: 10px;
}
</style>
</head>
<body>
	<%@ include file="nav.jsp"%>
	<div class="container">
		<c:forEach var="p" items="${product}">
			<c:if test="${p.category.id ==idd }">
				<div class="pl">
					<table>
						<tr>
							<td><a href="/guest/productdetail/${p.id}"><img
									src="/images/${p.image_url}" class="imgg"></a></td>
						</tr>
						<tr>
							<td><a href="/guest/productdetail/${p.id}"><span
									style="font-size: 13px; color: #585858; font-weight: bold;">${p.name}</span></a></td>
						</tr>
						<tr>
							<td><span style="font-size: 11px; color: #999999;">${p.description}</span></td>
						</tr>
						<tr>
							<td style="font-size: 12px; color: #333333; font-weight: bold;"><label>상품가:</label><span><fmt:formatNumber
										value="${p.price}" pattern="###,###,###" />원</span></td>
						</tr>
						<tr>
							<td style="font-size: 12px; color: #333333; font-weight: bold;"><label>할인가:</label><span><fmt:formatNumber
										value="${p.price-(p.price*p.discount)/100}" pattern="###,###,###" />원</span></td>
						</tr>
					</table>
				</div>
			</c:if>
		</c:forEach>
	</div>
	<br />
	<%@ include file="bottom.jsp"%>
</body>
</html>
