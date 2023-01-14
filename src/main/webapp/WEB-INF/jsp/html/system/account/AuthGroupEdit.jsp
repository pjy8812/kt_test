<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	pageContext.setAttribute("CRUD_CODE", "<td><input type=\"checkbox\" value=\"R\"></td><td><input type=\"checkbox\" value=\"C\"></td><td><input type=\"checkbox\" value=\"U\"></td><td><input type=\"checkbox\" value=\"D\"></td>"); 
%>

<div id="editGroupPopup" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" data-auth-group-seq="${result.adminAuthorityGroupSeq}">
    <div class="modal-dialog modal-dialog-centered modal-lg modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
                	<c:if test="${empty groupSeq}">그룹 생성</c:if>
                	<c:if test="${!empty groupSeq}">그룹 수정</c:if>
                </h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
                <div class="card-box pt-0">
					<div class="table-responsive">
						<table class="table mb-0 basic-table">
							<colgroup>
								<col style="width: 20%;">
								<col style="width: 40%;">
								<col style="width: auto;">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">그룹명<span class="text-danger ml-1">*</span></th>
									<td><input type="text" id="inputGroupName" class="form-control form-control-sm" value="${result.authGroupName}"></td>
									<td class="result resultGroupName"></td>
								</tr>
								<tr>
									<th scope="row">그룹코드<span class="text-danger ml-1">*</span></th>
									<td><input type="text" id="inputGroupCode" class="form-control form-control-sm" value="${result.authGroupCode}" <c:if test="${!empty groupSeq}">disabled</c:if>></td>
									<td class="result resultGroupCode"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
                <div class="card-box mb-0">
                    <div class="row">
                        <div class="col-12">
                            <div class="table-responsive">
                                <table class="table dt-responsive nowrap dataTable no-footer dtr-inline text-center" role="grid">
                                    <thead>
                                        <tr role="row">
                                            <th class="sorting">Depth1</th>
                                            <th class="sorting">Depth2</th>
                                            <th class="sorting">보기</th>
                                            <th class="sorting">생성</th>
                                            <th class="sorting">수정</th>
                                            <th class="sorting">삭제</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<!-- 그룹 수정 -->
                                    	<c:forEach items="${result.List}" var="list">
	                                        <tr role="row" class="auth" data-depth="${list.depth}" data-1depth-name="${list.authorityDepth1}"
	                                        	data-depth-name="<c:if test="${list.depth eq '1'}">${list.authorityDepth1}</c:if><c:if test="${list.depth eq '2'}">${list.authorityDepth2}</c:if>">
	                                            <td><c:if test="${list.depth eq '1'}">${list.authorityDepth1}</c:if></td>
	                                            <td><c:if test="${list.depth eq '2'}">${list.authorityDepth2}</c:if></td>
	                                            <td><input type="checkbox" value="R" data-check-yn="${list.authorityR}" <c:if test="${list.authorityR eq 'Y'}">checked</c:if>></td>
	                                            <td><input type="checkbox" value="C" data-check-yn="${list.authorityC}" <c:if test="${list.authorityC eq 'Y'}">checked</c:if>></td>
	                                            <td><input type="checkbox" value="U" data-check-yn="${list.authorityU}" <c:if test="${list.authorityU eq 'Y'}">checked</c:if>></td>
	                                            <td><input type="checkbox" value="D" data-check-yn="${list.authorityD}" <c:if test="${list.authorityD eq 'Y'}">checked</c:if>></td>
	                                        </tr>
                                    	</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="button-list text-right">
                        <button type="button" class="btn btn-dark width-sm  btn-rounded waves-effect waves-dark" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-dark width-sm  btn-rounded waves-effect waves-dark" id="btnReset">초기화</button>
                        <c:if test="${empty groupSeq}">
	                        <c:forEach items="${autUriList}" var="autUriList">
								<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'C') gt -1}">
									<%-- 그룹 생성 --%>
	                        		<button type="button" class="btn btn-custom01 width-sm  btn-rounded waves-effect waves-dark" id="btnGroupSave" <c:if test="${empty groupSeq}">disabled</c:if>>저장</button>
	                    		</c:if>
	                    	</c:forEach>
                    	</c:if>
                        <c:if test="${!empty groupSeq}">
	                        <c:forEach items="${autUriList}" var="autUriList">
								<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'U') gt -1}">
									<%-- 그룹 수정 --%>
	                        		<button type="button" class="btn btn-custom01 width-sm  btn-rounded waves-effect waves-dark" id="btnGroupSave" <c:if test="${empty groupSeq}">disabled</c:if>>저장</button>
	                    		</c:if>
	                    	</c:forEach>
                    	</c:if>
                    </div>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<script>
