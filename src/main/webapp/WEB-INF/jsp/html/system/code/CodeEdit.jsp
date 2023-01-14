<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="editCodePopup" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
                	<c:if test="${mode eq 'group' && empty vo.codeId}">코드그룹 추가</c:if>
                	<c:if test="${mode eq 'group' && !empty vo.codeId}">코드그룹 수정</c:if>
                	<c:if test="${mode eq 'code' && empty vo.codeId}">코드상세 추가</c:if>
                	<c:if test="${mode eq 'code' && !empty vo.codeId}">코드상세 수정</c:if>
               	</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
				<div class="table-responsive">
					<table class="table mb-0 basic-table">
						<colgroup>
							<col style="width: 25%;">
							<col style="width: auto;">
						</colgroup>
						<tbody>
							<!-- 코드그룹 추가/수정 -->
							<c:if test="${mode eq 'group'}">
								<tr>
									<th scope="row">코드그룹ID<span class="text-danger ml-1">*</span></th>
									<td class="groupId" data-group-id="${vo.codeId}">
										<c:if test="${empty vo.codeId}">
											<input type="text" id="groupId" class="form-control form-control-sm" placeholder="영문, 숫자 조합 입력">
										</c:if>
										<c:if test="${!empty vo.codeId}">
											${vo.codeId}
										</c:if>
									</td>
								</tr>
								<tr>
									<th scope="row">코드그룹명<span class="text-danger ml-1">*</span></th>
									<td><input type="text" id="groupName" class="form-control form-control-sm" value="${vo.codeName}"></td>
								</tr>
								<tr>
									<th scope="row">사용여부<span class="text-danger ml-1">*</span></th>
									<td>
										<div class="row">
											<div class="col-12">
												<div class="col-12 col-form-label text-left">
													<div class="form-check form-check-inline">
														<input type="radio" name="groupUseYn" class="form-check-input" value="Y" <c:if test="${vo.codeUseYn eq 'Y' || empty vo.codeId}">checked</c:if>>
														<label class="form-check-label">사용중(Y)</label>
													</div>
													<div class="form-check form-check-inline pl-2">
														<input type="radio" name="groupUseYn" class="form-check-input" value="N" <c:if test="${vo.codeUseYn eq 'N'}">checked</c:if>>
														<label class="form-check-label">사용중지(N)</label>
													</div>
													<h6 class="mb-0 mt-2">* 사용중지(N) : 그룹에 속한 모든 상세 코드 사용 불가</h6>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">비고</th>
									<td><input type="text" id="groupMemo" class="form-control form-control-sm" value="${vo.codeDescription}"></td>
								</tr>
							</c:if>
							<!-- 코드상세 추가/수정 -->
							<c:if test="${mode eq 'code'}">
								<tr>
									<th scope="row">코드그룹<span class="text-danger ml-1">*</span></th>
									<td>
										<select class="form-control form-control-sm" id="codeGroup">
											<option value="" disabled>(코드그룹 선택)</option>
											<c:forEach items="${result.systemCodeList}" var="list">
												<option value="${list.codeGroupId}"
													<c:if test="${mode eq 'code' and list.codeGroupId eq vo.codeGroupId}">
														 selected="selected"
													</c:if>
												>${list.codeGroupId} (${list.codeGroupName})</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row">코드ID<span class="text-danger ml-1">*</span></th>
									<td class="codeId" data-code-id="${vo.codeId}">
										<c:if test="${empty vo.codeId}">
											<input type="text" id="codeId" class="form-control form-control-sm" placeholder="영문, 숫자 조합 입력">
										</c:if>
										<c:if test="${!empty vo.codeId}">
											${vo.codeId}
										</c:if>
									</td>
								</tr>
								<tr>
									<th scope="row">코드명<span class="text-danger ml-1">*</span></th>
									<td><input type="text" id="codeName" class="form-control form-control-sm" value="${vo.codeName}"></td>
								</tr>
								<tr>
									<th scope="row">사용여부<span class="text-danger ml-1">*</span></th>
									<td>
										<div class="row">
											<div class="col-12">
												<div class="col-10 col-form-label text-left">
													<div class="form-check form-check-inline">
														<input type="radio" name="codeUseYn" class="form-check-input" value="Y" <c:if test="${codeUseYn eq 'Y' || empty vo.codeId}">checked</c:if>>
														<label class="form-check-label">사용중(Y)</label>
													</div>
													<div class="form-check form-check-inline pl-2">
														<input type="radio" name="codeUseYn" class="form-check-input" value="N" <c:if test="${codeUseYn eq 'N'}">checked</c:if>>
														<label class="form-check-label">사용중지(N)</label>
													</div>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">비고</th>
									<td><input type="text" id="codeMemo" class="form-control form-control-sm" value="${vo.codeDescription}"></td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
                <div class="button-list text-center mt-2">
                    <button type="button" class="btn btn-dark width-sm  btn-rounded waves-effect waves-dark" data-dismiss="modal">취소</button>
                    
                    <c:if test="${empty vo.codeId}">
                    	<%-- 추가  --%>
                    	<c:forEach items="${autUriList}" var="autUriList">
							<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'C') gt -1}">
		                    	<button type="button" class="btn btn-custom01 width-sm  btn-rounded waves-effect waves-dark" id="btnSave" <c:if test="${empty vo.codeId}">disabled</c:if>>저장</button>
	                    	</c:if>
                    	</c:forEach>
                    </c:if>
                    <c:if test="${!empty vo.codeId}">
                    	<%-- 추가  --%>
                    	<c:forEach items="${autUriList}" var="autUriList">
							<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'U') gt -1}">
		                    	<button type="button" class="btn btn-custom01 width-sm  btn-rounded waves-effect waves-dark" id="btnSave" <c:if test="${empty vo.codeId}">disabled</c:if>>저장</button>
	                    	</c:if>
                    	</c:forEach>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
