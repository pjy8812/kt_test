<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="excelUploadPopup" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">주문내역 업로드<c:if test="${mode eq 'manual'}"> (수동배차)</c:if></h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
                <div class="form-group mb-3">
                    <h5 class="card-title mb-1">화주명</h5>
                    <div class="row">
                    	<div class="col-10">
	                    	<input type="text" id="freightOwnerName" class="form-control form-control-sm" disabled>
	                    </div>
	                    <div class="col-2">
	                    	<button type="button" class="btn btn-custom04 width-sm form-control-sm btn-rounded waves-effect waves-dark pt-1" id="freightOwnerSearch">조회</button>
	                    </div>
                    </div>
                </div>
                <div class="form-group mb-0">
                    <h5 class="card-title mb-1">엑셀파일 업로드</h5>
                    <div class="row">
                    	<div class="col-10">
	                    	<input type="file" id="inputFile" class="form-control-file border" accept=".xls,.xlsx">
	                    </div>
	                    <div class="col-2">
	                    	<button type="button" class="btn btn-custom01 width-sm form-control-sm btn-rounded waves-effect waves-dark pt-1" id="btnExcelUpload">업로드</button>
	                    </div>
                    </div>
                </div>
                <a type="button" class="btn btn-link waves-effect" href="<c:url value="/file/ORDER_UPLOAD_SAMPLE.xlsx"/>">파일업로드 샘플 다운로드</a>
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
                <div class="button-list text-center mt-3">
                    <button type="button" class="btn btn-dark width-sm  btn-rounded waves-effect waves-dark" data-dismiss="modal">확인</button>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div id="popup_freightOwnerSearch"></div> <!-- 화주조회 -->


<script>
var _mode = mode;

//화주조회 팝업
$('#freightOwnerSearch').on('click', function(){
	$.ajax({
	    type : "POST",
	    url : "<c:url value='/ui/service/order/freightowner'/>" + _mode,
	    data : {},
	    cache : false,
	    async : true,
	    success : function(data, textStatus, XMLHttpRequest) {
			if (hasErrorMap(data, true)) {
				return;
			}
			
			$('#popup_freightOwnerSearch').html(data);
			$('#freightOwnerPopup').modal('show');
	    },
	    error : function(xhr, ajaxOptions, thrownError) {
			if (hasErrorMap(xhr, false)) {
				return;
			}
	    }
	}); 
});

//파일업로드
$('#btnExcelUpload').on('click', function(){
	
	var file = $('#inputFile').val();
	var fileFormat = file.split('.');
	var freightOwnerName = $('#freightOwnerName').val();
	
	if(freightOwnerName == '') {
		alert("화주를 선택하세요.");
	} else if(file == null || file == '') {
		alert("업로드할 파일을 등록 후 '업로드' 버튼을 클릭하세요.");
	} else {
		_mode = _mode.replace('/','');
		
		var formData = new FormData;
		formData.append("file", $('#inputFile')[0].files[0]);
		formData.append("consumerId", $('.order.frgownId').val());
		
		var consumerType = $('.order.frgownType').val();
		if(consumerType == 'normal') {
			consumerType = "FO_G";
		} else if(consumerType == 'contract' || consumerType == 'manualDelivery') {
			consumerType = "FO_C";
		}
		formData.append("consumerType", consumerType);
		
		var isTransportationCompany;
		if(_mode == 'order') {
			isTransportationCompany = false; //주문배송
		} else if(_mode == 'manual') {
			isTransportationCompany = true;	 //수동배차
		}
		formData.append("isTransportationCompany", isTransportationCompany);
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/order/excel/upload/'/>" + _mode,
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
				//console.log(data);
				
				if(_mode == 'order'){	//주문배송
					_mode = '/order';
				}else{					//수동배차
					_mode ='/manual';
				}
				
				if(data.status != null && data.status == '200') {
					if(!alert('엑셀 업로드가 완료되었습니다.')) {
						$('#excelUploadPopup').modal('hide');
						$('.popup_orderListUpload').empty();

						$('button[name="searchBtn"]').click(); //목록검색
					}
				} else if(data.resultCode != null && data.resultCode == '00001') {
					//파일 확장자오류
					alert('엑셀 업로드 중 오류가 발생하였습니다.\r\nERROR: '+data.resultMsg);
				} else {
					alert('엑셀 업로드 중 오류가 발생하였습니다.');

					//업로드 분석파일 다운로드
					var sessionKey = data.data.sessionKey;
					if(sessionKey != null && sessionKey != '') {
						location.href = "<c:url value='/ui/service/order/excel/download.result'/>?sessionKey="+sessionKey;
					}
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert('엑셀 업로드 중 오류가 발생하였습니다.');
			}
		});
	}
});
</script>
