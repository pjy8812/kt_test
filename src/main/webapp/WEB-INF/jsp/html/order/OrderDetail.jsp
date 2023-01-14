<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Begin page -->
<div class="tab-content pt-0" id="orderDetail" data-order-id="${result.orderId}" data-order-num="${result.orderNumber}"
		data-delivery-id="${result.shipment.deliveryId}" data-dispatch-id="${result.shipment.dispatchId}" data-order-status="${result.orderStatus}"
		data-carown-id="${result.carOwnerInfo.carOwnerIdOrg}" data-frgown-id="${result.freightOwnerInfo.freightOwnerIdOrg}">
	<!-- 기본정보 -->
	<div class="tab-pane show active" id="div-tab01">
		<div class="card-box">
			<h5 class="card-title">화물 정보</h5>
			<div class="table-responsive">
				<table class="table mb-0 basic-table">
					<colgroup>
						<col style="width: 10%;">
						<col style="width: 40%;">
						<col style="width: 10%;">
						<col style="width: 40%;">
					</colgroup>
					<!-- Begin 주문배송 -->
					<c:if test="${mode eq 'order'}">
						<tbody>
							<tr>
								<th scope="row">주문번호</th>
								<td id="orderNum">${result.orderNumber}</td>
								<th>화물구분</th>
								<td>일반</td> <!-- 일반으로 일괄 적용하도록 정재국대리에게 전달받음 (2022.04.01) -->
							</tr>
							<tr>
								<th scope="row">주문상태1</th>
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
                                    <!-- 주문취소 : 요금확인중, 배송요청, 배차완료만 가능 (2022.04.27) -->
									<c:if test="${result.orderStatus eq 'CHARGE_CHECKING' || result.orderStatus eq 'DELIVERY_REQUESTED' || result.orderStatus eq 'DISPATCH_COMPLETED'}">
										<button type="button" class="btn btn-dark btn-sm waves-effect waves-light ml-4" id="orderCancel">주문취소</button>
									</c:if>
								</td>
								<th>주문상태2</th>
								<td>
									<c:choose>
										<c:when test="${result.freight.isUrgentFreight eq true}">긴급</c:when>
										<c:otherwise>일반</c:otherwise>
                                    </c:choose>
								</td>
							</tr>
							<tr>
								<th scope="row">배차지연</th>
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
								<th scope="row">계약구분</th>
								<td>
									<c:choose>
										<c:when test="${result.freightOwnerType eq 'FO_C'}">계약화주</c:when>
										<c:when test="${result.freightOwnerType eq 'manualDelivery'}">계약화주-수동배차</c:when>
										<c:when test="${result.freightOwnerType eq 'FO_G'}">일반화주</c:when>
										<c:otherwise>${result.freightOwnerType}</c:otherwise>
                                    </c:choose>
								</td>
								<th>배송요청자</th>
								<td>${result.freight.deliveryRequesterName}</td>
							</tr>
							<tr>
								<th scope="row">전화번호</th>
								<td>${result.freightOwnerInfo.freightOwnerTelephone}</td>
								<th>이메일주소</th>
								<td>${result.freightOwnerInfo.freightOwnerEmail}</td>
							</tr>
							<tr>
								<th scope="row">화물정보</th>
								<td>
									<!-- 화물종류 -->
	                            	<c:forEach items="${freightType}" var="codeList">
	                            		<c:if test="${result.freight.freightType eq codeList.codeId}">${codeList.codeName}</c:if>
	                            	</c:forEach>
	                            	
									<c:if test="${!empty result.freight.freightType && !empty result.freight.deliveryTemperature}">/</c:if>
									
									<!-- 배송온도 -->
	                            	<c:forEach items="${deliveryTemperature}" var="codeList">
	                            		<c:if test="${result.freight.deliveryTemperature eq codeList.codeId}">${codeList.codeName}</c:if>
	                            	</c:forEach>
								</td>
								<th>화물크기</th>
								<td>
									<c:forEach items="${result.freight.packagingList}" var="list" varStatus="status">
										<!-- 화물적재종류 -->
		                            	<c:forEach items="${packagingType}" var="codeList">
		                            		<c:if test="${list.packagingType eq codeList.codeId}">${codeList.codeName}</c:if>
		                            	</c:forEach>
										
										<!-- 화물사이즈 -->
		                            	<c:forEach items="${freightLoadingSize}" var="codeList">
		                            		<c:if test="${list.freightLoadingSize eq codeList.codeId}">${codeList.codeName}</c:if>
		                            	</c:forEach>
										
										${list.freightLoadingCount}<c:if test="${status.last ne true}">, </c:if>
									</c:forEach>
								</td>
							</tr>
							<tr>
								<th>차량정보</th>
								<td>
									<!-- 차량톤수 -->
	                            	<c:forEach items="${carModel}" var="codeList">
	                            		<c:if test="${result.freight.carModel eq codeList.codeId}">${codeList.codeName}</c:if>
	                            	</c:forEach>
									
									<c:if test="${!empty result.freight.carModel && (!empty result.freight.carType || !empty result.freight.freightCarOptions)}">/</c:if>
									
									<!-- 차량형태 -->
	                            	<c:forEach items="${carType}" var="codeList">
	                            		<c:if test="${result.freight.carType eq codeList.codeId}">${codeList.codeName}</c:if>
	                            	</c:forEach>
									
									<!-- 차량옵션 -->
									<c:if test="${!empty result.freight.freightCarOptions}">
										<c:forEach items="${result.freight.freightCarOptions}" var="list">
			                            	<c:forEach items="${carOption}" var="codeList">
			                            		<c:if test="${list.carOption.carOptionE eq codeList.codeId}">${codeList.codeName}</c:if>
			                            	</c:forEach>
										</c:forEach>
									</c:if>
								</td>
								<th scope="row">요청사항</th>
								<td>${result.freight.otherFreightInfo}</td>
							</tr>
							<tr>
								<th scope="row">전자인수증</th>
								<td>
									<button type="button" class="btn btn-white waves-effect receiptDownloadBtn" data-type="load" data-id="${result.orderId}">상차지</button>
									<button type="button" class="btn btn-white waves-effect receiptDownloadBtn" data-type="unload" data-id="${result.orderId}">하차지</button>
								</td>
								<th>화물 등록일시</th>
								<td><fmt:formatDate value="${result.freight.createdAt}" pattern="yyyy.MM.dd HH:mm"/></td>
							</tr>
							<tr>
								<th>배송 요청일시</th>
								<td colspan="3"><fmt:formatDate value="${result.registerCompletedAt}" pattern="yyyy.MM.dd HH:mm"/></td>
							</tr>
						</tbody>
					</c:if>
					<!-- End 주문배송 -->
					
					<!-- Begin 수동배차 -->
					<c:if test="${mode eq 'manual'}">
						<tbody>
							<tr>
								<th scope="row">주문번호</th>
								<td id="orderNum">${result.orderNumber}</td>
								<th>화물구분</th>
								<td>일반</td> <!-- 일반으로 일괄 적용하도록 정재국대리에게 전달받음 (2022.04.01) -->
							</tr>
							<tr>
								<th scope="row">주문상태1</th>
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
                                    <!-- 주문취소 : 요금확인중, 배송요청, 배차완료만 가능 (2022.04.27) -->
									<c:if test="${result.orderStatus eq 'CHARGE_CHECKING' || result.orderStatus eq 'DELIVERY_REQUESTED' || result.orderStatus eq 'DISPATCH_COMPLETED'}">
										<button type="button" class="btn btn-dark btn-sm waves-effect waves-light ml-4" id="orderCancel">주문취소</button>
									</c:if>
								</td>
								<th>화주명</th>
								<td>${result.freightOwnerInfo.freightOwnerName}</td>
							</tr>
							<tr>
								<th scope="row">계약구분</th>
								<td>
									<c:choose>
										<c:when test="${result.freightOwnerType eq 'FO_C'}">계약화주</c:when>
										<c:when test="${result.freightOwnerType eq 'manualDelivery'}">계약화주-수동배차</c:when>
										<c:when test="${result.freightOwnerType eq 'FO_G'}">일반화주</c:when>
										<c:otherwise>${result.freightOwnerType}</c:otherwise>
                                    </c:choose>
								</td>
								<th scope="row">전화번호</th>
								<td>${result.freightOwnerInfo.freightOwnerTelephone}</td>
							</tr>
							<tr>
								<th>이메일주소</th>
								<td>${result.freightOwnerInfo.freightOwnerEmail}</td>
								<th scope="row">화물정보</th>
								<td>
									<!-- 화물종류 -->
	                            	<c:forEach items="${freightType}" var="codeList">
	                            		<c:if test="${result.freight.freightType eq codeList.codeId}">${codeList.codeName}</c:if>
	                            	</c:forEach>
									
									<c:if test="${!empty result.freight.freightType && !empty result.freight.deliveryTemperature}">/</c:if>
									
									<!-- 배송온도 -->
	                            	<c:forEach items="${deliveryTemperature}" var="codeList">
	                            		<c:if test="${result.freight.deliveryTemperature eq codeList.codeId}">${codeList.codeName}</c:if>
	                            	</c:forEach>
								</td>
							</tr>
							<tr>
								<th>화물크기</th>
								<td>
									<c:forEach items="${result.freight.packagingList}" var="list" varStatus="status">
										<!-- 화물적재종류 -->
		                            	<c:forEach items="${packagingType}" var="codeList">
		                            		<c:if test="${list.packagingType eq codeList.codeId}">${codeList.codeName}</c:if>
		                            	</c:forEach>
										
										<!-- 화물사이즈 -->
		                            	<c:forEach items="${freightLoadingSize}" var="codeList">
		                            		<c:if test="${list.freightLoadingSize eq codeList.codeId}">${codeList.codeName}</c:if>
		                            	</c:forEach>
										
										${list.freightLoadingCount}<c:if test="${status.last ne true}">, </c:if>
									</c:forEach>
								</td>
								<th>차량정보</th>
								<td>
									<!-- 차량톤수 -->
	                            	<c:forEach items="${carModel}" var="codeList">
	                            		<c:if test="${result.freight.carModel eq codeList.codeId}">${codeList.codeName}</c:if>
	                            	</c:forEach>
									
									<c:if test="${!empty result.freight.carModel && (!empty result.freight.carType || !empty result.freight.freightCarOptions)}">/</c:if>
									
									<!-- 차량형태 -->
	                            	<c:forEach items="${carType}" var="codeList">
	                            		<c:if test="${result.freight.carType eq codeList.codeId}">${codeList.codeName}</c:if>
	                            	</c:forEach>
									
									<!-- 차량옵션 -->
									<c:if test="${!empty result.freight.freightCarOptions}">
										<c:forEach items="${result.freight.freightCarOptions}" var="list">
			                            	<c:forEach items="${carOption}" var="codeList">
			                            		<c:if test="${list.carOption.carOptionE eq codeList.codeId}">${codeList.codeName}</c:if>
			                            	</c:forEach>
										</c:forEach>
									</c:if>
								</td>
							</tr>
							<tr>
								<th scope="row">요청사항</th>
								<td>${result.freight.otherFreightInfo}</td>
								<th scope="row">전자인수증</th>
								<td>
									<button type="button" class="btn btn-white waves-effect receiptDownloadBtn" data-type="load" data-id="${result.orderId}">상차지</button>
									<button type="button" class="btn btn-white waves-effect receiptDownloadBtn" data-type="unload" data-id="${result.orderId}">하차지</button>
								</td>
							</tr>
							<tr>
								<th>화물 등록일시</th>
								<td><fmt:formatDate value="${result.freight.createdAt}" pattern="yyyy.MM.dd HH:mm"/></td>
								<th>배송 요청일시</th>
								<td colspan="3"><fmt:formatDate value="${result.registerCompletedAt}" pattern="yyyy.MM.dd HH:mm"/></td>
							</tr>
						</tbody>
					</c:if>
					<!-- End 수동배차 -->
				</table>
			</div>
		</div>
		
		<div class="card-box">
			<h5 class="card-title">상/하차지 정보</h5>
			<!-- 현재 입력된 상차지주소 정보 -->
			<input type="hidden" class="addr loading lat" value="${result.loading.parcelAddress.geographicInformation.point.lat}" readonly/>
			<input type="hidden" class="addr loading lng" value="${result.loading.parcelAddress.geographicInformation.point.lng}" readonly/>
			<input type="hidden" class="addr loading pnu" value="${result.loading.parcelAddress.pnucode}" readonly/>
			<input type="hidden" class="addr loading rbu" value="${result.loading.roadAddress.rbucode}" readonly/>
			<input type="hidden" class="addr loading post" value="${result.loading.parcelAddress.postCode}" readonly/><br/>
			<!-- 현재 입력된 하차지주소 정보 -->
			<input type="hidden" class="addr unloading lat" value="${result.unloading.parcelAddress.geographicInformation.point.lat}" readonly/>
			<input type="hidden" class="addr unloading lng" value="${result.unloading.parcelAddress.geographicInformation.point.lng}" readonly/>
			<input type="hidden" class="addr unloading pnu" value="${result.unloading.parcelAddress.pnucode}" readonly/>
			<input type="hidden" class="addr unloading rbu" value="${result.unloading.roadAddress.rbucode}" readonly/>
			<input type="hidden" class="addr unloading post" value="${result.unloading.parcelAddress.postCode}" readonly/>
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
							<th scope="row" class="loadingDateTime" data-time="<fmt:formatDate value="${result.freight.loadingDateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>">상차일시</th>
							<fmt:formatDate value="${result.freight.loadingDateTime}" pattern="yyyy.MM.dd" var="loadingDate"/>
							<fmt:formatDate value="${result.freight.loadingDateTime}" pattern="HH:mm" var="loadingTime"/>
							<td>
								<div class="row">
									<div class="col-4">
										<div class="picker-wrap">
											<input type="text" id="loadingDate" class="form-control form-control-sm" value="${loadingDate}" 
												<c:if test="${result.orderStatus ne 'CHARGE_CHECKING' && result.orderStatus ne 'DELIVERY_REQUESTED'}">disabled</c:if>>
											<label for="loadingDate"><i class="fas fa-calendar"></i></label>
										</div>
									</div>
									<div class="col-4">
										<input type="text" id="loadingTime" class="form-control form-control-sm" value="${loadingTime}"
											<c:if test="${result.orderStatus ne 'CHARGE_CHECKING' && result.orderStatus ne 'DELIVERY_REQUESTED'}">disabled</c:if>>
									</div>
								</div>
							</td>
							<th>화물적재방법</th>
							<td>
                            	<c:forEach items="${loadingFreightMethod}" var="codeList">
                            		<c:if test="${result.freight.loadingFreightMethod eq codeList.codeId}">${codeList.codeName}</c:if>
                            	</c:forEach>
								<c:if test="${result.freight.isMoveToLoadingCar eq true}"> / 상차 차량까지 화물 이동 필요</c:if>
							</td>
						</tr>
						<tr>
							<th scope="row">담당자명</th> <!-- 상차 -->
							<td>${result.freight.loadingManagerName}</td>
							<th>담당자 연락처</th>
							<td>${result.freight.loadingPhoneNum}</td>
						</tr>
						<tr>
							<th scope="row">상차주소</th>
                            <td colspan="3">
                                <div class="row">
                                    <div class="col-2 d-none">
                                        <input type="text" class="form-control form-control-sm" value="${result.freight.loadingZipCode}" id="loadingZip" disabled>
                                    </div>
                                    <div class="col-10">
                                    	<!-- KT요청 - 배송요청 & 지연인 경우 주소수정 불가 (2022.04.26) -->
                                    	<c:if test="${result.orderStatus eq 'CHARGE_CHECKING' || (result.orderStatus eq 'DELIVERY_REQUESTED' && result.dispatchDelay ne 'DELAY')}">
                                        	<button type="button" class="btn btn-dark btn-sm waves-effect waves-light searchAddr" data-mode="loading">주소검색</button>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-3">
                                        <input type="text" class="form-control form-control-sm" value="${result.freight.loadingAddress}" id="loadingAddr" disabled>
                                    </div>
                                    <div class="col-2">
                                    	<!-- KT요청 - 배송요청 & 지연인 경우 주소수정 불가 (2022.04.26) -->
                                        <input type="text" class="form-control form-control-sm" value="${result.freight.loadingDetailAddress}" id="loadingDetailAddr"
                                        	<c:if test="${result.orderStatus ne 'CHARGE_CHECKING' && (result.orderStatus ne 'DELIVERY_REQUESTED' || (result.orderStatus eq 'DELIVERY_REQUESTED' && result.dispatchDelay eq 'DELAY'))}">disabled</c:if> placeholder="상세주소를 입력하세요.">
                                    </div>
                                </div>
                                <!-- 선택한 상차지주소 정보 -->
				                <input type="hidden" class="loading point lat" readonly/>
				                <input type="hidden" class="loading point lng" readonly/>
				                <input type="hidden" class="loading pnu" readonly/>
				                <input type="hidden" class="loading rbu" readonly/>
				                <input type="hidden" class="loading post" readonly/>
                            </td>
						</tr>
						<tr>
							<th scope="row">하차일시</th>
							<fmt:formatDate value="${result.freight.unloadingDateTime}" pattern="yyyy.MM.dd" var="unloadingDate"/>
							<fmt:formatDate value="${result.freight.unloadingDateTime}" pattern="HH:mm" var="unloadingTime"/>
							<td>
								<div class="row">
									<div class="col-4">
										<div class="picker-wrap">
											<input type="text" id="unloadingDate" class="form-control form-control-sm" value="${unloadingDate}"
												<c:if test="${result.orderStatus ne 'CHARGE_CHECKING' && result.orderStatus ne 'DELIVERY_REQUESTED'}">disabled</c:if>>
											<label for="unloadingDate"><i class="fas fa-calendar"></i></label>
										</div>
									</div>
									<div class="col-4">
										<input type="text" id="unloadingTime" class="form-control form-control-sm" value="${unloadingTime}"
											<c:if test="${result.orderStatus ne 'CHARGE_CHECKING' && result.orderStatus ne 'DELIVERY_REQUESTED'}">disabled</c:if>>
									</div>
								</div>
							</td>
							<th>화물적재방법</th>
							<td>
                            	<c:forEach items="${loadingFreightMethod}" var="codeList">
                            		<c:if test="${result.freight.unloadingFreightMethod eq codeList.codeId}">${codeList.codeName}</c:if>
                            	</c:forEach>
								<c:if test="${result.freight.isMoveToUnloadingCar eq true}"> / 하차 차량까지 화물 이동 필요</c:if>
							</td>
						</tr>
						<tr>
							<th scope="row">담당자명</th> <!-- 하차 -->
							<td>${result.freight.unloadingManagerName}</td>
							<th>담당자 연락처</th>
							<td>${result.freight.unloadingPhoneNum}</td>
						</tr>
						<tr>
							<th scope="row">하차주소</th>
                            <td colspan="3">
                                <div class="row">
                                    <div class="col-2 d-none">
                                        <input type="text" class="form-control form-control-sm" value="${result.freight.unloadingZipCode}" id="unloadingZip" disabled>
                                    </div>
                                    <div class="col-10">
                                    	<!-- KT요청 - 배송요청 & 지연인 경우 주소수정 불가 (2022.04.26) -->
                                    	<c:if test="${result.orderStatus eq 'CHARGE_CHECKING' || (result.orderStatus eq 'DELIVERY_REQUESTED' && result.dispatchDelay ne 'DELAY')}">
                                        	<button type="button" class="btn btn-dark btn-sm waves-effect waves-light searchAddr" data-mode="unloading">주소검색</button>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-3">
                                        <input type="text" class="form-control form-control-sm" value="${result.freight.unloadingAddress}" id="unloadingAddr" disabled>
                                    </div>
                                    <div class="col-2">
                                    	<!-- KT요청 - 배송요청 & 지연인 경우 주소수정 불가 (2022.04.26) -->
                                        <input type="text" class="form-control form-control-sm" value="${result.freight.unloadingDetailAddress}" id="unloadingDetailAddr"
                                        	<c:if test="${result.orderStatus ne 'CHARGE_CHECKING' && (result.orderStatus ne 'DELIVERY_REQUESTED' || (result.orderStatus eq 'DELIVERY_REQUESTED' && result.dispatchDelay eq 'DELAY'))}">disabled</c:if> placeholder="상세주소를 입력하세요.">
                                    </div>
                                </div>
                                <!-- 선택한 하차지주소 정보 -->
				                <input type="hidden" class="unloading point lat" readonly/>
				                <input type="hidden" class="unloading point lng" readonly/>
				                <input type="hidden" class="unloading pnu" readonly/>
				                <input type="hidden" class="unloading rbu" readonly/>
				                <input type="hidden" class="unloading post" readonly/>
                            </td>
						</tr>
						<tr>
							<th scope="row">예상거리</th>
							<td id="estimatedDistance"><c:if test="${!empty result.estimatedDistance}">${result.estimatedDistance}㎞</c:if></td>
							<th>예상이동시간</th>
							<td id="estimatedDuration"><c:if test="${!empty result.leadTime}">${result.leadTime}분</c:if></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<div class="card-box">
			<h5 class="card-title mb-0">등록 요금 정보</h5>
			<div class="row mb-2">
				<div class="col-12 text-right">
					<button type="button" class="btn btn-custom02 btn-rounded waves-effect waves-dark" id="calculateCharge"
						<c:if test="${result.orderStatus ne 'CHARGE_CHECKING' && result.orderStatus ne 'DELIVERY_REQUESTED'}">disabled</c:if>>표준요금 재계산</button>
				</div>
			</div>
			<div class="table-responsive">
				<table class="table mb-0 basic-table">
					<colgroup>
						<col style="width: 15%;">
						<col style="width: 35%;">
						<col style="width: 15%;">
						<col style="width: 35%;">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">배송요금<br>(예상표준요금)</th>
							<td>
								<div class="row">
									<div class="col-4">
										<input type="text" class="form-control form-control-sm text-right" id="deliveryCharge" data-delivery-charge="${result.regCharge.registeredCharge.standardCharge}" 
											value='<fmt:formatNumber value="${result.regCharge.registeredCharge.standardCharge}" pattern="#,###"/>' onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)"
											<c:if test="${result.orderStatus ne 'CHARGE_CHECKING'}">disabled</c:if>>
									</div>
									<div class="col-1 mt-1">원</div>
								</div>
							</td>
							<th>최초 마진요금</th>
							<td id="marginCharge">
								<c:if test="${!empty result.regCharge.registeredCharge.marginCharge}">
									<fmt:formatNumber value="${result.regCharge.registeredCharge.marginCharge}" pattern="#,###"/>원
								</c:if>
								<c:if test="${!empty result.regCharge.registeredCharge.marginRate}">
									(${result.regCharge.registeredCharge.marginRate}%)
								</c:if>
							</td>
						</tr>
						<tr>
							<th scope="row">차주노출요금</th>
							<td id="carOwnerFee" data-charge="${result.regCharge.registeredCharge.carOwnerCharge}">
								<c:if test="${!empty result.regCharge.registeredCharge.carOwnerCharge}">
									<fmt:formatNumber value="${result.regCharge.registeredCharge.carOwnerCharge}" pattern="#,###"/>원
								</c:if>
							</td>
							<th>화주노출요금</th>
							<td>
								<span id="freightOwnerFee" data-charge="${result.regCharge.registeredCharge.frgtOwnerCharge}">
									<c:if test="${!empty result.regCharge.registeredCharge.frgtOwnerCharge}">
										<fmt:formatNumber value="${result.regCharge.registeredCharge.frgtOwnerCharge}" pattern="#,###"/>원
									</c:if>
								</span>
								&nbsp;&nbsp;&nbsp;※ 배송요금(최초확정요금) + 수작업 이동거리 금액
							</td>
						</tr>
						<tr>
							<th>요금추가<br>(수작업 이동거리)</th>
							<td class="additionalCharge">
								<!-- 요금확인중 이후(요금수정 후) => 금액노출 (2022.04.22 수정) -->
								<c:if test="${result.orderStatus ne 'CHARGE_CHECKING'}">
									<fmt:formatNumber value="${result.regCharge.registeredCharge.additionalCharge}" pattern="#,###"/>원
								</c:if>
								<!-- 요금확인중(요금수정 전) => 드롭다운 노출 (2022.04.22 수정) --> 
								<c:if test="${result.orderStatus eq 'CHARGE_CHECKING'}">
									<div class="col-11">
										<div class="row">
											<div class="col-3">
												<select class="form-control form-control-sm" id="addCharge"
													<c:if test="${result.freight.carModel ne 'oneT' && result.freight.carModel ne 'oneDotFourT'
														&& result.freight.carModel ne 'twoDotFiveT' && result.freight.carModel ne 'threeDotFiveT'}">disabled</c:if>>
													<option value="none">없음</option>
													<option value="upper">상</option>
													<option value="medium">중</option>
													<option value="lower">하</option>
													<option value="custom">기타</option>
												</select>
											</div>
											<div class="col-8 d-none">
												<div class="row">
													<div class="col-6">
														<input type="text" class="form-control form-control-sm text-right" id="inputCharge"
															maxlength="6" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)">
													</div>
													<div class="col-2 mt-1 text-left">원</div>
												</div>
											</div>
										</div>
									</div>
								</c:if>
							</td>
							<th></th>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!-- 요금조정 -->
	<div class="tab-pane" id="div-tab02">
		<div class="card-box">
			<h5 class="card-title">등록 요금 정보</h5>
			<div class="table-responsive">
				<table class="table mb-0 basic-table">
					<colgroup>
						<col style="width: 15%;">
						<col style="width: 35%;">
						<col style="width: 15%;">
						<col style="width: 35%;">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">배송요금<br>(예상표준요금)</th>
							<td>
								<c:if test="${!empty result.regCharge.registeredCharge.standardCharge}">
									<fmt:formatNumber value="${result.regCharge.registeredCharge.standardCharge}" pattern="#,###"/>원
								</c:if>
							</td>
							<th>최초 마진요금</th>
							<td>
								<c:if test="${!empty result.regCharge.registeredCharge.marginCharge}">
									<fmt:formatNumber value="${result.regCharge.registeredCharge.marginCharge}" pattern="#,###"/>원
								</c:if>
								<c:if test="${!empty result.regCharge.registeredCharge.marginRate}">
									(${result.regCharge.registeredCharge.marginRate}%)
								</c:if>
							</td>
						</tr>
						<tr>
							<th scope="row">차주노출요금</th>
							<td class="regCharge carOwn" data-charge="${result.regCharge.registeredCharge.carOwnerCharge}">
								<c:if test="${!empty result.regCharge.registeredCharge.carOwnerCharge}">
									<fmt:formatNumber value="${result.regCharge.registeredCharge.carOwnerCharge}" pattern="#,###"/>원
								</c:if>
							</td>
							<th>화주노출요금</th>
							<td class="regCharge frgOwn" data-charge="${result.regCharge.registeredCharge.frgtOwnerCharge}">
								<c:if test="${!empty result.regCharge.registeredCharge.frgtOwnerCharge}">
									<fmt:formatNumber value="${result.regCharge.registeredCharge.frgtOwnerCharge}" pattern="#,###"/>원
								</c:if>
							</td>
						</tr>
						<tr>
							<th>요금추가<br>(수작업 이동거리)</th>
							<td>
								<c:if test="${!empty result.regCharge.registeredCharge.additionalCharge}">
									<fmt:formatNumber value="${result.regCharge.registeredCharge.additionalCharge}" pattern="#,###"/>원
								</c:if>
							</td>
							<th></th>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<div class="card-box charge update">
			<h5 class="card-title" style="display:inline;">수정 요금 정보</h5>
			<div class="table-responsive mt-2">
				<table class="table mb-0 basic-table">
					<colgroup>
						<col style="width: 15%;">
						<col style="width: 35%;">
						<col style="width: 15%;">
						<col style="width: 35%;">
					</colgroup>
					<tbody>
						<tr>
							<th>할증률</th>
							<td>
								<div class="row">
									<div class="col-3">
										<!-- 1회 수정 시, 비활성화 상태로 노출 -->
										<!-- 수동배차가 아닌 일반주문의 경우 배차지연 일때만 활성화 (2022.04.19 수정) -->
										<select class="form-control form-control-sm premiumRate update"
											<c:if test="${result.orderStatus ne 'DELIVERY_REQUESTED' || !empty result.adjustCharge.updateCharge.premiumRate || (mode eq 'order' && result.dispatchDelay ne 'DELAY')}">disabled</c:if>>
											<c:forEach begin="0" end="${result.regCharge.registeredCharge.marginRate}" step="1" var="i">
												<option value="${i}" <c:if test="${i eq result.adjustCharge.updateCharge.premiumRate}">selected</c:if>>${i}%</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</td>
							<th scope="row">수정 마진요금</th>
							<td class="updateCharge update">
								<c:if test="${!empty result.adjustCharge.updateCharge.marginCharge}">
									<fmt:formatNumber value="${result.adjustCharge.updateCharge.marginCharge}" pattern="#,###"/>원
								</c:if>
								<c:if test="${!empty result.adjustCharge.updateCharge.marginRate}">
									(${result.adjustCharge.updateCharge.marginRate}%)
								</c:if>
							</td>
						</tr>
						<tr>
							<th scope="row">차주노출요금<br>(수정요금)</th>
							<td class="updateCharge carOwn">
								<c:if test="${!empty result.adjustCharge.updateCharge.carOwnerCharge}">
									<fmt:formatNumber value="${result.adjustCharge.updateCharge.carOwnerCharge}" pattern="#,###"/>원
								</c:if>
							</td>
							<th>화주노출요금</th>
							<td class="updateCharge frgOwn">
								<c:if test="${!empty result.regCharge.registeredCharge.frgtOwnerCharge}">
									<fmt:formatNumber value="${result.regCharge.registeredCharge.frgtOwnerCharge}" pattern="#,###"/>원
								</c:if>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	
		<!-- 1차 요금조정을 하지 않은 상태일 경우, 비활성화 상태로 노출 / 1차 요금조정 이후에만 활성화 상태로 노출 -->
		<c:if test="${!empty result.adjustCharge.updateCharge}">
			<div class="card-box charge last">
				<h5 class="card-title" style="display:inline;">최종 요금 정보</h5>
				<div class="table-responsive mt-2">
					<table class="table mb-0 basic-table">
						<colgroup>
							<col style="width: 15%;">
							<col style="width: 35%;">
							<col style="width: 15%;">
							<col style="width: 35%;">
						</colgroup>
						<tbody>
							<tr>
								<th>할증률</th>
								<td>
									<div class="row">
										<div class="col-3">
											<!-- 1회 수정 시, 비활성화 상태로 노출 -->
											<!-- 수동배차가 아닌 일반주문의 경우 배차지연 일때만 활성화 (2022.04.19 수정) -->
											<select class="form-control form-control-sm premiumRate last"
												<c:if test="${result.orderStatus ne 'DELIVERY_REQUESTED' || !empty result.adjustCharge.lastCharge.premiumRate || (mode eq 'order' && result.dispatchDelay ne 'DELAY')}">disabled</c:if>>
												<option value="0" disabled selected>선택</option>
												<c:forEach begin="${result.regCharge.registeredCharge.marginRate}" end="50" step="1" var="i">
													<option value="${i}" <c:if test="${i eq result.adjustCharge.lastCharge.premiumRate}">selected</c:if>>${i}%</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</td>
								<th scope="row">수정 마진요금</th>
								<td>0원 (0%)</td>
							</tr>
							<tr>
								<th scope="row">차주노출요금<br>(최종요금)</th>
								<td class="last carown">
									<c:if test="${!empty result.adjustCharge.lastCharge.carOwnerCharge}">
										<fmt:formatNumber value="${result.adjustCharge.lastCharge.carOwnerCharge}" pattern="#,###"/>원
									</c:if>
								</td>
								<th scope="row">화주노출요금<br>(최종요금)</th>
								<td class="last frgown">
									<c:if test="${!empty result.adjustCharge.lastCharge.frgtOwnerCharge}">
										<fmt:formatNumber value="${result.adjustCharge.lastCharge.frgtOwnerCharge}" pattern="#,###"/>원
									</c:if>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</c:if>
		
		<div class="card-box">
			<h5 class="card-title">위약수수료 정보</h5>
			<div class="table-responsive">
				<table class="table mb-0 basic-table">
					<colgroup>
						<col style="width: 15%;">
						<col style="width: auto;">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">대기비(상차지)</th>
							<td>
								<div class="col-11">
									<div class="row">
										<c:if test="${empty result.penaltyFee.loadingWaitingCharge}">
											<div class="col-2">
												<!-- 차주ID 있는 경우에만 활성화 (2022.04.19 수정) -->
												<select class="form-control form-control-sm" id="selectLoadWaitCharge" <c:if test="${empty result.carOwnerInfo.carOwnerId}">disabled</c:if>>
													<option value="none">없음</option>
													<option value="0">2시간 미만</option>
													<option value="1">2시간~4시간 미만</option>
													<option value="2">4시간 이상</option>
												</select>
											</div>
										</c:if>
										<div class="col-2">
											<input type="text" class="form-control form-control-sm text-right" id="loadingWaitCharge" disabled
												value="<c:if test="${!empty result.penaltyFee.loadingWaitingCharge}"><fmt:formatNumber value="${result.penaltyFee.loadingWaitingCharge.ownerSettlementPrice}" pattern="#,###"/>원</c:if>">
										</div>
										<div class="mt-1">※ 차주의 대기시간 선택 시 '대기비'는 자동으로 계산되어 노출됩니다.</div>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">대기비(하차지)</th>
							<td>
								<div class="col-11">
									<div class="row">
										<c:if test="${empty result.penaltyFee.unloadingWaitingCharge}">
											<div class="col-2">
												<!-- 차주ID 있는 경우에만 활성화 (2022.04.19 수정) -->
												<select class="form-control form-control-sm" id="selectUnloadWaitCharge" <c:if test="${empty result.carOwnerInfo.carOwnerId}">disabled</c:if>>
													<option value="none">없음</option>
													<option value="0">2시간 미만</option>
													<option value="1">2시간~4시간 미만</option>
													<option value="2">4시간 이상</option>
												</select>
											</div>
										</c:if>
										<div class="col-2">
											<input type="text" class="form-control form-control-sm text-right" id="unloadingWaitCharge" disabled
												value="<c:if test="${!empty result.penaltyFee.unloadingWaitingCharge}"><fmt:formatNumber value="${result.penaltyFee.unloadingWaitingCharge.ownerSettlementPrice}" pattern="#,###"/>원</c:if>">
										</div>
										<div class="mt-1">※ 차주의 대기시간 선택 시 '대기비'는 자동으로 계산되어 노출됩니다.</div>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">이동비</th>
							<td>
								<div class="col-11">
									<div class="row">
										<div class="col-2">
											<input type="text" class="form-control form-control-sm text-right" id="movingCharge" disabled
												value="<c:if test="${!empty result.penaltyFee.movingCharge}"><fmt:formatNumber value="${result.penaltyFee.movingCharge.ownerSettlementPrice}" pattern="#,###"/>원</c:if>">
										</div>
										<div class="mt-1">※ 화주가 '주문취소' 시 '이동비'는 자동으로 계산되어 노출됩니다.</div>
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!-- 배송정보 -->
	<div class="tab-pane" id="div-tab03">
		<div class="card-box" id="divDispatch" data-carown-id="${result.dispatchInfo.alloCarownIdOrg}" data-carown-type="${result.dispatchInfo.alloCarownInfo.carOwnerType}">
			<h5 class="card-title mb-0">배차 정보</h5>
			<div class="row mb-2">
				<div class="col-12 text-right button-list">
					<c:if test="${result.orderStatus eq 'LOADING_COMPLETED'}">
						<button type="button" class="btn btn-custom02 btn-rounded waves-effect waves-dark" id="btnOrderTracking">배송추적</button>
					</c:if>
					<c:if test="${result.orderStatus eq 'DISPATCH_COMPLETED'}">
						<button type="button" class="btn btn-dark btn-rounded waves-effect waves-dark" id="btnDispatchCancel">배차취소</button>
					</c:if>
					<c:if test="${mode eq 'order'}">
						<c:if test="${(result.orderStatus eq 'DELIVERY_REQUESTED' && result.dispatchDelay eq 'DELAY')
	 							|| result.orderStatus eq 'DISPATCH_COMPLETED' || result.orderStatus eq 'LOADING_COMPLETED'}">
							<button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark" id="btnEmergency">비상배차</button>
						</c:if>
					</c:if>
					<!-- 비상배차 영역 버튼정의 변경(2022.04.09 기준) : 수동배차일 경우 상태 상관없이 고정노출 -->
					<!-- 비상배차 영역 버튼정의 변경(2022.04.13 기준) : 수동배차일 경우 하차완료, 배송취소 제외하고 노출하는 것으로 변경됨 -->
					<c:if test="${mode eq 'manual'}">
						<c:if test="${result.orderStatus ne 'UNLOADING_COMPLETED' && result.orderStatus ne 'ORDER_CANCELED'}">
							<button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark" id="btnEmergency">비상배차</button>
						</c:if>
					</c:if>
				</div>
			</div>
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
							<td>${result.dispatchInfo.alloCarownInfo.carOwnerName}</td>
							<th>전화번호</th>
							<td>${result.dispatchInfo.alloCarownInfo.carOwnerTelephoneNum}</td>
						</tr>
						<tr>
							<th scope="row">이메일주소</th>
							<td>${result.dispatchInfo.alloCarownInfo.carOwnerEmail}</td>
							<th>차량번호</th>
							<td>
								<c:forEach items="${result.dispatchInfo.alloCarownInfo.carList}" var="list">
									${list.carNumber}
								</c:forEach>
							</td>
						</tr>
						<tr>
							<th scope="row">차량정보</th>
							<td>
								<c:forEach items="${result.dispatchInfo.alloCarownInfo.carList}" var="list">
									${list.carModelName}
									<c:if test="${!empty list.carModelName && !empty list.carTypeName}">/</c:if>
									${list.carTypeName}
								</c:forEach>
								<c:forEach items="${result.dispatchInfo.alloCarownInfo.carList}" var="list">
									<c:forEach items="${list.carOptionList}" var="option">
										${option.carOptionName}
									</c:forEach>
								</c:forEach>
							</td>
							<th>배차취소 사유</th>
							<td>${result.allocation.cancelReason}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<div class="card-box <c:if test="${empty result.dispatchInfo.emerCarownIdOrg}">d-none</c:if>" id="divEmergency" data-carown-id="${result.dispatchInfo.emerCarownIdOrg}" data-carown-type="${result.dispatchInfo.emerCarownInfo.carOwnerType}">
			<h5 class="card-title">비상배차 정보</h5>
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
							<td>
								<div class="row">
									<div class="col-5">
										<input type="text" class="form-control form-control-sm" id="emerUserName" value="${result.dispatchInfo.emerCarownInfo.carOwnerName}" disabled>
									</div>
									<div class="col-3">
										<c:if test="${mode eq 'order'}">
											<c:if test="${(result.orderStatus eq 'DELIVERY_REQUESTED' && result.dispatchDelay eq 'DELAY')
						 							|| result.orderStatus eq 'DISPATCH_COMPLETED' || result.orderStatus eq 'LOADING_COMPLETED'}">
												<button type="button" class="btn btn-dark btn-sm waves-effect waves-light" id="searchCarOwner">조회</button>
											</c:if>
										</c:if>
										<c:if test="${mode eq 'manual'}">
											<c:if test="${result.orderStatus ne 'UNLOADING_COMPLETED' && result.orderStatus ne 'ORDER_CANCELED'}">
												<button type="button" class="btn btn-dark btn-sm waves-effect waves-light" id="searchCarOwner">조회</button>
											</c:if>
										</c:if>
									</div>
								</div>
							</td>
							<th>전화번호</th>
							<td id="emerUserPhone">${result.dispatchInfo.emerCarownInfo.carOwnerTelephoneNum}</td>
						</tr>
						<tr>
							<th scope="row">이메일주소</th>
							<td id="emerUserEmail">${result.dispatchInfo.emerCarownInfo.carOwnerEmail}</td>
							<th>차량번호</th>
							<td id="emerUserCarNumber">
								<c:forEach items="${result.dispatchInfo.emerCarownInfo.carList}" var="list">
									${list.carNumber}
								</c:forEach>
							</td>
						</tr>
						<tr>
							<th scope="row">차량정보</th>
							<td colspan="3" id="emerUserCarInfo">
								<c:forEach items="${result.dispatchInfo.emerCarownInfo.carList}" var="list">
									${list.carModelName}
									<c:if test="${!empty list.carModelName && !empty list.carTypeName}">/</c:if>
									${list.carTypeName}
								</c:forEach>
								<c:forEach items="${result.dispatchInfo.emerCarownInfo.carList}" var="list">
									<c:forEach items="${list.carOptionList}" var="option">
										${option.carOptionName}
									</c:forEach>
								</c:forEach>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<div class="card-box">
			<h5 class="card-title">배송 정보</h5>
			<div class="table-responsive normalOrderInfo" data-loaded-info="${result.loadUnloadInfo.loadedDateTime}" data-unloaded-info="${result.loadUnloadInfo.unloadedDateTime}">
				<table class="table mb-0 basic-table">
					<colgroup>
						<col style="width: 10%;">
						<col style="width: 40%;">
						<col style="width: 10%;">
						<col style="width: 40%;">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">상차일시</th>
							<td>
								<div class="row" id="divLoadingDateTime">
									<c:if test="${!empty result.loadUnloadInfo.loadedDateTime}">
										<fmt:formatDate value="${result.loadUnloadInfo.loadedDateTime}" pattern="yyyy.MM.dd HH:mm"/>
									</c:if>
								</div>
								<c:if test="${empty result.loadUnloadInfo.loadedDateTime}">
									<c:if test="${result.orderStatus ne 'UNLOADING_COMPLETED' && result.orderStatus ne 'ORDER_CANCELED'}">
										<button type="button" class="btn btn-dark btn-sm waves-effect waves-light updateOrderInfo" id="btnLoadingComplete">상차완료</button>
									</c:if>
								</c:if>
							</td>
							<th>하차일시</th>
							<td>
								<div class="row" id="divUnloadingDateTime">
									<c:if test="${!empty result.loadUnloadInfo.unloadedDateTime}">
										<fmt:formatDate value="${result.loadUnloadInfo.unloadedDateTime}" pattern="yyyy.MM.dd HH:mm"/>
									</c:if>
								</div>
								<c:if test="${empty result.loadUnloadInfo.unloadedDateTime}">
									<c:if test="${result.orderStatus ne 'UNLOADING_COMPLETED' && result.orderStatus ne 'ORDER_CANCELED'}">
										<button type="button" class="btn btn-dark btn-sm waves-effect waves-light updateOrderInfo" id="btnUnloadingComplete">하차완료</button>
									</c:if>
								</c:if>
							</td>
						</tr>
						<tr>
							<th>이동시간</th>
							<td colspan="3" id="calMovingTime">
								<c:if test="${!empty result.loadUnloadInfo.completedMovingTime}">
									${result.loadUnloadInfo.completedMovingTime}분
								</c:if>
							</td>
						</tr>
						<tr class="<c:if test="${!empty result.loadUnloadInfo.loadedDateTime && !empty result.loadUnloadInfo.unloadedDateTime}">d-none</c:if>">
							<th>첨부파일</th>
                            <td colspan="3">
                            	<div class="attachFile updateTime"></div>
                            </td>
						</tr>
					</tbody>
				</table>
			</div>
			
		</div>
	</div>

	<!-- 이력정보 -->
	<div class="tab-pane" id="div-tab04">
		<div class="card-box">
			<h5 class="card-title">변경내역</h5>
			<div class="table-responsive">
				<table class="table mb-0 basic-table text-center">
		            <thead>
		                <tr role="row">
		                    <th class="sorting">주문상태</th>
		                    <th class="sorting">화주노출요금</th>
		                    <th class="sorting">차주노출요금</th>
		                    <th class="sorting">마진요금</th>
		                    <th class="sorting">요금추가</th>
		                    <th class="sorting">할증률</th>
		                    <th class="sorting">상차지 대기비</th>
	                        <th class="sorting">하차지 대기비</th>
		                    <th class="sorting">이동비</th>
		                    <th class="sorting">메모</th>
		                    <th class="sorting">수정자</th>
		                    <th class="sorting">수정일시</th>
		                </tr>
		            </thead>
					<tbody>
						<c:if test="${empty history.list}">
							<tr>
								<td colspan="12">조회 결과가 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${!empty history.list}">
							<c:forEach items="${history.list}" var="list">
				                <tr role="row">
				                    <td>
										<c:choose>
											<c:when test="${list.orderStatus eq 'CHARGE_CHECKING'}">요금확인중</c:when>
											<c:when test="${list.orderStatus eq 'DELIVERY_REQUESTED'}">배송요청</c:when>
											<c:when test="${list.orderStatus eq 'DISPATCH_COMPLETED'}">배차완료</c:when>
											<c:when test="${list.orderStatus eq 'LOADING_COMPLETED'}">상차완료</c:when>
											<c:when test="${list.orderStatus eq 'UNLOADING_COMPLETED'}">하차완료</c:when>
											<c:when test="${list.orderStatus eq 'ORDER_CANCELED'}">주문취소</c:when>
											<c:otherwise>${list.orderStatus}</c:otherwise>
	                                    </c:choose>
				                    </td> <!-- 주문상태 -->
				                    <td>
				                    	<c:choose>
				                    		<c:when test="${!empty list.freightOwnerCharge}">
				                    			<fmt:formatNumber value="${list.freightOwnerCharge}" pattern="#,###"/>원
				                    		</c:when>
				                    		<c:otherwise>-</c:otherwise>
				                    	</c:choose>
				                    </td> <!-- 화주노출요금 -->
				                    <td>
				                    	<c:choose>
					                    	<c:when test="${!empty list.carOwnerCharge}">
					                    		<fmt:formatNumber value="${list.carOwnerCharge}" pattern="#,###"/>원
					                    	</c:when>
					                    	<c:otherwise>-</c:otherwise>
				                    	</c:choose>
				                    </td> <!-- 차주노출요금 -->
				                    <td>
				                    	<c:choose>
						                    <c:when test="${not empty list.freightOwnerCharge && not empty list.carOwnerCharge}">
							                    <!-- 계산식 적용 : 화주노출요금 - 차주노출요금으로 처리 (2022.04.21) -->
						                    	<fmt:formatNumber value="${list.freightOwnerCharge - list.carOwnerCharge}" pattern="#,###"/>원
						                    </c:when>
					                   		<c:otherwise>-</c:otherwise>
					                    </c:choose>
				                    </td> <!-- 마진요금 -->
				                    <td>
					                    <c:choose>
					                    	<c:when test="${!empty list.charge.additionalCharge}">
					                    		<fmt:formatNumber value="${list.charge.additionalCharge}" pattern="#,###"/>원
					                    	</c:when>
				                    		<c:otherwise>-</c:otherwise>
					                    </c:choose>
				                    </td> <!-- 요금추가 -->
				                    <td>
				                    	<c:choose>
					                    	<c:when test="${not empty list.charge.premiumRate}">
					                    		${list.charge.premiumRate}%
					                    	</c:when>
				                    		<c:otherwise>-</c:otherwise>
				                    	</c:choose>
				                    </td> <!-- 할증률 -->
				                    <td>
				                    	<c:choose>
					                    	<c:when test="${not empty list.context.loadingWaitingCharge}">
					                    		<fmt:formatNumber value="${list.context.loadingWaitingCharge}" pattern="#,###"/>원
					                    	</c:when>
				                    		<c:otherwise>-</c:otherwise>
				                    	</c:choose>
				                    </td><!-- 상차대기비 -->
				                    <td>
				                    	<c:choose>
					                    	<c:when test="${not empty list.context.unloadingWaitingCharge}">
					                    		<fmt:formatNumber value="${list.context.unloadingWaitingCharge}" pattern="#,###"/>원
					                    	</c:when>
				                    		<c:otherwise>-</c:otherwise>
				                    	</c:choose>
				                    </td><!-- 하차대기비 --> 
				                    <td>
				                    	<c:choose>
					                    	<c:when test="${not empty list.movingCharge}">
					                    		<fmt:formatNumber value="${list.movingCharge}" pattern="#,###"/>원
					                    	</c:when>
					                    	<c:otherwise>-</c:otherwise>
				                    	</c:choose>
				                    </td> <!-- 이동비 -->
				                    <td>
				                    	<c:choose>
					                    	<c:when test="${not empty list.actorMemo}">
					                    		${list.actorMemo}
					                    	</c:when>
					                    	<c:otherwise>-</c:otherwise>
				                    	</c:choose>
				                    </td> <!-- 메모 -->
				                    <td>${list.actorId}</td> <!-- 수정자 -->
				                    <td><fmt:formatDate value="${list.updatedAt}" pattern="yyyy.MM.dd HH:mm"/></td> <!-- 수정일시 -->
				                </tr>
			                </c:forEach>
		                </c:if>
					</tbody>
				</table>
			</div>
		</div>
		
		<div class="card-box">
			<h5 class="card-title">VOC 이력</h5>
			<div class="table-responsive">
				<table class="table mb-0 basic-table text-center">
					<colgroup>
						<col style="width: 10%;">
						<col style="width: auto;">
						<col style="width: 10%;">
						<col style="width: 10%;">
						<col style="width: 10%;">
						<col style="width: 10%;">
						<col style="width: 10%;">
					</colgroup>
					<thead>
						<tr>
							<th scope="row">No</th>
							<th>제목</th>
							<th>처리상태</th>
							<th>등록자</th>
							<th>등록일</th>
							<th>답변자</th>
							<th>답변일</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty vocList.vocList}">
							<tr>
								<td colspan="7">조회 결과가 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${!empty vocList.vocList}">
							<c:forEach items="${vocList.vocList}" var="list" varStatus="status">
								<tr>
									<td scope="row">
										${fn:length(vocList.vocList) - status.index}
									</td>
									<td class="text-left"><a class="title-link vocDetail" data-voc-seq="${list.vocSeq}">${list.vocTitle}</a></td>
									<td>${list.vocStatusName}</td>
									<td>${list.vocOwnerId}</td>
									<td><fmt:formatDate value="${list.vocRegisterDate}" pattern="yyyy.MM.dd"/></td>
									<td>
										<c:if test="${empty list.vocAnswerId}">-</c:if>
										${list.vocAnswerId}
									</td>
									<td>
										<c:if test="${empty list.vocAnswerDate}">-</c:if>
										<fmt:formatDate value="${list.vocAnswerDate}" pattern="yyyy.MM.dd"/>
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<div class="button-list text-center">
	<button type="button" class="btn btn-custom02 btn-rounded waves-effect waves-dark" id="btnOrderList">목록</button>
	<c:forEach items="${autUriList}" var="autUriList">	
		<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'U') gt -1}">
			<button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark" id="btnOrderUpdate">저장</button>
		</c:if>
	</c:forEach>
	<!-- 슈퍼관리자 권한을 보유한 계정에서만 마스킹해제 버튼 노출 -->
	<button type="button" class="btn btn-dark btn-rounded waves-effect waves-dark" id="btnUnmasking"
		<c:if test="${authGroupCode ne 'super_admin'}">disabled</c:if>>마스킹 해제<span class="btn-label-right"><i class="fas fa-eye"></i></span>
	</button>
