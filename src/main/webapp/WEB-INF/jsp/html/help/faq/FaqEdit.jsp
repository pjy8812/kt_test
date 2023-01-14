<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="isCreate" value="false"/>
<c:set var="isUpdate" value="false"/>
<c:forEach items="${autUriList}" var="autUriList">
	<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'C') gt -1}"><c:set var="isCreate" value="true"/></c:if>
	<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'U') gt -1}"><c:set var="isUpdate" value="true"/></c:if>
</c:forEach>

<!-- Begin page -->
<div class="card-box edit-box" data-faq_seq="${info.faqSeq}">
	<h5 class="card-title">
		<c:choose>
			<c:when test="${empty info}">FAQ 작성</c:when>
			<c:otherwise>FAQ 수정</c:otherwise>
		</c:choose>
	</h5>
	<div class="table-responsive">
		<table class="table mb-0 basic-table">
			<colgroup>
				<col style="width: 10%;">
				<col/>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">제목<span class="text-danger ml-1">*</span></th>
					<td>
						<input type="text" class="form-control" name="faqTitle" value="${info.faqTitle}"/>
					</td>
				</tr>
				<tr>
					<th scope="row">대상<span class="text-danger ml-1">*</span></th>
					<td>
						<div class="form-check-inline">
							<input type="radio" class="form-check-input" name="faqRecipient" id="typeAll" value="공통" <c:if  test="${info.faqRecipient eq '공통' or empty info.faqRecipient}">checked</c:if>>
							<label class="form-check-label" for="typeAll">공통</label>
						</div>
						<div class="form-check-inline">
							<input type="radio" class="form-check-input" name="faqRecipient" id="typeFrgown" value="화주" <c:if  test="${info.faqRecipient eq '화주'}">checked</c:if>>
							<label class="form-check-label" for="type01">화주</label>
			 			</div>
						<div class="form-check-inline">
							<input type="radio" class="form-check-input" name="faqRecipient" id="typeCarown" value="차주" <c:if  test="${info.faqRecipient eq '차주'}">checked</c:if>>
							<label class="form-check-label" for="type02">차주</label>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row">카테고리<span class="text-danger ml-1">*</span></th>
					<td>
						<div class="row">
							<div class="col-3">
								<select class="form-control" id="faqCategory">
									<option value="">선택</option>
									<c:forEach var="row" items="${faqCategory}">
										<option value="${row.codeId}" <c:if test="${row.codeId eq info.faqCategory}">selected</c:if>>${row.codeName}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row">최종작성자</th>
					<td>
						${User.adminId}
					</td>
				</tr>
				<tr>
					<th scope="row">내용<span class="text-danger ml-1">*</span></th>
					<td>
						<div id="editor d-none"></div>
						<textarea class="form-control" rows="15" name="faqContent" onkeyup="fnCheckByte(2000, this)">${info.faqContent}</textarea>
						<div class="text-right">
							<label class="pl-2 pt-1"><span id="nowByte">0</span>/2000 byte</label>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row">첨부파일</th>
					<td>
						<div class="row">
							<button type="button" id="btnAddfile" class="btn btn-white btn-rounded waves-effect waves-dark" >파일첨부</button>
							<input type="file" class="d-none" name="file01" multiple>
                         </div>
                          <div class="row divFileList2">
                          	<c:forEach var="file" items="${info.fileList}" varStatus="i">
                         		<div class="alert alert-light file-dismissible bg-light text-dark border-0 fade show ml-1 mb-0 mt-2" role="alert" id="alertFile">
       								<button type="button" class="close" data-index="${i.count}">
       									<span aria-hidden="true">&times;</span>
     								</button>
       						 		<span id="fileName">${file.fileName}</span>
       						 		<div class="d-none base_file" data-file_name="${file.fileName}">data:application/png;base64,${file.fileData}</div>
    							</div>
                         	</c:forEach>
                          </div>
                         <div class="divFileList row">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row">게시기간</th>
					<td>
						<div class="form-check-inline">
							<input type="checkbox" class="form-check-input" name="faqExposedYN" <c:if test="${info.faqAlwaysPostYn eq 'Y' or empty info.faqAlwaysPostYn}">checked</c:if>>
							<label class="form-check-label" for="faqExposedYN">상시게시</label>
						</div>
						<div class="row pt-1 <c:if test="${info.faqAlwaysPostYn eq 'Y' or empty info.faqAlwaysPostYn}">d-none</c:if>" id="divPostingPeriod">
							<div class="col-12">
								<div class="row">
								<div class="col-5">
									<div class="row">
										<div class="col-6">
											<div class="picker-wrap">
												<input type="text" id="startDate" name="startDate" class="form-control" value="<fmt:formatDate value="${info.faqExposedStartDateByLongType}" pattern="yyyy.MM.dd"/>"> 
												<label for="startDate"><i class="fas fa-calendar"></i></label>
											</div>
										</div>
										<div class="col-6">
											<input type="text" id="startTime" name="startTime" class="form-control" value="<fmt:formatDate value="${info.faqExposedStartDateByLongType}" pattern="HH:mm"/>">
										</div>
									</div>
								</div>
								<div class="text-center">
									<p class="period-ico">~</p>
								</div>
								<div class="col-5">
									<div class="row">
										<div class="col-6">
											<div class="picker-wrap">
												<input type="text" id="endDate" name="endDate" class="form-control" value="<fmt:formatDate value="${info.faqExposedEndDateByLongType}" pattern="yyyy.MM.dd"/>"> 
												<label for="endDate"><i class="fas fa-calendar"></i></label>
											</div>
										</div>
										<div class="col-6">
											<input type="text" id="endTime" name="endTime" class="form-control" value="<fmt:formatDate value="${info.faqExposedEndDateByLongType}" pattern="HH:mm"/>">
										</div>
									</div>
								</div>
							</div>
							</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<div class="row">
	<div class="col-6">
		<div class="button-list">
			<button type="button" class="btn btn-custom02 btn-rounded waves-effect waves-dark d-none" id="btnPreview">미리보기</button>
		</div>
	</div>
	<div class="col-6 text-right">
		<div class="button-list">
			<button type="button" class="btn btn-dark btn-rounded waves-effect waves-dark" id="btnCancel">취소</button>
			<c:choose>
				<c:when test="${empty info}">
					<c:if test="${isCreate}">
						<button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark" id="btnSave">저장</button>
					</c:if>
				</c:when>
				<c:otherwise>
					<c:if test="${isUpdate}">
						<button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark" id="btnSave">저장</button>
					</c:if>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>

