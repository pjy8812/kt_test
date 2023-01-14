<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- left side -->
<div class="card-box">
	<h5 class="card-title mb-0">메뉴리스트</h5>
	<div class="row">
		<div class="col-12 text-right">
			<c:forEach items="${autUriList}" var="autUriList">
				<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'C') gt -1}">
					<button type="button" class="btn btn-custom03 btn-rounded waves-effect waves-dark mr-2" id="addMenu">추가</button>
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
				<col style="width: 25%;">
				<col style="width: 25%;">
				<col style="width: 10%;">
				<col style="width: 10%;">
				<col style="width: 20%;">
				<col style="width: 10%;">
			</colgroup>
			<thead>
				<tr role="row">
					<th class="sorting">메뉴코드</th>
					<th class="sorting">상위메뉴코드</th>
					<th class="sorting">메뉴명</th>
					<th class="sorting">순번</th>
					<th class="sorting">메뉴 URL</th>
					<th class="sorting">수정</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty result.systemMenuList}">
               		<tr>
               			<th colspan="5">조회 결과가 없습니다.</th>
               		</tr>
				</c:if>
				<c:if test="${!empty result.systemMenuList}">
					<c:forEach items="${result.systemMenuList}" var="list" varStatus="status">
							<tr class="menuGroup"
							     data-menu-cd="${list.menuCd}"
							     data-up-menu-cd="${list.upMenuCd}"
							     data-menu-nm="${list.menuNm}"
								 data-use-yn="${list.useYn}"
								 data-menu-sort="${list.menuSort}"
								 data-menu-url="${list.menuUrl}"
								 data-cre-id="${list.creId}"
								 data-cre-date="${list.creDate}"
								 data-mod-id="${list.modId}"
								 data-mod-date="${list.modDate}"
								 >
								<td>${list.menuCd}</td>
								<td>${list.upMenuCd}</td>
								<td>${list.menuNm}</td>
								<td>${list.menuSort}</td>
								<td>${list.menuUrl}</td>
								<td><i class="fe-settings updateMenu" style="cursor:pointer;"></i></td>
							</tr>
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

//메뉴 선택(CSS)
$('.menuGroup').on('click', function(){
	
	//선택된 열 강조
	$(this).addClass('select');
	$(this).siblings('tr').removeClass('select');
});

//코드그룹 추가/수정
$('#addMenu, .updateMenu').on('click', function(){
	
	var closest = $(this).closest('tr');
	var voData = {
			menuCd: closest.data('menu-cd'),
			upMenuCd: closest.data('up-menu-cd'),
			menuNm: closest.data('menu-nm'),
			useYn: closest.data('use-yn'),
			menuSort: closest.data('menu-sort'),
			menuUrl: closest.data('menu-url'),
			creId: closest.data('cre-id'),
			creDate: closest.data('cre-date'),
			modId: closest.data('mod-id'),
			modDate: closest.data('mod-date')
			};
	
	$.ajax({
	    type : "POST",
	    url : "<c:url value='/ui/service/system/menu/edit'/>",
	    data : voData,
	    cache : false,
	    async : true,
	    success : function(data, textStatus, XMLHttpRequest) {
			if (hasErrorMap(data, true)) {
				return;
			}
			
			$('#popup_editCode').html(data);
			$('#editMenuPopup').modal('show');
	    },
	    error : function(xhr, ajaxOptions, thrownError) {
			if (hasErrorMap(xhr, false)) {
				return;
			}
	    }
	}); 	
});
</script>
