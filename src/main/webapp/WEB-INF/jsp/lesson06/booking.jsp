<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무 팬션</title>
<!-- bootstrap CDN link -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="/css/lesson06/booking.css">
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
	<div class="container">
		<jsp:include page="header.jsp" />
		<div class="contents">
			<h2 class="mt-4 text-center">예약하기</h2>
			
			<label for="name">이름</label>
			<input type="text" class="form-control mt-1" id="name">
			<label for="date"><div class="mt-2">예약날짜</div></label>
			<input type="text" class="form-control mt-1" id="date">
			<label for="day"><div class="mt-2">숙박일수</div></label>
			<input type="text" class="form-control mt-1" id="day">
			<label for="headcount"><div class="mt-2">숙박인원</div></label>
			<input type="text" class="form-control mt-1" id="headcount">
			<label for="phoneNumber"><div class="mt-2">전화번호</div></label>
			<input type="text" class="form-control mt-1" id="phoneNumber">
			<button id="addBtn" class="btn btn-warning form-control mt-3">예약하기</button>
			
		</div>
		<jsp:include page="footer.jsp" />
	</div>
	<script>
		$(document).ready(function(){
			 $( "#date" ).datepicker({
				    dateFormat: 'yy-mm-dd'
				  });
			
			
			$('#addBtn').on('click', function(){
				
		 		let name = $('#name').val().trim();
				if (name == ''){
					alert('이름을 입력해주세요');
					return;
				}
				let date = $('#date').val().trim();
				if (date == ''){
					alert('예약날짜를 입력해주세요');
					return;
				}
				let day = $('#day').val().trim();
				if (day == ''){
					alert('숙박일수를 입력해주세요');
					return;
				}
				let headcount = $('#headcount').val().trim();
				if (headcount == ''){
					alert('숙박인원을 입력해주세요');
					return;
				}
				let phoneNumber = $('#phoneNumber').val().trim();
				if (phoneNumber == ''){
					alert('전화번호를 입력해주세요');
					return;
				}
				$.ajax({
					type: 'POST'
					, url: '/lesson06/quiz03/add_booking'
					, data: {'name': name, 'data': date, 'day': day, 'headcount' : headcount, 'phoneNumber' : phoneNumber}
					, dataType: 'json'
					, success: function(data){
						alert(data.result);
						location.href = '/lesson06/quiz03/bookingList'
					}
					, error: function(e){
						console.log(e);
						alert('error' + e);
					}
				}); 
			});
		});
	</script>
</body>
</html>