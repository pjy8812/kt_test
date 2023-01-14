<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" 
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ page import="java.sql.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	pageContext.setAttribute("CR", "\r"); 
	pageContext.setAttribute("LF", "\n"); 
%>

<button type="button" class="btn btn-dark btn-rounded waves-effect waves-dark" id="maskingBtn">
	<span class="text">마스킹 해제</span>
	<span class="btn-label-right"><i class="fas fa-eye"></i></span>
</button>

<div class="row">
	<div class="col-9">
		<h5 class="card-title">조회결과 (총 
			<c:choose>
				<c:when test="${!empty result.listCount and null ne result.listCount}">
					<fmt:formatNumber value="${result.listCount}"/>
				</c:when>
				<c:otherwise>
					0
				</c:otherwise>
			</c:choose>건)
		</h5>
	</div>
	<div class="col-3 text-right mb-2">
		<button type="button" id="excelDownloadBtn"
			class="btn btn-custom03 btn-rounded waves-effect waves-dark excelDownloadBtn">
			엑셀다운로드
		</button>
	</div>
</div>
<div class="row">
	<div class="col-12">
		<div class="scroll-table-wrap">
			<div class="scroll-table-box">
				<table
					class="table dt-responsive nowrap dataTable no-footer dtr-inline text-center"
					role="grid">
					<thead>
						<tr role="row">
							<c:forEach var="headers" items="${headers}" varStatus="idx">
								<c:choose>
									<c:when test="${'0' eq idx}">
										<th class="sorting_asc">${headers}</th>
									</c:when>
									<c:otherwise>
										<th class="sorting">${headers}</th>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</tr>
					</thead>
					<c:choose>
						<c:when test="${empty result.list}">
							<tbody>
								<tr role="row" class="listRow noData" data-id="${list.id}">
									<td colspan="${fn:length(headers)}">
										조회 결과가 없습니다.
									</td>
								</tr>
							</tbody>
						</c:when>
						<c:otherwise>
							<c:set value="${result.maxIndex}" var="maxIndex"/>
							<c:forEach items="${result.list}" var="list">
								<tr role="row" class="listRow">
									<td>
										${maxIndex}
										<c:set var="maxIndex" value="${maxIndex-1}"/>
									</td>
									<!-- 계약구분 -->
									<td class="text-left">${list.freightOwnerTypeName}</td>
									<!-- 사업자구분 -->
									<td class="text-left">${list.freightOwnerMemberTypeName}</td>
									<!-- 사업자유형 -->
									<td class="text-left">${list.freightOwnerBusinessTypeName}</td>
									<!-- 회원번호 -->
									<td class="text-left">${list.freightOwnerNum}</td>
									<!-- 회원명 -->
									<td class="text-left">${list.freightOwnerName}</td>
									<!-- 회원ID -->
									<td class="text-left">${list.freightOwnerId}</td>
									<!-- 사업자번호 -->
									<td class="text-left">${list.freightOwnerCorporateRegistrationNumber}</td>
									<!-- 상호 -->
									<td class="text-left">${list.freightOwnerCompany}</td>
									<!-- 대표자명 -->
									<td class="text-left">${list.freightOwnerCorporateName}</td>
									<!-- 전화번호 -->
									<td class="text-left">${list.freightOwnerPhone}</td>
									<!-- 이메일주소 -->
									<td class="text-left">${list.freightOwnerEmail}</td>
									<!--  월정산횟수 -->
									<td class="text-right">
										<c:choose>
											<c:when test="${!empty list.freightOwnerSettlementMonthCount and null ne list.freightOwnerSettlementMonthCount}">
												<fmt:formatNumber value="${list.freightOwnerSettlementMonthCount}"/>회
											</c:when>
											<c:otherwise>
											</c:otherwise>
										</c:choose>
									</td>
									<!-- 정산ID -->
									<td class="text-left link" data-id="${list.freightOwnerSettlementId}"> ${list.freightOwnerSettlementId}</td>
									<!-- 정산발생일 -->
									<td>${list.freightOwnerSettlementDateString}</td>
									<!-- 건수 -->
									<td class="text-right">
										<c:choose>
											<c:when test="${!empty list.freightOwnerSettlementCount and null ne list.freightOwnerSettlementCount}">
												<fmt:formatNumber value="${list.freightOwnerSettlementCount}"/>
											</c:when>
											<c:otherwise>
											</c:otherwise>
										</c:choose>
									</td>
									<!-- 총 정산금액 -->
									<td class="text-right"><fmt:formatNumber value="${list.freightOwnerSettlementTotalCharge}"/></td>
									<!-- 정산상태 -->
									<td>
										<c:choose>
											<c:when test="${'settlementFailed' eq list.freightOwnerSettlementStatus}">
												<span class="color-text-danger">${list.freightOwnerSettlementStatusName}</span>
											</c:when>
											<c:when test="${'settlementStandby' eq list.freightOwnerSettlementStatus}">
												<span class="color-text-primary">${list.freightOwnerSettlementStatusName}</span>
											</c:when>
											<c:when test="${'settlementRequested' eq list.freightOwnerSettlementStatus}">
												<span class="color-text-success">${list.freightOwnerSettlementStatusName}</span>
											</c:when>
											<c:when test="${'confirmRequired' eq list.freightOwnerSettlementStatus}">
												<%-- 입금확인필요 --%>
												<span class="color-text-success">${list.freightOwnerSettlementStatusName}</span>
											</c:when>
											<c:otherwise>
												${list.freightOwnerSettlementStatusName}
											</c:otherwise>
										</c:choose>
									</td>
									<!-- 정산완료일 -->
									<td>${list.freightOwnerSettlementDepositDateString}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
		</div>
		${result.pagination}
	</div>
