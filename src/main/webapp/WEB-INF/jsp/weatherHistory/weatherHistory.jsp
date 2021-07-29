<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WeatherHistory</title>
<!-- bootstrap CDN link -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="/css/lesson05/weather_style.css">

<script src="https://code.jquery.com/jquery-3.2.1.js"
	integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
</head>
<body>
	<div id="wrap">
		<div class="d-flex">
			<aside class="text-white">
				<div class="d-flex justify-content-center mt-4">
					<img class="mr-3"
						src="https://www.msit.go.kr/images/user/img_mi_symbol.png"
						alt="mark" width="35"> <span>기상청</span]>
				</div>
				<div>
					<ul class="nav flex-column mt-5">
						<li class="nav-item"><a class="nav-link text-white"
							href="/lesson05/quiz05/weather_history_view">날씨</a></li>
						<li class="nav-item"><a class="nav-link text-white" 
							href="/lesson05/quiz05/add_weather_view">날씨입력</a></li>
						<li class="nav-item"><a class="nav-link text-white" href="#">테마날씨</a></li>
						<li class="nav-item"><a class="nav-link text-white" href="#">관측
								기후</a></li>

					</ul>
				</div>
			</aside>
			<section>
				<div class="ml-5 mt-3">
					<span>과거날씨</span>
					<table class="table text-center">
						<thead>
							<tr>
								<th>날짜</th>
								<th>날씨</th>
								<th>기온</th>
								<th>강수량</th>
								<th>미세먼지</th>
								<th>풍속</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="history" items="${weatherHistoryList}"
								varStatus="status">
								<tr>
									<td><fmt:formatDate value="${history.date}"
											pattern="yyyy년 M월 d일" /></td>
									<c:choose>
										<c:when test="${history.weather eq '비'}">
											<td><img
												src="/images/rainy.jpg"
												alt="비" /></td>
										</c:when>
										<c:when test="${history.weather eq '흐림'}">
											<td><img
												src="/images/cloudy.jpg"
												alt="흐림" /></td>
										</c:when>
										<c:when test="${history.weather eq '구름조금'}">
											<td><img
												src="/images/partlyCloudy.jpg"
												alt="구름조금" /></td>
										</c:when>
										<c:otherwise>
											<td><img
												src="/images/sunny.jpg"
												alt="맑음" /></td>
										</c:otherwise>
									</c:choose>
									<td>${history.temperatures}℃</td>
									<td>${history.precipitation}mm</td>
									<td>${history.microDust}</td>
									<td>${history.windSpeed}km/h</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</section>
		</div>
		<jsp:include page="footer.jsp" />
	</div>

</body>
</html>