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
<style>
.divType1 {
	width: 300px;
	height: 200px;
	display: inline-block;
	margin: 10px;
	background-size: 100%;
	line-height: 150px;
	transition: 0.3s;
}

.divType2 {
	width: 300px;
	height: 200px;
	display: inline-block;
	margin: 10px;
	background-size: 100%;
	line-height: 150px;
	transition: 0.3s;
}

h2 {
	color: #FFFFFF;
}

.divType1:hover {
	opacity: 0.5;
}

.divType1 a {
	color: #FFFFFF;
}

.divType2 span {
	position: relative;
	top: 100px;
	left: 85px;
	color: #ffffff;
}
</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
<script>
	
</script>
</head>
<body>
	<%
		/* out.println(application.getAttribute("userID"));
		if(application.getAttribute("userID") == null) {
			out.println("LOGIN");
		} else {
			out.println("LOGOUT");
		} */
	%>
	<img src="image/main_banner.png" class="banner">
	<div align="center" style="margin-top: 50px;">
		<h1>Trare와 함께 여행 준비하기</h1>
		<div class="divType1"
			style="background-image: url('image/main_icon1.png');">
			<h2>
				<a href="area.jsp">여행정보</a>
			</h2>
		</div>
		<div class="divType1"
			style="background-image: url('image/main_icon2.png');">
			<h2>
				<a href="plan.jsp">일정 공유</a>
			</h2>
		</div>
		<div class="divType1"
			style="background-image: url('image/main_icon3.png');">
			<h2>
				<a href="tripstory.jsp">여행 이야기</a>
			</h2>
		</div>
	</div>
	<div align="center" style="margin-top: 50px; margin-bottom: 70px;">
		<!-- DB연동 후 지우기 -->
		<h1>여행지 BEST</h1>
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

			String sql = "SELECT * FROM trb_area order by recom_ratio desc";

			ResultSet rs = stmt.executeQuery(sql);

			String area_name = "";
			String good = "";
			String bad = "";
			
			int cnt = 0;

			while (rs.next()) {
				area_name = rs.getString("area_name");
				good = rs.getString("good");
				bad = rs.getString("bad");
		%>
		<div class="divType2" style="background-image: url('area_image/<%= area_name %>.jpg'); background-size: 100%;">
		<h1 style="text-align: center; color: #ffffff;"><%= area_name %></h1>
			<div style="position: relative; bottom: 190px;"><span>추천</span><span> <%= good %></span> <span>비추천</span><span> <%= bad %></span></div>
		</div>
		<%
		cnt++;
		if(cnt == 8) {
			break;
		}
			}
		%>
	</div>
</body>
</html>
