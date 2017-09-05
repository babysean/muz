<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<jsp:useBean id="toDay" class="java.util.Date"/>
	<div class="container">
		<div class="container-fluid">
			<jsp:include page="../navigationBar/bar.jsp"/>
			<div class="row rowDiv">
				<div class="col-md-12">
					<h3 align="left"><label><big class="marked"><strong>자</strong></big>유게시판</label></h3>
					<h4 align="left"><label><big class="marked"><strong>글</strong></big>쓰기</label></h4>
					<hr>
					<form action="boardEditProcess.do" method="post">
						<div class="col-md-12">
							<div class="form-group col-md-6">
								<label for="inputEmail3" class="col-sm-2 control-label">작성자</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="writer" name="writer" value="${user.nickname}" readonly="readonly">
								</div>
							</div>
							<div class="form-group col-md-6">
								<label for="inputEmail3" class="col-sm-2 control-label">작성시간</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="today" name="today" value="<fn:formatDate value="${toDay}" pattern="yyyy-MM-dd"/>" readonly="readonly">
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group col-md-12">
								<label for="inputEmail3" class="col-sm-1 control-label">제목</label>
								<div class="col-sm-11">
									<input type="text" class="form-control" id="title" name="title">
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group col-md-12">
								<label for="inputEmail3" class="col-sm-1 control-label">내용</label>
								<div class="col-sm-11">
									<textarea class="form-control textarea" rows="15" id="contents" name="contents" style="resize: none;"></textarea>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="col-md-12" align="right">
								<button type="submit" class="btn btn-primary">등록하기</button>
								<a href="board.do?pages=1" role="button" class="btn btn-danger">뒤로가기</a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>