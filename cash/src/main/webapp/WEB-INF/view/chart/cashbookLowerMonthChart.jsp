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
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<body>
<div id="wrapper">
	<div id="page" class="container">
		<div id="content"><a class="image-style" href="#"><img src="https://ifh.cc/g/zFOXWZ.jpg" width="725" height="300" alt="" /></a>
			<div id="box1" class="post">
				<jsp:include page="/WEB-INF/view/inc/chartMenu.jsp"></jsp:include>
			    
				<div id="btnStyle2">
					<a href="/admin/cashbookLowerMonthChart?currentYear=${currentYear}&currentMonth=${currentMonth - 1}"><i class='fas fa-angle-double-left' style='font-size:24px'></i></a>
				</div>
				<div id="btnStyle">
					<a href="/admin/cashbookLowerMonthChart?currentYear=${currentYear}&currentMonth=${currentMonth + 1}"><i class='fas fa-angle-double-right' style='font-size:24px'></i></a>
				</div>
				<canvas id="inChart"></canvas>
				
				<div id="inTable"></div>
				
				<canvas id="outChart"></canvas>
				
				<div id="outTable"></div>
				
				<div id="btnStyle">
					<button id="openTable" type="button">테이블 보기</button>
					<button id="closeTable" type="button">테이블 삭제</button>
				</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	</div>
	<div class="clearfix">&nbsp;</div>
</div>
</body>
<script>

$('#openTable').click(function(){
	$.ajax({
		url: '/admin/cashbookLowerMonthInChart/' + ${currentYear} + "/" + ${currentMonth},
		type: 'GET',
		success: function(data){
			let html = `
				<table id="fullListTable">
					<thead>
						<tr>
							<th>\${data[0].cashbookDay}일</th>
							<th>\${data[1].cashbookDay}일</th>
							<th>\${data[2].cashbookDay}일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>\${data[0].cashbookPrice}</td>
							<td>\${data[1].cashbookPrice}</td>
							<td>\${data[2].cashbookPrice}</td>
						</tr>
					</tbody>
				</table>
			`;
			$('#inTable').append(html);		
		}
	});

	$.ajax({
		url: '/admin/cashbookLowerMonthOutChart/' + ${currentYear} + "/" + ${currentMonth},
		type: 'GET',
		success: function(data){
			let html = `
				<table id="fullListTable">
					<thead>
						<tr>
							<th>\${data[0].cashbookDay}일</th>
							<th>\${data[1].cashbookDay}일</th>
							<th>\${data[2].cashbookDay}일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>\${data[0].cashbookPrice}</td>
							<td>\${data[1].cashbookPrice}</td>
							<td>\${data[2].cashbookPrice}</td>
						</tr>
					</tbody>
				</table>
			`;
			$('#outTable').append(html);		
		}
	});
});

$('#closeTable').click(function(){
	$.ajax({
		url: '/admin/cashbookLowerMonthInChart/' + ${currentYear} + "/" + ${currentMonth},
		type: 'GET',
		success: function(data){
			$('#inTable').empty();
			$('#outTable').empty();
		}
	});
});

$.ajax({
	url: '/admin/cashbookLowerMonthInChart/' + ${currentYear} + "/" + ${currentMonth}, 
	type: 'GET',
	success: function(data){
		var ctx = document.getElementById('inChart').getContext('2d');
		var chart = new Chart(ctx, {
		    type: 'horizontalBar',
			
			   data: {
			       labels: [data[0].cashbookDay, data[1].cashbookDay, data[2].cashbookDay],
			       datasets: [{
				      	label: ${currentMonth} +'월 최저 수입 날짜',
							
		                  borderColor: [
		                  	'rgba(0,183,0, 0.8)',
	    	               ],
		                  data:[data[0].cashbookPrice, data[1].cashbookPrice, data[2].cashbookPrice],
		                  borderWidth: 3                    
					   }]
				    },	

				    options: {}
				});	
			}
});

$.ajax({
	url: '/admin/cashbookLowerMonthOutChart/' + ${currentYear} + "/" + ${currentMonth}, 
	type: 'GET',
	success: function(data){
		var ctx = document.getElementById('outChart').getContext('2d');
		for(var i=0; i<data.length; i++){
		   }
		var chart = new Chart(ctx, {
		    type: 'horizontalBar',
			
			   data: {
			       labels: [data[0].cashbookDay, data[1].cashbookDay, data[2].cashbookDay],
			       datasets: [{
				      	label: ${currentMonth} +'월 최저 지출 날짜',
							
		                  borderColor: [
		                	  'rgba(183,0,0, 0.8)',
	    	               ],
		                  data:[data[0].cashbookPrice, data[1].cashbookPrice, data[2].cashbookPrice],
		                  borderWidth: 3                    
					   }]
				    },	

				    options: {}
				});	
			}
});
</script>
</html>