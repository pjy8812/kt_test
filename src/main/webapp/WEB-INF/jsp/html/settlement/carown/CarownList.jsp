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
										<th class="align-middle sorting_asc">${headers}</th>
									</c:when>
									<c:otherwise>
										<th class="align-middle sorting">${headers}</th>
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
													<td class="text-center align-middle">${list.deliveryStatusName}</td>
													<td class="text-center align-middle">${list.registerDateString}</td>
													<td class="text-center align-middle">${list.dispatchDateString}</td>
													<td class="text-center align-middle">${list.loadingDateString}</td>
													<td class="text-center align-middle">${list.unloadingDateString}</td>
													<td class="text-center align-middle">${list.deliveryCancleDateString}</td>
													<%-- 배송비, 이동비, 대기비  --%>
													<td class="text-right align-middle">
														<c:if test="${'Y' eq list.carOwnerSettlementRegularChargeCheck}"><del></c:if>
														<fmt:formatNumber value="${list.carOwnerSettlementRegularCharge}"/>
														<c:if test="${'Y' eq list.carOwnerSettlementRegularChargeCheck}"></del></c:if>
													</td>
													<td class="text-right align-middle">
														<c:if test="${'Y' eq list.carOwnerSettlementMovingChargeCheck}"><del></c:if>
														<fmt:formatNumber value="${list.carOwnerSettlementMovingCharge}"/>
														<c:if test="${'Y' eq list.carOwnerSettlementMovingChargeCheck}"></del></c:if>
													</td>
													<td class="text-right align-middle">
														<c:if test="${'Y' eq list.carOwnerSettlementLoadingWatingChargeCheck}"><del></c:if>
														<fmt:formatNumber value="${list.carOwnerSettlementLoadingWaitingCharge}"/>
														<c:if test="${'Y' eq list.carOwnerSettlementLoadingWatingChargeCheck}"></del></c:if>
													</td>
													<td class="text-right align-middle">
														<c:if test="${'Y' eq list.carOwnerSettlementUnloadingWatingChargeCheck}"><del></c:if>
														<fmt:formatNumber value="${list.carOwnerSettlementUnloadingWaitingCharge}"/>
														<c:if test="${'Y' eq list.carOwnerSettlementUnloadingWatingChargeCheck}"></del></c:if>
													</td>
													<td class="text-center align-middle">
														<%-- 인수증 통합--%>
