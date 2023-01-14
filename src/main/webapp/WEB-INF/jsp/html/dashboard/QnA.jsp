<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" 
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ page import="java.sql.*" %>
                            
<!-- Begin page -->
<div class="text-center type01">
	<div class="row">
		<div class="col-6">
			<p class="text-truncate">화주 미처리 문의</p>
			<h4>
				<a href="javascript: void(0);" data-status="frgown">
					<c:choose>
						<c:when test="${!empty result.frgownVocRequestCount and null ne result.frgownVocRequestCount}">
							<fmt:formatNumber value="${result.frgownVocRequestCount}"/>
						</c:when>
						<c:otherwise>
							0
						</c:otherwise>
					</c:choose>
				</a>
			</h4>
		</div>
		<div class="col-6">
			<p class="text-truncate">차주 미처리 문의</p>
			<h4>
				<a href="javascript: void(0);" data-status="carown">
					<c:choose>
						<c:when test="${!empty result.carownVocRequestCount and null ne result.carownVocRequestCount}">
							<fmt:formatNumber value="${result.carownVocRequestCount}"/>
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

<%-- <div class="text-center">
	<div class="row mt-2">
		<div class="col-6">
			<p class="font-15 mb-1 text-truncate">화주 미처리 문의</p>
			<h4>
				<a href="javascript: void(0);" data-status="frgown">
					<c:choose>
						<c:when test="${!empty result.frgownVocRequestCount and null ne result.frgownVocRequestCount}">
							<fmt:formatNumber value="${result.frgownVocRequestCount}"/>
						</c:when>
						<c:otherwise>
							0
						</c:otherwise>
					</c:choose>
				</a>
			</h4>
		</div>
		<div class="col-6">
			<p class="font-15 mb-1 text-truncate">차주 미처리 문의</p>
			<h4>
				<a href="javascript: void(0);" data-status="carown">
					<c:choose>
						<c:when test="${!empty result.carownVocRequestCount and null ne result.carownVocRequestCount}">
							<fmt:formatNumber value="${result.carownVocRequestCount}"/>
						</c:when>
						<c:otherwise>
							0
						</c:otherwise>
					</c:choose>
				</a>
			</h4>
		</div>
	</div>
</div> --%>
<!-- End page -->

<script>

	// 카운터 커서 처리
	$('.qnaCard a').css('cursor', 'pointer');

	// 카운터 페이지 이동  
	$('.qnaCard a').on('click touch', function() {

		var object;
		
		if($(this).data('status') === 'frgown') {
			object = { 
				vocOwnerClassification : '화주'
				, vocStatus: 'standby'
				, vocExposedStartDate : new Date('2022-01-01 00:00:00').getTime() // 전체기간 시작일 
				, vocExposedEndDate : new Date(todayLast).getTime()
				, nowPage: 1
			}
			
			location.href = '<c:url value="/ui/page/help/voc#list/"/>' + encodeURIComponent(JSON.stringify(object));
		} else if($(this).data('status') === 'carown') {
			object = { 
				vocOwnerClassification : '차주'
				, vocStatus: 'standby'
				, vocExposedStartDate : new Date('2022-01-01 00:00:00').getTime() // 전체기간 시작일 
				, vocExposedEndDate : new Date(todayLast).getTime()
				, nowPage: 1
			}
			
			location.href = '<c:url value="/ui/page/help/voc#list/"/>' + encodeURIComponent(JSON.stringify(object));
		}
	})

	$(document).ready(function() {
		<c:if test="${empty result.resultCode}">
			<c:set var="resultMsg" value="${fn:replace(fn:replace(result, LF, ''), CR, '')}"/>
			alert('1:1문의 조회 중 오류가 발생하였습니다.\r\nERROR: ${resultMsg}');
		</c:if>
		<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
			alert('1:1문의 조회 중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}');
		</c:if>
	});
	
</script>
