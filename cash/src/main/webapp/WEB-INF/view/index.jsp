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
	<style>
		.row {
		  display: flex;
		}
		#box-center {
		  flex: 1;
		  text-align: center;
		}
	</style>
</head>
<body>
<div id="wrapper">
	<div id="page" class="container">
		<div id="content"><a class="image-style" href="#"><img src="https://ifh.cc/g/zFOXWZ.jpg" width="725" height="300" alt="" /></a>
			<div id="box1" class="post">
				<h2 class="title"><a>welcome to my cashbook</a></h2>
				<table id="inOutListTable" style="width:100%">
					<tr>
						<td style="width:20%;">제작자</td>
						<td>이병윤</td>
					</tr>
					<tr>
						<td style="width:20%;">기간</td>
						<td>20.11.19 ~ 20.11.25</td>
					</tr>
					<tr>
						<td style="width:20%;">사용 방법</td>
						<td>Spring</td>
					</tr>
					<tr>
						<td style="width:20%;">서버</td>
						<td>AWS EC2</td>
					</tr>
					<tr>
						<td style="width:20%;">구조</td>
						<td>총 5개의 페이지로 이루어지며, 달력을 표시하여 수익, 지출을 표시하였고 공지사항과 방명록을 구현하였다.</td>
					</tr>
				</table>
			</div>
			<div id="box2" style="margin-top: 25px">
				<h2 class="subtitle">Summary of recent income/expenses</h2>
					<div class="row">
						<c:forEach var="io" items="${inOutList}">
							<div id="box-center">
								<table id="inOutListTable">
									<tr>
										<th colspan="2">${io["날짜"]}</th>
									</tr>
									<tr>
										<td>수입 : </td>
										<td>${io["수입"]}</td>
									</tr>
									<tr>
										<td>지출 : </td>
										<td>${io["지출"]}</td>
									</tr>
									<tr>
										<td>합계 : </td>
										<td>${io["합계"]}</td>
									</tr>
								</table>
							</div>
						</c:forEach>
					</div>
				<div id="subContent" style="margin-top: 30px;">
					<h2 class="subTitle">notice list</h2>
					<table id="fullListTable" style="margin-top: -10px">
						<thead>
							<tr>
								<th>notice_id</th>	
								<th>notice_title</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="n" items="${noticeList}">
								<tr>
									<td>${n.noticeId}</td>
									<td>${n.noticeTitle}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	</div>
	<div class="clearfix">&nbsp;</div>
</div>
</body>
</html>