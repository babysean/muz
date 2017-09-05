<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MUZ - Musician Universal Zone</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="/controller/css/main.css" rel="stylesheet">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
	$("input#tel3").blur(function(){
		$("input#tel").attr("value","010-"+$("input#tel2").val()+"-"+$("input#tel3").val());
	});
})
</script>
</head>
<body>
	<div class="container">
		<div class="container-fluid">
			<jsp:include page="navigationBar/bar.jsp" />
			<div class="row rowDiv">
				<div class="col-md-12">
					<label><big class="marked"><strong>회</strong></big>원가입</label>
					<hr>
					<form action="signUpProcess.do" method="post" class="form-horizontal" enctype="multipart/form-data">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">아이디</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="id" name="id" placeholder="Id">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">비밀번호</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="pw" name="pw" placeholder="Password">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">사진</label>
							<div class="col-sm-10">
								<input type="file" class="form-control" id="picture" name="picture" placeholder="Picture">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">이름</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="name" name="name" placeholder="Name">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">닉네임</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="nickname" name="nickname" placeholder="Nick Name">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">전화번호</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="tel1" value="010" readonly="readonly">
							</div>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="tel2" placeholder="Middle Number">
							</div>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="tel3" placeholder="Last Number">
							</div>
							<input type="hidden" id="tel" name="tel">
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-primary">회원가입</button>
								<a href="index.do" role="button" class="btn btn-warning">뒤로가기</a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<!-- <span class="glyphicon glyphicon-edit"></span> -->