<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" 
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ page import="java.sql.*" %>
                   
<%
	pageContext.setAttribute("CR", "\r"); 
	pageContext.setAttribute("LF", "\n"); 
%>
                            
<!-- Begin page -->
<div class="dashboard-wrap">
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<div class="card-widgets">
						<span class="day-txt baseTime"></span> <a
							href="javascript: void(0);" data-toggle="reload"><i
							class="mdi mdi-refresh" data-card="orderCard"></i></a>
					</div>
					<h4 class="header-title orderCardLink">
						<a href="javascript: void(0);">주문배송<i
							class="fas fa-chevron-right"></i></a>
					</h4>
					<div id="orderCard" class="collapse show orderCard">
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-4">
			<div class="card">
				<div class="card-body type01">
					<div class="card-widgets">
						<span class="day-txt baseTime"></span> <a
							href="javascript: void(0);" data-toggle="reload"><i
							class="mdi mdi-refresh" data-card="delayDispatch"></i></a>
					</div>
					<h4 class="header-title delayDispatchCardLink">
						<a href="javascript: void(0);">배차지연 처리<i
							class="fas fa-chevron-right"></i></a>
					</h4>
					<div id="delayDispatchCard" class="collapse show delayDispatchCard">
						
					</div>
				</div>
			</div>
		</div>
		<div class="col-4">
			<div class="card">
				<div class="card-body type01">
					<div class="card-widgets">
						<span class="day-txt baseTime"></span> <a
							href="javascript: void(0);" data-toggle="reload"><i
							class="mdi mdi-refresh" data-card="emergencyDispatch"></i></a>
					</div>
					<h4 class="header-title emergencyDispatchCardLink">
						<a href="javascript: void(0);">비상배차 후 처리<i
							class="fas fa-chevron-right"></i></a>
					</h4>

					<div id="emergencyDispatchCard" class="collapse show emergencyDispatchCard">
					</div>
				</div>
			</div>
		</div>
		<div class="col-4">
			<div class="card">
				<div class="card-body type02">
					<div class="card-widgets">
						<span class="day-txt baseTime"></span> <a
							href="javascript: void(0);" data-toggle="reload"><i
							class="mdi mdi-refresh" data-card="managerDispatch"></i></a>
					</div>
					<h4 class="header-title managerDispatchCardLink">
						<a href="javascript: void(0);">수동배차 처리<i
							class="fas fa-chevron-right"></i></a>
					</h4>

					<div id="managerDispatchCard" class="collapse show managerDispatchCard">
						
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-6">
			<div class="card">
				<div class="card-body">
					<div class="card-widgets">
						<span class="day-txt baseTime"></span> <a
							href="javascript: void(0);" data-toggle="reload"><i
							class="mdi mdi-refresh" data-card="settlementCarownCard"></i></a>
					</div>
					<h4 class="header-title settlementCarownCardLink">
						<a href="javascript: void(0);">차주 정산<i
							class="fas fa-chevron-right"></i></a>
					</h4>

					<div id="settlementCarownCard" class="collapse show settlementCarownCard">
						
					</div>
				</div>
			</div>
		</div>
		<div class="col-6">
			<div class="card">
				<div class="card-body">
					<div class="card-widgets">
						<span class="day-txt baseTime"></span> <a
							href="javascript: void(0);" data-toggle="reload"><i
							class="mdi mdi-refresh" data-card="settlementFrgownCard"></i></a>
					</div>
					<h4 class="header-title settlementFrgownCardLink">
						<a href="javascript: void(0);">화주 정산<i
							class="fas fa-chevron-right"></i></a>
					</h4>
					<div id="settlementFrgownCard" class="collapse show settlementFrgownCard">
						
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-4">
			<div class="card">
				<div class="card-body">
					<div class="card-widgets">
						<span class="day-txt baseTime"></span> <a
							href="javascript: void(0);" data-toggle="reload"><i
							class="mdi mdi-refresh" data-card="freightOwnerCard"></i></a>
					</div>
					<h4 class="header-title freightOwnerCardLink">
						<a href="javascript: void(0);">화주회원<i
							class="fas fa-chevron-right"></i></a>
					</h4>
					<div id="freightOwnerCard" class="collapse show freightOwnerCard">
						
					</div>
				</div>
			</div>
		</div>
		<div class="col-4">
			<div class="card">
				<div class="card-body">
					<div class="card-widgets">
						<span class="day-txt baseTime"></span> <a
							href="javascript: void(0);" data-toggle="reload"><i
							class="mdi mdi-refresh" data-card="carOwnerCard"></i></a>
					</div>
					<h4 class="header-title carOwnerCardLink">
						<a href="javascript: void(0);">차주회원<i
							class="fas fa-chevron-right"></i></a>
					</h4>
					<div id="carOwnerCard" class="collapse show carOwnerCard">
						
					</div>
				</div>
			</div>
		</div>
		<div class="col-4">
			<div class="card">
				<div class="card-body">
					<div class="card-widgets">
						<span class="day-txt baseTime"></span> <a
							href="javascript: void(0);" data-toggle="reload"><i
							class="mdi mdi-refresh" data-card="qnaCard"></i></a>
					</div>
					<h4 class="header-title qnaCardLink">
						<a href="javascript: void(0);">1:1문의<i
							class="fas fa-chevron-right"></i></a>
					</h4>
					<div id="qnaCard" class="collapse show qnaCard">
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End page -->