</div>

<!-- Popup -->
<div id="popup_orderTracking"></div> <!-- 배송추적 -->
<div id="popup_carOwnerSearch"></div> <!-- 차주조회 -->
<div id="popup_updateReason"></div> <!-- 변경사유 -->
<div id="popup_cancelReason"></div> <!-- 주문취소사유 -->
<div id="popup_unmaskingReason"></div> <!-- 마스킹해제 사유 -->
<div id="popup_dispatchCancel"></div> <!-- 배차취소 -->
<div id="popup_updateOrderInfo"></div> <!-- 상/하차완료 팝업 -->
<div id="popup_addressSearch"></div> <!-- 주소검색 -->
<div id="popup_emergencyReason"></div> <!-- 비상배차사유 -->

<!-- 배차요청 팝업 : 배차지연의 주문상세 진입 시, 배차요청이 진행중인 경우 노출 (2022.04.22) -->
<div id="popup_dispatchRequested" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">배차요청 알림</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
	            <div class="text-center font-16">
	            	<span class="color-status-wait">[${result.orderNumber}]</span> 화물은 현재 배차요청 중입니다.<br/>배차 진행상태 확인 후 주문정보를 수정하세요.
	            </div>
                <div class="button-list text-center mt-4">
                    <button type="button" class="btn btn-dark width-sm btn-rounded waves-effect waves-dark" data-dismiss="modal">확인</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End page -->


