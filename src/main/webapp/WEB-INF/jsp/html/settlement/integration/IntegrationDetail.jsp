<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib prefix="form"
	uri="http://www.springframework.org/tags/form"%><%@ taglib
	prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib
	prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
pageContext.setAttribute("CR", "\r");
pageContext.setAttribute("LF", "\n");
%>

<!-- Begin page -->
<div class="row">
	<div class="col-12">
		<div class="row">
			<div class="col-6">
				<div class="card-box" id="itemDetail">
					<h5 class="card-title">
						화주정보 <i class="fas fa-external-link-alt userInfoBtn"
							data-id="${result.frgSettlement.freightOwnerSettlementId}"
							data-own="frgown"
							style="cursor: pointer;"></i>
					</h5>
					<div class="table-responsive">
						<table class="table mb-0 basic-table">
							<colgroup>
								<col style="width: 14%;">
								<col style="width: 36%;">
								<col style="width: 14%;">
								<col style="width: 36%;">
							</colgroup>
							<tbody>
								<tr>
									<th>계약구분</th>
									<td>${result.frgown.freightOwnerTypeName}</td>
									<th>청구</th>
									<td><c:choose>
											<c:when
												test="${'0' eq result.frgown.freightOwnerMonthSettlementNum}">
												0회
											</c:when>
											<c:when
												test="${'1' eq result.frgown.freightOwnerMonthSettlementNum}">
												1회 (매월 4일)
											</c:when>
											<c:when
												test="${'2' eq result.frgown.freightOwnerMonthSettlementNum}">
												2회 (매월 4일, 9일)
											</c:when>
											<c:otherwise>
												${result.frgown.freightOwnerMonthSettlementNum}
											</c:otherwise>
										</c:choose></td>
								</tr>
								<tr>
									<th>사업자구분</th>
									<td>${result.frgown.freightOwnerMemberTypeName}</td>
									<th>화주사</th>
									<td>${result.frgown.freightOwnerCompany}</td>
								</tr>
								<tr>
									<th>사업자유형</th>
									<td>${result.frgown.freightOwnerBusinessTypeName}</td>
									<th>사업자등록번호</th>
									<td>${result.frgown.freightOwnerCorporateRegistrationNumber}</td>
								</tr>
								<tr>
									<th>화주명</th>
									<td>${result.frgown.freightOwnerName}</td>
									<th>전화번호</th>
									<td>${result.frgown.freightOwnerTelephone}</td>
								</tr>
								<tr>
									<th>화주ID</th>
									<td>${result.frgown.freightOwnerId}</td>
									<th>이메일주소</th>
									<td>${result.frgown.freightOwnerEmail}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="card-box">
					<h5 class="card-title">청구요약</h5>
					<div class="table-responsive">
						<table class="table mb-0 basic-table">
							<colgroup>
								<col style="width: 14%;">
								<col style="width: 36%;">
								<col style="width: 14%;">
								<col style="width: 36%;">
							</colgroup>
							<tbody>
								<tr>
									<th>청구ID</th>
									<td id="frgownSettlementId" data-frgown-settlement-id="${result.frgSettlement.freightOwnerSettlementId}">${result.frgSettlement.freightOwnerSettlementId}</td>
									<th>건수</th>
									<td>${result.frgSettlement.freightOwnerSettlementCount}</td>
								</tr>
								<tr>
									<th>청구발생일</th>
									<td>
										<fmt:parseDate var="parsedFrgownSettlementDate" value="${result.frgSettlement.freightOwnerSettlementDate}" pattern="yyyy-MM-dd" />
										<fmt:formatDate var="freightOwnerSettlementDate" value="${parsedFrgownSettlementDate}" type="DATE" pattern="yyyy.MM.dd" />
										${freightOwnerSettlementDate}
									</td>
									<th>총 청구금액</th>
									<td class="dl-ty-1">
										<dl>
											<dt>청구금액</dt>
											<dd>
												<fmt:formatNumber
													value="${result.frgSettlement.freightOwnerSettlementPrice}" />
											</dd>
										</dl>
										<dl>
											<dt>부가세</dt>
											<dd>
												<fmt:formatNumber
													value="${result.frgSettlement.freightOwnerSettlementPrice/10}" />
											</dd>
										</dl>
									</td>
								</tr>
								<tr>
									<th>완료일시</th>
									<td>
										<fmt:parseDate var="parsedFreightOwnerSettlementDoenDate" value="${result.frgSettlement.freightOwnerSettlementDoenDate}" pattern="yyyy-MM-dd HH:mm" />
										<fmt:formatDate var="freightOwnerSettlementDoenDate" value="${parsedFreightOwnerSettlementDoenDate}" type="DATE" pattern="yyyy.MM.dd HH:mm" />
										${freightOwnerSettlementDoenDate}
									</td>
									<th>청구상태</th>
									<td><span class="color-text-primary">${result.frgSettlement.freightOwnerSettlementStateName}</span>
									</td>
								</tr>
								<tr>
									<th>청구마감월</th>
									<td>${result.frgSettlement.freightOwnerSettlementYyyyMm}</td>
									<th>입금완료일</th>
									<td>
										<fmt:parseDate var="parsedFrgownSettlementDoenDate" value="${result.frgSettlement.freightOwnerSettlementDoenDate}" pattern="yyyy-MM-dd" />
										<fmt:formatDate var="frgownSettlementDoenDate" value="${parsedFrgownSettlementDoenDate}" type="DATE" pattern="yyyy.MM.dd" />
										${frgownSettlementDoenDate}
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

				<button type="button"
					class="btn btn-dark btn-rounded waves-effect waves-dark"
					id="frgMaskingBtn" data-masking="frgown">
					<span class="text">마스킹 해제</span><span class="btn-label-right"><i
						class="fas fa-eye"></i></span>
				</button>
			</div>

			<div class="col-6">
				<div class="card-box" id="itemDetail">
					<h5 class="card-title">
						차주정보 <i class="fas fa-external-link-alt userInfoBtn"
							data-id="${result.carSettlement.carOwnerSettlementId}"
							data-own="carown"
							style="cursor: pointer;"></i>
					</h5>
					<div class="table-responsive">
						<table class="table mb-0 basic-table">
							<colgroup>
								<col style="width: 14%;">
								<col style="width: 36%;">
								<col style="width: 14%;">
								<col style="width: 36%;">
							</colgroup>
							<tbody>
								<tr>
									<th>차주명</th>
									<td>${result.carown.carOwnerName}</td>
									<th>차주사</th>
									<td>${result.carown.carOwnerCompany}</td>
								</tr>
								<tr>
									<th>차주ID</th>
									<td>${result.carown.carOwnerId}</td>
									<th>사업자등록번호</th>
									<td>${result.carown.carOwnerCorporateRegistrationNumber}</td>
								</tr>
								<tr>

									<th>전화번호</th>
									<td>${result.carown.carOwnerTelephone}</td>
									<th>이메일주소</th>
									<td>${result.carown.carOwnerEmail}</td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
				<div class="card-box">
					<h5 class="card-title">지급요약</h5>
					<div class="table-responsive">
						<table class="table mb-0 basic-table">
							<colgroup>
								<col style="width: 14%;">
								<col style="width: 36%;">
								<col style="width: 14%;">
								<col style="width: 36%;">
							</colgroup>
							<tbody>
								<tr>
									<th>지급ID</th>
									<td>${result.carSettlement.carOwnerSettlementId}</td>
									<th>건수</th>
									<td>${result.carSettlement.carOwnerSettlementCount}</td>
								</tr>
								<tr>
									<th>지급발생일</th>
									<td>
										<fmt:parseDate var="parsedCarownSettlementDateYyyyMmDd" value="${result.carSettlement.carOwnerSettlementDate}" pattern="yyyy-MM-dd" />
										<fmt:formatDate var="carOwnerSettlementDateYyyyMmDd" value="${parsedCarownSettlementDateYyyyMmDd}" type="DATE" pattern="yyyy.MM.dd" />
										${carOwnerSettlementDateYyyyMmDd}
									</td>
									<th>총 지급금액</th>
									<td><fmt:formatNumber
											value="${result.carSettlement.carOwnerSettlementPrice}" /></td>
								</tr>
								<tr>
									<th>완료일시</th>
									<td>
										<c:choose>
											<c:when test="${result.carSettlement.carOwnerSettlementDoneDate eq '' or result.carSettlement.carOwnerSettlementDoneDate eq null}">
												-
											</c:when>
											<c:otherwise>
												<fmt:parseDate var="parsedCarownSettlementDoneDate" value="${result.carSettlement.carOwnerSettlementDoneDate}" pattern="yyyy-MM-dd HH:mm" />
												<fmt:formatDate var="frgOwnSettlementDoenDate" value="${parsedCarownSettlementDoneDate}" type="DATE" pattern="yyyy.MM.dd HH:mm" />
												${frgOwnSettlementDoenDate}
											</c:otherwise>
										</c:choose>
									</td>
									<th>지급상태</th>
									<td><span class="color-text-success">${result.carSettlement.carOwnerSettlementStateName}</span>
									</td>
								</tr>
								<tr>
									<th>지급방법</th>
									<td class="label-ty-1">
										<label for="lb-001">
											<input type="radio" name="lb-pay-how" id="lb-001" checked> 익일 결제
										</label>
