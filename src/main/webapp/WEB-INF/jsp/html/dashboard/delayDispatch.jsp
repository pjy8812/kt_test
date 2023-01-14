<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" 
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ page import="java.sql.*" %>

<!-- Begin page -->
<div class="text-center">
	<div class="row">
		<div class="col-6">
			<p class="text-truncate">배차지연(일반) 처리</p>
			<h4>
				<a href="javascript: void(0);" data-status="NOMAL">
					<c:choose>
						<c:when test="${!empty result.normalCount and null ne result.normalCount}">
							<fmt:formatNumber value="${result.normalCount}"/>
						</c:when>
						<c:otherwise>
							0
						</c:otherwise>
					</c:choose>
				</a>
			</h4>
		</div>
		<div class="col-6">
			<p class="text-truncate">배차지연(긴급) 처리</p>
			<h4>
				<a href="javascript: void(0);" data-status="DELAY">
					<c:choose>
						<c:when test="${!empty result.emergencyCount and null ne result.emergencyCount}">
							<fmt:formatNumber value="${result.emergencyCount}"/>
						</c:when>
						<c:otherwise>
							0
						</c:otherwise>
					</c:choose>
				</a>
			</h4>
		</div>
	</div>
</div>
<!-- End page -->

<script>

	// 카운터 커서 처리
	$('.delayDispatchCard a').css('cursor', 'pointer');
	
	// 카운터 페이지 이동  
	$('.delayDispatchCard a').on('click touch', function() {
		
		var status = $(this).data('status');
		var type = $(this).data('type');
		var param = {};
		
		param = {
			orderType1 : "ALL"
			, dispatchDelay : "DELAY"
			, freightRegistStartDatetime : new Date(orderStartToday).getTime() // 전체기간 시작일 
			, freightRegistEndDatetime : new Date(todayLast).addDays(30).getTime() // 오늘 23:59:59
			, loadingStartDateTime : new Date(orderStartToday).getTime() // 전체기간 시작일 
			, loadingEndDateTime : new Date(todayLast).addDays(30).getTime() // 오늘 23:59:59
			, unloadingStartDateTime : new Date(orderStartToday).getTime() // 전체기간 시작일 
			, unloadingEndDateTime : new Date(todayLast).addDays(30).getTime() // 오늘 23:59:59
			, dashboardFlag : true
		}
		
		if(status === 'NOMAL') {
			param.orderType2 = "GENERALDELIVERY";
		} else if(status === 'DELAY') {
			param.orderType2 = "URGENTDELIVERY";
		}
		
		goToDelayDispatchOrderMng(param);
		
	})

	// 해당 상태로 검색한 주문목록으로 이동 
	function goToDelayDispatchOrderMng(_param) {
		location.href = "<c:url value='/ui/page/order/mng#list/'/>" + encodeURIComponent(JSON.stringify(_param));
	}

	$(document).ready(function() {
		
		<c:if test="${empty result.resultCode}">
			<c:set var="resultMsg" value="${fn:replace(fn:replace(result, LF, ''), CR, '')}"/>
			alert('배차지연 조회 중 오류가 발생하였습니다.\r\nERROR: ${resultMsg}');
		</c:if>
		<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
			alert('배차지연 조회 조회 중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}');
		</c:if>
			
	});
	
</script>
