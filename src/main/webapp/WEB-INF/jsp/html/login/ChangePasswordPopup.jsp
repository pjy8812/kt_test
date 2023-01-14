<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="resetPwdPopup" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">비밀번호 재설정</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
            	<div class="info-text text-center mb-2">
					계정 ID와 등록된 전화번호를 입력해주세요.<br/>임시비밀번호를 SMS로 보내드리겠습니다.
				</div>
                <div class="row mb-2">
                	<label class="info-text col-3 col-form-label">이용자ID</label>
                	<div class="col-8">
                		<input class="form-control" id="adminId" placeholder="아이디"></input>
                	</div>
                </div>
                <div class="row mb-2">
                	<label class="info-text col-3 col-form-label">전화번호</label>
                	<div class="col-8">
                		<input class="form-control" id="adminPhone" placeholder="전화번호" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)"></input>
                	</div>
                </div>
                <div class="button-list text-center pt-1">
                    <button type="button" class="btn btn-custom01 width-sm  btn-rounded waves-effect waves-dark" id="issueTempPwd">임시 비밀번호 발송</button>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<script>
//임시 비밀번호 발급
$('#issueTempPwd').on('click', function(){
	var id = $('#adminId').val();
	var phone = $('#adminPhone').val();
	
	if(id=='' || phone=='' || !checkTelNum($('#adminPhone').val())) {
		alert("ID와 전화번호를 올바르게 입력해주세요.");
	}
	
	$.ajax({
	    type : "POST",
	    url : "<c:url value='/ui/service/login/change.request'/>",
	    data : {
			"adminId" : id,
			"adminTelephone" : phone
	    },
	    cache : false,
	    async : true,
	    success : function(data, textStatus, XMLHttpRequest) {
			//console.log(data);
			
	    	if(data.error != null) {
				alert('임시비밀번호 발급 중 오류가 발생하였습니다.\r\nERROR: '+data.error);
			} else if(data.resultCode == null) {
				alert('임시비밀번호 발급 중 오류가 발생하였습니다.\r\nERROR: '+data.code);
			} else if(data.resultCode == '00000') {
				alert("임시비밀번호를 SMS로 발송하였습니다. SMS를 확인해주세요.");
			} else if(data.resultCode == '10002') {
				alert("해당 ID/전화번호로 일치하는 계정이 없습니다.");
			} else {
				alert('임시비밀번호 발급 중 오류가 발생하였습니다.\r\nERROR: '+data.resultMsg);
			}
	    },
	    error : function(xhr, ajaxOptions, thrownError) {
	    	if (hasErrorMap(xhr, false)){
				return;
			}
	    }
	});
});
</script>
