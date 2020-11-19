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
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<body>
<div id="wrapper">
	<div id="page" class="container">
		<div id="content"><a class="image-style" href="#"><img src="https://ifh.cc/g/zFOXWZ.jpg" width="725" height="300" alt="" /></a>
			<div id="box1" class="post">
				<h2 class="title" id="center"><a>${currentYear}-${currentMonth}-${currentDay}</a></h2>
				<div id="btnStyle2">
					<a href="/admin/cashbookByDay/pre/${currentYear}/${currentMonth}/${currentDay}"><i class='fas fa-angle-double-left' style='font-size:24px'></i></a>
				</div>
				<div id="btnStyle">
					<a href="/admin/cashbookByDay/next/${currentYear}/${currentMonth}/${currentDay}"><i class='fas fa-angle-double-right' style='font-size:24px'></i></a>
				</div>

				<table id="fullListTable">
					<thead>
						<tr>							
							<th>cId</th>
							<th>cKind</th>
							<th>cName</th>
							<th>cPrice</th>
							<th>cContent</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="c" items="${cashbookList}">
							<tr>								
								<td><a href="/admin/cashbookOneList/${c.cashbookId}">${c.cashbookId}</a></td>
								<td>${c.cashbookKind}</td>
								<td>${c.categoryName}</td>
								<td>${c.cashbookPrice}</td>
								<td>${c.cashbookContent}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div id="btnStyle">
					<a href="/admin/addCashbook?currentYear=${currentYear}&currentMonth=${currentMonth}&currentDay=${currentDay}">추가</a>
					<a href="/admin/cashbookByMonth?currentYear=${currentYear}&currentMonth=${currentMonth}">돌아가기</a>
				</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	</div>
	<div class="clearfix">&nbsp;</div>
</div>
</body>
</html>