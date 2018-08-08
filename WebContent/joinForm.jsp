<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
aside#left {
	float: left;
	height: 800px;
	margin-right: 140px;
}

h3 {
	font-family: 'Nanum Gothic', 'sans-serif';
}

input {
	width: 200px;
	height: 20px;
}

article h1 {
	font-size: 40pt;
	color: #286CE5;
	display: inline;
}

p {
	color: #666666;
	font-weight: bold;
}

aside ul li {
	display: inline;
}

.align {
	list-style: none;
	text-decoration: none;
	display: inline;
}

input {
	letter-spacing: normal;
	word-spacing: normal;
	text-transform: none;
	text-indent: 0px;
	text-shadow: none;
	display: inline-block;
	text-align: start;
	margin-bottom: 5px;
	font: 400 13.3333px Arial;
	height: 25px;
	border: 1px solid #afafaf;
	padding: 0 0 0 5px;
	line-height: 26px;
}

.tableType {
	padding: 5px;
	width: 100%;
	font-size: 12px;
	line-height: 19px;
	color: #6f6f6f;
}

tr {
	border-bottom: 1px solid #6f6f6f;
	padding: 0px;
}

select {
	vertical-align: top;
	height: 27px;
	color: #6f6f6f;
}

.searchDomain {
	height: 25px;
	border: 1px solid #afafaf;
	padding: 0 0 0 5px;
	line-height: 26px;
	width: 100px;
	background: #f6f6f6;
}

fieldset {
	border-top: 1px solid #286CE5;
	border-bottom: 1px solid #286CE5;
	border-left: none;
	border-right: none;
	padding: 10px;
	font-size: 12px;
	color: #6f6f6f;
	padding-left: 150px;
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

span>a {
	text-decoration: none;
	color: #286CE5;
}

th {
	float: left;
}

.btnType2 {
	display: inline-block;
	background-color: #ffffff;
	padding-left: 15px;
	padding-right: 15px;
	font-size: 13px;
	color: #303030;
	border: 1px solid #aeaeae;
	height: 27px;
	width: 120px;
}
</style>
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script> -->
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	function change(val) {
		if (val == "self") {
			$('#email2').val("");
			$('#email2').removeAttr("readonly");
			$('#email2').attr("style", "width:100px; background:#ffffff;");
		} else {
			$('#email2').val(val);
			$('#email2').attr("readonly", true);
			$('#email2').attr("style", "width:100px; background:#f6f6f6;");
		}
	}
	function check() {
		if(document.join.user_pw.value != document.join.user_repw.value) {
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		} else {
			document.join.submit();
		}
	}
	
	function idCheck() {
		<%
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
		    
		    String sql = "SELECT user_id FROM trb_member";
		    
		    Statement stmt = conn.createStatement();
	
			ResultSet rs = stmt.executeQuery(sql);
			
			%>var cnt = 0;<%
			
			while(rs.next()) {
				%>
				if("<%= rs.getString("user_id") %>" == document.join.user_id.value) {
					cnt++;
				}
				<%
			}
			
			%>
			if(cnt != 0) {
				alert("이미 존재하는 아이디입니다.");
			} else {
				alert("사용 가능한 아이디입니다.");
			}
			<%
		%>
	}
</script>
</head>
<body>
<!-- 	<aside id="left">
		<ul class="align">
			<li><h3>
					<span><a href="join.jsp">회원가입</a></span>
		</ul>
	</aside> -->
	<div align="center">
	<article style="text-align: left; width: 50%;">
		<h2 style="margin-top: 50px;">회원가입</h2>
		<h1>JOIN</h1>
		<p>Trare에 오신 것을 환영합니다.</p>
		<br>
		<div class="tableType">
			<form action="joinProc.jsp" id="join" method="post" name="join">
				<fieldset>
					<table>
						<colgroup>
							<col width="20%"></col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label for>* 이름</th>
								<td><input type="text" name="user_name" required></td>
							</tr>
							<tr>
								<th scope="row"><label for>* 아이디</label></th>
								<td><input type="text" id="id" name="user_id" minlength="6"
									maxlength="10" required
									style="margin-right: 10px; ime-mode: disabled;">
									<button type="button" class="btnType2" onclick="idCheck();">중복확인</button><br>* 영문 최소
									6자 ~ 최대 10자 가능<!-- <button onclick="idCheck()" class="btnType2">중복확인</button> -->
								</td>
							</tr>
							<tr>
								<th scope="row"><label for>* 비밀번호</label></th>
								<td><input type="password" name="user_pw" minlength="8"
									maxlength="20" required style="margin-right: 10px;" id="user_pw">*
									영문 최소 8자 ~ 최대 20자 가능</td>
							</tr>
							<tr>
								<th scope="row"><label for>* 비밀번호 확인</label></th>
								<td><input type="password" name="user_repw" minlength="8"
									maxlength="20" required style="margin-right: 10px;" id="user_repw"></td>
							</tr>
							<!-- <tr>
								<th scope="row"><label for>* 닉네임</label></th>
								<td><input type="text" name="nickname"
									style="margin-right: 6px;" required> * 리뷰 작성 시 사용됩니다.</td>
							</tr> -->
							<tr>
								<th scope="row"><label for>* 이메일</label></th>
								<td><input type="text"
									style="width: 100px; ime-mode: disabled;" id="email1"
									name="email1" maxlength="30"> @&nbsp;<input type="text"
									readonly="readonly" class="searchDomain" id="email2"
									name="email2" maxlength="34"> <select title="검색조건"
									style="width: 120px;" id="domain" name="domain"
									onchange="change(this.value)">
										<option value="">선택하세요</option>
										<option value="daum.net">daum.net</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="gmail.com">gmail.com</option>
										<option value="nate.com">nate.com</option>
										<option value="naver.com">naver.com</option>
										<option value="self">직접 입력</option>
								</select>
							</tr>
							<!-- <tr>
								<th scope="row"><label for> 휴대폰 번호</label></th>
								<td><input type="text" title="휴대폰 첫자리" id="mobile1"
									maxlength="3" style="width: 100px;" required> - <input
									type="text" title="휴대폰 중간자리" id="mobile2" maxlength="4"
									style="width: 100px;" required> - <input type="text"
									title="휴대폰 끝자리" id="mobile3" maxlength="4"
									style="width: 100px;" required></td>
							</tr> -->
						</tbody>
					</table>
				</fieldset>
				<div align="center">
					<button type="reset" class="btnType" style="margin-right: 15px;">다시입력</button>
					<button type="button" class="btnType"
						style="background-color: #286CE5; color: #ffffff;" onclick="check();">가입하기</button>
				</div>
			</form>
		</div>
	</article>
	</div>
</body>
</html>
