<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 목록</title>
<!-- bootstrap CDN link -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
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
		<h1>즐겨찾기 목록</h1>
		<table class="table text-center" id="table">
			<thead>
				<tr>
					<th>No.</th>
					<th>이름</th>
					<th>주소</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="favorite" items="${favoriteList}" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td>${favorite.name}</td>
						<td>${favorite.url}</td>
						<!--방법 1 name 속성과 value 속성을 이용해서 동적으로 삭제 버튼 감지-->
						<%-- <td><button class="btn btn-danger" name="delBtn" value="${favorite.id}">삭제</button></td> --%>
						<!--방법 2  data 이용해서 태그에 data를 임시 저장해놓기-->
						<td><button class="favorite-btn btn btn-danger" data-favorite-id="${favorite.id}">삭제</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script>
		$(document).ready(function(){
			//방법 1 name 속성과 value 속성을 이용해서 동적으로 삭제 버튼 감지
			/* $('td').on('click', 'button[name=delBtn]',function(){
				let id = $(this).attr('value');
			}); */
			// 방법 2 data 이용해서 태그에 data를 임시 저장해놓기
			// 태그 : data-favorite-id data- 그뒤부터는 우리가 이름을 정한다.
			$('.favorite-btn').on('click', function(){
				let favoriteId = $(this).data('favorite-id');
				//alert(favoriteId);
				$.ajax({
					type: 'post'
					, data: {'favorite_id' : favoriteId}
					, url: '/lesson06/quiz02/delete_favorite'
					, success: function(data){
						alert(data);
						if (data == 'success'){
							location.reload();
						} else{
							alert("서버에서 삭제 처리를 하지 못했습니다. 관리자에게 문의 해주세요")
						}
					}, error: function(e){
						alert("error:" + e);
					}
					
				})
			});
		});


	</script>
</body>
</html>