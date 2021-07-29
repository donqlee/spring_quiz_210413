<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 정보</title>
<!-- bootstrap CDN link -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
	<div id="wrap">
		<div class="d-flex">
			<aside class="text-white pb-5">
				<div class="d-flex justify-content-center mt-4">
					<img class="mr-3"
						src="https://www.msit.go.kr/images/user/img_mi_symbol.png"
						alt="mark" width="35"> <span>기상청</span]>
				</div>
				<div>
					<ul class="nav flex-column mt-5">
						<li class="nav-item"><a class="nav-link text-white"
							href="/lesson05/quiz05/weather_history_view">날씨</a></li>
						<li class="nav-item"><a class="nav-link text-white" href="#">날씨입력</a></li>
						<li class="nav-item"><a class="nav-link text-white" href="#">테마날씨</a></li>
						<li class="nav-item"><a class="nav-link text-white" href="#">관측
								기후</a></li>
					</ul>
					<br>
				</div>
			</aside>
			<section class="col-4">
				<div class="ml-5 mt-3">
					<span>날씨 입력</span>
					<form method="post" action="/lesson05/quiz05/add_weather">
						<div class="d-flex justify-content-between mt-3 ml-4">
							<div class="col-auto">
								<label for="date" class="col-form-label">날짜</label>
							</div>
							<div>
								<input id="date" class="form-control" name="date">
							</div>
							<div class="col-auto">
								<label for="weather" class="col-form-label">날씨</label>
							</div>
							<div>
								<select class="form-control" id="weather" name="weather">
									<option value="맑음" selected>맑음</option>
									<option value="흐림">흐림</option>
									<option value="구름조금">구름조금</option>
									<option value="비">비</option>
								</select>
							</div>
							<div class="col-auto">
								<label for="microDust" class="col-form-label">미세먼지</label>
							</div>
							<div>
								<select class="form-control" id="microDust" name="microDust">
									<option selected value="좋음">좋음</option>
									<option value="보통">보통</option>
									<option value="나쁨">나쁨</option>
								</select>
							</div>
						</div>
						<div class="d-flex mt-5 justify-content-between ml-4">
							
								<div class="col-auto">
									<label for="temperatures" class="col-form-label">온도</label>
								</div>
								<div class="input-group">
									<input id="temperatures" class="form-control"
										name="temperatures"> <span class="input-group-text"
										id="basic-addon2">℃</span>
						
							</div>
							<div class="col-auto">
								<label for="precipitation" class="col-form-label">강수량</label>
							</div>
							<div class="input-group">
								<input id="precipitation" class="form-control"
									name="precipitation"> <span class="input-group-text"
									id="basic-addon2">mm</span>
							</div>
							<div class="col-auto">
								<label for="windSpeed" class="col-form-label">풍속</label>
							</div>
							<div class="input-group">
								<input id="windSpeed" class="form-control" name="windSpeed">
								<span class="input-group-text" id="basic-addon2">km/h</span>
							</div>

						</div>
						<div class="d-flex justify-content-end mt-3">
							<button type="submit" class="btn btn-success">저장</button>
						</div>
					</form>
				</div>
			</section>
		</div>
		<script>
			$(document).ready(function() {
				$("#date").datepicker({
					changeMonth : true,
					changeYear : true,
					dateFormat : "yy/mm/dd"
				});
			});
		</script>
		<jsp:include page="footer.jsp" />
</body>
</html>