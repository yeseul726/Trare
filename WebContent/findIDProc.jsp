<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String user_name = request.getParameter("user_name");
		String user_email = request.getParameter("email1") + "@" + request.getParameter("email2");
	
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

		String sql = "SELECT user_id FROM trb_member WHERE user_name='" + user_name + "' and user_email='" + user_email + "'";

		ResultSet rs = stmt.executeQuery(sql);
		
		rs.next();
		
		String user_id = rs.getString("user_id");
	%>
	<%-- <br><br>
	<div align="center">
	<h1><%= user_name %>님의 아이디는 "<%= user_id %>" 입니다.</h1>
	</div> --%>
	<script>alert("<%= user_name %>님의 아이디는 '<%= user_id %>' 입니다."); location.href="index.jsp";</script>
</body>
</html>
