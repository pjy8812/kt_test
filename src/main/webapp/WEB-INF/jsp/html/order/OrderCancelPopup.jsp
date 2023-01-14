<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="popupCancelReason" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">취소사유</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
                <textarea class="form-control" id="orderCancelReason" maxlength="50" rows="3" style="resize:none;" placeholder="취소사유를 입력하세요."></textarea>
                <div class="button-list text-center mt-2">
                    <button type="button" class="btn btn-dark width-sm  btn-rounded waves-effect waves-dark" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-custom01 width-sm  btn-rounded waves-effect waves-dark" id="btnOrderCancel" disabled>저장</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
//주문취소
$('#btnOrderCancel').on('click', function(){
	var cancelData = {};
	
	if(confirm("해당 주문을 취소하시겠습니까?")) {
		cancelData.orderId = $('#orderDetail').data('order-id');
		cancelData.actorMemo = $('#orderCancelReason').val();

		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/order/cancel'/>",
			data : cancelData,
			cache : false,
			async : true,
			success : function(data, textStatus, XMLHttpRequest) {
				//console.log(data);
				
				if(data != null && (data.status == "200" || data.resultCode == "00000")) {
					if(!alert("주문이 취소되었습니다.")) {
						location.reload();
					}
				} else if(data.message != null && data.message != "") {
					alert('주문취소 도중 오류가 발생하였습니다.\r\nERROR: '+data.message);
				} else {
					alert('주문취소 도중 오류가 발생하였습니다.');
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

//저장버튼 활성화
$('#orderCancelReason').on('keyup', function(){
	var reason = $('#orderCancelReason').val();
	
	if(reason != '') {
		$('#btnOrderCancel').prop('disabled', false);
	} else {
		$('#btnOrderCancel').prop('disabled', true);
	}
});
</script>