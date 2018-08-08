<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
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
	String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");
	String user_email = request.getParameter("email1") + "@" + request.getParameter("email2");
	
	if(user_name != "" && user_id != "" && user_pw != "" && user_email != "") {
		%><meta http-equiv="refresh" content="0;url=joinCelebrate.jsp">
		<form action="joinCelebrate.jsp" method="post" id="join">
			<input type="hidden" name="user_name" value="<%= user_name %>">
			<input type="hidden" name="user_id" value="<%= user_id %>">
		</form>
		<script>document.getElementById('join').submit();</script><%
	}
	else {
		%>alert("필수 입력 사항은 모두 입력해주세요.");<%
	}
     
	String driverName="com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/trare";
    String id = "root";
    String pwd ="1234";
    
    try{
        //[1] JDBC 드라이버 로드
        Class.forName(driverName);     
    }catch(ClassNotFoundException e){
        out.println("Where is your mysql jdbc driver?");
        e.printStackTrace();
        return;
    }
    //out.println("mysql jdbc Driver registered!!");
   
    //[2]데이타베이스 연결 
    Connection conn = DriverManager.getConnection(url,id,pwd);
    //out.println("DB연결성공!!");
    
    String sql = "";
	
    sql = "INSERT INTO trb_member(user_id, user_pw, user_name, user_email, user_regdate) VALUES(?, ?, ?, ?, now())";
	
    PreparedStatement ps = conn.prepareStatement(sql);
    
    ps.setString(1, user_id);
    ps.setString(2, user_pw);
    ps.setString(3, user_name);
    ps.setString(4, user_email);
    ps.executeUpdate();
%>
</body>
</html>