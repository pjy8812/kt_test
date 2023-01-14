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
<div class="row mb-2">
	<div class="col-12 text-right">
		<button type="button"
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
					<tbody>
						<c:choose>
							<c:when test="${empty result.list}">
								<tr role="row" class="listRow noData" data-id="${list.id}">
									<td colspan="${fn:length(headers)}">
										조회 결과가 없습니다.
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${'order' eq pageType}">
										<tbody>
											<%-- 주문 건 조회 --%>
											<c:set value="${result.maxIndex}" var="maxIndex"/>
											<c:forEach items="${result.list}" var="list">
												<tr role="row" class="listRow" data-id="${maxIndex}">
													<td class="align-middle">
														${maxIndex}
														<c:set var="maxIndex" value="${maxIndex-1}"/>
													</td>
													<td class="text-left align-middle">${list.carOwnerName}</td>
													<td class="text-left align-middle">${list.carOwnerId}</td>
													<td class="text-left align-middle link" data-id="${list.carOwnerSettlementId}">${list.carOwnerSettlementId}</td>
													<td class="text-left align-middle">${list.carOwnerSettlementOrderNumber}</td>
													<td class="text-left align-middle">${list.deliveryStatusName}</td>
													<td class="text-left align-middle">${list.registerDateString}</td>
													<td class="text-left align-middle">${list.dispatchDateString}</td>
													<td class="text-left align-middle">${list.loadingDateString}</td>
													<td class="text-left align-middle">${list.unloadingDateString}</td>
													<td class="text-left align-middle">${list.deliveryCancleDateString}</td>
													<%-- 배송비, 이동비, 대기비  --%>
													<td class="text-right align-middle"><fmt:formatNumber value="${list.carOwnerSettlementRegularCharge}"/></td>
													<td class="text-right align-middle"><fmt:formatNumber value="${list.carOwnerSettlementMovingCharge}"/></td>
													<td class="text-right align-middle"><fmt:formatNumber value="${list.carOwnerSettlementWaitingCharge}"/></td>
													<td class="text-center align-middle">
														<%-- 인수증 --%>
														<button type="button" class="btn btn-white waves-effect receiptDownloadBtn" data-type="load" data-id="${list.carOwnerSettlementOrderId}">상차지</button>
														<button type="button" class="btn btn-white waves-effect receiptDownloadBtn" data-type="unload" data-id="${list.carOwnerSettlementOrderId}">하차지</button>
													</td>
													<td class="text-right align-middle"><fmt:formatNumber value="${list.carOwnerSettlementTotalCharge}"/></td>
													<td class="align-middle">
														<%-- 기획서상 승인대기는 settlementRequested입니다. 추가로 승인 완료는 settlementCompleted, 승인취소는 CancelCompleted입니다. --%>
														<c:choose>
															<c:when test="${'cancelCompleted' eq list.carOwnerSettlementState}">
																<%-- 취소완료 --%>
																<span class="color-text-danger">
																	${list.carOwnerSettlementStateName}
																</span>
															</c:when>
															<c:when test="${'settlementStandby' eq list.carOwnerSettlementState or 'settlementRequested' eq list.carOwnerSettlementState}">
																<%-- 정산대기/정산중  --%>
																<span class="color-text-primary">${list.carOwnerSettlementStateName}</span>
																<c:forEach items="${autUriList}" var="autUriList">
																	<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'U') gt -1}">
																		<button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark ml-1 cancelBtn d-none
																			<c:if test="${'settlementRequested' eq list.carOwnerSettlementState}">
																				needsTimeCheck
																			</c:if>
																			" id="cancelBtn" 
																			data-owner-id="${list.carOwnerIdOrg}"
																			data-settlement-id="${list.carOwnerSettlementId}"
																			data-order-id="${list.carOwnerSettlementOrderId}"
																			<c:if test="${null ne list.carOwnerSettlementDate  and '' ne list.carOwnerSettlementDate}">
																				data-date="${list.carOwnerSettlementDate }"
																			</c:if>
																			>취소</button>
																	</c:if>
																</c:forEach>
															</c:when>
															<c:when test="${'settlementCompleted' eq list.carOwnerSettlementState}">
																<%-- 승인완료 --%>
																<span class="">
																	${list.carOwnerSettlementStateName}
																</span>
															</c:when>
															<c:otherwise>
																${list.carOwnerSettlementStateName}
															</c:otherwise>
														</c:choose>
													</td>
													<%-- 확인필요 --%>
													<td class="align-middle">${list.carOwnerSettlementDoneDateString}</td>
												</tr>
											</c:forEach>
										</tbody>	
									</c:when>
									<c:otherwise>
										<%-- 차주 일별 조회 --%>
										<tbody>
											<c:set value="${result.maxIndex}" var="maxIndex"/>
											<c:forEach items="${result.list}" var="list">
												<tr role="row" class="listRow" data-id="${maxIndex}">
													<td class="align-middle">
														${maxIndex}
														<c:set var="maxIndex" value="${maxIndex-1}"/>
													</td>
													<td class="text-left align-middle">${list.carOwnerName}</td>
													<td class="text-left align-middle">${list.carOwnerId}</td>
													<td class="text-left align-middle">${list.carOwnerCompany}</td>
													<td class="text-left align-middle">${list.carOwnerPhone}</td>
													<td class="text-left align-middle">${list.carOwnerEmail}</td>
													<td class="text-left align-middle link" data-id="${list.carOwnerSettlementId}">${list.carOwnerSettlementId}</td>
													<%-- <td class="text-left align-middle">
														${list.carOwnerBank}
														<c:if test="${null ne list.carOwnerAccount and '' ne list.carOwnerAccount}"> ${list.carOwnerAccount}</c:if>
													</td> --%>
													<td>${list.carOwnerSettlementDateString}</td>
													<td class="text-right align-middle"><fmt:formatNumber value="${list.carOwnerSettlementTotalCount}"/></td>
													<%-- 정산건수 --%>
													<td class="text-right align-middle"><fmt:formatNumber value="${list.carOwnerSettlementCount}"/></td>
													<%-- 취소건수 --%>
													<td class="text-right align-middle"><fmt:formatNumber value="${list.carOwnerSettlementCancelCount}"/></td>
													<td class="text-right align-middle"><fmt:formatNumber value="${list.carOwnerSettlementPrice}"/></td>
													<td class="align-middle">
														<c:choose>
															<c:when test="${'settlementFailed' eq list.carOwnerSettlementState}">
																<%-- 정산취소 --%>
																<span class="color-text-danger">${list.carOwnerSettlementStateName}</span>
															</c:when>
															<c:when test="${'settlementStandby' eq list.carOwnerSettlementState}">
																<%-- 정산대기 --%>
																<span class="color-text-success">${list.carOwnerSettlementStateName}</span>
															</c:when>
															<c:when test="${'settlementRequested' eq list.carOwnerSettlementState}">
																<%-- 정산중 --%>
																<span class="color-text-primary">${list.carOwnerSettlementStateName}</span>
															</c:when>
															<c:otherwise>
																${list.carOwnerSettlementStateName}
															</c:otherwise>
														</c:choose>
													</td>
													<td class="align-middle">${list.carOwnerSettlementDoneDateString}</td>
												</tr>
											</c:forEach>
										</tbody>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
		${result.pagination}
	</div>
