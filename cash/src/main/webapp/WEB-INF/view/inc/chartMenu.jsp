<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<div class="dropdown">
	<button class="dropbtn">CashbookChart</button>
	<div class="dropdown-content">
		<a href="${pageContext.request.contextPath}/admin/cashbookYearChart">Chart by year</a>
   		<a href="${pageContext.request.contextPath}/admin/cashbookAverageYearChart">Chart average by year</a>
		<a href="${pageContext.request.contextPath}/admin/cashbookTopMonthChart">Top 3 Income and Expenditure</a>
		<a href="${pageContext.request.contextPath}/admin/cashbookLowerMonthChart">Lower 3 income and expenditure</a>
		<a href="${pageContext.request.contextPath}/admin/cashbookRecentChart">Recent income expenditure</a>
		<a href="${pageContext.request.contextPath}/admin/cashbookOldChart">Old income expenditure</a>
	</div>
</div>