<script>
var chargeCal = false; //표준요금재계산 여부
var dateTimeFlag = false; //상/하차일시 변경 플래그
var addrFlag = false; //주소변경 플래그

$(document).ready(function(){
	//페이지 진입시 스크롤 최상단에 위치
	$(window).scrollTop(0);
	
	//상/하차일시 '분' 직접입력 불가
	$('.flatpickr-minute').prop('readonly', true);
	
	//기본정보 탭 > 요금확인중/배송요청 아닐시 저장버튼 비활성화
	var orderStatus = "${result.orderStatus}";
	if($('.nav-link.active').attr('id') == 'tab01') {
		if(orderStatus == 'CHARGE_CHECKING' || orderStatus == 'DELIVERY_REQUESTED') {
			$('#btnOrderUpdate').prop('disabled', false);
		} else {
			$('#btnOrderUpdate').prop('disabled', true);
		}
	} else {
		$('#btnOrderUpdate').prop('disabled', false);
	}
	
	//비상배차 없을 시 상차완료, 하차완료 버튼 숨김 (2022.04.15)
	if($('#divEmergency').hasClass('d-none')) {
		$('#btnLoadingComplete').addClass('d-none');
		$('#btnUnloadingComplete').addClass('d-none');
	}
	
	//주문상태 결과값 변경(배차요청 제외됨)으로 인하여 팝업 제외처리 (2022.04.12)
	//배차지연의 주문상세 진입 시, 배차요청이 진행중인 경우 노출 > 배차요청 포함된 주문상태 필드 전달받아 팝업 재처리 (2022.04.22)
	if("${result.dispatchDelay}" == "DELAY" && "${result.orderStatusOrg}" == "DISPATCH_REQUESTED") {
		$('#popup_dispatchRequested').modal('show');
	}
	
	//마스킹해제 후 탭 유지 (2022.04.26)
	var tab = data.tab;
	$('#'+tab).click();
});

