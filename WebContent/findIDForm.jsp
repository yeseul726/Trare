<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	a {
		text-decoration: none;
		color: #4C4C4C;
	}
	aside ul li {
		display: inline;
	}
	input {
		width: 200px;
		height: 20px;
	}
	button {
		width: 100%;
		height: 60px;
		background-color: #E2D9A6;
		border: none;
		outline: none;
		color: #ffffff;
	}
	p {
		color: #666666;
		font-weight: bold;
	}
	ul {
		list-style: none;
		text-decoration: none;
	}
article h1 {
	font-size: 40pt;
	color: #286CE5;
	display: inline;
}
	fieldset {
		border: none;
		padding: 10px;
		color: #6f6f6f;
		padding-left: 130px;
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
		width: 110px;
	}
	.btnType2 {
		display: inline-block;
		background-color: #ffffff;
		padding-left: 15px;
		padding-right: 15px;
		color: #303030;
		border: 1px solid #aeaeae;
		height: 27px;
		width: 120px;
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
	tr {
		padding: 0px;
	}
	.tableType {
		padding: 5px;
		width: 100%;
		line-height: 19px;
		color: #6f6f6f;
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
	th {
		float: left;
	}
	.align {
		list-style: none;
		text-decoration: none;
		display: inline;
	}
</style>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	var num;
	function createNum() {
		//인증번호 생성, 전송
		num = Math.floor(Math.random() * 999999);
		alert(num);
		event.preventDefault(); //새로고침 없이 submit
	}
	function check() {
		if(document.findID.authenticationNumber.value == num) {
			alert("인증 성공");
			location.href='findIDProc.jsp';
			/* document.getElementById('findID').submit(); */
		}
		else {
			alert("인증 실패");
		}
		//event.preventDefault();
	}
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
</script>
</head>
<body>
<div align="center">
<div style="/* margin-left: 22%;  */margin-top: 50px; width: 45%; text-align: left;">
<article>
	<h2 style="margin-top: 35px;">아이디 찾기</h2>
	<h1>FIND ID</h1>
	<p>Trare에 오신 것을 환영합니다.<br>
	입력란을 남김 없이 작성해주세요.</p><br>
	<div class="tableType" style="display: inline;">
		<form action="findIDProc.jsp" method="post" name="findID" id="findID">
				<table>
					<colgroup><col width="20%"></col></colgroup>
					<tbody>
						<tr>
							<th scope="row"><label for>* 이름</th>
							<td><input type="text" name="user_name" required></td>
						</tr>
						<tr>
							<th scope="row"><label for>* 이메일</label></th>
							<td><input type="text" style="width:100px; ime-mode: disabled;" maxlength="30" id="email1" name="email1" required>
							@&nbsp;<input type="text" readonly="readonly" class="searchDomain" maxlength="34" required
							style="ime-mode: disabled;" id="email2" name="email2">
							<select title="검색조건" style="width:120px;" id="domain" name="domain" onchange="change(this.value)">
									<option value="">선택하세요</option>
									<option value="daum.net">daum.net</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="gmail.com">gmail.com</option>
									<option value="nate.com">nate.com</option>
									<option value="naver.com">naver.com</option>
									<option value="self">직접 입력</option>
							</select>
							<button type="button" onclick="createNum()" class="btnType2">인증번호 전송</button>
							</td>
						</tr>
						<tr>
							<td></td>
							<td style="padding-bottom: 5px;">* 가입시 입력했던 이메일 주소 입력</td>
						</tr>
						<tr>
							<td></td>
							<td><input type="number" name="authenticationNumber" style="width: 225px;"
							placeholder="인증번호 입력"></td>
						</tr>
					</tbody>
				</table>
				<br>
			<div align="center">
				<button type="reset" class="btnType" style="margin-right: 15px;">다시입력</button>
				<button type="submit" class="btnType" style="background-color: #F2F0D6;" onclick="check()">아이디 찾기</button>
			</div>
		</form>
	</div>
</article>
</div>
</div>
</body>
</html>
