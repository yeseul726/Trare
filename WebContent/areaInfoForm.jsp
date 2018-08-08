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

.weather {
	border: 1px solid black;
	width: 100px;
	float: left;
	margin: 5px;
	display: inline-block;
}

.money {
	margin-left: 487px;
	width: 550px;
}
</style>
<%
	request.setCharacterEncoding("UTF-8");
	String areaName = request.getParameter("area");
	String areaEngName = request.getParameter("areaEngName");
%>
<script>
	function parseWeather() {
		loadJSON(function(response) {
			var d = new Date();
			var week = new Array('일', '월', '화', '수', '목', '금', '토');
			var jsonData = JSON.parse(response);
			var day = d.getDay();
			var temp = 0;
			var output = "<ul style='width: 50%; font-size: 11pt; display: inline-block; margin-top: -27px;'><h1 style='text-align: left;'>" + "<%=areaName%>" + " 현지 날씨</h1>";
			for(i = 0; i < 5; i++) {
				day = d.getDay() + i;
				if(day >= 7) {
					day -= 7;
				}
				output += "<li class='weather'><b>" + week[day] + '요일' + "</b><br>날씨 : " + jsonData["list"][i]["weather"][0]["main"]
				+ "<br>기온 : "
				+ Math.floor(jsonData["list"][i]["main"]["temp"] - 273.15) //기온
				+ "<br>습도 : "
				+ jsonData["list"][i]["main"]["humidity"]; //습도
				+ "<br>업데이트 날짜 : "
				+ jsonData["list"][i]["dt_txt"] + "</li>";
			}
			output += "</ul>";
			document.getElementById("todaysWeather").innerHTML = output;
			//절대온도이므로 273.15 빼줌
			/* ["list"][0]["weather"][0]["main"] */
		});
	}

	function loadJSON(callback) //url의 json 데이터 불러오는 함수
	{
		var url = "http://api.openweathermap.org/data/2.5/forecast?q=" + "<%=areaEngName%>"
				+ "&cnt=5&APPID=2a16288a29b2be66abba41c8a3d9681b";
		var request = new XMLHttpRequest();
		request.overrideMimeType("application/json");
		request.open('GET', url, true);
		request.onreadystatechange = function() {
			if (request.readyState == 4 && request.status == "200") {
				callback(request.responseText);
			}
		};

		request.send(null);
	}

	window.onload = function() {
		parseWeather();
	}
	<%
	boolean a;
	if(application.getAttribute("user_id") == null) {
		a = true;
	} else {
		a = false;
	}
%>
</script>
<link rel="stylesheet" href="css/bootstrap.css">
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
	
	String sql = "";
	
	ResultSet rs = null;
	
	sql = "SELECT good, bad FROM trb_area WHERE area_name='" + areaName + "'";
	
	rs = stmt.executeQuery(sql);
	
	rs.next();
	String area_good = rs.getString("good");
	String area_bad = rs.getString("bad");
