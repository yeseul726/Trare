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
.title {
	display: inline-block;
	width: 53%;
	height: 20px;
	padding: 10px;
}

.areaSelect {
	display: inline-block;
	width: 22%;
	height: 44px;
	vertical-align: middle;
}

.day {
	width: 60%;
	border: 1px solid #383838;
	margin-top: 50px;
	height: 100px;
}

textarea {
	resize: none;
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
</style>
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

		String no = request.getParameter("pno");

		String sql = "SELECT * FROM trb_plan WHERE pno=" + no;

		ResultSet rs = stmt.executeQuery(sql);

		String pno = "";
		String title = "";
		int period = 0;
		String area = "";
		String writer = "";
		String writedate = "";
		String good = "";
		String bad = "";
		String plan = "";

		rs.next();

		pno = rs.getString("pno");
		title = rs.getString("title");
		period = rs.getInt("period");
		area = rs.getString("area");
		writer = rs.getString("writer");
		writedate = rs.getString("writedate");
		good = rs.getString("good");
		bad = rs.getString("bad");
		plan = rs.getString("plan");

		String planArray[] = plan.split("[|]");
	%>
	<script>
	function deleteCheck() {
		if (confirm("삭제하시겠습니까?") == true){    //확인
			location.href='planDelete.jsp?pno=<%= pno %>';
		}else{   //취소
		    return;
		}
	}
	</script>
	<img src="image/plan_banner.png" class="banner">
	<div align="center" id="day">
		<div style="width: 75%;">
			<h1>일정을 공유해보세요.</h1>
			제목 :&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="title"
				class="title" readonly value="<%=title%>">&nbsp;&nbsp;&nbsp;&nbsp;여행지
			:
			<%=area%>
		</div>
		<br>
		<div align="center">
			글번호 :
			<%=pno%>&nbsp;&nbsp;&nbsp;&nbsp;작성자 :
			<%=writer%>&nbsp;&nbsp;&nbsp;&nbsp;작성일 :
			<%=writedate%></div>

		<%
			for (int i = 0; i < period; i++) {
		%>
		<div class="day">
			<div style="width: 100px; height: 100%; display: inline;">
				<h1 style="float: left; margin-left: 30px;">
					DAY<%=i + 1%></h1>
			</div>
			<textarea
				style="margin: 10px; width: 750px; height: 75px; float: right;"
				readonly><%=planArray[i]%></textarea>
		</div>
		<%
			}
		%>


	</div>
	<div align="center">
		<button class="btnType"
			onclick="location.href='recom.jsp?recom=good&type=plan&noType=pno&no=<%=pno%>'">추천</button>
		<span style="margin: 10px;"><%=good%></span>
		<button class="btnType"
			onclick="location.href='recom.jsp?recom=bad&type=plan&noType=pno&no=<%=pno%>'">비추천</button>
		<span style="margin: 10px;"><%=bad%><span>
	</div>
	<br>
	<br>
	<div align="center">
		<%
			if (((String) application.getAttribute("user_id")).equals(writer)) {
		%>
		<button onclick="location.href='planModify.jsp?pno=<%=pno%>'"
			class="btnType">수정</button>
		<button onclick="deleteCheck();" class="btnType">삭제</button>
		<%
			}
			if(!(((String) application.getAttribute("user_id")).equals(writer)) && ((String)application.getAttribute("user_id")).equals("trareadmin")) {
				%>
				<button onclick="deleteCheck();" class="btnType">삭제</button>
				<%
			}
		%>
		<button class="btnType" onclick="location.href='plan.jsp';">목록으로</button>
	</div>
</body>
</html>
