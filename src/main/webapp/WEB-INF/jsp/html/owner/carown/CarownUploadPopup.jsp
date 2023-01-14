<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="popup" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" data-owner_id="${info.ownerId}">
    <div class="modal-dialog modal-dialog-centered modal-lg">
    	<div class="modal-content">
        	<div class="modal-header">
                <h4 class="modal-title">지입차주 등록</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
             <div class="modal-body">
                <div class="form-group mb-0">
                    <h5 class="card-title">엑셀파일 업로드</h5>
                    <div class="row">
                    	<div class="col-10">
	                    	<input type="file" id="inputFile" class="form-control-file form-control-file border py-1 pl-1" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet">
	                    </div>
	                    <div class="col-2">
	                    	<button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark w-100" id="btnExcelUpload">업로드</button>
	                    </div>
                    </div>
                </div>
                <button type="button" class="btn btn-link waves-effect" id="sampleDownload">파일업로드 샘플 다운로드</button>
                <div class="card-box bg-soft-dark mt-3">
                    <h5 class="card-title">유의사항</h5>
                    <ul class="number-list">
                        <li><span class="number">1.</span>파일업로드 샘플 다운로드 진행</li>
                        <li><span class="number">2.</span>다운받은 샘플 양식에 맞춰 주문내역 입력 후 저장 (최대 1,000건)</li>
                        <li><span class="number">3.</span>[파일찾기] 버튼을 클릭 후, 저장한 샘플을 선택</li>
                        <li><span class="number">4.</span>[업로드] 버튼을 클릭하여 주문내역 업로드</li>
                    </ul>
                    <p class="bullet-txt mt-2">다운로드한 엑셀 파일의 양식을 변경하거나 컬럼을 변경 후 업로드 시, 정상적으로 업로드 되지 않습니다.</p>
                    <p class="bullet-txt mt-2">업로드 결과가 '성공' 일 경우에만 정상적으로 업로드됩니다.</p>
                </div>
                <div class="upload-result mt-3 pt-2">
                    <h5 class="card-title">업로드 결과 : 실패</h5>
                    <div class="table-responsive">
                        <table class="table mb-0 basic-table text-center">
                            <colgroup>
                                <col style="width:25%;">
                                <col style="width:25%;">
                                <col style="width:25%;">
                                <col style="width:auto;">
                            </colgroup>
                            <thead>
                            	<tr>
	                                <th scope="row">요청건수</th>
	                                <th>성공건수</th>
	                                <th>실패건수</th>
	                                <th>업로드 일자</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>100건</td>
                                    <td>98건</td>
                                    <td>2건</td>
                                    <td>2021.12.20 15:33</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <h5 class="card-title mt-2">업로드 실패 사유</h5>
                    <div class="border-top border-bottom pt-2">
                        <p>No3 : 중복</p>
                        <p>No22 : 값 없음</p>
                    </div>
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
	window.open("<c:url value='/ui/service/owner/carown/download/sample'/>", '_blank');
});

//파일업로드
$('#btnExcelUpload').on('click', function(){
	
	var file = $('#inputFile').val();
	var fileFormat = file.split('.');
	
	if(file == null || file == '') {
		alert("업로드할 파일을 등록 후\n'업로드' 버튼을 클릭하세요.");
	} else if(fileFormat[1] != 'xls' && fileFormat[1] != 'xlsx') {
		alert("엑셀 파일을 등록 후 '업로드' 버튼을 클릭하세요.");
	} else {
		var formData = new FormData;
		formData.append("upload", $('#inputFile')[0].files[0]);
		
		/*
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/order/excel/upload'/>",
			data : formData,
			dataType : "text",
			cache : false,
			async : true,
			enctype: 'multipart/form-data',
			processData: false,
			contentType: false,
			success : function(data, textStatus, XMLHttpRequest) {
				if (hasErrorMap(data, true)) return;
				
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if (hasErrorMap(data, true)) return;
			}
		});
		*/
	}
});
</script>