//전자인수증 다운로드
$('.receiptDownloadBtn').on('click touch', function () {
	if(confirm('인수증을 다운로드하시겠습니까?')) {
		var urlString = "/" + $(this).data('type') + "/" + $(this).data('id');
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/common/receipt/preview'/>" + urlString,
			data : {},
			cache : false,
			async : false,
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
	}
});

//주문취소사유 팝업
$('#orderCancel').on('click', function(){
	$.ajax({
	    type : "POST",
	    url : "<c:url value='/ui/service/order/cancel.popup'/>",
	    data : {},
	    cache : false,
	    async : true,
	    success : function(data, textStatus, XMLHttpRequest) {
			if (hasErrorMap(data, true)) {
				return;
			}
			
			$('#popup_cancelReason').html(data);
			$('#popupCancelReason').modal('show');
	    },
	    error : function(xhr, ajaxOptions, thrownError) {
			if (hasErrorMap(xhr, false)) {
				return;
			}
	    }
	});
});

//상/하차일자 선택
$('#loadingDate, #unloadingDate').flatpickr({
	dateFormat: "Y.m.d",
	onChange : function(selectedDates, dateStr, instance) {
		dateTimeFlag = true;
		chargeCal = false;
	}
});

//상/하차시간 선택
$('#loadingTime, #unloadingTime').flatpickr({
	noCalendar: true,
	enableTime: true,
	minuteIncrement: 30,
	onChange : function(selectedDates, dateStr, instance) {
		dateTimeFlag = true;
		chargeCal = false;
	}
});

