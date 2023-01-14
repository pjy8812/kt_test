<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="card-box">
	<h5 class="card-title">
		조회결과 (총 
		<c:choose>
			<c:when test="${empty result.pageTot}">0</c:when>
			<c:otherwise><fmt:formatNumber value="${result.pageTot}" pattern="#,###"/></c:otherwise>
		</c:choose>
		건)
	</h5>
	<div class="row">
		<div class="col-9">
			<c:forEach items="${autUriList}" var="autUriList">	
				<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'C') gt -1}">
					<button type="button" class="btn btn-custom03 btn-rounded waves-effect waves-dark" id="excelUpload">주문내역업로드</button>
				</c:if>
			</c:forEach>
			<button type="button" class="btn btn-custom03 btn-rounded waves-effect waves-dark ml-1" id="excelDownload">엑셀다운로드</button>
		</div>
		<div class="col-3 text-right">
			<div class="form-group row mb-2">
				<div class="col-12">
					<div class="row">
						<div class="col-6"></div> <!-- 아래 정렬(sortBy) 영역 노출할 시 해당 태그 삭제 필요 -->
						<div class="col-6">
							<select class="form-control" id="countList">
								<option value="10" <c:if test="${vo.pageCnt eq 10}">selected</c:if>>10개씩 보기</option>
								<option value="20" <c:if test="${vo.pageCnt eq 20}">selected</c:if>>20개씩 보기</option>
								<option value="50" <c:if test="${vo.pageCnt eq 50}">selected</c:if>>50개씩 보기</option>
							</select>
						</div>
						<div class="col-6 d-none">
							<select class="form-control" id="sortBy">
								<option value="111">최근등록순</option>
								<option value="222">화주명(오름)</option>
								<option value="333">화주명(내림)</option>
							</select>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-12">
			<div class="scroll-table-wrap">
				<div class="scroll-table-box">
					<table class="table dt-responsive nowrap dataTable no-footer dtr-inline text-center" role="grid">
						<thead>
							<tr role="row">
								<th class="sorting_asc">No</th>
								<th class="sorting">주문번호</th>
								<th class="sorting">주문상태1</th>
								<!-- Begin 수동배차 제외항목 -->
								<c:if test="${mode ne 'manual'}">
									<th class="sorting">주문상태2</th>
									<th class="sorting">배차지연</th>
								</c:if>
								<!-- End 수동배차 제외항목 -->
								<th class="sorting">화물구분</th>
								<th class="sorting">계약구분</th>
								<th class="sorting">화주ID</th>
								<th class="sorting">화주명</th>
								<th class="sorting">배송요청자</th>
								<th class="sorting">상차지</th>
								<th class="sorting">상차일시</th>
								<th class="sorting">하차지</th>
								<th class="sorting">하차일시</th>
								<th class="sorting">예상거리</th>
								<th class="sorting">예상시간</th>
								<th class="sorting">화물등록일</th>
								<th class="sorting">비상배차여부</th>
								<th class="sorting">차주ID</th>
								<th class="sorting">차주명</th>
								<th class="sorting">차량번호</th>
								<th class="sorting">표준요금</th>
								<th class="sorting">마진요금</th>
								<th class="sorting">할증률</th>
								<th class="sorting">차주노출요금</th>
								<th class="sorting">화주노출요금</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty result.list}">
								<tr>
									<th colspan="<c:if test="${mode eq 'order'}">26</c:if><c:if test="${mode eq 'manual'}">24</c:if>">조회 결과가 없습니다.</th>
								</tr>
							</c:if>
							<c:if test="${!empty result.list}">
								<c:set value="${result.paginationVO.sizeOfData - (result.paginationVO.pageIndex-1) * result.paginationVO.pageSize}" var="idx"/>
								<c:forEach items="${result.list}" var="list" varStatus="status">
									<tr role="row" class="orderList">
										<td>
											${idx}
											<c:set var="idx" value="${idx-1}"/>
										</td>
										<td>
											<a class="title-link orderId" data-order-id="${list.orderId}">
												${list.orderNumber}
											</a>
										</td> <!-- 주문번호 -->
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
										</td>
										<!-- Begin 수동배차 제외항목 -->
										<c:if test="${mode ne 'manual'}">
											<td>
												<c:choose>
													<c:when test="${list.freight.isUrgentFreight eq true}">긴급</c:when>
													<c:otherwise>일반</c:otherwise>
			                                    </c:choose>
											</td> <!-- 주문상태2 -->
											<td>
												<c:choose>
													<c:when test="${list.dispatchDelay eq 'NOMAL'}">정상</c:when>
													<c:when test="${list.dispatchDelay eq 'DELAY'}">지연</c:when>
													<c:otherwise>${list.dispatchDelay}</c:otherwise>
			                                    </c:choose>
											</td> <!-- 배차지연 -->
										</c:if>
										<!-- End 수동배차 제외항목 -->
										<td>일반</td> <!-- 화물구분: 일반으로 일괄 적용하도록 정재국대리에게 전달받음 (2022.04.01) -->
										<td>
											<c:choose>
												<c:when test="${list.freightOwnerType eq 'FO_C'}">계약화주</c:when>
												<c:when test="${list.freightOwnerType eq 'manualDelivery'}">계약화주-수동배차</c:when>
												<c:when test="${list.freightOwnerType eq 'FO_G'}">일반화주</c:when>
												<c:otherwise>${list.freightOwnerType}</c:otherwise>
		                                    </c:choose>
										</td> <!-- 계약구분 -->
										<td>${list.freightOwnerInfo.freightOwnerId}</td> <!-- 화주ID -->
										<td>${list.freightOwnerInfo.freightOwnerName}</td> <!-- 화주명 -->
										<td>${list.freight.deliveryRequesterName}</td> <!-- 배송요청자 -->
										<td>${list.freight.loadingAddress} ${list.freight.loadingDetailAddress}</td> <!-- 상차지 -->
										<td><fmt:formatDate value="${list.freight.loadingDateTime}" pattern="yyyy.MM.dd HH:mm"/></td> <!-- 상차일시 -->
										<td>${list.freight.unloadingAddress} ${list.freight.unloadingDetailAddress}</td> <!-- 하차지 -->
										<td><fmt:formatDate value="${list.freight.unloadingDateTime}" pattern="yyyy.MM.dd HH:mm"/></td> <!-- 하차일시 -->
										<td><c:if test="${!empty list.estimatedDistance}"><span>${list.estimatedDistance}</span>㎞</c:if></td> <!-- 예상거리 -->
										<td><c:if test="${!empty list.leadTime}">${list.leadTime}분</c:if></td> <!-- 예상시간 -->
										<td><fmt:formatDate value="${list.freight.createdAt}" pattern="yyyy.MM.dd HH:mm"/></td> <!-- 화물등록일 -->
										<td>
											<c:choose>
												<c:when test="${list.isEmergency eq true}">Y</c:when>
												<c:otherwise>N</c:otherwise>
		                                    </c:choose>
										</td> <!-- 비상배차여부 -->
										<td>${list.carOwnerInfo.carOwnerId}</td> <!-- 차주ID -->
										<td>${list.carOwnerInfo.carOwnerName}</td> <!-- 차주명 -->
										<td>${list.carOwnerInfo.carNum}</td> <!-- 차량번호 -->
										<td class="text-right">
											<c:if test="${!empty list.charge.standardCharge}">
												<fmt:formatNumber value="${list.charge.standardCharge}" pattern="#,###"/>원
											</c:if>
										</td> <!-- 표준요금 -->
										<td class="text-right">
											<c:if test="${!empty list.freightOwnerCharge && !empty list.carOwnerCharge}">
												<fmt:formatNumber value="${list.freightOwnerCharge - list.carOwnerCharge}" pattern="#,###"/>원
											</c:if>
										</td> <!-- 마진요금 = 화주노출요금 - 차주노출요금으로 처리 (2022.04.21) -->
										<td><c:if test="${!empty list.charge.premiumRate}">${list.charge.premiumRate}%</c:if></td> <!-- 할증률 -->
										<td class="text-right">
											<c:if test="${!empty list.carOwnerCharge}">
												<fmt:formatNumber value="${list.carOwnerCharge}" pattern="#,###"/>원
											</c:if>
										</td> <!-- 차주노출요금 -->
										<td class="text-right">
											<c:if test="${!empty list.freightOwnerCharge}">
												<fmt:formatNumber value="${list.freightOwnerCharge}" pattern="#,###"/>원
											</c:if>
										</td> <!-- 화주노출요금 -->
									</tr>
								</c:forEach>
								</c:if>
						</tbody>
					</table>
				</div>
			</div>
			${result.pagination}
		</div>
	</div>
