<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="emergencyReasonPopup" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">비상배차 사유</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body pt-0">
	            <div class="card-box bg-soft-dark mb-0">
	                <p class="bullet-txt">기존 배차된 차주에게는 배송료가 정산되지 않습니다.</p>
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
                                        <th scope="row" class="mb-0 border-top-0">비상배차 사유</th>
                                        <td class="mb-0 border-top-0">
											<div class="row">
												<div class="col-9">
													<select class="form-control form-control-sm" id="emerInsertReason">
														<option value="">선택</option>
														<option value="requested">차주배차취소요청(패널티 부과)</option>
														<option value="disappeared">차주잠적(패널티 부과)</option>
														<option value="etc">기타(패널티 없음)</option>
													</select>
												</div>
											</div>
											<div class="row mt-1 divCancelReason d-none">
												<div class="col-12">
													<input type="text" class="form-control form-control-sm" id="inputInsertReason" maxlength="50" placeholder="비상배차 사유를 입력하세요.">
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
                    <button type="button" class="btn btn-custom01 width-sm  btn-rounded waves-effect waves-dark" id="saveInsertReason">저장</button>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
//비상배차사유 선택
$('#emerInsertReason').on('change', function(){
	if($(this).val() == 'etc') {
		$('.divCancelReason').removeClass('d-none');
	} else {
		$('.divCancelReason').addClass('d-none');
	}
});

//저장
$('#saveInsertReason').on('click', function(){
	var selectReason = $('#emerInsertReason').val();
	var inputReason = $('#inputInsertReason').val();
	
	if(selectReason == '') {
		alert("비상배차 사유를 선택하세요.");
	} else if(selectReason == 'etc' && inputReason == '') {
		alert("비상배차 사유를 입력하세요.");
	} else {
		if(selectReason == 'requested') {
			saveData.cancelReason = "CAR_OWNER_REQUESTED"; //차주배차취소요청
		} else if(selectReason == 'disappeared') {
			saveData.cancelReason = "CAR_OWNER_DISAPPEARED"; //차주잠적
		} else if(selectReason == 'etc') {
			saveData.cancelReason = "ETC";
			saveData.cancelMemo = inputReason;
		}
		
		if(confirm("변경하신 사항을 저장하시겠습니까?")) {
			updateOrder();
		}
	}
});
</script>
