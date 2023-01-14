<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" 
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Begin page -->
<div class="card-box" id="itemDetail">
	<h5 class="card-title">차주정보 
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
				<tr>
					<th scope="row">차주명</th>
					<td>${result.carownInfo[0].carOwnerName}</td>
					<th>차주사</th>
					<td>${result.carownInfo[0].carOwnerCompany}</td>
				</tr>
				<tr>
					<th scope="row">차주ID</th>
					<td>${result.carownInfo[0].carOwnerId}</td>
					<th>사업자등록번호</th>
					<td>${result.carownInfo[0].carOwnerCorporateRegisterNumber}</td>
				</tr>
				<tr>
					<%-- <th scope="row">거래은행</th>
					<td>${result.carownInfo[0].carOwnerBank}</td> --%>
					<th>전화번호</th>
					<td>${result.carownInfo[0].carOwnerPhone}</td>
					<th>이메일주소</th>
					<td>${result.carownInfo[0].carOwnerEmail}</td>
				</tr>
				<%-- <tr>
					<th scope="row">계좌번호</th>
					<td>${result.carownInfo[0].carOwnerAccount}</td>
					<th>이메일주소</th>
					<td>${result.carownInfo[0].carOwnerEmail}</td>
				</tr> --%>
			</tbody>
		</table>
	</div>
</div>
<div class="card-box">
	<h5 class="card-title">지급요약</h5>
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
					<th scope="row">지급ID</th>
					<td>
						${result.setInfo[0].carOwnerSettlementId}
					</td>
					<th>건수</th>
					<td>
						<fmt:formatNumber value="${result.setInfo[0].carOwnerSettlementCount}"/>
					</td>
				</tr>
				<tr>
					<th scope="row">지급발생일</th>
					<td>${result.setInfo[0].carOwnerSettlementDateString}</td>
					<th>총 공급금액</th>
					<td><fmt:formatNumber value="${result.setInfo[0].carOwnerSettlementPrice}"/></td>
				</tr>
				<tr>
					<th scope="row">완료일시</th>
					<td>${result.setInfo[0].carOwnerSettlementDoneDateString}</td>
					<th>지급 완료 금액</th>
					<td><fmt:formatNumber value="${result.setInfo[0].carOwnerSettlementCompletedPrice}"/></td>
				</tr>
				<tr>
					<th scope="row">지급방법</th>
					<td>
						<c:choose>
							<c:when test="${'nextDayPayment' eq result.setInfo[0].carOwnerSettlementPaymentMethod}">
								<span id="carOwnerSettlementPaymentMethod">익일 결제</span>
							</c:when>
							<c:when test="${'monthEndPayment' eq result.setInfo[0].carOwnerSettlementPaymentMethod}">
								<span id="carOwnerSettlementPaymentMethod">월말 지급</span>
							</c:when>
						</c:choose>
