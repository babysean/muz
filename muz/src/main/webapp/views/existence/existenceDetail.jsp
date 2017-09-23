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
<script>
$(function(){
	$("#likePosUnlike").click(function(){
		alert("이미 좋아요를 누르셨습니다.");
	});
	$("#unlikePosLike").click(function(){
		alert("이미 싫어요를 누르셨습니다.");
	});
})
</script>
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
						<iframe width="100%" height="450" scrolling="no" frameborder="no" src="${detail.music}"></iframe>
						<br><br>
						${detail.contents}
						</div>
						<div class="col-md-12" style="padding: 70px 50px 50px 50px;">
							<center>
							
							<c:if test="${user ne null}">
								<div class="col-md-6">
									<c:if test="${likePossible eq 'true'}">
										<c:if test="${unLikePossible eq 'true'}">
											<a href="existenceLike.do?no=${detail.no}&id=${user.id}" class="thumbnail" style="width:100px; height: 100px;">
												<img src="/controller/img/good.png" class="img-rounded">
												<label><big>${detail.likes}</big></label>
												<p><small>좋아요</small></p>
											</a>
										</c:if>
										<c:if test="${unLikePossible eq 'false'}">
											<a href="#" id="unlikePosLike" class="thumbnail" style="width:100px; height: 100px;">
												<img src="/controller/img/good.png" class="img-rounded">
												<label><big>${detail.likes}</big></label>
												<p><small>좋아요</small></p>
											</a>
										</c:if>
									</c:if>
									<c:if test="${likePossible eq 'false'}">
										<a href="existenceLikeCancel.do?no=${detail.no}&id=${user.id}" class="thumbnail" style="width:100px; height: 100px;">
											<img src="/controller/img/good.png" class="img-rounded">
											<label><big>${detail.likes}</big></label>
											<p><small>좋아요 취소</small></p>
										</a>
									</c:if>
								</div>
								<div class="col-md-6">
									<c:if test="${unLikePossible eq 'true'}">
										<c:if test="${likePossible eq 'true'}">
											<a href="existenceUnLike.do?no=${detail.no}&id=${user.id}" class="thumbnail" style="width:100px; height: 100px;">
												<img src="/controller/img/bad.png" class="img-rounded">
												<label><big>${detail.unlikes}</big></label>
												<p><small>싫어요</small></p>
											</a>
										</c:if>
										<c:if test="${likePossible eq 'false'}">
											<a href="#" id="likePosUnlike" class="thumbnail" style="width:100px; height: 100px;">
												<img src="/controller/img/bad.png" class="img-rounded">
												<label><big>${detail.unlikes}</big></label>
												<p><small>싫어요</small></p>
											</a>
										</c:if>
									</c:if>
									<c:if test="${unLikePossible eq 'false'}">
										<a href="existenceUnLikeCancel.do?no=${detail.no}&id=${user.id}" class="thumbnail" style="width:100px; height: 100px;">
											<img src="/controller/img/bad.png" class="img-rounded">
											<label><big>${detail.unlikes}</big></label>
											<p><small>싫어요 취소</small></p>
										</a>
									</c:if>
								</div>
							</c:if>
							
							</center>
						</div>
					</div>

					<div class="col-md-12" style="margin-bottom: 50px; background-color: #EFEFEF; border-top: 1px solid #DCDCDC; border-bottom: 1px solid #DCDCDC; padding: 12px 30px 5px 30px; color: #696969;">
					</div>
					
					<div class="col-md-12" style="text-align: center;">
						<a href="self-Existence.do?pages=1" role="button" class="btn btn-danger">뒤로가기</a>
					</div>
					
				</div>
			</div>
			<div class="row rowDiv">		
				<h3><label><big class="marked"><strong>댓</strong></big>글</label></h3>
				<hr>
				
				<!-- 댓글 -->
				<div class="col-md-12" style="padding: 50px;">
					<c:if test="${user ne null}">
						<form action="existenceReplyProcess.do" method="post">
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
					
					<c:if test="${existenceReplyList ne null}">
						<c:forEach var="i" items="${existenceReplyList}">
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