<div id="modal"></div>

<!-- End page -->
<script>
	var startDatePicker; 
	var startTimePicker; 
	var endDatePicker; 
	var endTimePicker; 
	var editor;
	
	$(document).ready(function() {
		// initPicker
		initServiceEvent();
		
		/*
		var faqContent = '${info.faqContent}'.htmlChars()
		$('#editor').html($("<div/>").html(faqContent).text());
		
		//init editor
		editor = new Quill("#editor",{
			theme:"snow",
			modules: {
				toolbar:[[{font:[]},{size:[]}],["bold","italic","underline","strike"],[{color:[]},{background:[]}],[{script:"super"},{script:"sub"}],[{header:[!1,1,2,3,4,5,6]},"blockquote","code-block"],[{list:"ordered"},{list:"bullet"},{indent:"-1"},{indent:"+1"}],["direction",{align:[]}],["link","image","video"],["clean"]]
			}
		});
		*/
	});
	
	function initServiceEvent() { //게시기간 
		//시작일
		startDatePicker = flatpickr($('#startDate'), {
			dateFormat: "Y.m.d",
			onChange : function(selectedDates, dateStr, instance) {
				updatePickerRange();
			}
		})
		
		//시작시간 
		startTimePicker = flatpickr($('#startTime'), {
			enableTime: true,
			noCalendar: true,
			dateFormat: "H:i",
			onChange : function(selectedDates, dateStr, instance) {
				updatePickerRange();
			}
		})
		
		//종료일
		endDatePicker = flatpickr($('#endDate'), {
			dateFormat: "Y.m.d",
			onChange : function(selectedDates, dateStr, instance) {
				updatePickerRange();
			}
		})
		
		//종료일시
		endTimePicker = flatpickr($('#endTime'), {
			enableTime: true,
			noCalendar: true,
			dateFormat: "H:i",
			onChange : function(selectedDates, dateStr, instance) {
				updatePickerRange();
			}
		})
		
		updatePickerRange();
	}
	
	// picker Max/Min 값 update
	function updatePickerRange() {
		var startDate = '', endDate = '';
		if(!$.isEmptyObject(startDatePicker.selectedDates)){
			startDate = new Date(startDatePicker.selectedDates).toISOString();
			endDatePicker.set('minDate', startDate);
		}
		
		if(!$.isEmptyObject(endDatePicker.selectedDates)){
			endDate = new Date(endDatePicker.selectedDates).toISOString();
			startDatePicker.set('maxDate', endDate);
		}
		
		// 일자가 같으면 timepicker 제어 
		if(startDate === endDate) {
			if($('#startTime').val() > $('#endTime').val()) {
				$('#startTime').val($('#endTime').val());
			}
			
			startTimePicker.set('maxTime', $('#endTime').val());
			endTimePicker.set('minTime', $('#startTime').val());
			
		}
		
	}
	
	//게시기간> 상시게시 변경되었을 경우
	$('[name="faqExposedYN"]').change(function(){
		var flag = $(this).is(':checked');
		if(flag){
			$('#divPostingPeriod').addClass('d-none');
		}else{
			$('#divPostingPeriod').removeClass('d-none');
			
			var start = new Date(new Date().setMinutes(0, 0)).toISOString();
			var end = new Date(new Date().addDays(1).setMinutes(0, 0)).toISOString();
			
			//시작일
			if($.isEmptyObject(startDatePicker.selectedDates)){
				startDatePicker.setDate(start);
			}
			
			//종료일
			if($.isEmptyObject(endDatePicker.selectedDates)){
				endDatePicker.setDate(end);
			}
			
			//시작시간
			if($.isEmptyObject(startTimePicker.selectedDates)){
				startTimePicker.setDate(start);
			}
			
			//종료시간
			if($.isEmptyObject(endTimePicker.selectedDates)){ 
				endTimePicker.setDate(end);
			}
		}
	});
	
	//파일첨부버튼 클릭 
	$('#btnAddfile').on('click touch', function() {
		$('[name="file01"]').trigger('click');
	})
	
	//파일선택
	$('[name="file01"]').on('change', function() {
		previewFileName(this, $('.divFileList')); //첨부파일명 표시
	})
	
	//파일삭제
	$('.divFileList2').on('click', '.file-dismissible .close', function(){
		if(!confirm('첨부파일을 삭제하시겠습니까')){
			return;
		}
	
		var index = $('.divFileList2 .file-dismissible .close').index(this);
		//console.log(index)
		clearFileName($('[name="file01"]'), index, $('.divFileList2')); //첨부파일명 초기화
	});
	
	$('.divFileList').on('click', '.file-dismissible .close', function(){
		if(!confirm('첨부파일을 삭제하시겠습니까')){
			return;
		}
		
		var index = $('.divFileList .file-dismissible .close').index(this);
		//console.log(index)
		clearFileName($('[name="file01"]'), index, $('.divFileList')); //첨부파일명 초기화
	});
	
	//미리보기 버튼클릭
	$('#btnPreview').on('click', function(){
		//console.log('미리보기');
	});
	
	//취소버튼 클릭
	$('#btnCancel').on('click', function(){
		if(!confirm('FAQ 작성을 취소하시겠습니까?')){	//아니오 클릭시 return
			return; 
		}
		
		history.back();
	});
	
	//저장버튼 클릭
	$('#btnSave').on('click', function(){
		if(!confirm('FAQ 저장하시겠습니까?')){	//아니오 클릭시 return
			return; 
		}
		
		save();
	});
</script>