</div>


<script>

	var _mode = mode;
	
	//주문내역 업로드 팝업
	$('#excelUpload').on('click', function(){
		$.ajax({
		    type : "POST",
		    url : "<c:url value='/ui/service/order/excel/upload.popup'/>" + _mode,
		    data : null,
		    cache : false,
		    async : true,
		    success : function(data, textStatus, XMLHttpRequest) {
				if (hasErrorMap(data, true)) {
					return;
				}
				
				$('#popup_orderListUpload').html(data);
				$('#excelUploadPopup').modal('show');
		    },
		    error : function(xhr, ajaxOptions, thrownError) {
				if (hasErrorMap(xhr, false)) {
					return;
				}
		    }
		}); 
	});
	
	//엑셀다운로드
	$('#excelDownload').on('click', function(){
		var param = getData();
		
		var orderType1 = param.orderType1;
		var orderType2 = param.orderType2;
		var dispatchDelay = param.dispatchDelay;
		var freightOwnerType = param.freightOwnerType;
		var freightType = param.freightType;
		var emergencyYn = param.emergencyYn;
		var freightRegistStartDatetime = param.freightRegistStartDatetime;
		var freightRegistEndDatetime = param.freightRegistEndDatetime;
		var loadingStartDateTime = param.loadingStartDateTime;
		var loadingEndDateTime = param.loadingEndDateTime;
		var unloadingStartDateTime = param.unloadingStartDateTime;
		var unloadingEndDateTime = param.unloadingEndDateTime;
		var searchType = param.searchType;
		var searchText = param.searchText;
// 		var pageStart = param.pageStart;
// 		var pageCnt = param.pageCnt;
		// 조회건 전체 다운되도록 수정 (2022.04.27)
		var pageStart = 0;
		var pageCnt = 9999;
		
		var paramUrl = 'orderType1={0}&orderType2={1}&dispatchDelay={2}&freightOwnerType={3}&freightType={4}&emergencyYn={5}'
					+'&freightRegistStartDatetime={6}&freightRegistEndDatetime={7}&loadingStartDateTime={8}&loadingEndDateTime={9}'
					+'&unloadingStartDateTime={10}&unloadingEndDateTime={11}&searchType={12}&searchText={13}&pageStart={14}&pageCnt={15}';
		paramUrl = paramUrl.format(orderType1, orderType2, dispatchDelay, freightOwnerType, freightType, emergencyYn
					, freightRegistStartDatetime, freightRegistEndDatetime, loadingStartDateTime, loadingEndDateTime
					, unloadingStartDateTime, unloadingEndDateTime, searchType, searchText, pageStart, pageCnt);
		//console.log('excel download param: '+paramUrl)

		window.open("<c:url value='/ui/service/order/excel/download"+_mode+"'/>?"+paramUrl, '_blank');
	});
	
	//조회개수 변경
	$('#countList').on('change', function(){
		data.pageIndex = 1;
		data.pageStart = (data.pageIndex-1) * $('#countList').val();
		searchList();
	});
	
	//주문배송 상세 호출
	$('.orderId').on('click', function() {
		var orderId = $(this).data('order-id');
		routie("detail/"+orderId);
	});
	
	//페이지네이션
	$('ul.pagination li').on('click', function() {
		data.pageStart = ($(this).data('page-index')-1) * $('#countList').val();
		data.pageIndex = $(this).data('page-index');
		searchList();
	});
	
</script>