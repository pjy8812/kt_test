<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="integrationOrderDetailPopup" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-full-width modal-dialog-scrollable">
        <div class="modal-content" id="integOrderDetailPopup">
            <div class="modal-header">
                <h4 class="modal-title">주문상세</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
                <div class="card-box">
                    <h5 class="card-title">주문조건</h5>
                    <div class="table-responsive">
						<table class="table mb-0 basic-table">
							<colgroup>
								<col style="width: 9%;">
								<col style="width: 41%;">
								<col style="width: 9%;">
								<col style="width: 41%;">
							</colgroup>
							<tbody>
								<tr>
									<th>주문번호</th>
									<td>${result.orderNumber}</td>
									<th>화물구분</th>
									<td>일반</td>
								</tr>
								<tr>
									<th>주문상태1</th>
									<td>
										<c:choose>
											<c:when test="${result.orderStatus eq 'CHARGE_CHECKING'}">요금확인중</c:when>
											<c:when test="${result.orderStatus eq 'DELIVERY_REQUESTED'}">배송요청</c:when>
											<c:when test="${result.orderStatus eq 'DISPATCH_COMPLETED'}">배차완료</c:when>
											<c:when test="${result.orderStatus eq 'LOADING_COMPLETED'}">상차완료</c:when>
											<c:when test="${result.orderStatus eq 'UNLOADING_COMPLETED'}">하차완료</c:when>
											<c:when test="${result.orderStatus eq 'ORDER_CANCELED'}">주문취소</c:when>
											<c:otherwise>${result.orderStatus}</c:otherwise>
										</c:choose>
									</td>
									<th>주문상태2</th>
									<td>
										<c:choose>
											<c:when test="${result.freight.isUrgentFreight}">긴급</c:when>
											<c:otherwise>일반</c:otherwise>
										</c:choose>
									</td>
								</tr>
								<tr>
									<th>배차지연</th>
									<td>
										<c:choose>
											<c:when test="${result.dispatchDelay eq 'NOMAL'}">정상</c:when>
											<c:when test="${result.dispatchDelay eq 'DELAY'}">지연</c:when>
											<c:otherwise>${result.dispatchDelay}</c:otherwise>
										</c:choose>
									</td>
									<th>화주명</th>
									<td>${result.freightOwnerInfo.freightOwnerName}</td>
								</tr>
								<tr>
									<th>계약구분</th>
									<td>
										<c:choose>
											<c:when test="${result.freightOwnerType eq 'FO_C'}">계약화주</c:when>
											<c:when test="${result.freightOwnerType eq 'FO_G'}">일반화주</c:when>
											<c:when test="${result.freightOwnerType eq 'manualDelivery'}">계약화주-수동배차</c:when>
											<c:otherwise>${result.freightOwnerType}</c:otherwise>
										</c:choose>
									</td>
									<th>배송요청자</th>
									<td>${result.freight.deliveryRequesterName}</td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td>${result.freightOwnerInfo.freightOwnerTelephone}</td>
									<th>이메일주소</th>
									<td>${result.freightOwnerInfo.freightOwnerEmail}</td>
								</tr>
								<tr>
									<th>배송 요청일시</th>
									<td>${result.registerCompletedAt}</td>
									<th>화물 등록일시</th>
									<td>${result.freight.createdAt}</td>
								</tr>
							</tbody>
						</table>
					</div>
                </div>
                
                <div>
                	<button type="button"
						class="btn btn-dark btn-rounded waves-effect waves-dark"
						id="maskingBtn">
						<span class="text">마스킹 해제</span><span class="btn-label-right"><i
							class="fas fa-eye"></i></span>
					</button>
                </div>

                <div class="card-box">
                    <h5 class="card-title">화물/차량 정보</h5>
                    <div class="table-responsive">
						<table class="table mb-0 basic-table">
							<colgroup>
								<col style="width: 9%;">
								<col style="width: 41%;">
								<col style="width: 9%;">
								<col style="width: 41%;">
							</colgroup>
							<tbody>
								<tr>
									<th>화물 규격</th>
									<td class="df">
										<select name="packagingType" id="packagingType" class="form-control" disabled>
											<c:forEach var="packagingType" items="${packagingTypeList}" varStatus="idx">
												<option value="${packagingType.codeId}" <c:if test="${result.freight.packagingList[0].packagingType eq packagingType.codeId}">selected</c:if>>${packagingType.codeName}</option>
											</c:forEach>
										</select>
										<input type="text" class="form-control" value="${result.freight.packagingList[0].freightLoadingCount}" readonly>
									</td>
									<th>화물 옵션</th>
									<td class="df">
										<select name="" id="" class="form-control" disabled>
											<option value="">독차</option>
											<option value="">혼적</option>
										</select>
										<select name="" id="" class="form-control" disabled>
											<option value="">편도</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>화물 종류</th>
									<td>
										<select name="freightType" id="freightType" class="form-control" disabled>
											<c:forEach var="freightType" items="${freightTypeList}" varStatus="idx">
												<option value="${freightType.codeId}" <c:if test='${result.freight.freightType eq freightType.codeId}'>selected</c:if>>${freightType.codeName}</option>
											</c:forEach>										
										</select>
									</td>
									<th>화물 배송온도</th>
									<td>
										<select name="deliveryTemperature" id="deliveryTemperature" class="form-control" disabled>
											<c:forEach var="deliveryTemperature" items="${deliveryTemperatureList}" varStatus="idx">
												<option value="${deliveryTemperature.codeId}" <c:if test='${result.freight.deliveryTemperature eq deliveryTemperature.codeId}'>selected</c:if>>${deliveryTemperature.codeName}</option>
											</c:forEach>	
										</select>
									</td>
								</tr>
								<tr>
									<th>특이사항</th>
									<td colspan="3"><textarea name="otherFreightInfo" id="otherFreightInfo" class="form-control" placeholder="화물의  특이정보나 요청사항을 입력해 주세요 (선택/최대100자)" readonly>${result.freight.otherFreightInfo}</textarea></td>
								</tr>
								<tr>
									<th>차량 차종</th>
									<td>
										<select name="carType" id="carType" class="form-control" disabled>
											<c:forEach var="carType" items="${carTypeList}" varStatus="idx">
												<option value="${carType.codeId}" <c:if test='${result.freight.carType eq carType.codeId}'>selected</c:if>>${carType.codeName}</option>
											</c:forEach>
										</select>
									</td>
									<th>차량 톤급</th>
									<td>
										<select name="carModel" id="carModel" class="form-control" disabled>
											<c:forEach var="carModel" items="${carModelList}" varStatus="idx">
												<option value="${carModel.codeId}" <c:if test='${result.freight.carModel eq carModel.codeId}'>selected</c:if>>${carModel.codeName}</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<th>차량 옵션</th>
									<td class="df label-ty-1">
