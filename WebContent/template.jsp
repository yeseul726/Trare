<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html name="template">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
/* * {
		box-sizing: border-box;
		-webkit-box-sizing: border-box;
		-moz-box-sizing: border-box;
	} */
.banner {
	width: 100%;
	margin: -1px;
}

html {
	height: 100%;
}

body {
	margin: 0;
	height: 100%;
	font-family: "Noto Sans KR", sans-serif;
	padding: 0px;
}

.topBtn {
	vertical-align: bottom;
}

.wrap {
	min-height: 100%;
	position: relative;
	padding-bottom: 10%; /* footer height */
}

#footer {
	position: absolute;
	bottom: 0;
	left: 0;
	right: 0;
	color: white;
	background-color: #286CE5;
}

.admin {
	text-decoration: none;
	color: #737373;
	padding-bottom: 2px;
}

.admin:hover {
	border-bottom: 1px solid #737373;
}

.memberMenu li, .memberMenu a {
	list-style: none;
	display: inline;
	text-decoration: none;
	color: #4C4C4C;
	font-family: 'Varela Round', sans-serif;
	margin-right: 10px;
}

.memberMenu a:hover {
	transition: 0.3s;
	text-decoration: underline;
}

hr {
	width: 1000px;
	float: left;
}
</style>
</head>
<body>
	<%
		String contentPage = request.getParameter("CONTENTPAGE");
	%>
	<div align="center" class="wrap">
		<table style="border-spacing: 0px; width: 100%; margin: 0px;">
			<%-- <ul class="memberMenu" style="margin-left: 70%;">
				<%
					if (application.getAttribute("userID") == null) {
				%>
				<li><a href="login.jsp" name="login">LOGIN</a>
				<li><a href="join.jsp">JOIN</a> <%
 	} else {
 %>
				<li><a href="logout.jsp"
					onclick="<%/* application.removeAttribute((String)application.getAttribute("userID")); */%>">LOGOUT</a>
				<%
 	}
 %>
			</ul> --%>
			<tr>
				<td style="border-bottom: 2px solid #83A3EA;"><jsp:include
						page="top.jsp" flush="false" /></td>
			</tr>
			<tr>
				<td><jsp:include page="<%=contentPage%>" flush="false" /></td>
			</tr>
			<tr>
				<td id="footer"><jsp:include page="bottom.jsp" flush="false" />
				</td>
			</tr>
		</table>
	</div>
</body>
</html>