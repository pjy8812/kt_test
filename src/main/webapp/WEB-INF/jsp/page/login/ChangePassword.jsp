<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<input type="hidden" id="RSAModulus" value="${RSAModulus}">
<input type="hidden" id="RSAExponent" value="${RSAExponent}">
<script src="<c:url value="/assets/js/captcha/rsa.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/js/captcha/jsbn.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/js/captcha/prng4.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/js/captcha/rng.js"/>" type="text/javascript"></script>	
<div class="row">
	<div class="col-12">
		<div class="card-box">
			<h5 class="card-title">비밀번호 재설정</h5>
			<div class="table-responsive">
				<table class="table mb-0 basic-table">
					<colgroup>
						<col style="width: 15%;">
						<col style="width: 40%;">
						<col style="width: auto;">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">기존 비밀번호</th>
							<td>
								<input type="password" id="currentPw" class="form-control form-control-sm" placeholder="기존 비밀번호를 입력하세요.">
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row">새로운 비밀번호</th>
							<td>
								<input type="password" id="loginPw" class="form-control form-control-sm mb-2" placeholder="8자리 이상/영문 대소문자, 숫자, 특수문자 중 3종류 포함">
								<p class="loginPw loginPw-avail text-primary mb-0 d-none">사용 가능한 비밀번호입니다.</p>
								<p class="loginPw loginPw-invalid text-danger mb-0 d-none">8자리 이상/영문 대소문자, 숫자, 특수문자 중 3종류를 포함해 입력해주세요.</p>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row">비밀번호 재확인</th>
							<td>
								<input type="password" id="loginPwConfirm" class="form-control form-control-sm mb-2" placeholder="비밀번호를 다시 입력하세요.">
								<p class="loginPwConfirm loginPwConfirm-avail text-primary mb-0 d-none">비밀번호가 확인되었습니다.</p>
								<p class="loginPwConfirm loginPwConfirm-invalid text-danger mb-0 d-none">입력한 비밀번호와 일치하지 않습니다. 다시입력해주세요.</p>
							</td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<div class="button-list">
			<button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark" id="btnReset">비밀번호 재설정</button>
		</div>
	</div>
</div>


<script>
var cData = {
	loginPwFlag : false,
	loginPwConfirmFlag : false
}

//새로운 비밀번호 입력
$('#loginPw').on('keyup', function(){
	checkPasswordType("${User.adminId}");
	
	// 비밀번호 재확인 값 초기화
	$('#loginPwConfirm').val('');
	$('p.loginPwConfirm').addClass('d-none');
	cData.loginPwConfirmFlag = false;
});

//비밀번호 재확인
$('#loginPwConfirm').on('input', function(){
	var loginPw = $('#loginPw').val();
	var loginPwConfirm = $('#loginPwConfirm').val();
	
	if(loginPw != loginPwConfirm) {
		$('p.loginPwConfirm-invalid').removeClass('d-none');
		$('p.loginPwConfirm-avail').addClass('d-none');
		cData.loginPwConfirmFlag = false;
	} else {
		$('p.loginPwConfirm-avail').removeClass('d-none');
		$('p.loginPwConfirm-invalid').addClass('d-none');
		cData.loginPwConfirmFlag = true;
	}
});

//비밀번호 재설정
$('#btnReset').on('click', function(){
	if(cData.loginPwFlag && cData.loginPwConfirmFlag) {
		
		//RSA 적용 by 2022.03.29 mijin.kim
		var rsa = new RSAKey();
	   	rsa.setPublic($('#RSAModulus').val(),$('#RSAExponent').val());
		var adminPw =  $('#loginPwConfirm').val();
	   	var enPwd = rsa.encrypt(adminPw);
	   	
	   	//기존비밀번호 추가 by2022.03.31 mijin.kim
	   	var currentPw = $('#currentPw').val();
   		var adminOldPw = rsa.encrypt(currentPw);
   		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/login/change'/>",
			data : {
				"adminPw" : enPwd
				, "adminOldPw": adminOldPw
			},
			cache : false,
			async : true,
			success : function(data, textStatus, XMLHttpRequest) {
				//console.log(data);
				
				if(data.error != null) {
					alert('비밀번호 재설정 도중 오류가 발생하였습니다.\r\nERROR: '+data.error);
				} else if(data.resultCode == '00003') {
					alert('이전과 동일한 비밀번호로 바꿀 수 없습니다.');
				} else if(data.resultCode == '10003') {
					alert('8자리 이상/영문 대소문자, 숫자, 특수문자 중 3종류를 포함해 입력해주세요.');
				}else if(data.resultCode == '10002') {
					alert('기존 비밀번호와 동일한 비밀번호로는 변경하실 수 없습니다.');
				} else if(data.resultCode == '10001') {
					alert('기존 비밀번호가 올바르지 않습니다.');
				} else if(data.resultCode == '00000') {
					if(!alert("비밀번호 재설정이 완료되었습니다.")) {
						location.href = '<c:url value="/page/index"/>?accessToken=${User.accessToken}';
					}
				} else {
					alert('비밀번호 재설정 도중 오류가 발생하였습니다.\r\nERROR: '+data.resultMsg);
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert('비밀번호 재설정 도중 오류가 발생하였습니다.');
			}
		});
	} else {
		alert("새로운 비밀번호와 비밀번호 재확인을 모두 올바르게 입력해주세요.");
	}
});

//공백입력 금지
$('input').on('input', function(){
	$(this).val($(this).val().replace(/ /gi, ""));
});
</script>
