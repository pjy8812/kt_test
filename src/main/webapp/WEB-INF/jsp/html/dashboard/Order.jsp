<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" 
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ page import="java.sql.*" %>
                            
<!-- Begin page -->
<p class="sub-tit">오늘 등록 화물 
	<c:choose>
		<c:when test="${!empty result.orderTodayCount and null ne result.orderTodayCount}">
			<fmt:formatNumber value="${result.orderTodayCount}"/>
		</c:when>
		<c:otherwise>
			0
		</c:otherwise>
	</c:choose>
	건</p>
<div class="text-center">
	<div class="row type01">
		<div class="col point01">
			<p class="text-truncate">요금확인중</p>
			<h4>
				<a href="javascript: void(0);" data-status="CHARGE_CHECKING">
					<c:choose>
						<c:when test="${!empty result.CHARGE_CHECKING and null ne result.CHARGE_CHECKING}">
							<fmt:formatNumber value="${result.CHARGE_CHECKING}"/>
						</c:when>
						<c:otherwise>
							0
						</c:otherwise>
					</c:choose>
				</a>
			</h4>
			<c:choose>
				<c:when test="${!empty result.chargeCheckingEmergencyCount and null ne result.chargeCheckingEmergencyCount and '0' ne result.chargeCheckingEmergencyCount}">
					<a href="javascript: void(0);" class="bottom-btn" data-status="CHARGE_CHECKING" data-type="URGENTDELIVERY"> 
						<span class="left-txt">긴급</span> <span class="right-txt"><fmt:formatNumber value="${result.chargeCheckingEmergencyCount}"/></span>
					</a> 
				</c:when>
				<c:otherwise>
					<a href="javascript: void(0);" class="bottom-btn no-btn" data-status="CHARGE_CHECKING" data-type="URGENTDELIVERY"> 
						<span class="left-txt">긴급</span> <span class="right-txt">0</span>
					</a> 
				</c:otherwise>
			</c:choose>
			<i class="ico fas fa-angle-double-right"></i>
		</div>
		<div class="col point02">
			<p class="text-truncate">배송요청</p>
			<h4>
				<a href="javascript: void(0);" data-status="DELIVERY_REQUESTED">
					<c:choose>
						<c:when test="${!empty result.ORDER_REGISTER_COMPLETED and null ne result.ORDER_REGISTER_COMPLETED}">
							<fmt:formatNumber value="${result.ORDER_REGISTER_COMPLETED}"/>
						</c:when>
						<c:otherwise>
							0
						</c:otherwise>
					</c:choose>
				</a>
			</h4>
			<c:choose>
				<c:when test="${!empty result.dispatchRequestedEmergencyCount and null ne result.dispatchRequestedEmergencyCount and '0' ne result.dispatchRequestedEmergencyCount}">
					<a href="javascript: void(0);" class="bottom-btn" data-status="DELIVERY_REQUESTED" data-type="URGENTDELIVERY"> 
						<span class="left-txt">긴급</span> <span class="right-txt"><fmt:formatNumber value="${result.dispatchRequestedEmergencyCount}"/></span>
					</a> 
				</c:when>
				<c:otherwise>
					<a href="javascript: void(0);" class="bottom-btn no-btn" data-status="DELIVERY_REQUESTED" data-type="URGENTDELIVERY"> 
						<span class="left-txt">긴급</span> <span class="right-txt">0</span>
					</a> 
				</c:otherwise>
			</c:choose>
			<i class="ico fas fa-angle-double-right"></i>
		</div>
		<div class="col point02">
			<p class="text-truncate">배차완료</p>
			<h4>
				<a href="javascript: void(0);" data-status="DISPATCH_COMPLETED">
					<c:choose>
						<c:when test="${!empty result.DISPATCH_COMPLETED and null ne result.DISPATCH_COMPLETED}">
							<fmt:formatNumber value="${result.DISPATCH_COMPLETED}"/>
						</c:when>
						<c:otherwise>
							0
						</c:otherwise>
					</c:choose>
				</a>
			</h4>
			<i class="ico fas fa-angle-double-right"></i>
		</div>
		<div class="col point02">
			<p class="text-truncate">상차완료</p>
			<h4>
				<a href="javascript: void(0);" data-status="LOADING_COMPLETED">
					<c:choose>
						<c:when test="${!empty result.DELIVERY_LOADED and null ne result.DELIVERY_LOADED}">
							<fmt:formatNumber value="${result.DELIVERY_LOADED}"/>
						</c:when>
						<c:otherwise>
							0
						</c:otherwise>
					</c:choose>
				</a>
			</h4>
			<i class="ico fas fa-angle-double-right"></i>
		</div>
		<div class="col point03">
			<p class="text-truncate">배송완료</p>
			<h4>
				<a href="javascript: void(0);" data-status="UNLOADING_COMPLETED">
					<c:choose>
						<c:when test="${!empty result.deliveryCompleteTodayCount and null ne result.deliveryCompleteTodayCount}">
							<fmt:formatNumber value="${result.deliveryCompleteTodayCount}"/>
						</c:when>
						<c:otherwise>
							0
						</c:otherwise>
					</c:choose>
				</a>
			</h4>
			<p class="info-txt01">(금일 완료 기준)</p>
		</div>
	</div>
