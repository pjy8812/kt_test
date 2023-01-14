<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="row">
	<div class="col-9">
		<h5 class="card-title">
			조회결과 (총 
			<c:choose>
				<c:when test="${empty result.listCount}">0</c:when>
				<c:otherwise><fmt:formatNumber value="${result.listCount}" pattern="#,###"/></c:otherwise>
			</c:choose>
			건)
		</h5>
	</div>
</div>
<div class="row">
	<div class="col">
		<button type="button" class="btn btn-custom03 btn-rounded waves-effect waves-dark" id="btnAdd" >운송대행사 등록</button>
	</div>
	<div class="col-3">
		<div class="row mb-2">
			<div  class="col-6">
				<select class="form-control " id="sort">
					<option value="carrierOwnerJoinDateTime" <c:if test="${vo.sort eq 'carrierOwnerJoinDateTime'}">selected</c:if>>가입 최신순</option>
					<option value="carrierOwnerNameAsc" <c:if test="${vo.sort eq 'carrierOwnerNameAsc'}">selected</c:if>>회원명(오름)</option>
					<option value="carrierOwnerNameDesc" <c:if test="${vo.sort eq 'carrierOwnerNameDesc'}">selected</c:if>>회원명(내림)</option>
				</select>
			</div>
			<div  class="col-6">
				<select class="form-control" id="pagePerRows">
					<option value="10" <c:if test="${vo.pagePerRows eq '10'}">selected</c:if>>10개씩</option>
					<option value="20" <c:if test="${vo.pagePerRows eq '20'}">selected</c:if>>20개씩</option>
					<option value="50" <c:if test="${vo.pagePerRows eq '50'}">selected</c:if>>50개씩</option>
				</select>
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
							<th class="sorting">사업자등록번호</th>
							<th class="sorting">운송대행사ID</th>
							<th class="sorting">운송대행사명</th>
							<th class="sorting">전화번호</th>
							<th class="sorting">차량</th>
							<th class="sorting">이메일주소</th>
							<th class="sorting">회원가입일</th>
							<th class="sorting">최종이용일</th>
							<th class="sorting">결제조건</th>
							<th class="sorting">이용상태</th>
							<th class="sorting">가입서류확인</th>
							<th class="sorting">계약화주</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty result.list}">
							<tr>
								<td colspan="13">조회 결과가 없습니다.</td>
							</tr>
						</c:if>
						<c:set var="idx" value="${result.paginationVO.sizeOfData - (result.paginationVO.pageIndex-1) * result.paginationVO.pageSize}"/> 
						<c:forEach var="row" items="${result.list}" varStatus="i">
							<tr role="row" data-carrier-id="${row.carrierId}" data-carrier-master-yn="${row.carrierMasterYn}">
								<td>
									${idx}
									<c:set var="idx" value="${idx-1}"/>
								</td>
								<td>
									<c:choose>
										<c:when test="${empty row.carrierCorporateRegistrationNumber}">-</c:when>
										<c:otherwise>${row.carrierCorporateRegistrationNumber}</c:otherwise>
									</c:choose>
								</td>
								<td class="carrierMasterYn">
									<c:choose>
										<c:when test="${empty row.carrierId}">-</c:when>
										<c:otherwise>${row.carrierId}</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${empty row.carrierName}">-</c:when>
										<c:otherwise>${row.carrierName}</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${empty row.carrierTelephone}">-</c:when>
										<c:otherwise>${row.carrierTelephone}</c:otherwise>
									</c:choose>
								</td>
								<td>
									<button type="button" class="btn btn-white waves-effect waves-dark btnCarInfo"><i class="fas fa-truck"></i></button>
								</td>
								<td>
									<c:choose>
										<c:when test="${empty row.carrierEmail}">-</c:when>
										<c:otherwise>${row.carrierEmail}</c:otherwise>
									</c:choose>
								</td>
									
								<td>
									<fmt:formatDate value="${row.carrierJoinDateTime}" pattern="yyyy.MM.dd"/>
								</td>
								
								<td>
									<fmt:formatDate value="${row.carrierLastUseDate}" pattern="yyyy.MM.dd"/>
								</td>
								
								<td>
									<c:choose>
										<c:when test="${empty row.carrierPaymentCondition}">-</c:when>
										<c:otherwise>
											<c:forEach var="paymentRow" items="${paymentCondition}">
												<c:if test="${paymentRow.codeId eq row.carrierPaymentCondition}">${paymentRow.codeName}</c:if>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</td>
								
								<td>
									<span 
										class="<c:choose><c:when test="${row.carrierMemberStatus eq 'normal'}">color-status-complete</c:when><c:when test="${row.carrierMemberStatus eq 'suspension'}">color-status-cancel</c:when><c:when test="${row.carrierMemberStatus eq 'withdrawalRequested'}">color-status-ing</c:when></c:choose>">
										<c:forEach var="memberRow" items="${memberStatus}">
											<c:if test="${memberRow.codeId eq row.carrierMemberStatus}">${memberRow.codeName}</c:if>
										</c:forEach>
									</span>
								</td>
								
								<td>
									<c:choose>
										<c:when test="${row.carrierFileAdminCheckYn eq 'Y'}">
											<i class="fas fa-check"></i>
										</c:when>
										<c:otherwise>
											-
										</c:otherwise>
									</c:choose>
								</td>

								<td class="freightDetail" title="계약화주 명" data-trigger="hover" data-toggle="popover" data-placement="left" data-content="${row.freightOwnerNames}" id="freightOwnerCount">
									<span>${row.freightOwnerCount}</span>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		${result.pagination}
	</div>
