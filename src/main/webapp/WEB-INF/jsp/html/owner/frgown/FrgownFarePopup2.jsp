<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="frgownFarePopup2" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-full-width modal-dialog-scrollable">
        <div class="modal-content" style="width:900px">
            <div class="modal-header">
                <h4 class="modal-title">요금제 및 요율 내역 검색</h4>
                <div class="col-2 text-right">
	                <button type="button" name="saveBtn2" class="btn btn-custom04 btn-rounded waves-effect waves-dark">완료</button>
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				</div>
            </div> 
            <div class="modal-body">
            	<div class="card-box info-box" data-freight-owner-id="${vo.freightOwnerId}">
					<div class="row">
						<div class="col-6">
							<div class="form-group row mb-3">
								<label for="select05" class="col-3 col-form-label">검색어</label>
								<div class="col-9">
									<div class="row">
										<div class="col-4">
											<select class="form-control" id="searchType">
												<option value="fareCode">요금제</option>
												<option value="fareName">요율명</option>
												<option value="fareModifier">수정자</option>
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
												<th class="sorting">요금제 및 요율명</th>
												<th class="sorting">적용기간</th>
												<th class="sorting">선택</th>
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
												<tr role="row" data-fare-code="${row.freightOwnerFareCode}" data-fare-code-name="${row.freightOwnerFareCodeName}" data-fare-apply-date="${row.freightOwnerFareApplyDate}">
													<td>
														${idx}
														<c:set var="idx" value="${idx-1}"/>
													</td>
													<td>
														<c:choose>
															<c:when test="${empty row.freightOwnerFareCodeName}">-</c:when>
															<c:otherwise>${row.freightOwnerFareCodeName}</c:otherwise>
														</c:choose>
													</td>
													<td>
														<c:choose>
															<c:when test="${empty row.freightOwnerFareApplyDate}">-</c:when>
															<c:otherwise>${row.freightOwnerFareApplyDate}</c:otherwise>
														</c:choose>
													</td>
													<td>
														<button type="button" class="btn btn-white waves-effect waves-dark btnChoice"><span id="choiceValue" class="text">선택</span></button>
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
<script>
	<c:if test="${empty result.resultCode}">
		alert('요금제 및 요율 내역 조회중 오류가 발생하였습니다.\r\nERROR: ${result}');
	</c:if>
	<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
		alert('요금제 및 요율 내역 조회중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}');
	</c:if>
	
	//조회버튼
	$('button[name="searchBtn"]').on('click touch', function () {
		data.nowPage = 1;
		searchFareList2();
	});
	
	//완료버튼
	$('button[name="saveBtn2"]').on('click touch', function (e) {
		//e.stopPropagation();
		var saveList = [];
		var _id = $('.info-box').data('freight-owner-id'); //회원ID
		$('#dataGrid>tbody>tr').each(function(){
			var tr = $(this);
			var td = tr.children();
			var _freightOwnerId = _id;
			var _fareCode = tr.data('fare-code');
			var _fareCodeName = tr.data('fare-code-name');
			var _fareApplyDate = tr.data('fare-apply-date');
			var choiceText = td.eq(3).children().text();
			
			if(choiceText == '선택취소') {
				saveList.push({freightOwnerId: _freightOwnerId, fareCode:_fareCode, fareCodeName:_fareCodeName,fareApplyDate:_fareApplyDate});	
			}		
		});
		
		
		if (saveList.length > 1) {
			alert('한 건 이상 선택되었습니다. 확인 후 작업하세요!');
			return false;
		} else if (saveList.length == 0) {
			alert('요금제 및 요율을 선택한 것이 없습니다. 확인 후 작업하세요!');
			return false;		
	    } else {
			transData(saveList);
			$('#frgownFarePopup2').modal('hide');
		}
	});	
	
	//조회
	function searchFareList2(){
		var object = {}; 
		object.nowPage = data.nowPage;
		
		// 검색어
		var searchText = $('#searchText').val();
		if(searchText != '' && searchText != undefined){
			object.searchType = $('#searchType').val();
			object.searchText = searchText;
		}
		
		var _id = $('.info-box').data('freight-owner-id'); //화주ID
		object.freightOwnerId = _id;
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/frgown/popup/fare.select2/'/>",
			data : object,
			cache : false,
			async : true,
			beforeSend: function( xhr ) {
				$('#frgownFareModal2').empty();
			},
			success : function(result, textStatus, XMLHttpRequest) {
				if($('.modal-backdrop').hasClass('show')){
					$('.modal-backdrop').removeClass('show');
				}
				
				if(hasErrorMap(result, true)){
					return;
				}
				$('#frgownFareModal2').html(result);
				$('#frgownFarePopup2').modal('show');
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if(hasErrorMap(xhr, false)){
					return;
				}
			}
		});		
	}
	
	//페이지네이션 
	$('#frgownFareModal2 ul.pagination li').on('click touch', function() {
		data.nowPage = $(this).data('page-index');
		searchFareList2();
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
		$('#frgownFarePopup2').modal('hide');
		$('#frgownContractPopup').modal('show');
	});
	
	$('#frgownFareModal2').on('hidden.bs.modal', function () {
		$('#frgownContractPopup').modal('show');
	});		
	
</script>