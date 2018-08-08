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
.tableType {
	padding: 5px;
	font-size: 12px;
	line-height: 19px;
	color: #6f6f6f;
	margin-top: 50px;
}

fieldset {
	border: none;
	padding: 10px;
	font-size: 15px;
	color: #6f6f6f;
}

.btnType {
	display: inline-block;
	background-color: #ffffff;
	padding-left: 15px;
	padding-right: 15px;
	font-size: 13px;
	color: #303030;
	border: 1px solid #aeaeae;
	height: 30px;
	margin-top: 20px;
}

th {
	text-align: left;
	width: 150px;
}

a {
	text-decoration: none;
	color: #303030;
}
</style>
<script>
	function check() {
		if (confirm("정말 탈퇴하시겠습니까?") == true){    //확인
			location.href="delete.jsp";
		}else{   //취소
		    return;
		}
	}
</script>
</head>
<body>
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

		String sql = "SELECT * FROM trb_member WHERE user_id='" + (String)application.getAttribute("user_id") + "'";

		ResultSet rs = stmt.executeQuery(sql);
		
		rs.next();
		
		String user_name = "";
		String user_id = "";
		String user_email = "";
		String user_regdate = "";
		
		user_name = rs.getString("user_name");
		user_id = rs.getString("user_id");
		user_email = rs.getString("user_email");
		user_regdate = rs.getString("user_regdate");
	%>
	<div align="center" class="tableType">
		<h1>회원정보</h1>
		<br> <img src="image/mypageicon.png" width="150px"
			style="margin-bottom: 50px;"><br>
		<fieldset>
			<table>
				<colgroup>
					<col></col>
				</colgroup>
				<tbody style="line-height: 30px;">
					<tr>
						<th scope="row"><label for>이름</label></th>
						<td><%= user_name %></td>
					</tr>
					<tr>
						<th scope="row"><label for>아이디</label></th>
						<td><%= user_id %></td>
					</tr>
					<tr>
						<th scope="row"><label for>이메일</label></th>
						<td><%= user_email %></td>
					</tr>
					<tr>
						<th scope="row"><label for>가입 날짜</label></th>
						<td><%= user_regdate %></td>
					</tr>
				</tbody>
			</table>
		</fieldset>
		<div align="center">
			<button class="btnType">
				<a href="modify.jsp">개인정보 수정</a>
			</button>
				<button class="btnType" type="button" onclick="check();">회원탈퇴</a>
		</div>
	</div>
</body>
</html>
