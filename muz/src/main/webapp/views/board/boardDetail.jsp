<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MUZ - Musician Universal Zone</title>
<link rel="stylesheet" href="/controller/css/main.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="container-fluid">
			<jsp:include page="../navigationBar/bar.jsp"/>
			<div class="row rowDiv">
				<div class="col-md-12">
					<h2 align="left"><label>${detail.title}</label></h2>
					<hr>
					<div class="col-md-12" style="background-color: #EFEFEF; border-top: 1px solid #DCDCDC; border-bottom: 1px solid #DCDCDC; padding: 12px 30px 5px 30px; color: #696969;">
						<label class="pull-left"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> ${detail.writer}</label>
						<label class="pull-left">&nbsp; &nbsp; &nbsp; &nbsp;<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> ${detail.hit}</label>
						<label class="pull-right"><span class="glyphicon glyphicon-time" aria-hidden="true"></span> ${detail.regdate}</label>
					</div>
					<div class="col-md-12" style="padding: 50px;">
						<div class="col-md-12">
						${detail.contents}
						</div>
						<c:if test="${user ne null}">
							<c:if test="${likePossible eq 'true'}">
								<div class="col-md-12" style="padding: 70px 50px 50px 50px;">
									<center>
										<a href="likes.do?no=${detail.no}&id=${user.id}" class="thumbnail" style="width:100px; height: 100px;">
											<img src="/controller/img/good.png" class="img-rounded">
											<label><big>${detail.likes}</big></label>
											<p><small>좋아요</small></p>
										</a>
									</center>
								</div>
							</c:if>
							<c:if test="${likePossible eq 'false'}">
								<div class="col-md-12" style="padding: 70px 50px 50px 50px;">
									<center>
										<a href="unLikes.do?no=${detail.no}&id=${user.id}" class="thumbnail" style="width:100px; height: 100px;">
											<img src="/controller/img/good.png" class="img-rounded">
											<label><big>${detail.likes}</big></label>
											<p><small>좋아요 취소</small></p>
										</a>
									</center>
								</div>
							</c:if>
						</c:if>
					</div>

					<div class="col-md-12" style="margin-bottom: 50px; background-color: #EFEFEF; border-top: 1px solid #DCDCDC; border-bottom: 1px solid #DCDCDC; padding: 12px 30px 5px 30px; color: #696969;">
					</div>
					
					<div class="col-md-12" style="text-align: center;">
						<a href="board.do?pages=1" role="button" class="btn btn-danger">뒤로가기</a>
					</div>
					
				</div>
			</div>
			<div class="row rowDiv">		
				<h3><label><big class="marked"><strong>댓</strong></big>글</label></h3>
				<hr>
				
				<!-- 댓글 -->
				<div class="col-md-12" style="padding: 50px;">
					<c:if test="${user ne null}">
						<form action="boardReplyInsert.do" method="post">
							<div class="col-md-12" style="padding: 0px 50px 80px 50px;">
								<div class="col-md-11">
									<textarea class="form-control textarea" rows="1" id="contents" name="contents" style="resize: none;"></textarea>
								</div>
								<div>
									<input type="hidden" name="nickname" value="${user.nickname}">
									<input type="hidden" name="picture" value="${user.picture}">
									<input type="hidden" name="pnum" value="${detail.no}">
									<input type="hidden" name="id" value="${user.id}">
								</div>
								<div class="col-md-1">
									<button type="sumbit" class="btn btn-primary">댓글달기</button>
								</div>
							</div>
						</form>
					</c:if>
					
					<c:if test="${boardReplyList ne null}">
						<c:forEach var="i" items="${boardReplyList}">
							<div class="col-md-12" style="border: 1px solid #DCDCDC; padding: 35px 20px 20px 20px; margin: 0px 0px 40px 0px;">
								<div class="col-xs-2 col-md-2">
									<a href="#" class="thumbnail">
										<img src="${i.picture}">
									</a>
							    </div>
								<div class="col-xs-10 col-md-10">
									<div class="col-md-12">
										<label class="pull-left"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>  ${i.nickname}</label>
										<label class="pull-right"><span class="glyphicon glyphicon-time" aria-hidden="true"></span> ${i.regdate}</label>
									</div>
									<div class="col-md-12" style="padding-top: 20px;">
										${i.contents}
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
</html>