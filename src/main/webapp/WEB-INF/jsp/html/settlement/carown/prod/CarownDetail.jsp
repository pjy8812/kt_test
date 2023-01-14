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
					<th scope="row">회원명</th>
					<td>${result.carownInfo[0].carOwnerName}</td>
					<th>회사명</th>
					<td>${result.carownInfo[0].carOwnerCompany}</td>
				</tr>
				<tr>
					<th scope="row">회원ID</th>
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
	<h5 class="card-title">정산요약</h5>
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
					<th scope="row">정산ID</th>
					<td>
						${result.setInfo[0].carOwnerSettlementId}
					</td>
					<th>건수</th>
					<td>
						<fmt:formatNumber value="${result.setInfo[0].carOwnerSettlementCount}"/>
					</td>
				</tr>
				<tr>
					<th scope="row">정산발생일</th>
					<td>${result.setInfo[0].carOwnerSettlementDateString}</td>
					<th>총 정산금액</th>
					<td><fmt:formatNumber value="${result.setInfo[0].carOwnerSettlementPrice}"/></td>
				</tr>
				<tr>
					<th scope="row">완료일시</th>
					<td>${result.setInfo[0].carOwnerSettlementDoneDateString}</td>
					<th scope="row">정산상태</th>
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
									<c:choose>
										<c:when test="${list.carOwnerSettlementRegularCharge lt 0}">
											<span class="color-text-danger"><fmt:formatNumber value="${list.carOwnerSettlementRegularCharge}"/></span>
										</c:when>
										<c:otherwise>
											<span class=""><fmt:formatNumber value="${list.carOwnerSettlementRegularCharge}"/></span>
										</c:otherwise>
									</c:choose>
								</td>
								<td class="text-right align-middle"><%-- <fmt:formatNumber value="${list.carOwnerSettlementMovingCharge}"/> --%>
									<c:choose>
										<c:when test="${list.carOwnerSettlementMovingCharge lt 0}">
											<span class="color-text-danger"><fmt:formatNumber value="${list.carOwnerSettlementMovingCharge}"/></span>
										</c:when>
										<c:otherwise>
											<span class=""><fmt:formatNumber value="${list.carOwnerSettlementMovingCharge}"/></span>
										</c:otherwise>
									</c:choose>
								</td>
								<td class="text-right align-middle"><%-- <fmt:formatNumber value="${list.carOwnerSettlementWatingCharge}"/> --%>
									<c:choose>
										<c:when test="${list.carOwnerSettlementWatingCharge lt 0}">
											<span class="color-text-danger"><fmt:formatNumber value="${list.carOwnerSettlementWatingCharge}"/></span>
										</c:when>
										<c:otherwise>
											<span class=""><fmt:formatNumber value="${list.carOwnerSettlementWatingCharge}"/></span>
										</c:otherwise>
									</c:choose>
								</td>
								<!-- <td>{수수료A : 배차취소}</td>
								<td>{수수료B : 대기지연}</td>
								<td>{세액}</td> -->
								<td class="align-middle">
									<button type="button" class="btn btn-white waves-effect receiptDownloadBtn" data-type="load" data-id="${list.carOwnerSettlementOrderId}">상차지</button>
									<button type="button" class="btn btn-white waves-effect receiptDownloadBtn" data-type="unload" data-id="${list.carOwnerSettlementOrderId}">하차지</button>
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
								<td class="align-middle">
									<%-- 기획서상 승인대기는 settlementRequested입니다. 추가로 승인 완료는 settlementCompleted, 승인취소는 CancelCompleted입니다. --%>
									<%-- 승인상태 --%>
									<%-- <c:choose>
										<c:when test="${'cancelCompleted' eq list.carOwnerSettlementState}">
											<span class="color-text-danger">${list.carOwnerSettlementStateName}</span>
										</c:when>
										<c:when test="${'settlementRequested' eq list.carOwnerSettlementState}">
											<span class="color-text-primary">${list.carOwnerSettlementStateName}</span>
											<c:forEach items="${autUriList}" var="autUriList">
												<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'U') gt -1}">
													<button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark ml-1 cancelBtn d-none" id="cancelBtn"
														data-owner-id="${list.carOwnerSettlementOrderId}"
														data-settlement-id="${list.carOwnerSettlementOrderId}"
														data-order-id="${list.carOwnerSettlementOrderId}"
														<c:if test="${null ne result.setInfo[0].carOwnerSettlementDate  and '' ne result.setInfo[0].carOwnerSettlementDate}">
															data-date="${result.setInfo[0].carOwnerSettlementDate}"
														</c:if>
														>취소</button>
												</c:if>
											</c:forEach>
										</c:when>
										<c:when test="${'settlementCompleted' eq list.carOwnerSettlementState}">
											<span class="">${list.carOwnerSettlementStateName}</span>
										</c:when>
										<c:otherwise>
											${list.carOwnerSettlementStateName}
										</c:otherwise>
									</c:choose> --%>
									<%-- <button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark ml-1 cancelBtn d-none" id="cancelBtn"
										data-owner-id="${result.resultId}"
										data-settlement-id="${result.setInfo[0].carOwnerSettlementId}"
										data-order-id="${list.carOwnerSettlementOrderId}"
										<c:if test="${null ne result.setInfo[0].carOwnerSettlementDate  and '' ne result.setInfo[0].carOwnerSettlementDate}">
											data-date="${result.setInfo[0].carOwnerSettlementDate}"
										</c:if>
										>취소</button> --%>
										<%-- ${list.carOwnerSettlementState} --%>
									<c:choose>
										<c:when test="${'cancelCompleted' eq list.carOwnerSettlementState}">
											<!-- 승인상태가 취소완료 -->
											<span class="color-text-danger">
												${list.carOwnerSettlementStateName}
											</span>
										</c:when>
										<c:otherwise>
											${result.setInfo[0].carOwnerSettlementStateName}
											<!-- 정산대기 : 취소가능 -->
											<c:if test="${'settlementStandby' eq result.setInfo[0].carOwnerSettlementState or 'settlementRequested' eq result.setInfo[0].carOwnerSettlementState}">
												<button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark ml-1 cancelBtn d-none 
													<c:if test="${'settlementRequested' eq result.setInfo[0].carOwnerSettlementState}">
														needsTimeCheck
													</c:if>
													" id="cancelBtn"
													data-owner-id="${result.resultId}"
													data-settlement-id="${result.setInfo[0].carOwnerSettlementId}"
													data-order-id="${list.carOwnerSettlementOrderId}"
													data-date="${result.setInfo[0].carOwnerSettlementDate}"
													>취소</button>
											</c:if>
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
	
	// console.log("== !orgPath ==");
	detailData.carOwnerSettlementId = '${result.setInfo[0].carOwnerSettlementId}';
	
	$('#maskingBtn').on('click touch', function () {

		if(data.maskingYn === 'N') {
			data.maskingYn = 'Y';
			loadDetail('${result.setInfo[0].carOwnerSettlementId}', 1);
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
		routie('list/' + data.pageType + '/' + encodeURIComponent(JSON.stringify(searchedData)));
	})
	
	// 정산 상세 내 페이징 
	<c:if test="${null ne result.setInfo[0].carOwnerSettlementId and '' ne result.setInfo[0].carOwnerSettlementId}">
		$('.detailList ul.pagination li').on('click touch', function() {
			routie("detail/${result.setInfo[0].carOwnerSettlementId}/" + $(this).data('page-index'));
		})
	</c:if>
	
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
	
	$(document).ready(function(){

		<c:if test="${empty result.resultCode}">
			alert('차주관리 상세 조회 중 오류가 발생하였습니다.\r\nERROR: ${result}')
		</c:if>
		<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
			alert('차주관리 상세 조회 중 오류가 발생하였습니다.\r\nERROR: ${result.resultCode}, ${result.resultMsg}')
		</c:if>
		
		// 마스킹 버튼 텍스트 
		if(data.maskingYn === 'N') {
			$('#maskingBtn span.text').text('마스킹 처리');
		} else {
			$('#maskingBtn span.text').text('마스킹 해제');
		}
		
		toggleCancelBtn();
	});
	
</script>
