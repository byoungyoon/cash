<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

		<div id="sidebar">
			<div id="logo">
				<h1><a href="#">Cashbook</a></h1>
			</div>
			<div id="menu" class="box">
				<ul>
					<li><a href="${pageContext.request.contextPath}/admin/index" accesskey="1" title="">index</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/cashbookByMonth" accesskey="2" title="">account book</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/noticeList" accesskey="3" title="">Notice</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/cashbookList/${1}" accesskey="3" title="">Cashbook</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/cashbookYearChart" accesskey="4" title="">CashbookChart</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/guestbookList/${1}" accesskey="5" title="">guest book</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/logout" accesskey="6" title="">logout</a></li>
				</ul>
			</div>
		</div>