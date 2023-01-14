<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="carownPayMethodPopup" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
                	지급방법 변경
               	</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
				<div class="modal-txt label-ty-1">
					<div class="form-check form-check-inline">
						<input type="radio" name="carOwnerSettlementPaymentMethod" class="form-check-input" value="nextDayPayment" <c:if test="${'nextDayPayment' eq carOwnerSettlementPaymentMethod}">checked</c:if>>
						<label class="form-check-label">익일 결제</label>
					</div>
					<div class="form-check form-check-inline pl-2">
						<input type="radio" name="carOwnerSettlementPaymentMethod" class="form-check-input" value="monthEndPayment" <c:if test="${'monthEndPayment' eq carOwnerSettlementPaymentMethod}">checked</c:if>>
						<label class="form-check-label">월말 지급</label>
					</div>
				</div>
                <div class="button-list text-center mt-2">
                    <button type="button" class="btn btn-dark width-sm  btn-rounded waves-effect waves-dark" data-dismiss="modal">취소</button>
                   	<button type="button" class="btn btn-custom01 width-sm  btn-rounded waves-effect waves-dark" id="btnSave" >저장</button>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
// 저장
$('#btnSave').on('click', function(el){
	var carOwnerSettlementPaymentMethod = $('[name="carOwnerSettlementPaymentMethod"]:checked').val();
	var carOwnerSettlementId = '${carOwnerSettlementId}';
	
	$.ajax({
	    type : "POST",
	    url : "<c:url value='/ui/service/settlement/car/payment/update'/>",
	    data : { carOwnerSettlementPaymentMethod, carOwnerSettlementId },
	    cache : false,
	    async : true,
	    success : function(data, textStatus, XMLHttpRequest) {
			if (hasErrorMap(data, true)) {
				return;
			}
			
			location.reload();
	    },
	    error : function(xhr, ajaxOptions, thrownError) {
			if (hasErrorMap(xhr, false)) {
				return;
			} 
	    }
	});
});
</script>
