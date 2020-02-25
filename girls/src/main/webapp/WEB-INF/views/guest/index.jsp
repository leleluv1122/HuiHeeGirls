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
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.4.1/minty/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4HfFay3AYJnEmbgRzxYWJk/Ka5jIimhB/Fssk7NGT9Tj3rkEChpSxLK0btOGzf2I"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="${R}res/index.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- jquery ui -->
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>


<style>
table {
	table-layout: fixed;
	word-break: break-all;
}
</style>
<script>
	var index = 0; //이미지에 접근하는 인덱스
	window.onload = function(){
		slideShow();
	}
	
	function slideShow(){
		var i;
		var x = document.getElementsByClassName("slide1");
		for(i = 0;i<x.length;i++){
			x[i].style.display = "none"; 
		}
		index++;
		if(index>x.length){
			index = 1;
		}
		x[index-1].style.display="block";
		setTimeout(slideShow, 4000);
	}
</script>
<title>히히걸즈</title>
</head>
<body>
	<%@ include file="nav.jsp"%>
	
	<div class="container">
		<div style="text-align:center;margin:auto;">
			<a href="/guest/productdetail/10"><img class="slide1" src="/images/index1.jpg" style="width:1100px; height:auto;"></a>
			<a href="/guest/productdetail/11"><img class="slide1" src="/images/index2.jpg" style="width:1100px; height:auto;"></a>
		</div>
		<br /> <br /> <br /> <br /> <br />
		<table style="margin: 50px;">

			<tr>
				<td><a href="productlist/4"><img
						src="/images/label1.jpg" style="width: 330px; height: auto;"></a>
				</td>
				<td><a href="productlist/2"><img src="/images/label2.jpg"
					style="width: 330px; height: auto;"></a></td>
				<td><img src="/images/label3.jpg"
					style="width: 330px; height: auto;"></td>
			</tr>
		</table><%-- 


		<c:forEach begin="1" end="2" var="i">
			<img src="/images/index${i}.jpg" class="imgg">
		</c:forEach> --%>

	</div>
	<%@ include file="bottom.jsp"%>
</body>
</html>
