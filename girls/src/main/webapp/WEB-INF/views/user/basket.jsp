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
	font-size: 12px;
	color: #333333;
	font-weight: bold;
}

.sum {
	font-size: 12px;
	color: #333333;
	font-weight: bold;
}

.imgg {
	width: 130px;
	height: auto;
}
</style>

<title>히히걸즈</title>
</head>
<body>
	<%@ include file="nav.jsp"%>
	<div class="container">
		<button type="button" class="selectDelete_btn"
			style="font-size: 12px; width: 100px; height: 24px; background-color: #FF7851; margin: 3px; float: right;">
			<span class="glyphicon glyphicon-remove" style="margin: 2px;"></span>
			선택삭제
		</button>
		<script>
			$(".selectDelete_btn").click(function() {
				var confirm_val = confirm("정말 삭제하시겠습니까?");

				if (confirm_val) {
					var checkArr = new Array();

					$("input[class='chBox']:checked").each(function() {
						checkArr.push($(this).attr("data-basket"));
					});

					$.ajax({
						url : "/user/deleteA",
						type : "post",
						data : {
							chbox : checkArr
						},
						success : function(result) {
							if (result == 1) {
								location.href = "/user/basket";
							} else {
								alert("삭제 실패");
							}
						}
					});
				}
			});
		</script>
		<table style="width: 100%">
			<colgroup>
				<col width="4%" />
				<col width="15%" />
				<col width="17%" />
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
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
									$(".chBox").prop("checked", true); //속성값을 가져옴
								} else {
									$(".chBox").prop("checked", false);
								}
							});
						</script></th>
					<th>이미지</th>
					<th>상품정보</th>
					<th>판매가</th>
					<th>할인가</th>
					<th>색상</th>
					<th>수량</th>
					<th>합계</th>
					<th>선택</th>
				</tr>
			</thead>
			<c:forEach var="b" items="${basket}">
				<tbody>
					<tr style="height: 170px;">
						<td><input type="checkbox" name="chBox" class="chBox"
							data-basket="${b.id}" /> <script>
								$(".chBox").click(function() {
									$("#allCheck").prop("checked", false);
								});
							</script></td>
						<td><a href="/guest/productdetail/${b.product.id}"><img
								src="/images/${b.product.image_url}" class="imgg"></a></td>
						<td><a href="/guest/productdetail/${b.product.id}"
							style="color: black;">${b.product.name}</a></td>
						<td>${b.product.price}</td>
						<td><span><fmt:formatNumber
									value="${b.product.price-(b.product.discount*b.product.price)/100}"
									pattern="###,###,###" /></span></td>
						<td>${b.color.color}</td>
						<td>${b.count}</td>
						<td><span><fmt:formatNumber
									value="${(b.product.price-(b.product.discount*b.product.price)/100)* b.count}"
									pattern="###,###,###" />원</span></td>
						<td>
							<!-- <button class="btn btn-dark">주문하기</button> --> <%-- <a
							href="/user/order/${b.id}" class="btn btn-dark">주문하기</a> <br />
							<br /> --%> <a href="/user/delete/${b.id}" class="btn btn-dark"
							onclick="if(!confirm('삭제 하시겠습니까?')){return false;}">삭제</a> <%-- <button class="btn" onclick="location.href='/user/delete/${b.id}'">
									삭제</button>  --%>
						</td>
					</tr>
				</tbody>
				<c:set var="sum"
					value="${sum + (b.product.price-(b.product.discount*b.product.price)/100)* b.count}" />

				<%-- </c:if>
				</sec:authorize> --%>
			</c:forEach>
		</table>

		<hr />
		<br /> <br />
		<div class="result">
			<div class="sum">
				총 합계:
				<fmt:formatNumber pattern="###,###,###" value="${sum}" />
				원
			</div>
		</div>
		<hr />
		<br /> <br />

		<%-- <div class="orderOpne">
			<button type="button" class="orderOpne_bnt"
				style="font-size: 16px; width: 140px; height: 40px; background-color: #F3969A;">주문
				정보 입력</button>
			<script>
				$(".orderOpne_bnt").click(function() {
					$(".orderInfo").slideDown();
					$(".orderOpne_bnt").slideUp();
				});
			</script>
		</div>

		<div class="orderInfo">

			<form:form method="post" modelAttribute="orders" autocomplete="off">
				<form:hidden path="amount" value="${sum}" />
				<sec:authorize access="authenticated">
					<sec:authentication property="user.id" var="currentid" />
					<form:hidden path="user" value="${currentid}" />
				</sec:authorize>
				<div class="inputArea">
					<label for="">수령인</label>
					<form:input path="orderRec" required="required" />
				</div>
				<div class="inputArea">
					<label for="orderPhon">수령인 연락처</label>
					<form:input path="orderPhon" required="required" />
				</div>
				<div class="inputArea">
					<label for="userAddr1">우편번호</label>
					<form:input path="userAddr1" required="required" />
				</div>
				<div class="inputArea">
					<label for="userAddr2">1차주소</label>
					<form:input path="userAddr2" required="required" />
				</div>
				<div class="inputArea">
					<label for="userAddr3">2차주소</label>
					<form:input path="userAddr3" required="required" />
				</div>
				<div class="inputArea">
					<button type="submit" class="order_btn"
						style="font-size: 16px; width: 140px; height: 40px; background-color: #f9f0ff;">주문하기</button>
					<button type="button" class="cancel_btn"
						style="font-size: 16px; width: 140px; height: 40px; background-color: #fff0f2;">취소하기</button>
					<script>
						$(".cancel_btn").click(function() {
							$(".orderInfo").slideUp();
							$(".orderOpne_bnt").slideDown();
						});
					</script>
				</div>

			</form:form>
		</div> --%>




		<div style="text-align: right;"></div>
		<br /> <br /> <br /> <br />
		<div style="text-align: center;">
			<a class="btn" href="/user/allorder"
				style="font-size: 16px; width: 140px; height: 40px; background-color: #F3969A;">
				<span class="glyphicon glyphicon-ok" style="margin: 4px;"></span>전체상품주문
			</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button class="order_btn"
				style="font-size: 16px; width: 140px; height: 40px; background-color: #6CC3D5;">
				<span class="glyphicon glyphicon-check" style="margin: 4px;"></span>선택상품주문
			</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;



		</div>
		<br /> <br /> <br />
	</div>
	<%@ include file="bottom.jsp"%>
</body>
</html>
