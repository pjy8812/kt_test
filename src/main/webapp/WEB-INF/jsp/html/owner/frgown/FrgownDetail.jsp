<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="isOk" value="true"/>
<c:if test="${empty result.resultCode or result.resultCode ne '00000'}"><c:set var="isOk" value="false"/></c:if>
<!-- Begin page -->
<div class="card-box info-box" data-freight-owner-id="${vo.freightOwnerId}" data-carrier_id="${result.carrierId}">
	<h5 class="card-title">화주 상세 정보</h5>
	<div class="table-responsive">
		<table class="table mb-0 basic-table">
			<colgroup>
				<col style="width: 10%;">
				<col/>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">계약구분</th>
					<td>
						<div class="row">
							<div class="col-2">
								<select class="form-control" id="freightOwnerType">
									<c:forEach var="row" items="${freightOwnerType}">
										<option value="${row.codeId}" <c:if test="${row.codeId eq result.freightOwnerType}">selected</c:if>>${row.codeName}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row">사업자구분</th>
					<td>
						<div class="row">
							<div class="col-2">
								<select class="form-control" id="freightOwnerMemberType">
									<c:forEach var="row" items="${memberType}">
										<option value="${row.codeId}" <c:if test="${row.codeId eq result.freightOwnerMemberType}">selected</c:if>>${row.codeName}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row">사업자유형</th>
					<td>
						<div class="row">
							<div class="col-2">
								<select class="form-control" id="freightOwnerBusinessType">
									<c:forEach var="row" items="${businessType}">
										<option value="${row.codeId}" <c:if test="${row.codeId eq result.freightOwnerBusinessType}">selected</c:if>>${row.codeName}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row">화주명</th>
					<td>${result.freightOwnerName}</td>
				</tr>
				<tr>
					<th scope="row">화주ID</th>
					<td id="frgownId">${result.freightOwnerId}</td>
				</tr>
				<tr>
					<th scope="row">SNS ID</th>
					<td>${result.freightOwnerSnsId}</td>
				</tr>
				<tr>
					<th scope="row">화주사</th>
					<td>${result.freightOwnerCorporateRegistrationName}</td>
				</tr>
				<tr>
					<th scope="row">대표자명</th>
					<td>${result.freightOwnerCorporateName}</td>
				</tr>
				<tr>
					<th scope="row">사업자등록번호</th>
					<td>${result.freightOwnerCorporateRegistrationNumber}</td>
				</tr>
				<tr>
					<th scope="row">전화번호</th>
					<td>${result.freightOwnerTelephone}</td>
				</tr>
				<tr>
					<th scope="row">이메일주소</th>
					<td>${result.freightOwnerEmail}</td>
				</tr>
				<tr>
					<th scope="row">회원가입일</th>
					<td>
						<fmt:formatDate value="${result.freightOwnerJoinDateTime}" pattern="yyyy.MM.dd"/>
					</td>
				</tr>
				<tr>
					<th scope="row">최종이용일</th>
					<td>
						<fmt:formatDate value="${result.freightOwnerLastUseDate}" pattern="yyyy.MM.dd"/>
					</td>
				</tr>
				<tr>
					<th scope="row">이용상태</th>
					<td>
						<div class="row">
							<div class="col-2">
								<select class="form-control" id="freightOwnerMemberStatus">
									<c:forEach var="row" items="${memberStatus}">
										<option value="${row.codeId}" <c:if test="${row.codeId eq result.freightOwnerMemberStatus}">selected</c:if>>${row.codeName}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-check-inline ml-2">
								<input type="checkbox" class="form-check-input" id="freightOwnerFileAdminCheckYN" value="${result.fileAdminCheckYn}"  <c:if test="${result.fileAdminCheckYn eq 'Y'}">checked</c:if>>
								<label class="form-check-label" for="freightOwnerFileAdminCheckYN">관리자 가입서류 확인</label>
							</div>
						</div>
					</td>
				</tr>
				
				<tr data-fare-adjust-from="${result.freightOwnerFareAdjustFrom}" data-fare-adjust-to="${result.freightOwnerFareAdjustTo}"  data-corporate-registration-number="${result.freightOwnerCorporateRegistrationNumber}">
					<th scope="row">요금 조정 구간</th>
					<td>
						<div class="row">
							<div class="col-2">
								<c:if test="${not empty result.freightOwnerFareAdjustFrom and not empty result.freightOwnerFareAdjustTo}">
									<label class="col-form-label">${result.freightOwnerFareAdjustFrom}%</label><label class="col-form-label">  ~ </label><label class="col-form-label">${result.freightOwnerFareAdjustTo}%</label>
								</c:if>							
							</div>
							<div>
								<button type="button" class="btn btn-white waves-effect waves-dark btnFareAdjustManage">관리</button>	
							</div>
						</div>
					</td>
				</tr>				
				<tr>
					<th scope="row">위약수수료</th>
					<td>
						<c:if test="${not empty result.penalty.freightOwnerPenaltyCharge}">
						<label class="mr-2">
							<fmt:formatNumber value="${result.penalty.freightOwnerPenaltyCharge}" pattern="#,###"/>원
						</label>
						</c:if>
						<button type="button" id="btnPopup01" class="btn btn-white waves-effect waves-dark"><i class=" far fa-newspaper"></i></button>
					</td>
				</tr>
				<tr>
					<th scope="row">청구 횟수</th>
					<td>
						<div class="row">
							<div class="col-2">
								<select class="form-control" id="freightOwnerMonthSettlementNum">
									<option value="0" <c:if test="${result.freightOwnerMonthSettlementNum eq '0'}">selected</c:if>>0회</option>
									<option value="1" <c:if test="${result.freightOwnerMonthSettlementNum eq '1'}">selected</c:if>>1회 (매월 1일)</option>
									<option value="2" <c:if test="${result.freightOwnerMonthSettlementNum eq '2'}">selected</c:if>>2회 (매월 1일, 15일)</option>
								</select>
							</div>
							<label class="col-form-label">* 정산 횟수 변경 시, 익일 정산 내역부터 반영됩니다</label>
						</div>
					</td>
				</tr>
				<c:if test="${!empty result.freightOwnerType and result.freightOwnerType eq 'contract'}">
					<tr>
						<th scope="row">우선 노출</th>
						<td>
							<div class="col-10 col-form-label p-1 text-left">
								<div class="form-check form-check-inline">
									<input type="radio" id="priorityExposureApp" name="freightOwnerPriorityExposure" class="form-check-input" value="App" <c:if test="${!empty result.freightOwnerPriorityExposure and result.freightOwnerPriorityExposure eq 'App'}">checked</c:if>>
									<label class="form-check-label" for="paymentMethodN">차주App</label>
								</div>
								<div class="form-check form-check-inline pl-2">
									<input type="radio" id="priorityExposureWeb" name="freightOwnerPriorityExposure" class="form-check-input" value="Web" <c:if test="${!empty result.freightOwnerPriorityExposure and result.freightOwnerPriorityExposure eq 'Web'}">checked</c:if>>
									<label class="form-check-label" for="paymentMethodM">운송대행사Web</label>
								</div>
							</div>
						</td>
					</tr>
				</c:if>				
			</tbody>
		</table>
	</div>
