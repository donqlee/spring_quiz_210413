<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 추가하기</title>
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
		<h1>즐겨찾기 추가하기</h1>
		<div>제목</div>
		<input type="text" class="form-control" id="name">
		<div>주소</div>
		<input type="text" class="form-control" id="url">
		<input type="button" class="btn btn-success form-control mt-3"  id="addBtn" value="추가">
	</div>
	<script>
		$(document).ready(function(){
			$('#addBtn').on('click', function(e){
			
			// validation check
			let name = $('#name').val().trim();
			if(name==''){
				alert('이름을 입력해주세요.');
				return;
			}
			let url = $('#url').val().trim();
			if(url==''){
				alert('url을 입력해주세요.');
				return;
			}
			$.ajax({
				type: 'POST'
				, url: '/lesson06/quiz01/add_favorite'
				, data: {'name':name, 'url':url}
				, success: function(data){
					location.href = "/lesson06/quiz01/favorite_view";
				}, complete: function(data){
					alert("완료");
				}, error: function(e){
					alert("error" + e);
				}
			});	
			})
			
		});
	</script>
</body>
</html>