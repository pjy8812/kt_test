<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" 
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ page import="java.sql.*" %>

<!-- Begin page -->
<p class="sub-tit">금일발생 지급
	<c:choose>
		<c:when test="${!empty result.todayCompletedCount and null ne result.todayCompletedCount}">
			<fmt:formatNumber value="${result.todayCompletedCount}"/>
		</c:when>
		<c:otherwise>
			0
		</c:otherwise>
	</c:choose>
	건</p>
<div class="text-center">
	<div class="row">
		<div class="col-3">
			<p class="text-truncate">지급대기</p>
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
			<p class="text-truncate">지급중</p>
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
			<p class="text-truncate">지급실패</p>
			<h4>
				<a href="javascript: void(0);" data-status="settlementFailed">
					<c:choose>
						<c:when test="${!empty result.settlementFailed and null ne result.settlementFailed}">
							<fmt:formatNumber value="${result.settlementFailed}"/>
						</c:when>
						<c:otherwise>
							0
						</c:otherwise>
					</c:choose>
				</a>
			</h4>
		</div>
		<div class="col-3 point03">
			<p class="text-truncate">지급완료</p>
			<h4>
				<a href="javascript: void(0);" data-status="settlementCompleted">
					<c:choose>
						<c:when test="${!empty result.todayCompletedCount and null ne result.todayCompletedCount}">
							<fmt:formatNumber value="${result.todayCompletedCount}"/>
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

<%-- <div class="text-center">
	<div class="row mt-2">
		<div class="col-3">
			<p class="font-15 mb-1 text-truncate">정산대기</p>
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
			<p class="font-15 mb-1 text-truncate">정산중</p>
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
		<div class="col-3 point02">
			<p class="font-15 mb-1 text-truncate">정산실패</p>
			<h4>
				<a href="javascript: void(0);" data-status="settlementFailed">
					<c:choose>
						<c:when test="${!empty result.settlementFailed and null ne result.settlementFailed}">
							<fmt:formatNumber value="${result.settlementFailed}"/>
						</c:when>
						<c:otherwise>
							0
						</c:otherwise>
					</c:choose>
				</a>
			</h4>
		</div>
		<div class="col-3">
			<p class="font-15 mb-1 text-truncate">정산완료</p>
			<h4>
				<a href="javascript: void(0);" data-status="settlementCompleted">
					<c:choose>
						<c:when test="${!empty result.settlementCompleted and null ne result.settlementCompleted}">
							<fmt:formatNumber value="${result.settlementCompleted}"/>
						</c:when>
						<c:otherwise>
							0
						</c:otherwise>
					</c:choose>
				</a>
			</h4>
			<p>(금일 완료 기준)</p>
		</div>
	</div>
</div> --%>
<!-- End page -->

<script>

	// 카운터 커서 처리
	$('.settlementCarownCard a').css('cursor', 'pointer');

	// 카운터 페이지 이동  
	$('.settlementCarownCard a').on('click touch', function() {
		// console.log($(this).data('status'));
		
		var object = {};
		if($(this).data('status') === 'settlementCompleted')  {
			object = { 
				carOwnerSettlementStatus : $(this).data('status')
				, settlementStartDate : new Date(today).getTime() // 오늘  
				, settlementEndDate : new Date(todayLast).getTime() // 오늘 23:59:59
				, pageType : 'settlement'
				, pickerType : 'deposit'
			}
		} else {
			object = { 
				carOwnerSettlementStatus : $(this).data('status')
				, settlementStartDate : new Date(startToday).getTime() // 전체기간 시작일 
				, settlementEndDate : new Date(todayLast).getTime() // 오늘 23:59:59
				, pageType : 'settlement'
				, pickerType : 'complete'
			}
		}
		
		location.href = '<c:url value="/ui/page/settlement/carown#list/settlement/"/>' + encodeURIComponent(JSON.stringify(object));
	})
	
	$(document).ready(function() {
		
		// 오늘 발생 정산 update
		/* <c:choose>
			<c:when test="${!empty result.listCount and null ne result.listCount}">
				$('.settlementCarownCard').parent().find('.listCnt').html('오늘 발생 정산 <fmt:formatNumber value="${result.listCount}"/>건');
			</c:when>
			<c:otherwise>
				$('.settlementCarownCard').parent().find('.listCnt').html('오늘 발생 정산 0건');
			</c:otherwise>
		</c:choose> */
		
		<c:if test="${empty result.resultCode}">
			<c:set var="resultMsg" value="${fn:replace(fn:replace(result, LF, ''), CR, '')}"/>
			alert('차주정산관리조회 중 오류가 발생하였습니다.\r\nERROR: ${resultMsg}');
		</c:if>
		<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
			alert('차주정산관리 조회 중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}');
		</c:if>
		
	});
	
</script>