</div>
<script>

	var searchedData;

	// 페이지네이션 
	$('.searchList ul.pagination li').on('click touch', function() {
		data.pageIndex = $(this).data('page-index');
		data.maskingYn = 'Y';
		searchList();
	})

	// 상세페이지 
	$('tr.listRow .link').not('.noData').css('cursor', 'pointer');
	$('tr.listRow .link').addClass('color-text-primary');
	$('tr.listRow .link').on('click', function() {
		var id = $(this).data('id');
		
		// 마스킹 초기화
		if (data.maskingYn == "N") {
			data.maskingYn = "Y";
		}
		
		if(id !== undefined && id !== '') {
			routie("detail/" + id + "/1");
		}
	});
	
	// 오류 발생시 alert
	$(document).ready(function() {
		
		<c:if test="${empty result.resultCode}">
			<c:set var="resultMsg" value="${fn:replace(fn:replace(result, LF, ''), CR, '')}"/>	
			alert('화주정산 목록 조회 중 오류가 발생하였습니다.\r\nERROR: ${resultMsg}')
		</c:if>
		<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
			alert('화주정산 목록 조회 중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}')
		</c:if>
			
		// 마스킹 버튼 텍스트 
		if(data.maskingYn === 'N') {
			$('#maskingBtn span.text').text('마스킹 처리');
		} else {
			$('#maskingBtn span.text').text('마스킹 해제');
		}

	})
	
	// 엑셀다운로드 등록
	$('#excelDownloadBtn').on('click touch', function () {
	    $.ajax({
	        type : "POST",
	        url : "<c:url value='/ui/service/common/popup/reason.unmasking'/>",
	        data : {
	          "maskingHistoryType" : "integListExcel"
	        , "type": "download"
	        },
	        cache : false,
	        async : true,
	        success : function(data, textStatus, XMLHttpRequest) {
	        if (hasErrorMap(data, true)) {
	          return;
	        }
	
	        $('#modal').html(data);
	        $('#popupUnmaskingReason').modal('show');
	        },
	        error : function(xhr, ajaxOptions, thrownError) {
	        if (hasErrorMap(xhr, false)) {
	          return;
	        }
	        }
	    });
	});

	// 엑셀 다운로드
	function excelDownload(_object) {
		var form = document.createElement('form');
		var JSONdata = JSON.stringify(searchedData);
		jQuery.ajaxSettings.traditional = true;
		
		var formTag;
		formTag = document.createElement('input');
		formTag.setAttribute('type', 'hidden');
		formTag.setAttribute('name', 'JSONdata');
		formTag.setAttribute('value', encodeURI(JSONdata));
		form.appendChild(formTag);
		
		var formTagCsrf;
		formTagCsrf = document.createElement('input');
		formTagCsrf.setAttribute('type', 'hidden');
		formTagCsrf.setAttribute('name', '_csrf');
		formTagCsrf.setAttribute('value', '${_csrf.token}');
		form.appendChild(formTagCsrf);
		
		form.setAttribute('method', 'post');
		form.setAttribute('action', "<c:url value='/ui/service/settlement/frg/excel/download'/>");
		form.setAttribute('method', 'post');
		
		document.body.appendChild(form);
		form.submit();
	}

	//마스킹 클릭 이벤트
	$('#maskingBtn').on('click touch', function () {
	
	  if(data.maskingYn === 'N') {
	    data.maskingYn = 'Y';
	    loadList(getData());
	  } else {
	    $.ajax({
	        type : "POST",
	        url : "<c:url value='/ui/service/common/popup/reason.unmasking'/>",
	        data : {
	          "maskingHistoryType" : "frgownSettlementList"
	        },
	        cache : false,
	        async : true,
	        success : function(data, textStatus, XMLHttpRequest) {
	        if (hasErrorMap(data, true)) {
	          return;
	        }
	
	        $('#modal').html(data);
	        $('#popupUnmaskingReason').modal('show');
	        },
	        error : function(xhr, ajaxOptions, thrownError) {
	        if (hasErrorMap(xhr, false)) {
	          return;
	        }
	        }
	    });
	  }
	});
</script>