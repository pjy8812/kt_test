<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib prefix="form"
	uri="http://www.springframework.org/tags/form"%><%@ taglib
	prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib
	prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%><%@ taglib
	prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><%@ page
	import="java.sql.*"%>

<!-- Begin page -->
<p class="sub-tit">총 화주 회원 
	<c:choose>
		<c:when test="${!empty result.freightOwnerTotal and null ne result.freightOwnerTotal}">
			<fmt:formatNumber value="${result.freightOwnerTotal}"/>
		</c:when>
		<c:otherwise>
			0
		</c:otherwise>
	</c:choose>
	명 (신규 
	<c:choose>
		<c:when test="${!empty result.freightOwnerNew and null ne result.freightOwnerNew}">
			<fmt:formatNumber value="${result.freightOwnerNew}"/>
		</c:when>
		<c:otherwise>
			0
		</c:otherwise>
	</c:choose>
	명)</p>
<div class="text-center">
	<div class="row">
		<div class="col-4">
			<p class="text-truncate">정상</p>
			<h4>
				<a href="javascript: void(0);" data-status="normal">
					<c:choose>
						<c:when test="${!empty result.normal and null ne result.normal}">
							<fmt:formatNumber value="${result.normal}"/>
						</c:when>
						<c:otherwise>
							0
						</c:otherwise>
					</c:choose>
				</a>
			</h4>
			<a href="javascript: void(0);" class="herewith-txt" data-status="freightOwnerFileAdminCheckYN">가입서류 미확인
				<span>
					<c:choose>
						<c:when
							test="${!empty result.unidentifiedDocs and null ne result.unidentifiedDocs}">
							<fmt:formatNumber value="${result.unidentifiedDocs}" />
						</c:when>
						<c:otherwise>
							0
						</c:otherwise>
					</c:choose>
				</span>
			</a>
		</div>
		<div class="col-4">
			<p class="text-truncate">중지</p>
			<h4>
				<a href="javascript: void(0);" data-status="suspension">
					<c:choose>
						<c:when
							test="${!empty result.suspension and null ne result.suspension}">
							<fmt:formatNumber value="${result.suspension}"/>
						</c:when>
						<c:otherwise>
							0
						</c:otherwise>
					</c:choose>
				</a>
			</h4>
		</div>
		<div class="col-4 point01">
			<p class="text-truncate">탈퇴요청</p>
			<h4>
				<a href="javascript: void(0);" data-status="withdrawalRequested">
					<c:choose>
						<c:when
							test="${!empty result.withdrawalRequested and null ne result.withdrawalRequested}">
							<fmt:formatNumber value="${result.withdrawalRequested}"/>
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
		<div class="col-4">
			<p class="font-15 mb-1 text-truncate">정상</p>
			<h4 class="point01">
				<a href="javascript: void(0);" data-status="normal"> 
					<c:choose>
						<c:when test="${!empty result.normal and null ne result.normal}">
							<fmt:formatNumber value="${result.normal}"/>
						</c:when>
						<c:otherwise>
							0
						</c:otherwise>
					</c:choose>
				</a>
			</h4>
			<p class="point01" data-status="freightOwnerFileAdminCheckYN">
				가입서류 미확인 <a data-status="freightOwnerFileAdminCheckYN"> <ins>
						<c:choose>
							<c:when
								test="${!empty result.unidentifiedDocs and null ne result.unidentifiedDocs}">
								<fmt:formatNumber value="${result.unidentifiedDocs}" />
							</c:when>
							<c:otherwise>
								0
							</c:otherwise>
						</c:choose>
					</ins>
				</a>
			</p>
		</div>
		<div class="col-4">
			<p class="font-15 mb-1 text-truncate">중지</p>
			<h4>
				<a href="javascript: void(0);" data-status="suspension"> <c:choose>
						<c:when
							test="${!empty result.suspension and null ne result.suspension}">
							<fmt:formatNumber value="${result.suspension}" />
						</c:when>
						<c:otherwise>
							0
						</c:otherwise>
					</c:choose>
				</a>
			</h4>
		</div>
		<div class="col-4 point01">
			<p class="font-15 mb-1 text-truncate">탈퇴요청</p>
			<h4>
				<a href="javascript: void(0);" data-status="withdrawalRequested">
					<c:choose>
						<c:when
							test="${!empty result.withdrawalRequested and null ne result.withdrawalRequested}">
							<fmt:formatNumber value="${result.withdrawalRequested}" />
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
	$('.freightOwnerCard a').css('cursor', 'pointer');
	
	// 카운터 페이지 이동  
	$('.freightOwnerCard a').on('click touch', function() {
		// console.log($(this).data('status'));
		
		var object;
		
		if($(this).data('status') === 'freightOwnerFileAdminCheckYN') {
			object = { 
				freightOwnerMemberStatus : 'normal'
				, joinStartDate : new Date(startToday).getTime() // 전체기간 시작일 
				, joinEndDate : new Date(todayLast).getTime() // 오늘 23:59:59
				, lastUseStartDate: new Date(startToday).getTime() // 전체기간 시작일 
				, lastUseEndDate: new Date(todayLast).getTime() // 오늘 23:59:59
				, freightOwnerFileAdminCheckYN : 'N'
				, nowPage : 1
			}
		} else {
			object = { 
				freightOwnerMemberStatus : $(this).data('status')
				, joinStartDate : new Date(startToday).getTime() // 전체기간 시작일 
				, joinEndDate : new Date(todayLast).getTime() // 오늘 23:59:59
				, lastUseStartDate: new Date(startToday).getTime() // 전체기간 시작일 
				, lastUseEndDate: new Date(todayLast).getTime() // 오늘 23:59:59
				, nowPage : 1
			}
		}
		
		location.href = '<c:url value="/ui/page/owner/frgown#list/"/>' + encodeURIComponent(JSON.stringify(object));
	})
	
	$(document).ready(function() {
		
		// update
		// 총 화주 회원 0명 (신규 0명)
		/* var htmlStr = '';
		<c:choose>
			<c:when test="${!empty result.freightOwnerTotal and null ne result.freightOwnerTotal}">
				htmlStr += '총 화주 회원 <fmt:formatNumber value="${result.freightOwnerTotal}"/>명';
			</c:when>
			<c:otherwise>
				htmlStr += '총 화주 회원 0명';
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${!empty result.freightOwnerNew and null ne result.freightOwnerNew}">
				htmlStr += ' (신규 <fmt:formatNumber value="${result.freightOwnerNew}"/>명)';
			</c:when>
			<c:otherwise>
				htmlStr += ' (신규 0명)';
			</c:otherwise>
		</c:choose> */
		
		<c:if test="${empty result.resultCode}">
			alert('화주관리 조회 중 오류가 발생하였습니다.\r\nERROR: ');
		</c:if>
		<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
			alert('화주관리 조회 중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}');
		</c:if>
		
		// $('.freightOwnerCard').parent().find('.listCnt').html(htmlStr);
	
	});

</script>
