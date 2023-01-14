<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="popup" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
    	<div class="modal-content">
        	<div class="modal-header">
                <h4 class="modal-title">발송내용 (SMS)</h4>
                <button type="button" class="close btn_modal_dismiss" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
             <div class="modal-body">
           		<div class="table-responsive">
					<table class="table mb-0 basic-table">
						<colgroup>
							<col width="20%"/>
							<col/>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">제목</th>
								<td>
									<input type="text" class="form-control" id="title" onkeyup="fnCheckByteTitle(32, this)">
								</td>
							</tr>
							<tr>
								<th scope="row">수신 그룹</th>
								<td>
									<div class="col-8 col-form-label text-left">
										<div class="form-check-inline">
											<input type="radio" class="form-check-input" name="ownerClassification" id="recipientAll" value="all">
											<label class="form-check-label" for="recipientAll">전체</label>
										</div>
										<div class="form-check-inline">
											<input type="radio" class="form-check-input" name="ownerClassification" id="recipientCarOwner" value="carOwner">
											<label class="form-check-label" for="recipientCarOwner">차주</label>
										</div>
										<div class="form-check-inline">
											<input type="radio" class="form-check-input" name="ownerClassification" id="recipientfreightOwner" value="freightOwner">
											<label class="form-check-label" for="recipientfreightOwner">화주</label>
							 			</div>
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<textarea rows="5" id="sendMsg" class="form-control" style="height:200px; max-height:200px; overflow-y: auto;" placeholder="문자 메시지를 입력하는 공간입니다."  onkeyup="fnCheckByte(2000, this)"></textarea>
									<label class="pl-1 pt-1"><span id="nowByte">0</span>/2000 byte</label>
									<div class="pl-1">메시지가 90 byte를 넘어가면 LMS가 발송됩니다.</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="button-list text-center mt-2">
					<button type="button" class="btn btn-dark btn-rounded waves-effect waves-dark" id="btnCancelSms">취소</button>
                 	<button type="button" class="btn btn-custom01 width-sm  btn-rounded waves-effect waves-dark" id="btnSensSms">발송하기</button>
             	</div>
			</div>
    	</div>
    </div>
</div>