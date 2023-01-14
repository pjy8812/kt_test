<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="updateOrderInfoPopup" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
                	<c:if test="${mode eq 'loading'}">상차완료</c:if>
                	<c:if test="${mode eq 'unloading'}">하차완료</c:if>
               	</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body pt-0">
                <div class="row">
                    <div class="col-12">
                        <div class="table-responsive">
                        	<table class="table mb-0 basic-table">
                            	<colgroup>
									<col style="width: 20%;">
									<col style="width: auto;">
                            	</colgroup>
                                <tbody>
                                    <tr role="row">
                                        <th scope="row" class="mb-0 border-top-0">
						                	<c:if test="${mode eq 'loading'}">상차일시</c:if>
						                	<c:if test="${mode eq 'unloading'}">하차일시</c:if>
                                        </th>
                                        <c:set var="now" value="<%=new java.util.Date()%>"/>
                                        <td class="mb-0 border-top-0">
											<div class="row">
												<div class="col-6">
													<div class="picker-wrap">
														<input type="text" id="selectUpdateDate" class="form-control form-control-sm" value="<fmt:formatDate value="${now}" pattern="yyyy.MM.dd"/>">
														<!-- value="${fn:split(dateTime, ' ')[0]}" -->
														<label for="updateDate"><i class="fas fa-calendar"></i></label>
													</div>
												</div>
												<div class="col-4">
													<input type="text" id="selectUpdateTime" class="form-control form-control-sm" value="<fmt:formatDate value="${now}" pattern="HH:mm"/>">
													<!-- value="${fn:split(dateTime, ' ')[1]}" -->
												</div>
											</div>
                                        </td>
                                    </tr>
                                    <c:if test="${mode ne 'loading' || freightOwnerType ne 'FO_G'}">
                                    <!-- FO_G : 일반화주 -->
										<tr>
											<th>파일첨부</th>
											<td>
												<div class="row <c:if test="${mode eq 'loading'}">loading</c:if><c:if test="${mode eq 'unloading'}">unloading</c:if>">
													<button type="button" id="btnAddfile" class="btn btn-dark btn-sm waves-effect waves-light">파일첨부</button>
													<input type="file" class="d-none" name="file01" accept="image/png">
						                         </div>
						                          <div class="row">
						                          </div>
						                         <div class="divFileList row">
												 </div>
											</td>
										</tr>
									</c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="button-list text-center mt-2">
                    <button type="button" class="btn btn-dark width-sm  btn-rounded waves-effect waves-dark" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-custom01 width-sm  btn-rounded waves-effect waves-dark" id="saveUpdateDateTime">저장</button>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
var mode_load_unload = "${mode}";

//파일첨부버튼 클릭 
$('#btnAddfile').on('click touch', function() {
	$('[name="file01"]').trigger('click');
});

//파일선택
$('[name="file01"]').on('change', function(event) {
	//첨부파일 용량 10MB 제한 (2022.04.15 추가)
	var maxSize = 10 * 1024 * 1024; 

	if(this.value != "") {
		var fileSize = this.files[0].size;
		
		if(fileSize >= maxSize) {
			alert("파일을 업로드할 수 없습니다.\r\n10MB 이내의 PNG 파일만 첨부할 수 있습니다.");
			return;
		}
	}
	
	previewFileName(this, $('.divFileList')); //첨부파일명 표시
	
	var size = this.files.length;
	for(var i=0; i<size; i++) {
		var file = event.target.files[i];
		downloadFile(this, $('.attachFile.updateTime'), file); //첨부파일다운로드
	}
	
	$('.row.'+mode_load_unload).addClass('d-none');
});

//파일삭제
$('.divFileList').on('click', '.file-dismissible .close', function(){
	if(!confirm('첨부파일을 삭제하시겠습니까?')) {
		return;
	}

	var index = $('.divFileList .file-dismissible .close').index(this);
	clearFileName($('[name="file01"]'), index, $('.divFileList')); //첨부파일명 초기화
	
	//첨부파일다운로드 삭제
	var length = $('.attachFile.updateTime').find('.alert').length;
	clearFileName($('[name="file01"]'), length-1, $('.attachFile.updateTime'));
	
	$('.row.'+mode_load_unload).removeClass('d-none');
});

//상/하차일자 선택
$('#selectUpdateDate').flatpickr({
	dateFormat: "Y.m.d"
});

//상/하차시간 선택
$('#selectUpdateTime').flatpickr({
	noCalendar: true,
	enableTime: true,
	minuteIncrement: 1
});

//저장
$('#saveUpdateDateTime').on('click', function(){
	
	var fileLength = $('#updateOrderInfoPopup').find('.divFileList').find('div').length;
	
	// FO_C : 계약화주
	if("${freightOwnerType}" == 'FO_C' && fileLength == 0) {
		alert("첨부파일을 등록하세요.");
	} else {
		var selectDateTime = $('#selectUpdateDate').val()+" "+$('#selectUpdateTime').val();
		
		if(mode_load_unload == 'loading') {
			//상차
			$('#btnLoadingComplete').addClass('d-none');
			$('#divLoadingDateTime').text(selectDateTime);
			$('#divLoadingDateTime').data('completed', 'Y');
			$('#divLoadingDateTime').removeClass('d-none');
			
			//첨부파일 
			var loadingFile = $('.title-link.file-name.loading').length;
			if(loadingFile > 0) {
				$.each($('input[type=file]')[0].files, function(i, value){
					loadedData.append('sign', value);
				});
			}
		} else if(mode_load_unload == 'unloading') {
			//하차
			$('#btnUnloadingComplete').addClass('d-none');
			$('#divUnloadingDateTime').text(selectDateTime);
			$('#divUnloadingDateTime').data('completed', 'Y');
			$('#divUnloadingDateTime').removeClass('d-none');
			
			//첨부파일
			var unloadingFile = $('.title-link.file-name.unloading').length;
			if(unloadingFile > 0) {
				$.each($('input[type=file]')[0].files, function(i, value){
				    unloadedData.append('sign', value);
				});
			}
		}
		
		$('#updateOrderInfoPopup').modal('hide');
	}
	
	//상/하차시간 모두 선택된 경우 이동시간 계산
	var loadingStr = $('#divLoadingDateTime').text();
	var unloadingStr = $('#divUnloadingDateTime').text();
	if(loadingStr != '' && unloadingStr != '') {
		var loading = new Date(loadingStr);
		var unloading = new Date(unloadingStr);
		
		var movingMin = (unloading.getTime()-loading.getTime()) / 1000 / 60;
		if(movingMin > 0) {
			$('#calMovingTime').text(movingMin+"분");
		}
	}
});

function downloadFile(_input, _fileList, _file) {
	var reader = new FileReader();
	reader.readAsDataURL(_file);
	reader.onload = function(){
		var result = reader.result;
		
		if(_input.files && _input.files[0]) {
			var fileName = _file.name;
			
			//첨부파일
			var str = '';
			str += '<div class="alert alert-light file-dismissible text-dark border-0 fade show ml-1 mb-0 mt-2" role="alert">';
	        str += '<span class="fileName"><i class="fe-paperclip mr-1"></i><a class="title-link file-name '+mode_load_unload+'" href="'+result+'" download="'+fileName+'">'+fileName+'</a></span>';
	        str += '</div>';
			_fileList.append(str);
		}
	};
}
</script>