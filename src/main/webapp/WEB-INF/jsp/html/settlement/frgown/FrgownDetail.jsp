<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" 
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	pageContext.setAttribute("CR", "\r"); 
	pageContext.setAttribute("LF", "\n"); 
%>

<!-- Begin page -->
<div class="card-box" id="itemDetail">
	<h5 class="card-title">화주정보 
		<c:if test="${!empty result.resultId and null ne result.resultId}">
			<i class="fas fa-external-link-alt userInfoBtn" data-id="${result.resultId}"></i>
		</c:if>
	</h5>
	<div class="table-responsive">
		<table class="table mb-0 basic-table">
			<colgroup>
				<col style="width: 10%;">
				<col style="width: 40%;">
				<col style="width: 10%;">
				<col style="width: 40%;">
			</colgroup>
			<tbody>
<!-- 				<tr> -->
<!-- 				var freightOwnerSettlementPrice = $(this).parents('tr').data('freight-owner-settlement-price'); -->
				<tr role="row" data-id="1" data-freight-owner-settlement-price="${result.setInfo[0].freightOwnerSettlementPrice}">
					<th scope="row">계약구분</th>
					<td>${result.frgownInfo[0].freightOwnerTypeName}</td>
					<th>청구</th>
					<td><%-- ${result.frgownInfo[0].freightOwnerMonthSettlementNum} --%>
						<c:choose>
							<c:when test="${'0' eq result.frgownInfo[0].freightOwnerMonthSettlementNum}">
								0회
							</c:when>
							<c:when test="${'1' eq result.frgownInfo[0].freightOwnerMonthSettlementNum}">
								1회 (매월 1일)
							</c:when>
							<c:when test="${'2' eq result.frgownInfo[0].freightOwnerMonthSettlementNum}">
								2회 (매월 1일, 15일)
							</c:when>
							<c:otherwise>
								${result.frgownInfo[0].freightOwnerMonthSettlementNum}
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th scope="row">사업자구분</th>
					<td>${result.frgownInfo[0].freightOwnerMemberTypeName}</td>
					<th>화주사</th>
					<td>${result.frgownInfo[0].freightOwnerCompany}</td>
				</tr>
				<tr>
					<th scope="row">사업자유형</th>
					<td>${result.frgownInfo[0].freightOwnerBusinessTypeName}</td>
					<th>사업자등록번호</th>
					<td>${result.frgownInfo[0].freightOwnerCorporateRegisterNumber}</td>
				</tr>
				<tr>
					<th scope="row">화주명</th>
					<td>${result.frgownInfo[0].freightOwnerName}</td>
					<th>전화번호</th>
					<td>${result.frgownInfo[0].freightOwnerPhone}</td>
				</tr>
				<tr>
					<th scope="row">화주 ID</th>
					<td>${result.frgownInfo[0].freightOwnerId}</td>
					<th>이메일주소</th>
					<td>${result.frgownInfo[0].freightOwnerEmail}</td>
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
				<col style="width: 10%;">
				<col style="width: 40%;">
				<col style="width: 10%;">
				<col style="width: 40%;">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">청구ID</th>
					<td>
						${result.setInfo[0].freightOwnerSettlementId}
					</td>
					<th>건수</th>
					<td>
						<fmt:formatNumber value="${result.setInfo[0].freightOwnerSettlementCount}"/>
					</td>
				</tr>
				<tr>
					<th scope="row">청구발생일</th>
					<td>${result.setInfo[0].freightOwnerSettlementDateString}</td>
					<th>총 청구금액</th>
					<td><fmt:formatNumber value="${result.setInfo[0].freightOwnerSettlementPrice}"/></td>
				</tr>
				<tr>
					<th scope="row">완료일시</th>
					<td>${result.setInfo[0].freightOwnerSettlementDoneDateString}</td>
					<th scope="row">청구상태</th>
					<td>
						<c:choose>
							<c:when test="${'0' eq result.frgownInfo[0].freightOwnerMonthSettlementNum}">
								<c:choose>
									<c:when test="${'settlementFailed' eq result.setInfo[0].freightOwnerSettlementState}">
										<span class="color-text-danger">${result.setInfo[0].freightOwnerSettlementStateName}</span>
									</c:when>
									
									<c:when test="${'settlementStandby' eq result.setInfo[0].freightOwnerSettlementState}">
										<span class="color-text-primary">${result.setInfo[0].freightOwnerSettlementStateName}</span>
										<c:forEach items="${autUriList}" var="autUriList">
											<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'U') gt -1}">
												<button type="button"
													class="btn btn-custom01 btn-rounded waves-effect waves-dark ml-2"
													id="depositPopupBtn">입금확인</button>
											</c:if>
										</c:forEach>
									</c:when>
									
									<c:when test="${'confirmRequired' eq result.setInfo[0].freightOwnerSettlementState}">
										<span class="color-text-success">${result.setInfo[0].freightOwnerSettlementStateName}</span>
										<c:forEach items="${autUriList}" var="autUriList">
											<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'U') gt -1}">
												<button type="button"
													class="btn btn-custom01 btn-rounded waves-effect waves-dark ml-2"
													id="depositPopupBtn">입금확인</button>
											</c:if>
										</c:forEach>
									</c:when>
									
									<c:otherwise>
										${result.setInfo[0].freightOwnerSettlementStateName}
									</c:otherwise>
								</c:choose>
								
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${'settlementFailed' eq result.setInfo[0].freightOwnerSettlementState}">
										<span class="color-text-danger">${result.setInfo[0].freightOwnerSettlementStateName}</span>
									</c:when>
									<c:when test="${'settlementStandby' eq result.setInfo[0].freightOwnerSettlementState}">
										<span class="color-text-primary">${result.setInfo[0].freightOwnerSettlementStateName}</span>
									</c:when>
									<c:when test="${'confirmRequired' eq result.setInfo[0].freightOwnerSettlementState}">
										<span class="color-text-success">${result.setInfo[0].freightOwnerSettlementStateName}</span>
										<c:forEach items="${autUriList}" var="autUriList">
											<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'U') gt -1}">
												<button type="button"
													class="btn btn-custom01 btn-rounded waves-effect waves-dark ml-2"
													id="depositPopupBtn">입금확인</button>
											</c:if>
										</c:forEach>
									</c:when>
									<c:otherwise>
										${result.setInfo[0].freightOwnerSettlementStateName}
									</c:otherwise>
								</c:choose>
								
							</c:otherwise>
						</c:choose>
						<!-- <button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark ml-2" id="depositBtn">입금확인</button> -->
					</td>
				</tr>
				<tr>
					<th scope="row">청구마감월</th>
					<td>${result.setInfo[0].freightOwnerSettlementYyyymm}</td>
					<th scope="row">입금완료일</th>