</div>
<div class="card-box">
	<h5 class="card-title">계약 정보</h5>
	<div class="table-responsive">
		<table class="table mb-0 basic-table">
			<colgroup>
				<col style="width: 5%;">
				<col style="width: 8%;">
				<col style="width: 40%;">
			</colgroup>
			<tbody>
			    <!--
				<tr>
					<th scope="row">계약요율코드</th>
					<td>
						<c:choose>
							<c:when test="${empty result.freightOwnerFareCode}">-</c:when>
							<c:otherwise>${result.freightOwnerFareCode}</c:otherwise>
						</c:choose>						
					</td>
					<td>
						<c:if test="${not empty result.freightOwnerFareCode}">
 							<button type="button" class="btn btn-white waves-effect waves-dark btnCancelContract">계약해지</button> 
						</c:if>
					</td>					
				</tr>
				-->
				<tr data-fare-code="${result.freightOwnerFareCode}" data-fare-apply-date="${result.freightOwnerFareApplyDate}" data-fare-apply-from-date="${result.freightOwnerFareApplyFromDate}" data-fare-apply-to-date="${result.freightOwnerFareApplyToDate}">
					<th scope="row">요율명</th>
					<td>
						<c:choose>
							<c:when test="${empty result.freightOwnerFareCodeName}">-</c:when>
							<c:otherwise>${result.freightOwnerFareCodeName}</c:otherwise>
						</c:choose>					
					</td>
					<td>
						<button type="button" class="btn btn-white waves-effect waves-dark btnContractManage">관리</button>
					</td>					
				</tr>
				<tr>
					<th scope="row">운송대행사</th>
					<c:choose>
						<c:when test="${empty result.carrierName}"><td>-</td></c:when>
						<c:otherwise><td class="text-left link">${result.carrierName}</td></c:otherwise>
					</c:choose>						
					<td>
						<c:if test="${!empty result.freightOwnerType and result.freightOwnerType eq 'contract'}">
							<button type="button" class="btn btn-white waves-effect waves-dark btnCarrierManage">관리</button>
						</c:if>
					</td>				
				</tr>
			</tbody>
		</table>
	</div>	