<script>
	
	// console.log('${profiles}');
	
	let orderStartToday;
	let orderStartTodayManual;
	
	// prod
	// 요금확인중, 배송요청, 배차완료, 상차완료, 배송완료 : from : 4/29 ~ 
	// 배차지연(일반)처리, 배차지연(긴급)처리 : from 4/29 ~
	// 비상배차후처리 > 상차처리, 하차처리 : from 4/29 ~
	// 수동배차 처리> 수동배차 처리, 상차처리, 하차처리 : from 4/12
	// 수동배차 기준시작일 IPC/EPC 5/1 변경 반영 2022.05.17

	<c:choose>
		<c:when test="${'local' eq profiles or 'dev' eq profiles}">
			// 기준시작일 - 날짜/시간 
			orderStartToday = new Date('2022-04-14').setHours(0,0,0,0);
			orderStartTodayManual = new Date('2022-05-01').setHours(0,0,0,0);
		</c:when>
		<c:otherwise>
			orderStartToday = new Date('2022-04-29').setHours(0,0,0,0);
			orderStartTodayManual = new Date('2022-05-01').setHours(0,0,0,0);
		</c:otherwise>
	</c:choose>

	const today = new Date().setHours(0,0,0,0);
	const todayLast = new Date(new Date().addDays(1).setHours(0,0,0,0)).getTime() -1;
	const startToday = new Date('2022-01-01').setHours(0,0,0,0);

	// 화주 회원 페이지 이동 
	$('.freightOwnerCardLink').css('cursor', 'pointer');
	$('.freightOwnerCardLink').on('click touch', function() {
		location.href = '<c:url value="/ui/page/owner/frgown"/>';
	})
	
	// 차주 회원 페이지 이동 
	$('.carOwnerCardLink').css('cursor', 'pointer');
	$('.carOwnerCardLink').on('click touch', function() {
		location.href = '<c:url value="/ui/page/owner/carown"/>';
	})

	// 문의 페이지 이동 
	$('.qnaCardLink').css('cursor', 'pointer');
	$('.qnaCardLink').on('click touch', function() {
		location.href = '<c:url value="/ui/page/help/voc"/>';
	})
	
	// 주문배송 페이지 이동 
	$('.orderCardLink, .delayDispatchCardLink, .emergencyDispatchCardLink').css('cursor', 'pointer');
	// $('.orderCardLink, .delayDispatchCardLink, .emergencyDispatchCardLink').on('click touch', function() {
	$('.orderCardLink').on('click touch', function() {
		location.href = '<c:url value="/ui/page/order/mng"/>';
	})
	
	// 배차지연 페이지 이동 
	$('.delayDispatchCardLink').on('click touch', function() {
		var param = {
			dispatchDelay : "DELAY"
		};
		location.href = '<c:url value="/ui/page/order/mng#list/"/>' + encodeURIComponent(JSON.stringify(param));
	})
	
	// 비상배차 페이지 이동 
	$('.emergencyDispatchCardLink').on('click touch', function() {
		var param = {
			emergencyYn : "Y"
		};
		location.href = '<c:url value="/ui/page/order/mng#list/"/>' + encodeURIComponent(JSON.stringify(param));
	})
	
	// 수동배차 페이지 이동 
	$('.managerDispatchCardLink').css('cursor', 'pointer');
	$('.managerDispatchCardLink').on('click touch', function() {
		location.href = '<c:url value="/ui/page/order/manual"/>';
	})
	
	// 차주정산 페이지 이동 
	$('.settlementCarownCardLink').css('cursor', 'pointer');
	$('.settlementCarownCardLink').on('click touch', function() {
		location.href = '<c:url value="/ui/page/settlement/carown"/>';
	})
	
	// 화주정산 페이지 이동 
	$('.settlementFrgownCardLink').css('cursor', 'pointer');
	$('.settlementFrgownCardLink').on('click touch', function() {
		location.href = '<c:url value="/ui/page/settlement/frgown"/>';
	})
	
	// 카드 refresh 
	$("i.mdi-refresh").css('cursor', 'pointer');
	$("i.mdi-refresh").on('click touch', function() {
		loadCard($(this).data('card'), this, new Date());
	})

	// 대시보드내 카드 load 
	function loadCard(_type, _baseTimeEl, _date) {
		
		if(_type === 'freightOwnerCard') {
			$.ajax({
				type : "POST",
				url : "<c:url value='/ui/service/dashboard/frgown'/>",
				data : {
				},
				cache : false,
				async : false,
				success : function(data, textStatus, XMLHttpRequest) {
					$('.freightOwnerCard').html(data);
					if (hasErrorMap(data, true)) {
						return;
					}
				},
				error : function(xhr, ajaxOptions, thrownError) {
					if (hasErrorMap(xhr, false)) {
						return;
					}
				}
			});
			
			// 기준시간 표시 load
			refreshData(_baseTimeEl, _date);
			
		} else if(_type === 'carOwnerCard') {
			$.ajax({
				type : "POST",
				url : "<c:url value='/ui/service/dashboard/carown'/>",
				data : {
				},
				cache : false,
				async : false,
				success : function(data, textStatus, XMLHttpRequest) {
					$('.carOwnerCard').html(data);
					if (hasErrorMap(data, true)) {
						return;
					}
				},
				error : function(xhr, ajaxOptions, thrownError) {
					if (hasErrorMap(xhr, false)) {
						return;
					}
				}
			});
			
			// 기준시간 표시 load
			refreshData(_baseTimeEl, _date);
			
		} else if(_type === 'qnaCard') {
			$.ajax({
				type : "POST",
				url : "<c:url value='/ui/service/dashboard/qna'/>",
				data : {
				},
				cache : false,
				async : false,
				success : function(data, textStatus, XMLHttpRequest) {
					$('.qnaCard').html(data);
					if (hasErrorMap(data, true)) {
						return;
					}
				},
				error : function(xhr, ajaxOptions, thrownError) {
					if (hasErrorMap(xhr, false)) {
						return;
					}
				}
			});
			
			// 기준시간 표시 load
			refreshData(_baseTimeEl, _date);
			
		} else if(_type === 'orderCard') {

			$.ajax({
				type : "POST",
				url : "<c:url value='/ui/service/dashboard/order'/>",
				data : {
					'date' : _date.format('yyyy-MM-dd')
				},
				cache : false,
				async : false,
				success : function(data, textStatus, XMLHttpRequest) {
					$('.orderCard').html(data);
					if (hasErrorMap(data, true)) {
						return;
					}
				},
				error : function(xhr, ajaxOptions, thrownError) {
					if (hasErrorMap(xhr, false)) {
						return;
					}
				}
			});
			
			// 기준시간 표시 load
			refreshData(_baseTimeEl, _date);
			
		} else if(_type === 'settlementCarownCard') {
			$.ajax({
				type : "POST",
				url : "<c:url value='/ui/service/dashboard/settlementCarown'/>",
				data : {
				},
				cache : false,
				async : false,
				success : function(data, textStatus, XMLHttpRequest) {
					$('.settlementCarownCard').html(data);
					if (hasErrorMap(data, true)) {
						return;
					}
				},
				error : function(xhr, ajaxOptions, thrownError) {
					if (hasErrorMap(xhr, false)) {
						return;
					}
				}
			});
			
			refreshData(_baseTimeEl, _date);
			
		} else if(_type === 'settlementFrgownCard') {
			$.ajax({
				type : "POST",
				url : "<c:url value='/ui/service/dashboard/settlementFrgown'/>",
				data : {
				},
				cache : false,
				async : false,
				success : function(data, textStatus, XMLHttpRequest) {
					$('.settlementFrgownCard').html(data);
					if (hasErrorMap(data, true)) {
						return;
					}
				},
				error : function(xhr, ajaxOptions, thrownError) {
					if (hasErrorMap(xhr, false)) {
						return;
					}
				}
			});
			
			// 기준시간 표시 load
			refreshData(_baseTimeEl, _date);
			
		} else if(_type === 'delayDispatch') {
			$.ajax({
				type : "POST",
				url : "<c:url value='/ui/service/dashboard/delayDispatch'/>",
				data : {
				},
				cache : false,
				async : false,
				success : function(data, textStatus, XMLHttpRequest) {
					$('.delayDispatchCard').html(data);
					if (hasErrorMap(data, true)) {
						return;
					}
				},
				error : function(xhr, ajaxOptions, thrownError) {
					if (hasErrorMap(xhr, false)) {
						return;
					}
				}
			});
			
			// 기준시간 표시 load
			refreshData(_baseTimeEl, _date);
			
		} else if(_type === 'emergencyDispatch') {
			$.ajax({
				type : "POST",
				url : "<c:url value='/ui/service/dashboard/emergencyDispatch'/>",
				data : {
				},
				cache : false,
				async : false,
				success : function(data, textStatus, XMLHttpRequest) {
					$('.emergencyDispatchCard').html(data);
					if (hasErrorMap(data, true)) {
						return;
					}
				},
				error : function(xhr, ajaxOptions, thrownError) {
					if (hasErrorMap(xhr, false)) {
						return;
					}
				}
			});
			
			// 기준시간 표시 load
			refreshData(_baseTimeEl, _date);
			
		} else if(_type === 'managerDispatch') {
			$.ajax({
				type : "POST",
				url : "<c:url value='/ui/service/dashboard/managerDispatch'/>",
				data : {
				},
				cache : false,
				async : false,
				success : function(data, textStatus, XMLHttpRequest) {
					$('.managerDispatchCard').html(data);
					if (hasErrorMap(data, true)) {
						return;
					}
				},
				error : function(xhr, ajaxOptions, thrownError) {
					if (hasErrorMap(xhr, false)) {
						return;
					}
				}
			});
			
			// 기준시간 표시 load
			refreshData(_baseTimeEl, _date);
		}
		
	}
	
	// 대시보드 카드의 기준시간 update
	function refreshData(_el, _date) {
		$(_el).parent().parent().find('span.baseTime').html(_date.format('yyyy-MM-dd hh:mm') + " 기준");
	}
	
	// 대시보드 초기화 
	function initDashboard() {
		loadCard('freightOwnerCard', $('[data-card="freightOwnerCard"]'), new Date());
		loadCard('carOwnerCard', $('[data-card="carOwnerCard"]'), new Date());
		loadCard('qnaCard', $('[data-card="qnaCard"]'), new Date());
		loadCard('orderCard', $('[data-card="orderCard"]'), new Date());
		loadCard('settlementCarownCard', $('[data-card="settlementCarownCard"]'), new Date());
		loadCard('settlementFrgownCard', $('[data-card="settlementFrgownCard"]'), new Date());
		
		loadCard('delayDispatch', $('[data-card="delayDispatch"]'), new Date());
		loadCard('emergencyDispatch', $('[data-card="emergencyDispatch"]'), new Date());
		loadCard('managerDispatch', $('[data-card="managerDispatch"]'), new Date());
	}
	
	$(document).ready(function() {
		
		initDashboard();
		setInterval(initDashboard, 60000); // 1분마다 카드 새로고침 
		
	});
	
</script>