<%-- 					<td>${result.setInfo[0].freightOwnerSettlementDoneDate2String}</td> --%>
					<td>${result.setInfo[0].freightOwnerSettlementDoneDate2}</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<button type="button" class="btn btn-dark btn-rounded waves-effect waves-dark" id="maskingBtn">
	<span class="text">마스킹 해제</span>
	<span class="btn-label-right"><i class="fas fa-eye"></i></span>
</button>
<div class="card-box mt-3">
	<h5 class="card-title">정산상세</h5>
	<div class="row mb-2">
		<div class="col-12 text-right button-list">
			<button type="button" class="btn btn-custom03 btn-rounded waves-effect waves-dark excelDetailDownloadBtn">
				엑셀다운로드
	        </button>
        </div>
	</div>
	<div class="scroll-table-box detailList">
	
		<table class="table dt-responsive nowrap dataTable no-footer dtr-inline text-center" role="grid">
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
				<c:when test="${empty result.setList}">
					<tbody>
						<tr role="row" class="listRow">
							<td colspan="${fn:length(headers)}">
								조회 결과가 없습니다.
							</td>
						</tr>
					</tbody>
				</c:when>
				<c:otherwise>
					<tbody>
					<c:forEach var="list" items="${result.setList}">
						<tr>
							<td class="align-middle text-left">
								<%-- TODO 주문번호 --%>
								${list.freightOwnerSettlementOrderNum}
							</td>
							<td class="align-middle">
								<c:choose>
									<c:when test="${'unloadingCompleted' eq list.deliveryStatus}">
										<span class="color-text-primary">${list.deliveryStatusName}</span>
									</c:when>
									<c:otherwise>
										<span class="color-text-danger">${list.deliveryStatusName}</span>
									</c:otherwise>
								</c:choose>
							</td>
							<td class="align-middle">${list.registerDateString}</td>
							<td class="align-middle">${list.dispatchDateString}</td>
							<td class="align-middle">${list.loadingDateString}</td>
							<td class="align-middle">${list.unloadingDateString}</td>
							<td class="align-middle">
								<c:choose>
									<c:when test="${null eq list.deliveryCancleDate and '' ne deliveryCancleDate}">
										${list.deliveryCancleDateString}
									</c:when>
									<c:otherwise>
										-
									</c:otherwise>
								</c:choose>
							</td>
							<td class="align-middle text-right">
								<c:choose>
									<c:when test="${list.deliveryCharge lt 0}">
										<span class="color-text-danger"><fmt:formatNumber value="${list.deliveryCharge}"/></span>
									</c:when>
									<c:otherwise>
										<span class=""><fmt:formatNumber value="${list.deliveryCharge}"/></span>
									</c:otherwise>
								</c:choose>
							</td>
							<td class="align-middle text-right">
								<c:choose>
									<c:when test="${list.freightOwnerPenaltyPolicyPenalty lt 0}">
										<span class="color-text-danger"><fmt:formatNumber value="${list.freightOwnerPenaltyPolicyPenalty}"/></span>
									</c:when>
									<c:otherwise>
										<span class=""><fmt:formatNumber value="${list.freightOwnerPenaltyPolicyPenalty}"/></span>
									</c:otherwise>
								</c:choose>
							</td>
							<%-- <td class="align-middle">
								<c:choose>
									<c:when test="${list.taxAmt lt 0}">
										<span class="color-text-danger"><fmt:formatNumber value="${list.taxAmt}"/></span>
									</c:when>
									<c:otherwise>
										<span class=""><fmt:formatNumber value="${list.taxAmt}"/></span>
									</c:otherwise>
								</c:choose>
							</td> --%>
							<td class="align-middle">