<!-- 										<label for="lb-002"> <input type="radio" -->
<!-- 											name="lb-pay-how" id="lb-002"> 월말 지급 -->
<!-- 										</label> -->
									</td>
									<th>결제일시</th>
									<td>
										<fmt:parseDate var="parsedCarownSettlementDate" value="${result.carSettlement.carOwnerSettlementDate}" pattern="yyyy-MM-dd HH:mm" />
										<fmt:formatDate var="carOwnerSettlementDate" value="${parsedCarownSettlementDate}" type="DATE" pattern="yyyy.MM.dd HH:mm" />
										${carOwnerSettlementDate}
									</td>
								</tr>
								<tr>
									<th>입금완료일</th>
									<td>
										<fmt:parseDate var="parsedCarownSettlementDoneDate" value="${result.carSettlement.carOwnerSettlementDoneDate}" pattern="yyyy-MM-dd" />
										<fmt:formatDate var="carownSettlementDoenDate" value="${parsedCarownSettlementDoneDate}" type="DATE" pattern="yyyy.MM.dd" />
										${carownSettlementDoenDate}
									</td>
									<th>지급마감월</th>
									<td>${result.carSettlement.carOwnerSettlementYyyymmdd}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="card-box">
					<h5 class="card-title">스마트로 지급</h5>
					<div class="table-responsive">
						<table class="table mb-0 basic-table">
							<colgroup>
								<col style="width: 20%;">
								<col style="width: 30%;">
								<col style="width: 14%;">
								<col style="width: 36%;">
							</colgroup>
							<tbody>
								<tr>
									<th>스마트로 지급금액</th>
									<td><fmt:formatNumber
											value="${result.carSettlement.carOwnerSettlementPrice}" /></td>
									<th></th>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<button type="button"
					class="btn btn-dark btn-rounded waves-effect waves-dark"
					id="carMaskingBtn" data-masking="carown">
					<span class="text">마스킹 해제</span><span class="btn-label-right"><i
						class="fas fa-eye"></i></span>
				</button>
			</div>
		</div>

		<div class="card-box mt-3">
			<h5 class="card-title">주문내역 상세</h5>
			<div class="scroll-table-wrap">
				<div class="scroll-table-box">
					<table
						class="table dt-responsive nowrap dataTable no-footer dtr-inline text-center"
						role="grid">
						<thead>
							<tr>
								<c:forEach var="orderHeader" items="${orderHeaders}"
									varStatus="idx">
									<c:choose>
										<c:when test="${'0' eq idx}">
											<th class="align-middle sorting_asc">${orderHeader}</th>
										</c:when>
										<c:otherwise>
											<th class="align-middle sorting">${orderHeader}</th>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</tr>
						</thead>
						<tbody>
							<tr role="row" class="listRow">
								<td class="link color-text-primary" style="cursor: pointer;" id="orderNum" data-orderid="${result.ownerInfo.frgownOwnerSettlementOrderId}">
									<span>${result.ownerInfo.frgownOwnerSettlementOrderNum}</span>
								</td>
								<td>
									<span class="color-status-complete">${result.ownerInfo.deliveryStatusName}</span>
								</td>
								<td>
									<fmt:parseDate var="parsedRegisterDate" value="${result.ownerInfo.registerDate}" pattern="yyyy-MM-dd HH:mm" />
									<fmt:formatDate var="registerDate" value="${parsedRegisterDate}" type="DATE" pattern="yyyy.MM.dd HH:mm" />
									<span>${registerDate}</span>
								</td>
								<td>
									<fmt:parseDate var="parsedDispatchDate" value="${result.ownerInfo.dispatchDate}" pattern="yyyy-MM-dd HH:mm" />
									<fmt:formatDate var="dispatchDate" value="${parsedDispatchDate}" type="DATE" pattern="yyyy.MM.dd HH:mm" />
									<span>${dispatchDate}</span>
								</td>
								<td>
									<fmt:parseDate var="parsedLoadingDate" value="${result.ownerInfo.loadingDate}" pattern="yyyy-MM-dd HH:mm" />
									<fmt:formatDate var="loadingDate" value="${parsedLoadingDate}" type="DATE" pattern="yyyy.MM.dd HH:mm" />
									<span>${result.ownerInfo.loadingDate}</span>
								</td>
								<td>
									<fmt:parseDate var="parsedUnloadingDate" value="${result.ownerInfo.unloadingDate}" pattern="yyyy-MM-dd HH:mm" />
									<fmt:formatDate var="unloadingDate" value="${parsedUnloadingDate}" type="DATE" pattern="yyyy.MM.dd HH:mm" />
									<span>${unloadingDate}</span>
								</td>
								<td>
									<fmt:parseDate var="parsedDeliveryCancleDate" value="${result.ownerInfo.deliveryCancleDate}" pattern="yyyy-MM-dd HH:mm" />
									<fmt:formatDate var="deliveryCancleDate" value="${parsedDeliveryCancleDate}" type="DATE" pattern="yyyy.MM.dd HH:mm" />
									<span>${deliveryCancleDate}</span>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div class="card-box mt-3">
			<h5 class="card-title">청구 상세</h5>
			<div class="scroll-table-wrap">
				<div class="scroll-table-box">
					<table
						class="table td-vam dt-responsive nowrap dataTable no-footer dtr-inline text-center"
						role="grid">
						<thead>
							<tr>
								<c:forEach var="settlementHeaders" items="${settlementHeaders}"
									varStatus="idx">
									<c:choose>
										<c:when test="${'0' eq idx}">
											<th class="align-middle sorting_asc">${settlementHeaders}</th>
										</c:when>
										<c:otherwise>
											<th class="align-middle sorting">${settlementHeaders}</th>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<fmt:formatNumber value="${result.frgSettlement.freightOwnerSettlementPrice}" />
								</td>
								<td>
									<c:choose>
										<c:when test="${result.frgSettlement.freightOwnerSettlementPenaltyPrice ne null}">
											<fmt:formatNumber value="${result.frgSettlement.freightOwnerSettlementPenaltyPrice}" />
										</c:when>
										<c:otherwise>
											0
										</c:otherwise>
									</c:choose>
								</td>
								<td><button type="button"
										class="btn btn-white waves-effect previewBtn">보기</button></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div class="card-box mt-3">
			<h5 class="card-title">지급 상세</h5>
			<div class="scroll-table-wrap">
				<div class="scroll-table-box">
					<table
						class="table th-vam td-vam dt-responsive nowrap dataTable no-footer dtr-inline text-center"
						role="grid">
						<thead>
							<tr>
								<c:forEach var="paymentHeaders" items="${paymentHeaders}"
									varStatus="idx">
									<c:choose>
										<c:when test="${'0' eq idx}">
											<c:if test="${paymentHeaders eq '지급금액'}">
												<th colspan="3">${paymentHeaders}</th>
											</c:if>
											<c:if test="${paymentHeaders ne '지급금액'}">
												<th rowspan="2">${paymentHeaders}</th>
											</c:if>
										</c:when>
										<c:otherwise>
											<c:if test="${paymentHeaders eq '지급금액'}">
												<th colspan="3">${paymentHeaders}</th>
											</c:if>
											<c:if test="${paymentHeaders ne '지급금액'}">
												<th rowspan="2">${paymentHeaders}</th>
											</c:if>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</tr>
							<tr>
								<c:forEach var="amountHeaders" items="${amountHeaders}"
									varStatus="idx">
									<c:choose>
										<c:when test="${'0' eq idx}">
											<th class="align-middle sorting_asc">${amountHeaders}</th>
										</c:when>
										<c:otherwise>
											<th class="align-middle sorting">${amountHeaders}</th>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</tr>
						</thead>
						<tbody>
							<tr>
								<c:set var="price" value="${result.carSettlement.carOwnerSettlementPrice}" />
								<td>
									<fmt:formatNumber
													value="${result.chargeInfo.standardCharge}" />
								</td>
								<td>
									<fmt:formatNumber
													value="${result.chargeInfo.additionalCharge}" />
								</td>
								<td><button type="button"
										class="btn btn-white waves-effect previewBtn">보기</button></td>
								<td>
									<fmt:formatNumber value="${price}" />
								</td>
								<td>
									<fmt:formatNumber value="${price / 10}" />
								</td>
								<td><fmt:formatNumber value="${price + (price / 10)}" /></td>
								<td><span class="color-status-ing">${result.carSettlement.carOwnerSettlementStateName}</span></td>
								<td>${result.carSettlement.carOwnerSettlementTId}</td>
								<td>
									<fmt:parseDate var="parsedCarOwnerSettlementDoneDate" value="${result.carSettlement.carOwnerSettlementDoneDate}" pattern="yyyy-MM-dd HH:mm" />
									<fmt:formatDate var="carOwnerSettlementDoneDate" value="${parsedCarOwnerSettlementDoneDate}" type="DATE" pattern="yyyy.MM.dd HH:mm" />
									${carOwnerSettlementDoneDate}
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="button-list text-center">
	<button type="button"
		class="btn btn-custom02 btn-rounded waves-effect waves-dark goListBtn"
		id="listBtn">목록</button>
