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
		<button type="button" class="btn btn-dark btn-rounded waves-effect waves-dark d-none" id="btnUploadPopup">지입차주 등록</button>
		<button type="button" class="btn btn-custom03 btn-rounded waves-effect waves-dark" id="btnDownload" >심사대상 파일 다운로드</button>
		<button type="button" class="btn btn-custom03 btn-rounded waves-effect waves-dark" id="btnDeleteHistory" >삭제이력</button>
	</div>
	<div class="col-3">
		<div class="row mb-2">
			<div  class="col-6">
				<select class="form-control " id="sort">
					<option value="carOwnerJoinDateTime" <c:if test="${vo.sort eq 'carOwnerJoinDateTime'}">selected</c:if>>가입 최신순</option>
					<option value="carOwnerNameAsc" <c:if test="${vo.sort eq 'carOwnerNameAsc'}">selected</c:if>>회원명(오름)</option>
					<option value="carOwnerNameDesc" <c:if test="${vo.sort eq 'carOwnerNameDesc'}">selected</c:if>>회원명(내림)</option>
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
							<th class="sorting">구분</th>
							<th class="sorting">회원명</th>
							<th class="sorting">ID</th>
							<th class="sorting">상호</th>
							<th class="sorting">차량</th>
							<th class="sorting">전화번호</th>
							<th class="sorting">이메일주소</th>
							<th class="sorting">추천인ID</th>
							<th class="sorting">회원가입일</th>
							<th class="sorting">최종이용일</th>
							<th class="sorting">패널티</th>
							<th class="sorting">이용상태</th>
							<th class="sorting">가입서류 확인</th>
							<th class="sorting">가입승인상태</th>
							<th class="sorting">삭제</th>
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
							<tr role="row" data-car_owner_id="${row.carOwnerIdOrg}" data-car_num="${row.carNum}">
								<td>
									${idx}
									<c:set var="idx" value="${idx-1}"/>
								</td>
								<td>
									<c:choose>
										<c:when test="${row.carOwnerType eq 'normal'}">일반</c:when>
										<c:when test="${row.carOwnerType eq 'contract'}">지입</c:when>
										<c:otherwise>${row.carOwnerType}</c:otherwise>
									</c:choose>
								</td>
								<td>${row.carOwnerName}</td>
								<td>
									<c:choose>
										<c:when test="${empty row.carOwnerId}">-</c:when>
										<c:otherwise>${row.carOwnerId}</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${empty row.carOwnerCorporateRegistrationName}">-</c:when>
										<c:otherwise>${row.carOwnerCorporateRegistrationName}</c:otherwise>
									</c:choose>
								</td>
								<td>
									<button type="button" class="btn btn-white waves-effect waves-dark btnCarInfo"><i class="fas fa-truck"></i></button>
								</td>
								<td>
									<c:choose>
										<c:when test="${empty row.carOwnerTelephoneNum}">-</c:when>
										<c:otherwise>${row.carOwnerTelephoneNum}</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${empty row.carOwnerEmail}">-</c:when>
										<c:otherwise>${row.carOwnerEmail}</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${empty row.carOwnerRecommendId}">-</c:when>
										<c:otherwise>${row.carOwnerRecommendId}</c:otherwise>
									</c:choose>
								</td>
								<td>
									<fmt:formatDate value="${row.carOwnerJoinDate}" pattern="yyyy.MM.dd"/>
								</td>
								<td>
									<fmt:formatDate value="${row.carOwnerLastUseDate}" pattern="yyyy.MM.dd"/>
								</td>
								<td>
									<c:if test="${row.penalty > 0}">
										<button type="button" class="btn btn-white waves-effect waves-dark btnPenalty">
											<i class="fas fa-exclamation-triangle color-status-issue"  ></i>
										</button>
									</c:if>
								</td>
								<td>
									<span 
										class="<c:choose><c:when test="${row.carOwnerMemberStatus eq 'normal'}">color-status-complete</c:when><c:when test="${row.carOwnerMemberStatus eq 'suspension'}">color-status-cancel</c:when><c:when test="${row.carOwnerMemberStatus eq 'withdrawalRequested'}">color-status-ing</c:when></c:choose>">
									${row.carOwnerMemberStatusName}
									</span>
								</td>
								<td>
									<c:choose>
										<c:when test="${row.carOwnerFileAdminCheckYn eq 'Y'}">
											<i class="fas fa-check"></i>
										</c:when>
										<c:otherwise>
											-
										</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${empty row.carOwnerJoinApprovalStatus}">-</c:when>
										<c:otherwise>
											<span 
												class="<c:choose><c:when test="${row.carOwnerJoinApprovalStatus eq 'completeReview'}">color-status-complete</c:when><c:when test="${row.carOwnerJoinApprovalStatus eq 'standby'}">color-status-ing</c:when><c:when test="${row.carOwnerJoinApprovalStatus eq 'underReview'}">color-status-wait</c:when></c:choose>">
												${row.carOwnerJoinApprovalStatusName}
											</span>
										</c:otherwise>
									</c:choose>
								</td>
								<td>
									<button type="button" class="btn btn-white waves-effect waves-dark btnDelete"><i class="fas fa-trash-alt"></i></button>
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
		alert('차주 목록 조회중 오류가 발생하였습니다.\r\nERROR: ${result}');
	</c:if>
	<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
		alert('차주 목록 조회중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}');
	</c:if>
	
	//정렬, 갯수 변경시
	$('#sort, #pagePerRows').on('change', function() {
		data.nowPage = 1
		searchList();
	});
	
	//지입차주 등록버튼 클릭시
	$('#btnUploadPopup').on('click', function(){
		loadCarownUploadPopup();
	});
	
	//심사대상 파일 다운로드 버튼 클릭시 
	$('#btnDownload').on('click', function(){
		if(!confirm('[심사요청]상태인 [정상]회원의 심사자료를 다운로드하고, [심사중]으로 전환하시겠습니까?')){
			return;
		}
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/carown/check/target'/>",
			data : {},
			cache : false,
			async : true,
			success : function(data, textStatus, xhr) {
				//console.log(data)
				
				//다운로드 가능한 파일이 있을 경우 파일다운로드 사유 입력 팝업 노출 by.2022.05.30 mijin.kim
				if(data.resultCode != '00000'){
					alert(data.resultMsg);
				}else{
					var params = {
				    	"maskingHistoryType" : "carownList"
				    	, "type": "download"
			    	};
					showMakingPopup(params);
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert('심사파일 다운로드 파일 여부 조회 중 오류가 발생하였습니다.\r\nERROR: '+xhr.responseJSON.message);
			}
		});
		
		
	});
	
	//파일다운로드사유 등록
	$('#modal').on('click', '#popupUnmaskingReason #unmaskingSave', function(e){
		unmask();
	});
	
	$('tbody tr').on('click', function() {
		var carownId = $(this).data('car_owner_id');
		if(carownId == '' || carownId == undefined){
			return;
		}
		
		routie("detail/"+carownId);
	});
	
	//차량정보 조회
	$('.btnCarInfo').on('click', function(e){
		e.stopPropagation();
		var carownId = $(this).parents('tr').data('car_owner_id');
		//console.log('carownId', carownId);
		loadCarDatailPopup(carownId);
	});
	
	//패널티내역 조회
	$('.btnPenalty').on('click', function(e){
		e.stopPropagation();
		var carownId = $(this).parents('tr').data('car_owner_id');
		//console.log('carownId', carownId);
		loadPopup('penalty', carownId);
	});
	
	//페이지네이션 
	$('.searchList ul.pagination li').on('click touch', function() {
		data.nowPage = $(this).data('page-index');
		searchList();
	});
	
	//삭제처리
	$('.btnDelete').on('click', function(e){
		e.stopPropagation();
		var carownId = $(this).parents('tr').data('car_owner_id');
		//console.log('carownId', carownId);
		del(carownId);
	});	
	
	//삭제이력
	$('#btnDeleteHistory').on('click', function(){
		//console.log('carownId', carownId);
		deleteHistory();
	});		
	
</script>