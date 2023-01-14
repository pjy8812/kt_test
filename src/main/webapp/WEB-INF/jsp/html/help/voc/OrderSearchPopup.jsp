<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Begin 주문번호찾기 팝업 -->
<div id="popup" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-full-width modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">주문번호 찾기</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
                <div class="row">
					<div class="col-10">
						<div class="form-group row mb-3">
							<label for="select05" class="col-1 col-form-label">검색어</label>
							<div class="col-11">
								<div class="row">
									<div class="col-2">
										<select class="form-control" id="orderSearchType">
											<option value="ORDERNUM">주문번호</option>
											<option value="FREIGHTID">화주ID</option>
											<option value="CAROWNERID">차주ID</option>
											<option value="FREIGHTNAME">화주명</option>
											<option value="CAROWNERNAME">차주명</option>
											<option value="CARNUMBER">차량번호</option>
										</select>
									</div>
									<div class="col-4">
										<input type="text" class="form-control" id="orderSearchKeyword"
											placeholder="검색어를 입력하세요.">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-2 text-right">
						<button type="button" id="btnOrderSearch" class="btn btn-custom04 btn-rounded waves-effect waves-dark">조회</button>
					</div>
				</div>
				<div id="popupList"></div>
                <div class="button-list text-center mt-2">
                    <button type="button" class="btn btn-dark width-sm  btn-rounded waves-effect waves-dark" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-custom01 width-sm  btn-rounded waves-effect waves-dark" id="btnOrderSelect">확인</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End 주문번호찾기 팝업 -->
<script>
$('#btnOrderSearch').on('click', function(){
	loadOrderSearchPopupList(0, 1);
});

$('#btnOrderSelect').on('click', function(){
 	var orderNumber = $('#popup [name="chk"]:checked').val();
 	var orderId = $('#popup [name="chk"]:checked').data('order_id');
 	
 	if(orderNumber === undefined){
 		alert('주문번호를 선택해주세요.');
 		return;
 	}
	
	$('.edit-box #orderNumber').html(orderNumber);
	$('.edit-box').data('voc_order_num', orderNumber);
	$('.edit-box').data('voc_order_id', orderId)
	$('#popup').modal('hide');
});
</script>
