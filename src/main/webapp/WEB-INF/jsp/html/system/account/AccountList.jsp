<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Begin result -->
<div class="card-box">
	<h5 class="card-title mb-0">
		조회결과 (총 
		<c:choose>
			<c:when test="${empty result.listCount}">0</c:when>
			<c:otherwise><fmt:formatNumber value="${result.listCount}" pattern="#,###"/></c:otherwise>
		</c:choose>
		건)
	</h5>
    <div class="row mb-2">
        <div class="col-12 text-right">
        	<c:forEach items="${autUriList}" var="autUriList">
				<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'C') gt -1}">
	        		<button type="button" class="btn btn-custom03 btn-rounded waves-effect waves-dark" id="addUser">관리자 추가</button>
	        		<button type="button" class="btn btn-custom03 btn-rounded waves-effect waves-dark ml-1" id="excelUpload">엑셀로 관리자 추가</button>
            	</c:if>
            </c:forEach>
        </div>
    </div>
	<div class="row">
		<div class="col-12">
			<div class="scroll-table-wrap">
				<div class="scroll-table-box">
					<table class="table dt-responsive nowrap dataTable no-footer dtr-inline text-center" role="grid">
						<colgroup>
							<col/>
							<col style="width: 10%;">
							<col style="width: 10%;">
							<col style="width: 10%;">
							<col style="width: 10%;">
							<col style="width: 20%;">
							<col style="width: 15%;">
							<col style="width: 20%;">
						</colgroup>
						<thead>
							<tr role="row">
								<th class="sorting_asc">No</th>
								<th class="sorting">이용자 ID</th>
								<th class="sorting">이용자명</th>
								<th class="sorting">사번</th>
								<th class="sorting">권한그룹</th>
								<th class="sorting">이메일</th>
								<th class="sorting">전화번호</th>
								<th class="sorting">생성일</th>
							</tr>
						</thead>
						<tbody>
		                   	<c:if test="${empty result.list}">
		                  		<tr>
		                  			<th colspan="8">조회 결과가 없습니다.</th>
		                  		</tr>
		                  	</c:if>
		                  	<c:set var="idx" value="${result.paginationVO.sizeOfData - (result.paginationVO.pageIndex-1) * result.paginationVO.pageSize}"/> 
		                  	<c:if test="${!empty result.list}">
		                  		<c:forEach items="${result.list}" var="list">
									<tr role="row" class="">
										<td>
											${idx}
											<c:set var="idx" value="${idx-1}"/>
										</td>
										<td>${list.adminId}</td> <!-- 이용자ID -->
										<td><a class="title-link username" data-admin-id="${list.adminOriginalId}">${list.adminName}</a></td> <!-- 이용자명 -->
										<td>${list.adminEmployeeNum}</td> <!-- 사번 -->
										<td>${list.adminAuthorityGroupName}</td> <!-- 권한그룹 -->
										<td>${list.adminEmail}</td> <!-- 이메일 -->
										<td>${list.adminTelephone}</td> <!-- 전화번호 -->
										<td><fmt:formatDate value="${list.adminRegisterDate}" pattern="yyyy.MM.dd HH:mm:ss"/></td> <!-- 생성일 -->
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
			${result.pagination}
		</div>
	</div>
</div>


<script>
$(document).ready(function(){
	<c:if test="${empty result.resultCode}">
		alert('계정 목록 조회 중 오류가 발생하였습니다.\r\nERROR: ${result}')
	</c:if>
	<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
		alert('계정 목록 조회 중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}')
	</c:if>
});


//관리자추가
$('#addUser').on('click', function(){
	var cntAuthGroup = $('#searchAuthGroup option').length-1;
	if(cntAuthGroup == 0) {
		alert("권한 그룹이 없습니다. 권한 그룹 설정에서 그룹을 먼저 생성하세요.");
	} else {
		routie("edit");
	}
});

//엑셀로 관리자 추가 팝업
$('#excelUpload').on('click', function(){
	var cntAuthGroup = $('#searchAuthGroup option').length-1;
	if(cntAuthGroup == 0) {
		alert("권한 그룹이 없습니다. 권한 그룹 설정에서 그룹을 먼저 생성하세요.");
	} else {
		$.ajax({
		    type : "POST",
		    url : "<c:url value='/ui/service/system/account/excel/upload.popup'/>",
		    data : null,
		    cache : false,
		    async : true,
		    success : function(data, textStatus, XMLHttpRequest) {
				if (hasErrorMap(data, true)) {
					return;
				}
				
				$('#popup_accountListUpload').html(data);
				$('#excelUploadPopup').modal('show');
		    },
		    error : function(xhr, ajaxOptions, thrownError) {
				if (hasErrorMap(xhr, false)) {
					return;
				}
		    }
		});
	}
});

//관리자 상세
$('.username').on('click', function(){
	var adminId = $(this).data('admin-id');
	routie("edit/"+adminId);
});

//페이지네이션
$('ul.pagination li').on('click', function() {
	data.pageIndex = $(this).data('page-index');
	searchList();
});
</script>