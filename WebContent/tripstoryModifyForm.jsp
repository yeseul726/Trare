<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
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
		request.setCharacterEncoding("utf-8");
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
		
		String tsno = request.getParameter("tsno");

		String sql = "SELECT * FROM trb_tripstory WHERE tsno='" + tsno + "'";

		ResultSet rs = stmt.executeQuery(sql);
		
		rs.next();
		String title = rs.getString("title");
		String area = rs.getString("area");
		String start_trip = rs.getString("start_trip");
		String end_trip = rs.getString("end_trip");
		String content = rs.getString("content");
		
		sql = "SELECT area_name FROM trb_area";
		
		rs = stmt.executeQuery(sql);
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
</script>
</head>
<body>
	
	<div align="center">
		<img src="image/tripstory_banner.png" class="banner">
		<h1>여행 이야기를 공유해보세요.</h1>
		<!-- <form action="" method="post" name="review"> -->
		<div align="center" class="fieldset">
			<form action="tripstoryModifyProc.jsp" method="post"  enctype="multipart/form-data" id="modify">
				<table>
					<tr height="20"></tr>
					<tr>
						<td width="100" align="left"><span class="txt01">여행지</span></td>
						<td align="left"><select style="width: 200px; height: 30px;" name="area">
								<%
									while(rs.next()) {
										if((rs.getString("area_name")).equals(area)) {
											out.println("<option selected value=" + rs.getString(1) + ">" + rs.getString(1) + "</option>");
										} else {
											out.println("<option value=" + rs.getString(1) + ">" + rs.getString(1) + "</option>");											
										}
									}
								%>
						</select></td>
					</tr>
					<tr height="20"></tr>
					<tr>
						<td width="100" align="left"><span class="txt01">여행기간</span></td>
						<td align="left"><input type="date" name="startTrip" id="startTrip" value="<%= start_trip %>"> ~ <input
							type="date" name="endTrip" id="endTrip" value="<%= end_trip %>"></td>
					</tr>
					<tr height="20"></tr>
					<tr>
						<td width="100" align="left"><span class="txt01">제목</span></td>
						<td align="left"><input type="text" name="title" size="70" value="<%= title %>"></td>
					</tr>
					<tr height="25"></tr>
					<tr>
						<td width="100" align="left" valign="top"><span class="txt01">내용</span></td>
						<td align="left"><textarea rows="12"
								cols="70" name="content"><%= content %></textarea></td>
					</tr>
					<tr height="50">
						<td width="100" align="left"><span class="txt01">이미지
								선택</span></td>
						<td align="left"><input type="file" name="file"></td>
					</tr>
				</table>
				<div align="center">
					<input type="hidden" name="tsno" id="tsno" value="<%= tsno %>">
					<input type="submit" class="btnType" name="sub" value="write"
						onclick="check();"> <input type="reset" class="btnType"
						name="sub" value="reset" style="margin-bottom: 30px;">
					<button onclick="location.href='tripstory.jsp'" class="btnType">list</button>
				</div>
			</form>
		</div>
		<!-- </form> -->
		<br>
	</div>
	<br>
</body>
</html>
