<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="otpPopup" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">로그인 OTP</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
            	<div class="info-text text-center mb-2">OTP를 입력해주세요.</div>
                <input class="form-control text-center" id="otp"></input>
                <div class="button-list text-center mt-2">
                    <button type="button" class="btn btn-custom01 width-sm  btn-rounded waves-effect waves-dark" onclick="verifyOtp();">확인</button>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<script>
var _sellerNoteYn = sellerNoteYn;

//otp 검증
function verifyOtp() {
	var otpValidEndTime = new Date();

	var elapsedTime = (otpValidEndTime.getTime() - otpValidStartTime.getTime()) / 1000;
	
	if(elapsedTime > 300) {
		alert("유효시간이 초과되었습니다. 다시 로그인해주세요.");
	} else {
		verifiableOtp();
	}
}

function verifiableOtp() {
	var adminPw = $('#pwd').val();
	var rsa = new RSAKey();
	rsa.setPublic($('#RSAModulus').val(),$('#RSAExponent').val());
	var enPwd = rsa.encrypt(adminPw);
	
	$.ajax({
	    type : "POST",
	    url : "<c:url value='/ui/service/login/otp.verify'/>",
	    data : {
	    	"adminId" : $('#id').val(),
	    	"adminPw" : enPwd,
	    	"otpNum" : $('#otp').val()
    	},
	    cache : false,
	    async : true,
	    success : function(data, textStatus, XMLHttpRequest) {
	    	
			if(data.error != null) {
				alert('OTP 인증 도중 오류가 발생하였습니다.\r\nERROR: '+data.error);
			} else if(data.resultCode != null) {
				var res = data.resultCode;
				switch(res) {
					case '00000':
						if(data.pwFlag === 'Y'){ 
							//비밀번호 변경이 6개월 이상 넘었을때
							alert('비밀번호 변경일로부터 6개월이 지났습니다.\r\n새로운 비밀번호로 변경 후 서비스를 이용해 주세요');
							location.href ='<c:url value="/ui/page/login/change"/>';
							return;
						}
					
						if(_sellerNoteYn) {
							location.href = '<c:url value="/ui/page/order/manual"/>';
						} else {
							location.href = '<c:url value="/ui/page/dashboard/index"/>';
							//20221101 로그인시 대시보드로 연결 안하고 다른페이지로 이동(임시) 
							//location.href = '<c:url value="/ui/page/login/change"/>'; 
						}
						break;
					case '00006': 
						alert('반복된 로그인 실패로 해당 IP의 접속이 제한되었습니다. 잠시 후 다시 시도해주세요.'); //2022.04.20 ip차단 추가
						break;
					case '10005': 
						alert('OTP 5회 입력 오류로 인해 로그인할 수 없습니다. 잠시 후 다시 시도해주세요.'); 
						break;
					case '40001':
						alert('OTP 발급 대상자가 아닙니다.');
						break;
					case '40002':
					case '40004':
						alert('올바르지 않은 OTP입니다. 다시 입력해주세요.');
						break;
					case '40003':
						alert('유효시간이 초과되었습니다. 다시 로그인해주세요.');
						break;
					default:
						alert('OTP 인증 도중 오류가 발생하였습니다.');
						break;
				}
			} else {
				alert('OTP 인증 도중 오류가 발생하였습니다.');
			}
	    },
	    error : function(xhr, ajaxOptions, thrownError) {
	    	if (hasErrorMap(xhr, false)){
				return;
			}
	    }
	});
}

$('#otp').on('keyup', function(event) {
	if (event.keyCode == 13) {
		verifyOtp();
        return;
    }
})
</script>