</div>
<div id="modal"></div>
<script>
	<c:if test="${empty result.resultCode}">
		alert('운송대행사 목록 조회중 오류가 발생하였습니다.\r\nERROR: ${result}');
	</c:if>
	<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
		alert('운송대행사 목록 조회중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}');
	</c:if>
	
	//정렬, 갯수 변경시
	$('#sort, #pagePerRows').on('change', function() {
		data.nowPage = 1
		data.pagePerRows = $('#pagePerRows').val(); 
		searchList();
	});
	
	//운송대행사 등록 버튼 클릭시 
	$('#btnAdd').on('click', function(){
// 		carrierUpload();
		routie("upload");
	});
	
	$('tbody tr').on('click', function() {
		$('.popover').remove();
		var carrierId = $(this).data('carrier-id');
		
		if(carrierId == '' || carrierId == undefined){
			return;
		}
		
		routie("detail/"+carrierId);
	});
	
	//차량정보 조회
	$('.btnCarInfo').on('click', function(e){
		e.stopPropagation();
		var carrierId = $(this).parents('tr').data('carrier-id');
		loadCarDatailPopup(carrierId);
	});
	
	//마스터 버튼
// 	$('.carrierMasterYn').on('click', function(e){
// 		e.stopPropagation();
		
// 		var _carrierId    = $(this).parents('tr').data('carrier-id');
// 		var _carrierMasterYn = $(this).parents('tr').data('carrier-master-yn');

// 		console.log("_carrierId = ", _carrierId);
// 		console.log("_carrierMasterYn = ", _carrierMasterYn);

// 		if (_carrierMasterYn === 'N') {
// 			if (!confirm(_carrierId + '님을 마스터로 지정합니다.')) {
// 				return;
// 			} else {
// 				_carrierMasterYn = 'Y';
// 			}
// 		} else {
// 			if (!confirm(_carrierId + '님을 마스터로 지정을 취소합니다.')) {
// 				return;
// 			} else {
// 				_carrierMasterYn = 'N';
// 			}
// 		}

// 		var formData = {};
// 		formData.carrierId = _carrierId;
// 		formData.carrierMasterYn = _carrierMasterYn;
// 	});	
	
	//페이지네이션 
	$('.searchList ul.pagination li').on('click touch', function() {
		data.nowPage = $(this).data('page-index');
		searchList();
	});
	
	$(document).ready(function () {
		// 계약화주 호버
		$('.freightDetail').popover();
	});
</script>