<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="scroll-table-wrap">
	<div class="scroll-table-box" >
		<table class="table dt-responsive nowrap dataTable no-footer dtr-inline text-center" role="grid">
	   		<thead>
	       		<tr role="row">
					<th class="sorting_asc">선택</th>
					<th class="sorting">주문번호</th>
					<th class="sorting">주문상태1</th>
					<th class="sorting">주문상태2</th>
					<th class="sorting">배차지연</th>
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
	  	 				<td colspan="22">조회 결과가 없습니다.</td>
	  	 			</tr>
	  	 		</c:if>
	  	 		<c:forEach var="row" items="${result.list}">
			        <tr role="row">
			            <td>
		            	  	<div class="form-check">
			           			<input type="radio" class="form-check-input chk" name="chk" value="${row.orderNumber}" data-order_id="${row.orderId}">
			            	</div>
			            </td>
			           	<td>${row.orderNumber}</td>
			           	<td>
				 			<c:choose>
								<c:when test="${result.orderStatus eq 'CHARGE_CHECKING'}">요금확인중</c:when>
								<c:when test="${result.orderStatus eq 'DELIVERY_REQUESTED'}">배송요청</c:when>
								<c:when test="${result.orderStatus eq 'DISPATCH_COMPLETED'}">배차완료</c:when>
								<c:when test="${result.orderStatus eq 'LOADING_COMPLETED'}">상차완료</c:when>
								<c:when test="${result.orderStatus eq 'UNLOADING_COMPLETED'}">하차완료</c:when>
								<c:when test="${result.orderStatus eq 'ORDER_CANCELED'}">주문취소</c:when>
								<c:otherwise>${list.orderStatus}</c:otherwise>
                            </c:choose>
			           	</td>
			           	<td>
			           		<c:choose>
								<c:when test="${row.freight.isUrgentFreight eq true}">긴급</c:when>
								<c:otherwise>일반</c:otherwise>
                            </c:choose>
			           	</td><!-- 주문상태2 -->
		           		<td>
							<c:choose>
								<c:when test="${row.dispatchDelay eq 'NOMAL'}">정상</c:when>
								<c:when test="${row.dispatchDelay eq 'DELAY'}">지연</c:when>
								<c:otherwise>${row.dispatchDelay}</c:otherwise>
                                  </c:choose>
						</td> <!-- 배차지연 -->
			           	<td>일반</td> <!-- 화물구분: 일반으로 일괄 적용하도록 정재국대리에게 전달받음 (2022.04.01) -->
			           	<td>
			           		<c:choose>
								<c:when test="${row.freightOwnerType eq 'FO_C'}">계약화주</c:when>
								<c:when test="${row.freightOwnerType eq 'manualDelivery'}">계약화주-수동배차</c:when>
								<c:when test="${row.freightOwnerType eq 'FO_G'}">일반화주</c:when>
								<c:otherwise>${row.freightOwnerType}</c:otherwise>
                            </c:choose>
			           	</td>
			           	<td>${row.freightOwnerInfo.freightOwnerId}</td><!-- 화주ID -->
			           	<td>${row.freightOwnerInfo.freightOwnerName}</td><!-- 화주명 -->
			           	<td>${row.freight.deliveryRequesterName}</td><!-- 배송요청자 -->
			           	<td>
			           		${row.freight.loadingAddress} ${row.freight.loadingDetailAddress}
			           	</td>
			           	<td>
			           		<fmt:formatDate value="${row.freight.loadingDateTime}" pattern="yyyy.MM.dd HH:mm"/>
			           	</td>
			           	<td>
			           		${row.freight.unloadingAddress} ${row.freight.unloadingDetailAddress}
			           	</td>
			           	<td>
			           		<fmt:formatDate value="${row.freight.unloadingDateTime}" pattern="yyyy.MM.dd HH:mm"/>
			           	</td>
			           	<td>
			           		<c:if test="${not empty row.estimatedDistance}">
			           			<span>${row.estimatedDistance}</span>㎞
			           		</c:if>
			           	</td>
			           	<td>
			           		<c:if test="${!empty row.leadTime}">
			           			${row.leadTime}분
			           		</c:if>
			           	</td><!-- 예상시간 -->
			           	<td>
			           		<fmt:formatDate value="${row.registerDateTime}" pattern="yyyy.MM.dd HH:mm"/>
			           	</td>
			           	<td>	
							<c:choose>
								<c:when test="${row.isEmergency eq true}">Y</c:when>
								<c:otherwise>N</c:otherwise>
                            </c:choose>
						</td> <!-- 비상배차여부 -->
			           	<td>
			           		${row.carOwnerInfo.carOwnerId}
			           	</td><!-- 차주ID -->
			           	<td>
			           	 	${row.carOwnerInfo.carOwnerName}
			           	</td><!-- 차주명 -->
			           	<td>
			           		${row.carOwnerInfo.carNum}
			           	</td><!-- 차량번호 -->
		           		<td class="text-right">
		           			<c:if test="${not empty row.charge.standardCharge}">
		           				<fmt:formatNumber value="${row.charge.standardCharge}" pattern="#,###"/>원
		           			</c:if>
	           			</td>
						<td class="text-right"></td> <!-- 마진요금 -->
						<td>
							<c:if test="${!empty row.charge.marginRate}">
								${row.charge.marginRate}%
							</c:if>
						</td> <!-- 할증률 -->
						<td class="text-right">
							<c:if test="${not empty row.carOwnerCharge}">
								<fmt:formatNumber value="${row.carOwnerCharge}" pattern="#,###"/>원
							</c:if>
						</td> 
						<td class="text-right">
							<c:if test="${not empty row.freightOwnerCharge}">
								<fmt:formatNumber value="${row.freightOwnerCharge}" pattern="#,###"/>원
							</c:if>
						</td> 
			        </tr>
		        </c:forEach>
	   		</tbody>
	    </table>
	</div>
</div>
${result.pagination}
<script>
	/*
	<c:if test="${empty result.resultCode}">
		alert("주문 목록 조회중 오류가 발생하였습니다.");
	</c:if>
	<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
		alert("주문 목록 조회중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}");
	</c:if>
	*/
	
	//페이지네이션 
	$('#modal #popupList ul.pagination li').on('click touch', function() {
		var pageStart = ($(this).data('page-index')-1) * 10;
		var pageIndex = $(this).data('page-index');
		loadOrderSearchPopupList(pageStart, pageIndex);
	});
	
</script>
