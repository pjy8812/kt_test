<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" 
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ page import="java.sql.*" %>

<!-- Begin view -->
<div class="card-box">
	<h5 class="card-title">
		약관정보
	</h5>
	<div class="row">
		<div class="table-responsive">
			<table class="table dataTable mb-0 basic-table">
				<colgroup>
					<col style="width: 10%;">
					<col>
					<col style="width: 10%;">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row" class="">약관명</th>
						<td colspan="3">
							<div class="row">
								<div class="col-6">
									<c:choose>
										<c:when test="${'insert' eq mode}">
											<div class="row">
												<input type="text" class="form-control form-control-sm" id="termsName" name="termsName" placeholder="약관명을 입력하세요."
												value="${result.termsName}" maxlength="100" onkeyup="fnCheckByte(100, this)"/>
												
											</div>
										</c:when>
										<c:otherwise>
											${result.termsName}
										</c:otherwise>					
									</c:choose> 
								</div>
								<div>
									<c:choose>
										<c:when test="${'insert' eq mode}">
											<label class="pl-2 pt-1" style="float: left;"><span id="nowByte">0</span>/100 byte</label>
										</c:when>
									</c:choose>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row" class="">서비스 구분</th>
						<td>
							<div class="row">
								<div class="col-10">
									<div class="form-check mt-1 form-check-primary">
										<c:choose>
											<c:when test="${'update' eq mode and null ne result.termsServiceClassify}">
												<input class="form-check-input" type="radio" id="termsServiceClassifyFrg" name="termsServiceClassify" value="화주"<c:if test="${'화주' eq result.termsServiceClassify}"> checked="checked"</c:if> disabled="disabled">
												<label class="form-check-label" for="termsServiceClassifyFrg">화주</label>
												<input class="form-check-input ml-2" type="radio" id="termsServiceClassifyCar" name="termsServiceClassify" value="차주"<c:if test="${'차주' eq result.termsServiceClassify}"> checked="checked"</c:if> disabled="disabled">
												<label class="form-check-label ml-4" for="termsServiceClassifyCar">차주</label>
											</c:when>
											<c:otherwise>
												<input class="form-check-input" type="radio" id="termsServiceClassifyFrg" name="termsServiceClassify" value="화주" checked="checked">
												<label class="form-check-label" for="termsServiceClassifyFrg">화주</label>
												<input class="form-check-input ml-2" type="radio" id="termsServiceClassifyCar" name="termsServiceClassify" value="차주">
												<label class="form-check-label ml-4" for="termsServiceClassifyCar">차주</label>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</td>
						<th scope="row" class="">화면 구분</th>
						<td>
							<div class="row">
								<div class="col-10">
									<select class="form-control" id="termsType" name="termsType"<c:if test="${'update' eq mode}"> disabled="disabled"</c:if>>
										<c:forEach var="termsTypeList" items="${termsTypeList}">
											<option value="${termsTypeList.codeId}"<c:if test="${termsTypeList.codeId eq result.termsType}"> selected="selected"</c:if>>${termsTypeList.codeName}</option>
										</c:forEach>
									</select>
									<%-- <select class="form-control" id="termsDisplayClassify" name="termsDisplayClassify"<c:if test="${'update' eq mode}"> disabled="disabled"</c:if>>
										<option value="회원가입"<c:if test="${'회원가입' eq result.termsDisplayClassify}"> selected="selected"</c:if>>회원가입</option>
										<option value="Footer"<c:if test="${'Footer' eq result.termsDisplayClassify}"> selected="selected"</c:if>>Footer</option>
									</select> --%>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row" class="">개정 발효일</th>
						<td>
							<div class="row">
								<div class="col-10">
									<input type="text" id="termsRevisionEffectiveDatePicker" class="form-control flatpickr-input active"
										<c:if test="${'update' eq mode}"> disabled="disabled"</c:if> placeholder="기간선택" name="termsRevisionEffectiveDatePicker" readonly="readonly">
								</div>
							</div>
						</td>
						<th scope="row" class="">개정 버전</th>
						<td>
							<div class="row">
								<div class="col-10">
									<c:choose>
										<c:when test="${'insert' eq mode}">
											<input type="text" class="form-control form-control-sm" id="termsRevisionVersion" name="termsRevisionVersion" placeholder="개정버전을 입력하세요." maxlength="30">
										</c:when>
										<c:when test="${'update' eq mode}">
											<select class="form-control" id="termsRevisionVersion" name="termsRevisionVersion">
												<c:forEach var="revisionList" items="${result.revisionList}">
													<option value="${revisionList.termsRevisionSeq}"
														data-termsrevisionversion="${revisionList.termsRevisionVersion}"
														data-termsrevisioneffectivedatebylongtype="${revisionList.termsRevisionEffectiveDateByLongType}"
														data-termsrevisionrequiredyn="${revisionList.termsRevisionRequiredYn}"
														data-termsrevisionusestartdatebylongtype="${revisionList.termsRevisionUseStartDateByLongType}"
														data-termsrevisionuseenddatebylongtype="${revisionList.termsRevisionUseEndDateByLongType}"
														<%-- data-termsrevisioncontent='${revisionList.termsRevisionContent}' --%>
														data-termsrevisionwriter="${revisionList.termsRevisionWriter}" 
														data-termsrevisionregisterdatebylongtypestring="${revisionList.termsRevisionRegisterDateByLongTypeString}" 
														>${revisionList.termsRevisionVersion}</option>
												</c:forEach>
											</select>
										</c:when>
										<c:otherwise>
											-
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row" class="">필수여부</th>
						<td>
							<div class="row">
								<div class="col-10 updateTermsRevisionRequiredYn">
									<c:choose>
								 		<c:when test="${'insert' eq mode}">
											<div class="form-check mt-1 form-check-primary">
												<input class="form-check-input" type="radio" id="termsRequiredYn" name="termsRequiredYn" value="Y" checked="checked">
												<label class="form-check-label" for="termsRequiredYn">Y</label>
												<input class="form-check-input ml-2" type="radio" id="termsRequiredYn" name="termsRequiredYn" value="N">
												<label class="form-check-label ml-4" for="termsRequiredYn">N</label>
											</div>
								 		</c:when>
								 		<c:otherwise>
								 			${result.termsYn}
								 		</c:otherwise>
									</c:choose>
								</div>
							</div>
						</td>
						<th scope="row" class="">사용기간</th>
						<td>
							<div class="row">
								<div class="col-10">
									<input type="text" id="termsRevisionUseDatePicker" class="form-control flatpickr-input active" 
									<c:if test="${'update' eq mode}"> disabled="disabled"</c:if> placeholder="기간선택" name="termsRevisionUseDatePicker" readonly="readonly">
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row" class="">본문</th>
						<td colspan="3" class="updateEditor">
							<c:choose>
								<c:when test="${'insert' eq mode}">
									<!-- 에디터 > TEXTAREA -->
									<!-- <div id="editor" style="height: 300px;">
									</div> -->
									<textarea class="form-control" rows="15" id="editor" style="height: 300px;" placeholder="약관 내용을 입력하세요."></textarea>
								</c:when>
								<c:otherwise>
								</c:otherwise>					
							</c:choose> 
						</td>
					</tr>
					<c:if test="${'update' eq mode}">
						<tr>
							<th scope="row" class="">작성자</th>
							<td class="termsWriter">
							</td>
							<th scope="row" class="">작성일시</th>
							<td class="termsRevisionRegisterDate">
							</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row">
		<div class="col">
			<div class="button-list text-center">
				<c:if test="${'insert' eq mode}">
					<button type="button" class="btn btn-dark btn-rounded waves-effect waves-dark" id="cancelBtn" name="cancelBtn">
						취소
					</button>
					<button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark" id="saveBtn" name="saveBtn">
						등록
					</button>
				</c:if>
				<c:if test="${'update' eq mode}">
					<button type="button" class="btn btn-custom02 btn-rounded waves-effect waves-dark" id="listBtn" name="listBtn">
						목록
					</button>
					<!-- <button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark" id="updateBtn" name="updateBtn">
						저장
					</button> -->
					<c:forEach items="${autUriList}" var="autUriList">
						<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'C') gt -1}">
							<button type="button" class="btn btn-custom02 btn-rounded waves-effect waves-dark" id="addRevisionBtn" name="addRevisionBtn">
								개정 추가
							</button>
						</c:if>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
