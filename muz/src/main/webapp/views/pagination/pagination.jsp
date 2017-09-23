<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<center>

	<nav>
		<ul class=" pager">
			<li class="previous">
				<a href="${mode}?pages=1">
					<span aria-hidden="true">&larr;</span> 처음
				</a>
			</li>
			
			<c:choose>
				<c:when test="${pageBean.currentPage == 1}">
					<li>
						<a href="#">이전</a>
					</li>
				</c:when>
				<c:when test="${pageBean.currentPage <= pageBean.totalPage}">
					<li>
						<a href="${mode}?pages=${pageBean.currentPage-1}">이전</a>
					</li>
				</c:when>
			</c:choose>
			
			<span> 
				<c:forEach var="i" begin="${pageBean.startPage}" end="${pageBean.endPage}" step="1">
					<c:choose>
						<c:when test="${pageBean.currentPage == i}">
							<li>
		 						<a href="${mode}?pages=${i}"><strong>${i}</strong></a>
		 					</li>
						</c:when>
						<c:otherwise>
							<li>
		 						<a href="${mode}?pages=${i}">${i}</a>
		 					</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</span>
			
			<c:choose>
				<c:when test="${pageBean.currentPage == pageBean.totalPage}">
					<li>
						<a href="#">다음</a>
					</li>
				</c:when>
				<c:when test="${pageBean.currentPage < pageBean.totalPage}">
					<li>
						<a href="${mode}?pages=${pageBean.currentPage+1}">다음</a>
					</li>
				</c:when>
			</c:choose>
			
			<li class="next">
				<a href="${mode}?pages=${pageBean.totalPage}">
					끝 <span aria-hidden="true">&rarr;</span>
				</a>
			</li>
		</ul>
	</nav>
	
</center>