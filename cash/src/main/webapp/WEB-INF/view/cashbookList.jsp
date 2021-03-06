<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Cashbook</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<link href='http://fonts.googleapis.com/css?family=Satisfy|Fjalla+One|Open+Sans:400,600,700' rel='stylesheet' type='text/css' />
	<link href="${path}/resources/default.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
<div id="wrapper">
	<div id="page" class="container">
		<div id="content"><a class="image-style" href="#"><img src="https://ifh.cc/g/zFOXWZ.jpg" width="725" height="300" alt="" /></a>
			<div id="box1" class="post">
				<h2 class="title"><a>cashbook</a></h2>
				<div id="btnStyle">
					<a href="${path}/admin/cashbookListExcel">엑셀로 다운</a>				
				</div>
				<table id="fullListTable">
					<thead>
						<tr>							
							<th>cId</th>
							<th>cDate</th>
							<th>cKind</th>
							<th>cName</th>
							<th>cPrice</th>
							<th>cContent</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="c" items="${cashbookList}">
							<tr>								
								<td><a href="${path}/admin/cashbookOneList/${c.cashbookId}">${c.cashbookId}</a></td>
								<td>${c.cashbookDate}</td>
								<td>${c.cashbookKind}</td>
								<td>${c.categoryName}</td>
								<td>${c.cashbookPrice}</td>
								<td>${c.cashbookContent}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div id="paging">	
					<a href="${path}/admin/cashbookList/${1}">1</a>
					<a>...</a>
					<c:choose>
						<c:when test="${lastPage < 4 }">
							<c:forEach var="i" begin="${1}" end="${lastPage}">
								<c:choose>
									<c:when test="${i eq currentPage}">
										<a class="currentPage" href="${path}/admin/cashbookList/${i}">${i}</a>	
									</c:when>
									<c:otherwise>
										<a href="${path}/admin/cashbookList/${i}">${i}</a>	
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${currentPage < 4}">
									<c:forEach var="i" begin="${1}" end="${5}">
										<c:choose>
											<c:when test="${i eq currentPage}">
												<a class="currentPage" href="${path}/admin/cashbookList/${i}">${i}</a>	
											</c:when>
											<c:otherwise>
												<a href="${path}/admin/cashbookList/${i}">${i}</a>	
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
								<c:when test="${currentPage > lastPage-3}">
									<c:forEach var="i" begin="${lastPage-4}" end="${lastPage}">
										<c:choose>
											<c:when test="${i eq currentPage}">
												<a class="currentPage" href="${path}/admin/cashbookList/${i}">${i}</a>	
											</c:when>
											<c:otherwise>
												<a href="${path}/admin/cashbookList/${i}">${i}</a>	
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:forEach var="i" begin="${currentPage-2}" end="${currentPage+2}">
										<c:choose>
											<c:when test="${i eq currentPage}">
												<a class="currentPage" href="${path}/admin/cashbookList/${i}">${i}</a>	
											</c:when>
											<c:otherwise>
												<a href="${path}/admin/cashbookList/${i}">${i}</a>	
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
					<a>...</a>
					<a href="${path}/admin/cashbookList/${lastPage}">end</a>		
				</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	</div>
	<div class="clearfix">&nbsp;</div>
</div>
</body>
</html>