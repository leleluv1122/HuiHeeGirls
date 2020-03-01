<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<title>리뷰작성</title>
<style>
.review {
	border: 5px solid #eee;
	padding: 20px;
}

.review .inputArea {
	margin: 10px 0;
}

.review .inputArea label {
	display: inline-block;
	width: 120px;
	margin-right: 10px;
}

.review .inputArea input {
	font-size: 14px;
	padding: 5px;
}

.review .inputArea:last-child {
	margin-top: 30px;
}

.review .inputArea button {
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
			${o.product.name}
		<div class="review">
			<h3>상품리뷰 작성</h3>
			<form:form method="post" modelAttribute="review" autocomplete="off">
				<sec:authorize access="authenticated">
					<sec:authentication property="user.id" var="currentid" />
					<form:hidden path="user" value="${currentid}" />
				</sec:authorize>
				<form:hidden path="product" value="${order.product.id}" />
				<form:hidden path="color" value="${order.color.id}" />
				<div class="inputArea">
					<form:select path="star" class="form-control w200">
						<form:options items="${ratingOptions}" />
					</form:select>
				</div>
				<div class="inputArea">
					<label>키</label>
					<form:select path="height" class="form-control w200" itemValue="id"
						itemLabel="name" items="${ height }" />
				</div>
				<div class="inputArea">
					<label>몸무게</label>
					<form:select path="weight" class="form-control w200" itemValue="id"
						itemLabel="name" items="${ weight }" />
				</div>
				<div class="inputArea">
					<label>평소 사이즈</label>
					<form:select path="size" class="form-control w200" itemValue="id"
						itemLabel="name" items="${ size }" />
				</div>
				<div class="inputArea">
					<label>후기</label>
					<form:input path="detail" class="form-control w2h1" />
				</div>
				<div class="inputArea">
					<button type="submit" class="btn order_btn"
						onclick="return confirm('후기를 작성하시겠습니까?')"
						style="font-size: 16px; width: 140px; height: 40px; background-color: #f9f0ff;">작성하기</button>
				</div>
			</form:form>
		</div>

		<br /> <br />
	</div>
	<%@ include file="bottom.jsp"%>

</body>
</html>



<!-- <span>
						<img id=image onmouseover=show(1) onclick=mark(1) onmouseout=noshow(1) src="images/star/star0.png">
						<img id=image onmouseover=show(2) onclick=mark(2) onmouseout=noshow(2) src="images/star/star0.png">
						<img id=image onmouseover=show(3) onclick=mark(3) onmouseout=noshow(3) src="images/star/star0.png">
						<img id=image onmouseover=show(4) onclick=mark(4) onmouseout=noshow(4) src="images/star/star0.png">
						<img id=image onmouseover=show(5)onclick=mark(5) onmouseout=noshow(5) src="images/star/star0.png">
					</span>
					<script>
						var locked = 0;
						
						function show(star){
							if(locked)
								return;
							var i;
							var image;
							var el;
							var e = document.getElementById('startext');
							var stateMsg;
							
							for(i=1;i<=star;i++){
								image = 'image'+1;
								el = document.getElementById(image);
								el.src = "images/star/star1.png";
							}
							
							switch(star){
							case 1:
								stateMsg = "별로에요";
								break;
							case 2:
								stateMsg = "그냥그래요";
								break;
							case 3:
								stateMsg = "보통이에요";
								break;
							case 4:
								stateMsg = "맘에 들어요";
								break;
							case 5:
								stateMsg = "아주 좋아요";
								break;
							default:
								stateMsg="";
							}
							e.innerHTML = stateMsg;
						}
						
						function noshow(star){
							if(locked)
								return;
							var i;
							var image;
							var el;
							
							for(i=1;i<=star;i++){
								image = 'image' + i;
								el = document.getElementById(image);
								el.srg = "images/star/star0.png"
							}
						}
						
						function lock(star){
							show(star);
							locked = 1;
						}
						
						function mark(star){
							lock(star);
							alert("선택2" + star);
							document.cmtform.star.value=star;
						}
					</script> -->