<%-- 													<button type="button" class="btn btn-white waves-effect receiptDownloadBtn" data-type="load" data-id="${list.carOwnerSettlementOrderId}">상차지</button> --%>
														<button type="button" class="btn btn-white waves-effect receiptDownloadBtn" data-type="unload" data-id="${list.carOwnerSettlementOrderId}">보기</button>
													</td>
													<td class="text-right align-middle"><fmt:formatNumber value="${list.carOwnerSettlementTotalCharge}"/></td>
													<td class="align-middle">
														<c:choose>
															<c:when test="${'settlementStandby' eq list.carOwnerSettlementState}">
																<%-- 정산대기 --%>
																${list.carOwnerSettlementStateName}
																<c:forEach items="${autUriList}" var="autUriList">
																	<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'U') gt -1}">
																		<button type="button" class="btn btn-white waves-effect ml-1 statusBtn" data-type="cancel" 
																			data-date="${list.carOwnerSettlementDate}"
																			<%-- data-date="${list.registerDate}" --%>
																			data-owner-id="${list.carOwnerIdOrg}"
																			data-settlement-id="${list.carOwnerSettlementId}"
																			data-order-id="${list.carOwnerSettlementOrderId}"
																			data-order-num="${list.carOwnerSettlementOrderNumber}"
																			data-settlement-state="${list.carOwnerSettlementState}"
																			data-root-settlement-id="${list.carOwnerSettlementId}"
																			>취소</button>
																	</c:if>
																</c:forEach>
															</c:when>
															<c:when test="${'settlementRequested' eq list.carOwnerSettlementState}">
																<%-- 정산중 --%>
																${list.carOwnerSettlementStateName}
																<c:set var="flagValue" value="${list.carOwnerSettlementRegularChargeCheck}${list.carOwnerSettlementMovingChargeCheck}${list.carOwnerSettlementLoadingWatingChargeCheck}${list.carOwnerSettlementUnloadingWatingChargeCheck}"/>
																<%-- ${flagValue} --%>
																<c:choose>
																	<c:when test="${fn:contains(flagValue, 'Y')}">
																		<button type="button" class="btn btn-dark waves-effect ml-1 statusBtn" data-type="detail" 
																		data-date="${list.carOwnerSettlementDate}"
																		<%-- data-date="${list.registerDate}" --%>
																		data-owner-id="${list.carOwnerIdOrg}"
																		data-settlement-id="${list.carOwnerSettlementId}"
																		data-order-id="${list.carOwnerSettlementOrderId}"
																		data-order-num="${list.carOwnerSettlementOrderNumber}"
																		data-settlement-state="${list.carOwnerSettlementState}"
																		data-root-settlement-id="${list.carOwnerSettlementId}"
																		>상세</button>
																	</c:when>
																	<c:otherwise>
																		<c:forEach items="${autUriList}" var="autUriList">
																			<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'U') gt -1}">
																				<button type="button" class="btn btn-white waves-effect ml-1 statusBtn" data-type="cancel" 
																					data-date="${list.carOwnerSettlementDate}"
																					<%-- data-date="${list.registerDate}" --%>
																					data-owner-id="${list.carOwnerIdOrg}"
																					data-settlement-id="${list.carOwnerSettlementId}"
																					data-order-id="${list.carOwnerSettlementOrderId}"
																					data-order-num="${list.carOwnerSettlementOrderNumber}"
																					data-settlement-state="${list.carOwnerSettlementState}"
																					data-root-settlement-id="${list.carOwnerSettlementId}"
																					>취소</button>
																			</c:if>
																		</c:forEach>
																	</c:otherwise>
																</c:choose>
																<%-- <button type="button" class="btn btn-dark waves-effect ml-1 needsTimeCheck d-none statusBtn" data-type="detail" 
																	data-date="${list.carOwnerSettlementDate}"
																	data-owner-id="${list.carOwnerIdOrg}"
																	data-settlement-id="${list.carOwnerSettlementId}"
																	data-order-id="${list.carOwnerSettlementOrderId}"
																	data-order-num="${list.carOwnerSettlementOrderNumber}"
																	data-settlement-state="${list.carOwnerSettlementState}"
																	data-root-settlement-id="${list.carOwnerSettlementId}"
																	>상세</button>
																<c:forEach items="${autUriList}" var="autUriList">
																	<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'U') gt -1}">
																		<button type="button" class="btn btn-white waves-effect ml-1 needsTimeCheck d-none statusBtn" data-type="cancel" 
																			data-date="${list.carOwnerSettlementDate}"
																			data-owner-id="${list.carOwnerIdOrg}"
																			data-settlement-id="${list.carOwnerSettlementId}"
																			data-order-id="${list.carOwnerSettlementOrderId}"
																			data-order-num="${list.carOwnerSettlementOrderNumber}"
																			data-settlement-state="${list.carOwnerSettlementState}"
																			data-root-settlement-id="${list.carOwnerSettlementId}"
																			>취소</button>
																	</c:if>
																</c:forEach> --%>
															</c:when>
															<c:when test="${'sendFailed' eq list.carOwnerSettlementState}">
																<%-- 전송실패 --%>
																<span class="custom-text-danger">${list.carOwnerSettlementStateName}</span>
																<button type="button" class="btn btn-dark waves-effect ml-1 needsTimeCheck d-none statusBtn" data-type="detail" 
																	data-date="${list.carOwnerSettlementDate}" 
																	<%-- data-date="${list.registerDate}" --%>
																	data-owner-id="${list.carOwnerIdOrg}"
																	data-settlement-id="${list.carOwnerSettlementId}"
																	data-order-id="${list.carOwnerSettlementOrderId}"
																	data-order-num="${list.carOwnerSettlementOrderNumber}"
																	data-settlement-state="${list.carOwnerSettlementState}"
																	data-root-settlement-id="${list.carOwnerSettlementId}"
																	>상세</button>
																<c:forEach items="${autUriList}" var="autUriList">
																	<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'U') gt -1}">
																		<button type="button" class="btn btn-white waves-effect ml-1 needsTimeCheck d-none statusBtn" data-type="cancel" 
																			data-date="${list.carOwnerSettlementDate}"
																			<%-- data-date="${list.registerDate}" --%>
																			data-owner-id="${list.carOwnerIdOrg}"
																			data-settlement-id="${list.carOwnerSettlementId}"
																			data-order-id="${list.carOwnerSettlementOrderId}"
																			data-order-num="${list.carOwnerSettlementOrderNumber}"
																			data-settlement-state="${list.carOwnerSettlementState}"
																			data-root-settlement-id="${list.carOwnerSettlementId}"
																			>취소</button>
																	</c:if>
																</c:forEach>
															</c:when>
															<c:when test="${'settlementCompleted' eq list.carOwnerSettlementState}">
																<%-- 정산완료 --%>
																${list.carOwnerSettlementStateName}
																<button type="button" class="btn btn-dark waves-effect ml-1 statusBtn" data-type="detail" 
																	data-date="${list.carOwnerSettlementDate}"
																	<%-- data-date="${list.registerDate}" --%>
																	data-owner-id="${list.carOwnerIdOrg}"
																	data-settlement-id="${list.carOwnerSettlementId}"
																	data-order-id="${list.carOwnerSettlementOrderId}"
																	data-order-num="${list.carOwnerSettlementOrderNumber}"
																	data-settlement-state="${list.carOwnerSettlementState}"
																	data-root-settlement-id="${list.carOwnerSettlementId}"
																	>상세</button>
															</c:when>
															<c:otherwise>
																${list.carOwnerSettlementStateName}
															</c:otherwise>
														</c:choose>
													</td>
													<%-- 확인필요 --%>
													<td class="align-middle">
														<c:choose>
															<c:when test="${null ne list.carOwnerSettlementResendDateString and '' ne list.carOwnerSettlementResendDateString}">
																${list.carOwnerSettlementResendDateString}
															</c:when>
															<c:otherwise>
																-
															</c:otherwise>
														</c:choose>
													</td>
													<%-- 확인필요 --%>
													<td class="align-middle">
														<c:choose>
															<c:when test="${null ne list.carOwnerSettlementDoneDateString and '' ne list.carOwnerSettlementDoneDateString}">
																${list.carOwnerSettlementDoneDateString}
															</c:when>
															<c:otherwise>
																-															
															</c:otherwise>
														</c:choose>
													</td>
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
													<td class="text-left align-middle">${list.carOwnerNum}</td>
													<td class="text-left align-middle">${list.carOwnerCompany}</td>
													<td class="text-left align-middle">${list.carOwnerCorporateRegistrationNumber}</td>
													<td class="text-left align-middle">${list.carOwnerPhone}</td>
													<td class="text-left align-middle">${list.carOwnerEmail}</td>
													<td class="text-left align-middle link" data-id="${list.carOwnerSettlementId}">${list.carOwnerSettlementId}</td>
													<%-- <td class="text-left align-middle">
														${list.carOwnerBank}
														<c:if test="${null ne list.carOwnerAccount and '' ne list.carOwnerAccount}"> ${list.carOwnerAccount}</c:if>
													</td> --%>
													<td>${list.carOwnerSettlementDateString}</td>
													<%-- 정산건수 --%>
													<td class="text-right align-middle"><fmt:formatNumber value="${list.carOwnerSettlementTotalCount}"/></td>
													<td class="text-right align-middle<c:if test="${list.carOwnerSettlementFailCount gt 0}"> color-text-danger</c:if>">
														<%-- 전송실패 --%>
														<fmt:formatNumber value="${list.carOwnerSettlementFailCount}"/>
													</td>
													<%-- 정산ㄷ내상 --%>
													<td class="text-right align-middle"><fmt:formatNumber value="${list.carOwnerSettlementCount}"/></td>
													<%-- 취소건수 --%>
													<td class="text-right align-middle"><fmt:formatNumber value="${list.carOwnerSettlementCancelCount}"/></td>
													<td class="text-right align-middle">
														<%-- 정산대상금액 --%>
														<fmt:formatNumber value="${list.carOwnerSettlementPrice}"/>
													</td>
													<td class="text-right align-middle">
														<%--정산완료금액 --%>
														<c:choose>
															<c:when test="${null ne list.carOwnerSettlementCompletedPrice and !empty list.carOwnerSettlementCompletedPrice}">
																<fmt:formatNumber value="${list.carOwnerSettlementCompletedPrice}"/>
															</c:when>
															<c:otherwise>
																-
															</c:otherwise>
														</c:choose>
													</td>
													<td class="align-middle">
														<c:choose>
															<c:when test="${'sendFailed' eq list.carOwnerSettlementState}">
																<%-- 전송실패 --%>
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
													</td >
													<td class="align-middle">
														<c:choose>
															<c:when test="${null ne list.carOwnerSettlementDoneDateString and '' ne list.carOwnerSettlementDoneDateString}">
																${list.carOwnerSettlementDoneDateString}
															</c:when>
															<c:otherwise>
																-
															</c:otherwise>
														</c:choose>
													</td>
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
	// console.log("== orgPath ==");
	
	// 페이지네이션 
	$('.searchList ul.pagination li').on('click touch', function() {
		data.pageIndex = $(this).data('page-index');
		data.maskingYn = 'Y';
		searchList();
	})
	
	// 차주 목록 엑셀 다운로드
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
		form.setAttribute('action', "<c:url value='/ui/service/settlement/car/excel/download'/>");
		document.body.appendChild(form);
		form.submit();
	}

	// 상세페이지 
	$('tr.listRow .link').not('.noData').css('cursor', 'pointer');
	$('tr.listRow .link').addClass('color-text-primary');
	$('tr.listRow .link').on('click', function() {
		var id = $(this).data('id');
		
		if (data.maskingYn == "N") {
			data.maskingYn = "Y";
		}

		if (id !== undefined && id !== '') {
			routie("detail/" + id + "/1");
		}
	});
	
	// 승인취소 버튼 클릭 이벤트 
	/* $('.cancelBtn').on('click touch', function() {
		cancelSettlement(this);
	}); */
	
	// 정산발생일 익일 10시 50분 기준으로 취소/상세 버튼 노출 여부 확인   
	function toggleStatusBtn() {
		
		// needsTimeCheck class가 있을 경우만 체크 
		$('.needsTimeCheck').each(function(index, item) {
			if(checkTime($(item))) {
				// 기준시간 이전 
				if($(this).data('type') === 'detail') {
					$(this).addClass('d-none');
				} else if($(this).data('type') === 'cancel') {
					$(this).removeClass('d-none');
				} else {
					$(this).addClass('d-none');
				}
			} else {
				// 기준시간 이후 
				if($(this).data('type') === 'detail') {
					$(this).removeClass('d-none');
				} else if($(this).data('type') === 'cancel') {
					$(this).addClass('d-none');
				} else {
					$(this).addClass('d-none');
				}
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
	
	// 진행상태 버튼 클릭 이벤트 
	$('.statusBtn').on('click touch', function() {
		if($(this).data('type') === 'cancel') {
			cancelSettlement($(this));
		} else if($(this).data('type') === 'detail') {
			toggleDetailPopoup($(this));
		} else {
			// console.log($(this).data('type'));
		}
 	})
	
	// 오류 발생시 alert
	$(document).ready(function() {
		
		<c:if test="${empty result.resultCode}">
			<c:set var="resultMsg" value="${fn:replace(fn:replace(result, LF, ''), CR, '')}"/>	
			alert('차주정산 목록 조회 중 오류가 발생하였습니다.\r\nERROR: ${resultMsg}')
		</c:if>
		<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
			alert('차주정산 목록 조회 중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}')
		</c:if>

		// 마스킹 버튼 텍스트 
		if(data.maskingYn === 'N') {
			$('#maskingBtn span.text').text('마스킹 처리');
		} else {
			$('#maskingBtn span.text').text('마스킹 해제');
		}
			
		toggleStatusBtn();
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
				    "maskingHistoryType" : "carownSettlementList"
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
	
	// 엑셀다운로드 등록
	$('#excelDownloadBtn').on('click touch', function () {
		$.ajax({
		    type : "POST",
		    url : "<c:url value='/ui/service/common/popup/reason.unmasking'/>",
		    data : {
			    "maskingHistoryType" : "frgownSettlementExcel"
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
	
</script>