</div>
<!-- End page -->

<script>

	// 카운터 커서 처리
	$('.orderCard a:not(.no-btn)').css('cursor', 'pointer');
	
	// 카운터 페이지 이동  
	// $('.orderCard a:not(.no-btn)').on('click touch', function() {
	$('.orderCard a').on('click touch', function() {
		
		if($(this).hasClass('no-btn')) {
			return false;
		}
		
		var status = $(this).data('status');
		var type = $(this).data('type');
		var param = {
			dashboardFlag : true
			, freightRegistStartDatetime : new Date(orderStartToday).getTime() // 전체기간 시작일 
			, freightRegistEndDatetime : new Date(todayLast).addDays(30).getTime() // 오늘 23:59:59
			, loadingStartDateTime : new Date(orderStartToday).getTime() // 전체기간 시작일 
			, loadingEndDateTime : new Date(todayLast).addDays(30).getTime() // 오늘 23:59:59
		};
		
		if(status === 'CHARGE_CHECKING' || status === 'DELIVERY_REQUESTED' || status === 'DISPATCH_COMPLETED' || status === 'LOADING_COMPLETED') {
			param.orderType1 = status;
			param.unloadingStartDateTime = new Date(orderStartToday).getTime(); // 전체기간 시작일 
			param.unloadingEndDateTime = new Date(todayLast).addDays(30).getTime(); // 오늘 23:59:59
			/* param = {
				orderType1 : status
				, freightRegistStartDatetime : new Date(orderStartToday).getTime() // 전체기간 시작일 
				, freightRegistEndDatetime : new Date(todayLast).addDays(30).getTime() // 오늘 23:59:59
				, loadingStartDateTime : new Date(orderStartToday).getTime() // 전체기간 시작일 
				, loadingEndDateTime : new Date(todayLast).addDays(30).getTime() // 오늘 23:59:59
				, unloadingStartDateTime : new Date(orderStartToday).getTime() // 전체기간 시작일 
				, unloadingEndDateTime : new Date(todayLast).addDays(30).getTime() // 오늘 23:59:59
				, dashboardFlag : true
			} */
		}
		
		if(status === 'UNLOADING_COMPLETED') {
			param.orderType1 = status;
			param.unloadingStartDateTime = new Date(today).getTime(); // 오늘 시작일 
			param.unloadingEndDateTime = new Date(todayLast).addDays(30).getTime(); // 오늘 23:59:59 + 30일 
			/* param = {
				orderType1 : "UNLOADING_COMPLETED"
				, freightRegistStartDatetime : new Date(orderStartToday).getTime() // 전체기간 시작일 
				, freightRegistEndDatetime : new Date(todayLast).addDays(30).getTime() // 오늘 23:59:59
				, loadingStartDateTime : new Date(orderStartToday).getTime() // 전체기간 시작일 
				, loadingEndDateTime : new Date(todayLast).addDays(30).getTime() // 오늘 23:59:59 + 30일 
				, unloadingStartDateTime : new Date(orderStartToday).getTime() // 오늘 시작일 
				, unloadingEndDateTime : new Date(todayLast).getTime() // 오늘 23:59:59 + 30일 
				, dashboardFlag : true
			} */
		}

		if(type === 'URGENTDELIVERY') {
			param.orderType2 = "URGENTDELIVERY";
		}
		
		goToOrderMng(param);
		
		// console.log(param)
		// goToOrderMng($(this).data('status'));
	})
	
	// 해당 상태로 검색한 주문목록으로 이동 
	function goToOrderMng(_param) {
	 	// console.log(encodeURIComponent(JSON.stringify(_param)));
		location.href = "<c:url value='/ui/page/order/mng#list/'/>" + encodeURIComponent(JSON.stringify(_param));
	}
	
	$(document).ready(function() {
		
		// update
		// 오늘 등록 화물 0건
		/* <c:choose>
			<c:when test="${!empty result.todayCnt and null ne result.todayCnt}">
				$('.orderCard').parent().find('.listCnt').html('오늘 등록 화물  <fmt:formatNumber value="${result.todayCnt}"/>건');
			</c:when>
			<c:otherwise>
				$('.orderCard').parent().find('.listCnt').html('오늘 등록 화물 0건');
			</c:otherwise>
		</c:choose> */
	
		<c:if test="${empty result.resultCode}">
			<c:set var="resultMsg" value="${fn:replace(fn:replace(result, LF, ''), CR, '')}"/>
			alert('주문/배송 조회 중 오류가 발생하였습니다.\r\nERROR: ${resultMsg}');
		</c:if>
		<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
			alert('주문/배송 조회 중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}');
		</c:if>
	});
	
</script>