</div>
<script>

	var searchedData;
	// console.log("== !orgPath ==");
	
	//페이지네이션 
	$('.searchList ul.pagination li').on('click touch', function() {
		data.pageIndex = $(this).data('page-index');
		searchList();
	})
	
	// 차주 목록 엑셀 다운로드 
	$('.excelDownloadBtn').on('click touch', function () {
		
		if(confirm('조회된 모든값을 다운로드하시겠습니까?')) {
			
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
			form.setAttribute('action', "<c:url value='/ui/service/settlement/car/excel/download'/>");
			document.body.appendChild(form);
			form.submit();
		}
		
		// location.href = "<c:url value='/ui/service/settlement/car/excel/download?JSONdata='/>";
	})

	// 상세페이지 
	$('tr.listRow .link').not('.noData').css('cursor', 'pointer');
	$('tr.listRow .link').addClass('color-text-primary');
	$('tr.listRow .link').on('click', function() {
		var id = $(this).data('id');

		if (id !== undefined && id !== '') {
			routie("detail/" + id + "/1");
		}
	});
	
	// 승인취소 버튼 클릭 이벤트 
	$('.cancelBtn').on('click touch', function() {
		cancelSettlement(this);
	});
	
	// 승인취소 
	function cancelSettlement(_el) {
		
		// carOwnerId
		var ownerId = $(_el).data('owner-id') === undefined ? null : $(_el).data('owner-id');
		if(ownerId === undefined || ownerId === null || ownerId === '') {
			alert('차주정보가 유효하지 않습니다.');
			return false;
		}
		
		// carOwnerSettlementId
		var settlementId = $(_el).data('settlement-id') === undefined ? null : $(_el).data('settlement-id');
		if(settlementId === undefined || settlementId === null || settlementId === '') {
			alert('정산정보가 유효하지 않습니다.');
			return false;
		}
		
		// carOwnerSettlementOrderId 
		var orderId = $(_el).data('order-id') === undefined ? null : $(_el).data('order-id');
		if(orderId === undefined || orderId === null || orderId === '') {
			alert('주문정보가 유효하지 않습니다.');
			return false;
		}
		
		if($(_el).hasClass('needsTimeCheck')) {
			if(!checkTime(_el)) {
				alert('취소 가능한 시간이 아닙니다.');
				return false;
			}
		}
		
		if(confirm('해당 건을 승인취소하여 정산에서 제외하시겠습니까?')) {
			$.ajax({
				type : "POST",
				url : "<c:url value='/ui/service/settlement/car/cancel/settlement'/>",
				data : {
					carOwnerId : ownerId
					, carOwnerSettlementId : settlementId
					, carOwnerSettlementOrderId : orderId
				},
				cache : false,
				async : true,
				success : function(data, textStatus, XMLHttpRequest) {
					if(data.resultCode === '00000') {
						alert('취소되었습니다.');
						location.reload();
					} else if(data.resultCode === '00009') {
						alert('취소에 실패하였습니다.');
					} else {
						alert('승인취소 도중 오류가 발생하였습니다.\r\nERROR: ' + JSON.stringify(data));
					}
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
		} else {
			// 버튼 새로고침 
			toggleCancelBtn();
		}
	}
	
	// 11시 기준으로 승인취소 버튼 노출여부 적용 
	function toggleCancelBtn() {
			
		$('.cancelBtn').each(function(index, item) {
			
			if($(item).hasClass('needsTimeCheck')) {
				
				if(checkTime($(item))) {
					$(this).removeClass('d-none');
				} else {
					$(this).addClass('d-none');
				}
			} else {
				$(this).removeClass('d-none');
			}
		});
	}
	
	// 차주 정산상세 인수증 다운로드 
	$('.receiptDownloadBtn').on('click touch', function () {
		if(confirm('인수증을 다운로드하시겠습니까?')) {

			var urlString = "/" + $(this).data('type') + "/" + $(this).data('id');
			
			$.ajax({
				type : "POST",
				url : "<c:url value='/ui/service/common/receipt/preview'/>" + urlString,
				data : {
				},
				cache : false,
				async : false,
				success : function(resultData, textStatus, XMLHttpRequest) {
					if (hasErrorMap(resultData, true)) {
						return;
					}
					
					if(resultData.resultCode === '00000') {
						location.href = "<c:url value='/ui/service/common/receipt/download'/>" + urlString;
					} else if(resultData.resultCode === '10002') {
						alert('인수증이 존재하지 않습니다.');
					} else {
						alert('인수증 다운로드 중 오류가 발생하였습니다.\r\nERROR: ' + JSON.stringify(resultData));
					}
					if (hasErrorMap(resultData, true)) {
						return;
					}
				},
				error : function(xhr, ajaxOptions, thrownError) {
					if (hasErrorMap(xhr, false)) {
						return;
					}
				}
			});
		};
	})
	
	// 취소 기준시간 체크 
	function checkTime(_dataDateEl) {
		
		if($(_dataDateEl).data('date') === undefined || $(_dataDateEl).data('date') === '') {
			// console.log('정산발생일 is undefined.');
			return false;
		} 
		
		var now = new Date().getTime();
		
		var targetDateTime = new Date(new Date($(_dataDateEl).data('date'))).getTime();
		var targetDate = new Date(new Date($(_dataDateEl).data('date')).setHours(0,0,0,0)).getTime();
		
		var diffHour = 24 + 11; // 익일 11시  
		var diffMillsc = (diffHour) * 60 * 60 * 1000;
		
		var toggleTime = new Date(targetDate + diffMillsc).getTime();
		
		// 하차시간 이상이고 토클시간 미만 
		return (targetDateTime <= now) && (now < toggleTime); // 당일 11시 전(10시 59분)까지
	}
	
	// 오류 발생시 alert
	$(document).ready(function() {
		
		data.maskingYn = 'Y';
		
		<c:if test="${empty result.resultCode}">
			<c:set var="resultMsg" value="${fn:replace(fn:replace(result, LF, ''), CR, '')}"/>	
			alert('차주정산 목록 조회 중 오류가 발생하였습니다.\r\nERROR: ${resultMsg}')
		</c:if>
		<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
			alert('차주정산 목록 조회 중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}')
		</c:if>
			
		toggleCancelBtn();
	})
	
</script>