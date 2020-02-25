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
/* .imggg{
	width: auto;
	height: 1300px;
	padding: 10px;
	text-align: center;
	display: block; margin: 0px auto;
} */
ul.menu li {
	list-style-type: none;
	float: left;
	margin-left: 20px;
}
</style>
</head>

<body>
	<!-- onload="init();" -->
	<%@ include file="nav.jsp"%>
	<div class="container">
		<div style="height: 750px; width: auto;">
			<c:forEach var="p" items="${product}">
				<c:if test="${p.id ==idd }">

					<img src="/images/${p.image_url}" class="imgg">


					<br />
					<hr />
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
					<span>세일가:</span>&nbsp;&nbsp;&nbsp;&nbsp;
				<span style="font-size: 12px; color: #333333; font-weight: bold;"><fmt:formatNumber
							value="${p.price-(p.discount*p.price)/100}" pattern="###,###,###" />원</span>

					<br />

					<form:form method="post" modelAttribute="basket">
						<div class="form-group">
							<form:hidden path="product" value="${p.id}" />
						</div>
						<div class="form-group">
							<sec:authorize access="authenticated">
								<sec:authentication property="user.id" var="currentid" />
								<form:hidden path="user" value="${currentid}" />
							</sec:authorize>
						</div>

						<div class="form-group">
							<form:select path="count">
								<label>수량:</label>
								<c:forEach begin="1" end="10" var="i">
									<form:option value="${i}">${i}</form:option>
									<br />
								</c:forEach>
							</form:select>
							&nbsp;개
						</div>
						<br />
						<form:select path="color" class="form-control w200" itemValue="id"
							itemLabel="color" items="${ colors }" />
						<br />
						<div class="form-group">
							<sec:authorize access="not authenticated">
								<button style="margin: 10; background-color: #F3969A;"
									type="submit" onclick="return confirm('로그인해주세요')"
									class="btn btn-primary">장바구니</button>
							</sec:authorize>
							<sec:authorize access="authenticated">
								<button style="margin: 10; background-color: #F3969A;"
									type="submit" onclick="return confirm('장바구니에 담으시겠습니까?')"
									class="btn btn-primary">장바구니</button>
							</sec:authorize>

							<a style="color: black;"
								href="${R}guest/productlist/${p.category.id}">목록으로</a>
						</div>
					</form:form>
				</c:if>
			</c:forEach>
			<hr />
			<br />
		</div>
		<hr />

		<div>
			<div id="prdDetail" style="height: 4300px; width: 1200px;">
				<ul class="menu">
					<li class="selected"><a href="#prdDetail"
						style="color: black;">detail</a></li>
					<li><a href="#prdReview" style="color: black;">review</a></li>
					<li><a href="#prdQnA" style="color: black;">QnA</a></li>
				</ul>
				<br />
				<hr />
				<div class="cont">
					<c:forEach var="p" items="${detail}">
						<c:if test="${p.product.id ==idd }">
							<p style="text-algin: center">
								<img src="/images/${p.detail}">
							</p>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<br />
			<hr />

			<div id="prdReview" style="height: 100px; width: 1050px;">
				<ul class="menu">
					<li><a href="#prdDetail" style="color: black;">detail</a></li>
					<li class="selected"><a href="#prdReview"
						style="color: black;">review</a></li>
					<li><a href="#prdQnA" style="color: black;">QnA</a></li>
				</ul>
				<div class="rev">
					<table>
						<tr>
							<td></td>
						</tr>
					</table>
				</div>
			</div>
			<br />
			<hr />

			<div id="prdQnA" style="height: 1000px; width: 1200px;">
				<ul class="menu">
					<li><a href="#prdDetail" style="color: black;">detail</a></li>
					<li><a href="#prdReview" style="color: black;">review</a></li>
					<li class="selected"><a href="#prdQnA" style="color: black;">QnA</a></li>
				</ul>
				<br /> <br /> <br />
				<div class="qna">
					<a href="/guest/qna/${idd}" class="btn btn-dark" style="float: right;margin:15px;">문의하기</a>
					<table class="table table-hover" style="width: 1150px;">
						<thead>
							<tr>
								<th style="background-color: white;">contents</th>
								<th style="background-color: white;">name</th>
								<th style="background-color: white;">date</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="q" items="${qna}">
								<c:if test="${q.product.id ==idd }">
									<tr>
										<td>${q.title}</td>
										<td>${q.writer}</td>
										<td><fmt:formatDate value="${q.date}"
												pattern="yyyy.MM.dd HH:mm:ss" /></td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>

				</div>
			</div>
		</div>
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