<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="isCreate" value="false"/>
<c:set var="isUpdate" value="false"/>
<c:set var="isDelete" value="false"/>
<c:forEach items="${autUriList}" var="autUriList">
	<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'C') gt -1}"><c:set var="isCreate" value="true"/></c:if>
	<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'U') gt -1}"><c:set var="isUpdate" value="true"/></c:if>
	<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'D') gt -1}"><c:set var="isDelete" value="true"/></c:if>
</c:forEach>

<!-- Begin page -->
<div class="card-box" id="userEdit" data-admin_id="${adminId}">
	<h5 class="card-title">
		<c:if test="${empty adminId}">계정 추가</c:if>
		<c:if test="${!empty adminId}">계정 수정</c:if>
	</h5>
	<div class="table-responsive">
		<table class="table mb-0 basic-table">
			<colgroup>
				<col style="width: 10%;">
				<col style="width: 20%;">
				<col style="width: auto;">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">이용자ID<span class="text-danger ml-1">*</span></th>
					<td><input type="text" id="inputId" class="form-control form-control-sm" value="${result.info.adminId}" placeholder="ID를 입력하세요." <c:if test="${!empty adminId}">disabled</c:if>></td>
					<td class="result resultId"></td>
				</tr>
				<tr>
					<th scope="row">이용자명<span class="text-danger ml-1">*</span></th>
					<td><input type="text" id="inputName" class="form-control form-control-sm" value="${result.info.adminName}" placeholder="이름을 입력하세요." <c:if test="${!empty adminId}">disabled</c:if>></td>
					<td></td>
				</tr>
				<tr>
					<th scope="row">사번</th>
					<td><input type="text" id="inputEmpNum" class="form-control form-control-sm" value="${result.info.adminEmployeeNum}" placeholder="사번을 입력하세요." <c:if test="${!empty adminId}">disabled</c:if>></td>
					<td class="result resultEmpNum"></td>
				</tr>
				<tr>
					<th scope="row">비밀번호</th>
					<td id="inputPassword">
						<c:if test="${empty adminId}">(임시 비밀번호 발급)</c:if>
						<c:if test="${!empty adminId}"><button type="button" class="btn btn-dark btn-sm waves-effect waves-light" id="resetPassword">임시 비밀번호 재설정</button></c:if>
					</td>
					<td></td>
				</tr>
				<tr>
					<th scope="row">권한그룹<span class="text-danger ml-1">*</span></th>
					<td>
						<select class="form-control form-control-sm" id="authGroupList">
							<c:forEach items="${result.authGroupList.list}" var="list">
								<option value="${list.adminAuthorityGroupSeq}" <c:if test="${list.authGroupName eq result.info.adminAuthorityGroupName}">selected</c:if>>${list.authGroupName}</option>
							</c:forEach>
						</select>
					</td>
					<td></td>
				</tr>
				<tr>
					<th scope="row">이메일<span class="text-danger ml-1">*</span></th>
					<td><input type="text" id="inputEmail" class="form-control form-control-sm" value="${result.info.adminEmail}" placeholder="이메일을 입력하세요."></td>
					<td class="result resultEmail"></td>
				</tr>
				<tr>
					<th scope="row">전화번호<span class="text-danger ml-1">*</span></th>
					<td><input type="text" id="inputPhone" class="form-control form-control-sm" value="${result.info.adminTelephone}" placeholder="전화번호를 입력하세요." onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)"></td>
					<td class="result resultPhone"></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<div class="row">
	<div class="col-6">
		<div class="button-list">
			<c:if test="${!empty adminId}">
				<button type="button" class="btn btn-dark btn-rounded waves-effect waves-dark" id="btnMasking">
					마스킹 해제<span class="btn-label-right"><i class="fas fa-eye"></i></span>
				</button>
			</c:if>
		</div>
	</div>
	<div class="col-6">
		<div class="button-list text-right">
		<c:if test="${!empty adminId}">
			<c:if test="${isDelete}">
				<button type="button" class="btn btn-dark btn-rounded waves-effect waves-dark" id="btnDelete">삭제</button>
			</c:if>
		</c:if>
		<button type="button" class="btn btn-dark btn-rounded waves-effect waves-dark" id="btnCancel">취소</button>
		<c:choose>
			<c:when test="${empty adminId}">
				<c:if test="${isCreate}">
					<button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark" id="btnSave" <c:if test="${empty adminId}">disabled</c:if>>저장</button>
				</c:if>
			</c:when>
			<c:otherwise>
				<c:if test="${isUpdate}">
					<button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark" id="btnSave" <c:if test="${empty adminId}">disabled</c:if>>저장</button>
				</c:if>
		</c:otherwise>
		</c:choose>
	</div>
</div>
</div>

