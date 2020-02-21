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
<!-- <script>
function ShowPrice(){
	  var originPrice = ${p.price}
	  var rate = ${p.discount}
	  var savePrice = originPrice *(rate / 100);
	  var resultPrice = originPrice - savePrice;
</script> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>상품 상세페이지</title>
<style>
.imgg {
	width: 500px;
	height: auto;
	padding: 10px;
}
</style>
</head>

<body>
	<!-- onload="init();" -->
	<%@ include file="nav.jsp"%>
	<div class="container">
		<c:forEach var="p" items="${product}">
			<c:if test="${p.id ==idd }">

				<img src="/images/${p.image_url}" class="imgg">


				<br />
				<br />
				<br />
				<br />
				<span style="font-size: 17px; color: #585858; font-weight: bold;">${p.name}</span>
				<br />
				<br />
				<br />

				<span style="font-size: 11px; color: #999999;">${p.description}</span>
				<br />
				<br />
				<span>소비자가:</span>
				<span style="font-size: 12px; color: #333333; font-weight: bold;"><fmt:formatNumber
						value="${p.price}" pattern="###,###,###" />원</span>
				<br />
				<%-- <span>세일가:</span>
				<span style="font-size: 12px; color: #333333; font-weight: bold;"><fmt:formatNumber
						value="${p.discountPrice }" pattern="###,###,###" />원</span> --%>


				<label>${p.color}</label>
				<br />
				<form:form method="post" modelAttribute="basket">
					<input type="hidden" path="product" value="${p.id}">
					<sec:authorize access="authenticated">
						<sec:authentication property="user.id" var="currentid" />
						<input type="hidden" path="user" value="${currentid}">
					</sec:authorize>
					<select path="count">
						<c:forEach begin="1" end="10" var="i">
							<option value="${i}">${i}</option>
						</c:forEach>
					</select>&nbsp;개
					<br />
					<button style="margin:10;"type="submit" onclick="return confirm('장바구니에 담겠습니까?')"
						class="btn btn-primary">장바구니</button>
				</form:form>
				<a href="${R}guest/productlist/${p.category.id}">목록으로</a>
			</c:if>
		</c:forEach>
	</div>
	<br />
	<%@ include file="bottom.jsp"%>
</body>
</html>












<!-- <script language="JavaScript">
	var sell_price;
	var amount;

	function init() {
		sell_price = document.form.sell_price.value;
		amount = document.form.amount.value;
		document.form.sum.value = sell_price;
		change();
	}

	function add() {
		hm = document.form.amount;
		sum = document.form.sum;
		hm.value++;

		sum.value = parseInt(hm.value) * sell_price;
	}

	function del() {
		hm = document.form.amount;
		sum = document.form.sum;
		if (hm.value > 1) {
			hm.value--;
			sum.value = parseInt(hm.value) * sell_price;
		}
	}

	function change() {
		hm = document.form.amount;
		sum = document.form.sum;

		if (hm.value < 0) {
			hm.value = 0;
		}
		sum.value = parseInt(hm.value) * sell_price;
	}
</script> -->
<%-- <form name="form" method="get">
					수량 : 
					<input type=hidden name="sell_price" value="${p.price}"> 
					<input type="text" name="amount" value="1" size="3" onchange="change();">
					<input type="button" value=" + " onclick="add();">
					<input type="button" value=" - " onclick="del();"><br> 금액 :
					<input type="text" name="sum" size="11" readonly>원
					
					<br />
					<button type="submit" onclick="return confirm('장바구니에 넣겠습니까?')"
							class="btn btn-primary">장바구니</button>
				</form> --%>