$(document).ready(function(){
	<c:if test="${not empty groupSeq}">
		<c:if test="${empty result.resultCode}">
			alert('권한그룹 상세 조회 중 오류가 발생하였습니다.\r\nERROR: ${result}')
		</c:if>
		<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
			alert('권한그룹 상세 조회 중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}')
		</c:if>
	</c:if>
});

//그룹명 입력
$('#inputGroupName').on('change', function(){
	resultHtml('resultGroupName', checkAuthGroup('authorityGroupName', $(this).val(), $(this).attr('id')));
});

//그룹코드 입력
$('#inputGroupCode').on('change', function(){
	resultHtml('resultGroupCode', checkAuthGroup('authorityGroupCode', $(this).val(), $(this).attr('id')));
});

//저장버튼 활성화/비활성화
$('#inputGroupName, #inputGroupCode').on('change', function(){
	var name = $('#inputGroupName').val();
	var code = $('#inputGroupCode').val();
	var resName = $('#inputGroupName').parent().next().hasClass('text-primary');
	var resCode = $('#inputGroupCode').parent().next().hasClass('text-primary');
	
	if("${groupSeq}" == null || "${groupSeq}" == "") {
		//그룹 생성
		if(name!="" && code!="" && resName && resCode) {
			$('#btnGroupSave').attr('disabled', false);
		} else {
			$('#btnGroupSave').attr('disabled', true);
		}
	} else {
		//그룹 수정
		if(name!="" && resName) {
			$('#btnGroupSave').attr('disabled', false);
		} else {
			$('#btnGroupSave').attr('disabled', true);
		}
	}
});

//권한체크 스크립트처리
$('input:checkbox').on('change', function(){
	updateGroupCheckAuth($(this).val(), this);
/* 	if("${groupSeq}" == null || "${groupSeq}" == "") {
		//그룹생성
		insertGroupCheckAuth($(this).val(), this);
	} else {
		//그룹수정
		updateGroupCheckAuth($(this).val(), this);
	} */
});

//권한체크 스크립트처리 - 그룹생성
function insertGroupCheckAuth(auth, el) {
	var className = $(el).closest('tr').attr('class').replace('auth ','');
	
	if($(el).closest('tr').data('depth') == '1') {
		//depth1 체크여부에 따른 depth2 전체선택/선택해제
		$('.'+className).each(function(idx){
			if(idx == 0) {
				if($(this).find('input:checkbox[value="'+auth+'"]').is(':checked')) {
					$('.'+className).find('input:checkbox[value="'+auth+'"]').prop('checked', true);
				} else {
					$('.'+className).find('input:checkbox[value="'+auth+'"]').prop('checked', false);
				}
			}
		});
	} else {
		//depth2 모두 체크되면 depth1 체크
		//depth2 하나라도 해제되면 depth1 해제
		var cLength = $('.'+className).find('input:checkbox[value="'+auth+'"]').length;
		var cAuthCnt = 0;

		$('.'+className).find('input:checkbox[value="'+auth+'"]').each(function(idx){
			if($(this).closest('tr').data('depth') == '2' && $(this).is(':checked')) {
				cAuthCnt++;
			}
		});
		
		if(cLength-1 == cAuthCnt) {
			$('.'+className).eq(0).find('input:checkbox[value="'+auth+'"]').prop('checked', true);
		} else {
			$('.'+className).eq(0).find('input:checkbox[value="'+auth+'"]').prop('checked', false);
		}
	}
}

//권한체크 스크립트처리 - 그룹수정
function updateGroupCheckAuth(auth, el) {
	var depthName = $(el).closest('tr').data('1depth-name');
	
	if($(el).closest('tr').data('depth') == '1') {
		//depth1 체크여부에 따른 depth2 전체선택/선택해제
		$('tr[data-1depth-name="'+depthName+'"]').each(function(idx){
			if(idx == 0) {
				if($(this).find('input:checkbox[value="'+auth+'"]').is(':checked')) {
					$('tr[data-1depth-name="'+depthName+'"]').find('input:checkbox[value="'+auth+'"]').prop('checked', true);
				} else {
					$('tr[data-1depth-name="'+depthName+'"]').find('input:checkbox[value="'+auth+'"]').prop('checked', false);
				}
			}
		});
	} else {
		//depth2 모두 체크되면 depth1 체크
		//depth2 하나라도 해제되면 depth1 해제
		var uLength = $('tr[data-1depth-name="'+depthName+'"]').find('input:checkbox[value="'+auth+'"]').length;
		var uAuthCnt = 0;

		$('tr[data-1depth-name="'+depthName+'"]').find('input:checkbox[value="'+auth+'"]').each(function(idx){
			if($(this).closest('tr').data('depth') == '2' && $(this).is(':checked')) {
				uAuthCnt++;
			}
		});
		
		if(uLength-1 == uAuthCnt) {
			$('tr[data-1depth-name="'+depthName+'"]').eq(0).find('input:checkbox[value="'+auth+'"]').prop('checked', true);
		} else {
			$('tr[data-1depth-name="'+depthName+'"]').eq(0).find('input:checkbox[value="'+auth+'"]').prop('checked', false);
		}
	}
}

