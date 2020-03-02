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

<!-- nav drop_down bar -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/res/index.css">

<link
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.4.1/minty/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4HfFay3AYJnEmbgRzxYWJk/Ka5jIimhB/Fssk7NGT9Tj3rkEChpSxLK0btOGzf2I"
	crossorigin="anonymous">



</head>
<body>
	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-dark "
			style="background-color:#78C2AD;"> <a class="navbar-brand"
			style="font-size: 3em;" href="${R}guest/index">히히걸즈</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav mr-auto">

				<c:forEach var="c" items="${category}">
					<li class="nav-item"><a class="nav-link"
						href="${R}guest/productlist/${c.id}" style="margin-right: 20px;"><b>${c.title}</b></a></li>
					<%-- <li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false" style="margin-right: 15px;"><b>${c.title} </b></a></li> --%>
				</c:forEach>

				<!-- <li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"
					style="margin-right: 20px;"><b>Outer</b></a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="btn btn-light btn-xs" href="#">코트</a><br/>
						<a class="btn btn-light btn-xs" href="#">가디건</a><br/>
						<a class="btn btn-light btn-xs" href="#">자켓/점퍼</a>
					</div>
				</li>
				
				<li class="nav-item"><a class="nav-link" href="#"
					style="margin-right: 20px;"><b>Knit</b></a></li>
				<li class="nav-item"><a class="nav-link" href="#"
					style="margin-right: 20px;"><b>Top</b></a></li>
				<li class="nav-item"><a class="nav-link" href="#"
					style="margin-right: 20px;"><b>Blouse&Shirt</b></a></li>
				<li class="nav-item"><a class="nav-link" href="#"
					style="margin-right: 20px;"><b>Dress&Skirt</b></a></li>
				<li class="nav-item"><a class="nav-link" href="#"
					style="margin-right: 20px;"><b>Pants</b></a></li>
				<li class="nav-item"><a class="nav-link" href="#"
					style="margin-right: 20px;"><b>Shoes&Bag</b></a></li> -->



				<li class="nav-item"><a class="nav-link"
					href="${R}guest/boardlist" style="margin-left: 15px;"><b>자유게시판</b></a></li>
				<li class="nav-item"><a class="nav-link" href="${R}user/basket"
					style="margin-left: 15px;"><b>장바구니</b></a></li>
				<li class="nav-item"><a class="nav-link"
					href="${R}guest/qnalist" style="margin-left: 15px;"><b>Q&A</b></a></li>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<li class="nav-item"><a class="nav-link"
						href="${R}admin/index" style="margin-left: 15px;"><b>관리자</b></a></li>
				</sec:authorize>
				<li class="nav-item"><a class="nav-link"
					href="${R}user/orderlist" style="margin-left: 15px;margin-right:15px;"><b>주문내역조회</b></a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"><b>내 정보</b> </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<sec:authorize access="not authenticated">
							<a class="btn btn-light btn-xs" href="${R}guest/login">로그인</a>
						</sec:authorize>
						<sec:authorize access="not authenticated">
							<a class="btn btn-light btn-xs" href="${R}guest/register">회원가입</a>
						</sec:authorize>
						<sec:authorize access="authenticated">
							<a class="btn btn-light btn-xs" href="${R}user/logout_processing">로그아웃</a>
							<br />
							<a class="btn btn-light btn-xs" href="${R}user/info"> <sec:authentication
									property="user.name" />
							</a>
						</sec:authorize>
					</div></li>
			</ul>
		</div>
		</nav>




	</div>

</body>
</html>

