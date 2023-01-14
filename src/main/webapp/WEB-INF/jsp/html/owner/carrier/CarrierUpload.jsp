<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Begin page -->
<div class="card-box info-box" data-carrier_id="${vo.carrierId}">
	<div class="table-responsive">
		<table class="table mb-0 basic-table">
			<colgroup>
				<col style="width: 10%;">
				<col style="width: 20%;">
				<col style="width: auto;">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">운송대행사명<span class="text-danger ml-1">*</span></th>
					<td><input type="text" class="form-control" id="carrierName" placeholder="운송대행사명을 입력하세요."></td>
					<td></td>
				</tr>
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
					<th scope="row">사업자등록번호<span class="text-danger ml-1">*</span></th>
					<td><input type="text" class="form-control" id="carrierCorporateRegistrationNumber" placeholder="사업자등록번호를 입력하세요."></td>
					<td></td>
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
				<tr>
					<th scope="row">추천인 ID</th>
					<td><input type="text" class="form-control" id="carrierRecommendId"></td>
					<td></td>
				</tr>
				<tr>
					<th scope="row">결제조건</th>
					<td>
						<select class="form-control" id="carrierPaymentCondition">
							<c:forEach var="row" items="${paymentCondition}">
								<option value="${row.codeId}">${row.codeName}</option>
							</c:forEach>
						</select>
					</td>
					<td></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<div class="button-list text-center">
	<button type="button" class="btn btn-secondary width-sm btn-rounded waves-effect waves-dark" id="btnCancel">취소</button>
    <button type="button" class="btn btn-custom01 width-sm btn-rounded waves-effect waves-dark" id="btnReg" disabled>등록</button>
</div>

<div id="modal"></div>

<!-- End page -->
<script>
	$('.link').css('cursor', 'pointer');
	$('.link').addClass('color-text-primary');
	
	$(document).ready(function () {
		pageTitle = $(".page-title")[0];
		pageTitleName = pageTitle.innerHTML;
		pageTitle.innerHTML = "운송대행사 등록";
	});
	
	$('#btnCancel').on('click', function(){
		flag.listFormLoaded = false;
		var tempData = searchedData;
		if($.isEmptyObject(tempData)){
			routie('list');
		}else{
			routie('list/'+encodeURIComponent(JSON.stringify(tempData)));
		}
	});
	
	//등록
	$('#btnReg').on('click', function(){
		
		var formData                           = {};
		var carrierName                        = $('#carrierName').val();
		var carrierId                          = $('#carrierId').val();
		var carrierPassword                    = $('#carrierPassword').val();
		var carrierCorporateRegistrationNumber = $('#carrierCorporateRegistrationNumber').val();
		var carrierTelephone                   = $('#carrierTelephone').val();
		var carrierEmail                       = $('#carrierEmail').val();
		var carrierRecommendId                 = $('#carrierRecommendId').val();
		var carrierPaymentCondition            = $('#carrierPaymentCondition').val();
		
		if(carrierName == '' || carrierId == '' || carrierPassword == '' || carrierCorporateRegistrationNumber == '' || carrierTelephone == '' || carrierEmail == ''){
			alert("필수항목을 입력해주세요.");
			return false;
		}
		
		formData.carrierId                          = carrierId;
		formData.carrierName                        = carrierName;
		formData.carrierPassword                    = carrierPassword;
		formData.carrierCorporateRegistrationNumber = carrierCorporateRegistrationNumber;
		formData.carrierTelephone                   = carrierTelephone;
		formData.carrierEmail                       = carrierEmail;
		formData.carrierRecommendId                 = carrierRecommendId;
		formData.carrierPaymentCondition            = carrierPaymentCondition;

		if(confirm("저장하시겠습니까?")) {
			// 운송대행사 등록
			$.ajax({
				type : "POST",
				url : "<c:url value='/ui/service/owner/carrier/insert'/>",
				data : formData,
				cache : false,
				async : true,
				success : function(result, textStatus, XMLHttpRequest) {
					if(result.resultCode == '00003') {
						alert("이미 존재하는 운송대행사입니다.");
					} else if(result.resultCode == '00000') {
						alert("운송대행사가 등록되었습니다.");
					} else {
						alert('운송대행사 등록 중 오류가 발생하였습니다\r\nERROR:'+result.resultMsg);
					}
					
				},
				error : function(xhr, ajaxOptions, thrownError) {
					if(hasErrorMap(xhr, false)){
						return;
					}
				}
			}); 
		}
		
	});
	
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
		var name        = $('#carrierName').val();
		var email       = $('#carrierEmail').val();
		var phone       = $('#carrierTelephone').val();
		var pw          = $('#carrierPassword').val();
		var corporate   = $('#carrierCorporateRegistrationNumber').val();
		var emailFormat = checkEmail(email);
		var phoneFormat = checkTelNum(phone);
		
		if(id!="" && name!="" && email!="" && phone!="" && corporate!="" && pw!="" && emailFormat && phoneFormat) {
			$('#btnReg').attr('disabled', false);
		} else {
			$('#btnReg').attr('disabled', true);
		}
	});

</script>
