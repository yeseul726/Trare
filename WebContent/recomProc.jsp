<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
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
	String recom = request.getParameter("recom"); //good or bad
	String type = request.getParameter("type"); //tripstory or plan or area
	String noType = request.getParameter("noType"); //tsno or pno or area_name
	String no = request.getParameter("no"); //tsno, pno, area_name으로 쓰임
	String tableName = "trb_" + type;
	
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
	
	PreparedStatement ps = null;
	ResultSet rs = null;
	Statement stmt = conn.createStatement();

	String sql = "SELECT " + recom + ", good, bad FROM " + tableName + " WHERE " + noType + "='" + no + "'";
	
	//out.println(sql);

	rs = stmt.executeQuery(sql);
	
	int recom_ratio = 0;
	
	rs.next();
	String cnt = rs.getString(recom);
	
	int upCnt = Integer.parseInt(cnt) + 1;
	
	sql = "UPDATE " + tableName + " SET " + recom + "='" + upCnt + "', recom_ratio='" + recom_ratio + "' WHERE " + noType + "='" + no + "'";
	
	//out.println(sql);
	
	ps = conn.prepareStatement(sql);
	
	//String sql = "UPDATE " + tableName + " SET " + recom + "'"
	//UPDATE 테이블명 SET 필드명='변경할값' WHERE 필드명=해당값;
	
	ps.executeUpdate();
	
	sql = "SELECT good, bad, recom_ratio FROM " + tableName + " WHERE " + noType + "='" + no + "'";
	rs = stmt.executeQuery(sql);
	rs.next();
	
	int good = rs.getInt("good");
	int bad = rs.getInt("bad");
	
	if(bad == 0) {
		recom_ratio = good;
	} else {
		recom_ratio = good/bad;
	}
	
	sql = "UPDATE " + tableName + " SET recom_ratio='" + recom_ratio + "' WHERE " + noType + "='" + no + "'";
	
	ps = conn.prepareStatement(sql);
	ps.executeUpdate();
	
	%><script>history.back();window.location.reload();</script><%
%>
</body>
</html>
