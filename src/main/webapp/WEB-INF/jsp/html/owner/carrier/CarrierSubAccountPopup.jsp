<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="popup" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" data-owner_id="${info.ownerId}">
    <div class="modal-dialog modal-dialog-centered modal-lg">
    	<div class="modal-content">
             <div class="modal-header">
                 <h4 class="modal-title">운송대행사 Sub ID 추가</h4>
                 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
             </div>
             <div class="modal-body doc-preview">
	             <div class="table-responsive">
					<table class="table mb-0 basic-table">
						<colgroup>
							<col style="width: 20%;">
							<col style="width: 50%;">
							<col style="width: auto;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">운송대행사 ID<span class="text-danger ml-1">*</span></th>
								<td><input type="text" class="form-control" id="carrierId" placeholder="운송대행사 ID를 입력하세요."></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">운송대행사 PW<span class="text-danger ml-1">*</span></th>
								<td>
									<input type="password" id="carrierPassword" class="form-control" placeholder="8자리 이상/영문 대소문자, 숫자, 특수문자 중 3종류 포함">
								</td>								
								<td>
									<p class="carrierPassword carrierPassword-avail text-primary mb-0 d-none">사용 가능한 비밀번호입니다.</p>
									<p class="carrierPassword carrierPassword-invalid text-danger mb-0 d-none">8자리 이상/영문 대소문자, 숫자, 특수문자 중 3종류를 포함해 입력해주세요.</p>
								</td>
							</tr>
							<tr>
								<th scope="row">전화번호<span class="text-danger ml-1">*</span></th>
								<td><input type="text" class="form-control" id="carrierTelephone" placeholder="전화번호를 입력하세요." onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)"></td>
								<td class="result resultPhone"></td>
							</tr>
							<tr>
								<th scope="row">이메일주소<span class="text-danger ml-1">*</span></th>
								<td><input type="text" class="form-control" id="carrierEmail" placeholder="이메일주소를 입력하세요."></td>
								<td class="result resultEmail"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="button-list text-center" style="margin-top: 20px;">
                     <button type="button" class="btn btn-secondary width-sm btn-rounded waves-effect waves-dark" data-dismiss="modal" aria-hidden="true">취소</button>
                     <button type="button" class="btn btn-custom01 width-sm btn-rounded waves-effect waves-dark" id="saveBtn" disabled>저장</button>
                 </div>
             </div>
         </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script>
	$('#saveBtn').on('click', function () {
		var carrierMasterId = carrierData.carrierId;
		var carrierCorporateRegistrationNumber = carrierData.carrierCorporateRegistrationNumber;
		var carrierId = $('#carrierId').val();
		var carrierPassword = $('#carrierPassword').val();
		var carrierTelephone = $('#carrierTelephone').val();
		var carrierEmail = $('#carrierEmail').val();
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/carrier/popup/account/insert/'/>" + carrierMasterId,
			data : {
				"carrierId": carrierId,
				"carrierCorporateRegistrationNumber": carrierCorporateRegistrationNumber,
				"carrierPassword": carrierPassword,
				"carrierTelephone": carrierTelephone,
				"carrierEmail": carrierEmail,
			},
			cache : false,
			async : true,
			success : function(result, textStatus, XMLHttpRequest) {
				if(hasErrorMap(result, true)){
					return;
				}
				if(result.resultCode == '00003') {
					alert("이미 존재하는 운송대행사입니다.");
					return;
				} else if(result.resultCode == '00000') {
					alert("운송대행사 Sub ID가 등록되었습니다.");
				} else {
					alert('운송대행사 Sub ID 저장중 오류가 발생하였습니다\r\nERROR:'+result.resultMsg);
					return;
				}
				
				$('#popup').modal('hide');
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if(hasErrorMap(xhr, false)){
					return;
				}
			}
		}); 
	});

	function toJSON(model) {
		var tmp = model;
		tmp = tmp.replace("[", "");
		tmp = tmp.replace("]", "");

		var data = tmp.split("}, {");
		data[0] = data[0].replace("{", "");
		data[data.length-1] = data[data.length-1].replace("}", "");
		
		var result = [];
		for (var i = 0; i < data.length; i++) {
			var codeTmp = data[i].split(", ");

			var jsonObj = {};
			for (var j = 0; j < codeTmp.length; j++) {
				jsonObj[codeTmp[j].split("=")[0]] = codeTmp[j].split("=")[1];
			}

			result.push(jsonObj);
		}
		
		return result;
	}

	//이메일 입력
	$('#carrierEmail').on('change', function(){
		//이메일 형식체크
		if(!checkEmail($('#carrierEmail').val())) {
			$('.resultEmail').html('이메일 형식이 맞지 않습니다.').removeClass('text-primary').addClass('text-danger');
		} else {
			$('.resultEmail').html("사용 가능한 이메일입니다.").removeClass('text-danger').addClass('text-primary');
		}
	});
	
	//전화번호 입력
	$('#carrierTelephone').on('change', function(){
		//전화번호 형식체크
		if(!checkTelNum($('#carrierTelephone').val())) {
			$('.resultPhone').html('전화번호 형식이 맞지 않습니다.').removeClass('text-primary').addClass('text-danger');
		} else {
			$('.resultPhone').html("사용 가능한 전화번호입니다.").removeClass('text-danger').addClass('text-primary');
		}
	});

	//한글입력방지, 소문자 변환처리
	$("#carrierId").on("keyup", function(event) {
		if(!(event.keyCode >= 37 && event.keyCode <= 40)) {
			var inputId = $(this).val();
			$(this).val(inputId.replace(/[^a-z._@0-9^-]/gi,''));
		}
		
		if($(this).attr('id').indexOf('Id') > -1) {
		    $(this).val($(this).val().toLowerCase());
		}
	});

	//패스워드
	$('#carrierPassword').on('change', function(){
		checkPasswordTypePw($('#carrierId').val());
	});
	
	// 비밀번호 정책
	function checkPasswordTypePw(id) {
		$('p.carrierPassword').addClass('d-none');
		
		var typnCnt = 0;
		var pw = $('#carrierPassword').val();
		
		// ID와 4자리이상 동일한지 체크
		var tmp = "";
		var cnt = 0;
		for(i=0; i<id.length-2; i++){
			tmp = id.charAt(i) + id.charAt(i+1) + id.charAt(i+2) + id.charAt(i+3);
			
			if(pw.indexOf(tmp) > -1){
				cnt = cnt + 1;
			}
		}
		// 연속된 문자/숫자 체크
		var continuous = chkPwContinue(pw);
		
		if(cnt > 0) {
			var str = 'ID와 4자리 이상 동일한 비밀번호는 사용할 수 없습니다.';
			$('p.carrierPassword-invalid').html(str).removeClass('d-none');
			return;
		} else if(continuous || /(\w)\1\1\1/.test(pw)) {
	        var str = '4자리 이상 연속되거나 중복되는 숫자/문자는 비밀번호에 포함될 수 없습니다.';
			$('p.carrierPassword-invalid').html(str).removeClass('d-none');
			return;
	    } else if(pw.length < 8) {
			var str = '8자리 이상/영문 대소문자, 숫자, 특수문자 중 3종류를 포함해 입력해주세요.';
			$('p.carrierPassword-invalid').html(str).removeClass('d-none');
			return;
		}

		var flagEng = false;
		var flagNum = false;
		var flagSC = false;

		// 대소문자
		if(/[A-Z]/g.test($('#carrierPassword').val()) || /[a-z]/g.test($('#carrierPassword').val())) {
			typnCnt++;
			flagEng = true;
		}
		// 숫자
		if(/\d/g.test($('#carrierPassword').val())) {
			typnCnt++;
			flagNum = true;
		}
		// 특수문자
		if(/[-\'/`~!#*$@_%+=.,^&(){}[\]|;:\"<>?\\]/g.test($('#carrierPassword').val())) {
			typnCnt++;
			flagSC = true;
		}

		if(typnCnt > 2) {
			$('p.carrierPassword-avail').removeClass('d-none');
			return;
		} else {
			var temp ='';
			if(flagEng == false){
				temp += '영문 대문자 또는 소문자'
			}

			if(flagNum == false){
				if(temp.length > 0) temp += ' 또는 '
				temp += '숫자'
			}

			if(flagSC == false){
				if(temp.length > 0) temp += ' 또는 '
				temp += '특수문자'
			}

			var str = '8자리 이상/영문 대소문자, 숫자, 특수문자 중 3종류를 포함해 입력해주세요. ({0}을/를 포함하세요.)'.format(temp);
			$('p.carrierPassword-invalid').html(str).removeClass('d-none');
			return;
		}
	}

	// 연속된 문자/숫자 체크(4자리)
	function chkPwContinue(pw){
		var cnt1 = 0;
		var cnt2 = 0;
		var tmp0 = "";
		var tmp1 = "";
		var tmp2 = "";
		var tmp3 = "";

	    for (var i=0; i<pw.length; i++) {
	        tmp0 = pw.charAt(i);
	        tmp1 = pw.charAt(i+1);
	        tmp2 = pw.charAt(i+2);
	        tmp3 = pw.charAt(i+3);

	        if(tmp0.charCodeAt(0)-tmp1.charCodeAt(0) == 1
	        && tmp1.charCodeAt(0)-tmp2.charCodeAt(0) == 1
	        && tmp2.charCodeAt(0)-tmp3.charCodeAt(0) == 1) {
				cnt1 = cnt1 + 1;
	        }

			if(tmp0.charCodeAt(0)-tmp1.charCodeAt(0) == -1
			&& tmp1.charCodeAt(0)-tmp2.charCodeAt(0) == -1
			&& tmp2.charCodeAt(0)-tmp3.charCodeAt(0) == -1) {
				cnt2 = cnt2 + 1;
			}
	    }

	    if(cnt1 > 0 || cnt2 > 0) {
			return true;
	    } else {
			return false;
	    }
	}

	//필수입력값 및 형식확인
	$('#carrierId, #carrierName, #carrierEmail, #carrierTelephone, #carrierPassword, #carrierCorporateRegistrationNumber').on('input', function(){
		var id          = $('#carrierId').val();
		var email       = $('#carrierEmail').val();
		var phone       = $('#carrierTelephone').val();
		var pw          = $('#carrierPassword').val();
		var emailFormat = checkEmail(email);
		var phoneFormat = checkTelNum(phone);
		
		if(id!="" && email!="" && phone!="" && pw!="" && emailFormat && phoneFormat) {
			$('#saveBtn').attr('disabled', false);
		} else {
			$('#saveBtn').attr('disabled', true);
		}
	});
</script>