//주소검색
$('.searchAddr').on('click', function(){
	var mode = $(this).data('mode');
	
	$.ajax({
	    type : "POST",
	    url : "<c:url value='/ui/service/order/addr/search/'/>" + mode,
	    data : {},
	    cache : false,
	    async : true,
	    success : function(data, textStatus, XMLHttpRequest) {
			if (hasErrorMap(data, true)) {
				return;
			}
			
			$('#popup_addressSearch').html(data);
			$('#addressSearchPopup').modal('show');
	    },
	    error : function(xhr, ajaxOptions, thrownError) {
			if (hasErrorMap(xhr, false)) {
				return;
			}
	    }
	}); 
});

//표준요금 재계산
var recomputeData = {};
$('#calculateCharge').on('click', function(){
	var model = "${result.freight.carModel}";
	var type = "${result.freight.carType}";
	var option = "${result.freight.freightCarOptions}";
	
	if(model==null || model=="" || type==null || type=="") {
		alert("차량 정보를 다시 확인해주세요.");
	} else {
		var carOptions = new Array();
		<c:forEach items="${result.freight.freightCarOptions}" var="list">
			carOptions.push("${list.carOption.carOptionE}");
		</c:forEach>
		var loading = new Date($('#loadingDate').val() + " " + $('#loadingTime').val());
		var unloading = new Date($('#unloadingDate').val() + " " + $('#unloadingTime').val());
		
		recomputeData.orderId = $('#orderDetail').data('order-id');
		recomputeData.carModel = "${result.freight.carModel}";
		recomputeData.carType = "${result.freight.carType}";
		recomputeData.carOptions = carOptions;
		recomputeData.loadingDateTime = loading.getTime();
		recomputeData.unloadingDateTime = unloading.getTime();

		// KT 요청으로 인해 파라미터 추가 (2022.04.19 수정)
		var isUrgentFreight = "${result.freight.isUrgentFreight}";
		if(isUrgentFreight == 'true') {
			recomputeData.urgentFreight = true;
		} else {
			recomputeData.urgentFreight = false;
		}
		
		var handworkType;
		var loadingHandwork = "${result.freight.loadingFreightMethod}";
		var unloadingHandwork = "${result.freight.unloadingFreightMethod}";
		if(loadingHandwork == 'handwork' && unloadingHandwork == 'handwork') {
			handworkType = "atAll";
		} else if(loadingHandwork == 'handwork' && unloadingHandwork != 'handwork') {
			handworkType = "atLoading";
		} else if(loadingHandwork != 'handwork' && unloadingHandwork == 'handwork') {
			handworkType = "atUnloading";
		} else {
			handworkType = "none";
		}
		recomputeData.handworkType = handworkType;
	
		//선택한 주소정보
		var loadingLat = $('.loading.point.lat').val();
		var loadingLon = $('.loading.point.lng').val();
		var loadingPnu = $('.loading.pnu').val();
		var unloadingLat = $('.unloading.point.lat').val();
		var unloadingLon = $('.unloading.point.lng').val();
		var unloadingPnu = $('.unloading.pnu').val();
		
		//주소 변경하지 않은 경우 > 주문상세 진입시 조회해온 현재 입력된 주소정보 사용
		if(loadingLat != '') {
			recomputeData.loadingLat = loadingLat;
		} else {
			recomputeData.loadingLat = $('.addr.loading.lat').val(); //상차지위도
		}
		
		if(loadingLon != '') {
			recomputeData.loadingLon = loadingLon;
		} else {
			recomputeData.loadingLon = $('.addr.loading.lng').val(); //상차지경도
		}
		
		if(loadingPnu != '') {
			recomputeData.loadingPnu = loadingPnu;
		} else {
			recomputeData.loadingPnu = $('.addr.loading.pnu').val(); //상차지pnu
		}
		
		if(unloadingLat != '') {
			recomputeData.unloadingLat = unloadingLat;
		} else {
			recomputeData.unloadingLat = $('.addr.unloading.lat').val(); //하차지위도
		}
		
		if(unloadingLon != '') {
			recomputeData.unloadingLon = unloadingLon;
		} else {
			recomputeData.unloadingLon = $('.addr.unloading.lng').val(); //하차지경도
		}
		
		if(unloadingPnu != '') {
			recomputeData.unloadingPnu = unloadingPnu;
		} else {
			recomputeData.unloadingPnu = $('.addr.unloading.pnu').val(); //하차지pnu
		}
		
		//console.log(recomputeData);
		
		$.ajax({
		    type : "POST",
		    url : "<c:url value='/ui/service/order/recompute'/>",
		    data : recomputeData,
		    cache : false,
		    async : true,
		    success : function(data, textStatus, XMLHttpRequest) {
				//console.log(data);
				
				if(data != null && (data.status == "200" || data.resultCode == "00000")) {
					chargeCal = true; //성공
					//console.log("표준요금 재계산 여부: "+chargeCal);
					
					$('#carOwnerFee').data('charge', data.carownTotalCharge); //차주노출요금 
					$('#freightOwnerFee').data('charge', data.frgownTotalCharge); //화주노출요금
					
					var carownTotalCharge = data.carownTotalCharge;
					var frgownTotalCharge = data.frgownTotalCharge;
					var estimatedDistance = data.estimatedDistance;
					var estimatedDuration = Math.round(data.estimatedDuration / 60); //분으로 치환
					var marginRate = "${result.regCharge.registeredCharge.marginRate}";
					if(marginRate == '') {
						marginRate = 10; //마진율 없을경우 10%로 임시 적용(TODO: 추후 요금정책 완료 후 수정 필요)
					}
					var marginCharge = frgownTotalCharge - carownTotalCharge; //계산식 수정됨에 따라 마진요금 변경됨 (2022.04.20)
					
					//요금재계산 후 차주/화주노출요금에 요금추가 금액 합산 (2022.04.22)
					var orderStatus = "${result.orderStatus}";
					var addCharge = 0;
					if(orderStatus == 'CHARGE_CHECKING') {
						addCharge = getAdditionalCharge(); //요금추가
					} else {
						//배송요청 상태에서 요금재계산 시, 이전에 저장된 요금추가금액 합산하여 금액노출. IPC 확정되지 않아 미적용 (2022.05.11)
						//if("${profiles}" != 'prod') {
							addCharge = $('.additionalCharge').text().trim().replace('원','');
							addCharge = Number(addCharge.replace(',',''));
						//}
					}
					carownTotalCharge += addCharge;
					frgownTotalCharge += addCharge;
					
					$('#carOwnerFee').html(carownTotalCharge.toLocaleString()+'원');
					$('#freightOwnerFee').html(frgownTotalCharge.toLocaleString()+'원');
					$('#deliveryCharge').val((frgownTotalCharge-addCharge).toLocaleString());
					$('#estimatedDistance').html(estimatedDistance+'㎞');
					$('#estimatedDuration').html(estimatedDuration+'분');
					$('#marginCharge').html(marginCharge.toLocaleString()+'원 ('+marginRate+'%)');
				} else if(data.message != null && data.message != "") {
					alert("배송요금이 자동 계산되지 않았습니다.\r\nERROR: "+data.message);
				} else {
					alert("배송요금이 자동 계산되지 않았습니다.");
				}
		    },
		    error : function(xhr, ajaxOptions, thrownError) {
				if (hasErrorMap(xhr, false)) {
					return;
				}
		    }
		});
	}
});

//배송요금(예상표준요금) 수정
$('#deliveryCharge').on('change', function(){
	//금액 수정시 요금추가 다시 선택하도록
	$('#addCharge option').eq(0).prop('selected', true);
	$('#inputCharge').closest('.col-8').addClass('d-none');
	$('#inputCharge').val('');
	
	var standardCharge = $(this).val(); //배송요금(예상표준요금)
	
	var marginRate = "${result.regCharge.registeredCharge.marginRate}"; //마진율
	if(marginRate == '') {
		marginRate = 10; // 마진율 없을경우 10%로 임시 적용(TODO: 추후 요금정책 완료 후 수정 필요)
	}
	var marginCharge = standardCharge * (marginRate/100); //마진요금
	
	var carownCharge = standardCharge - marginCharge; //차주노출요금
	carownCharge = Math.round(carownCharge/1000) * 1000; //차주노출요금: 계산식 수정적용 (2022.04.20)
	
	marginCharge = standardCharge - carownCharge; //마진요금: 계산식 수정적용 (2022.04.20)
	
	var frgownCharge = Number(standardCharge); //화주노출요금
	
	$('#marginCharge').html(marginCharge.toLocaleString()+' ('+marginRate+'%)');
	$('#carOwnerFee').html(carownCharge.toLocaleString()+'원');
	$('#freightOwnerFee').html(frgownCharge.toLocaleString()+'원');
	
	$('#carOwnerFee').data('charge', carownCharge);
	$('#freightOwnerFee').data('charge', frgownCharge);
});

//요금추가 선택
$('#addCharge').on('change', function(){
	if($(this).val() == 'custom') {
		$('#inputCharge').closest('.col-8').removeClass('d-none');
		$('#inputCharge').focus();
	} else {
		$('#inputCharge').closest('.col-8').addClass('d-none');
		$('#inputCharge').val('');
	}
	
	calAddCharge();
});

//요금추가-기타 금액입력
$('#inputCharge').on('change', function(){
	calAddCharge();
});

//요금추가금액 합산
function calAddCharge() {
	var addCharge = getAdditionalCharge(); //요금추가
	var carownCharge = Number($('#carOwnerFee').data('charge')); //차주노출요금 
	var frgownCharge = Number($('#freightOwnerFee').data('charge')); //화주노출요금
	
	$('#carOwnerFee').html((carownCharge+addCharge).toLocaleString()+'원');
	$('#freightOwnerFee').html((frgownCharge+addCharge).toLocaleString()+'원');
}

//할증률 선택
$('.premiumRate').on('change', function(){
	var premiumRate = Number($(this).val()); //할증률
	var deliveryCharge = Number("${result.regCharge.registeredCharge.standardCharge}"); //등록요금_배송요금
	var marginRate = Number("${result.regCharge.registeredCharge.marginRate}"); //등록요금_마진율
	var addCharge = Number("${result.regCharge.registeredCharge.additionalCharge}"); //등록요금_요금추가
	var frgownCharge = $('.regCharge.frgOwn').data('charge'); //등록요금_화주노출요금
	
	//요금정보영역 계산식 변경 (2022.04.20)
	if($(this).hasClass('update')) {
		if($(this).val() == '0') {
			$('.updateCharge.update').html('');
			$('.updateCharge.carOwn').html('');
		} else {
			//수정요금정보
			//계산식 수정반영 (2022.04.20)
			//수정요금_수정마진요금 = (배송요금 * 마진율%) - (배송요금 * 할증률%)
			var updateCharge = (deliveryCharge*(marginRate/100)) - (deliveryCharge*(premiumRate/100));
			
			//수정요금_차주노출요금 = 배송요금 - 수정마진요금 +(추가요금있는경우)
			var carownCharge = deliveryCharge - updateCharge + addCharge;
			carownCharge = Math.round(carownCharge/1000) * 1000;

			updateCharge = frgownCharge - carownCharge;
			
			$('.updateCharge.update').html(updateCharge.toLocaleString()+'원 ('+(marginRate-premiumRate)+'%)');
			$('.updateCharge.carOwn').html(carownCharge.toLocaleString()+'원');
		}
		
		$('.premiumRate.update').data('update-yn', 'Y'); //수정할증률 수정여부
	} else if($(this).hasClass('last')) {
		if($(this).val() == '0') {
			$('.last.carown').html('');
			$('.last.frgown').html('');
		} else {
			//최종요금정보
			//계산식 수정반영 (2022.04.20)
			//최종요금 = 배송요금 + {배송요금 * (할증률-마진율)} +(추가요금있는경우)
			var lastCharge = deliveryCharge + (deliveryCharge*((premiumRate-marginRate)/100)) + addCharge;
			lastCharge = Math.round(lastCharge/1000) * 1000;
			
			$('.last.carown').html(lastCharge.toLocaleString()+'원');
			$('.last.frgown').html(lastCharge.toLocaleString()+'원');
		}
		
		$('.premiumRate.last').data('update-yn', 'Y'); //최종할증률 수정여부
	}
});

//대기시간 선택 시 화면에 대기비 입력
$('#selectLoadWaitCharge, #selectUnloadWaitCharge').on('change', function(){
	$(this).data('update-yn', 'Y'); //대기시간 선택여부
	
	var strCharge = "";
	var id = $(this).attr('id');
	var waitOption = $(this).val();
	var tonType = getCarTonType();
	/*
	tonType
	1: 5톤미만
	2: 15톤미만
	3: 15톤이상
	*/
	
	if(waitOption == 1) {
		// 2시간~4시간 미만
		// 5톤미만 : 4만원, 15톤미만 : 6만원, 15톤이상 : 7만원
		if(tonType == 1) {
			strCharge = "40,000원";
		} else if(tonType == 2) {
			strCharge = "60,000원";
		} else if(tonType == 3) {
			strCharge = "70,000원";
		}
	} else if(waitOption == 2) {
		// 4시간 이상
		// 5톤미만 : 8만원, 15톤미만 : 12만원, 15톤이상 : 14만원
  		if(tonType == 1) {
			strCharge = "80,000원";
		} else if(tonType == 2) {
			strCharge = "120,000원";
		} else if(tonType == 3) {
			strCharge = "140,000원";
		}
	} else if(waitOption == 0) {
		strCharge = "0원";
	} else if(waitOption == 'none') {
		strCharge = "";
	}
	
	if(id == 'selectLoadWaitCharge') {
		$('#loadingWaitCharge').val(strCharge);
	} else if(id == 'selectUnloadWaitCharge') {
		$('#unloadingWaitCharge').val(strCharge);
	}
});