</div>
<div class="card-box">
	<h5 class="card-title"></h5>
	<div class="row mb-2">
		<div class="col-6">
			<button type="button" class="btn btn-dark btn-rounded waves-effect waves-dark" id="btnSendSms" disabled>
				파일수정 SMS 발송(<span id="fileCheckCtn">0</span>)<span class="btn-label-right"><i class="far fa-envelope"></i></span>
			</button>
		</div>
		<div class="col-6 text-right">
			<button type="button" class="btn btn-dark btn-rounded waves-effect waves-dark" data-toggle="modal" data-target="#pop-alert-0301">미리보기</button>
		</div>
	</div>
    <!-- pop-mid-upload -->
    <div id="pop-alert-0301" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">첨부파일 미리보기</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                </div>
                <div class="modal-body doc-preview">
                    <ul class="nav nav-btns">
                        <li class="nav-item">
							<c:set var="corperateRegistration" value="0"/>
							<c:forEach var="file" items="${result.fileList}">
							<c:if test="${file.fileType eq 'corperateRegistration'}">
                            <a href="#file-preview-001" data-toggle="tab" aria-expanded="true" class="nav-link active">사업자등록증</a>
							</c:if>
							</c:forEach>
                            
                        </li>
                        <li class="nav-item">
								<c:set var="other" value="0"/>
								<c:forEach var="file" items="${result.fileList}">
								<c:if test="${file.fileType eq 'other'}">
                            <a href="#file-preview-006" data-toggle="tab" aria-expanded="false" class="nav-link">기타</a>
							</c:if>
							</c:forEach>
                        </li>
                    </ul>
                    <!-- //.nav-tabs -->
                    <div class="tab-content">
                        <div class="tab-pane show active" id="file-preview-001">
                        	<div class="img-wrap">
								<c:set var="corperateRegistration" value="0"/>
								<c:forEach var="file" items="${result.fileList}">
								<c:if test="${file.fileType eq 'corperateRegistration'}">
					             <a class="file-name" data-src="data:application/png;base64,${file.file}"><img src="data:application/png;base64,${file.file}" alt=""></a>
								</c:if>
								</c:forEach>
							</div>
                            <div class="btns">
								<c:set var="corperateRegistration" value="0"/>
								<c:forEach var="file" items="${result.fileList}">
								<c:if test="${file.fileType eq 'corperateRegistration'}">
	                                <button type="button" data-src="data:application/png;base64,${file.file}" data-file_name="${file.fileName}" class="btn btn-custom03 btn-rounded waves-effect waves-dark file-name">다운로드</button>
								</c:if>
								</c:forEach>
                            </div>
                        </div>
                        <div class="tab-pane show" id="file-preview-006">
                        	<div class="img-wrap">
								<c:set var="other" value="0"/>
								<c:forEach var="file" items="${result.fileList}">
								<c:if test="${file.fileType eq 'other'}">
					             <a class="file-name" data-src="data:application/png;base64,${file.file}"><img src="data:application/png;base64,${file.file}" alt=""></a>
								</c:if>
								</c:forEach>
							</div>
                            <div class="btns">
								<c:set var="other" value="0"/>
								<c:forEach var="file" items="${result.fileList}">
								<c:if test="${file.fileType eq 'other'}">
	                                <button type="button" data-src="data:application/png;base64,${file.file}" data-file_name="${file.fileName}" class="btn btn-custom03 btn-rounded waves-effect waves-dark file-name">다운로드5</button>
								</c:if>
								</c:forEach>
                            </div>
                   	 	</div>
                   	</div>
                    <!-- //.tab-content -->
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->			
	<div class="table-responsive">
		<table class="table mb-0 basic-table">
			<colgroup>
				<col style="width: 4%;">
				<col style="width: 10%;">
				<col style="/">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">
						<input type="checkbox" name="chk" value="사업자등록증" <c:if test="${not isOk}">disabled</c:if>/>
					</th>
					<th scope="row">
						첨부파일<br/>(사업자등록증)
					</th>
					<td>
						<c:set var="corperateRegistration" value="0"/>
						<c:forEach var="file" items="${result.fileList}">
							<c:if test="${file.fileType eq 'corperateRegistration'}">
								<c:set var="corperateRegistration" value="${corperateRegistration+1}"/>
								<a class="file-name" data-src="data:application/png;base64,${file.file}" data-file_name="${file.fileName}"><i class="fe-paperclip mr-1"></i>${file.fileName}</a>
								<%-- <a class="file-name" href="data:application/png;base64,${file.file}" download="${file.fileName}"><i class="fe-paperclip mr-1"></i>${file.fileName}</a> --%>
							</c:if>
						</c:forEach>
						<c:if test="${corperateRegistration eq 0}">-</c:if>
					</td>
				</tr>
				<tr>
					<th scope="row">
						<input type="checkbox" name="chk" value="기타" <c:if test="${not isOk}">disabled</c:if>/>
					</th>
					<th scope="row">
						첨부파일<br/>(기타)
					</th>
					<td>
						<c:set var="others" value="0"/>
						<c:forEach var="file" items="${result.fileList}">
							<c:if test="${file.fileType eq 'others'}">
								<c:set var="others" value="${others+1}"/>
								<a class="file-name" data-src="data:application/png;base64,${file.file}" data-file_name="${file.fileName}"><i class="fe-paperclip mr-1"></i>${file.fileName}</a>	
								<%-- <a class="file-name" href="data:application/png;base64,${file.file}" download="${file.fileName}"><i class="fe-paperclip mr-1"></i>${file.fileName}</a> --%>
							</c:if>
						</c:forEach>
						<c:if test="${others eq 0}">-</c:if>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<div class="row">
	<div class="col-6">
		<div class="button-list">
			<button type="button" class="btn btn-custom02 btn-rounded waves-effect waves-dark" id="btnBack">목록</button>
			<button type="button" class="btn btn-custom02 btn-rounded waves-effect waves-dark" id="btnHistory"
				<c:if test="${not isOk}">disabled</c:if>>
				변경내역<span class="btn-label-right"><i class="fas fa-history"></i></span>
			</button>
			<button type="button" class="btn btn-dark btn-rounded waves-effect waves-dark" id="btnMasking"
				<c:if test="${not isOk}">disabled</c:if>>
				마스킹 해제<span class="btn-label-right"><i class="fas fa-eye"></i></span>
			</button>
		</div>
	</div>
	<div class="col-6 text-right">
		<div class="button-list">
		<c:forEach items="${autUriList}" var="autUriList">
			<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'U') gt -1}">
			<button type="button" class="btn btn-dark btn-rounded waves-effect waves-dark" id="btnWithdraw" <c:if test="${not isOk}">disabled</c:if>> 탈퇴(승인)<span class="btn-label-right"><i class="far fa-trash-alt"></i></span></button>
			<button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark" id="btnSave" <c:if test="${not isOk}">disabled</c:if>>저장</button>
			</c:if>
		</c:forEach>
		</div>
	</div>
