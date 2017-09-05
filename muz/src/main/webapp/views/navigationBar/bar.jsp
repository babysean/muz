<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<nav class="navbar navbar-default navbar-fixed-top barNav">
	<center>
		<div id="logoDiv">
			<a href="index.do"><img src="/controller/img/logo.png" class="img-responsive" alt="Responsive image"></a>
		</div>
	</center>
	
	<div class="container-fluid barDiv">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<a class="navbar-brand" href="index.do"><span class="glyphicon glyphicon-home barText" aria-hidden="true"></span></a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="board.do?pages=1"><strong class="barText">자유게시판</strong></a></li>
				<li><a href="self-Existence.do?pages=1"><strong class="barText">자작곡</strong></a></li>
				<li><a href="market.do?pages=1"><strong class="barText">뮤즈장터</strong></a></li>
			</ul>
			<c:if test="${user ne null}">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><strong class="barText"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> ${user.nickname}</strong> </a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
							<strong class="barText"><span class="glyphicon glyphicon-align-left" aria-hidden="true"></span></strong>
						</a>
						<ul class="dropdown-menu" role="menu">
							<li class="menuLi"><small class="menuText">내 메뉴</small></li>
							<li class="divider"></li>
							<li><a href="#"><span class="glyphicon glyphicon-music" aria-hidden="true"></span> <small>POINT</small></a></li>
							<li><a href="#"><span class="glyphicon glyphicon-headphones" aria-hidden="true"></span> <small>내자작곡</small></a></li>
							<li><a href="#"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> <small>내글관리</small></a></li>
							<li><a href="#"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> <small>정보수정</small></a></li>
							<li><a href="#"><span class="glyphicon glyphicon-bookmark" aria-hidden="true"></span> <small>내크루</small></a></li>
							<li><a href="#"><span class="glyphicon glyphicon-inbox" aria-hidden="true"></span> <small>스크랩</small></a></li>
							<li><a href="#"><span class="glyphicon glyphicon-heart" aria-hidden="true"></span> <small>위시리스트</small></a></li>
							<li><a href="#"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span> <small>탈퇴하기</small></a></li>
							<li class="divider"></li>
							<li class="menuLi"><small class="menuText">쇼핑</small></li>
							<li class="divider"></li>
							<li><a href="#"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> <small>장바구니</small></a></li>
							<li><a href="#"><span class="glyphicon glyphicon-plane" aria-hidden="true"></span> <small>주문/배송</small></a></li>
							<li class="divider"></li>
							<li><a href="logout.do"><button type="button" id="logoutBtn" class="btn btn-danger"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span> <small>LOGOUT</small></button></a></li>
						</ul>
					</li>
				</ul>
			</c:if>
		</div>
	<!-- /.navbar-collapse -->
	</div>
<!-- /.container-fluid --> 
</nav>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>