//좌표조회
function getCoordinate() {
	var result;
	
	var deliveryId = $('#orderDetail').data('delivery-id');
	var carOwnerId = "${result.carOwnerInfo.carOwnerIdOrg}";
	
	$.ajax({
		type : "POST",
		url : "<c:url value='/ui/service/order/coordinate'/>",
		data : {
			"deliveryId" : deliveryId,
			"carOwnerId" : carOwnerId
		},
		cache : false,
		async : false,
		success : function(data, textStatus, XMLHttpRequest) {
			//console.log(data);
			
			if(data != null && (data.status == "200" || data.resultCode == "00000")) {
				result = data.coordinate;
			} else if(data.message != null && data.message != "") {
				alert(data.message);
				result = null;
			} else {
				alert('좌표정보 조회 도중 오류가 발생하였습니다.');
				result = null;
			}
		},
		error : function(xhr, ajaxOptions, thrownError) {
			if (hasErrorMap(xhr, false)) {
				return;
			}
		}
	});
	
	return result;
}

//배송추적
$('#btnOrderTracking').on('click', function(){
	//좌표조회 결과값 {time},{lat},{lng},{accuracy},{bearning},{speed}
	var coordinate = getCoordinate();
	if(coordinate != null) {
		var arr = coordinate.split(';');
		//console.log(arr);
		
		//최신 {time} 값
		var sortArr = [];
		for(var i=0; i<arr.length; i++) {
			var time = Number(arr[i].split(',')[0]);
			sortArr.push(time);
		}
		sortArr.sort(function(a, b)  { //내림차순
			return b - a;
		});
		var getLastTime = sortArr[0];
		//console.log(getLastTime);
		
		//최신 {time}값을 통한 좌표값 추출
		var lat;
		var lon;
		for(var i=0; i<arr.length; i++) {
			if(arr[i].includes(getLastTime)) {
				//console.log(arr[i]);
				lat = arr[i].split(',')[1];
				lon = arr[i].split(',')[2];
			}
		}
		
		// 팝업
		var width = 800;
		var height = 750;
	
		// pc화면기준 가운데 위치
		var x = window.screenLeft;
		var y = window.screenTop;
		var w = document.body.clientWidth;
		var h = document.body.clientHeight;
		
		var left = x + (w / 2.1) - (width / 2);
		var top = y + (h / 1.7) - (height / 2);
		
		var loadingAddress = "${result.freight.loadingAddress}";
		var loadingDetailAddress = "${result.freight.loadingDetailAddress}";
		var loadingDateTime= "${result.freight.loadingDateTime}";
		var unloadingAddress = "${result.freight.unloadingAddress}";
		var unloadingDetailAddress = "${result.freight.unloadingDetailAddress}";
		var unloadingDateTime = "${result.freight.unloadingDateTime}";
		
		var param = 'loadingAddress={0}&loadingDetailAddress={1}&loadingDateTime={2}&unloadingAddress={3}&unloadingDetailAddress={4}&unloadingDateTime={5}&lat={6}&lon={7}';
		param = param.format(loadingAddress, loadingDetailAddress, loadingDateTime, unloadingAddress, unloadingDetailAddress, unloadingDateTime, lat, lon);
		//console.log('param url: '+param)
		
		var options = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=no, status=no, resizable=no, titlebar=no, location=no';
		window.open("<c:url value='/ui/service/order/tracking'/>?"+param, "Order Tracking", options);
	}
});

//배차취소 팝업
$('#btnDispatchCancel').on('click', function(){
	var cancelYn = confirm("배차취소를 하시면 주문상태가 [배송요청] 상태로 변경됩니다.\n등록된 배차를 취소하시겠습니까?");
	if(cancelYn) {
		$.ajax({
		    type : "POST",
		    url : "<c:url value='/ui/service/order/dispatch/cancel.popup'/>",
		    data : {},
		    cache : false,
		    async : true,
		    success : function(data, textStatus, XMLHttpRequest) {
				if (hasErrorMap(data, true)) {
					return;
				}
				
				$('#popup_dispatchCancel').html(data);
				$('#dispatchCancelPopup').modal('show');
		    },
		    error : function(xhr, ajaxOptions, thrownError) {
				if (hasErrorMap(xhr, false)) {
					return;
				}
		    }
		});
	}
});

//비상배차 생성
$('#btnEmergency').on('click', function(){
	if(!$('#divEmergency').hasClass('d-none')) {
		alert("비상배차는 최대 1개만 생성 가능합니다.");
	} else {
		$('#searchCarOwner').click();
		$('#divEmergency').removeClass('d-none');
		
		//비상배차 생성 시 상차완료, 하차완료 버튼 추가 (2022.04.15 수정)
		$('#btnLoadingComplete').removeClass('d-none');
		$('#btnUnloadingComplete').removeClass('d-none');
	}
});

//비상배차 차주조회 팝업
$('#searchCarOwner').on('click', function(){
	$.ajax({
	    type : "POST",
	    url : "<c:url value='/ui/service/order/carowner'/>",
	    data : {
	    	"authGroupCode" : "${authGroupCode}",
	    	"mode" : mode.replace('/','')
	    },
	    cache : false,
	    async : true,
	    success : function(data, textStatus, XMLHttpRequest) {
			if (hasErrorMap(data, true)) {
				return;
			}
			
			$('#popup_carOwnerSearch').html(data);
			$('#carOwnerPopup').modal('show');
	    },
	    error : function(xhr, ajaxOptions, thrownError) {
			if (hasErrorMap(xhr, false)) {
				return;
			}
	    }
	}); 
});

//상/하차완료 팝업
$('.updateOrderInfo').on('click', function(){
	
	var mode = $(this).closest('td').prev('th').html();
	if(mode.indexOf('상차') > -1) {
		mode = "loading";
	} else if(mode.indexOf('하차') > -1) {
		mode = "unloading";
	}
	
	$.ajax({
	    type : "POST",
	    url : "<c:url value='/ui/service/order/update.orderinfo/'/>" + mode,
	    data : {
			"freightOwnerType" : "${result.freightOwnerType}"
	    },
	    cache : false,
	    async : true,
	    success : function(data, textStatus, XMLHttpRequest) {
			if (hasErrorMap(data, true)) {
				return;
			}
			
			$('#popup_updateOrderInfo').html(data);
			$('#updateOrderInfoPopup').modal('show');
	    },
	    error : function(xhr, ajaxOptions, thrownError) {
			if (hasErrorMap(xhr, false)) {
				return;
			}
	    }
	}); 
});

//VOC 상세조회
$('.vocDetail').on('click', function(){
	var vocSeq = $(this).data('voc-seq');
	location.href = "<c:url value='/ui/page/help/voc#detail/'/>" + vocSeq;
});

//주문배송 목록 호출 
$('#btnOrderList').on('click', function(){
	var object = data;
	
	if(object == undefined || object == null) {
		routie('list');
	} else {
	    for(var key in object) {
	    	if(key == 'freightRegistStartDatetime' && typeof object[key] == 'object') {
	    		object.freightRegistStartDatetime = object[key].getTime();
	       	 } else if(key == 'freightRegistEndDatetime' && typeof object[key] == 'object') {
	       		object.freightRegistEndDatetime = object[key].getTime();
	       	 } else if(key == 'loadingStartDateTime' && typeof object[key] == 'object') {
	       		object.loadingStartDateTime = object[key].getTime();
	       	 } else if(key == 'loadingEndDateTime' && typeof object[key] == 'object') {
	       		object.loadingEndDateTime = object[key].getTime();
	       	 } else if(key == 'unloadingStartDateTime' && typeof object[key] == 'object') {
	       		object.unloadingStartDateTime = object[key].getTime();
	       	 } else if(key == 'unloadingEndDateTime' && typeof object[key] == 'object') {
	       		object.unloadingEndDateTime = object[key].getTime();
	       	 }
	    }
		
		var queryString = encodeURIComponent(JSON.stringify(object));
		routie('list/' + queryString);
	}
});

//저장 > 변경사유 입력팝업
var saveData = {};
$('#btnOrderUpdate').on('click', function(){

	var flag = true;
	var saveYn = true;
	var flag2 = true; //배송정보 탭(tab03)에서 주문상태에 따라 팝업유형 분기처리(2022.04.11 KT API 변경으로 인한 추가)
	
	//탭 확인
	var mode = $('.nav-link.active').attr('id');
	
	var orderStatus = "${result.orderStatus}";
	var dispatchDelay = "${result.dispatchDelay}";
	
	if(mode == 'tab01') { //기본정보 탭
		//KT요청 - 배송요청 & 지연인 경우에도 표준요금 재계산 alert 뜨도록 처리 (2022.04.26)
		if(orderStatus == 'CHARGE_CHECKING' || (orderStatus == 'DELIVERY_REQUESTED' && dispatchDelay == 'DELAY')) {
			//요금추가-기타 선택시 금액 입력확인
			if($('#addCharge').val() == 'custom' && ($('#inputCharge').val() == '' || $('#inputCharge').val() == '0')) {
				alert("요금추가 금액을 입력해주세요.");
				$('#inputCharge').focus();
				flag = false;
			}
			
			//표준요금재계산 강제 관련 로직 수정 (2022.04.22)
			if((dateTimeFlag || addrFlag) && !chargeCal) {
				//상/하차일시, 상/하차주소 중 하나라도 변경 > 요금재계산 강제함
				//KT요청 - 표준요금 재계산 alert 문구변경 (2022.04.26)
				alert("화면 하단 오른쪽의 '표준요금 재계산' 버튼을 눌러 운임을 재산정/확인 후 '저장'해 주세요.");
				flag = false;
			} else if($('#deliveryCharge').val() == '' || $('#deliveryCharge').val() == '0') {
				//상/하차일시, 상/하차주소 모두 변경하지 않음 > 요금재계산없이 저장가능
				alert("배송요금을 입력해주세요.");
				$('#deliveryCharge').val('');
				$('#deliveryCharge').focus();
				flag = false;
			}
			
			if(flag) {
				saveYn = confirm("저장을 하시면 주문상태가 [배송요청] 상태로 변경됩니다.\n저장하시겠습니까?");
			}
		}
		
		if(flag && saveYn) {
			saveData = {};
			saveData.JSONdata = null;
			saveData.orderId = $('#orderDetail').data('order-id');
			saveData.orderType1 = orderStatus;
			
			//주문수정
			if(orderStatus == 'CHARGE_CHECKING' || orderStatus == 'DELIVERY_REQUESTED') {
				getOrderUpdateData(orderStatus);
			}
		}
	} else if(mode == 'tab02') { //요금조정 탭
		saveData = {};
	
		if($('.card-box.charge.last').is(':visible')) {
			//최종요금정보 영역 visible
			var frgownCharge = Number("${result.regCharge.registeredCharge.frgtOwnerCharge}"); //화주노출요금
			var frgownLastCharge = $('.last.frgown').text().replace('원',''); //화주최종요금
			frgownLastCharge = Number(frgownLastCharge.replace(',',''));
			
			if(frgownCharge > frgownLastCharge) {
				// 화주노출요금 > 화주최종요금일 경우
				alert("화주의 최종 노출금액이 최초의 노출금액보다 작습니다.");
				flag = false;
			}
		}
		
		if(flag) {
			saveData.JSONdata = null;
			var priceAndType = [];
			
			//할증률 수정여부(선택여부)
			var updateRateYn = $('.premiumRate.update').data('update-yn');
			var lastRateYn = $('.premiumRate.last').data('update-yn');
			
			var updateRate = $('.premiumRate.update').val();
			var lastRate = $('.premiumRate.last').val();
			
			//할증률 수정
			saveData.orderId = $('#orderDetail').data('order-id');
			if($('.card-box.charge.last').is(':visible') && lastRateYn == 'Y') {
				//최종요금
				saveData.premiumRate = lastRate;
				saveData.round = 2;
			} else if(!$('.card-box.charge.last').is(':visible') && updateRateYn == 'Y' && updateRate != '0') {
				//수정요금
				saveData.premiumRate = updateRate;
				saveData.round = 1;
			}
			
			//위약수수료(대기비) 수정여부(대기시간 선택여부)
			var loadCharge = $('#selectLoadWaitCharge').data('update-yn');
			var unloadCharge = $('#selectUnloadWaitCharge').data('update-yn');
			
			//위약수수료(대기비) 수정
			saveData.orderNumber = $('#orderDetail').data('order-num');
			saveData.carOwnerId = "${result.carOwnerInfo.carOwnerIdOrg}";
			saveData.freightOwnerId = "${result.freightOwnerInfo.freightOwnerIdOrg}";
			
			//상차지대기비
			if(loadCharge == 'Y') {
				priceAndType.push({loadingWaitingCharge: $('#loadingWaitCharge').val()});	
				saveData.JSONdata = JSON.stringify(priceAndType);
			}
			//하차지대기비
			if(unloadCharge == 'Y') {
				priceAndType.push({unloadingWaitingCharge: $('#unloadingWaitCharge').val()});
				saveData.JSONdata = JSON.stringify(priceAndType);
			}
		}
		
	} else if(mode == 'tab03') { //배송정보 탭
		saveData = {};
		saveData.JSONdata = null;
	
		//비상배차 등록
		saveData.orderId = $('#orderDetail').data('order-id');
		saveData.carOwnerId = $('.emer.carOwnerId').val();
		
		var carOwnerType = $('.emer.carOwnerType').val();
		if(carOwnerType == 'FO_G' || carOwnerType == 'normal') {
			//일반차주
			carOwnerType = "CAR_OWNER";
		} else if(carOwnerType == 'FO_C' || carOwnerType == 'contract') {
			//지입차주
			carOwnerType = "COMMISSIONED_DRIVER";
		}
		saveData.carOwnerType = carOwnerType;
		
		// 이전배차정보(pre~ 파라미터)
		// 배차완료를 포함한 배차완료 이후의 모든 상태: pre~ 파라미터 필수값
		if(orderStatus != 'CHARGE_CHECKING' && orderStatus != 'DELIVERY_REQUESTED') {
			flag2 = false; //배송정보 탭(tab03)에서 주문상태에 따라 팝업유형 분기처리 (2022.04.11 KT API 변경으로 인한 추가)
			
			// 최초배차정보
			var regCarownId = $('#divDispatch').data('carown-id');
			var regCarownType = $('#divDispatch').data('carown-type');
			if(regCarownType == 'FO_G' || regCarownType == 'normal') {
				//일반차주
				regCarownType = "CAR_OWNER";
			} else if(regCarownType == 'FO_C' || regCarownType == 'contract') {
				//지입차주
				regCarownType = "COMMISSIONED_DRIVER";
			}
			
			// 비상배차정보
			var emerCarownId = $('#divEmergency').data('carown-id');
			var emerCarownType = $('#divEmergency').data('carown-type');
			if(emerCarownType == 'FO_G' || emerCarownType == 'normal') {
				//일반차주
				emerCarownType = "CAR_OWNER";
			} else if(emerCarownType == 'FO_C' || emerCarownType == 'contract') {
				//지입차주
				emerCarownType = "COMMISSIONED_DRIVER";
			}
			
			// 이전배차정보(pre~) 파라미터: 현재 배차완료 상태인 배차정보
			// 비상배차 정보가 있는 경우 > 마지막 등록된 비상배차정보
			// 비상배차 정보가 없는 경우 > 최초 등록된 일반배차정보
			if(emerCarownId != '') {
				saveData.preCarOwnerId = emerCarownId;
			} else {
				saveData.preCarOwnerId = regCarownId;
			}
			
			if(emerCarownType != '') {
				saveData.preCarOwnerType = emerCarownType;
			} else {
				saveData.preCarOwnerType = regCarownType;
			}
			
			saveData.preDispatchId = $('#orderDetail').data('dispatch-id');
		}
	}
	
	var selectEmerYn = $('#divEmergency').data('select-emer-yn'); //비상배차 선택여부
	if(selectEmerYn != 'Y' && mode == 'tab03') {
		//기존 등록된 비상배차 정보
		var emerInfo = "${result.dispatchInfo.emerCarownInfo}";
		
		if(emerInfo == null || emerInfo == '') {
			// 등록된 비상배차 정보가 없고, 비상배차 선택 안한경우
			alert("비상배차 등록을 먼저 진행해주세요.");
		} else {
			var loadCompleted = $('#divLoadingDateTime').data('completed'); //상차완료정보 입력여부
			var loadedInfo = $('.normalOrderInfo').data('loaded-info'); //기존에 등록한 상차완료 정보
			
			var unloadCompleted = $('#divUnloadingDateTime').data('completed'); //하차완료정보 입력여부
			var unloadedInfo = $('.normalOrderInfo').data('unloaded-info'); //기존에 등록한 하차완료 정보
			
			if(loadCompleted == 'Y' && (loadedInfo == null || loadedInfo == '')) {
				// 상차할 정보가 있고 상차완료가 안된상태 >> 상차완료
				saveLoadCompleted();
			}
			
			if(loadCompleted != 'Y' && (loadedInfo == null || loadedInfo == '') && unloadCompleted == 'Y') {
				// 상차할 정보가 없고, 상차완료가 안됐으며 하차할 정보만 있는상태
				alert("상차완료를 먼저 진행해주세요.");
			}
			
			if((loadedInfo != null && loadedInfo != '') && unloadCompleted == 'Y' && (unloadedInfo == null || unloadedInfo == '')) {
				// 상차완료가 됐으며, 하차할 정보가 있는상태 >> 하차완료
				saveUnloadCompleted();
			} 
		}
	} else {
		if(flag && saveYn && flag2) {
			// 변경사유입력 팝업
			$.ajax({
			    type : "POST",
			    url : "<c:url value='/ui/service/common/popup/reason'/>",
			    data : {},
			    cache : false,
			    async : true,
			    success : function(data, textStatus, XMLHttpRequest) {
					if (hasErrorMap(data, true)) {
						return;
					}
					
					$('#popup_updateReason').html(data);
					$('#popup_updateReason').find('#btnUpdate').prop('disabled', true).css('cursor', 'default');
					$('#popupUpdateReason').modal('show');
			    },
			    error : function(xhr, ajaxOptions, thrownError) {
					if (hasErrorMap(xhr, false)) {
						return;
					}
			    }
			}); 
		} else if(flag && saveYn && !flag2) {
			// 비상배차등록사유 팝업(배송정보 탭)
			$.ajax({
			    type : "POST",
			    url : "<c:url value='/ui/service/order/emer/reason.popup'/>",
			    data : {},
			    cache : false,
			    async : true,
			    success : function(data, textStatus, XMLHttpRequest) {
					if (hasErrorMap(data, true)) {
						return;
					}
					
					$('#popup_emergencyReason').html(data);
					$('#emergencyReasonPopup').modal('show');
			    },
			    error : function(xhr, ajaxOptions, thrownError) {
					if (hasErrorMap(xhr, false)) {
						return;
					}
			    }
			});
		}
	}
});

