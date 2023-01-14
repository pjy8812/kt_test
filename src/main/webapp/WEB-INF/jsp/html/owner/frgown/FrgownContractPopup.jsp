<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="frgownContractPopup" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-full-width modal-dialog-scrollable">
        <div class="modal-content" style="width:500px">
            <div class="modal-header">
                <h4 class="modal-title">계약 정보</h4>
                <div class="col-2 text-right">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				</div>
            </div> 
            <div class="modal-body">
            	<div class="card-box info-box" data-freight-owner-id="${vo.freightOwnerId}" data-freight-owner-corporate-registration-number="${vo.freightOwnerCorporateRegistrationNumber}">
					<div class="row">
						<div class="col-12">
							<div class="row">
								<label class="col-form-label">사업자 등록번호 : ${vo.freightOwnerCorporateRegistrationNumber}</label>
							</div>
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
<!-- 												<th class="sorting">계약코드</th> -->
												<th class="sorting">요금제 및 요율</th>
												<th class="sorting">변경</th>
											</tr>
										</thead>
										<tbody>
											<tr data-fare-code="${result.freightOwnerFareCode}" 
											    data-fare-code-name="${result.freightOwnerFareCodeName}" 
											    data-fare-apply-date="${result.freightOwnerFareApplyDate}">
<!-- 													<td class="text-left link"> -->
<%-- 														<c:choose> --%>
<%-- 															<c:when test="${empty row.freightOwnerFareCode}">-</c:when> --%>
<%-- 															<c:otherwise>${row.freightOwnerFareCode}</c:otherwise> --%>
<%-- 														</c:choose> --%>
<!-- 													</td> -->
												<td id="FareCodeName">
													<c:choose>
														<c:when test="${empty result.freightOwnerFareCodeName}">-</c:when>
														<c:otherwise>${result.freightOwnerFareCodeName}</c:otherwise>
													</c:choose>
												</td>													
												<td>
													<button type="button" class="btn btn-white waves-effect waves-dark btnFareList"><span id="choiceValue" class="text">변경</span></button>
												</td>													
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>					
					</div>
					<div class="row">
						<div class="col-12">
							<div class="table-responsive col-12">
								<table class="mb-0 col-12">
					                <tr>
										<td class="col-4 mb-0 border-top-0">
											<input type="number" id="fareAdjustFrom" class="form-control text-right" min="-99"  max="99" value="${vo.freightOwnerFareAdjustFrom}" 
												onKeyUp="removeChar(event);onlyNumber(event);" onkeydown="onlyNumber(event);"  oninput="maxLengthCheck(this)" maxLength="3">
										</td>
										<td style="text-align:left">
											%<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;~</span>
										</td>
									    <td class="col-4 mb-0 border-top-0">
											<input type="number" id="fareAdjustTo" class="form-control text-right" min="-99"  max="99" value="${vo.freightOwnerFareAdjustTo}" 
												onKeyUp="removeChar(event);onlyNumber(event);" onkeydown="onlyNumber(event);"  oninput="maxLengthCheck(this)" maxLength="3">
									    </td>
										<td>
											%
										</td>							     								
					                </tr>
								</table>
							</div>						
						</div>
					</div>
            	</div>
                <!-- button-list -->
                <div class="button-list text-center">
                    <button type="button" class="btn btn-dark width-sm  btn-rounded waves-effect waves-dark" data-dismiss="modal">취소</button>
                    <button type="button" name="btnSaveContract" class="btn btn-custom01 width-sm  btn-rounded waves-effect waves-dark">저장</button>
                </div>
                <!-- //button-list -->	           
            </div>
        </div><!-- /.modal-content -->
    </div>
</div>
<script>
	<c:if test="${empty result.resultCode}">
		alert('계약정보 내역 조회중 오류가 발생하였습니다.\r\nERROR: ${result}');
	</c:if>
	<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
		alert('계약정보 내역 조회중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}');
	</c:if>
	
	var freightOwnerFareCode      = '${result.freightOwnerFareCode}';
	var freightOwnerFareCodeName  = '${result.freightOwnerFareCodeName}';
	var freightOwnerFareApplyDate = '${result.freightOwnerFareApplyDate}';
	

	
	//저장
	$('button[name="btnSaveContract"]').on('click touch', function (e) {
		//e.stopPropagation();
		var saveList = [];
		var _id = $('.info-box').data('freight-owner-id'); //회원ID
		$('#dataGrid>tbody>tr').each(function(){
			var tr = $(this);
			var td = tr.children();
			var _freightOwnerId = _id;
			var _fareCode = freightOwnerFareCode;
			var _fareCodeName = freightOwnerFareCodeName;
			var _fareApplyDate = freightOwnerFareApplyDate;

			
			saveList.push({freightOwnerId: _freightOwnerId, fareCode:_fareCode, fareCodeName:_fareCodeName,fareApplyDate:_fareApplyDate});	
		});
		
		//saveData.JSONdata = JSON.stringify(saveList);
		if(confirm('요금제 정보 변경을 진행하시겠습니까?')) {
			data.object.updateData = saveList;
			data.object = encodeURIComponent(JSON.stringify(data.object));
			var _fareAdjustFrom = $('#frgownContractPopup #fareAdjustFrom').val(); // from
			var _fareAdjustTo = $('#frgownContractPopup #fareAdjustTo').val(); // to
			frgownFareAdjustUpdate2(_id, _fareAdjustFrom, _fareAdjustTo, data.object);					
		}
	});
	
	//요금제 및 요율정보 관리
	$('.btnFareList').on('click', function(){
		var _id = $('.info-box').data('freight-owner-id'); //회원ID
		farePopup2(_id);
	});	
	
	$('#frgownContractModal').on('hidden.bs.modal', function () {
		$('body').removeClass('modal-open');
		$('.modal-backdrop').remove();
	});
	
	//요금제 및 요금 조정구간 정보 수정
	function transData(_saveList){
		freightOwnerFareCode = _saveList[0].fareCode;
		freightOwnerFareCodeName = _saveList[0].fareCodeName;
		freightOwnerFareApplyDate = _saveList[0].fareApplyDate;
		
		$('#FareCodeName').text(freightOwnerFareCodeName);
	}		
	
</script>