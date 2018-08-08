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
	String pno = request.getParameter("pno");
	String title = request.getParameter("title");
	String area = request.getParameter("area");
	String[] day = request.getParameterValues("day");
	//int dayCnt = Integer.parseInt(request.getParameter("dayCnt"));
	String dayCnt = request.getParameter("dayCnt");
	
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

	String sql = "UPDATE trb_plan SET title='" + title + "', area='" + area + "', plan='" + content + "', period='" + day.length + "' WHERE pno='" + pno + "'";

	PreparedStatement ps = conn.prepareStatement(sql);

	ps.executeUpdate();
	
	%><script>alert("성공적으로 수정되었습니다.");</script><meta http-equiv="refresh" content="0;url=plan.jsp"><%
%>
</body>
</html>