<!-- G.Y.D						<button type="button" id="payMethodBtn" class="btn btn-white waves-effect">변경</button> -->
					</td>
					<th>지급상태</th>
					<td>
						<c:choose>   
							<c:when test="${'settlementFailed' eq result.setInfo[0].carOwnerSettlementState}">
								<span class="color-text-danger">${result.setInfo[0].carOwnerSettlementStateName}</span>
							</c:when>
							<c:when test="${'settlementStandby' eq result.setInfo[0].carOwnerSettlementState}">
								<span class="color-text-success">${result.setInfo[0].carOwnerSettlementStateName}</span>
							</c:when>
							<c:when test="${'settlementRequested' eq result.setInfo[0].carOwnerSettlementState}">
								<span class="color-text-primary">${result.setInfo[0].carOwnerSettlementStateName}</span>
							</c:when>
							<c:otherwise>
								${result.setInfo[0].carOwnerSettlementStateName}
							</c:otherwise>
						</c:choose>
						<!-- {확인필요} -->
					</td>
				</tr>
				<tr>
					<th scope="row">결재일시</th>
					<td>${result.setInfo[0].carOwnerSettlementDateString}</td>
					<th>입금완료일</th>
					<td>${result.setInfo[0].carOwnerSettlementDoneDateString}</td>
				</tr>
				<tr>
					<th scope="row">지급마감월</th>
					<td>${result.setInfo[0].carOwnerSettlementYyyymmdd}</td>
					<th></th>
					<td></td>
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
				<col style="width: 10%;">
				<col style="width: 40%;">
				<col style="width: 10%;">
				<col style="width: 40%;">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">스마트로 지급금액</th>
					<td><fmt:formatNumber value="${result.setInfo[0].carOwnerSettlementPrice}"/></td>
					<th></th>
					<td></td>
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
		<table class="table dt-responsive nowrap dataTable no-footer dtr-inline text-center"
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
						<c:forEach items="${result.setList}" var="list">
							<tr>
								<td class="text-left align-middle">${list.carOwnerSettlementOrderNum}</td>
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
										<c:when test="${null ne list.deliveryCancleDateString and '' ne list.deliveryCancleDateString}">
											${list.deliveryCancleDateString}
										</c:when>
										<c:otherwise>
											-
										</c:otherwise>
									</c:choose>
								</td>
								<td class="text-right align-middle"><%-- <fmt:formatNumber value="${list.carOwnerSettlementRegularCharge}"/> --%>
									<%-- 배송비 --%>
									<%-- TODO --%>
									<c:if test="${'Y' eq list.carOwnerSettlementRegularChargeCheck}">
										<del>
									</c:if>
									<c:choose>
										<c:when test="${list.carOwnerSettlementRegularCharge lt 0}">
											<span class="color-text-danger"><fmt:formatNumber value="${list.carOwnerSettlementRegularCharge}"/></span>
										</c:when>
										<c:otherwise>
											<span class=""><fmt:formatNumber value="${list.carOwnerSettlementRegularCharge}"/></span>
										</c:otherwise>
									</c:choose>
									<%-- TODO --%>
									<c:if test="${'Y' eq list.carOwnerSettlementRegularChargeCheck}">
										</del>
									</c:if>
								</td>
								<td class="text-right align-middle">
									<%-- 이동비 --%>
									<%-- TODO --%>
									<c:if test="${'Y' eq list.carOwnerSettlementMovingChargeCheck}">
										<del>
									</c:if>
									<c:choose>
										<c:when test="${list.carOwnerSettlementMovingCharge lt 0}">
											<span class="color-text-danger"><fmt:formatNumber value="${list.carOwnerSettlementMovingCharge}"/></span>
										</c:when>
										<c:otherwise>
											<span class=""><fmt:formatNumber value="${list.carOwnerSettlementMovingCharge}"/></span>
										</c:otherwise>
									</c:choose>
									<%-- TODO --%>
									<c:if test="${'Y' eq list.carOwnerSettlementMovingChargeCheck}">
										</del>
									</c:if>
								</td>
								<td class="text-right align-middle">
									<%-- 상차지 대기비 --%>
									<%-- TODO --%>
									<c:if test="${'Y' eq list.carOwnerSettlementLoadingWatingChargeCheck}">
										<del>
									</c:if>
									<c:choose>
										<c:when test="${list.carOwnerSettlementLoadingWatingCharge lt 0}">
											<span class="color-text-danger"><fmt:formatNumber value="${list.carOwnerSettlementLoadingWatingCharge}"/></span>
										</c:when>
										<c:otherwise>
											<span class=""><fmt:formatNumber value="${list.carOwnerSettlementLoadingWatingCharge}"/></span>
										</c:otherwise>
									</c:choose>
									<%-- TODO --%>
									<c:if test="${'Y' eq list.carOwnerSettlementLoadingWatingChargeCheck}">
										</del>
									</c:if>
								</td>
								<td class="text-right align-middle">
									<%-- 하차지 대기비 --%>
									<%-- TODO --%>
									<c:if test="${'Y' eq list.carOwnerSettlementUnloadingWatingChargeCheck}">
										<del>
									</c:if>
									<c:choose>
										<c:when test="${list.carOwnerSettlementUnloadingWatingCharge lt 0}">
											<span class="color-text-danger"><fmt:formatNumber value="${list.carOwnerSettlementUnloadingWatingCharge}"/></span>
										</c:when>
										<c:otherwise>
											<span class=""><fmt:formatNumber value="${list.carOwnerSettlementUnloadingWatingCharge}"/></span>
										</c:otherwise>
									</c:choose>
									<%-- TODO --%>
									<c:if test="${'Y' eq list.carOwnerSettlementUnloadingWatingChargeCheck}">
										</del>
									</c:if>
								</td>
								<td class="align-middle">
								<%-- 상/하차지 인수증을 하차지 인수증만 다운으로 명칭은 보기로 변경 									
								<button type="button" class="btn btn-white waves-effect receiptDownloadBtn" data-type="load" data-id="${list.carOwnerSettlementOrderId}">상차지</button> 
								--%>
									<button type="button" class="btn btn-white waves-effect receiptDownloadBtn" data-type="unload" data-id="${list.carOwnerSettlementOrderId}">보기</button>
								</td>
								<%-- <td><fmt:formatNumber value="${list.carOwnerSettlementPrice}"/></td> --%>
								<td class="text-right align-middle"><%-- <fmt:formatNumber value="${list.carOwnerSettlementTotalCharge}"/> --%>
									<c:choose>
										<c:when test="${list.carOwnerSettlementTotalCharge lt 0}">
											<span class="color-text-danger"><fmt:formatNumber value="${list.carOwnerSettlementTotalCharge}"/></span>
										</c:when>
										<c:otherwise>
											<span class=""><fmt:formatNumber value="${list.carOwnerSettlementTotalCharge}"/></span>
										</c:otherwise>
									</c:choose>
								</td>
								<td class="text-right align-middle">
									<c:choose>
										<c:when test="${list.carOwnerSettlementCompletedPrice lt 0}">
											<span class="color-text-danger"><fmt:formatNumber value="${list.carOwnerSettlementCompletedPrice}"/></span>
										</c:when>
										<c:otherwise>
											<span class=""><fmt:formatNumber value="${list.carOwnerSettlementCompletedPrice}"/></span>
										</c:otherwise>
									</c:choose>
								</td>
								<td class="align-middle">
									<c:choose>
										<c:when test="${'settlementStandby' eq list.carOwnerSettlementState}">
											<%-- 지급대기 --%>
											${list.carOwnerSettlementStateName}
											<c:forEach items="${autUriList}" var="autUriList">
												<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'U') gt -1}">
													<button type="button" class="btn btn-white waves-effect ml-1 statusBtn" data-type="cancel" 
														data-date="${result.setInfo[0].carOwnerSettlementDate}"
														<%-- data-date="${list.registerDate}" --%>
														data-owner-id="${result.resultId}"
														data-settlement-id="${result.setInfo[0].carOwnerSettlementId}"
														data-order-id="${list.carOwnerSettlementOrderId}"
														data-order-num="${list.carOwnerSettlementOrderNum}"
														data-settlement-state="${list.carOwnerSettlementState}"
														data-root-settlement-id="${result.setInfo[0].carOwnerSettlementId}"
														>취소</button>
												</c:if>
											</c:forEach>
										</c:when>
										<c:when test="${'settlementRequested' eq list.carOwnerSettlementState}">
											<%-- 지급중 --%>
											${list.carOwnerSettlementStateName}
											<c:set var="flagValue" value="${list.carOwnerSettlementRegularChargeCheck}${list.carOwnerSettlementMovingChargeCheck}${list.carOwnerSettlementLoadingWatingChargeCheck}${list.carOwnerSettlementUnloadingWatingChargeCheck}"/>
											<%-- ${flagValue} --%>
											<c:choose>
												<c:when test="${fn:contains(flagValue, 'Y')}">
													<button type="button" class="btn btn-dark waves-effect ml-1 statusBtn" data-type="detail" 
														data-date="${result.setInfo[0].carOwnerSettlementDate}"
														data-owner-id="${result.resultId}"
														data-settlement-id="${result.setInfo[0].carOwnerSettlementId}"
														data-order-id="${list.carOwnerSettlementOrderId}"
														data-order-num="${list.carOwnerSettlementOrderNum}"
														data-settlement-state="${list.carOwnerSettlementState}"
														data-root-settlement-id="${result.setInfo[0].carOwnerSettlementId}"
														>상세</button>
												</c:when>
												<c:otherwise>
													<c:forEach items="${autUriList}" var="autUriList">
														<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'U') gt -1}">
															<button type="button" class="btn btn-white waves-effect ml-1 statusBtn" data-type="cancel" 
																data-date="${result.setInfo[0].carOwnerSettlementDate}"
																data-owner-id="${result.resultId}"
																data-settlement-id="${result.setInfo[0].carOwnerSettlementId}"
																data-order-id="${list.carOwnerSettlementOrderId}"
																data-order-num="${list.carOwnerSettlementOrderNum}"
																data-settlement-state="${list.carOwnerSettlementState}"
																data-root-settlement-id="${result.setInfo[0].carOwnerSettlementId}"
																>취소요청</button>
														</c:if>
													</c:forEach>
												</c:otherwise>
											</c:choose>
											<%-- ${list.carOwnerSettlementStateName}
											<button type="button" class="btn btn-dark waves-effect ml-1 needsTimeCheck d-none statusBtn" data-type="detail" 
												data-date="${result.setInfo[0].carOwnerSettlementDate}"
												data-date="${list.registerDate}"
												data-owner-id="${result.resultId}"
												data-settlement-id="${result.setInfo[0].carOwnerSettlementId}"
												data-order-id="${list.carOwnerSettlementOrderId}"
												data-order-num="${list.carOwnerSettlementOrderNum}"
												data-settlement-state="${list.carOwnerSettlementState}"
												data-root-settlement-id="${result.setInfo[0].carOwnerSettlementId}"
												>상세</button>
											<c:forEach items="${autUriList}" var="autUriList">
												<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'U') gt -1}">
													<button type="button" class="btn btn-white waves-effect ml-1 needsTimeCheck d-none statusBtn" data-type="cancel" 
														data-date="${result.setInfo[0].carOwnerSettlementDate}"
														data-date="${list.registerDate}"
														data-owner-id="${result.resultId}"
														data-settlement-id="${result.setInfo[0].carOwnerSettlementId}"
														data-order-id="${list.carOwnerSettlementOrderId}"
														data-order-num="${list.carOwnerSettlementOrderNum}"
														data-settlement-state="${list.carOwnerSettlementState}"
														data-root-settlement-id="${result.setInfo[0].carOwnerSettlementId}"
														>취소</button>
												</c:if>
											</c:forEach> --%>
										</c:when>
										<c:when test="${'sendFailed' eq list.carOwnerSettlementState}">
											<%--전송실패 시 취소기능만 가능 --%>
											<span class="custom-text-danger">${list.carOwnerSettlementStateName}</span>
											 <button type="button" class="btn btn-dark waves-effect ml-1 needsTimeCheck d-none statusBtn" data-type="detail" 
												data-date="${result.setInfo[0].carOwnerSettlementDate}"
												data-owner-id="${result.resultId}"
												data-settlement-id="${result.setInfo[0].carOwnerSettlementId}"
												data-order-id="${list.carOwnerSettlementOrderId}"
												data-order-num="${list.carOwnerSettlementOrderNum}"
												data-settlement-state="${list.carOwnerSettlementState}"
												data-root-settlement-id="${result.setInfo[0].carOwnerSettlementId}"
												>상세</button>
                                        <%-- (전송실패 시, 배치처리로 진행하여 취소기능은 숨김처리 - G.Y.D 2022.12.27)										
                                            <c:forEach items="${autUriList}" var="autUriList">
												<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'U') gt -1}">
													<button type="button" class="btn btn-white waves-effect ml-1 needsTimeCheck d-none statusBtn" data-type="cancel" 
														data-date="${result.setInfo[0].carOwnerSettlementDate}"
														data-date="${list.registerDate}"
														data-owner-id="${result.resultId}"
														data-settlement-id="${result.setInfo[0].carOwnerSettlementId}"
														data-order-id="${list.carOwnerSettlementOrderId}"
														data-order-num="${list.carOwnerSettlementOrderNum}"
														data-settlement-state="${list.carOwnerSettlementState}"
														data-root-settlement-id="${result.setInfo[0].carOwnerSettlementId}"
														>취소</button>
												</c:if>
											</c:forEach> --%>
										</c:when>
										<c:when test="${'settlementCompleted' eq list.carOwnerSettlementState}">
											<%-- 지급완료 --%>
											${list.carOwnerSettlementStateName}
											<button type="button" class="btn btn-dark waves-effect ml-1 statusBtn" data-type="detail" 
												data-date="${result.setInfo[0].carOwnerSettlementDate}"
												<%-- data-date="${list.registerDate}" --%>
												data-owner-id="${result.resultId}"
												data-settlement-id="${result.setInfo[0].carOwnerSettlementId}"
												data-order-id="${list.carOwnerSettlementOrderId}"
												data-order-num="${list.carOwnerSettlementOrderNum}"
												data-settlement-state="${list.carOwnerSettlementState}"
												data-root-settlement-id="${result.setInfo[0].carOwnerSettlementId}"
												>상세</button>
										</c:when>
										<c:otherwise>
											${list.carOwnerSettlementStateName}
											<button type="button" class="btn btn-dark waves-effect ml-1 statusBtn" data-type="detail" 
												data-date="${result.setInfo[0].carOwnerSettlementDate}"
												<%-- data-date="${list.registerDate}" --%>
												data-owner-id="${result.resultId}"
												data-settlement-id="${result.setInfo[0].carOwnerSettlementId}"
												data-order-id="${list.carOwnerSettlementOrderId}"
												data-order-num="${list.carOwnerSettlementOrderNum}"
												data-settlement-state="${list.carOwnerSettlementState}"
												data-root-settlement-id="${result.setInfo[0].carOwnerSettlementId}"
												>상세</button>
										</c:otherwise>
									</c:choose>
								</td>
								<td class="align-middle">
									${list.carOwnerSettlementResendDateString}
								</td>
								<td class="align-middle">
									${list.carOwnerSettlementDoneDateString}
								</td>
								<td class="align-middle">
									${list.carOwnerSettlementTId}
								</td>
								<td class="align-middle">
									<c:choose>
										<c:when test="${!empty list.carOwnerSettlementTId and null ne list.carOwnerSettlementTId}">
											${list.carOwnerSettlementDoneDateString}
										</c:when>
										<c:otherwise>
											-
										</c:otherwise>
									</c:choose>								
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		${result.pagination}
	</div>
