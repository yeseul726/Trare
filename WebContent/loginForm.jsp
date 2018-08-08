<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
aside#left {
	float: left;
	height: 800px;
	margin-right: 100px;
}

h3 {
	font-family: 'Nanum Gothic', 'sans-serif';
}

a {
	text-decoration: none;
	color: #4C4C4C;
}

aside ul li {
	display: inline;
}

input {
	width: 200px;
	height: 20px;
}

button {
	width: 100%;
	height: 60px;
	background-color: #286CE5;
	border: none;
	outline: none;
	color: #ffffff;
}

article h1 {
	font-size: 40pt;
	color: #286CE5;
	display: inline;
}

p {
	color: #666666;
	font-weight: bold;
}

.align {
	list-style: none;
	text-decoration: none;
	display: inline;
}

.btnType {
	display: inline-block;
	padding: 4px 19px 0;
	font-size: 13px;
	color: #303030;
	border: 1px solid #aeaeae;
	height: 23px;
	margin-top: 10px;
}

strong {
	color: #303030;
}

hr {
	border: 0;
	height: 0.5px;
	background-color: #286CE5;
}
</style>
<script>
	function check() {
		if(document.login.user_id.value == "" || document.login.user_pw.value == "") {
			alert("아이디와 비밀번호를 모두 입력해주세요.");
			document.login.user_id.focus();
		} else {
			document.login.submit();
		}
	}
</script>
</head>
<body>
<div align="center">
	<div style="/* margin-left: 22%;  */margin-top: 50px; width: 50%; text-align: left;">
		<!-- <aside id="left">
	<ul class="align">
		<li><h3><a href="login.jsp" style="color: #286CE5;">로그인</a></h3>
		<li><h3><a href="findID.jsp">아이디 찾기</a></h3>
		<li><h3><a href="findPW.jsp">비밀번호 찾기</a></h3>
	</ul>
</aside> -->

		<article>
			<h2 style="margin-top: 35px;">로그인</h2>
			<h1>WELCOME</h1>
			<p>
				Trare에 오신 것을 환영합니다.<br> 고객님께서 설정하신 아이디와 비밀번호를 입력해 주세요.
			</p>
			<br>
			<form action="loginProc.jsp" method="post" name="login">
				<table width="400px" cellpadding="3px">
					<tr>
						<td width="100px"><label for="id">아이디</label></td>
						<td><input type="text" name="user_id" id="user_id" required></td>
						<td rowspan="2" width="60px" align="left">
							<button type="button" onclick="check();">로그인</button>
						</td>
					</tr>
					<tr>
						<td><label for="pw">비밀번호</label></td>
						<td><input type="password" name="user_pw" id="user_pw" required></td>
					</tr>
				</table>
			</form>
			<br>
			<br>
			<hr style="width: 100%">
			<br>
			<br>
			<div>
				<ul style="display: inline-block; margin-left: -35px;" class="align">
					<li><strong>아이디를 잊어버리셨나요?</strong><br>
					<li><sub>고객님의 아이디를 찾아드립니다.</sub>
					<li class="btnType"><a href="findID.jsp">아이디 찾기</a>
				</ul>
				<ul style="display: inline-block;" class="align">
					<li><strong>비밀번호를 잊어버리셨나요?</strong><br>
					<li><sub>고객님의 비밀번호를 찾아드립니다.</sub>
					<li class="btnType"><a href="findPW.jsp">비밀번호 찾기</a>
				</ul>
				<ul style="display: inline-block;" class="align">
					<li><strong>회원이 아니신가요?</strong><br>
					<li><sub>회원가입하시고 다양한 혜택을 누리세요.</sub>
					<li class="btnType"><a href="join.jsp">회원가입</a>
				</ul>
			</div>
		</article>
	</div>
	</div>
</body>
</html>
