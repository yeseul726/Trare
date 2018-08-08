<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.menu {
	list-style: none;
	padding: 10px;
	font-size: 13pt;
	color: #383838;
}

.menu li {
	display: inline;
	margin: 0px 30px 0px 30px;
}

.logo {
	display: inline;
	float: left;
	margin-right: 50px;
	margin-top: 15px;
}

a {
	text-decoration: none;
	color: #383838;
	cursor: pointer;
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	
</script>
</head>
<%
	boolean a;
	if (application.getAttribute("user_id") == null) {
		a = true;
	} else {
		a = false;
	}
%>
<body>
	<header>
		<div align="center">
			<div style="width: 75%">
				<div align="left">
					<a href="index.jsp"><img src="image/logo.png" width="150px"
						class="logo"></a>
					<nav style="float: left;">
						<ul class="menu">
							<li><a href="area.jsp">여행지</a>
							<li><a onclick="if(<%=a%>) {alert('로그인이 필요합니다.');} else {location.href='plan.jsp'};">일정</a>
							<li><a onclick="if(<%=a%>) {alert('로그인이 필요합니다.');} else {location.href='tripstory.jsp'};">여행기</a>
							<li><a href="prepare.jsp">준비하기</a>
						</ul>
					</nav>
					<div align="right">
					<nav style="float: right;">
						<ul class="menu">
							<span>
							<%
					if (application.getAttribute("user_id") == null) {
				%>
								<li><a href="login.jsp">로그인</a></li>
								<li><a href="join.jsp">회원가입</a></li> <%
 	} else {
 		if(((String)application.getAttribute("user_id")).equals("trareadmin")) {
 			%>
 			<li><a href="logout.jsp"
					onclick="<%-- <%application.removeAttribute((String)application.getAttribute("user_id"));%> --%>">로그아웃</a></li>
					<li><a href="member.jsp">회원관리</a></li>
 			<%
 		} else {
 %>
 <li><a href="logout.jsp"
					onclick="<%-- <%application.removeAttribute((String)application.getAttribute("user_id"));%> --%>">로그아웃</a></li>
					<li><a href="mypage.jsp">회원정보</a></li>
				<%
 		}
 	}
 %>
							</span>
						</ul>
					</nav>
				</div>
				</div>
			</div>
		</div>
	</header>
</body>
</html>
