<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" 
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ page import="java.sql.*" %>

<!-- Begin page -->
<p class="sub-tit">금월발생 청구 
	<c:choose>
		<c:when test="${!empty result.thisMonthCompletedCount and null ne result.thisMonthCompletedCount}">
			<fmt:formatNumber value="${result.thisMonthCompletedCount}"/>
		</c:when>
		<c:otherwise>
			0
		</c:otherwise>
	</c:choose>
	건
</p>
<div class="text-center">
	<div class="row">
		<div class="col-3">
			<p class="text-truncate">청구대기</p>
			<h4>
				<a href="javascript: void(0);" data-status="settlementStandby">
					<c:choose>
						<c:when test="${!empty result.settlementStandby and null ne result.settlementStandby}">
							<fmt:formatNumber value="${result.settlementStandby}"/>
						</c:when>
						<c:otherwise>
							0
						</c:otherwise>
					</c:choose>
				</a>
			</h4>
		</div>
		<div class="col-3">
			<p class="text-truncate">청구중</p>
			<h4>
				<a href="javascript: void(0);" data-status="settlementRequested">
					<c:choose>
						<c:when test="${!empty result.settlementRequested and null ne result.settlementRequested}">
							<fmt:formatNumber value="${result.settlementRequested}"/>
						</c:when>
						<c:otherwise>
							0
						</c:otherwise>
					</c:choose>
				</a>
			</h4>
		</div>
		<div class="col-3 point01">
			<p class="text-truncate">입금확인필요</p>
			<h4>
				<a href="javascript: void(0);" data-status="confirmRequired">
					<c:choose>
						<c:when test="${!empty result.confirmRequired and null ne result.confirmRequired}">
							<fmt:formatNumber value="${result.confirmRequired}"/>
						</c:when>
						<c:otherwise>
							0
						</c:otherwise>
					</c:choose>
				</a>
			</h4>
		</div>
		<div class="col-3 point03">
			<p class="text-truncate">입금확인완료</p>
			<h4>
				<a href="javascript: void(0);" data-status="settlementCompleted">
					<c:choose>
						<c:when test="${!empty result.thisMonthCompletedCount and null ne result.thisMonthCompletedCount}">
							<fmt:formatNumber value="${result.thisMonthCompletedCount}"/>
						</c:when>
						<c:otherwise>
							0
						</c:otherwise>
					</c:choose>
				</a>
			</h4>
			<p class="info-txt01">(금월 완료 기준)</p>
		</div>
	</div>
</div>
<!-- End page -->

<script>

	// 카운터 커서 처리
	$('.settlementFrgownCard a').css('cursor', 'pointer');
	
	// 카운터 페이지 이동  
	var firstDay = new Date(today).setDate(1);
	var nextMonthfirstDay = new Date(new Date(firstDay).setMonth(new Date(firstDay).getMonth()+1));
	$('.settlementFrgownCard a').on('click touch', function() {
		// console.log($(this).data('status'));
		
		var object = {};
		if($(this).data('status') === 'settlementCompleted')  {
			object = { 
				freightOwnerSettlementStatus : $(this).data('status')
				, settlementStartDate : new Date(firstDay).getTime() // 금월
				, settlementEndDate : new Date(nextMonthfirstDay).addDays(-1).getTime() // 말일 > 정산페이지에서 23:59:59 처리됨 
				, pickerType : 'deposit'
			}
		} else {
			object = { 
				freightOwnerSettlementStatus : $(this).data('status')
				, settlementStartDate : new Date(startToday).getTime() // 전체기간 시작일 
				, settlementEndDate : new Date(todayLast).getTime() // 오늘 23:59:59
				, pickerType : 'complete'
			}
		}
		
		location.href = '<c:url value="/ui/page/settlement/frgown#list/"/>' + encodeURIComponent(JSON.stringify(object));
	})

	$(document).ready(function() {
		
		// 금월 발생 정산 update
		/* <c:choose>
			<c:when test="${!empty result.thisMonthCompletedCount and null ne result.thisMonthCompletedCount}">
				$('.settlementFrgownCard').parent().find('.thisMonthCompletedCount').html('금월 발생 정산 <fmt:formatNumber value="${result.thisMonthCompletedCount}"/>건');
			</c:when>
			<c:otherwise>
				$('.settlementFrgownCard').parent().find('.thisMonthCompletedCount').html('금월 발생 정산 0건');
			</c:otherwise>
		</c:choose> */
		
		<c:if test="${empty result.resultCode}">
			<c:set var="resultMsg" value="${fn:replace(fn:replace(result, LF, ''), CR, '')}"/>
			alert('화주정산관리 조회 중 오류가 발생하였습니다.\r\nERROR: ${resultMsg}');
		</c:if>
		<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
			alert('화주정산관리 조회 조회 중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}');
		</c:if>
			
	});
	
</script>