var editType = "";

//저장
$('#btnSave').on('click', function(){
	
	if("${mode}" == 'group') {
		//코드그룹
		var groupId;
		if("${vo.codeId}" == null || "${vo.codeId}" == "") {
			groupId = $('#groupId').val();
		} else {
			groupId = $('.groupId').data('group-id');	
		}
		var groupName = $('#groupName').val();
		var groupUseYn = $('input:radio[name="groupUseYn"]:checked').val();
		var groupMemo = $('#groupMemo').val();
		
		//코드그룹ID 중복조회
		var groupBool = true;
		var groupSaveYn;
		
		if("${vo.codeId}" == null || "${vo.codeId}" == "") {
			editType = "insert";
			
			if(checkCode(groupId, "${mode}") != '00000') {
				groupBool = false;
			} else {
				groupSaveYn = confirm("새로운 코드그룹을 생성하시겠습니까?");
			}
		} else {
			editType = "update";
			groupSaveYn = confirm("수정사항을 적용하시겠습니까?");
		}
		
		if(groupBool && groupSaveYn) {
			data.codeId = groupId;
			data.codeName = groupName;
			data.codeUseYn = groupUseYn;
			data.codeDescription = groupMemo;
			
			saveCode(editType, data);
		}
		
	} else if("${mode}" == 'code') {
		//코드상세
		var codeId;
		if("${vo.codeId}" == null || "${vo.codeId}" == "") {
			codeId = $('#codeId').val();
		} else {
			codeId = $('.codeId').data('code-id');
		}
		var codeGroupId = $('#codeGroup').val();
		var codeName = $('#codeName').val();
		var codeUseYn = $('input:radio[name="codeUseYn"]:checked').val();
		var codeMemo = $('#codeMemo').val();
		
		//코드ID 중복조회
		var codeBool = true;
		var codeSaveYn;
		
		if("${vo.codeId}" == null || "${vo.codeId}" == "") {
			editType = "insert";
			
			if(checkCode(codeId, "${mode}") != '00000') {
				codeBool = false;
			} else {
				codeSaveYn = confirm("새로운 코드상세를 생성하시겠습니까?");
			}
		} else {
			editType = "update";
			codeSaveYn = confirm("수정사항을 적용하시겠습니까?");
		}

		if(codeBool && codeSaveYn) {
			// 저장
			data.codeGroupId = codeGroupId;
			data.codeId = codeId;
			data.codeName = codeName;
			data.codeUseYn = codeUseYn;
			data.codeDescription = codeMemo;
			
			saveCode(editType, data);
		}
	}
});

