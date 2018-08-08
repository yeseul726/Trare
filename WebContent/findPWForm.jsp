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
		width: 120px;
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
	article h1 {
	font-size: 40pt;
	color: #286CE5;
	display: inline;
}
</style>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	function change(val) {
		if (val == "self") {
			$('#domain').val("");
			$('#domain').removeAttr("readonly");
			$('#domain').attr("style", "width:100px; background:#ffffff;");
		} else {
			$('#domain').val(val);
			$('#domain').attr("readonly", true);
			$('#domain').attr("style", "width:100px; background:#f6f6f6;");
		}
	}
</script>
</head>
<body>
<div align="center">
<div style="/* margin-left: 22%;  */margin-top: 50px; width: 45%; text-align: left;">
<article>
	<h2 style="margin-top: 35px;">비밀번호찾기</h2>
	<h1>FIND PASSWORD</h1>
	<p>Trare에 오신 것을 환영합니다.<br>
	입력란을 남김 없이 작성해주세요.</p><br>
	<div class="tableType" style="display: inline;">
		<form action="findPWProc.jsp" method="post" name="findID" id="findID">
				<table>
					<colgroup><col width="20%"></col></colgroup>
					<tbody>
						<tr>
							<th scope="row"><label for>* 이름</th>
							<td><input type="text" name="user_name" required></td>
						</tr>
						<tr>
							<th scope="row"><label for>* 아이디</label></th>
							<td><input type="text" name="user_id" minlength="6" maxlength="10" required
							style="margin-right: 10px; ime-mode: disabled;"></td>
						</tr>
<tr>
							<th scope="row"><label for>* 이메일</label></th>
							<td><input type="text" style="width:100px" maxlength="30" name="email1" style="ime-mode: disabled;">
							@&nbsp;<input type="text" readonly="readonly" class="searchDomain" maxlength="34" name="email2"
							style="ime-mode: disabled;" id="domain">
							<select title="검색조건" style="width:120px;" onchange="change(this.value)">
									<option value="">선택하세요</option>
									<option value="daum.net">daum.net</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="gmail.com">gmail.com</option>
									<option value="nate.com">nate.com</option>
									<option value="naver.com">naver.com</option>
									<option value="self">직접 입력</option>
							</select>
							</td>
						</tr>
						<tr>
							<td></td>
							<td>* 가입시 입력했던 이메일 주소 입력</td>
						</tr>
					</tbody>
				</table>
				<br>
			<div align="center">
				<button type="reset" class="btnType" style="margin-right: 15px;">다시입력</button>
				<button type="submit" class="btnType" style="background-color: #F2F0D6;" onclick="check()">비밀번호찾기</button>
			</div>
		</form>
	</div>
</article>
</div>
</div>
</body>
</html>
