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
	<div class="col-3">
		<div class="form-group row mb-2">
			<div class="col-12">
				<div class="row">
					<div  class="col-6">
						<select class="form-control " id="sort">
							<option value="freightOwnerJoinDateTime" <c:if test="${vo.sort eq 'freightOwnerJoinDateTime	'}">selected</c:if>>가입 최신순</option>
							<option value="freightOwnerNameAsc" <c:if test="${vo.sort eq 'freightOwnerNameAsc'}">selected</c:if>>화주(오름)</option>
							<option value="freightOwnerNameDesc" <c:if test="${vo.sort eq 'freightOwnerNameDesc'}">selected</c:if>>화주(내림)</option>
							<option value="freightOwnerPlaceboFeeAsc" <c:if test="${vo.sort eq 'freightOwnerPlaceboFeeAsc'}">selected</c:if>>위약수수료(오름)</option>
							<option value="freightOwnerPlaceboFeeDesc" <c:if test="${vo.sort eq 'freightOwnerPlaceboFeeDesc'}">selected</c:if>>위약수수료(내림)</option>
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
							<th class="sorting">계약구분</th>
							<th class="sorting">계약요율코드</th>
							<th class="sorting">계약요율명</th>
							<th class="sorting">사업자구분</th>
							<th class="sorting">사업자유형</th>
							<th class="sorting">화주명</th>
							<th class="sorting">사업자등록번호</th>
							<th class="sorting">화주ID</th>
							<th class="sorting">화주사</th>
							<th class="sorting">전화번호</th>
							<th class="sorting">이메일주소</th>
							<th class="sorting">회원가입일</th>
							<th class="sorting">최종이용일</th>
							<th class="sorting">위약수수료</th>
							<th class="sorting">청구횟수</th>
							<th class="sorting">이용상태</th>
							<th class="sorting">가입서류 확인</th>
							<th class="sorting">운송대행사</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty result.list}">
							<tr>
								<td colspan="15">조회 결과가 없습니다.</td>
							</tr>
						</c:if>
						<c:set var="idx" value="${result.paginationVO.sizeOfData - (result.paginationVO.pageIndex-1) * result.paginationVO.pageSize}"/> 
						<c:forEach var="row" items="${result.list}" varStatus="i">
							<tr role="row" data-freight_owner_id="${row.freightOwnerIdOrg}" data-freight_master_flag="${row.freightOwnerMasterFlag}" 
							               data-freight-fare-adjust-from="${row.freightOwnerFareAdjustFrom}"
							               data-freight-fare-adjust-to="${row.freightOwnerFareAdjustTo}"
							               data-freight-owner-corporate-registration-number="${row.freightOwnerCorporateRegistrationNumber}">
								<td>
									${idx}
									<c:set var="idx" value="${idx-1}"/>
								</td>
								<td>
									<c:choose>
										<c:when test="${row.freightOwnerType eq 'normal'}">일반</c:when>
										<c:when test="${row.freightOwnerType eq 'contract'}">계약</c:when>
										<c:when test="${row.freightOwnerType eq 'manualDelivery'}">계약화주-수동배차</c:when>
										<c:otherwise>${row.freightOwnerType}</c:otherwise>
									</c:choose>
								</td>
								<td></td><!-- 계약요율코드 -->
								<td></td><!-- 계약요율명 -->
								<td>
									<c:choose>
										<c:when test="${row.freightOwnerMemberType eq 'nonBusiness'}">비사업자</c:when>
										<c:when test="${row.freightOwnerMemberType eq 'business'}">사업자</c:when>
										<c:otherwise>${row.freightOwnerMemberType}</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${row.freightOwnerBusinessType eq 'normal'}">일반</c:when>
										<c:when test="${row.freightOwnerBusinessType eq 'carrier'}">운송사</c:when>
										<c:when test="${row.freightOwnerBusinessType eq 'forwarder'}">주선사</c:when>
										<c:otherwise>${row.freightOwnerBusinessType}</c:otherwise>
									</c:choose>
								 </td>
								<td>${row.freightOwnerName}</td>
								<td class="btnCorporateRegistrationNumber">${row.freightOwnerCorporateRegistrationNumber}</td><!-- 사업자등록번호 -->
								<td class="btnMaster"><c:if test="${row.freightOwnerMasterFlag eq 'Y'}"><i class="btn btn-rounded" style="padding:.10rem .50rem .15rem; color:gray; border-color:gray" >M</i><span>    </span></c:if>${row.freightOwnerId}</td>
								<td class="text-left">${row.freightOwnerCorporateRegistrationName}</td>
								<td>${row.freightOwnerTelephone}</td>
								<td>${row.freightOwnerEmail}</td>
								<td>
									<fmt:formatDate value="${row.freightOwnerJoinDateTime}" pattern="yyyy.MM.dd"/>
								</td>
								<td>
									<fmt:formatDate value="${row.freightOwnerLastUseDate}" pattern="yyyy.MM.dd"/>
								</td>
								<td class="text-right">
									<c:if test="${not empty row.freightOwnerPlaceboFee}">
										<fmt:formatNumber value="${row.freightOwnerPlaceboFee}" pattern="#,###"/>
									</c:if>
								</td>
								<td class="text-right">
									<span>${row.freightOwnerMonthSettlementNum}</span>회
								</td>
								<td>
									<c:choose>
										<c:when test="${row.freightOwnerMemberStatus eq 'normal'}">
											<span class="color-status-complete">정상</span>
										</c:when>
										<c:when test="${row.freightOwnerMemberStatus eq 'suspension'}">
											<span class="color-status-cancel">중지</span>
										</c:when>
										<c:when test="${row.freightOwnerMemberStatus eq 'withdrawalRequested'}">
											<span class="color-status-ing">탈퇴요청</span>
										</c:when>
										<c:when test="${row.freightOwnerMemberStatus eq 'withdrawal'}">
											<span class="color-status-ing">탈퇴</span>
										</c:when>
										<c:when test="${row.freightOwnerMemberStatus eq 'standby'}">
											<span class="color-status-ing">심사대기</span>
										</c:when>
										<c:otherwise>${row.freightOwnerMemberStatusName}</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${row.freightOwnerFileAdminCheckYn eq 'Y'}">
											<i class="fas fa-check"></i>
										</c:when>
										<c:otherwise>
											-
										</c:otherwise>
									</c:choose>
								</td>
								<td>${row.carrierName}</td><!-- 운송대행사 -->
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		${result.pagination}
	</div>
