<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="popup" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
    	<div class="modal-content">
        	<div class="modal-header">
                <h4 class="modal-title">발송내용 (이메일)</h4>
                <button type="button" class="close btn_modal_dismiss" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
             <div class="modal-body">
           		<div class="table-responsive">
					<table class="table mb-0 basic-table">
						<colgroup>
							<col width="30%"/>
							<col/>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">제목</th>
								<td>${result.subject}</td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="">
									${result.msg}
									</div>
									<textarea rows="5" cols="" class="form-control d-none" style="height:450px; max-height:450px; overflow-y:auto;"></textarea>
								</td>
							</tr>
							<tr class="d-none">
								<td colspan="2">
									<div class="row" style="max-height:100px; overflow-y:auto;">
										<div class="col-12">
											<p class="file-name"><i class="fe-paperclip mr-1"></i>첨부파일1</p>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="button-list text-center mt-2">
                 	<button type="button" class="btn btn-custom01 width-sm  btn-rounded waves-effect waves-dark btn_modal_dismiss" data-dismiss="modal">확인</button>
             	</div>
			</div>
    	</div>
    </div>
</div>