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
		String pno = request.getParameter("pno");
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

		String sql = "DELETE from trb_plan WHERE pno='" + pno + "'";

		//UPDATE 테이블명 SET 필드명='변경할값' WHERE 필드명=해당값;

		PreparedStatement ps = conn.prepareStatement(sql);
		ps.executeUpdate();
	%>
	<script>
		alert("성공적으로 삭제되었습니다.");
	</script>
	<meta http-equiv="refresh" content="0;url=plan.jsp">
</body>
</html>
