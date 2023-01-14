<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- left side -->
<div class="card-box">
	<h5 class="card-title mb-0">코드그룹</h5>
	<div class="row">
		<div class="col-12 text-right">
			<c:forEach items="${autUriList}" var="autUriList">
				<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'C') gt -1}">
					<button type="button" class="btn btn-custom03 btn-rounded waves-effect waves-dark mr-2" id="addCodeGroup">추가</button>
				</c:if>
			</c:forEach>
		</div>
		<div class="col-6">
			<h6 class="card-title mb-1" style="color:white;">-</h6>
		</div>
	</div>
	<div class="table-responsive">
		<table class="table mb-0 basic-table text-center">
			<colgroup>
				<col style="width: 30%;">
				<col style="width: 30%;">
				<col style="width: 15%;">
				<col style="width: 15%;">
				<col style="width: 10%;">
			</colgroup>
			<thead>
				<tr role="row">
					<th class="sorting">코드그룹ID</th>
					<th class="sorting">코드그룹명</th>
					<th class="sorting">코드 수</th>
					<th class="sorting">사용여부</th>
					<th class="sorting">수정</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty result.systemCodeList}">
               		<tr>
               			<th colspan="5">조회 결과가 없습니다.</th>
               		</tr>
				</c:if>
				<c:if test="${!empty result.systemCodeList}">
					<c:forEach items="${result.systemCodeList}" var="list" varStatus="status">
						<c:if test="${vo.searchText eq '' || (vo.searchText ne '' && !empty list.codeGroupCount && list.codeGroupCount > 0)}">
							<tr class="codeGroup" data-code-group-id="${list.codeGroupId}" data-code-group-name="${list.codeGroupName}"
									 data-code-use-yn="${list.codeGroupUseYn}" data-code-des="${list.codeGroupDescription}">
								<td>${list.codeGroupId}</td>
								<td>${list.codeGroupName}</td>
								<td>${list.codeGroupCount}</td>
								<td>${list.codeGroupUseYn}</td>
								<td>
									<c:forEach items="${autUriList}" var="autUriList">
										<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'U') gt -1}">
											<i class="fe-settings updateCodeGroup" style="cursor:pointer;"></i>
										</c:if>
									</c:forEach>
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
</div>


<script>
var param = {};

$(document).ready(function(){
	<c:if test="${empty result.resultCode}">
		alert('코드그룹 목록 조회 중 오류가 발생하였습니다.\r\nERROR: ${result}')
	</c:if>
	<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
		alert('코드그룹 목록 조회 중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}')
	</c:if>
});

//코드그룹 선택
$('.codeGroup').on('click', function(){
	//토드그룹 선택시 화면 상단으로 이동
	$(window).scrollTop(0);
	
	//선택된 열 강조
	$(this).addClass('select');
	$(this).siblings('tr').removeClass('select');
	
	if($('input:checkbox[name=useYn]:checked').length == $('input:checkbox[name=useYn]').length) {
		param.codeUseYn = "all";
	} else {
		param.codeUseYn = $('[name="useYn"]:checked').val();
	}
	param.searchType = 'codeGroupId';
	param.searchText = $(this).data('code-group-id');
	
	param.codeGroupId = $(this).data('code-group-id');
	param.codeName = $(this).data('code-group-name');

	var queryString = encodeURIComponent(JSON.stringify(param));
	routie('detail/'+queryString);
});

//코드그룹 추가/수정
$('#addCodeGroup, .updateCodeGroup').on('click', function(){
	
	var codeGroupId = $(this).closest('tr').data('code-group-id');
	var codeGroupName = $(this).closest('tr').data('code-group-name');
	var codeUseYn = $(this).closest('tr').data('code-use-yn');
	var codeDescription = $(this).closest('tr').data('code-des');
	
	$.ajax({
	    type : "POST",
	    url : "<c:url value='/ui/service/system/code/edit/group'/>",
	    data : {
	    	"codeId" : codeGroupId,
	    	"codeName" : codeGroupName,
	    	"codeUseYn" : codeUseYn,
	    	"codeDescription" : codeDescription
	    },
	    cache : false,
	    async : true,
	    success : function(data, textStatus, XMLHttpRequest) {
			if (hasErrorMap(data, true)) {
				return;
			}
			
			$('#popup_editCode').html(data);
			$('#editCodePopup').modal('show');
	    },
	    error : function(xhr, ajaxOptions, thrownError) {
			if (hasErrorMap(xhr, false)) {
				return;
			}
	    }
	}); 	
});
</script>
