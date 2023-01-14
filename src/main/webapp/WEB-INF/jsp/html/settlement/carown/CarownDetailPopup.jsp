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

<div class="form-group row">
	<div class="col-6 align-middle">
		<h5 class="card-title">주문번호 ${vo.carOwnerSettlementOrderNumber}</h5>
	</div>
	<div class="col-6 align-middle text-right">
		<c:forEach items="${autUriList}" var="autUriList">
			<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'U') gt -1}">
				<button type="button" class="btn btn-dark waves-effect ml-1 cancelReapproveBtn"
					data-date="${vo.carOwnerSettlementDate}"
					<c:choose>
						<c:when test="${null ne result and !empty result.tIdInfo}">
							data-cancel-date="${result.tIdInfo[0].carOwnerSettlementDoneDate}"
						</c:when>
						<c:otherwise>
							data-cancel-date=""
						</c:otherwise>
					</c:choose>
					data-settlement-id="${vo.carOwnerSettlementId}"
					data-owner-id="${vo.carOwnerId}"
					data-order-id="${vo.carOwnerSettlementOrderId}"
					data-order-num="${vo.carOwnerSettlementOrderNumber}"
					data-settlement-state="${vo.carOwnerSettlementState}"
					data-root-settlement-id="${vo.carOwnerSettlementRootId}"
					disabled="disabled"
					>취소 재승인</button>
			</c:if>
		</c:forEach>
	</div>
