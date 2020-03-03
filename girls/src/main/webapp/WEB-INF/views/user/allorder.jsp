<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${R}res/index.css">
<title>전체상품구매</title>
<style>
.imgg {
	width: 130px;
	height: auto;
}

.itemm {
	display: none;
}

.orderInfo {
	border: 5px solid #eee;
	padding: 20px;
}

.orderInfo .inputArea {
	margin: 10px 0;
}

.orderInfo .inputArea label {
	display: inline-block;
	width: 120px;
	margin-right: 10px;
}

.orderInfo .inputArea input {
	font-size: 14px;
	padding: 5px;
}

#userAddr2, #userAddr3 {
	width: 250px;
}

.orderInfo .inputArea:last-child {
	margin-top: 30px;
}

.orderInfo .inputArea button {
	font-size: 20px;
	border: 2px solid #ccc;
	padding: 5px 10px;
	background: #fff;
	margin-right: 20px;
}
</style>
</head>
<body>
	<%@ include file="nav.jsp"%>
	<div class="container">
		<div class="orderOpne">
			<button type="button" class="btn orderOpne_bnt">
				<span class="glyphicon glyphicon-plus-sign" style="margin: 4px;"></span>전체상품보기
			</button>
			<script>
				$(".orderOpne_bnt").click(function() {
					$(".itemm").slideDown();
					$(".orderOpne_bnt").slideUp();
				});
			</script>
		</div>
		<div class="itemm">
			<button type="button" class="btn cancel_btn">
				<span class="glyphicon glyphicon-minus-sign" style="margin: 4px;"></span>닫기
			</button>
			<script>
				$(".cancel_btn").click(function() {
					$(".itemm").slideUp();
					$(".orderOpne_bnt").slideDown();
				});
			</script>
			<table style="width: 85%">
				<colgroup>
					<col width="15%" />
					<col width="20%" />
					<col width="10%" />
					<col width="10%" />
					<col width="10%" />
					<col width="10%" />
				</colgroup>
				<c:forEach var="b" items="${basket}">
					<tbody>
						<tr style="height: 150px;">
							<td><a href="/guest/productdetail/${b.product.id}"><img
									src="/images/${b.product.image_url}" class="imgg"></a></td>
							<td><a href="/guest/productdetail/${b.product.id}"
								style="color: black;">${b.product.name}</a></td>
							<td><span><fmt:formatNumber
										value="${b.product.price-(b.product.discount*b.product.price)/100}"
										pattern="###,###,###" /></span></td>
							<td>${b.color.color}</td>
							<td>${b.count}</td>
							<td><span><fmt:formatNumber
										value="${(b.product.price-(b.product.discount*b.product.price)/100)* b.count}"
										pattern="###,###,###" />원</span></td>
						</tr>
					</tbody>
					<c:set var="sum"
						value="${sum + (b.product.price-(b.product.discount*b.product.price)/100)* b.count}" />
				</c:forEach>
			</table>
		</div>
		<br />
		<hr />
		<div class="result">
			<div class="sum">
				총 합계:
				<fmt:formatNumber pattern="###,###,###" value="${sum}" />
				원
			</div>
		</div>
		<br />
		<sec:authentication property="user.name" var="name" />
		<sec:authentication property="user.email" var="email" />
		<sec:authentication property="user.phone" var="phone" />
		<sec:authentication property="user.address" var="address" />
		<sec:authentication property="user.postcode" var="postcode" />
		<sec:authentication property="user.address_detail"
			var="address_detail" />

		<%-- <div class="orderInfo">
			<h3>주문자 정보</h3>
			<label>주문자</label> <span>${name}</span>
		</div>
		<br /> --%>

		<div class="orderInfo">
			<h3>배송지 정보</h3>

			<!-- <p class="chkAdd">
				배송지 정보가 주문자 정보와 동일합니까? &nbsp;&nbsp;
				<input id="sameaddr0" name="sameaddr" value="T" type="radio" checked="checked">
				<label for="sameaddr0">주문자 정보와 동일</label>&nbsp;&nbsp; 
				<input id="sameaddr1" name="sameaddr" value="F" type="radio">
				<label for="sameaddr1" onclick="clearForm()">새로운배송지</label>
			</p> -->
			<form:form method="post" modelAttribute="orders" autocomplete="off"
				class="frm">
				<form:hidden path="amount" value="${sum}" />
				<%-- <form:hidden path="id" value="${orderId}" /> --%>
				<form:hidden path="status" value="1" />
				<sec:authorize access="authenticated">
					<sec:authentication property="user.id" var="currentid" />
					<form:hidden path="user" value="${currentid}" />
				</sec:authorize>
				<div class="inputArea">
					<label for="">수령인</label>
					<form:input path="orderRec" value="${name}" required="required" />
				</div>
				<div class="inputArea">
					<label for="orderPhon">수령인 연락처</label>
					<form:input path="orderPhon" value="${phone}" required="required" />
				</div>
				<div class="inputArea">
					<label for="userAddr1">우편번호</label>
					<form:input path="userAddr1" value="${postcode}" required="required" />
				</div>
				<div class="inputArea">
					<label for="userAddr2">1차주소</label>
					<form:input path="userAddr2" value="${address}" required="required" />
				</div>
				<div class="inputArea">
					<label for="userAddr3">2차주소</label>
					<form:input path="userAddr3" value="${address_detail}"
						required="required" />
				</div>
				<div class="inputArea">
					<button type="submit" class="btn order_btn"
						onclick="return confirm('주문 하시겠습니까?')"
						style="font-size: 16px; width: 140px; height: 40px; background-color: #f9f0ff;">주문하기</button>
				</div>
			</form:form>

			<%-- <form:form method="post" modelAttribute="order_details" class="frm">
				<c:forEach var="b" items="${basket}">
					<form:hidden path="orders" value="${orderId}" />
					<form:hidden path="product" value="${b.product.id}" />
					<form:hidden path="count" value="${b.count}" />
					<form:hidden path="color" value="${b.color.color}" />
				</c:forEach>
			</form:form> --%>

			<%-- <c:forEach var="b" items="${basket}">
				<input data-basket="${b.id}" />
			</c:forEach> --%>


			<!-- <script>
				$(".order_btn").click(function() {
					var confirm_val = confirm("주문하시겠습니까?")

					if (confirm_val) {
						/* var data = $(".frm").serialize(); */
						/* var Arr = new Array(); */
						var data = $(".frm").serialize();
						
						Arr.push($(this).attr("data-basket"));

						$.ajax({
							url : "/user/allorder",
							type : "post",
							data : data,
							success : function(result) {
								if (result == 1) {
									location.href = "/user/orderlist";
								} else {
									alert("주문 실패");
								}
							}
						});
					}
				})
			</script> -->
			<!-- <script>
				$(function() {
					$("#order_btn").click(
							function() {
								$.post("/user/allorder", $(".sform")
										.serialize(), function(data) {

								});
							});
				});
			</script> -->

		</div>
		<br /> <br />
	</div>
	<%@ include file="bottom.jsp"%>
</body>
</html>




<!-- <button type="submit" class="order_btn"
						onclick="return confirm('주문 하시겠습니까?')"
						style="font-size: 16px; width: 140px; height: 40px; background-color: #f9f0ff;">주문하기</button> -->