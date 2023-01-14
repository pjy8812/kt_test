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
			<p class="text-truncate">상차처리</p>
			<h4>
				<a href="javascript: void(0);" data-status="DISPATCH_COMPLETED">
					<c:choose>
						<c:when test="${!empty result.loadCount and null ne result.loadCount}">
							<fmt:formatNumber value="${result.loadCount}"/>
						</c:when>
						<c:otherwise>
							0
						</c:otherwise>
					</c:choose>
				</a>
			</h4>
			<i class="ico fas fa-angle-double-right"></i>
		</div>
		<div class="col-6">
			<p class="text-truncate">하차처리</p>
			<h4>
				<a href="javascript: void(0);" data-status="LOADING_COMPLETED">
					<c:choose>
						<c:when test="${!empty result.unloadCount and null ne result.unloadCount}">
							<fmt:formatNumber value="${result.unloadCount}"/>
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
	$('.emergencyDispatchCard a').css('cursor', 'pointer');
	
	// 카운터 페이지 이동  
	$('.emergencyDispatchCard a').on('click touch', function() {
		// console.log($(this).data('status'));
		
		var status = $(this).data('status');
		var type = $(this).data('type');
		var param = {};
		
		param = {
			emergencyYn : "Y"
			, orderType1 : status
			, freightRegistStartDatetime : new Date(orderStartToday).getTime() // 전체기간 시작일 
			, freightRegistEndDatetime : new Date(todayLast).addDays(30).getTime() // 오늘 23:59:59
			, loadingStartDateTime : new Date(orderStartToday).getTime() // 전체기간 시작일 
			, loadingEndDateTime : new Date(todayLast).addDays(30).getTime() // 오늘 23:59:59
			, unloadingStartDateTime : new Date(orderStartToday).getTime() // 전체기간 시작일 
			, unloadingEndDateTime : new Date(todayLast).addDays(30).getTime() // 오늘 23:59:59
			, dashboardFlag : true
		}
		
		goToEmergencyDispatchOrderMng(param);
	})
	
	// 해당 상태로 검색한 주문목록으로 이동 
	function goToEmergencyDispatchOrderMng(_param) {
		location.href = "<c:url value='/ui/page/order/mng#list/'/>" + encodeURIComponent(JSON.stringify(_param));
	}

	$(document).ready(function() {
		
		<c:if test="${empty result.resultCode}">
			<c:set var="resultMsg" value="${fn:replace(fn:replace(result, LF, ''), CR, '')}"/>
			alert('비상배차 조회 중 오류가 발생하였습니다.\r\nERROR: ${resultMsg}');
		</c:if>
		<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
			alert('비상배차 조회 조회 중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}');
		</c:if>
			
	});
	
</script>
