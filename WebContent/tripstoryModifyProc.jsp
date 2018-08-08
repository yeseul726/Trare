<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
		String savePath = request.getServletContext().getRealPath("");
		int sizeLimit = 1024*1024*30; //30mb로 크기 제한
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		String fileName = multi.getFilesystemName("file");
		String photoFullPath = savePath + "/" + fileName;
		request.setCharacterEncoding("utf-8");
		String area = multi.getParameter("area");
		String title = multi.getParameter("title");
		String startTrip = multi.getParameter("startTrip");
		String endTrip = multi.getParameter("endTrip");
		String content = multi.getParameter("content");
		String tsno = multi.getParameter("tsno");
	
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

		//String sql = "INSERT INTO trb_tripstory(title, start_trip, end_trip, area, content, writer, writedate, image_path) VALUES(?, ?, ?, ?, ?, ?, curdate(), ?)";
		String sql = "UPDATE trb_tripstory SET title='" + title + "', start_trip='" + startTrip + "', end_trip='" + endTrip + "', area='" + area + "', content='" + content + "', image_path='" + photoFullPath + "' WHERE tsno='" + tsno + "'";
		//UPDATE 테이블명 SET 필드명='변경할값' WHERE 필드명=해당값;
		
		PreparedStatement ps = conn.prepareStatement(sql);

		/* ps.setString(1, title);
		ps.setString(2, startTrip);
		ps.setString(3, endTrip);
		ps.setString(4, area);
		ps.setString(5, content);
		ps.setString(6, (String)application.getAttribute("user_id"));
		ps.setString(7, photoFullPath); */
		ps.executeUpdate();
		
		%><script>alert("성공적으로 수정되었습니다.");</script><meta http-equiv="refresh" content="0;url=tripstory.jsp"><%
	%>
</body>
</html>
