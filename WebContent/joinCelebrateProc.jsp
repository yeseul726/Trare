<%@page import="java.io.FileWriter"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h1 {
	font-family: "Nanum Gothic";
	color: #9F7E69;
}

.btnType {
	display: inline-block;
	background-color: #EDE4D6;
	padding-left: 15px;
	padding-right: 15px;
	font-size: 13px;
	color: #303030;
	border: 1px solid #aeaeae;
	margin-top: 20px;
	cursor: pointer;
	width: 350px;
	height: 45px;
}

p {
	text-align: center;
	font-family: "Nanum Gothic";
}
</style>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String user_name = request.getParameter("user_name");
		String user_id = request.getParameter("user_id");

		
	%>
	<div align="center">
		<h1>환영합니다!</h1>
		<p>
			<span><strong><%=user_name%></strong>님, 회원가입을 축하합니다.</span><br>
			<span>새로운 아이디는 <strong><%=user_id%></strong>입니다.
			</span>
		</p>
		<button class="btnType" onclick="javascript:location='main.jsp'">시작하기</button>
	</div>
</body>
</html>