<!-- 										<select name="carOption" id="carOption" class="form-control" disabled> -->
<%-- 											<c:forEach var="carOption" items="${carOptionList}" varStatus="idx"> --%>
<%-- 												<option value="${carOption.codeId}" <c:if test='${result.carOption.type eq carOption.codeId}'>selected</c:if>>${carOption.codeName}</option> --%>
<%-- 											</c:forEach> --%>
<!-- 										</select> -->
										<label>${result.carOption.type}</label>
										<label for="car-option-01">
											<input type="checkbox" name="car-option" id="car-option-01" disabled <c:if test='${result.carOption.liftYn eq "Y"}'>checked</c:if>>
											리프트
										</label>
										<label for="car-option-02">
											<input type="checkbox" name="car-option" id="car-option-02" disabled <c:if test='${result.carOption.antiSwingYn eq "Y"}'>checked</c:if>>
											무진동
										</label>
									</td>
									<th></th>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
                </div>

                 <div class="card-box">
                    <h5 class="card-title">상/하차지 정보</h5>
                    <div class="table-responsive">
						<table class="table mb-0 basic-table">
							<colgroup>
								<col style="width: 9%;">
								<col style="width: 41%;">
								<col style="width: 9%;">
								<col style="width: 41%;">
							</colgroup>
							<tbody>
								<tr>
									<th>거래처</th>
									<td><input type="text" value="${result.freight.deliveryRequesterName}" class="form-control" readonly></td>
									<th>거래처 연락처</th>
									<td><input type="text" value="${result.freight.deliveryPhoneNum}" class="form-control" disabled></td>
								</tr>
								<tr>
									<th>상차1 일시</th>
									<td class="df">
										<c:set var="splitLoadingDate" value="${fn:split(result.freight.loadingCompletedDateTime, ' ')}"></c:set>
										<div class="picker-wrap">
											<input type="text" id="loadingCompletedDateTime" class="form-control flatpickr-input" placeholder="날짜선택" readonly="readonly" value="${splitLoadingDate[0]}" readonly>
											<label for="range-datepicker"><i class="fas fa-calendar"></i></label>
										</div>
										<select name="loadingCompletedHour" id="loadingCompletedHour" class="form-control" disabled>
											<c:forEach var="hours" items="${result.hoursList}" varStatus="idx">
												<option value="${hours}" <c:if test="${fn:split(splitLoadingDate[1], ':')[0] eq hours}">selected</c:if>>${hours}</option>
											</c:forEach>
										</select>
										<span class="txt">시</span>
										<select name="loadingCompletedMinute" id="loadingCompletedMinute" class="form-control" disabled>
											<c:forEach var="minutes" items="${result.minutesList}" varStatus="idx">
												<option value="${minutes}" <c:if test="${fn:split(splitLoadingDate[1], ':')[1] eq minutes}">selected</c:if>>${minutes}</option>
											</c:forEach>
										</select>
										<span class="txt">분</span>
									</td>
									<th>상차1 적재</th>
									<td>
										<select name="loadingFreightMethod" id="loadingFreightMethod" class="form-control" disabled>
											<c:forEach var="loadingFreightMethod" items="${loadingFreightMethodList}" varStatus="idx">
												<option value="${loadingFreightMethod.codeId}" <c:if test='${result.freight.loadingFreightMethod eq loadingFreightMethod.codeId}'>selected</c:if>>${loadingFreightMethod.codeName}</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<th>상차1 주소</th>
									<td>
										<div class="df">
											<input type="text" class="form-control" value="${result.freight.loadingZipCode}" readonly>
										</div>
										<div class="df mt-2">
											<input type="text" class="form-control" value="${result.freight.loadingAddress}" readonly>
											<input type="text" class="form-control" value="${result.freight.loadingDetailAddress}" readonly>
										</div>
									</td>
									<th></th>
									<td></td>
								</tr>
								<tr>
									<th>상차1 담당자명</th>
									<td><input type="text" class="form-control" value="${result.freight.loadingManagerName}" readonly></td>
									<th>상차1 담당자 연락처</th>
									<td><input type="text" class="form-control" value="${result.freight.loadingPhoneNum}" readonly></td>
								</tr>
								<tr>
									<th>하차1 일시</th>
									<td class="df">
										<c:set var="splitUnloadingDate" value="${fn:split(result.freight.unloadingCompletedDateTime, ' ')}"></c:set>
										<div class="picker-wrap">
											<input type="text" id="lastUseDate" class="form-control flatpickr-input" placeholder="날짜선택" readonly="readonly" value="${splitUnloadingDate[0]}" readonly>
											<label for="range-datepicker"><i class="fas fa-calendar"></i></label>
										</div>
										<select name="unloadingCompletedHour" id="unloadingCompletedHour" class="form-control" disabled>
											<c:forEach var="hours" items="${result.hoursList}" varStatus="idx">
												<option value="${hours}" <c:if test="${fn:split(splitUnloadingDate[1], ':')[0] eq hours}">selected</c:if>>${hours}</option>
											</c:forEach>
										</select>
										<span class="txt">시</span>
										<select name="unloadingCompletedMinute" id="unloadingCompletedMinute" class="form-control" disabled>
											<c:forEach var="minutes" items="${result.minutesList}" varStatus="idx">
												<option value="${minutes}" <c:if test="${fn:split(splitUnloadingDate[1], ':')[1] eq minutes}">selected</c:if>>${minutes}</option>
											</c:forEach>
										</select>
										<span class="txt">분</span>
									</td>
									<th>하차1 적재</th>
									<td>
										<select name="unloadingFreightMethod" id="unloadingFreightMethod" class="form-control" disabled>
											<c:forEach var="unloadingFreightMethod" items="${loadingFreightMethodList}" varStatus="idx">
												<option value="${unloadingFreightMethod.codeId}" <c:if test='${result.freight.unloadingFreightMethod eq unloadingFreightMethod.codeId}'>selected</c:if>>${unloadingFreightMethod.codeName}</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<th>하차1 주소</th>
									<td>
										<div class="df">
											<input type="text" class="form-control" value="${result.freight.unloadingZipCode}" readonly>
										</div>
										<div class="df mt-2">
											<input type="text" class="form-control" value="${result.freight.unloadingAddress}" readonly>
											<input type="text" class="form-control" value="${result.freight.unloadingDetailAddress}" readonly>
										</div>
									</td>
									<th></th>
									<td></td>
								</tr>
								<tr>
									<th>하차1 담당자명</th>
									<td><input type="text" class="form-control" value="${result.freight.unloadingManagerName}" readonly></td>
									<th>하차1 담당자 연락처</th>
									<td><input type="text" class="form-control" value="${result.freight.unloadingPhoneNum}" readonly></td>
								</tr>
								<tr>
									<th>예상거리</th>
									<td>${result.estimatedDistance}km</td>
									<th>예상이동시간</th>
									<td>${result.leadTime}분</td>
								</tr>
							</tbody>
						</table>
					</div>
                </div>

                <!-- button-list -->
                <div class="button-list text-center">
                    <button type="button" class="btn btn-secondary width-sm btn-rounded waves-effect waves-dark" id="btnClose">닫기</button>
                </div>
                <!-- //button-list -->

            </div>
        </div><!-- /.modal-content -->
    </div>
</div>

<div id="unmaskingModal" class="unmasking"></div>

<script>
$('#maskingBtn').on('click', function () {
	if (data.maskingYn === 'N') {
		data.maskingYn = 'Y';
		popupOrderDetail(data.orderId, "Y");
	} else {
		$.ajax({
		    type : "POST",
		    url : "<c:url value='/ui/service/common/popup/reason.unmasking'/>",
		    data : {
		    	"maskingHistoryType" : 'integOrderInfo'
		    },
		    cache : false,
		    async : true,
		    success : function(data, textStatus, XMLHttpRequest) {
				if (hasErrorMap(data, true)) {
					return;
				}
				
				$('#unmaskingModal').html(data);
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

if(data.maskingYn === 'N') {
	$('#maskingBtn span.text').text('마스킹 처리');
} else {
	$('#maskingBtn span.text').text('마스킹 해제');
}

$('#unmaskingModal').on('click', '#popupUnmaskingReason #unmaskingSave',
	function(e) {
		var maskingType = $('#popupUnmaskingReason').data('param_type');
		unmask('orderInfo');
	}
);

$('#btnClose').on('click', function (el) {
	data.maskingYn = 'Y';
	$('#integrationOrderDetailPopup').modal('hide');
});

</script>
