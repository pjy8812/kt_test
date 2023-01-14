<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="deleteHistoryPopup" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-full-width modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">삭제이력</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div> 
            <div class="modal-body">
            	<div class="card-box">
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
							<div class="row mb-2">
								<div  class="col-6">
								</div>
								<div  class="col-6">
									<select class="form-control" id="historyPagePerRows">
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
												<th class="sorting">복구</th>
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
														<button type="button" class="btn btn-white waves-effect waves-dark btnCarInfoPopup"><i class="fas fa-truck"></i></button>
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
														<button type="button" class="btn btn-white waves-effect waves-dark btnRecovery">복구</button>
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
<div id="carModal"></div>
<script>
	<c:if test="${empty result.resultCode}">
		alert('삭제이력 조회중 오류가 발생하였습니다.\r\nERROR: ${result}');
	</c:if>
	<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
		alert('삭제이력 조회중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}');
	</c:if>
	
	//정렬, 갯수 변경시
	$('#historyPagePerRows').on('change', function() {
		data.nowPage = 1
		searchHistoryList();
	});
	
	//조회
	function searchHistoryList(){
		var object = {}; 
		object.nowPage = data.nowPage;
		
		//목록 수
		if($('#historyPagePerRows').length == 1){
			object.pagePerRows = $('#historyPagePerRows').val();
		}
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/carown/historylist'/>",
			data : object,
			cache : false,
			async : true,
			beforeSend: function( xhr ) {
				$('#historyModal').empty();
			},
			success : function(result, textStatus, XMLHttpRequest) {
				if($('.modal-backdrop').hasClass('show')){
					$('.modal-backdrop').removeClass('show');
				}
				
				if(hasErrorMap(result, true)){
					return;
				}
				$('#historyModal').html(result);
				$('#deleteHistoryPopup').modal('show');
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if(hasErrorMap(xhr, false)){
					return;
				}
			}
		});		
	}
	

	
	//차량정보 조회
	$('.btnCarInfoPopup').on('click', function(e){
		e.stopPropagation();
		var carownId = $(this).parents('tr').data('car_owner_id');
		carDatailPopup(carownId);
	});
	
	//load 차량정보 팝업
	function carDatailPopup(_id){
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/carown/popup/car.select'/>",
			data : {carOwnerId: _id},
			cache : false,
			async : true,
			beforeSend: function( xhr ) {
				$('#carModal').empty();
			},
			success : function(result, textStatus, XMLHttpRequest) {
				if(hasErrorMap(result, true)){
					return;
				}
				
				$('#carModal').html(result);
				$('#popup').modal('show');
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if(hasErrorMap(xhr, false)){
					return;
				}
			}
		}); 
	}
	
	//페이지네이션 
	$('#historyModal ul.pagination li').on('click touch', function() {
		data.nowPage = $(this).data('page-index');
		searchHistoryList();
	});
	
	//복구처리
	$('.btnRecovery').on('click', function(e){
		e.stopPropagation();
		var carownId = $(this).parents('tr').data('car_owner_id');
		//console.log('carownId', carownId);
		recovery(carownId);
	});	
	
	$('#btnClose').on('click', function (e) {
		e.stopPropagation();
		$('#deleteHistoryPopup').modal('hide');
	});
	
	$('#historyModal').on('hidden.bs.modal', function () {
		$('body').removeClass('modal-open');
		$('.modal-backdrop').remove();
		searchList();
	});		
	
</script>