<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="excelUploadPopup" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">관리자 계정 업로드</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
                <div class="form-group mb-0">
                    <h5 class="card-title">엑셀파일 업로드</h5>
                    <div class="row">
                    	<div class="col-10">
	                    	<input type="file" id="inputFile" class="form-control-file border" accept=".xls,.xlsx">
	                    </div>
	                    <div class="col-2">
	                    	<button type="button" class="btn btn-custom01 width-sm form-control-sm btn-rounded waves-effect waves-dark pt-1" id="btnExcelUpload">업로드</button>
	                    </div>
                    </div>
                </div>
                <button type="button" class="btn btn-link waves-effect" id="sampleDownload">파일업로드 샘플 다운로드</button>
                <div class="card-box bg-soft-dark mt-3">
                    <h5 class="card-title">유의사항</h5>
                    <ul class="number-list">
                        <li><span class="number">1.</span>파일업로드 샘플 다운로드 진행</li>
                        <li><span class="number">2.</span>다운받은 샘플 양식에 맞춰 회원정보 입력 후 저장 (최대 1,000건)</li>
                        <li><span class="number">3.</span>[파일찾기] 버튼을 클릭 후, 저장한 샘플을 선택</li>
                        <li><span class="number">4.</span>[업로드] 버튼을 클릭하여 회원정보 업로드</li>
                    </ul>
                    <p class="bullet-txt mt-2">다운로드한 엑셀 파일의 양식을 변경하거나 컬럼을 변경 후 업로드 시, 정상적으로 업로드 되지 않습니다.</p>
                    <p class="bullet-txt mt-2">업로드 결과가 '성공' 일 경우에만 정상적으로 업로드됩니다.</p>
                </div>
                
                <div class="upload-result mt-3 pt-2">
                </div>
                
                <div class="button-list text-center mt-3">
                    <button type="button" class="btn btn-dark width-sm  btn-rounded waves-effect waves-dark" data-dismiss="modal">확인</button>
                </div>
                
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script>
//파일업로드 샘플 다운로드
$('#sampleDownload').on('click', function(){
	window.open("<c:url value='/ui/service/system/account/excel/download.sample'/>", '_blank');
});

//파일업로드
$('#btnExcelUpload').on('click', function(){
	
	var file = $('#inputFile').val();
	var fileFormat = file.split('.');
	
	if(file == null || file == '') {
		alert("업로드할 파일을 등록 후 '업로드' 버튼을 클릭하세요.");
	} else {
		var formData = new FormData;
		formData.append("excelFile", $('#inputFile')[0].files[0]);
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/system/account/excel/upload'/>",
			data : formData,
			cache : false,
			async : true,
			enctype: 'multipart/form-data',
			processData: false,
			contentType: false,
			success : function(data, textStatus, XMLHttpRequest) {
				if (hasErrorMap(data, true)) {
					return;
				}
				
				$('.upload-result').html(data);
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if (hasErrorMap(xhr, false)) {
					return;
				}
			}
		});
	}
});

//파일첨부시 결과영역 리셋
$('#inputFile').on('change', function(){
	$('.upload-result').empty();
});
</script>
