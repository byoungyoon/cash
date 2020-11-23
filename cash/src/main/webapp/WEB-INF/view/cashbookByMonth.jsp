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
			<h2 class="title" id="center"><a>${currentYear}-${currentMonth}</a></h2>
			<div id="btnStyle2">
				<a href="${path}/admin/cashbookByMonth?currentYear=${currentYear}&currentMonth=${currentMonth-1}"><i class='fas fa-angle-double-left' style='font-size:24px'></i></a>
			</div>
			<div id="btnStyle">
				<a href="${path}/admin/cashbookByMonth?currentYear=${currentYear}&currentMonth=${currentMonth+1}"><i class='fas fa-angle-double-right' style='font-size:24px'></i></a>
			</div>
				<table id="cashbookTable">
					<thead>
						<tr>
							<th class="sunday">일</th>
							<th>월</th>
							<th>화</th>
							<th>수</th>
							<th>목</th>
							<th>금</th>
							<th>토</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<c:forEach var="i" begin="1" end="${lastDay+(firstDayOfWeek-1)}" step="1">
								<c:if test="${i-(firstDayOfWeek-1) < 1}">
									<td>&nbsp;</td>
								</c:if>
								<c:if test="${i-(firstDayOfWeek-1) > 0}">
									<td>
										<div><!-- 날짜 -->
											<a href="${path}/admin/cashbookByDay/now/${currentYear}/${currentMonth}/${i-(firstDayOfWeek-1)}">
												${i-(firstDayOfWeek-1)}
											</a>
										</div>
									
										<div id="cashStyle">
										<!-- 지출/수입 목록이 있는 날짜를 cashList에서 검색 -->
										<c:forEach var="c" items="${cashList}">
											<c:if test="${i-(firstDayOfWeek-1) == c.dday}">
												<c:if test="${c.cashbookKind == '수입'}">
													<div class="green">+${c.cashbookPrice}</div>
												</c:if>
												<c:if test="${c.cashbookKind == '지출'}">
													<div class="red">-${c.cashbookPrice}</div>
												</c:if>
											</c:if>
										</c:forEach>
										</div>
									</td>
								</c:if>
								<c:if test="${i%7 == 0}">
									</tr>
									<tr>
								</c:if>
							</c:forEach>
							
							<c:if test="${(lastDay+(firstDayOfWeek-1)) % 7 != 0}">
								<c:forEach begin="1" end="${7- ((lastDay+(firstDayOfWeek-1)) % 7)}" step="1">
									<td>&nbsp;</td>
								</c:forEach>
							</c:if>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	</div>
	<div class="clearfix">&nbsp;</div>
</div>
</body>
</html>