<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String area = request.getParameter("area");
	String[] day = request.getParameterValues("day");
	
	String content = "";
	
	for(int i = 0; i < day.length; i++) {
		content += day[i];
		if(i != (day.length - 1)) {
			content += "|";
		}
	}
	
	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/trare";
	String id = "root";
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
	Connection conn = DriverManager.getConnection(url, id, pwd);
	//out.println("DB연결성공!!");

	String sql = "INSERT INTO trb_plan(title, period, plan, writer, area, writedate) VALUES(?, ?, ?, ?, ?, curdate())";

	PreparedStatement ps = conn.prepareStatement(sql);

	ps.setString(1, title);
	ps.setInt(2, day.length);
	ps.setString(3, content);
	ps.setString(4, (String)application.getAttribute("user_id"));
	ps.setString(5, area);
	ps.executeUpdate();
	
	%><script>alert("성공적으로 글이 작성되었습니다."); location.href="plan.jsp";</script><%
%>
</body>
</html>
