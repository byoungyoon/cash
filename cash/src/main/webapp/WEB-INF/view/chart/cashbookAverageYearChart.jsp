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
					<a href="/admin/cashbookAverageYearChart?currentYear=${currentYear-1}"><i class='fas fa-angle-double-left' style='font-size:24px'></i></a>
				</div>
				<div id="btnStyle">
					<a href="/admin/cashbookAverageYearChart?currentYear=${currentYear+1}"><i class='fas fa-angle-double-right' style='font-size:24px'></i></a>
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
			url: '/admin/cashbookAverageYearInChart/' + ${currentYear},
			type: 'GET',
			success: function(data){
				let html = `
					<table id="fullListTable">
						<thead>
							<tr>
								<th>1월</th>
								<th>2월</th>
								<th>3월</th>
								<th>4월</th>
								<th>5월</th>
								<th>6월</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>\${data.january.toLocaleString()}</td>
								<td>\${data.february.toLocaleString()}</td>
								<td>\${data.march.toLocaleString()}</td>
								<td>\${data.april.toLocaleString()}</td>
								<td>\${data.may.toLocaleString()}</td>
								<td>\${data.june.toLocaleString()}</td>
							</tr>
						</tbody>
					</table>

					<table id="fullListTable">
						<thead>
							<tr>
								<th>7월</th>
								<th>8월</th>
								<th>9월</th>
								<th>10월</th>
								<th>11월</th>
								<th>12월</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>\${data.july.toLocaleString()}</td>
								<td>\${data.august.toLocaleString()}</td>
								<td>\${data.september.toLocaleString()}</td>
								<td>\${data.october.toLocaleString()}</td>
								<td>\${data.november.toLocaleString()}</td>
								<td>\${data.december.toLocaleString()}</td>
							</tr>
						</tbody>
					</table>
					`;
				$('#inTable').append(html);
			}
		});

		$.ajax({
			url: '/admin/cashbookAverageYearOutChart/' + ${currentYear},
			type: 'GET',
			success: function(data){
				let html = `
					<table id="fullListTable">
						<thead>
							<tr>
								<th>1월</th>
								<th>2월</th>
								<th>3월</th>
								<th>4월</th>
								<th>5월</th>
								<th>6월</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>\${data.january.toLocaleString()}</td>
								<td>\${data.february.toLocaleString()}</td>
								<td>\${data.march.toLocaleString()}</td>
								<td>\${data.april.toLocaleString()}</td>
								<td>\${data.may.toLocaleString()}</td>
								<td>\${data.june.toLocaleString()}</td>
							</tr>
						</tbody>
					</table>

					<table id="fullListTable">
						<thead>
							<tr>
								<th>7월</th>
								<th>8월</th>
								<th>9월</th>
								<th>10월</th>
								<th>11월</th>
								<th>12월</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>\${data.july.toLocaleString()}</td>
								<td>\${data.august.toLocaleString()}</td>
								<td>\${data.september.toLocaleString()}</td>
								<td>\${data.october.toLocaleString()}</td>
								<td>\${data.november.toLocaleString()}</td>
								<td>\${data.december.toLocaleString()}</td>
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
			url: '/admin/cashbookAverageYearInChart/' + ${currentYear},
			type: 'GET',
			success: function(data){
				$('#inTable').empty();
				$('#outTable').empty();
			}
		});
	});
	
	$.ajax({
		url: '/admin/cashbookAverageYearInChart/' + ${currentYear},
		type: 'GET',
		success: function(data){
			var ctx = document.getElementById('inChart').getContext('2d');
			var chart = new Chart(ctx, {
			    type: 'line',

				   data: {
				       labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				       datasets: [{
					      	label: ${currentYear} +'년 월별 평균 수입 내역 차트',

			                  borderColor: [
			                  	'rgba(0,183,0, 0.8)',
		    	               ],
			                  data:[data.january, data.february, data.march, data.april, data.may, data.june, 
			                        data.july, data.august, data.september, data.october, data.november, data.december],
			                  borderWidth: 3                    
						   }]
					    },	

					    options: {}
					});	
				}
			});
	
	$.ajax({
		url: '/admin/cashbookAverageYearOutChart/' + ${currentYear},
		type: 'GET',
		success: function(data){
			var ctx = document.getElementById('outChart').getContext('2d');
			var chart = new Chart(ctx, {
			    type: 'line',

				   data: {
				       labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				       datasets: [{
					      	label: ${currentYear} +'년 월별 평균 지출 내역 차트',

			                  borderColor: [
			                  	'rgba(183,0,0, 0.8)',
		    	               ],
			                  data:[data.january, data.february, data.march, data.april, data.may, data.june, 
			                        data.july, data.august, data.september, data.october, data.november, data.december],
			                  borderWidth: 3                    
						   }]
					    },	

					    options: {}
					});	
				}
			});
</script>
</html>