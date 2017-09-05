<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MUZ - Musician Universal Zone</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="/controller/css/main.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="container-fluid">
			<jsp:include page="navigationBar/bar.jsp" />
			<div class="row rowDiv">
				<div class="col-md-12">
					<h3>
						<label><big class="marked"><strong>뮤</strong></big>즈장터</label>
					</h3>
					<hr>
					<c:if test="${user ne null}">
						<div align="right">
							<a href="marketEdit.do" role="button" class="btn btn-primary">글쓰기</a>
						</div>
					</c:if>
					<div class="row">
						<c:forEach var="i" items="${marketList}">
							<div class="col-sm-6 col-md-3">
								<div class="thumbnail productDiv">
									<img src="${i.picture}">
									<div class="caption">
										<h4>${i.title}</h4>
										<div class="locationDiv">
										<p>위치 - ${i.location}</p>
										</div>
										<div class="marketPriceDiv"><h3>₩ ${i.price}</h3></div>
										<h6><span class="glyphicon glyphicon-user marketPerson" aria-hidden="true"></span> ${i.writer}
											<div class="marketSeeDiv"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> ${i.hit}</div>
										</h6>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="row rowDiv">
				<jsp:include page="pagination/pagination.jsp" />
			</div>
		</div>
	</div>
</body>
</html>