<script>
$(document).ready(function(){
	<c:if test="${not empty adminId}">
		<c:if test="${empty result.resultCode}">
			alert('계정 상세 조회 중 오류가 발생하였습니다.\r\nERROR: ${result}')
		</c:if>
		<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
			alert('계정 상세 조회 중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}')
		</c:if>
	</c:if>
		
	<c:if test="${empty result.authGroupList}">
		alert('권한그룹 목록 조회 중 오류가 발생하였습니다.\r\nERROR: null')
	</c:if>
	<c:if test="${not empty result.authGroupList.error}">
		alert('권한그룹 목록 조회 중 오류가 발생하였습니다.\r\nERROR: ${result.authGroupList.error}')
	</c:if>
	<c:if test="${empty result.authGroupList.resultCode}">
		alert('권한그룹 목록 조회 중 오류가 발생하였습니다.\r\nERROR: ${result.authGroupList}')
	</c:if>
});

//이용자ID 입력
$('#inputId').on('change', function(){
	resultHtml('resultId', checkAccount('adminId', $(this).val(), $(this).attr('id')));
});

//사번입력
$('#inputEmpNum').on('change', function(){
	resultHtml('resultEmpNum', checkAccount('adminEmployeeNum', $(this).val(), $(this).attr('id')));
});

//이메일 입력
$('#inputEmail').on('change', function(){
	//이메일 형식체크
	if(!checkEmail($('#inputEmail').val())) {
		$('.resultEmail').html('이메일 형식이 맞지 않습니다.').removeClass('text-primary').addClass('text-danger');
	} else {
		resultHtml('resultEmail', checkAccount('adminEmail', $(this).val(), $(this).attr('id')));
	}
});

//전화번호 입력
$('#inputPhone').on('change', function(){
	//전화번호 형식체크
	if(!checkTelNum($('#inputPhone').val())) {
		$('.resultPhone').html('전화번호 형식이 맞지 않습니다.').removeClass('text-primary').addClass('text-danger');
	} else {
		resultHtml('resultPhone', checkAccount('adminTelephone', $(this).val(), $(this).attr('id')));
	}
});

//임시 비밀번호 재설정
$('#resetPassword').on('click', function(){
	var resetYn = confirm("기존 비밀번호를 임시 비밀번호로 교체하시겠습니까?\n즉시 재설정되며, ${result.info.adminTelephone}로 임시비밀번호가 SMS 발송됩니다.");
	if(resetYn) {
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/system/account/resetpw'/>",
			data : {
				"adminId" : "${adminId}"
			},
			cache : false,
			async : true,
			success : function(data, textStatus, XMLHttpRequest) {
				if (hasErrorMap(data, true)) {
					return;
				}
				
				//console.log(data);
		    	if(data.error != null) {
					alert('비밀번호 재설정 중 오류가 발생하였습니다.\r\nERROR: '+data.error);
				} else if(data.resultCode == null) {
					alert('비밀번호 재설정 중 오류가 발생하였습니다.\r\nERROR: '+data.code);
				} else if(data.resultCode != '00000') {
					alert('비밀번호 재설정 중 오류가 발생하였습니다.\r\nERROR: '+data.resultMsg);
				} else {
					if(!alert("임시비밀번호로 재설정되었습니다.")) {
						$('#inputPassword').html('(임시 비밀번호 발급)');
					}
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if (hasErrorMap(xhr, false)) {
					return;
				}
			}
		});
	}
});

//필수입력값 및 형식확인
$('#inputId, #inputName, #inputEmpNum, #inputEmail, #inputPhone').on('input', function(){
	var id = $('#inputId').val();
	var name = $('#inputName').val();
	var email = $('#inputEmail').val();
	var phone = $('#inputPhone').val();
	var emailFormat = checkEmail(email);
	var phoneFormat = checkTelNum(phone);
	
	if(id!="" && name!="" && email!="" && phone!="" && emailFormat && phoneFormat) {
		$('#btnSave').attr('disabled', false);
	} else {
		$('#btnSave').attr('disabled', true);
	}
});

//저장
$('#btnSave').on('click', function(){
	var data = {};
	var disabled = true;
	
	$('.result').each(function(){
		if($(this).hasClass('text-danger')) {
			alert("입력한 내용을 다시 한번 확인해주세요.");
			$(this).prev().children('input').focus();
			disabled = false;
		}
	});
	
	if(disabled) {
		var mode;
		
		var saveYn = confirm("관리자 정보를 저장 하시겠습니까?");
		if(saveYn) {
			if("${adminId}" == null || "${adminId}" == "") {
				mode = "insert"; //등록
				data.adminId = $('#inputId').val();
			} else {
				mode = "update"; //수정
				data.adminId = '${adminId}';
			}

			data.adminName = $('#inputName').val();
			data.adminEmployeeNum = $('#inputEmpNum').val();
			data.adminAuthorityGroupSeq = $('#authGroupList').val();
			data.adminEmail = $('#inputEmail').val();
			data.adminTelephone = $('#inputPhone').val();
			
			//console.log(data);
			
			$.ajax({
				type : "POST",
				url : "<c:url value='/ui/service/system/account/save/'/>" + mode,
				data : data,
				cache : false,
				async : true,
				success : function(res, textStatus, XMLHttpRequest) {
					
					//console.log(res);
			    	if(res.error != null) {
						alert('저장 중 오류가 발생하였습니다.\r\nERROR: '+res.error[0]);
					} else if(res.resultCode == null) {
						alert('저장 중 오류가 발생하였습니다.\r\nERROR: '+res.code);
					} else if(res.resultCode != '00000') {
						alert('저장 중 오류가 발생하였습니다.\r\nERROR: '+res.resultMsg);
					} else {
						routie('list');
					}
				},
				error : function(xhr, ajaxOptions, thrownError) {
					if (hasErrorMap(xhr, false)) {
						return;
					}
				}
			});
		}
	}
});

