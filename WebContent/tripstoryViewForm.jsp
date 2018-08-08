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

fieldset {
	width: 70%;
	height: 490px;
}

.button {
	border-bottom: 1px solid #695c5c;
	border-left: 0px;
	border-right: 0px;
	border-top: 0px;
	outline: none;
	background-color: #ffffff;
	font-family: "나눔고딕";
	font-size: 12pt;
	padding: 3px;
}

input {
	border-bottom: 1px solid #695c5c;
	border-left: 0px;
	border-right: 0px;
	border-top: 0px;
	outline: none;
}

textarea {
	outline: none;
	overflow: auto;
	resize: vertical;
}

.fieldset {
	border: 1px solid #9F7E69;
	padding: 30px;
	width: 70%;
}
</style>
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
		
		String no = request.getParameter("tsno");

		String sql = "SELECT * FROM trb_tripstory WHERE tsno=" + no;

		ResultSet rs = stmt.executeQuery(sql);

		String tsno = "";
		String title = "";
		String area = "";
		String startTrip = "";
		String endTrip = "";
		String writer = "";
		String writedate = "";
		String good = "";
		String bad = "";
		String content = "";
		String fileName = "";

		while (rs.next()) {
			
			tsno = rs.getString("tsno");
			title = rs.getString("title");
			area = rs.getString("area");
			startTrip = rs.getString("start_trip");
			endTrip = rs.getString("end_trip");
			writer = rs.getString("writer");
			writedate = rs.getString("writedate");
			good = rs.getString("good");
			bad = rs.getString("bad");
			content = rs.getString("content");
			fileName = rs.getString("image_path");
		}
	%>
<script>
	function check() {
		if (document.review.title.value != "" && document.review.comment.value) {
			alert("작성 완료!");
			location = 'review.jsp';
		} else {
			alert("제목과 내용을 입력해주세요.");
			document.review.title.focus();
		}
	}
	
	function deleteCheck() {
		if (confirm("삭제하시겠습니까?") == true){    //확인
			location.href='tripstoryDelete.jsp?tsno=<%= tsno %>';
		}else{   //취소
		    return;
		}
	}
</script>
</head>
<body>
	<div align="center">
		<img src="image/tripstory_banner.png" class="banner">
		<h1><%= title %></h1>
		<!-- <form action="" method="post" name="review"> -->
		<div align="center" class="fieldset">
			<table>
			<tr height="20"></tr>
				<tr>
					<td width="100" align="left"><span class="txt01">글 번호</span></td>
					<td align="left"><%= tsno %></td>
				</tr>
				<tr height="20"></tr>
				<tr>
					<td width="100" align="left"><span class="txt01">여행지</span></td>
					<td align="left"><%= area %></td>
				</tr>
				<tr height="20"></tr>
				<tr>
					<td width="100" align="left"><span class="txt01">여행기간</span></td>
					<td align="left"><%= startTrip %> ~ <%= endTrip %></td>
				</tr>
				<tr height="25"></tr>
				<tr>
					<td width="100" align="left" valign="top"><span class="txt01">내용</span></td>
					<td align="left"><textarea rows="12" cols="70" name="comment"
							readonly><%= content %></textarea></td>
				</tr>
				<tr height="25"></tr>
				<tr>
					<td width="100" align="left" valign="top"><span class="txt01">이미지</span></td>
					<td align="left"><img src="upload_image/<%= fileName %>"></img></td>
				</tr>
				<tr height="15"></tr>
				<tr>
					<td width="100" align="left" valign="top" colspan="2">
						<div align="center">
							<button class="btnType" onclick="location.href='recom.jsp?recom=good&type=tripstory&noType=tsno&no=<%= tsno %>'">추천</button>
							<span style="margin: 10px;"><%= good %></span>
							<button class="btnType" onclick="location.href='recom.jsp?recom=bad&type=tripstory&noType=tsno&no=<%= tsno %>'">비추천</button>
							<span style="margin: 10px;"><%= bad %><span>
						</div>
					</td>
				</tr>
			</table>

			<br> <br>
			<div align="center">
				<%
				if(((String)application.getAttribute("user_id")).equals(writer)) {
				%>
				<button onclick="location.href='tripstoryModify.jsp?tsno=<%= tsno %>'" class="btnType">수정</button>
				<button onclick="deleteCheck();" class="btnType">삭제</button>
				<%
				}
				if(!(((String) application.getAttribute("user_id")).equals(writer)) && ((String)application.getAttribute("user_id")).equals("trareadmin")) {
					%>
					<button onclick="deleteCheck();" class="btnType">삭제</button>
					<%
				}
				%>
				<button onclick="location.href='tripstory.jsp'" class="btnType">list</button>
			</div>
		</div>
		<!-- </form> -->
		<br>
	</div>
	<br>
</body>
</html>
