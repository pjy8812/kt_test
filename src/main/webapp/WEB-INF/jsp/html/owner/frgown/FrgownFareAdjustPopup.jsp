<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" 
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%>
<div id="frgownFareAdjustPopup" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" data-owner-id="${info.frgownId}">
    <div class="modal-dialog modal-dialog-centered modal-xl">
    	<div class="modal-content" style="width:450px">
        	<div class="modal-header">
                <h4 class="modal-title">요금조정구간</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body pt-0">
	          	<div class="card-box mb-0">
		        	<h5 class="modal-title">사업자등록 번호&nbsp;&nbsp;:&nbsp;&nbsp;<c:out value="${info.corporateRegistrationNumber}"></c:out></h5>
					<div class="table-responsive col-12">
						<table class="mb-0">
			                <tr>
								<td class="col-4 mb-0 border-top-0">
									<input type="number" id="fareAdjustFrom" class="form-control text-right" min="-99"  max="99" value="${info.fareAdjustFrom}" 
										onKeyUp="removeChar(event);onlyNumber(event);" onkeydown="onlyNumber(event);"  oninput="maxLengthCheck(this)" maxLength="3">
								</td>
								<td>
									%<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;~</span>
								</td>
							    <td class="col-4 mb-0 border-top-0">
									<input type="number" id="fareAdjustTo" class="form-control text-right" min="-99"  max="99" value="${info.fareAdjustTo}" 
										onKeyUp="removeChar(event);onlyNumber(event);" onkeydown="onlyNumber(event);"  oninput="maxLengthCheck(this)" maxLength="3">
							    </td>
								<td>
									%
								</td>							     								
			                </tr>
						</table>
					</div>
	                <div class="button-list text-center mt-2">
	                    <button type="button" class="btn btn-dark width-sm  btn-rounded waves-effect waves-dark" data-dismiss="modal">취소</button>
	                    <button type="button" class="btn btn-custom01 width-sm  btn-rounded waves-effect waves-dark" id="btnUpdate">저장</button>
	                </div>
            	</div>
			</div>
    	</div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->