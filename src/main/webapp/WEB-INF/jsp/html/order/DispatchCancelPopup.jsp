<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="dispatchCancelPopup" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">배차취소</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body pt-0">
	            <div class="card-box bg-soft-dark mb-0">
	                <p class="bullet-txt">배차취소 사유를 선택하신 후, 배차취소를 진행하세요.</p>
	                <p class="bullet-txt mt-2">배차를 취소하시면 기존 배차된 차주에게는 배송료가 정산되지 않습니다.</p>
	            </div>
                <div class="row">
                    <div class="col-12">
                        <div class="table-responsive">
                        	<table class="table mb-0 basic-table">
                            	<colgroup>
									<col style="width: 30%;">
									<col style="width: auto;">
                            	</colgroup>
                                <tbody>
                                    <tr role="row">
                                        <th scope="row" class="mb-0 border-top-0">배차취소 사유</th>
                                        <td class="mb-0 border-top-0">
											<div class="row">
												<div class="col-9">
													<select class="form-control form-control-sm" id="selectCancelReason">
														<option value="" selected disabled>선택</option>
														<option value="requested">차주배차취소요청(패널티 부과)</option>
														<option value="disappeared">차주잠적(패널티 부과)</option>
														<option value="etc">기타(패널티 없음)</option>
													</select>
												</div>
											</div>
											<div class="row mt-1 divCancelReason d-none">
												<div class="col-12">
													<input type="text" class="form-control form-control-sm" id="cancelReason" maxlength="50" placeholder="배차취소 사유를 입력하세요.">
												</div>
											</div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <h6 class="card-title ml-2">※ 입력하신 사항은 저장 후 수정이 불가합니다.</h6>
                    </div>
                </div>
                <div class="button-list text-center mt-2">
                    <button type="button" class="btn btn-dark width-sm  btn-rounded waves-effect waves-dark" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-custom01 width-sm  btn-rounded waves-effect waves-dark" id="saveCancelReason" disabled>저장</button>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
//배차취소사유 선택
$('#selectCancelReason').on('change', function(){
	if($(this).val() == 'etc') {
		$('.divCancelReason').removeClass('d-none');
		$('#saveCancelReason').prop('disabled', true);
	} else {
		$('.divCancelReason').addClass('d-none');
		$('#saveCancelReason').prop('disabled', false);
	}
});

//저장버튼 활성화
$('#cancelReason').on('keyup', function(){
	var reason = $('#cancelReason').val();
	
	if(reason != '') {
		$('#saveCancelReason').prop('disabled', false);
	} else {
		$('#saveCancelReason').prop('disabled', true);
	}
});

//저장
$('#saveCancelReason').on('click', function(){
	var cancelReason;
	var cancelMemo;
	
	var selectReason = $('#selectCancelReason').val();
	
	if(selectReason == 'requested') {
		cancelReason = "CAR_OWNER_REQUESTED"; //차주배차취소요청
	} else if(selectReason == 'disappeared') {
		cancelReason = "CAR_OWNER_DISAPPEARED"; //차주잠적
	} else if(selectReason == 'etc') {
		cancelReason = "ETC";
		cancelMemo = $('#cancelReason').val();
	}
	
	if(confirm("배차를 취소하시겠습니까?")) {
		var deliveryId = $('#orderDetail').data('delivery-id');
		
		//console.log("deliveryId: "+deliveryId);
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/order/dispatch/cancel'/>",
			data : {
				"deliveryId" : deliveryId,
				"cancelReason" : cancelReason,
				"cancelMemo" : cancelMemo
			},
			cache : false,
			async : true,
			success : function(data, textStatus, XMLHttpRequest) {
				//console.log(data);
				
				if(data != null && (data.status == "200" || data.resultCode == "00000")) {
					if(!alert("배차가 취소되었습니다.")) {
						location.reload();
					}
				} else if(data.message != null && data.message != "") {
					alert('배차취소 도중 오류가 발생하였습니다.\r\nERROR: '+data.message);
				} else {
					alert('배차취소 도중 오류가 발생하였습니다.');
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if (hasErrorMap(xhr, false)) {
					return;
				}
			}
		});
	}
});
</script>
