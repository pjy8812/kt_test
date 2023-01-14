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

<script src="<c:url value='/assets/libs/apexcharts/apexcharts.min.js'/>"></script>
<script src="<c:url value='/assets/libs/flatpickr/plugins/monthSelect/index.js'/>"></script>
<link href="<c:url value='/assets/libs/flatpickr/plugins/monthSelect/style.css'/>" rel="stylesheet" type="text/css" />

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
					class="table th-vam td-vam dt-responsive nowrap dataTable no-footer dtr-inline text-center"
					role="grid">
					<thead>
						<tr role="row">
							<c:forEach var="integration" items="${headersMap.integrationHeaders}" varStatus="idx">
								<c:choose>
									<c:when test="${'0' eq idx}">
										<th class="sorting_asc" rowspan="2">${integration}</th>
									</c:when>
									<c:otherwise>
										<th class="sorting" rowspan="2">${integration}</th>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<th colspan="7" class="divide">화주</th>
							<th colspan="11">차주/운송대행사</th>
						</tr>
						<tr role="row">
							<c:forEach var="freightHeader" items="${headersMap.freightOwnerHeaders}" varStatus="idx">
								<c:choose>
									<c:when test="${'0' eq idx}">
										<th>${freightHeader}</th>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${idx.last}">
												<th class="divide">${freightHeader}</th>
											</c:when>
											<c:otherwise>
												<th>${freightHeader}</th>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<c:forEach var="carHeader" items="${headersMap.carOwnerHeaders}" varStatus="idx">
								<c:choose>
									<c:when test="${'0' eq idx}">
										<th class="sorting_asc" rowspan="2">${carHeader}</th>
									</c:when>
									<c:otherwise>
										<th class="sorting" rowspan="2">${carHeader}</th>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</tr>
					</thead>
					<c:choose>
						<c:when test="${empty result.list}">
							<tbody>
								 <tr role="row" class="listRow noData">
									<td colspan="${fn:length(headersMap.integrationHeaders) + fn:length(headersMap.freightOwnerHeaders) + fn:length(headersMap.carOwnerHeaders)}">
										조회 결과가 없습니다.
									</td>
								</tr>
							</tbody>
						</c:when>
						<c:otherwise>
							<c:set value="${result.maxIndex}" var="maxIndex"/>
							<c:forEach items="${result.list}" var="list">
       						 <tr role="row" class="listRow"
       						 			data-freight-owner-settlement-order-num="${list.freightOwnerSettlementOrderNum}"
			       						data-car-owner-settlement-yyyymmdd="${list.carOwnerSettlementYyyymmdd}"
										data-freight-owner-settlement-yyyymm="${list.freightOwnerSettlementYyyymm}"
										data-freight-owner-settlement-id="${list.freightOwnerSettlementId}"
										data-car-owner-settlement-id="${list.carOwnerSettlementId}">
        					 <!-- No -->
									<td>
										${maxIndex}
										<c:set var="maxIndex" value="${maxIndex-1}"/>
									</td>
									<!-- 주문번호 -->
     							    <td class="text-center link">${list.freightOwnerSettlementOrderNum}</td>
         							<!-- 정산마감일 -->
									<td class="text-center">
										<c:choose>
											<c:when test="${list.freightOwnerSettlementDoenDate ne '' and list.freightOwnerSettlementDoenDate ne null}">
												<fmt:formatDate value="${list.freightOwnerSettlementDoenDate}" pattern="yyyy-MM-dd"/>
											</c:when>
											<c:otherwise>
												-
											</c:otherwise>
										</c:choose>
									</td>
									<!-- 화주_화주명 -->
									<td class="text-left">${list.freightOwnerName}</td>
									<!-- 화주_화주ID -->
									<td class="text-left">${list.freightOwnerId}</td>
									<!-- 화주_화주사 -->
									<td class="text-left">${list.freightOwnerCompany}</td>
									<!-- 화주_청구ID -->
       								<td class="text-left link">${list.freightOwnerSettlementId}</td>
         					        <!-- 화주_청구금액 -->
									<td class="text-right"><fmt:formatNumber value="${list.freightOwnerSettlementPrice}"/></td>
									<!-- 화주_청구마감월 -->
									<td class="text-center">${list.freightOwnerSettlementYyyymm}</td>
									<!-- 화주_청구상태 -->
									<td class="divide">
										<c:choose>
											<c:when test="${'settlementFailed' eq list.freightOwnerSettlementState}">
												<span class="color-text-danger">${list.freightOwnerSettlementStateName}</span>
											</c:when>
											<c:when test="${'settlementStandby' eq list.freightOwnerSettlementState}">
												<span class="color-text-primary">${list.freightOwnerSettlementStateName}</span>
											</c:when>
											<c:when test="${'settlementRequested' eq list.freightOwnerSettlementState}">
												<span class="color-text-success">${list.freightOwnerSettlementStateName}</span>
											</c:when>
											<c:when test="${'confirmRequired' eq list.freightOwnerSettlementState}">
												<%-- 입금확인필요 --%>
												<span class="color-text-success">${list.freightOwnerSettlementStateName}</span>
											</c:when>
											<c:otherwise>
												${list.freightOwnerSettlementStateName}
											</c:otherwise>
										</c:choose>
									</td>
									<!-- 차주/운송대행사_차량번호 -->
									<td class="text-left">${list.carNum}</td>
									<!-- 차주/운송대행사_차주명 -->
									<td class="text-left">${list.carOwnerName}</td>
									<!-- 차주/운송대행사_차주ID -->
									<td class="text-left">${list.carOwnerId}</td>
									<!--  차주/운송대행사_운송대행사 -->
									<td class="text-left">${list.carrierName}</td>
									<!-- 차주/운송대행사_운송대행사ID -->
									<td class="text-left">${list.carrierId}</td>
									<!-- 차주/운송대행사_운송대행사 사업자등록번호 -->
									<td class="text-left">${list.carrierCorporateRegistrationNumber}</td>
									<!-- 차주/운송대행사_지급ID -->
     								<td class="text-left link">${list.carOwnerSettlementId}</td>
         							<!-- 차주/운송대행사_지급방법 -->
									<td>
										<c:choose>
											<c:when test="${'nextDayPayment' eq list.carOwnerSettlementPaymentMethod}">
												<span class="color-text-danger">${list.carOwnerSettlementPaymentMethodName}</span>
											</c:when>
											<c:when test="${'monthEndPayment' eq list.carOwnerSettlementPaymentMethod}">
												<span class="color-text-primary">${list.carOwnerSettlementPaymentMethodName}</span>
											</c:when>
											<c:otherwise>
												${list.carOwnerSettlementPaymentMethodName}
											</c:otherwise>
										</c:choose>
									</td>
									<!-- 차주/운송대행사_지급금액 -->
									<td class="text-right"><fmt:formatNumber value="${list.carOwnerSettlementPrice}"/></td>
									<!-- 차주/운송대행사_지급마감월 -->
									<td class="text-center">${list.carOwnerSettlementYyyymmdd}</td>
									<!-- 차주/운송대행사_지급상태 -->
									<td>
										<c:choose>
											<c:when test="${'settlementFailed' eq list.carOwnerSettlementState}">
												<span class="color-text-danger">${list.carOwnerSettlementStateName}</span>
											</c:when>
											<c:when test="${'settlementStandby' eq list.carOwnerSettlementState}">
												<span class="color-text-primary">${list.carOwnerSettlementStateName}</span>
											</c:when>
											<c:when test="${'settlementRequested' eq list.carOwnerSettlementState}">
												<span class="color-text-success">${list.carOwnerSettlementStateName}</span>
											</c:when>
											<c:when test="${'confirmRequired' eq list.carOwnerSettlementState}">
												<%-- 입금확인필요 --%>
												<span class="color-text-success">${list.carOwnerSettlementStateName}</span>
											</c:when>
											<c:otherwise>
												${list.carOwnerSettlementStateName}
											</c:otherwise>
										</c:choose>
									</td>
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
		searchList();
	})
	
	// 상세페이지 
	$('tr.listRow .link').not('.noData').css('cursor', 'pointer');
	$('tr.listRow .link').addClass('color-text-primary');
	$('tr.listRow .link').on('click', function(_el) {
		freightOwnerSettlementId = $(this).closest('tr').data('freight-owner-settlement-id');
		carOwnerSettlementId = $(this).closest('tr').data('car-owner-settlement-id');
		freightOwnerSettlementYyyyMm = $(this).closest('tr').data('freight-owner-settlement-yyyymm');
		carOwnerSettlementYyyymmdd = $(this).closest('tr').data('car-owner-settlement-yyyymmdd');
		freightOwnerSettlementOrderNum = $(this).closest('tr').data('freight-owner-settlement-order-num');
		
		integDetail("Y", "Y");
	});
	
	function integDetail(frgownMaskingYn, carownMaskingYn) {
		let object = {
				"nowPage": 1,
				"carOwnerSettlementId": carOwnerSettlementId,
				"frgownMaskingYn": frgownMaskingYn,
				"carownMaskingYn": carownMaskingYn,
				"freightOwnerSettlementYyyyMm": freightOwnerSettlementYyyyMm,
				"carOwnerSettlementYyyymmdd": carOwnerSettlementYyyymmdd,
				"freightOwnerSettlementOrderNum": freightOwnerSettlementOrderNum
				};
		data.object = object;
		var queryString = encodeURIComponent(JSON.stringify(object));
		if(freightOwnerSettlementId !== undefined && freightOwnerSettlementId !== '') {
			routie("detail/" + freightOwnerSettlementId + "/" + queryString);
			}
		}
	
	// 오류 발생시 alert
	$(document).ready(function() {
		
		<c:if test="${empty result.resultCode}">
			<c:set var="resultMsg" value="${fn:replace(fn:replace(result, LF, ''), CR, '')}"/>	
			alert('통합 주문조회 조회 중 오류가 발생하였습니다.\r\nERROR: ${resultMsg}')
		</c:if>
		<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
			alert('통합 주문조회 조회 중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}')
		</c:if>

		// 마스킹 버튼 텍스트 
		if(data.maskingYn === 'N') {
			$('#maskingBtn span.text').text('마스킹 처리');
		} else {
			$('#maskingBtn span.text').text('마스킹 해제');
		}

	})
	
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
				    "maskingHistoryType" : "integList"
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
	
	// 엑셀다운로드 클릭
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

	// 목록 로드 
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
		form.setAttribute('action', "<c:url value='/ui/service/settlement/integration/excel/download'/>");
		form.setAttribute('method', 'post');

		document.body.appendChild(form);
		form.submit();
	}
	
</script>