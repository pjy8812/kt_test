<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="isOk" value="true"/>
<c:if test="${empty result.resultCode or result.resultCode ne '00000'}"><c:set var="isOk" value="false"/></c:if>

<!-- Begin page -->
<div class="card-box info-box" data-carrier_id="${vo.carrierId}">
	<h5 class="card-title">운송대행사 상세 정보</h5>
	<div class="table-responsive">
		<table class="table mb-0 basic-table">
			<colgroup>
				<col style="width: 10%;">
				<col/>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">운송대행사명</th>
					<td>${result.carrierInfo.carrierName}</td>
				</tr>
				<tr>
					<th scope="row">운송대행사ID</th>
					<td>
						<c:choose>
							<c:when test="${empty result.carrierInfo.carrierId}">-</c:when>
							<c:otherwise>${result.carrierInfo.carrierId}</c:otherwise>
						</c:choose>
						<button class="btn btn-sm btn-white btn-rounded waves-effect waves-dark" style="margin-left: 10px;" id="btnSubId">Sub ID 추가</button>
					</td>
				</tr>
				<tr>
					<th scope="row">SNS ID</th>
					<td>
						<c:choose>
							<c:when test="${empty result.carrierInfo.carrierSnsId}">-</c:when>
							<c:otherwise>${result.carrierInfo.carrierSnsId}</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th scope="row">사업자등록번호</th>
					<td>
						<c:choose>
							<c:when test="${empty result.carrierInfo.carrierCorporateRegistrationNumber}">-</c:when>
							<c:otherwise>${result.carrierInfo.carrierCorporateRegistrationNumber}</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th scope="row">전화번호</th>
					<td>
						<c:choose>
							<c:when test="${empty result.carrierInfo.carrierTelephone}">-</c:when>
							<c:otherwise>${result.carrierInfo.carrierTelephone}</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th scope="row">이메일주소</th>
					<td>
						<c:choose>
							<c:when test="${empty result.carrierInfo.carrierEmail}">-</c:when>
							<c:otherwise>${result.carrierInfo.carrierEmail}</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th scope="row">추천인 ID</th>
					<td>
						<c:choose>
							<c:when test="${empty result.carrierInfo.carrierRecommendId}">-</c:when>
							<c:otherwise>${result.carrierInfo.carrierRecommendId}</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th scope="row">회원가입일</th>
					<td>
						${fn:split(result.carrierInfo.carrierJoinDateTime, ' ')[0]}
					</td>
				</tr>
				<tr>
					<th scope="row">결제조건</th>
					<td>
						<div class="row">
							<div class="col-2">
								<select class="form-control" id="carrierPaymentCondition">
									<c:forEach var="row" items="${paymentCondition}">
										<option value="${row.codeId}" <c:if test="${row.codeId eq result.carrierInfo.carrierPaymentCondition}">selected</c:if>>${row.codeName}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row">이용상태</th>
					<td>
						<div class="row">
							<div class="col-2">
								<select class="form-control" id="carrierMemberStatus">
									<c:forEach var="row" items="${memberStatus}">
										<option value="${row.codeId}" <c:if test="${row.codeId eq result.carrierInfo.carrierMemberStatus}">selected</c:if>>${row.codeName}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row">차량정보</th>
					<td>
						<button type="button" class="btn btn-white waves-effect waves-dark btnCarInfo"><i class="fas fa-truck"></i></button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<div class="card-box">
	<h5 class="card-title"></h5>
	<div class="row mb-2">
		<div class="col-6"></div>
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
	                                <button type="button" data-src="data:application/png;base64,${file.file}" data-file_name="${file.fileName}" class="btn btn-custom03 btn-rounded waves-effect waves-dark file-name">다운로드</button>
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
				<col style="width: 10%;">
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
							</c:if>
						</c:forEach>
						<c:if test="${corperateRegistration eq 0}">-</c:if>
						<div class="row">
							<div class="col-3">
								<input type="file" id="corperateRegistration" class="form-control-file border">
							</div>
						</div>
					</td>
					<td>
						<c:forEach var="file" items="${result.fileList}">
							<c:if test="${file.fileType eq 'corperateRegistration'}">
								<fmt:formatDate value="${file.attachedFileUploadDate}" pattern="yyyy.MM.dd HH:mm"/>
							</c:if>
						</c:forEach>	
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
						<c:set var="other" value="0" />
						<c:forEach var="file" items="${result.fileList}">
							<c:if test="${file.fileType eq 'other'}">
								<c:set var="other" value="${other+1}"/>
								<a class="file-name" data-src="data:application/png;base64,${file.file}" data-file_name="${file.fileName}"><i class="fe-paperclip mr-1"></i>${file.fileName}</a>	
							</c:if>
						</c:forEach>
						<c:if test="${other eq 0}">-</c:if>
						<div class="row">
							<div class="col-3">
								<input type="file" id="other" class="form-control-file border">
							</div>
						</div>
					</td>
					<td>
						<c:forEach var="file" items="${result.fileList}">
							<c:if test="${file.fileType eq 'other'}">
								<fmt:formatDate value="${file.attachedFileUploadDate}" pattern="yyyy.MM.dd HH:mm"/>
							</c:if>
						</c:forEach>	
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
			<button type="button" class="btn btn-custom02 btn-rounded waves-effect waves-dark" id="btnHistory" <c:if test="${not isOk}">disabled</c:if>>
				변경내역<span class="btn-label-right"><i class="fas fa-history"></i></span>
			</button>
			<button type="button" class="btn btn-dark btn-rounded waves-effect waves-dark" id="btnMasking" <c:if test="${not isOk}">disabled</c:if>>
				마스킹 해제<span class="btn-label-right"><i class="fas fa-eye"></i></span>
			</button>
		</div>
	</div>
	<div class="col-6 text-right">
		<div class="button-list">
			<c:forEach items="${autUriList}" var="autUriList">
				<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'U') gt -1}">
					<button type="button" class="btn btn-dark btn-rounded waves-effect waves-dark" id="btnWithdraw" <c:if test="${not isOk}">disabled</c:if>>
						탈퇴(승인)<span class="btn-label-right"><i class="far fa-trash-alt"></i></span></button>
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
		alert('운송대행사 상세정보 조회중 오류가 발생하였습니다.\r\nERROR: ${result}')
	</c:if>
	<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
		alert('운송대행사 상세정보 조회중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}')
	</c:if>
		
	var carrierCorporateRegistrationNumber = "${result.carrierInfo.carrierCorporateRegistrationNumber}";
	var carrierData = {
			"carrierId": "${result.carrierInfo.carrierIdOrg}",
			"carrierName": "${result.carrierInfo.carrierName}",
			"carrierCorporateRegistrationNumber": "${result.carrierInfo.carrierCorporateRegistrationNumber}",
			"carrierTelephone": "${result.carrierInfo.carrierTelephone}",
			"carrierEmail": "${result.carrierInfo.carrierEmail}",
			"carrierMemberStatus": "${result.carrierInfo.carrierMemberStatus}",
			"carrierRecommendId": "${result.carrierInfo.carrierRecommendId}"
	}
	var maskingYn = "${result.carrierInfo.maskingYn}";
	
	//목록
	$('#btnBack').on('click', function(){
		var tempData = searchedData;
		console.log(tempData);
		if($.isEmptyObject(tempData)){
			routie('list');
		}else{
			routie('list/'+encodeURIComponent(JSON.stringify(tempData)));
		}
	});
	
	//변경내역
	$('#btnHistory').on('click', function(){
		var id =  carrierData.carrierId; //회원ID
// 		var id =  '${result.carrierInfo.carrierId}'; //회원ID
		loadPopup('history', id);
	});
	
	//마스킹해제
	$('#btnMasking').on('click', function(){
		//maskingHistoryType: 메뉴형식 (운송대행사 상세)
		var params = {
		    	"maskingHistoryType" : "carrierInfo"
    	};
	
		if (maskingYn == 'Y') {
			showMakingPopup(params);
		} else {
			location.reload();
		}
	});	
		
	//마스킹해제사유(파일다운로드사유) 등록
	$('#modal').on('click', '#popupUnmaskingReason #unmaskingSave', function(e){
		unmask();
	});
	
	//탈퇴승인
	$('#btnWithdraw').on('click', function(){
		var id = $('.info-box').data('carrier_id'); //회원ID
		loadUpdateReasonPopup('withdraw', id);
	});
	
	//저장
	$('#btnSave').on('click', function(){
		var id =  $('.info-box').data('carrier_id'); //회원ID
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
	
	//보안단 검토사항으로 인하여 첨부파일 다운로드시 마스킹해제 사유등록 팝업 노출 추가 by2022.05.17 mijin.kim
	$('.file-name').on('click', function(){
		$(this).addClass('img_down');
		
		//maskingHistoryType: 메뉴형식 (차주상세)
		var params = {
		    	"maskingHistoryType" : "carrierInfo"
		    	, "type": "download"
	    };
		showMakingPopup(params);
	});
	
	$(".btnCarInfo").on('click', function (_el) {
		// 차량정보 등록 모달 호출
		var params = {
				"carrierId": "${vo.carrierId}"
		}
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/carrier/popup/car.upload'/>",
			data : params,
			cache : false,
			async : true,
			beforeSend: function( xhr ) {
				$('#modal').empty();
			},
			success : function(result, textStatus, XMLHttpRequest) {
				if(hasErrorMap(result, true)){
					return;
				}
				
				$('#modal').html(result);
				$('#popup').modal('show');
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if(hasErrorMap(xhr, false)){
					return;
				}
			}
		}); 
	});
	
	// Sub ID 추가
	$('#btnSubId').on('click', function () {
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/carrier/popup/account'/>",
			data : {
				"carrierId": carrierData.carrierId
			},
			cache : false,
			async : true,
			beforeSend: function( xhr ) {
				$('#modal').empty();
			},
			success : function(result, textStatus, XMLHttpRequest) {
				if(hasErrorMap(result, true)){
					return;
				}
				
				$('#modal').html(result);
				$('#popup').modal('show');
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if(hasErrorMap(xhr, false)){
					return;
				}
			}
		}); 
	});
	
	$(document).ready(function() {
		var btnIcon = '<span class="btn-label-right"><i class="fas fa-eye"></i></span>';

		if (maskingYn == "Y") {
			$('#btnMasking').html("마스킹 해제" + btnIcon);
		} else {
			$('#btnMasking').html("마스킹 처리" + btnIcon);
		}
	});
	
</script>