<%-- 								<button type="button" class="btn btn-white waves-effect receiptDownloadBtn" data-type="load" data-id="${list.freightOwnerSettlementOrderId}">상차지</button> --%>
								<button type="button" class="btn btn-white waves-effect receiptDownloadBtn" data-type="unload" data-id="${list.freightOwnerSettlementOrderId}">보기</button>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</c:otherwise>
			</c:choose>
		</table>
		${result.pagination}
	</div>
</div>
<div class="button-list text-center">
	<button type="button" class="btn btn-custom02 btn-rounded waves-effect waves-dark goListBtn" id="listBtn">목록</button>
</div>

<script>

	var searchedData;
	detailData.freightOwnerSettlementId = '${result.setInfo[0].freightOwnerSettlementId}';

	// 마스킹 해제 
	$('#maskingBtn').on('click touch', function () {
		
		if(data.maskingYn === 'N') {
			data.maskingYn = 'Y';
			loadDetail('${result.setInfo[0].freightOwnerSettlementId}', data.detailPageIndex);
		} else {
			$.ajax({
			    type : "POST",
			    url : "<c:url value='/ui/service/common/popup/reason.unmasking'/>",
			    data : {
			    	"maskingHistoryType" : "frgownSettlementInfo"
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
			
			// data.maskingYn = 'N';
		}
		
		// loadDetail('${result.setInfo[0].freightOwnerSettlementId}', 1);
	});
	
	// 화주정보 이동 
	$('.userInfoBtn').css('cursor', 'pointer');
	$('.userInfoBtn').on('click touch', function() {
		<c:if test="${null ne result.resultId and '' ne result.resultId}">
			location.replace('<c:url value="/ui/page/owner/frgown#detail/${result.resultId}"/>');		
		</c:if>
	})
	
// 	// 입금확인
// 	$('#depositBtn').on('click touch', function() {
// 		<c:if test="${null ne result.setInfo[0].freightOwnerSettlementId and '' ne result.setInfo[0].freightOwnerSettlementId}">
// 			if(confirm('정산내역에 따른 화주의 입금이 완료되었습니까? (금액 <fmt:formatNumber value="${result.setInfo[0].freightOwnerSettlementPrice}"/>원)')) {
// 				$.ajax({
// 					type : "POST",
// 					url : "<c:url value='/ui/service/settlement/frg/update/payment/${result.setInfo[0].freightOwnerSettlementId}'/>",
// 					data : {
// 						'pageIndex' : data.detailPageIndex
// 					},
// 					cache : false,
// 					async : true,
// 					success : function(data, textStatus, XMLHttpRequest) {
// 						if(data.resultCode === '00000') {
// 							location.reload();
// 						} else {
// 							alert('입금완료처리 도중 오류가 발생하였습니다.\r\nERROR: ' + JSON.stringify(data));
// 						}
// 						if (hasErrorMap(data, true)) {
// 							return;
// 						}
// 					},
// 					error : function(xhr, ajaxOptions, thrownError) {
// 						if (hasErrorMap(xhr, false)) {
// 							return;
// 						}
// 					}
// 				});
// 			}
// 		</c:if>
// 	})
	
	// 입금확인
	$('#depositPopupBtn').on('click touch', function() {
		var freightOwnerSettlementPrice = $(this).parents('tr').data('freight-owner-settlement-price');
		<c:if test="${null ne result.setInfo[0].freightOwnerSettlementId and '' ne result.setInfo[0].freightOwnerSettlementId}">
				$.ajax({
					type : "POST",
					url : "<c:url value='/ui/service/settlement/frg/popup/update/payment/${result.setInfo[0].freightOwnerSettlementId}'/>",
					data : {
						'pageIndex' : data.detailPageIndex,
						'freightOwnerSettlementPrice': ${result.setInfo[0].freightOwnerSettlementPrice},
						'freightOwnerSettlementId': '${result.setInfo[0].freightOwnerSettlementId}'
					},
					cache : false,
					async : true,
					success : function(data, textStatus, XMLHttpRequest) {
						if (hasErrorMap(data, true)) return;
						
						$('#modal').html(data);
						$('#popup').modal('show');
						
					},
					error : function(xhr, ajaxOptions, thrownError) {
						if (hasErrorMap(xhr, false)) {
							alert('입금완료처리 도중 오류가 발생하였습니다.\r\nERROR: ' + JSON.stringify(data));
							return;
						}
					}
				});
		</c:if>
	})
	
	// 화주 정산상세 목록 엑셀 다운로드 
	<c:if test="${null ne result.setInfo[0].freightOwnerSettlementId and '' ne result.setInfo[0].freightOwnerSettlementId}">
		$('.excelDetailDownloadBtn').on('click touch', function () {
			if(confirm('상세내역을 모두 다운로드하시겠습니까?')) {
				location.href = "<c:url value='/ui/service/settlement/frg/excel/downloadDetail/${result.setInfo[0].freightOwnerSettlementId}'/>";
			};
		})
	</c:if>

	// 화주 정산상세 인수증 다운로드 
	<c:if test="${null ne result.setInfo[0].freightOwnerSettlementId and '' ne result.setInfo[0].freightOwnerSettlementId}">
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
	</c:if>
	
	// 목록으로 
	$('.goListBtn').on('click touch', function () {
		// 마스킹 초기화
		if (data.maskingYn == "N") {
			data.maskingYn = "Y";
		}
		
		// searchList();
		if(isEmptyObject(searchedData)) {
			searchedData = getData();
		}
		routie('list/' + encodeURIComponent(JSON.stringify(searchedData)));
	})
	
	// 정산 상세 내 페이징 
	<c:if test="${null ne result.setInfo[0].freightOwnerSettlementId and '' ne result.setInfo[0].freightOwnerSettlementId}">
		$('.detailList ul.pagination li').on('click touch', function() {
			data.detailPageIndex = $(this).data('page-index');
			routie("detail/${result.setInfo[0].freightOwnerSettlementId}/" + $(this).data('page-index'));
		})
	</c:if>

	$(document).ready(function(){
		// loadDetailList(data.detailPageIndex);
		<c:if test="${empty result.resultCode}">
			<c:set var="resultMsg" value="${fn:replace(fn:replace(result, LF, ''), CR, '')}"/>
			alert('화주정산 상세 조회 중 오류가 발생하였습니다.\r\nERROR: ${resultMsg}')
		</c:if>
		<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
			alert('화주정산 상세 조회 중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}')
		</c:if>
		
		// 마스킹 버튼 텍스트 
		if(data.maskingYn === 'N') {
			$('#maskingBtn span.text').text('마스킹 처리');
		} else {
			$('#maskingBtn span.text').text('마스킹 해제');
		}
	});
	
</script>