</div>

<div class="button-list text-center">
	<button type="button" class="btn btn-custom02 btn-rounded waves-effect waves-dark goListBtn" id="listBtn">목록</button>
</div>

<script>
	
	var searchedData;
	
	// console.log("== orgPath ==");
	detailData.carOwnerSettlementId = '${result.setInfo[0].carOwnerSettlementId}';
	
	$('#payMethodBtn').on('click touch', function () {
		$.ajax({
		    type : "POST",
		    url : "<c:url value='/ui/service/settlement/car/payment/${result.setInfo[0].carOwnerSettlementId}/${result.setInfo[0].carOwnerSettlementPaymentMethod}'/>",
		    data : {},
		    cache : false,
		    async : true,
		    success : function(data, textStatus, XMLHttpRequest) {
				if (hasErrorMap(data, true)) {
					return;
				}
				
				$('#modal').html(data);
				$('#carownPayMethodPopup').modal('show');
		    },
		    error : function(xhr, ajaxOptions, thrownError) {
				if (hasErrorMap(xhr, false)) {
					return;
				} 
		    }
		});
	});
	
	$('#maskingBtn').on('click touch', function () {

		if(data.maskingYn === 'N') {
			data.maskingYn = 'Y';
			loadDetail('${result.setInfo[0].carOwnerSettlementId}', data.detailPageIndex);
		} else {
			$.ajax({
			    type : "POST",
			    url : "<c:url value='/ui/service/common/popup/reason.unmasking'/>",
			    data : {
			    	"maskingHistoryType" : "carownSettlementInfo"
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
	
	// 차주정보 이동 
	$('.userInfoBtn').css('cursor', 'pointer');
	$('.userInfoBtn').on('click touch', function() {
		<c:if test="${null ne result.resultId and '' ne result.resultId}">
			location.replace('<c:url value="/ui/page/owner/carown#detail/${result.resultId}"/>');
		</c:if>
	})

	// 차주 정산상세 목록 엑셀 다운로드 
	<c:if test="${null ne result.setInfo[0].carOwnerSettlementId and '' ne result.setInfo[0].carOwnerSettlementId}">
		$('.excelDetailDownloadBtn').on('click touch', function () {
			if(confirm('상세내역을 모두 다운로드하시겠습니까?')) {
				location.href = "<c:url value='/ui/service/settlement/car/excel/downloadDetail/${result.setInfo[0].carOwnerSettlementId}'/>"
			};
		})
	</c:if>

	// 차주 정산상세 인수증 다운로드 
	<c:if test="${null ne result.setInfo[0].carOwnerSettlementId and '' ne result.setInfo[0].carOwnerSettlementId}">
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
		// searchList();
		if(isEmptyObject(searchedData)) {
			searchedData = getData();
		}
		
		if (data.maskingYn === "N") {
			data.maskingYn = "Y";
		}
		
		routie('list/' + data.pageType + '/' + encodeURIComponent(JSON.stringify(searchedData)));
	})
	
	// 정산 상세 내 페이징 
	<c:if test="${null ne result.setInfo[0].carOwnerSettlementId and '' ne result.setInfo[0].carOwnerSettlementId}">
		$('.detailList ul.pagination li').on('click touch', function() {
			routie("detail/${result.setInfo[0].carOwnerSettlementId}/" + $(this).data('page-index'));
		})
	</c:if>
	
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
	
	// 진행상태 버튼 클릭 이벤트 
	$('.statusBtn').on('click touch', function() {
		if ($(this).data('type') === 'cancel') {
			cancelSettlement($(this));
		} else if($(this).data('type') === 'detail') {
			toggleDetailPopoup($(this));
		}
 	})
	
	$(document).ready(function(){

		<c:if test="${empty result.resultCode}">
			alert('차주정산 상세 조회 중 오류가 발생하였습니다.\r\nERROR: ${result}')
		</c:if>
		<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
			alert('차주정산 상세 조회 중 오류가 발생하였습니다.\r\nERROR: ${result.resultCode}, ${result.resultMsg}')
		</c:if>
		
		// 마스킹 버튼 텍스트
		if(data.maskingYn === 'N') {
			$('#maskingBtn span.text').text('마스킹 처리');
		} else {
			$('#maskingBtn span.text').text('마스킹 해제');
		}
		
		toggleStatusBtn();
	});
	
</script>
