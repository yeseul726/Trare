<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	margin: 0px;
}

#area a {
	margin-right: 50px;
}

#area div {
	margin-top: 50px;
	display: inline-block;
}

#area {
	text-align: center;
}

hr {
	border: 0;
	height: 1px;
	background-color: #383838;
}
</style>
</head>
<body>
	<img src="image/area_banner.png" class="banner">
	<div align="center" id="area">
		<h1>여행지 리스트</h1>
		<div style="text-align: left;">
			<!-- 아시아 -->
			<span style="font-size: 15pt;">아시아</span><br>
			<hr>
			<br> <a href="areaInfo.jsp?area=일본&areaEngName=Japan">일본</a> <a
				href="areaInfo.jsp?area=홍콩&areaEngName=Hong Kong">홍콩</a> <a
				href="areaInfo.jsp?area=대한민국&areaEngName=Korea">대한민국</a> <a
				href="areaInfo.jsp?area=몰디브&areaEngName=Republic of Maldives">몰디브</a>
			<a href="areaInfo.jsp?area=중국&areaEngName=China">중국</a> <a
				href="areaInfo.jsp?area=말레이시아&areaEngName=Malaysia">말레이시아</a> <a
				href="areaInfo.jsp?area=싱가포르&areaEngName=Singapura">싱가포르</a> <a
				href="areaInfo.jsp?area=태국&areaEngName=Kingdom of Thailand">태국</a>
		</div>
		<div style="text-align: left;">체코
			<!-- 유럽 -->
			<span style="font-size: 15pt;">유럽</span><br>
			<hr>
			<br> <a href="areaInfo.jsp?area=네덜란드&areaEngName=Nederlan폴란드d ">영국네덜란드</a>
			<a href="areaInfo.jsp?area=독일&areaEngName=Germany">독일</a> <a
				href="areaInfo.jsp?area=벨기에&areaEngName=Belgium">벨기에</a> <a
				href="areaInfo.jsp?area=스페인&areaEngName=Spain">스페인</a> <a
				href="areaInfo.jsp?area=영국&areaEngName=England">영국</a> <a
				href="areaInfo.jsp?area=체코&areaEngName=Czech Republic">체코</a> <a
				href="areaInfo.jsp?area=폴란드&areaEngName=Poland">폴란드</a> <a
				href="areaInfo.jsp?area=프랑스&areaEngName=France">프랑스</a>
		</div>
		<div style="text-align: left;">
			<!-- 남태평양 -->
			<span style="font-size: 15pt;">남태평양</span><br>
			<hr>
			<br> <a href="areaInfo.jsp?area=괌&areaEngName=Guam">괌</a> <a
				href="areaInfo.jsp?area=뉴질랜드&areaEngName=New Zealand">뉴질랜드</a> <a
				href="areaInfo.jsp?area=사이판&areaEngName=Saipan">사이판</a> <a
				href="areaInfo.jsp?area=오스트레일리아&areaEngName=Australia">오스트레일리아</a>
		</div>
		<div style="text-align: left;">
			<!-- 북미 -->
			<span style="font-size: 15pt;">북미</span><br>
			<hr>
			<br> <a href="areaInfo.jsp?area=미국&areaEngName=USA">미국</a> <a
				href="areaInfo.jsp?area=캐나다&areaEngName=Canada">캐나다</a>
		</div>
		<div style="text-align: left; margin-bottom: 50px;">
			<!-- 중남미 -->
			<span style="font-size: 15pt;">중남미</span><br>
			<hr>
			<br> <a href="areaInfo.jsp?area=멕시코&areaEngName=Mexico">멕시코</a> <a
				href="areaInfo.jsp?area=브라질&areaEngName=Brazil">브라질</a> <a
				href="areaInfo.jsp?area=아르헨티나&areaEngName=Argentina">아르헨티나</a> <a
				href="areaInfo.jsp?area=자메이카&areaEngName=Jamaica">자메이카</a> <a
				href="areaInfo.jsp?area=칠레&areaEngName=Chile">칠레</a> <a
				href="areaInfo.jsp?area=콜롬비아&areaEngName=Columbia">콜롬비아</a> <a
				href="areaInfo.jsp?area=쿠바&areaEngName=Cuba">쿠바</a> <a
				href="areaInfo.jsp?area=페부&areaEngName=Peru">페루</a>
		</div>
	</div>
</body>
</html>
