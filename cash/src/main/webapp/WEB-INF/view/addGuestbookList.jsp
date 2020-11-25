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
	<link href="${path}/resources/default.css?ver=1" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
<div id="wrapper">
	<div id="page" class="container">
		<div id="content"><a class="image-style" href="#"><img src="https://ifh.cc/g/zFOXWZ.jpg" width="725" height="300" alt="" /></a>
			<div id="box1" class="post">
				<h2 class="title"><a>guestbook List</a></h2>
				<form method="post" action="${path}/admin/addGuestbookList">
					<table id="oneListTable">
						<tr>
							<th>guestbook_name</th>
							<td><input type="text" name="guestbookName"></td>
						</tr>
						<tr>
							<th>guestbook_title</th>
							<td><input type="text" name="guestbookTitle"></td>
						</tr>
						<tr>
							<th>guestbook_content</th>
							<td><textarea name="guestbookContent"></textarea></td>
						</tr>
					</table>
					<div id="btnStyle">
						<button type="submit">guestbook 추가</button>
					</div>
				</form>
			</div>

		</div>
		<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	</div>
	<div class="clearfix">&nbsp;</div>
</div>
</body>
</html>