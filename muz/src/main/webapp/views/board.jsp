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
<script src="/controller/js/main.js"></script>
</head>
<script>
$(function(){
	$("tr.boardDetailTr").click(function(){
		var no = $(this).attr("id");
		location.href="boardDetail.do?no="+no+"&id="+$(".userid").val();
	});
})
</script>
<body>
	<div class="container">
		<div class="container-fluid">
			<jsp:include page="navigationBar/bar.jsp"/>
			<div class="row rowDiv">
				<div class="col-md-12">
					<h3><label><big class="marked"><strong>자</strong></big>유게시판</label></h3>
					<hr>
					<c:if test="${user ne null}">
						<div align="right">
							<a href="boardEdit.do" role="button" class="btn btn-primary">글쓰기</a>
						</div>
					</c:if>
					<div class="table-responsive rowDiv">
						<table class="table table-hover">
							<thead>
								<tr>
									<th width="10%">번호</th>
									<th width="40%">제목</th>
									<th width="20%">글쓴이</th>
									<th width="10%">날짜</th>
									<th width="10%">조회수</th>
									<th width="10%">추천수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="i" items="${list}">
									<tr class="boardDetailTr" id="${i.no}">
										<td class="centerTd">${i.no}</td>
										<td>${i.title}</td>
										<td>${i.writer}</td>
										<td class="centerTd">${i.regdate}</td>
										<td class="centerTd">${i.hit}</td>
										<td class="centerTd">${i.likes}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<input type="hidden" class="userid" value="${user.id}">
					</div>
				</div>
			</div>
			<div class="row rowDiv">
				<jsp:include page="pagination/pagination.jsp"/>
			</div>
		</div>
	</div>
</body>
</html>