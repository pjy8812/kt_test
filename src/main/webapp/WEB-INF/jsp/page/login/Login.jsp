<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
.modal-title, .info-text {font-family: Rubik,sans-serif; color: #343a40;}
</style>
<input type="hidden" id="RSAModulus" value="${RSAModulus}">
<input type="hidden" id="RSAExponent" value="${RSAExponent}">
<script src="<c:url value="/assets/js/captcha/rsa.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/js/captcha/jsbn.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/js/captcha/prng4.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/js/captcha/rng.js"/>" type="text/javascript"></script>		
<div id="wrapper">
	<div class="content-page">
		<div class="content">
			<div class="login-wrap" style="width:350px;">
				<div class="img-box text-center">
					<img src='<c:url value="/assets/images/SVG/logo_black.svg"/>' alt="logo">
				</div>
				<div class="form-group-wrap">
					<div class="form-group">
						<input type="text" class="form-control" id="id" placeholder="아이디">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" id="pwd" placeholder="비밀번호">
					</div>
	                <div class="mt-4">
	                	<button type="button" class="btn w-100 btn-dark" id="btnLogin" onclick="login();" disabled>로그인</button>
	                </div>
	           	</div>
	           	<div class="member-help-wrap text-center mt-3 text-dark" onclick="resetPwd();" style="cursor:pointer;">
	           		비밀번호 재설정
	           	</div>
			</div>
		</div>
	</div>
</div>

<div id="popup_otp"></div>
<div id="popup_resetPwd"></div>


<script>
var sellerNoteYn = false;

//로그인
function login() {
	var adminId = $('#id').val();
	var adminPw = $('#pwd').val();
	
	//RSA 적용 by 2022.03.29 mijin.kim
	var rsa = new RSAKey();
   	rsa.setPublic($('#RSAModulus').val(),$('#RSAExponent').val());
   	var enPwd = rsa.encrypt(adminPw);
	
	$.ajax({
		type : "POST",
		url : "<c:url value='/ui/service/login'/>",
		data : {
			"adminId" : adminId,
			"adminPw" : enPwd, 
		},
		cache : false,
		async : true,
		success : function(data, textStatus, XMLHttpRequest) {
			//console.log(data);
			
			if(data.error != null) {
				alert('로그인 도중 오류가 발생하였습니다.\r\nERROR: '+data.error);
			} else if(data.resultCode != null) {
				var res = data.resultCode;
				switch(res) {
					case '00000':
						if(data.adminAuthorityGroupCode === 'manualDelivery') {
							sellerNoteYn = true;
						}
						
						requestOtp(); //otp요청
						break;
					case '00001':
						alert('비밀번호 암호화에 실패하였습니다.');
						break;
					case '00002':
						alert('DB 오류가 발생하였습니다.');
						break;
					case '00006': 
						alert('반복된 로그인 실패로 해당 IP의 접속이 제한되었습니다. 잠시 후 다시 시도해주세요.'); //2022.04.20 ip차단 추가
						break;
					case '10005': 
						alert('OTP 5회 입력 오류로 인해 로그인할 수 없습니다. 잠시 후 다시 시도해주세요.'); 
						break;	
					case '10001':
						alert('입력하신 아이디 또는 비밀번호가 잘못되었습니다.\n다시 입력해주세요.');
						break;
					case '20001':
						alert('토큰 생성 중 오류가 발생하였습니다.');
						break;
					case '50001':
						alert('권한 오류가 발생하였습니다.');
						break;
					default:
						alert('로그인에 실패하였습니다.');
						break;
				}
			} else if(data.accessToken == null) {
				alert('토큰 생성 중 오류가 발생하였습니다.');
			} else {
				alert('로그인에 실패하였습니다.');
			}
		},
		error : function(xhr, ajaxOptions, thrownError) {
			if (hasErrorMap(xhr, false)){
				return;
			}
		}
	});
}

//otp 경과시간 체크
var otpValidStartTime;

//otp 요청
function requestOtp() {
	$.ajax({
	    type : "POST",
	    url : "<c:url value='/ui/service/login/otp.request'/>",
	    data : {
	    	"adminId" : $('#id').val()
    	},
	    cache : false,
	    async : true,
	    success : function(data, textStatus, XMLHttpRequest) {
			if(data.error != null) {
				alert('OTP 요청 도중 오류가 발생하였습니다.\r\nERROR: '+data.error);
			} else if(data.resultCode == '00000') {
				openOtpPopup(); //otp입력팝업
				otpValidStartTime = new Date();
			} else {
				alert('OTP 요청 도중 오류가 발생하였습니다.\r\nERROR: '+data.resultMsg);
			}
	    },
	    error : function(xhr, ajaxOptions, thrownError) {
	    	if (hasErrorMap(xhr, false)) {
				return;
			}
	    }
	});
}

//otp 입력 팝업
function openOtpPopup() {
	$.ajax({
	    type : "POST",
	    url : "<c:url value='/ui/service/login/otp.popup'/>",
	    data : {},
	    cache : false,
	    async : true,
	    success : function(data, textStatus, XMLHttpRequest) {
			$('#popup_otp').html(data);
			$('#otpPopup').modal('show');
	    },
	    error : function(xhr, ajaxOptions, thrownError) {
	    	if (hasErrorMap(xhr, false)) {
				return;
			}
	    }
	});
}

//비밀번호 재설정 팝업
function resetPwd() {
	$.ajax({
	    type : "POST",
	    url : "<c:url value='/ui/service/login/change.popup'/>",
	    data : {},
	    cache : false,
	    async : true,
	    success : function(data, textStatus, XMLHttpRequest) {
			$('#popup_resetPwd').html(data);
			$('#resetPwdPopup').modal('show');
	    },
	    error : function(xhr, ajaxOptions, thrownError) {
	    	if (hasErrorMap(xhr, false)) {
				return;
			}
	    }
	});
}

$('#pwd').on('keyup', function(event) {
	if (event.keyCode == 13) {
		login();
        return;
    }
})

//로그인버튼 활성화
$('#id, #pwd').on('keyup', function(){
	if($('#id').val() == '' || $('#pwd').val() == '') {
		$('#btnLogin').prop('disabled', true);
	} else {
		$('#btnLogin').prop('disabled', false);
	}
});
</script>
