<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" 
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%>
<!-- Begin 변경사유입력 팝업 -->
<div id="popupUpdateReason" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" data-param_id="${paramId}" data-param_type="${paramType}">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">변경사유</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
                <textarea class="form-control" id="updateReason" maxlength="50" rows="3" style="resize:none;" placeholder="변경사유를 입력하세요."></textarea>
                <div class="button-list text-center mt-2">
                    <button type="button" class="btn btn-dark width-sm  btn-rounded waves-effect waves-dark" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-custom01 width-sm  btn-rounded waves-effect waves-dark" id="btnUpdate">저장</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End 변경사유입력 팝업 -->