</div>
<!-- End view -->

<%-- 개정버전 등록 --%>
<c:if test="${'update' eq mode}">
	<div id="addTermsModal" class="modal fade" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-full-width modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">개정버전 등록</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<h5 class="card-title">약관 정보</h5>
					
						<table class="table mb-0 basic-table">
							<colgroup>
								<col style="width: 10%;">
								<col>
								<col style="width: 10%;">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" class="">개정 버전</th>
									<td>
										<div class="row">
											<div class="col-10">
												<input type="text" class="form-control form-control-sm" id="termsRevisionVersionModal" name="termsRevisionVersionModal" placeholder="개정버전을 입력하세요." maxlength="30">
											</div>
										</div>
									</td>
									<th scope="row" class="">개정 발효일</th>
									<td>
										<div class="row">
											<div class="col-10">
												<input type="text" id="termsRevisionEffectiveDateByLongTypeModal" class="form-control flatpickr-input active" placeholder="기간선택" name="termsRevisionEffectiveDateByLongTypeModal" readonly="readonly">
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row" class="">사용여부</th>
									<td>
										<div class="row">
											<div class="col-10">
												<div class="form-check mt-1 form-check-primary">
													<input class="form-check-input" type="radio" id="termsRevisionRequiredYnYModal" name="termsRevisionRequiredYnModal" value="Y" checked="checked">
													<label class="form-check-label" for="termsRevisionRequiredYnYModal">Y</label>
													<input class="form-check-input ml-2" type="radio" id="termsRevisionRequiredYnNModal" name="termsRevisionRequiredYnModal" value="N">
													<label class="form-check-label ml-4" for="termsRevisionRequiredYnNModal">N</label>
												</div>
											</div>
										</div>
									</td>
									<th scope="row" class="">사용기간</th>
									<td>
										<div class="row">
											<div class="col-10">
												<input type="text" id="termsRevisionUseDateModal" class="form-control flatpickr-input active" placeholder="기간선택" name="termsRevisionUseDateModal" readonly="readonly">
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row" class="">본문</th>
									<td colspan="3">
										<!-- 에디터 > TEXTAREA -->
										 <!-- <div id="editorModal" style="height: 300px;">
										</div> -->
										<textarea class="form-control" rows="15" id="editorModal" style="height: 300px;" placeholder="약관 내용을 입력하세요."></textarea>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="row">
						<div class="col">
							<div class="button-list text-center">
								<button type="button"
									class="btn btn-dark btn-rounded waves-effect waves-dark"
									id="cancelBtnModal" name="cancelBtnModal">취소</button>
								<button type="button"
									class="btn btn-custom01 btn-rounded waves-effect waves-dark"
									id="saveBtnModal" name="saveBtnModal">저장</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:if>

