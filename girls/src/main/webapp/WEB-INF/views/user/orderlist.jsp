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
<title>주문 내역 조회</title>
<style>
.orderInfo {
	border: 5px solid #eee;
	padding: 10px 20px;
	margin: 20px 0;
}

.orderInfo span {
	font-size: 18px;
	font-weight: bold;
	display: inline-block;
	width: 90px;
}
</style>
</head>
<body>
	<%@ include file="nav.jsp"%>
	<div class="container">

		<c:choose>
			<c:when test="${count == 0 }">
				<br /><br /><br />
				<label>주문내역이 없습니다</label>
				<br /><br /><br />
			</c:when>
			<c:otherwise>
				<c:forEach var="o" items="${ord}">
					<sec:authorize access="authenticated">
						<sec:authentication property="user.id" var="currentId" />
						<c:if test="${currentId == o.user.id }">
							<div class="orderInfo">

								<p>
									<span>주문번호</span><a href="/user/orderdetail/${o.id}">${o.id}</a>
								</p>
								<p>
									<span>수령인</span>${o.orderRec}</p>
								<p>
									<span>주소</span>[${o.userAddr1}] ${o.userAddr2} ${o.userAddr3}
								</p>
								<p>
									<span>가격</span>
									<fmt:formatNumber value="${o.amount}" pattern="###,###,###" />
									원
								</p>
								<p>
									<span>주문상태</span>${o.status.name}</p>
								<a href="/user/ordercancle/${o.rid}" class="btn btn-dark" 
								onclick="if(!confirm('주문을 취소 하시겠습니까?')){return false;}">주문취소</a>
								<%-- <a href="/user/orderdetail/${o.id}">주문 상세..음모라써</a> --%>
							</div>
						</c:if>
					</sec:authorize>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
	<%@ include file="bottom.jsp"%>
</body>
</html>