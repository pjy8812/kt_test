<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="isCreate" value="false"/>
<c:forEach items="${autUriList}" var="autUriList">
	<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'C') gt -1}"><c:set var="isCreate" value="true"/></c:if>
</c:forEach>
<div class="row mb-2">
	<div class="col-6">
		<h5 class="card-title">
			조회결과 (총 
			 <c:choose>
				<c:when test="${empty result.listCount}">0</c:when>
				<c:otherwise><fmt:formatNumber value="${result.listCount}" pattern="#,###"/></c:otherwise>
			</c:choose> 
			건)
		</h5>
	</div>
	<div class="col-6 text-right">
		<c:if test="${isCreate}">
			<button type="button" id="btnPopupRequester" class="btn btn-custom01 btn-rounded waves-effect waves-dark">요청자추가</button>
		</c:if>
	</div>
</div>
<div class="row table-location">
	<div class="col-12">
		<div class="scroll-table-wrap">
			<div class="scroll-table-box">
				<table class="table dt-responsive nowrap dataTable no-footer dtr-inline text-center" role="grid">
					<colgroup>
						<col/>
						<col/>
						<col/>
						<col/>
						<col width="30%"/>
						<col/>
					</colgroup>
					<thead>
						<tr role="row">
							<th class="sorting_asc">요청자ID</th>
							<th class="sorting">요청자명</th>
							<th class="sorting">열람대상</th>
							<th class="sorting">열람정보</th>
							<th class="sorting">취득경로</th>
							<th class="sorting">열람일시</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty result.list}">
						 	<tr>
								<td colspan="6">조회 결과가 없습니다.</td>
							</tr> 
						</c:if>
						<c:forEach var="row" items="${result.list}"> 
							<tr role="row">
								<td>${row.carOwnerId}</td>
								<td>${row.carOwnerName}</td>
								<td>${row.carOwnerName}</td>
								<td>${row.information}</td>
								<td>${row.location}</td>
								<td>
									<fmt:formatDate value="${row.createDateByLongType}" pattern="yyyy.MM.dd HH:mm"/> 
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		${result.pagination}
	</div>
</div>
<script>
	<c:if test="${empty result.resultCode}">
		//alert("1:1문의 목록 조회중 오류가 발생하였습니다.\r\nERROR: ${result}');
	</c:if>
	<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
		//alert("1:1문의 목록 조회중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}");
	</c:if>
	
	//페이지네이션 
	$('.searchList .table-location ul.pagination li').on('click touch', function() {
		locationData.nowPage = $(this).data('page-index');
		searchLocationList();
	})
	
	
	$('#btnPopupRequester').on('click', function(){
		showRequesterPopup();
	});
</script>