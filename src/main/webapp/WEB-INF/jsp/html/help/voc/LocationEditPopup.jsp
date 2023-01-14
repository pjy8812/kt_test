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
                <h4 class="modal-title">요청자 추가</h4>
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
								<th scope="row">요청자ID<span class="text-danger ml-1">*</span></th>
								<td>
									<input type="text" class="form-control" id="carOwnerId"  pattern="[A-Za-z]+" />
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="button-list text-center mt-2">
					<button type="button" class="btn btn-dark btn-rounded waves-effect waves-dark" id="btnCancel">취소</button>
                 	<button type="button" class="btn btn-custom01 width-sm  btn-rounded waves-effect waves-dark" id="btnSaveRequester">저장</button>
             	</div>
			</div>
    	</div>
    </div>
</div>