<%-- 개정버전 내용 set --%>
<c:forEach var="revisionList" items="${result.revisionList}">
	<div class="revisionContentArea d-none" data-seq="${revisionList.termsRevisionSeq}">
		${revisionList.termsRevisionContent}
	</div>
</c:forEach>

<script>
	
	// console.log('${mode}');
	
	var searchedData;
	var detailData = {};
	
	detailData = {
		termsRevisionEffectiveDate : new Date().setHours(0, 0, 0, 0) // 개정발효일 
		, termsRevisionVersion : null // 개정버전 
		, termsUseStartDateByLongType : new Date().setHours(0, 0, 0, 0) // 사용시작일시
		, termsUseEndDateByLongType : new Date().setHours(0, 0, 0, 0) // 사용종료일시
		
		, termsRevisionUseStartDateByLongType : new Date().setHours(0, 0, 0, 0) // 개정-사용시작일시
		, termsRevisionUseEndDateByLongType : new Date().setHours(0, 0, 0, 0) // 개정-사용종료일시
		
		, termsRevisionEffectiveDateByLongTypeModal : new Date().setHours(0, 0, 0, 0)
		, termsRevisionUseStartDateByLongTypeModal : new Date().setHours(0, 0, 0, 0)
		, termsRevisionUseEndDateByLongTypeModal : new Date().setHours(0, 0, 0, 0)
	};
	
	// 에디터 
	<c:if test="${'insert' eq mode}">
		// 에디터 > TEXTAREA
		/* var quill = new Quill('#editor', {
			theme:"snow",
			modules: {
				toolbar:[[{font:[]},{size:[]}],["bold","italic","underline","strike"],[{color:[]},{background:[]}],[{script:"super"},{script:"sub"}],[{header:[!1,1,2,3,4,5,6]},"blockquote","code-block"],[{list:"ordered"},{list:"bullet"},{indent:"-1"},{indent:"+1"}],["direction",{align:[]}],["link","image","video"],["clean"]]
			}
		}); */
	</c:if>
	
	$('[name="termsRevisionVersion"]').on('change', function() {
		setRevisionData();
	})
	
	// 개정 버전 데이터를 화면에 표시
	function setRevisionData() {
		
		<c:if test="${!empty result.revisionList}">
			var dataEl = $('#termsRevisionVersion option:selected');
			
			$('.updateTermsRevisionRequiredYn').html($(dataEl).data('termsrevisionrequiredyn'));
			
			detailData.termsRevisionEffectiveDate = new Date($(dataEl).data('termsrevisioneffectivedatebylongtype'));
			detailData.termsRevisionUseStartDateByLongType = new Date($(dataEl).data('termsrevisionusestartdatebylongtype'));
			detailData.termsRevisionUseEndDateByLongType = new Date($(dataEl).data('termsrevisionuseenddatebylongtype'));
			
			$('td.termsWriter').html($(dataEl).data('termsrevisionwriter'));
			$('td.termsRevisionRegisterDate').html($(dataEl).data('termsrevisionregisterdatebylongtypestring'));
			
			// 내용표시 
			$('.updateEditor').empty();
			$('.updateEditor').html($('div.revisionContentArea[data-seq="' + $(dataEl).val() + '"]').html());
			
			termsRevisionEffectiveDatePicker.setDate([detailData.termsRevisionEffectiveDate]);
			termsRevisionUseDatePicker.setDate([detailData.termsRevisionUseStartDateByLongType, detailData.termsRevisionUseEndDateByLongType]);
			
		</c:if>
		
	}
	
	<c:if test="${'update' eq mode}">
		// 에디터 
		// 에디터 > TEXTAREA
		/* var quillModal = new Quill('#editorModal', {
			theme:"snow",
			modules: {
				toolbar:[[{font:[]},{size:[]}],["bold","italic","underline","strike"],[{color:[]},{background:[]}],[{script:"super"},{script:"sub"}],[{header:[!1,1,2,3,4,5,6]},"blockquote","code-block"],[{list:"ordered"},{list:"bullet"},{indent:"-1"},{indent:"+1"}],["direction",{align:[]}],["link","image","video"],["clean"]]
			}
		}); */
		
		// datepicker
		var termsRevisionEffectiveDateByLongTypeModal;
		var termsRevisionUseDateModal; 
		
	</c:if>
	
	// 약관 저장 
	function saveTerms() {
		
		var object = {};
		object.mode = '${mode}';
		
		if(getTextLength($('#termsName').val()) > 30){
			alert('약관명은 30Byte까지 저장 가능합니다.');
			return;
		}
		
		// if($('#termsServiceClassify:checked').val() == undefined){
		if($('[name="termsServiceClassify"]:checked').val() == undefined){
			alert('서비스 구분을 선택해주세요');
			return;
		}
		
		object.termsName = $('#termsName').val();
		// object.termsServiceClassify = $('#termsServiceClassify:checked').val();
		object.termsServiceClassify = $('[name="termsServiceClassify"]:checked').val();
		// object.termsDisplayClassify = $('#termsDisplayClassify').val();
		object.termsType = $('#termsType').val();
		object.termsRequiredYn = $('[name="termsRequiredYn"]:checked').val()
		
		object.termsRevisionEffectiveDateByLongType = new Date(detailData.termsRevisionEffectiveDate).getTime();
		
		object.termsUseStartDateByLongType = new Date(detailData.termsUseStartDateByLongType).getTime();
		object.termsUseEndDateByLongType = new Date(new Date(detailData.termsUseEndDateByLongType).addDays(1)).getTime() -1;
		
		// var contents = quill.root.innerHTML;
		// contents = contents.replace('<p><br></p>', '');
		
		// 에디터 > TEXTAREA
		var contents = $('#editor').val();

		if(contents === '') {
			alert('개정 내용을 입력해주세요.');
			return false;
		}
		
		// replace(/<[a-zA-Z0-9\/]+>/ig, "")
		contents = contents.replace(/(<([^>]+)>)/ig,"");
		object.termsContent = contents;
		
		
		<c:if test="${'insert' eq mode}">
			object.termsRevisionVersion = $('[name="termsRevisionVersion"]').val(); 
			
			if(object.termsRevisionVersion === '' || object.termsRevisionVersion === undefined) {
				alert('개정 버전을 입력해주세요.');
				return false;
			}
			
		</c:if>
		
		<c:if test="${'update' eq mode}">
	
			object.termsRevisionVersion = $('[name="termsRevisionVersion"] option:selected').html()
		
			object.termsSeq = '${result.termsSeq}';
			object.termsRevisionSeq = $('[name="termsRevisionVersion"]').val();
			
			if(object.termsSeq === '') {
				alert('약관 Seq값이 존재하지 않습니다.');
				return false;
			}
			/* if(object.termsRevisionVersion === '') {
				alert('개정 버전을 입력해주세요.');
				return false;
			} */
		</c:if>
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/policy/terms/save'/>",
			// data : JSON.stringify(object),
			data : object,
			cache : false,
			async : true,
			// contentType : "application/json; charset=UTF-8",
			success : function(data, textStatus, XMLHttpRequest) {
				if(data.resultCode === '00000') {
					alert('저장되었습니다.');
					// location.reload();
					
					if(isEmptyObject(searchedData)) {
						searchedData = getData();
					}
					
					searchedData.pageIndex = 1;
					routie('list/' + encodeURIComponent(JSON.stringify(searchedData)));
				} else {
					alert('약관 저장 중 중 오류가 발생하였습니다.\r\nERROR: ' + JSON.stringify(data));
				}
				
				if (hasErrorMap(data, true)) {
					return;
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if (hasErrorMap(xhr, false)) {
					return;
				}
			}
		});
		
	}
	
	// 약관 개정 저장 
	function saveRevisionTerms() {
		
		var object = {};
		
		// object.termsRevisionTremsSeq = '${result.termsSeq}';
		object.termsRevisionTermsSeq = '${result.termsSeq}';
		object.termsRevisionVersion = $('#termsRevisionVersionModal').val();
		object.termsRevisionRequiredYn = $('[name="termsRevisionRequiredYnModal"]:checked').val();

		object.termsRevisionEffectiveDateByLongType = new Date(new Date(detailData.termsRevisionEffectiveDateByLongTypeModal).setHours(0, 0, 0, 0)).getTime();
		object.termsRevisionUseStartDateByLongType = new Date(new Date(detailData.termsRevisionUseStartDateByLongTypeModal).setHours(0, 0, 0, 0)).getTime();
		object.termsRevisionUseEndDateByLongType = new Date(new Date(detailData.termsRevisionUseEndDateByLongTypeModal).addDays(1)).getTime() -1;
		
		// var contents = quillModal.root.innerHTML;
		// contents = contents.replace('<p><br></p>', '');
		// object.termsRevisionContent = contents;
		
		// 에디터 > TEXTAREA
		// replace(/<[a-zA-Z0-9\/]+>/ig, "")
		var contents = $('#editorModal').val();
		contents = contents.replace(/(<([^>]+)>)/ig,"");
		
		object.termsRevisionContent = contents;
		
		if(object.termsRevisionTermsSeq === '') {
			alert('약관 Seq값이 존재하지 않습니다.');
			return false;
		}
		
		if(object.termsRevisionVersion === '') {
			alert('개정 버전을 입력해주세요.');
			return false;
		}
		
		if(object.termsRevisionContent === '') {
			alert('개정 내용을 입력해주세요.');
			return false;
		}
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/policy/terms/saveRevision'/>",
			// data : JSON.stringify(object),
			data : object,
			cache : false,
			async : true,
			// contentType : "application/json; charset=UTF-8",
			success : function(data, textStatus, XMLHttpRequest) {
				if(data.resultCode === '00000') {
					/* if(isEmptyObject(searchedData)) {
						searchedData = getData();
					}
					
					// close modal
					$('#addTermsModal').modal('hide');
					$('.modal-backdrop').hide();
					
					routie('list/' + encodeURIComponent(JSON.stringify(searchedData))); */
					
					$('#addTermsModal').modal('hide');
					$('.modal-backdrop').hide();
					<c:choose>
						<c:when test="${!empty result.termsSeq and null ne result.termsSeq and !empty mode and null ne mode}">
							loadDetail('${result.termsSeq}', '${mode}');
						</c:when>
						<c:otherwise>
							location.reload();
						</c:otherwise>
					</c:choose>
					
				} else {
					alert('개정 약관 저장 중 중 오류가 발생하였습니다.\r\nERROR: ' + JSON.stringify(data));
				}
				
				if (hasErrorMap(data, true)) {
					return;
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if (hasErrorMap(xhr, false)) {
					return;
				}
			}
		});
	}
	
	// datepicker
	var termsRevisionEffectiveDatePicker;
	var termsRevisionUseDatePicker; 

	function initServiceEvent() {
		
		// 개정 발효일  
		termsRevisionEffectiveDatePicker = flatpickr($('#termsRevisionEffectiveDatePicker'), {
			// mode : "range",
			defaultDate : [
				detailData.termsRevisionEffectiveDate
			], 
			onReady : function(selectedDates, dateStr, instance) {
				detailData.termsRevisionEffectiveDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
			},
			onChange : function(selectedDates, dateStr, instance) {
				detailData.termsRevisionEffectiveDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
			}
		})
		
		// 사용기간  
		termsRevisionUseDatePicker = flatpickr($('#termsRevisionUseDatePicker'), {
			mode : "range",
			defaultDate : [
				detailData.termsUseStartDateByLongType
				, detailData.termsUseEndDateByLongType
			], 
			onReady : function(selectedDates, dateStr, instance) {
				detailData.termsUseStartDateByLongType = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
				if($('#termsRevisionUseDatePicker').val().length === 10) {
					detailData.termsUseEndDateByLongType = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
				} else {
					detailData.termsUseEndDateByLongType = new Date(new Date(dateStr.substring(14, 24)).setHours(0,0,0,0));
				}
			},
			onChange : function(selectedDates, dateStr, instance) {
				detailData.termsUseStartDateByLongType = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
				if($('#termsRevisionUseDatePicker').val().length === 10) {
					detailData.termsUseEndDateByLongType = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
				} else {
					detailData.termsUseEndDateByLongType = new Date(new Date(dateStr.substring(14, 24)).setHours(0,0,0,0));
				}
			}
		})
		
		<c:if test="${'update' eq mode}">

			// 개정 발효일  
			termsRevisionEffectiveDateByLongTypeModal = flatpickr($('#termsRevisionEffectiveDateByLongTypeModal'), {
				// mode : "range",
				defaultDate : [
					detailData.termsRevisionEffectiveDateByLongTypeModal
				], 
				onReady : function(selectedDates, dateStr, instance) {
					detailData.termsRevisionEffectiveDateByLongTypeModal = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
				},
				onChange : function(selectedDates, dateStr, instance) {
					detailData.termsRevisionEffectiveDateByLongTypeModal = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
				}
			})
			
			// 사용기간  
			termsRevisionUseDateModal = flatpickr($('#termsRevisionUseDateModal'), {
				mode : "range",
				defaultDate : [
					detailData.termsRevisionUseStartDateByLongTypeModal
					, detailData.termsRevisionUseEndDateByLongTypeModal
				], 
				onReady : function(selectedDates, dateStr, instance) {
					detailData.termsRevisionUseStartDateByLongTypeModal = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
					if($('#termsRevisionUseDateModal').val().length === 10) {
						detailData.termsRevisionUseEndDateByLongTypeModal = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
					} else {
						detailData.termsRevisionUseEndDateByLongTypeModal = new Date(new Date(dateStr.substring(14, 24)).setHours(0,0,0,0));
					}
				},
				onChange : function(selectedDates, dateStr, instance) {
					detailData.termsRevisionUseStartDateByLongTypeModal = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
					if($('#termsRevisionUseDateModal').val().length === 10) {
						detailData.termsRevisionUseEndDateByLongTypeModal = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
					} else {
						detailData.termsRevisionUseEndDateByLongTypeModal = new Date(new Date(dateStr.substring(14, 24)).setHours(0,0,0,0));
					}
				}
			})
		
			setRevisionData();

		</c:if>
			
	}

	// 하단 버튼 
	$('button[name="cancelBtn"]').on('click touch', function() {
		// 취소 
		// searchList();
		if(isEmptyObject(searchedData)) {
			searchedData = getData();
		}
		routie('list/' + encodeURIComponent(JSON.stringify(searchedData)));
	})
	
	// 등록 
	$('button[name="saveBtn"]').on('click touch', function() {
		saveTerms();
	})

	// 목록 
	$('button[name="listBtn"]').on('click touch', function() {
		// 목록
		if(isEmptyObject(searchedData)) {
			searchedData = getData();
		}
		routie('list/' + encodeURIComponent(JSON.stringify(searchedData)));
		// searchList();
	})
	
	// 상세 
	$('button[name="updateBtn"]').on('click touch', function() {
		
		if(confirm('변경하신 사항을 저장하시겠습니까?')) {
			saveTerms(encodeURIComponent(JSON.stringify(searchedData)));
		}
	})

	// 개정 추가
	$('button[name="addRevisionBtn"]').on('click touch', function() {
		// 모달창 초기화 
		$('#addTermsModal #termsRevisionVersionModal').val('');
		
		detailData.termsRevisionEffectiveDateByLongTypeModal = new Date().setHours(0, 0, 0, 0);
		detailData.termsRevisionUseStartDateByLongTypeModal = new Date().setHours(0, 0, 0, 0);
		detailData.termsRevisionUseEndDateByLongTypeModal = new Date().setHours(0, 0, 0, 0);
		
		termsRevisionEffectiveDateByLongTypeModal.setDate([detailData.termsRevisionEffectiveDateByLongTypeModal]);
		termsRevisionUseDateModal.setDate([detailData.termsRevisionUseStartDateByLongTypeModal, detailData.termsRevisionUseEndDateByLongTypeModal]);
		
		$('[name="termsRevisionRequiredYnModal"][value="Y"]').click();
		
		$('#addTermsModal').modal('show');
	})
	
	<c:if test="${'update' eq mode}">
	
	$('button[name="cancelBtnModal"]').on('click touch', function() {
		// 취소  
		// quillModal.setContents([{ insert: '\n' }]);
		$('#addTermsModal #termsRevisionVersionModal').val('');
		$('#addTermsModal #editorModal').val('');
		
		$('#addTermsModal').modal('hide');
	})

	$('button[name="saveBtnModal"]').on('click touch', function() {
		// 개정 추가
		saveRevisionTerms();
	})
	
	</c:if>
	
	$(document).ready(function() {
		initServiceEvent();
		
		<c:if test="${'update' eq mode}">
			<c:if test="${empty result.resultCode}">
				alert('약관 상세 조회 중 오류가 발생하였습니다.\r\nERROR: ${result}')
			</c:if>
			<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
				alert('약관 상세 조회 중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}')
			</c:if>
		</c:if>
	})

</script>