%>
	<div align="center">
		<div style="width: 75%; display: inline-block;" align="left">
			<h1
				style="text-align: left; display: inline-block; margin-right: 50px;"><%=areaName%></h1>
			<button class="btnType" onclick="location.href='recom.jsp?recom=good&type=area&noType=area_name&no=<%= areaName %>'">추천</button>
			<span style="margin: 10px;"><%= area_good %></span>
			<button class="btnType" onclick="location.href='recom.jsp?recom=bad&type=area&noType=area_name&no=<%= areaName %>'">비추천</button>
			<span style="margin: 10px;"><%= area_bad %></span>
		
		<div align="center">
		<div
			style="width: 40%; height: 300px; display: inline-block; float: left; background-image: url('area_image/<%= areaName %>.jpg'); background-size: 100%;"
			align="left"></div>
		<div id="todaysWeather"></div>
		<!--Currency Converter widget by FreeCurrencyRates.com -->
		<div id='gcw_mainFwaVPtfS9' class="money"></div>
		<script>
			function reloadFwaVPtfS9() {
				var sc = document.getElementById('scFwaVPtfS9');
				if (sc)
					sc.parentNode.removeChild(sc);
				sc = document.createElement('script');
				sc.type = 'text/javascript';
				sc.charset = 'UTF-8';
				sc.async = true;
				sc.id = 'scFwaVPtfS9';
				sc.src = 'https://freecurrencyrates.com/en/widget-vertical-editable?iso=USDKRW&df=1&p=FwaVPtfS9&v=fits&source=yahoo&width_title=0&firstrowvalue=1&thm=286CE5,286CE5,286CE5,286CE5,FFFFFF,C5DBEC,FCFDFD,286CE5,000000&title=환율%20계산기&tzo=-540';
				var div = document.getElementById('gcw_mainFwaVPtfS9');
				div.parentNode.insertBefore(sc, div);
			}
			reloadFwaVPtfS9();
		</script>
		<!-- put custom styles here: .gcw_mainFwaVPtfS9{}, .gcw_headerFwaVPtfS9{}, .gcw_ratesFwaVPtfS9{}, .gcw_sourceFwaVPtfS9{} -->
		<!--End of Currency Converter widget by FreeCurrencyRates.com -->
		</div>
		</div>
	</div>
	<%-- <div align="center">
		<!-- <div>
			<h1>BEST 3</h1>
			<div class="divType1"></div>
			<div class="divType1"></div>
			<div class="divType1"></div>
		</div> -->
		<div style="margin-top: 50px;">
			<h1>여행 이야기</h1>
			<!-- <div class="divType1"></div>
			<div class="divType1"></div>
			<div class="divType1">
				<span style="position: relative; bottom: 50px;"><h2 style="display: inline;">제목</h2></span>
				<span style="position: relative; bottom: 25px; right: 47px;">yyyy-MM-dd ~ yyyy-MM-dd</span>
				<span style="position: relative; right: 248px; top: 2px;">내용</span>
			</div> -->
			<table class="table table-hover" style="width: 65%;">
				<tr>
					<th style="width: 10%;">글 번호</th>
					<th style="width: 17%;">여행지</th>
					<th style="width: 30%;">제목</th>
					<th style="width: 10%;">작성자</th>
					<th style="width: 10%;">작성일</th>
					<th style="width: 10%;">추천수</th>
					<th style="width: 10%;">비추천수</th>
				</tr>
				<tr>
					<td>d</td>
					<td>d</td>
					<td>d</td>
					<td>d</td>
					<td>d</td>
					<td>d</td>
					<td>d</td>
				</tr>
			</table>
			<br>
			<div>
				<button type="button" onclick="if(<%=a%>) {alert('로그인이 필요합니다.');} else {location.href='tripstoryWrite.jsp'};"
					class="btnType">작성하기</button>
			</div>
			<br> 1 2 3 4 5
			<!-- 페이징 -->
		</div>
	</div> --%>
	<div align="center">
		<!-- <div>
			<h1>BEST 3</h1>
			<div class="divType1"></div>
			<div class="divType1"></div>
			<div class="divType1"></div>
		</div> -->
		<div>
			<h1>여행 이야기</h1>
			<!-- <div class="divType1"></div>
			<div class="divType1"></div>
			<div class="divType1">
				<span style="position: relative; bottom: 50px;"><h2 style="display: inline;">제목</h2></span>
				<span style="position: relative; bottom: 25px; right: 47px;">yyyy-MM-dd ~ yyyy-MM-dd</span>
				<span style="position: relative; right: 248px; top: 2px;">내용</span>
			</div> -->
			<table class="table table-hover" style="width: 65%;">
				<tr>
					<th style="width: 10%;">글 번호</th>
					<th style="width: 17%;">여행지</th>
					<th style="width: 30%;">제목</th>
					<th style="width: 10%;">작성자</th>
					<th style="width: 10%;">작성일</th>
					<th style="width: 10%;">추천수</th>
					<th style="width: 10%;">비추천수</th>
				</tr>
				<%
					sql = "SELECT * FROM trb_tripstory WHERE area='" + areaName + "' order by tsno desc";

					rs = stmt.executeQuery(sql);

					String tsno = "";
					String title = "";
					String area = "";
					String writer = "";
					String writedate = "";
					String good = "";
					String bad = "";

					while (rs.next()) {
						tsno = rs.getString("tsno");
						title = rs.getString("title");
						area = rs.getString("area");
						writer = rs.getString("writer");
						writedate = rs.getString("writedate");
						good = rs.getString("good");
						bad = rs.getString("bad");
				%>

				<tr>
					<%
						out.println("<td>" + tsno + "</td>");
							out.println("<td>" + area + "</td>");
							%>
							<td><a onclick="if(<%=a%>) {alert('로그인이 필요합니다.');} else {location.href='tripstoryView.jsp?tsno=<%= tsno %>'};"><%= title %></a></td>
							<%
							//out.println("<td><a onclick='if(" + a + ") {alert('로그인이 필요합니다.');} else {location.href='tripstoryView.jsp?tsno=" + tsno + ";}'>" + title + "</a></td>");
							out.println("<td>" + writer + "</td>");
							out.println("<td>" + writedate + "</td>");
							out.println("<td>" + good + "</td>");
							out.println("<td>" + bad + "</td>");
						}
					%>
				</tr>
			</table>
			
			<br>
			<div>
				<button type="button"
					onclick="if(<%=a%>) {alert('로그인이 필요합니다.');} else {location.href='tripstoryWrite.jsp'};"
					class="btnType">작성하기</button>
			</div>
			<br> 1 2 3 4 5
			<!-- 페이징 -->
		</div>
	</div>
</body>
</html>