</div>
<script>
	<c:if test="${empty result.resultCode}">
		alert('화주 목록 조회중 오류가 발생하였습니다.\r\nERROR: ${result}');
	</c:if>
	<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
		alert('화주 목록 조회중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}');
	</c:if>
	
	//정렬, 갯수 변경시
	$('#sort, #pagePerRows').on('change', function() {
		data.nowPage = 1;
		searchList();
	});
	
	$('tbody tr').on('click', function() {
		var freightOwnerId = $(this).data('freight_owner_id');
		//console.log("freightOwnerId", freightOwnerId);
		if(freightOwnerId == '' || freightOwnerId == undefined){
			return;
		}
		routie("detail/"+freightOwnerId);
	});
	
	//화주 ID 클릭 시
	$('.btnMaster').on('click', function(e){
		e.stopPropagation();
		var _freightOwnerId    = $(this).parents('tr').data('freight_owner_id');
		var _freightOwnerMasterFlag = $(this).parents('tr').data('freight_master_flag');
		
		if (_freightOwnerMasterFlag === 'N') {
			if(!confirm(_freightOwnerId + '님을 마스터로 지정합니다.')){
				return;
			} else {
				_freightOwnerMasterFlag = 'Y';
			}			
		} else {
			if(!confirm(_freightOwnerId + '님을 마스터로 지정을 취소합니다.')){
				return;
			} else {
				_freightOwnerMasterFlag = 'N';
			}		
		}
		
		var formData = {};
		formData.freightOwnerId = _freightOwnerId;
		formData.freightOwnerMasterFlag = _freightOwnerMasterFlag;		
		
 		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/frgown/master.update'/>",
			data : formData,
			cache : false,
			async : true,
			success : function(result, textStatus, XMLHttpRequest) {
				//console.log(result);
				if(result.resultCode == '00000'){
					alert('변경이 완료되었습니다');
					location.reload();
				}else{
					alert('화주정보 변경 중 오류가 발생하였습니다\r\nERROR:'+result.resultMsg);
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert('화주정보 변경 중 오류가 발생하였습니다.\r\nERROR: '+xhr.responseJSON.message);
			}
		});	
	});	
	
	//사업자 번호 클릭
	$('.btnCorporateRegistrationNumber').on('click', function(e){
		e.stopPropagation();
		var _freightOwnerId    = $(this).parents('tr').data('freight_owner_id');
		var _freightOwnerCorporateNumber = $(this).parents('tr').data('freight-owner-corporate-registration-number');
		var _freightOwnerFareAdjustFrom = $(this).parents('tr').data('freight-fare-adjust-from');
		var _freightOwnerFareAdjustTo = $(this).parents('tr').data('freight-fare-adjust-to');
		contractPopup(_freightOwnerId, _freightOwnerCorporateNumber, _freightOwnerFareAdjustFrom, _freightOwnerFareAdjustTo);
	});	
	
	
	
	//페이지네이션 
	$('.searchList ul.pagination li').on('click touch', function() {
		data.nowPage = $(this).data('page-index');
		searchList();
	});
</script>