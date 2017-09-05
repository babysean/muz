<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MUZ - Musician Universal Zone</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="/controller/css/main.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="container-fluid">
			<jsp:include page="navigationBar/bar.jsp"/>
			<div class="row rowDiv">
				<div class="col-md-9">
					<jsp:include page="carousel/carousel.jsp"/>
				</div>
				<div class="col-md-3">
					<c:if test="${user eq null}">
						<label><big class="marked"><strong>로</strong></big>그인</label>
						<hr>
						<form action="loginProcess.do" method="post">
							<div class="input-group form-group">
								<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
								<input type="text" class="form-control" id="id" name="id" placeholder="아이디">
							</div>
							<div class="input-group form-group">
								<span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
								<input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호">
							</div>
							<div class="input-group form-group" id="loginDiv">
								<button type="submit" id="loginBtn" class="btn btn-primary"><span class="glyphicon glyphicon-log-in"></span> <small>LOGIN</small></button>
							</div>
						</form>
						<div class="input-group form-group" id="signupDiv">
							<a href="signUp.do" id="signupA">회원가입</a>
						</div>
					</c:if>
					<c:if test="${user ne null}">
						<label><big class="marked"><strong>프</strong></big>로필</label>
						<hr>
						<div class="row rowDiv">
							<div class="col-md-6">
								<a href="#" class="thumbnail">
									<img src="${user.picture}">
								</a>
							</div>
							<div class="col-md-6">
								<h4><label>${user.id}</label></h4>
								<h6>${user.nickname}</h6>
								<h6>${user.tel}</h6>
							</div>
						</div>
						<div class="col-md-12">
							<a href="logout.do" role="button" id="logoutBtn" class="btn btn-danger"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span> <small>LOGOUT</small></a>
						</div>
					</c:if>
				</div>
			</div>
			<div class="row rowDiv">
				<div class="col-md-4">
					<label><big class="marked"><strong>자</strong></big>유게시판</label><a href="board.do?pages=1"><small class="Smallplus"><span class="glyphicon glyphicon-plus"></span></small></a>
					<hr>
					<div class="table-responsive">
						<table class="table-hover">
							<c:forEach var="i" items="${mainPageBoard}">
								<tr>
									<td width="80%"><small>${i.title}</small></td>
									<td width="20%"><small>${i.regdate}</small></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<div class="col-md-4">
					<label><big class="marked"><strong>자</strong></big>작곡</label><a href="self-Existence.do?pages=1"><small class="Smallplus"><span class="glyphicon glyphicon-plus"></span></small></a>
					<hr>
					<div class="table-responsive">
						<table class="table-hover">
							<c:forEach var="i" items="${mainPageExistence}">
								<tr>
									<td width="80%"><small>${i.title}</small></td>
									<td width="20%"><small>${i.regdate}</small></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<div class="col-md-4">
					<label><big class="marked"><strong>뮤</strong></big>즈장터</label><a href="market.do?pages=1"><small class="Smallplus"><span class="glyphicon glyphicon-plus"></span></small></a>
					<hr>
					<div class="table-responsive">
						<table class="table-hover">
							<c:forEach var="i" items="${mainPageMarket}">
								<tr>
									<td width="80%"><small>${i.title}</small></td>
									<td width="20%"><small>${i.regdate}</small></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>