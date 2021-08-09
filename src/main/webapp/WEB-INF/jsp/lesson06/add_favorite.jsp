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
		<label for="name"><div>제목</div></label>
		<input type="text" class="form-control" id="name">
		
		<label for="url"><div>주소</div></label>
		<div class="d-flex">
		<input type="text" class="form-control col-80% mr-4" id="url">
		<input type="button" class="form-control btn btn-info col-1" id="checkBtn" value="중복확인">
		</div>
		<div id="statusArea"></div>
		<input type="button" class="btn btn-success form-control mt-3"  id="addBtn" value="추가">
	</div>
	<script>
		$(document).ready(function(){
			$('#checkBtn').on('click', function(){
				$('#statusArea').empty();
				let url = $('#url').val().trim();
				if(url==''){
					$('#statusArea').append("<small class='text-danger'>url이 비어있습니다.</small>")
				};
				$.ajax({
					type:'get'
					, data: {'url': url}
					, url: '/lesson06/quiz02/is_duplication'
					, success: function(data){
						//alert(data.is_duplication);
						if(data.is_duplication == true){
							$('#statusArea').append("<small class='text-danger'>이미 등록된 url 입니다.</small>")
						}
					}
					, error: function(e){
						alert("error" + e);
					}
					
				})
			});
			
			
			$('#addBtn').on('click', function(e){
			
			// validation check
			let name = $('#name').val().trim();
			if(name==''){
				alert('제목을 입력해주세요.');
				return;
			}
			let url = $('#url').val().trim();
			if(url==''){
				alert('url을 입력해주세요.');
				return;
			}
	 		if(url.startsWith("http") === false && url.startsWith("https") === false){
				alert("주소 형식이 잘못되었습니다.");
				return;
			} 
			$.ajax({
				type: 'POST'
				, url: '/lesson06/quiz01/add_favorite'
				, data: {'name':name, 'url':url}
				, dataType: 'json' 
				, success: function(data){
					//alert(data);
					alert(data.result);
					location.href = "/lesson06/quiz01/favorite_view";
				}, error: function(e){
					alert("error" + e);
				}
			});	
			})	
		});
	</script>
</body>
</html>