</div>
<div class="form-group row">
	<div class="col-12">
		<table class="table mb-0 basic-table dataTable no-footer dtr-inline text-center">
			<colgroup>
				<col style="width: 15%;">
				<col style="width: 10%;">
				<col style="width: 15%;">
				<col style="width: 30%;">
				<col style="width: 15%;">
				<col style="width: 15%;">
			</colgroup> 
			<thead>
				<tr>
					<th scope="row" class="align-middle sorting">구분</th>
					<th scope="row" class="align-middle sorting">승인상태</th>
					<th scope="row" class="align-middle sorting">금액</th>
					<th scope="row" class="align-middle sorting">TID</th>
					<th scope="row" class="align-middle sorting">Seq</th>
					<th scope="row" class="align-middle sorting">카드승인번호</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${result.tIdInfo}">
					<tr>
						<td class="text-left">${list.carOwnerSettlementTypeName}</td>
						<td class="text-center">
							<c:choose>
								<c:when test="${'sendFailed' eq list.carOwnerSettlementState}">
									<span class="color-text-danger">
										${list.carOwnerSettlementStateName}
									</span>
								</c:when>
								<c:otherwise>
									${list.carOwnerSettlementStateName}
								</c:otherwise>
							</c:choose>
						</td>
						<td class="text-right">
							<c:choose>
								<c:when test="${'cancelCompleted' eq list.carOwnerSettlementState or 'cancelRequested' eq list.carOwnerSettlementState}">
									<del><fmt:formatNumber value="${list.carOwnerSettlementPrice}"/></del>
								</c:when>
								<c:otherwise>
									<fmt:formatNumber value="${list.carOwnerSettlementPrice}"/>
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							${list.carOwnerSettlementTId}
						</td>
						<td class="text-cneter">${list.carOwnerSettlementSeq}</td>
						<td>${list.carOwnerSettlementAuthCode}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<script>

	// console.log("== orgPath ==");

	var cancelRequestCnt = 0; // 취소요청 건수 
	var cancelCompleteCnt = 0; // 취소완료 건수 
	var settState = '${result.settState}'; // 정산상태 
		
	<c:forEach var="list" items="${result.tIdInfo}">
		<c:if test="${'cancelRequested' eq list.carOwnerSettlementState}">
			cancelRequestCnt = cancelRequestCnt + 1;
		</c:if>
		<c:if test="${'cancelCompleted' eq list.carOwnerSettlementState}">
			cancelCompleteCnt = cancelCompleteCnt + 1;
		</c:if>
	</c:forEach>
	
	// console.log(cancelRequestCnt);
	// console.log(cancelCompleteCnt);
	// console.log(settState);
	
	// 진행상태 버튼 클릭 이벤트 
	$('.cancelReapproveBtn').on('click touch', function() {
		
		/* 		
	 	carOwnerId
		carOwnerSettlementState
		carOwnerSettlementId
		carOwnerSettlementOrderId
		 */
		 
		var reapproveType = $(this).data('type') === undefined ? 1 : $(this).data('type');
		
		var reapproveFlag = false;
		if(reapproveType === 1) {
			reapproveFlag = confirm('취소한 정산을 재승인하시겠습니까?');
		} else if(reapproveType === 2) {
			reapproveFlag = confirm('취소한 정산으로 새로운 정산 건을 생성하시겠습니까?');
		}
		
		if(!reapproveFlag) {
			return false;
		}
		 
		if(!isAvailToUpdate()) {
			alert('취소 가능한 시간이 아닙니다.');
			toggleReapproveBtn();
			return false;
		}
		 
		reapproveSettlement($(this), reapproveType);
 	})
 	
 	function toggleReapproveBtn() {
		
		if(isAvailToUpdate()) {
			$('button.cancelReapproveBtn').prop('disabled', null);
		} else {
			$('button.cancelReapproveBtn').prop('disabled', 'disabled');
		}
		
		// 참고: type 정의
		// 1 : 승인 취소건 재승인 처리  
		// 2 : 정산 ID 생산하여 재승 승인 취소건 새로운인 처리 
		
		// [승인상태에 ‘취소요청’ 또는 ‘취소완료’ 상태가 없음] 
		if(cancelRequestCnt === 0 && cancelCompleteCnt === 0) {
			// $('button.cancelReapproveBtn').prop('disabled', 'disabled');
		} else {
			// [승인상태에 ‘취소완료’ 상태가 있음]
			if(cancelCompleteCnt > 0 && settState === 'settlementStandby') {
				// [승인상태에 ‘취소완료’ 상태가 있음]&[진행상태: ‘정산대기’] 
				// >> 재승인 :type1
				// $('button.cancelReapproveBtn').prop('disabled', null);
				$('button.cancelReapproveBtn').data('type', 1);
			} else if(cancelRequestCnt > 0 && (settState === 'settlementRequested' || settState === 'sendFailed') && checkTime($('.cancelReapproveBtn'))) {
				// [승인상태에 ‘취소요청’ 상태가 있음]&[진행상태: 정산중/전송실패]&[정산발생일 익일 오전 10:50 이전] 
				// >> 재승인 :type1
				// $('button.cancelReapproveBtn').prop('disabled', null);
				$('button.cancelReapproveBtn').data('type', 1);
			} else if(cancelRequestCnt + cancelCompleteCnt > 0 && (settState === 'settlementRequested' || settState === 'settlementCompleted' || settState === 'sendFailed')) {
				// [승인상태에 ‘취소완료’ 상태가 있음]&[진행상태: ‘지급중’,'지급완료','전송실패'] 
				if (settState === 'settlementRequested' || settState === 'sendFailed') {
					//[진행상태: ‘지급대기’,'전송실패'인 경우 , 익일 10시 50분 체크] 
					if (checkTimeOut($('.cancelReapproveBtn'))) {
						// >> 재승인 :type1
						$('button.cancelReapproveBtn').data('type', 1);
					}						
				}
				// [승인상태에 ‘취소완료’ 상태가 있음]&[진행상태: '지급완료']
				if (settState === 'settlementCompleted') {
					//[진행상태: ‘지급대기’,'지급완료','전송실패'인 경우 , 익일 10시 50분 체크] 
					if(checkCancelTime($('.cancelReapproveBtn'))) {
						// >> 재승인 :type2
						$('button.cancelReapproveBtn').data('type', 2);
					}					
				}				
			} else {
				// $('button.cancelReapproveBtn').prop('disabled', 'disabled');
			}
		}
		
		// [승인상태에 ‘취소요청’ 또는 ‘취소완료’ 상태가 없음] 
		/* if(cancelRequestCnt === 0 && cancelCompleteCnt === 0) {
			$('button.cancelReapproveBtn').prop('disabled', 'disabled');
		} else {
			// [승인상태에 ‘취소완료’ 상태가 있음]
			if(cancelCompleteCnt > 0 && settState === 'settlementStandby') {
				// [승인상태에 ‘취소완료’ 상태가 있음]&[진행상태: ‘정산대기’] 
				// >> 재승인
				$('button.cancelReapproveBtn').prop('disabled', null);
				$('button.cancelReapproveBtn').data('type', 1);
			} else if(cancelRequestCnt > 0 && (settState === 'settlementRequested' || settState === 'sendFailed') && checkTime($('.cancelReapproveBtn'))) {
				// [승인상태에 ‘취소요청’ 상태가 있음]&[진행상태: 정산중/전송실패]&[정산발생일 익일 오전 10:50 이전] 
				// >> 재승인 
				$('button.cancelReapproveBtn').prop('disabled', null);
				$('button.cancelReapproveBtn').data('type', 1);
			} else if(cancelRequestCnt + cancelCompleteCnt > 0 
					&& checkTimeOut($('.cancelReapproveBtn'))
					&& (settState === 'settl
							ementRequested' || settState === 'settlementCompleted' || settState === 'sendFailed')) {
				
				if(checkCancelTime($('.cancelReapproveBtn'))) {
					// [승인상태에 ‘취소요청’ 또는 ‘취소완료’ 상태가 있음]&[정산발생일 익일 오전 10:50 후]&[진행상태: 정산중/정산완료/전송실패]&취소 처리 후 30일 이내] 
					// >> 버튼 활성화
					// 클릭 시 “취소한 정산으로 새로운 정산 건을 생성하시겠습니까?
					$('button.cancelReapproveBtn').prop('disabled', null);
					$('button.cancelReapproveBtn').data('type', 2);
				} else {
					// [승인상태에 ‘취소요청’ 또는 ‘취소완료’ 상태가 있음]&[진행상태: 정산중/정산완료/전송실패]&[정산발생일 익일 오전 10:50 후]&[취소 처리 후 30일 초과] 
					// >> 버튼 비활성화
					$('button.cancelReapproveBtn').prop('disabled', 'disabled');
				}
			} else {
				$('button.cancelReapproveBtn').prop('disabled', 'disabled');
			}
		} */
	}
	
	function isAvailToUpdate() {
		if(cancelRequestCnt === 0 && cancelCompleteCnt === 0) {
			// $('button.cancelReapproveBtn').prop('disabled', 'disabled');
			return false;
		} else {
			// [승인상태에 ‘취소완료’ 상태가 있음]
			if(cancelCompleteCnt > 0 && settState === 'settlementStandby') {
				// [승인상태에 ‘취소완료’ 상태가 있음]&[진행상태: ‘정산대기’] 
				// >> 재승인
				// >> 버튼 활성화
				return true;
			} else if(cancelRequestCnt > 0 && (settState === 'settlementRequested' || settState === 'sendFailed') && checkTime($('.cancelReapproveBtn'))) {
				// [승인상태에 ‘취소요청’ 상태가 있음]&[진행상태: 정산중/전송실패]&[정산발생일 익일 오전 10:50 이전] 
				// >> 재승인 
				// >> 버튼 활성화
				return true;
			} else if(cancelRequestCnt + cancelCompleteCnt > 0 && (settState === 'settlementRequested' || settState === 'settlementCompleted' || settState === 'sendFailed')) {
				
				if (settState === 'settlementRequested' || settState === 'sendFailed') {
					if (checkTimeOut($('.cancelReapproveBtn'))) {
						// >> 버튼 활성화
						return true;
					} else {
						// >> 버튼 비활성화
						return false;
					}
				}
				if (settState === 'settlementCompleted') {
					if(checkCancelTime($('.cancelReapproveBtn'))) {
						// >> 버튼 활성화
						return true;
					} else {
						// >> 버튼 비활성화
						return false;
					}					
				}

			} else {
				// $('button.cancelReapproveBtn').prop('disabled', 'disabled');
				return false;
			}
		}
	}
	
	// 오류 발생시 alert
	$(document).ready(function() {
		
		toggleReapproveBtn();
		
		<c:if test="${empty result.resultCode}">
			<c:set var="resultMsg" value="${fn:replace(fn:replace(result, LF, ''), CR, '')}"/>	
			alert('상세 목록 조회 중 오류가 발생하였습니다.\r\nERROR: ${resultMsg}')
		</c:if>
		<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
			alert('상세 목록 조회 중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}')
		</c:if>
			
	})
	
</script>