</div>

<script>
	var pageTitle;
	var pageTitleName; 

	var searchedData;
	detailData.freightOwnerSettlementId = '${result.setInfo[0].freightOwnerSettlementId}';
	
	$('#orderNum').on('click touch', function () {
		var orderId = $(this).data('orderid');
		data.orderId = orderId;
		
		popupOrderDetail(orderId, "Y");
	});
	
	function popupOrderDetail(orderId, maskingYn) {
		$('#integrationOrderDetailPopup').modal('hide');
		$.ajax({
		    type : "POST",
		    url : "<c:url value='/ui/service/settlement/integration/order/detail/'/>" + orderId + "/" + maskingYn,
		    data : {},
		    cache : false,
		    async : true,
		    success : function(data, textStatus, XMLHttpRequest) {
				if (hasErrorMap(data, true)) {
					return;
				}
				
				$('#modal').html(data);
				$('#integrationOrderDetailPopup').modal('show');
		    },
		    error : function(xhr, ajaxOptions, thrownError) {
				if (hasErrorMap(xhr, false)) {
					return;
				} 
		    }
		});
	}
	
	$('.previewBtn').on('click touch', function (_el) {
		var orderId = "${result.ownerInfo.frgownOwnerSettlementOrderId}"
		var urlString = "/unload/" + orderId;
		
		$.ajax({
		    type : "GET",
		    url : "<c:url value='/ui/service/common/receipt/preview'/>" + urlString,
		    data : {},
		    cache : false,
		    async : true,
		    success : function(resultData, textStatus, XMLHttpRequest) {
		    	if(resultData.resultCode === '00000') {
					location.href = "<c:url value='/ui/service/common/receipt/download'/>" + urlString;
				} else if(resultData.resultCode === '10002') {
					alert('해당 주문건에 매핑된 전자인수증이 없습니다.');
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
	});
	
	// 마스킹 해제 
	$('#frgMaskingBtn, #carMaskingBtn').on('click touch', function () {
		var maskingFlag = $(this).data('masking');
		var maskingYn = 'Y';
		
		if (maskingFlag == 'frgown') {
			if (typeof data.object === 'string') {
				if (data.object.indexOf('%') > -1) {
					data.object = JSON.parse(decodeURIComponent(data.object));
				} else {
					data.object = JSON.parse(data.object);
				}
			}
			
			if (data.object.frgownMaskingYn == 'N') {
				data.object.frgownMaskingYn = 'Y';
				maskingYn = 'N';
			}
		}
		
		if (maskingFlag == 'carown') {
			if (typeof data.object === 'string') {
				if (data.object.indexOf('%') > -1) {
					data.object = JSON.parse(decodeURIComponent(data.object));
				} else {
					data.object = JSON.parse(data.object);
				}
			}
			
			if (data.object.carownMaskingYn == 'N') {
				data.object.carownMaskingYn = 'Y';
				maskingYn = 'N';
			}
		}
		
		if(maskingYn === 'N') {
			maskingYn = 'Y';
			data.object = encodeURIComponent(JSON.stringify(data.object));
			loadDetail('${result.frgSettlement.freightOwnerSettlementId}', data.object);
			return;
		}
	
		if (maskingYn === 'Y') {
			$.ajax({
			    type : "POST",
			    url : "<c:url value='/ui/service/common/popup/reason.unmasking'/>",
			    data : {
			    	"maskingHistoryType" : maskingFlag == 'carown' ? 'integCarListInfo' : 'integFrgListInfo'
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
	
	// 목록으로 
	$('.goListBtn').on('click touch', function () {
		pageTitle.innerHTML = "통합 주문조회";
		
		if(isEmptyObject(searchedData)) {
			searchedData = getData();
		}
		routie('list/' + encodeURIComponent(JSON.stringify(searchedData)));
	});
	
	$(document).ready(function(){
		pageTitle = $(".page-title")[0];
		pageTitleName = pageTitle.innerHTML;
		
		pageTitle.innerHTML = "통합 주문조회 상세 정보";
		
		<c:if test="${empty result.resultCode}">
			<c:set var="resultMsg" value="${fn:replace(fn:replace(result, LF, ''), CR, '')}"/>
			alert('통합 주문조회 상세 조회 중 오류가 발생하였습니다.\r\nERROR: ${resultMsg}')
		</c:if>
		<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
			alert('통합 주문조회 상세 조회 중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}')
		</c:if>
		
		// 마스킹 버튼 텍스트 
		if(data.maskingYn === 'N') {
			$('#maskingBtn span.text').text('마스킹 처리');
		} else {
			$('#maskingBtn span.text').text('마스킹 해제');
		}
		
		if (data.object.carownMaskingYn === 'N') {
			$('#carMaskingBtn span.text').text('마스킹 처리');
		} else {
			$('#carMaskingBtn span.text').text('마스킹 해제');
		}
		
		if (data.object.frgownMaskingYn === 'N') {
			$('#frgMaskingBtn span.text').text('마스킹 처리');
		} else {
			$('#frgMaskingBtn span.text').text('마스킹 해제');
		}
	});
	
	$('.userInfoBtn').on('click touch', function () {
		var ownerSettlementId = $(this).data('id');
		var own = $(this).data('own');
		var apiResult = $.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/settlement/integration/select/'/>" + ownerSettlementId + "/" + own,
			data : {},
			cache : false,
			async : true,
			success : function(result, textStatus, XMLHttpRequest) {
				if(hasErrorMap(result, true)){
					return;
				}
				
				moveDetail(result.result, own);
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if(hasErrorMap(xhr, false)){
					return;
				}
				
				alert('정보 조회중 오류가 발생하였습니다.\r\nERROR: '+xhr.responseJSON.message);
			}
		});
	});
	
	function moveDetail(_obj, own) {
		if (own == 'frgown') {
			location.href = "/admin/ui/page/owner/frgown#detail/" + _obj.freightOwnerId;
		} else {
			location.href = "/admin/ui/page/owner/carown#detail/" + _obj.carOwnerId;
		}
	}
	
</script>
