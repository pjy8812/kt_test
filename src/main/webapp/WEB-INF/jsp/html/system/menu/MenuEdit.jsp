<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="editMenuPopup" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
               	<c:if test="${empty data.menuCd}">메뉴 추가</c:if>
               	<c:if test="${!empty data.menuCd}">메뉴 수정</c:if>
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
							<!-- 메뉴 추가/수정 -->
								<tr>
									<th scope="row">메뉴코드<span class="text-danger ml-1">*</span></th>
									<td class="menuCd" data-menu-cd="${data.menuCd}">
										<c:if test="${empty data.menuCd}">
											<input type="text" id="menuCd" class="form-control form-control-sm" placeholder="영문, 숫자 조합 입력">
										</c:if>
										<c:if test="${!empty data.menuCd}">
											${data.menuCd}
										</c:if>
									</td>
								</tr>
								
								<tr>
									<th scope="row">상위메뉴코드</th>
									<td><input type="text" id="upMenuCd" class="form-control form-control-sm" value="${data.upMenuCd}"></td>
								</tr>
								
								<tr>
									<th scope="row">메뉴명<span class="text-danger ml-1">*</span></th>
									<td><input type="text" id="menuNm" class="form-control form-control-sm" value="${data.menuNm}"></td>
								</tr>
								
								<tr>
									<th scope="row">사용여부<span class="text-danger ml-1">*</span></th>
									<td>
										<div class="row">
											<div class="col-12">
												<div class="col-12 col-form-label text-left">
													<div class="form-check form-check-inline">
														<input type="radio" name="useYn" class="form-check-input" value="Y" <c:if test="${data.useYn eq 'Y' || empty data.menuCd}">checked</c:if>>
														<label class="form-check-label">사용중(Y)</label>
													</div>
													<div class="form-check form-check-inline pl-2">
														<input type="radio" name="useYn" class="form-check-input" value="N" <c:if test="${data.useYn eq 'N'}">checked</c:if>>
														<label class="form-check-label">사용중지(N)</label>
													</div>
												</div>
											</div>
										</div>
									</td>
								</tr>
								
								<tr>
									<th scope="row">순번<span class="text-danger ml-1">*</span></th>
									<td><input type="text" id="menuSort" class="form-control form-control-sm" value="${data.menuSort}"></td>
								</tr>
								
								<tr>
									<th scope="row">메뉴 URL<span class="text-danger ml-1">*</span></th>
									<td><input type="text" id="menuUrl" class="form-control form-control-sm" value="${data.menuUrl}"></td>
								</tr>
						</tbody>
					</table>
				</div>
                <div class="button-list text-center mt-2">
                    <button type="button" class="btn btn-dark width-sm  btn-rounded waves-effect waves-dark" data-dismiss="modal">취소</button>
                    
                    <c:if test="${empty data.menuCd}">
                    	<%-- 추가  --%>
                    	<c:forEach items="${autUriList}" var="autUriList">
							<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'C') gt -1}">
		                    	<button type="button" class="btn btn-custom01 width-sm  btn-rounded waves-effect waves-dark" id="btnSave" <c:if test="${empty data.menuCd}">disabled</c:if>>저장</button>
	                    	</c:if>
                    	</c:forEach>
                    </c:if>
                    <c:if test="${!empty data.menuCd}">
                    	<%-- 수정  --%>
                    	<c:forEach items="${autUriList}" var="autUriList">
							<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'U') gt -1}">
		                    	<button type="button" class="btn btn-custom01 width-sm  btn-rounded waves-effect waves-dark" id="btnUpdate" <c:if test="${empty data.menuCd}">disabled</c:if>>수정</button>
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

//저장/수정
$('#btnSave, #btnUpdate').on('click', function(el){
	var mode = el.currentTarget.id;
	
	// input 데이터 추출
	var data = {
			menuCd: '',
			upMenuCd: $('#upMenuCd').val(),
			menuNm: $('#menuNm').val(),
			useYn: $('input:radio[name=useYn]:checked').val(),
			menuSort: $('#menuSort').val(),
			menuUrl: $('#menuUrl').val()
	}
	
	// mode에 따른 호출 로직
	if (mode == 'btnSave') {
		data.menuCd = $('#menuCd').val();
		
		// 메뉴코드 중복체크
		var menuCdDupeBool = true;
		if (checkCode(data.menuCd) == '00000') {
			menuCdDupeBool = false;
		}
		
		// 메뉴코드 중복여부에 따른 저장 로직 호출
		if (!menuCdDupeBool) {
			// 저장 로직 호출
			saveMenu(data);
		}
	} else {
		data.menuCd = $('.menuCd').closest('td').data('menu-cd');
		// 수정
		updateMenu(data);
	}
	
});

//수정
function updateMenu(data) {
	$.ajax({
		type : "POST",
		url : "<c:url value='/ui/service/system/menu/update'/>",
		data : data,
		cache : false,
		async : true,
		success : function(res, textStatus, XMLHttpRequest) {
			if (hasErrorMap(res, true)) {
				return;
			}
			
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

//저장
function saveMenu(data) {
	
	$.ajax({
		type : "POST",
		url : "<c:url value='/ui/service/system/menu/save'/>",
		data : data,
		cache : false,
		async : true,
		success : function(res, textStatus, XMLHttpRequest) {
			if (hasErrorMap(res, true)) {
				return;
			}
			
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

// 코드 중복조회
function checkCode(cd) {
	var result;
	
	$.ajax({
	    type : "POST",
	    url : "<c:url value='/ui/service/system/menu/check'/>",
	    data : {
	    	"menuCd" : cd
	    },
	    cache : false,
	    async : false,
	    success : function(data, textStatus, XMLHttpRequest) {

	    	if(data.error != null) {
				alert('메뉴코드 중복 조회 중 오류가 발생하였습니다.\r\nERROR: '+data.error);
			} else if(data.resultCode != '00000' && data.resultCode != '00003') {
				alert('메뉴코드 중복 조회 중 오류가 발생하였습니다.\r\nERROR: '+data.resultMsg);
			} else if(data.resultCode == '00003') {
				alert('중복되는 메뉴코드가 있습니다.');
			}
	    	
			result = data.resultCode;
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
$('#menuCd, #menuNm, #useYn, #menuSort, #menuUrl').on('keyup', function(){
	var menuCd =  $('#menuCd').val();
	var menuNm = $('#menuNm').val();
	var useYn = $('#useYn').val();
	var menuSort = $('#menuSort').val();
	var menuUrl = $('#menuUrl').val();
	
	if (menuCd == '' || menuNm == '' || useYn == '' || menuSort == '' || menuUrl == '') {
		$('#btnSave').prop('disabled', true);
	} else {
		$('#btnSave').prop('disabled', false);
	}
});

//한글입력방지
$("#menuCd, #upMenuCd").on("keyup", function(event) {
	if(!(event.keyCode >= 37 && event.keyCode <= 40)) {
		var inputId = $(this).val();
		$(this).val(inputId.replace(/[^a-z._@0-9^-]/gi,''));
	}
});

</script>
