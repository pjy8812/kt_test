<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- right side -->
<div class="card-box">
	<h5 class="card-title mb-0">코드상세</h5>
	<div class="row">
		<div class="col-12 text-right">
			<c:forEach items="${autUriList}" var="autUriList">
				<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'C') gt -1}">
					<button type="button" class="btn btn-custom03 btn-rounded waves-effect waves-dark mr-2" 
						data-code-group-id="${vo.codeGroupId}"
						id="addCode">추가</button>
				</c:if>
			</c:forEach>
		</div>
		<div class="col-6">
			<h6 class="card-title mb-1">코드그룹&nbsp;&nbsp;&nbsp;${vo.codeGroupId}<c:if test="${!empty vo.codeName}">(${vo.codeName})</c:if></h6>
		</div>
	</div>
	<div class="table-responsive">
		<table class="table mb-0 basic-table text-center">
			<colgroup>
				<col style="width: 35%;">
				<col style="width: 35%;">
				<col style="width: 20%;">
				<col style="width: 10%;">
			</colgroup>
			<thead>
				<tr role="row">
					<th class="sorting">코드ID</th>
					<th class="sorting">코드명</th>
					<th class="sorting">사용여부</th>
					<th class="sorting">수정</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty result.codeList}">
               		<tr>
               			<th colspan="5">조회 결과가 없습니다.</th>
               		</tr>
				</c:if>
				<c:if test="${!empty result.codeList}">
					<c:forEach items="${result.codeList}" var="list" varStatus="status">
						<tr data-code-group-id="${list.codeGroupId}" data-code-id="${list.codeId}" data-code-name="${list.codeName}"
								data-code-use-yn="${list.codeUseYn}" data-code-des="${list.codeDescription}">
							<td>${list.codeId}</td>
							<td>${list.codeName}</td>
							<td>${list.codeUseYn}</td>
							<td>
								<c:forEach items="${autUriList}" var="autUriList">
									<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'U') gt -1}">
										<i class="fe-settings updateCode" style="cursor:pointer;"></i>
									</c:if>
								</c:forEach>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
</div>

<script>

//코드상세 추가/수정
$('#addCode, .updateCode').on('click', function(){

	var dataEl = null;
	
	if($(this).hasClass('updateCode')) {
		// .updateCode
		dataEl = $(this).closest('tr');
	} else {
		// #addCode
		dataEl = $(this);
	}
	
	var codeGroupId = $(dataEl).data('code-group-id');
	var codeId = $(dataEl).data('code-id');
	var codeName = $(dataEl).data('code-name');
	var codeUseYn = $(dataEl).data('code-use-yn');
	var codeDescription = $(dataEl).data('code-des');
	
	/* console.log(codeGroupId);
	console.log(codeId);
	console.log(codeName);
	console.log(codeUseYn);
	console.log(codeDescription); */
	
	$.ajax({
	    type : "POST",
	    url : "<c:url value='/ui/service/system/code/edit/code'/>",
	    data : {
	    	"codeGroupId" : codeGroupId,
	    	"codeId" : codeId,
	    	"codeName" : codeName,
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
