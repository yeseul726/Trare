<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css">
<style>
.btnType {
	background-color: #ffffff;
	padding-left: 15px;
	padding-right: 15px;
	font-size: 13px;
	color: #303030;
	border: 1px solid #aeaeae;
	height: 30px;
	margin-top: 20px;
}
</style>
<script>
<%
boolean a;
if(application.getAttribute("user_id") == null) {
	a = true;
} else {
	a = false;
}
%>
</script>
</head>
<body>
<div align="center">
		<img src="image/plan_banner.png" class="banner">
		<!-- <div>
			<h1>BEST 3</h1>
			<div class="divType1"></div>
			<div class="divType1"></div>
			<div class="divType1"></div>
		</div> -->
		<div>
			<h1>일정을 공유해보세요.</h1>
			<!-- <div class="divType1"></div>
			<div class="divType1"></div>
			<div class="divType1">
				<span style="position: relative; bottom: 50px;"><h2 style="display: inline;">제목</h2></span>
				<span style="position: relative; bottom: 25px; right: 47px;">yyyy-MM-dd ~ yyyy-MM-dd</span>
				<span style="position: relative; right: 248px; top: 2px;">내용</span>
			</div> -->
			<table class="table table-hover" style="width: 65%;">
				<tr>
					<th style="width: 10%;">글 번호</th>
					<th style="width: 17%;">여행지</th>
					<th style="width: 30%;">제목</th>
					<th style="width: 10%;">작성자</th>
					<th style="width: 10%;">작성일</th>
					<th style="width: 10%;">추천수</th>
					<th style="width: 10%;">비추천수</th>
				</tr>
				<%
					String driverName = "com.mysql.jdbc.Driver";
					String url = "jdbc:mysql://localhost:3306/trare";
					String pid = "root";
					String pwd = "1234";

					try {
						//[1] JDBC 드라이버 로드
						Class.forName(driverName);
					} catch (ClassNotFoundException e) {
						out.println("Where is your mysql jdbc driver?");
						e.printStackTrace();
						return;
					}
					//out.println("mysql jdbc Driver registered!!");

					//[2]데이타베이스 연결 
					Connection conn = DriverManager.getConnection(url, pid, pwd);

					Statement stmt = conn.createStatement();

					String sql = "SELECT * FROM trb_plan order by pno desc";

					ResultSet rs = stmt.executeQuery(sql);

					String pno = "";
					String title = "";
					String area = "";
					String writer = "";
					String writedate = "";
					String good = "";
					String bad = "";

					while (rs.next()) {
						pno = rs.getString("pno");
						title = rs.getString("title");
						area = rs.getString("area");
						writer = rs.getString("writer");
						writedate = rs.getString("writedate");
						good = rs.getString("good");
						bad = rs.getString("bad");
				%>
				<tr>
					<%
						out.println("<td>" + pno + "</td>");
							out.println("<td>" + area + "</td>");
							out.println("<td><a href='planView.jsp?pno=" + pno + "' style='color: #ff0000;'>" + title + "</a></td>");
							out.println("<td>" + writer + "</td>");
							out.println("<td>" + writedate + "</td>");
							out.println("<td>" + good + "</td>");
							out.println("<td>" + bad + "</td>");
						}
					%>
				</tr>
			</table>
			<br>
			<div>
				<button type="button" onclick="if(<%=a%>) {alert('로그인이 필요합니다.');} else {location.href='planWrite.jsp'};"
					class="btnType">일정 만들기</button>
			</div>
			<br> 1 2 3 4 5
			<!-- 페이징 -->
		</div>
	</div>
</body>
</html>