function getOrderUpdateData(orderStatus) {
	//상차정보
	var loading = new Date($('#loadingDate').val() + " " + $('#loadingTime').val());
	saveData.loadingDateTime = loading.getTime(); //상차일시
	saveData.loadingAddress = $('#loadingAddr').val(); //상차지기본주소
	saveData.loadingDetailAddress = $('#loadingDetailAddr').val(); //상차지상세주소
	
	//선택한 상차지주소 정보
	var loadingLat = $('.loading.point.lat').val();
	var loadingLon = $('.loading.point.lng').val();
	var loadingPnu = $('.loading.pnu').val();
	var loadingRbu = $('.loading.rbu').val();
	var loadingZipCode = $('.loading.post').val();
	
	//주소 변경하지 않은 경우 > 주문상세 진입시 조회해온 현재 입력된 주소정보 사용
	if(loadingLat != '') {
		saveData.loadingLat = loadingLat;
	} else {
		saveData.loadingLat = $('.addr.loading.lat').val(); //상차지위도
	}
	
	if(loadingLon != '') {
		saveData.loadingLon = loadingLon;
	} else {
		saveData.loadingLon = $('.addr.loading.lng').val(); //상차지경도
	}
	
	if(loadingPnu != '') {
		saveData.loadingPnu = loadingPnu;
	} else {
		saveData.loadingPnu = $('.addr.loading.pnu').val(); //상차지pnu
	}
	
	if(loadingRbu != '') {
		saveData.loadingRbu = loadingRbu;
	} else {
		saveData.loadingRbu = $('.addr.loading.rbu').val(); //상차지rbu
	}
	
	if(loadingZipCode != '') {
		saveData.loadingZipCode = loadingZipCode;
	} else {
		saveData.loadingZipCode = $('.addr.loading.post').val(); //상차지우편번호
	}

	//하차정보
	var unloading = new Date($('#unloadingDate').val() + " " + $('#unloadingTime').val());
	saveData.unloadingDateTime = unloading.getTime(); //하차일시
	saveData.unloadingAddress = $('#unloadingAddr').val(); //하차지기본주소
	saveData.unloadingDetailAddress = $('#unloadingDetailAddr').val(); //하차지상세주소
	
	//선택한 하차지주소 정보
	var unloadingLat = $('.unloading.point.lat').val();
	var unloadingLon = $('.unloading.point.lng').val();
	var unloadingPnu = $('.unloading.pnu').val();
	var unloadingRbu = $('.unloading.rbu').val();
	var unloadingZipCode = $('.unloading.post').val();
	
	//주소 변경하지 않은 경우 > 주문상세 진입시 조회해온 현재 입력된 주소정보 사용
	if(unloadingLat != '') {
		saveData.unloadingLat = unloadingLat;
	} else {
		saveData.unloadingLat = $('.addr.unloading.lat').val(); //하차지위도
	}
	
	if(unloadingLon != '') {
		saveData.unloadingLon = unloadingLon;
	} else {
		saveData.unloadingLon = $('.addr.unloading.lng').val(); //하차지경도
	}
	
	if(unloadingPnu != '') {
		saveData.unloadingPnu = unloadingPnu;
	} else {
		saveData.unloadingPnu = $('.addr.unloading.pnu').val(); //하차지pnu
	}
	
	if(unloadingRbu != '') {
		saveData.unloadingRbu = unloadingRbu;
	} else {
		saveData.unloadingRbu = $('.addr.unloading.rbu').val(); //하차지rbu
	}
	
	if(unloadingZipCode != '') {
		saveData.unloadingZipCode = unloadingZipCode;
	} else {
		saveData.unloadingZipCode = $('.addr.unloading.post').val(); ; //하차지우편번호
	}
	
	saveData.standardCharge = Number($('#deliveryCharge').val().replace(',','')); //화주최초요금(화주예상요금)
	
	//등록요금수정
	if(orderStatus == 'CHARGE_CHECKING') {
		var chargeType = $('#addCharge').val();
		saveData.additionalChargeType = chargeType; //요금추가타입
		if(chargeType == 'custom') {
			saveData.additionalCharge = getAdditionalCharge(); //요금추가타입 '기타'인 경우만 요금추가금액 전송
		}
	} else if(orderStatus == 'DELIVERY_REQUESTED') {
		//배송요청 상태에서 주문수정 시, 이전에 저장된 요금추가금액 전송. IPC 확정되지 않아 미적용 (2022.05.11)
		//if("${profiles}" != 'prod') {
			var addCharge = $('.additionalCharge').text().trim().replace('원','');
			addCharge = Number(addCharge.replace(',',''));
			if(addCharge != 0) {
				saveData.additionalCharge = addCharge;
				//additionalChargeType = 상/중/하/기타 정보를 알 수 없다면, 요금 추가 정보가 있을 때 additionalChargeType = 기타(custom)로 전송 (2022.05.26)
				saveData.additionalChargeType = 'custom';
			}
		//}
	}
}

//변경사유 미입력시 저장버튼 비활성화
$('#popup_updateReason').on('keyup', '#updateReason', function(){
	var reason = $('#popup_updateReason').find('#updateReason').val();

	if(reason != '') {
		$('#popup_updateReason').find('#btnUpdate').prop('disabled', false).css('cursor', 'pointer');
	} else {
		$('#popup_updateReason').find('#btnUpdate').prop('disabled', true).css('cursor', 'default');
	}
});

//변경사유 저장
$('#popup_updateReason').on('click', '#btnUpdate', function(){
	if(confirm("변경하신 사항을 저장하시겠습니까?")) {
		saveData.actorMemo = $('#popupUpdateReason #updateReason').val();
		updateOrder();
	}
});

function updateOrder() {
	//탭 확인
	var mode = $('.nav-link.active').attr('id');
	//console.log(mode);
	//console.log(saveData);
	
	$.ajax({
		type : "POST",
		url : "<c:url value='/ui/service/order/update/'/>" + mode,
		data : saveData,
		cache : false,
		async : true,
		traditional: true,
		success : function(data, textStatus, XMLHttpRequest) {
			if (hasErrorMap(data, true)) {
				return;
			}
			//console.log(data);
			
			if(mode == 'tab01') {
				//기본정보
				//주문수정(상하차지, 등록요금)
				if(data.updateOrder != null) {
					if((data.updateOrder.status == "200" || data.updateOrder.resultCode == "00000") && !alert("주문수정이 완료되었습니다.")) {
						location.reload();
					} else if(data.updateOrder.message != null && data.updateOrder.message != "") {
						alert('주문수정 도중 오류가 발생하였습니다.\r\nERROR: '+data.updateOrder.message);
					} else {
						alert('주문수정 도중 오류가 발생하였습니다.');
					}
				}
			} else if(mode == 'tab02') {
				var penaltyReload = false;
				var premiumReload = false;
				
				//요금조정
				//위약수수료 수정
				if(data.penaltyFee != null) {
					if(data.penaltyFee.resultCode == '00000') {
						alert('위약수수료 수정에 성공하였습니다.');
						penaltyReload = true;
					} else if(data.penaltyFee.resultCode != '00000' && data.penaltyFee.resultMsg != null && data.penaltyFee.resultMsg != "") {
						alert('위약수수료 수정 도중 오류가 발생하였습니다.\r\nERROR: '+data.penaltyFee.resultMsg);
					} else if(data.penaltyFee.status != null || data.penaltyFee.status != "") {
						alert('위약수수료 수정 도중 오류가 발생하였습니다.\r\nERROR: '+data.penaltyFee.status);
					}
				}
				
				//할증률 수정
				if(data.premiumRate != null) {
					if(data.premiumRate.status == "200" || data.premiumRate.resultCode == "00000") {
						alert("할증률 수정이 완료되었습니다.");
						premiumReload = true;
					} else if(data.premiumRate.message != null && data.premiumRate.message != "") {
						alert('할증률 수정 도중 오류가 발생하였습니다.\r\nERROR: '+data.premiumRate.message);
					} else {
						alert('할증률 수정 도중 오류가 발생하였습니다.');
					}
				}
				
				if(penaltyReload || premiumReload) {
					location.reload();
				}
				
			} else if(mode == 'tab03') {
				//비상배차 등록
				if((data.insertEmerDispatch.status == "200" || data.insertEmerDispatch.resultCode == "00000")
						&& data.insertEmerDispatch.newDeliveryId != '' && !alert("비상배차 등록이 완료되었습니다.")) {
					$('#orderDetail').data('delivery-id', data.insertEmerDispatch.newDeliveryId);
					
					var loadCompleted = $('#divLoadingDateTime').data('completed'); //상차완료정보 입력여부
					var loadedInfo = $('.normalOrderInfo').data('loaded-info'); //기존에 등록한 상차완료 정보
					
					//상차완료
					if(loadCompleted == 'Y' && (loadedInfo == null || loadedInfo == '')) {
						saveLoadCompleted();
					} else {
						location.reload();
					}
				} else if(data.insertEmerDispatch.message != null && data.insertEmerDispatch.message != "") {
					alert('비상배차 등록 도중 오류가 발생하였습니다.\r\nERROR: '+data.insertEmerDispatch.message);
				} else if(data.insertEmerDispatch.newDeliveryId == null || data.insertEmerDispatch.newDeliveryId == '') {
					//비상배차 등록성공 후 변경된 deliveryId 즉시조회되지 않을 경우 에러처리 (2022.05.19)
					alert('배송ID가 조회되지 않습니다.');
				} else {
					alert('비상배차 등록 도중 오류가 발생하였습니다.');
				}
			}				
		},
		error : function(xhr, ajaxOptions, thrownError) {
			if (hasErrorMap(xhr, false)) {
				return;
			}
		}
	});
}

