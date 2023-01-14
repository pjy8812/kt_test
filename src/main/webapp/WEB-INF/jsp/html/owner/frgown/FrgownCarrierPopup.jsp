<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="frgownCarrierPopup" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-full-width modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">운송대행사 검색</h4>
                <div class="col-2 text-right">
	                <button type="button" name="saveBtn" class="btn btn-custom04 btn-rounded waves-effect waves-dark">완료</button>
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				</div>
            </div> 
            <div class="modal-body">
            	<div class="card-box info-box" data-freight-owner-id="${info.freightOwnerId}" data-carrier_id="${info.carrierId}">
					<div class="row">
						<div class="col-6">
							<div class="form-group row mb-3">
								<label for="select05" class="col-2 col-form-label">검색어</label>
								<div class="col-10">
									<div class="row">
										<div class="col-4">
											<select class="form-control" id="searchType">
												<option value="carrierName">운송대행사명</option>
												<option value="carrierId">운송대행사ID</option>
												<option value="carrierCorporateRegistrationNumber">사업자등록번호</option>
												<option value="carrierTelephone">전화번호</option>
												<option value="carrierEmail">이메일주소</option>
											</select>
										</div>
										<div class="col-8">
											<input type="text" class="form-control" id="searchText" placeholder="검색어를 입력하세요." value="${vo.searchText}">
										</div>
									</div>
								</div>
							</div>
						</div>
            		</div>
		 			<div class="row">
						<div class="col-6">
							<h5 class="card-title">
								조회결과 (총 
								<c:choose>
									<c:when test="${empty result.listCount}">0</c:when>
									<c:otherwise><fmt:formatNumber value="${result.listCount}" pattern="#,###"/></c:otherwise>
								</c:choose>
								건)
							</h5>
						</div>
						<div class="col-6 text-right">
							<button type="button" name="searchBtn" class="btn btn-custom04 btn-rounded waves-effect waves-dark">조회</button>
						</div>					
					</div>
				</div>
			    <div class="card-box">
					<div class="row">
						<div class="col-12">
							<div class="scroll-table-wrap">
								<div class="scroll-table-box">
									<table id="dataGrid" class="table dt-responsive nowrap dataTable no-footer dtr-inline text-center" role="grid">
										<thead>
											<tr role="row">
												<th class="sorting_asc">No</th>
												<th class="sorting">사업자등록번호</th>
												<th class="sorting">운송대행사ID</th>
												<th class="sorting">운송대행사명</th>
												<th class="sorting">전화번호</th>
												<th class="sorting">이메일주소</th>
												<th class="sorting">회원가입일</th>
												<th class="sorting">선택</th>
												<th class="sorting">차량</th>
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
												<tr role="row" data-carrier-id="${row.carrierId}" data-carrier-corporate-registration-number="${row.carrierCorporateRegistrationNumber}" data-carrier-id-check="${row.carrierIdCheck}">
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
													<td>
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
														<c:choose>
															<c:when test="${empty row.carrierEmail}">-</c:when>
															<c:otherwise>${row.carrierEmail}</c:otherwise>
														</c:choose>
													</td>													
													<td>
														<fmt:formatDate value="${row.carrierJoinDateTime}" pattern="yyyy.MM.dd"/>
													</td>
													<td>
														<c:if test="${row.carrierIdCheck eq 'Y'}">
															<button type="button" class="btn btn-white waves-effect waves-dark btnChoice"><span id="choiceValue" class="text">선택취소</span></button>
														</c:if>
														<c:if test="${row.carrierIdCheck eq 'N'}">
															<button type="button" class="btn btn-white waves-effect waves-dark btnChoice"><span id="choiceValue" class="text">선택</span></button>
														</c:if>														
													</td>													
													<td>
														<button type="button" class="btn btn-white waves-effect waves-dark btnCarInfo"><i class="fas fa-truck"></i></button>
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
		alert('윤송대행사 조회중 오류가 발생하였습니다.\r\nERROR: ${result}');
	</c:if>
	<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
		alert('윤송대행사 조회중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}');
	</c:if>
	
	//조회버튼
	$('button[name="searchBtn"]').on('click touch', function () {
		data.nowPage = 1;
		searchCarrierList();
	});
	
	//완료버튼
	$('button[name="saveBtn"]').on('click touch', function (e) {
		//e.stopPropagation();
		var saveList = [];
		var deleteList = [];
		var _id = $('.info-box').data('freight-owner-id'); //회원ID
		$('#dataGrid>tbody>tr').each(function(){
			var tr = $(this);
			var td = tr.children();
			var _carrierId = tr.data('carrier-id');
			var _carrierCorporateRegistrationNumber = tr.data('carrier-corporate-registration-number');
			var _originCheck = tr.data('carrier-id-check');
			var choiceText = td.eq(7).children().text();
			
			if(choiceText == '선택취소') {
				saveList.push({carrierId: _carrierId, carrierCorporateRegistrationNumber:_carrierCorporateRegistrationNumber});	
			} else {
				if (_originCheck == 'Y') {
					deleteList.push({carrierId: _carrierId, carrierCorporateRegistrationNumber:_carrierCorporateRegistrationNumber});
				}
			}			
		});
		
		
		if (saveList.length > 1 || deleteList.length > 1) {
			alert('한 건 이상 선택되었습니다. 확인 후 작업하세요!');
			return false;
		} else if (saveList.length == 0 && deleteList.length == 0) {
			alert('운송대행사 선택한 것이 없습니다. 확인 후 작업하세요!');
			return false;		
	    } else {
			//saveData.JSONdata = JSON.stringify(saveList);
			if(confirm('운송대행사 정보 변경을 진행하시겠습니까?')) {
				data.object.updateData = saveList;
				data.object.deleteData = deleteList;
				data.object = encodeURIComponent(JSON.stringify(data.object));
				frgownCarrierUdate(_id, data.object);					
			}
		}
	});	
	
	//조회
	function searchCarrierList(){
		var object = {}; 
		object.nowPage = data.nowPage;
		
		// 검색어
		var searchText = $('#searchText').val();
		if(searchText != '' && searchText != undefined){
			object.searchType = $('#searchType').val();
			object.searchText =searchText;
		}
		
		var _frgownId = $('.info-box').data('freight-owner-id'); //회원ID
		var _carrierId = $('.info-box').data('carrier_id'); //운송대행사ID
		var _object = {};
		_object.frgownId = _frgownId;
		_object.carrierId = _carrierId;
		_object = encodeURIComponent(JSON.stringify(_object));
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/frgown/popup/carrier.select/'/>" + _object,
			data : object,
			cache : false,
			async : true,
			beforeSend: function( xhr ) {
				$('#frgownCarrierModal').empty();
			},
			success : function(result, textStatus, XMLHttpRequest) {
				if($('.modal-backdrop').hasClass('show')){
					$('.modal-backdrop').removeClass('show');
				}
				
				if(hasErrorMap(result, true)){
					return;
				}
				$('#frgownCarrierModal').html(result);
				$('#frgownCarrierPopup').modal('show');
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if(hasErrorMap(xhr, false)){
					return;
				}
			}
		});		
	}
	

	
	//차량정보 조회
	$('.btnCarInfo').on('click', function(e){
		e.stopPropagation();
		var carownId = $(this).parents('tr').data('carrier-id');
		loadCarDatailPopup(carownId);
	});
	
	//load 차량정보 팝업
	function carDatailPopup(_id){
/* 		$.ajax({
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
		}); */ 
	}
	
	//페이지네이션 
	$('#frgownCarrierModal ul.pagination li').on('click touch', function() {
		data.nowPage = $(this).data('page-index');
		searchCarrierList();
	});
	
	//선택 버튼 토글처리
	$('.btnChoice').on('click', function(e){
		//e.stopPropagation();
		var btnChoiceText = $(this).children().text();
		// 마스킹 버튼 텍스트
		if(btnChoiceText === '선택') {
			$(this).children().text('선택취소');
		} else {
			$(this).children().text('선택');
		}
	});	
	
	$('#btnClose').on('click', function (e) {
		e.stopPropagation();
		$('#frgownCarrierPopup').modal('hide');
	});
	
	$('#frgownCarrierModal').on('hidden.bs.modal', function () {
		$('body').removeClass('modal-open');
		$('.modal-backdrop').remove();
		//returnValue();
	});		
	
</script>