//초기화
$('#btnReset').on('click', function(){
	if(confirm('권한 설정을 초기화 하시겠습니까?')) {
		if("${groupSeq}" == null || "${groupSeq}" == "") {
			//생성인 경우 입력값 전체 초기화
			$('#inputGroupName, #inputGroupCode').val('');
			$('.resultGroupName, .resultGroupCode').html('');
			$('input:checkbox').prop('checked', false);
		} else {
			//수정인 경우 기존값 체크 & 신규값 초기화
			$('#inputGroupName').val("${result.authGroupName}");
			$('.resultGroupName').html('');
			
			$('input:checkbox').each(function(){
				if($(this).data('check-yn') == 'Y') {
					$(this).prop('checked', true);
				} else {
					$(this).prop('checked', false);
				}
			});
		}
	}
});

//저장
$('#btnGroupSave').on('click', function(){
	var mode;
	var data = {};
	var permission = [];
	var depth1;
	var depth2;
	
	//권한처리
	$('tr.auth').each(function(){
		var arr = [];

		var authCheck = $(this).find('input:checkbox');
		for(var i=0; i<authCheck.length; i++) {
			if(authCheck[i].checked) {
				arr.push(authCheck[i].value);
			}
		}
		
		if($(this).data('depth') == '1') {
			depth1 = $(this).data('depth-name');
			permission.push({systemMgme: arr, depth1: depth1, depth2: ""});
		} else {
			if("${groupSeq}" == null || "${groupSeq}" == "") {
				//그룹생성
				var className = $(this).attr('class').replace('auth ','');
				depth1 = $(this).data('1depth-name');
				
				mode = "insert";
			} else {
				//그룹수정
				depth1 = $(this).data('1depth-name');
				
				mode = "update";
				data.adminAuthorityGroupSeq = "${groupSeq}";
			}
			
			depth2 = $(this).data('depth-name');
			permission.push({systemMgme: arr, depth1: depth1, depth2: depth2});
		}
	});
	
	if(confirm('권한 설정을 저장 하시겠습니까?')) {
		data.authGroupName = $('#inputGroupName').val();
		data.authGroupCode = $('#inputGroupCode').val();

		//console.log(permission);
		data.JSONdata = JSON.stringify(permission);
		
		//console.log(data);
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/system/account/group/save/'/>" + mode,
			data : data,
			cache : false,
			async : true,
			traditional: true,
			success : function(res, textStatus, XMLHttpRequest) {
				//console.log(res);
				
		    	if(res.error != null) {
					alert('권한설정 저장 중 오류가 발생하였습니다.\r\nERROR: '+res.error);
				} else if(res.resultCode == null) {
					alert('권한설정 저장 중 오류가 발생하였습니다.\r\nERROR: '+res.code);
				} else if(res.resultCode != '00000') {
					alert('권한설정 저장 중 오류가 발생하였습니다.\r\nERROR: '+res.resultMsg);
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
});

//그룹명/그룹코드 중복조회
function checkAuthGroup(mode, val, id) {
	var result;
	
	if(id.indexOf('Name') > -1) {
		id = "그룹명";
	} else {
		id = "그룹코드";
	}
	
	$.ajax({
	    type : "POST",
	    url : "<c:url value='/ui/service/system/account/group/check/'/>" + mode,
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
	    	
			result = data.msg; //true : 중복
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

//input 입력시 결과html 리턴
function resultHtml(tagId, res) {
	var typeTxt = "";
	switch(tagId) {
		case 'resultGroupName':
			typeTxt = "그룹명";
			break;
		case 'resultGroupCode':
			typeTxt = "그룹코드";
			break;
		default:
			break;
	}
	
	if(res != undefined) {
		// true : 중복
		if(res == 'true') {
			return $('.'+tagId).html("이미 사용중인 "+typeTxt+"입니다.").removeClass('text-primary').addClass('text-danger');
		} else {
			return $('.'+tagId).html("사용 가능한 "+typeTxt+"입니다.").removeClass('text-danger').addClass('text-primary');
		}
	}
}
</script>
