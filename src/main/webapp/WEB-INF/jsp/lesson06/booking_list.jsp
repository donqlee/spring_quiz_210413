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
</head>
<body>
	<div class="container">
		<jsp:include page="header.jsp" />
		<div class="text-center">
			<h2 class="mt-4">예약목록보기</h2>
			<table class="table mt-4">
				<thead>
					<tr>
						<th>이름</th>
						<th>예약날짜</th>
						<th>숙박일수</th>
						<th>숙박인원</th>
						<th>전화번호</th>
						<th>예약상태</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="booking" items="${booking}">
						<tr>
							<td>${booking.name}</td>
							<td><fmt:formatDate value="${booking.date}"
									pattern="yyyy년 M월 d윌" /></td>
							<td>${booking.day}</td>
							<td>${booking.headcount}</td>
							<td>${booking.phoneNumber}</td>
							<c:choose>
								<c:when test="${booking.state eq '대기중'}">
									<td class="text-info">${booking.state}</td>
								</c:when>
								<c:when test="${booking.state eq '확정'}">
									<td class="text-success">${booking.state}</td>
								</c:when>
								<c:when test="${booking.state eq '취소'}">
									<td class="text-suc">${booking.state}</td>
								</c:when>
							</c:choose>
							<td><button class="btn btn-danger btnId" data-booking-id="${booking.id}">삭제</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
	<script>
		$(document).ready(function(){
			$('.btnId').on('click', function(){
				let bookingId = $(this).data('booking-id');
				$.ajax({
					type: 'post'
					, data: {'bookingId' : bookingId}
					, url: '/lesson06/quiz03/delete_booking'
					, success: function(data){
						alert(data);
						if (data == 'success'){
							location.reload();
						}else{
							alert("삭제 실패")
						}
					}
					, error: function(e){
						alert("error:" + e);
					}
				})
			});
		});
	</script>
</body>
</html>