//저장
function saveCode(_type, data) {
	//console.log(_type);
	//console.log(data);
	
	$.ajax({
		type : "POST",
		url : "<c:url value='/ui/service/system/code/save/'/>" + _type,
		data : data,
		cache : false,
		async : true,
		success : function(res, textStatus, XMLHttpRequest) {
			if (hasErrorMap(res, true)) {
				return;
			}
			
			//console.log(res);
	    	if(res.error != null) {
				alert('저장 중 오류가 발생하였습니다.\r\nERROR: '+res.error);
			} else if(res.resultCode == null) {
				alert('저장 중 오류가 발생하였습니다.\r\nERROR: '+res.code);
			} else if(res.resultCode != '00000') {
				alert('저장 중 오류가 발생하였습니다.\r\nERROR: '+res.resultMsg);
			} else {
				location.reload();
			}
		},
		error : function(xhr, ajaxOptions, thrownError) {
			if (hasErrorMap(xhr, false)) {
				return;
			}
		}
	});
}

//코드ID 중복조회
function checkCode(id, mode) {
	var result;
	
	$.ajax({
	    type : "POST",
	    url : "<c:url value='/ui/service/system/code/check/'/>" + mode,
	    data : {
	    	"id" : id
	    },
	    cache : false,
	    async : false,
	    success : function(data, textStatus, XMLHttpRequest) {

	    	if(data.error != null) {
				alert('코드ID 중복 조회 중 오류가 발생하였습니다.\r\nERROR: '+data.error);
			} else if(data.resultCode != '00000' && data.resultCode != '00003') {
				alert('코드ID 중복 조회 중 오류가 발생하였습니다.\r\nERROR: '+data.resultMsg);
			} else if(data.resultCode == '00003') {
				alert('중복되는 ID가 있습니다.');
			}
	    	
			result = data.resultCode;
			//console.log(data);
	    },
	    error : function(xhr, ajaxOptions, thrownError) {
			if (hasErrorMap(xhr, false)) {
				return;
			}
	    }
	});
	
	return result;
}

//저장버튼 활성화
$('#groupId, #groupName, #codeId, #codeName').on('keyup', function(){
	if("${mode}" == 'group') {
		//코드그룹
		var groupId = $('#groupId').val();
		var groupName = $('#groupName').val();
		
		if(groupId == '' || groupName == '') {
			$('#btnSave').prop('disabled', true);
		} else {
			$('#btnSave').prop('disabled', false);
		}
	} else if("${mode}" == 'code') {
		//코드상세
		var codeGroup = $('#codeGroup').val();
		var codeId = $('#codeId').val();
		var codeName = $('#codeName').val();
		
		if(codeGroup == '' || codeId == '' || codeName == '') {
			$('#btnSave').prop('disabled', true);
		} else {
			$('#btnSave').prop('disabled', false);
		}
	}
});

//한글입력방지
$("#groupId, #codeId").on("keyup", function(event) {
	if(!(event.keyCode >= 37 && event.keyCode <= 40)) {
		var inputId = $(this).val();
		$(this).val(inputId.replace(/[^a-z._@0-9^-]/gi,''));
	}
});
</script>