</div>

<div id="modal"></div>

<!-- End page -->
<script>
	<c:if test="${empty result.resultCode}">
		alert('화주 상세정보 조회중 오류가 발생하였습니다.\r\nERROR: ${result}')
	</c:if>
	<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
		alert('화주 상세정보 조회중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}')
	</c:if>
	
	$(document).ready(function() {
		//관리자확인 
		$('#freightOwnerFileAdminCheckYN').on('change', function(){
			if($(this).is(':checked')){
				$(this).val('Y');
			}else{
				$(this).val('N');
			}
		});
		
		//첨부파일 체크박스
		$('input[name="chk"]').on('change', function(){
			var length = $('input[name="chk"]:checked').length;
			$('#btnSendSms #fileCheckCtn').html(length);
			
			//선택된 첨부파일이 없을 경우 버튼 비활성화
			if(length == 0){ 
				$('#btnSendSms').attr('disabled', true);
			}else{
				$('#btnSendSms').attr('disabled', false);
			}
		});
		
		//위약수수료 내역버튼 클릭
		$('#btnPopup01').on('click', function(){
			var id = $('.info-box').data('freight-owner-id'); //회원ID
			loadPopup('placebofee', id);
		});
		
		//파일수정요청 
		$('#btnSendSms').on('click', function(){
			var length = $('input[name="chk"]:checked').length;
			if(length == 0){ //선택된 파일이 없을 경우 return;
				return; 
			}
			
			if(!confirm('선택한 첨부파일에 대하여 재요청 SMS를 발송하시겠습니까?')){
				return;
			}
			
			sendSMS();
		});
		
		//목록버튼 클릭
		$('#btnBack').on('click', function(){
			var tempData = searchedData;
			if($.isEmptyObject(tempData)){
				routie('list');
			}else{
				routie('list/'+encodeURIComponent(JSON.stringify(tempData)));
			}
		});
		
		//변경내역버튼 클릭
		$('#btnHistory').on('click', function(){
			var id = $('.info-box').data('freight-owner-id'); //회원ID
			loadPopup('history', id);
		});
		
		//마스킹해제
		$('#btnMasking').on('click', function(){
			$.ajax({
			    type : "POST",
			    url : "<c:url value='/ui/service/common/popup/reason.unmasking'/>",
			    data : {
			    	"maskingHistoryType" : "frgownInfo"
			    },
			    cache : false,
			    async : true,
			    success : function(data, textStatus, XMLHttpRequest) {
					if (hasErrorMap(data, true)){
						return;
					}
					
					$('#modal').html(data);
					$('#popupUnmaskingReason').modal('show');
			    },
			    error : function(xhr, ajaxOptions, thrownError) {
					if (hasErrorMap(xhr, false)){
						return;
					}
			    }
			}); 
		
			
		});	
		
		//마스킹해제사유 등록
		$('#modal').on('click', '#popupUnmaskingReason #unmaskingSave', function(e){
			unmask();
		});
		
		//탈퇴(승인)버튼 클릭
		$('#btnWithdraw').on('click', function(){
			var id = $('.info-box').data('freight-owner-id'); //회원ID
			loadUpdateReasonPopup('withdraw', id);
		});
		
		//저장버튼 클릭
		$('#btnSave').on('click', function(){
			var id = $('.info-box').data('freight-owner-id'); //회원ID
			//변경사유팝업 load
			loadUpdateReasonPopup('update', id);
		});
		
		//변경사유poup> 저장
		$("#modal").on('click', '#popupUpdateReason #btnUpdate', function(){
			var type = $('#modal #popupUpdateReason').data('param_type');
			if(type == 'update'){
				update(); //수정
			}else if(type == 'withdraw'){
				withdraw(); //탈퇴(승인)
			}else{
				//console.log(type);
				return;
			}
		});
		
		//요금 조정구간poup> 저장
		$("#frgownFareAdjustModal").on('click', '#frgownFareAdjustPopup #btnUpdate', function(){
			var _frgownId = $('.info-box').data('freight-owner-id'); //회원ID
			var _fareAdjustFrom = $('#frgownFareAdjustPopup #fareAdjustFrom').val(); // from
			var _fareAdjustTo = $('#frgownFareAdjustPopup #fareAdjustTo').val(); // to
			frgownFareAdjustUpdate(_frgownId, _fareAdjustFrom, _fareAdjustTo); //수정	
			
		});		
		
		//운송대행사 관리 클릭
		$('.btnCarrierManage').on('click', function(){
			var _frgownId = $('.info-box').data('freight-owner-id'); //회원ID
			var _carrierId = $('.info-box').data('carrier_id'); //운송대행사ID
			var _object = {};
			_object.frgownId = _frgownId;
			_object.carrierId = _carrierId;
			_object = encodeURIComponent(JSON.stringify(_object));
			carrierPopup(_object);
		});
		
		//요금제 및 요율정보 관리
		$('.btnContractManage').on('click', function(){
			var _object = {};
			var _id = $('.info-box').data('freight-owner-id'); //회원ID
			var _fareCode          = $(this).parents('tr').data('fare-code'); //요금제 코드
			var _fareApplyDate     = $(this).parents('tr').data('fare-apply-date'); //요금제 적용일자
			var _fareApplyFromDate = $(this).parents('tr').data('fare-apply-from-date'); //요금제 적용일자(from)
			var _fareApplyToDate   = $(this).parents('tr').data('fare-apply-to-date'); //요금제 적용일자(to)
			_object.frgownId = _id;
			_object.fareCode  = _fareCode;
			_object.fareApplyDate     = _fareApplyDate;
			_object.fareApplyFromDate = _fareApplyFromDate;
			_object.fareApplyToDate   = _fareApplyToDate;
			_object = encodeURIComponent(JSON.stringify(_object));
			farePopup(_object);
		});
		
		//요금 조정구간 팝업
		$('.btnFareAdjustManage').on('click', function(){
			var _object = {};
			var _id = $('.info-box').data('freight-owner-id'); //회원ID
			var _fareAdjustFrom    = $(this).parents('tr').data('fare-adjust-from'); //from
			var _fareAdjustTo      = $(this).parents('tr').data('fare-adjust-to'); //요금제 적용일자
			var _fareAdjustTo      = $(this).parents('tr').data('fare-adjust-to'); //사업자 등록번호
			var _number            = $(this).parents('tr').data('corporate-registration-number'); //사업자 등록번호
			fareAdjustPopup(_id, _fareAdjustFrom, _fareAdjustTo, _number);
		});			
	});
	
	//보안단 검토사항으로 인하여 첨부파일 다운로드시 마스킹해제 사유등록 팝업 노출 추가 by2022.05.17 mijin.kim
	$('.file-name').on('click', function(){
		$(this).addClass('img_down');
		
		$.ajax({
		    type : "POST",
		    url : "<c:url value='/ui/service/common/popup/reason.unmasking'/>",
		    data : {
		    	"maskingHistoryType" : "frgownInfo"
		    	, "type": "download"
		    },
		    cache : false,
		    async : true,
		    success : function(data, textStatus, XMLHttpRequest) {
				if (hasErrorMap(data, true)){
					return;
				}
				
				$('#modal').html(data);
				$('#popupUnmaskingReason').modal('show');
		    },
		    error : function(xhr, ajaxOptions, thrownError) {
				if (hasErrorMap(xhr, false)){
					return;
				}
		    }
		}); 
	});
	
	// 상세페이지 
	$('tr .link').not('.noData').css('cursor', 'pointer');
	$('tr .link').addClass('color-text-primary');
	$('tr .link').on('click', function() {
		var carrierId = $(this).data('carrier-id');
		if(carrierId == '' || carrierId == undefined){
			return;
		}
		
		//routie("detail/"+carrierId);
	});	
	
	// 월 정산 횟수 변경 by 2022.05.27 kyunghyun.yi
	$('#freightOwnerMonthSettlementNum').on('change', function(){
		let xmlHttpRequest;
		if(window.XMLHttpRequest){// code for Firefox, Mozilla, IE7, etc.
			xmlHttpRequest = new XMLHttpRequest();
		}else if(window.ActiveXObject){// code for IE5, IE6
			xmlHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
		}else{
			return;
		}

		xmlHttpRequest.open('HEAD', window.location.href.toString(), false);
		xmlHttpRequest.setRequestHeader("ContentType", "text/html");
		xmlHttpRequest.send('');

		const serverDate = xmlHttpRequest.getResponseHeader("Date");
		const now = new Date(serverDate);
		const date = now.getDate();

		switch($(this).val()){
			case '0' : 
				if(! confirm('월 정산 횟수를 0회로 변경 시, 세금계산서 자동발행은 중지되며\n미정산 건은 수기정산만으로 처리하셔야 합니다. 변경하시겠습니까?')) {
					$(this).val(${result.freightOwnerMonthSettlementNum});
				}
				break;
			default :
				if(date >= 5 && date <= 10){
					if(!confirm('월 정산 횟수 변경에 따른 세금계산서 자동발행은 당월 정산 건부터 적용됩니다.\n본 화주에 대한 전월까지의 미정산 내역은 수기정산처리하세요.\n변경하시겠습니까?')) {
						$(this).val(${result.freightOwnerMonthSettlementNum});
					}
				}else{
					alert("월 정산 횟수 변경은 매월 5일~10일 사이에만 가능합니다.\n※단, 1회/2회에서 0회 변경은 언제든 가능합니다.");
					$(this).val(${result.freightOwnerMonthSettlementNum});
				}
				break;
		}
	});
	
</script>