//삭제
$('#btnDelete').on('click', function(){
	if(confirm("해당 관리자를 삭제하시겠습니까?")) {
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/system/account/delete'/>",
			data : {
				"adminId" : "${adminId}"
			},
			cache : false,
			async : true,
			success : function(data, textStatus, XMLHttpRequest) {
				if (hasErrorMap(data, true)) {
					return;
				}
				
				//console.log(data);
		    	if(data.error != null) {
					alert('계정 삭제 중 오류가 발생하였습니다.\r\nERROR: '+data.error);
				} else if(data.resultCode == null) {
					alert('계정 삭제 중 오류가 발생하였습니다.\r\nERROR: '+data.code);
				} else if(data.resultCode != '00000') {
					alert('계정 삭제 중 오류가 발생하였습니다.\r\nERROR: '+data.resultMsg);
				} else {
					routie('list');
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if (hasErrorMap(xhr, false)) {
					return;
				}
			}
		});
	}
});

//취소
$('#btnCancel').on('click', function(){
	if(confirm("작성하신 내용을 저장하지 않고 이전화면으로 돌아갑니다.")) {
		history.back();
	}
});

//아이디/사번/이메일/전화번호 중복조회
function checkAccount(mode, val, id) {
	var result;
	
	if(id.indexOf('Id') > -1) {
		id = "아이디";
	} else if(id.indexOf('Num') > -1) {
		id = "사번";
	} else if(id.indexOf('Email') > -1) {
		id = "이메일";
	} else if(id.indexOf('Phone') > -1) {
		id = "전화번호";
	}
	
	$.ajax({
	    type : "POST",
	    url : "<c:url value='/ui/service/system/account/check/'/>" + mode,
	    data : {
	    	"value" : val
	    },
	    cache : false,
	    async : false,
	    success : function(data, textStatus, XMLHttpRequest) {
			
	    	if(data.error != null) {
				alert(id+' 중복 조회 중 오류가 발생하였습니다.\r\nERROR: '+data.error);
			} else if(data.resultCode != '00000' && data.resultCode != '00003') {
				alert(id+' 중복 조회 중 오류가 발생하였습니다.\r\nERROR: '+data.resultMsg);
			} 

			result = data.resultCode; //00000 : 사용가능
	    },
	    error : function(xhr, ajaxOptions, thrownError) {
			if (hasErrorMap(xhr, false)) {
				return;
			}
	    }
	});
	
	return result;
}

//input 입력시 결과html 리턴
function resultHtml(tagId, res) {
	var typeTxt = "";
	switch(tagId) {
		case 'resultId':
			typeTxt = "아이디";
			break;
		case 'resultEmpNum':
			typeTxt = "사번";
			break;
		case 'resultEmail':
			typeTxt = "이메일";
			break;
		case 'resultPhone':
			typeTxt = "전화번호";
			break;
		default:
			break;
	}

	if(res != undefined) {
		// 00000 : 사용가능
 		res = res == '00000'? true : false;
		
		if(res) {
			return $('.'+tagId).html("사용 가능한 "+typeTxt+"입니다.").removeClass('text-danger').addClass('text-primary');
		} else {
			return $('.'+tagId).html("이미 사용중인 "+typeTxt+"입니다.").removeClass('text-primary').addClass('text-danger');
		}
	}
}

//한글입력방지, 소문자 변환처리
$("#inputId, #inputEmpNum").on("keyup", function(event) {
	if(!(event.keyCode >= 37 && event.keyCode <= 40)) {
		var inputId = $(this).val();
		$(this).val(inputId.replace(/[^a-z._@0-9^-]/gi,''));
	}
	
	if($(this).attr('id').indexOf('Id') > -1) {
	    $(this).val($(this).val().toLowerCase());
	}
});


	//마스킹해제
	$('#btnMasking').on('click', function(){
		$.ajax({
		    type : "POST",
		    url : "<c:url value='/ui/service/common/popup/reason.unmasking'/>",
		    data : {
		    	"maskingHistoryType" : "systemAccountInfo"
		    },
		    cache : false,
		    async : true,
		    beforeSend: function( xhr ) {
				$('#modal').empty();
			},
		    success : function(data, textStatus, XMLHttpRequest) {
				if (hasErrorMap(data, true)) {
					return;
				}
				
				$('#modal').html(data);
				$('#popupUnmaskingReason').modal('show');
		    },
		    error : function(xhr, ajaxOptions, thrownError) {
				if (hasErrorMap(xhr, false)) {
					return;
				}
		    }
		}); 
	});	
		
</script>
