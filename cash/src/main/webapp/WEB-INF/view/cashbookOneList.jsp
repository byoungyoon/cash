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
				<h2 class="title" id="center"><a>${cashbook.cashbookDate}</a></h2>
			
				<table id="oneListTable">
					<tr>	
						<th>cashbook_id</th>
						<td>${cashbook.cashbookId}</td>
					</tr>
					<tr>	
						<th>cashbook_kind</th>
						<td>${cashbook.cashbookKind}</td>
					</tr>
					<tr>	
						<th>category_name</th>
						<td>${cashbook.categoryName}</td>
					</tr>
					<tr>	
						<th>cashbook_price</th>
						<td>${cashbook.cashbookPrice}</td>
					</tr>
					<tr>	
						<th>cashbook_content</th>
						<td>${cashbook.cashbookContent}</td>
					</tr>
					<tr>	
						<th>cashbook_date</th>
						<td>${cashbook.cashbookDate}</td>
					</tr>
					<tr>	
						<th>create_date</th>
						<td>${cashbook.createDate}</td>
					</tr>
					<tr>	
						<th>update_date</th>
						<td>${cashbook.updateDate}</td>
					</tr>
				</table>
				
				<div id="btnStyle">
					<a href="/admin/updateCashbookList/${cashbook.cashbookId}">수정</a>
					<a href="/admin/deleteCashbookList/${cashbook.cashbookId}">삭제</a>
				</div>
			</div>

		</div>
		<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	</div>
	<div class="clearfix">&nbsp;</div>
</div>
</body>
</html>