//상차완료
var loadedData = new FormData();
function saveLoadCompleted() {
	//상차정보 저장
	var carOwnerId;
	var loadingTime;
	
	var selectEmerYn = $('#divEmergency').data('select-emer-yn'); //비상배차 선택여부
	if(selectEmerYn == 'Y') {
		carOwnerId = $('.emer.carOwnerId').val();
	} else {
		carOwnerId = "${result.shipment.carOwnerId}";
	}
	
	var loadingStr = $('#divLoadingDateTime').text();
	if(loadingStr != '') {
		loadingTime = new Date(loadingStr).getTime();
	}
	
	var loadReq = {
		"carOwnerId": carOwnerId,
	    "completed": loadingTime
	}
	loadedData.append('deliveryId', $('#orderDetail').data('delivery-id'));
	loadedData.append('request', JSON.stringify(loadReq));
	
	//API 분리 관련 추가수정 > 첨부파일 있을경우 form-data, 없을경우 json data 전송 (2022.05.18)
	if($('.file-name.loading').length == 0) {
		//첨부파일 X
		loadCompletedWithoutSign(loadReq);
	} else {
		//첨부파일 O
		loadCompletedWithSign();
	}

// 	for (var key of loadedData.keys()) {
// 	  console.log('key: '+key);
// 	}
// 	for (var value of loadedData.values()) {
// 	  console.log(value);
// 	}
}

//하차완료
var unloadedData = new FormData();
function saveUnloadCompleted() {
	//하차정보 저장
	var carOwnerId;
	var unloadingTime;
	
	var selectEmerYn = $('#divEmergency').data('select-emer-yn'); //비상배차 선택여부
	if(selectEmerYn == 'Y') {
		carOwnerId = $('.emer.carOwnerId').val();
	} else {
		carOwnerId = "${result.shipment.carOwnerId}";
	}
	
	var unloadingStr = $('#divUnloadingDateTime').text();
	if(unloadingStr != '') {
		unloadingTime = new Date(unloadingStr).getTime();
	}
	
	var unloadReq = {
		"carOwnerId": carOwnerId,
	    "completed": unloadingTime
	}
	unloadedData.append('deliveryId', $('#orderDetail').data('delivery-id'));
	unloadedData.append('request', JSON.stringify(unloadReq));
	
	//API 분리 관련 추가수정 > 첨부파일 있을경우 form-data, 없을경우 json data 전송 (2022.05.18)
	if($('.file-name.unloading').length == 0) {
		//첨부파일 X
		unloadCompletedWithoutSign(unloadReq);
	} else {
		//첨부파일 O
		unloadCompletedWithSign();
	}

// 	for (var key of unloadedData.keys()) {
// 	  console.log('key: '+key);
// 	}
// 	for (var value of unloadedData.values()) {
// 	  console.log(value);
// 	}
}

//상차완료 - 첨부파일 O
function loadCompletedWithSign() {
	$.ajax({
		type : "POST",
		url : "<c:url value='/ui/service/order/update.loadunload/load'/>",
		data : loadedData,
		cache : false,
		async : true,
		enctype: 'multipart/form-data',
		processData: false,
		contentType: false,
		success : function(data, textStatus, XMLHttpRequest) {
			//console.log(data.loadCompleted);
			
			if(data.loadCompleted != null) {
				if((data.loadCompleted.status == "200" || data.loadCompleted.resultCode == "00000") && !alert("상차완료 저장에 성공하였습니다.")) {
					var unloadCompleted = $('#divUnloadingDateTime').data('completed'); //상차완료정보 입력여부
					var unloadedInfo = $('.normalOrderInfo').data('unloaded-info'); //기존에 등록한 하차완료 정보
					
					//하차완료
					if(unloadCompleted == 'Y' && (unloadedInfo == null || unloadedInfo == '')) {
						saveUnloadCompleted();
					} else {
						location.reload();
					}
				} else if(data.loadCompleted.resultCode == "00001") {
					alert("파일을 업로드할 수 없습니다.\r\n10MB 이내의 PNG 파일만 첨부할 수 있습니다.");
				} else {
					if(data.loadCompleted.message != null && data.loadCompleted.message != "") {
						alert('상차완료 도중 오류가 발생하였습니다.\r\nERROR: '+data.loadCompleted.message);
					} else {
						alert('상차완료 도중 오류가 발생하였습니다.');
					}
				}
			}
		},
		error : function(xhr, ajaxOptions, thrownError) {
			if (hasErrorMap(xhr, false)) {
				return;
			}
		}
	});
}

//상차완료 - 첨부파일 X
function loadCompletedWithoutSign(_loadReq) {
	_loadReq.deliveryId = $('#orderDetail').data('delivery-id');
	
	$.ajax({
		type : "POST",
		url : "<c:url value='/ui/service/order/update.loadunload/load'/>",
		data : _loadReq,
		cache : false,
		async : true,
		success : function(data, textStatus, XMLHttpRequest) {
			//console.log(data.loadCompleted);
			
			if(data.loadCompleted != null) {
				if((data.loadCompleted.status == "200" || data.loadCompleted.resultCode == "00000") && !alert("상차완료 저장에 성공하였습니다.")) {
					var unloadCompleted = $('#divUnloadingDateTime').data('completed'); //상차완료정보 입력여부
					var unloadedInfo = $('.normalOrderInfo').data('unloaded-info'); //기존에 등록한 하차완료 정보
					
					//하차완료
					if(unloadCompleted == 'Y' && (unloadedInfo == null || unloadedInfo == '')) {
						saveUnloadCompleted();
					} else {
						location.reload();
					}
				} else {
					if(data.loadCompleted.message != null && data.loadCompleted.message != "") {
						alert('상차완료 도중 오류가 발생하였습니다.\r\nERROR: '+data.loadCompleted.message);
					} else {
						alert('상차완료 도중 오류가 발생하였습니다.');
					}
				}
			}
		},
		error : function(xhr, ajaxOptions, thrownError) {
			if (hasErrorMap(xhr, false)) {
				return;
			}
		}
	});
}

//하차완료 - 첨부파일 O
function unloadCompletedWithSign() {
	$.ajax({
		type : "POST",
		url : "<c:url value='/ui/service/order/update.loadunload/unload'/>",
		data : unloadedData,
		cache : false,
		async : true,
		enctype: 'multipart/form-data',
		processData: false,
		contentType: false,
		success : function(data, textStatus, XMLHttpRequest) {
			//console.log(data.unloadCompleted);
			
			if(data.unloadCompleted != null) {
				if(data.unloadCompleted.status == "200" || data.unloadCompleted.resultCode == "00000") {
					if(!alert("하차완료 저장에 성공하였습니다.")) {
						location.reload();
					}
				} else if(data.unloadCompleted.resultCode == "00001") {
					alert("파일을 업로드할 수 없습니다.\r\n10MB 이내의 PNG 파일만 첨부할 수 있습니다.");
				} else {
					if(data.unloadCompleted.message != null && data.unloadCompleted.message != "") {
						alert('하차완료 도중 오류가 발생하였습니다.\r\nERROR: '+data.unloadCompleted.message);
					} else {
						alert('하차완료 도중 오류가 발생하였습니다.');
					}
				}
			}
		},
		error : function(xhr, ajaxOptions, thrownError) {
			if (hasErrorMap(xhr, false)) {
				return;
			}
		}
	});
}

//하차완료 - 첨부파일 X
function unloadCompletedWithoutSign(_unloadReq) {
	_unloadReq.deliveryId = $('#orderDetail').data('delivery-id');
	
	$.ajax({
		type : "POST",
		url : "<c:url value='/ui/service/order/update.loadunload/unload'/>",
		data : _unloadReq,
		cache : false,
		async : true,
		success : function(data, textStatus, XMLHttpRequest) {
			//console.log(data.unloadCompleted);
			
			if(data.unloadCompleted != null) {
				if(data.unloadCompleted.status == "200" || data.unloadCompleted.resultCode == "00000") {
					if(!alert("하차완료 저장에 성공하였습니다.")) {
						location.reload();
					}
				} else {
					if(data.unloadCompleted.message != null && data.unloadCompleted.message != "") {
						alert('하차완료 도중 오류가 발생하였습니다.\r\nERROR: '+data.unloadCompleted.message);
					} else {
						alert('하차완료 도중 오류가 발생하였습니다.');
					}
				}
			}
		},
		error : function(xhr, ajaxOptions, thrownError) {
			if (hasErrorMap(xhr, false)) {
				return;
			}
		}
	});
}

//마스킹해제 팝업
$('#btnUnmasking').on('click', function(){
	$.ajax({
	    type : "POST",
	    url : "<c:url value='/ui/service/common/popup/reason.unmasking'/>",
	    data : {
	    	"maskingHistoryType" : "orderInfo"
	    },
	    cache : false,
	    async : true,
	    success : function(data, textStatus, XMLHttpRequest) {
			if (hasErrorMap(data, true)) {
				return;
			}
			
			$('#popup_unmaskingReason').html(data);
			$('#popupUnmaskingReason').modal('show');
	    },
	    error : function(xhr, ajaxOptions, thrownError) {
			if (hasErrorMap(xhr, false)) {
				return;
			}
	    }
	}); 
});

//마스킹해제사유 등록
$('#popup_unmaskingReason').on('click', '#popupUnmaskingReason #unmaskingSave', function(e){
	var type = $('#popupUnmaskingReason').data('param_type');
	var reason =  $('#unmaskingReason').val();
	
	if(reason == '' || reason.trim() == '') {
		alert("마스킹 해제 사유를 입력해주세요.");
	} else {
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/common/unmasking'/>",
			data : {
				"maskingHistoryType" : type
				, "maskingHistoryReason" : reason
			},
			cache : false,
			async : true,
			success : function(result, textStatus, XMLHttpRequest) {
				if (hasErrorMap(result, true)) {
					return;
				}
				
				//console.log(result);
		    	if(result.error != null) {
					alert('마스킹해제 중 오류가 발생하였습니다.\r\nERROR: '+result.error);
				} else if(result.resultCode == null) {
					alert('마스킹해제 중 오류가 발생하였습니다.\r\nERROR: '+result.code);
				} else if(result.resultCode == '00000') {
					data.tab = $('.nav-link.active').attr('id'); //마스킹해제 후 탭 유지 (2022.04.26)
					data.maskingYn = 'N';
					$('#popupUnmaskingReason').modal('hide');	
	 				$('.modal-backdrop').remove();
	 				
					var orderId = $('#orderDetail').data('order-id');
	 				loadDetail(orderId);
				} else if(result.resultCode == '00001') {
					alert(result.resultMsg);
					$('#unmaskingReason').focus();
				} else {
					alert('마스킹해제 중 오류가 발생하였습니다.\r\nERROR: '+result.resultMsg);
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if (hasErrorMap(xhr, false)) {
					return;
				}
			}
		});
	}
});

//금액입력 천자리콤마
$('#deliveryCharge, #inputCharge').on('change', function() {
	$(this).val(Number($(this).val()).comma());
});

//탭별 하단버튼 제어
$('.nav-item').on('click', function(){
	//기본정보 탭 > 요금확인중/배송요청 아닐시 저장버튼 비활성화
	if($(this).children().attr('id') == 'tab01') {
		var orderStatus = "${result.orderStatus}";
		if(orderStatus == 'CHARGE_CHECKING' || orderStatus == 'DELIVERY_REQUESTED') {
			$('#btnOrderUpdate').prop('disabled', false);
		} else {
			$('#btnOrderUpdate').prop('disabled', true);
		}
	} else {
		$('#btnOrderUpdate').prop('disabled', false);
	}
	
	//요금조정 탭 > 마스킹해제 버튼 숨김
	if($(this).children().attr('id') == 'tab02') {
		$('#btnUnmasking').addClass('d-none');
	} else {
		$('#btnUnmasking').removeClass('d-none');
	}
	
	//이력정보 탭 > 저장 버튼 숨김
	if($(this).children().attr('id') == 'tab04') {
		$('#btnOrderUpdate').addClass('d-none');
	} else {
		$('#btnOrderUpdate').removeClass('d-none');
	}
});

//요금추가금액 return
function getAdditionalCharge() {
	var addCharge = 0;
	
	var carModel = "${result.freight.carModel}";
	var addChargeType = $('#addCharge').val();
	
	if(carModel == 'oneT' || carModel == 'oneDotFourT') {
		switch(addChargeType) {
			case 'upper': //상
				addCharge = 20000;
				break;
			case 'medium': //중
				addCharge = 15000;
				break;
			case 'lower': //하
				addCharge = 10000;
				break;
			case 'custom': //기타
				addCharge = Number($('#inputCharge').val().replace(',',''));
				break;
			default:
				addCharge = 0;
				break;
		}
	} else if(carModel == 'twoDotFiveT' || carModel == 'threeDotFiveT') {
		switch(addChargeType) {
			case 'upper': //상
				addCharge = 25000;
				break;
			case 'medium': //중
				addCharge = 20000;
				break;
			case 'lower': //하
				addCharge = 15000;
				break;
			case 'custom': //기타
				addCharge = Number($('#inputCharge').val().replace(',',''));
				break;
			default:
				addCharge = 0;
				break;
		}
	}
	
	return addCharge;
}

//차량톤수 return
function getCarTonType() {
	var carModel = "${result.freight.carModel}";
	var carTonType = 0;
	
	switch(carModel) {
		case 'oneT':
		case 'oneDotFourT':
		case 'twoDotFiveT':
		case 'threeDotFiveT':
			// 5톤미만
			carTonType = 1;
			break;
		case 'fiveT':
		case 'eightT':
		case 'nineDotFiveT':
		case 'elevT':
			// 15톤미만
			carTonType = 2;
			break;
		case 'fifteenT':
		case 'eighteenT':
		case 'twentyTwoT':
		case 'twentyFiveT':
			// 15톤이상
			carTonType = 3;
			break;
		default:
			carTonType = 0;
			break;
	}
	
	return carTonType;
}

// 이력정보 에러 alert
$('#tab04').on('click', function(){
	<c:if test="${empty vocList.resultCode}">
		alert("VOC 이력 조회 중 오류가 발생하였습니다.\r\nERROR: ${vocList}");
	</c:if>
	<c:if test="${not empty vocList.resultCode and vocList.resultCode ne '00000'}">
		alert("VOC 이력 조회 중 오류가 발생하였습니다.\r\nERROR: ${vocList.resultMsg}");
	</c:if>
});
</script>
