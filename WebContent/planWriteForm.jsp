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
<script>
	dayCnt = 1;
	function add() {
		dayCnt++;
		var output = "";
		output = output
				+ "<div class='day' id=day" + dayCnt + ">"
				+ "<div style='width: 100px; height: 100%; display: inline;'>"
				+ "<h1 style='float: left; margin-left: 30px;'>DAY"
				+ dayCnt
				+ "</h1>"
				+ "</div><textarea style='margin: 10px; width: 750px; height: 75px; float: right;' name='day' required></textarea></div>";

		$("#day").append(output);
	}
	function del() {
		if (dayCnt != 1) {
			$("#day" + dayCnt).remove();
			dayCnt--;
		} else {
			alert("최소 하루 이상 입력해야합니다.");
		}
	}
	function write() {
		//$("#day").append("<input type='hidden' name='tripDay' value=" + dayCnt + ">");
		//document.plan.submit();
	}
	
	function check() {
		var area = document.plan.area.value;
		if(area == "지역을 선택해주세요.") {
			alert("지역을 선택해주세요.");
		} else {
			document.plan.submit();
		}
	}
</script>
</head>
<body>
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

		String sql = "SELECT * FROM trb_area";

		ResultSet rs = stmt.executeQuery(sql);
	%>
	<img src="image/plan_banner.png" class="banner">
	<form action="planWriteProc.jsp" method="post" name="plan">
		<div align="center" id="day">

			<div style="width: 75%;">
				<h1>일정을 공유해보세요.</h1>
				제목 :&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="title"
					class="title" required> <select name="area" class="areaSelect" required>
					<option value="지역을 선택해주세요." selected>지역을 선택해주세요.</option>
					<%
						while (rs.next()) {
							out.println("<option value=" + rs.getString(1) + ">" + rs.getString(1) + "</option>");
						}
					%>
					<!-- DB연동하기 -->
				</select>
			</div>
			<div class="day">
				<div style="width: 100px; height: 100%; display: inline;">
					<h1 style="float: left; margin-left: 30px;">DAY1</h1>
				</div>
				<textarea
					style="margin: 10px; width: 750px; height: 75px; float: right;"
					name="day" required></textarea>
			</div>

		</div>
		<div align="center">
			<input type="hidden" name="dayCnt" value="<script>dayCnt</script>">
			<button type="button" onclick="add();" class="btnType">추가</button>
			<button type="button" onclick="del();" class="btnType">삭제</button>
			<button type="button" onclick="check();" class="btnType">작성</button>
		</div>
	</form>
</body>
</html>
