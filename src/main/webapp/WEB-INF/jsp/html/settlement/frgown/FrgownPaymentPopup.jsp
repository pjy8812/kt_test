<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Begin page -->
<!-- pop-alert -->
<div id="popup" class="modal fade" tabindex="-1" role="dialog"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">입금확인</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
			</div>
			<div class="modal-body">
				<div class="modal-txt">
					<div>
						- 청구내역에 따른 화주의 입금이 완료되었습니까? <br> 금액 :
						<fmt:formatNumber value="${result.freightOwnerSettlementPrice}"/>원 <br> - 입금확인된 날짜를 입력해
						주세요.
					</div>
					<div class="picker-wrap">
						<input type="text" id="depositDate"
							class="form-control flatpickr-input" placeholder="날짜선택"
							readonly="readonly"> <label for="range-datepicker"><i
							class="fas fa-calendar"></i></label>
					</div>
				</div>
				<div class="button-list text-center mt-2">
					<button type="button"
						class="btn btn-secondary width-sm  btn-rounded waves-effect waves-dark" data-dismiss="modal">취소</button>
					<button type="button"
						class="btn btn-custom01 width-sm  btn-rounded waves-effect waves-dark" id="depositBtn">입금확인</button>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->



<script>

	var joinDatepicker;
	var depositDatePicker; 
	
	function initServiceEvent() {

		//최종이용일                     
		depositDatePicker = flatpickr($('#depositDate'), {
		//mode : "range",
			defaultDate : [
				data.lastUseStartDate
				, data.lastUseEndDate
			], 
			onReady : function(selectedDates, dateStr, instance) {
				data.lastUseStartDate = new Date();
				data.lastUseEndDate = new Date();
			},
			onChange : function(selectedDates, dateStr, instance) {
				data.lastUseStartDate = new Date();
				data.lastUseEndDate = new Date();
			}
		});
		
		depositDatePicker.set('maxDate', (new Date()).setHours(0,0,0,0));
	}

	$(document).ready(function() {
		// initPicker
		initServiceEvent();
		
		const now = new Date();
		const year = now.getFullYear();
		const month = now.getMonth()+1;
		const date = now.getDate();
	 
		var todayString = year + "-";
		
		if (month < 10) {
	 		todayString += "0";
		}
		
		todayString += month + "-";
		
		if (date < 10) {
	 		todayString += "0";
		}
		
		todayString += date;
		
		$("#depositDate").val(todayString);
	});
	
	$('#depositDate').change(function () {
		var depositDate = $('#depositDate').val();
		var today = new Date();
		today.setDate(today.getDate() + 1);
		today = today.toISOString();
		today = today.split('T')[0];
		
		if (depositDate == today) {
			$('#depositBtn').attr('disabled', 'disabled');
		} else {
			$('#depositBtn').removeAttr('disabled');
		}
	});
	
	$('#depositBtn').on('click touch', function () {
		var depositDate = $('#depositDate').val();
		depositDate = depositDate.replace(/-/g, '');
		
		$.ajax({
			type: "POST",
			url : "<c:url value='/ui/service/settlement/frg/update/payment/${result.freightOwnerSettlementId}'/>",
			data : {
				'pageIndex' : data.detailPageIndex,
				'depositDate': depositDate
			},
			cache : false,
			async : true,
			success : function(data, textStatus, XMLHttpRequest) {
				if(data.resultCode === '00000') {
					location.reload();
				} else {
					alert('입금완료처리 도중 오류가 발생하였습니다.\r\nERROR: ' + JSON.stringify(data));
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
	});
</script>
