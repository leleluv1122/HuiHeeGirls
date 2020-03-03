<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<base href="/form1/" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="res/index.css">
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=511ad37e23e2cc8925d6778ea7a8b0ba&libraries=services"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
.error {
	color: red;
}

table {
	table-layout: fixed;
	word-break: break-all;
}
</style>

<title>회원가입</title>
</head>
<body>
	<%@ include file="nav.jsp"%>
	<div class="container">
		<table style="margin: 20px;">
			<tr>
				<td style="width: 85%;">
					<h1>회원 가입</h1>
					<hr /> <form:form method="post"
						modelAttribute="userRegistrationModel" autocomplete="off">
						<div class="form-group">
							<label>아이디:</label>
							<form:input path="userid" class="form-control w200" />
							<form:errors path="userid" class="error" />
						</div>
						<div class="form-group">
							<label>비밀번호:</label>
							<form:password path="passwd1" class="form-control w200" />
							<form:errors path="passwd1" class="error" />
						</div>
						<div class="form-group">
							<label>비밀번호 확인:</label>
							<form:password path="passwd2" class="form-control w200" />
							<form:errors path="passwd2" class="error" />
						</div>
						<div class="form-group">
							<label>이름:</label>
							<form:input path="name" class="form-control w200" />
							<form:errors path="name" class="error" />
						</div>
						<div class="form-group">
							<label>이메일:</label>
							<form:input path="email" class="form-control w300" />
							<form:errors path="email" class="error" />
						</div>
						<div class="form-group">
							<label>전화번호:</label>
							<form:input path="phone" class="form-control w300" />
							<form:errors path="phone" class="error" />
						</div>
						<div class="form-group">
							<label>우편번호</label>
							<form:input path="postcode" class="form-control w300"
								readonly="true" />
						</div>
						<input type="button" class="btn btn-primary"onclick="sample6_execDaumPostcode()"
							value="우편번호 찾기">
						<br>
						<div class="form-group">
							<label>주소:</label>
							<form:input path="address" class="form-control w300"
								readonly="true" />
						</div>
						<div class="form-group">
							<label>상세주소:</label>
							<form:input path="address_detail" class="form-control w300" />
							<form:errors path="address_detail" class="error" />
						</div>
						<div class="form-group">
							<label>참고항목:</label>
							<form:input path="addrplus" class="form-control w300"
								readonly="true" />
						</div>
						<script>
							function sample6_execDaumPostcode() {
								new daum.Postcode(
										{
											oncomplete : function(data) {
												// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

												// 각 주소의 노출 규칙에 따라 주소를 조합한다.
												// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
												var addr = ''; // 주소 변수
												var extraAddr = ''; // 참고항목 변수

												//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
												if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
													addr = data.roadAddress;
												} else { // 사용자가 지번 주소를 선택했을 경우(J)
													addr = data.jibunAddress;
												}

												// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
												if (data.userSelectedType === 'R') {
													// 법정동명이 있을 경우 추가한다. (법정리는 제외)
													// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
													if (data.bname !== ''
															&& /[동|로|가]$/g
																	.test(data.bname)) {
														extraAddr += data.bname;
													}
													// 건물명이 있고, 공동주택일 경우 추가한다.
													if (data.buildingName !== ''
															&& data.apartment === 'Y') {
														extraAddr += (extraAddr !== '' ? ', '
																+ data.buildingName
																: data.buildingName);
													}
													// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
													if (extraAddr !== '') {
														extraAddr = ' ('
																+ extraAddr
																+ ')';
													}
													// 조합된 참고항목을 해당 필드에 넣는다.
													document
															.getElementById("addrplus").value = extraAddr;

												} else {
													document
															.getElementById("addrplus").value = '';
												}

												// 우편번호와 주소 정보를 해당 필드에 넣는다.
												document
														.getElementById('postcode').value = data.zonecode;
												document
														.getElementById("address").value = addr;
												// 커서를 상세주소 필드로 이동한다.
												document.getElementById(
														"address_detail")
														.focus();
											}
										}).open();
							}
						</script>
						<button type="submit" onclick="return confirm('회원가입 하시겠습니까?')"
							class="btn" style="background-color: #F3969A;">
							<i class="glyphicon glyphicon-user"></i> 회원가입
						</button>
					</form:form>
				</td>
			</tr>
		</table>

	</div>
	<%@ include file="bottom.jsp"%>
</body>
</html>
