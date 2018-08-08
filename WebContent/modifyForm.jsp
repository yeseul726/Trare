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
	h3 {
		font-family: 'Nanum Gothic', 'sans-serif';
	}
	input {
		width: 200px;
		height: 20px;
	}
	article h1{
		font-size: 40pt;
		color: #CEC178;
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
		margin-top: 50px;
		padding: 5px;
		width: 100%;
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
	    width:100px;
	    background:#f6f6f6;
	}
	fieldset {
		border: none;
		padding: 10px;
		color: #6f6f6f;
	}
	.btnType {
		display: inline-block;
		background-color: #ffffff;
		padding-left: 15px;
		padding-right: 15px;
		color: #303030;
		border: 1px solid #aeaeae;
		height: 30px;
		margin-top: 20px;
	}
	span > a {
		text-decoration: none;
		color: #CEC178;
	}
	th {
		float: left;
	}
</style>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
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
		String user_pw = "";
		String user_email = "";
		String user_regdate = "";
		
		user_name = rs.getString("user_name");
		user_id = rs.getString("user_id");
		user_pw = rs.getString("user_pw");
		user_email = rs.getString("user_email");
		user_regdate = rs.getString("user_regdate");
	%>
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
		if(document.modify.before_pw.value == "<%= user_pw %>") {
			if (confirm("수정하시겠습니까?") == true){    //확인
				document.modify.submit();
			}else{   //취소
			    return;
			}
		} else {
			alert("비밀번호가 일치하지 않습니다.");
		}
	}
</script>
</head>
<body>
	
<div class="tableType" align="center">
		<h1>회원정보 수정</h1><br>
		<form action="modifyProc.jsp" method="post" name="modify">
			<fieldset>
				<table>
					<colgroup><col width="20%"></col></colgroup>
					<tbody style="line-height: 30px;">
						<tr>
							<th scope="row"><label for>이름</th>
							<td><%= user_name %></td>
						</tr>
						<tr>
							<th scope="row"><label for>아이디</label></th>
							<td><%= user_id %></td>
						</tr>
						<tr>
							<th scope="row"><label for>현재 비밀번호</label></th>
							<td><input type="password" id="before_pw" name="before_pw" minlength="8" maxlength="20" required
							style="margin-right: 10px; ime-mode: disabled;">* 영문 최소 8자 ~ 최대 20자 가능</td>
						</tr>
						<tr>
							<th scope="row"><label for>새 비밀번호</label></th>
							<td><input type="password" name="modifyPw" minlength="8" maxlength="20" required
							style="margin-right: 10px; ime-mode: disabled;"></td>
						</tr>
						<tr>
							<th scope="row"><label for>현재 이메일</label></th>
							<td><input type="hidden" name="user_email" value="<%= user_email %>"><%= user_email %></td>
						</tr>
						<tr>
							<th scope="row"><label for>이메일</label></th>
							<td><input type="text" style="width:100px; ime-mode:disabled;" id="email1" name="email1" maxlength="30">
							@&nbsp;<input type="text" readonly="readonly" class="searchDomain" id="email2" name="email2" maxlength="34"
							style="ime-mode: disabled;">
							<select title="검색조건" style="width:120px;" id="domain" name="domain" onchange="change(this.value)">
									<option value="">선택하세요</option>
									<option value="daum.net">daum.net</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="gmail.com">gmail.com</option>
									<option value="nate.com">nate.com</option>
									<option value="naver.com">naver.com</option>
									<option value="self">직접 입력</option>
							</select>
						</tr>
					</tbody>
				</table>
			</fieldset>
			<div style="display: inline;">
				<button type="reset" class="btnType" style="margin-right: 15px;">다시입력</button>
				<button type="button" class="btnType" style="background-color: #F2F0D6;"
				onclick="check();">수정하기</button>
			</div>
		</form>
	</div>
</body>
</html>
