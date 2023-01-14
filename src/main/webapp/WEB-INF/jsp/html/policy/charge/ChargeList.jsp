<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="isCreate" value="false"/>
<c:forEach items="${autUriList}" var="autUriList">
	<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'C') gt -1}"><c:set var="isCreate" value="true"/></c:if>
</c:forEach>
<div class="card-box">
	<div class="row mb-2">
		<div class="col-6">
			<h5 class="card-title">
				조회결과 (총 
				<c:choose>
					<c:when test="${empty result.paginationVO.sizeOfData}">0</c:when>
					<c:otherwise><fmt:formatNumber value="${result.paginationVO.sizeOfData}" pattern="#,###"/></c:otherwise>
				</c:choose>
				건)
			</h5>
		</div>
		<div class="col text-right">
			<div class="row justify-content-end">
				<div class="col-3">
					<select class="form-control" id="pagePerRows">
						<option value="10" <c:if test="${vo.pagePerRows eq '10'}">selected</c:if>>10개씩 보기</option>
						<option value="20" <c:if test="${vo.pagePerRows eq '20'}">selected</c:if>>20개씩 보기</option>
						<option value="50" <c:if test="${vo.pagePerRows eq '50'}">selected</c:if>>50개씩 보기</option>
					</select>
				</div>
				<div>
					<c:if test="${isCreate}">
						<button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark" id="addChargePolicy">신규정책 등록</button>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<div class="scroll-table-wrap">
				<div class="scroll-table-box">
					<table class="table dt-responsive nowrap dataTable no-footer dtr-inline text-center" role="grid">
						<colgroup>
							<col style="width: 5%;">
							<col style="width: auto;">
							<col style="width: 10%;">
							<col style="width: 10%;">
							<col style="width: 20%;">
							<col style="width: 15%;">
							<col style="width: 15%;">
						</colgroup>
						<thead>
							<tr role="row">
								<th class="sorting_asc">No</th>
								<th class="sorting">요금제명</th>
								<th class="sorting">기본요금제여부</th>
								<th class="sorting">사용여부</th>
								<th class="sorting">적용기간</th>
								<th class="sorting">수정자</th>
								<th class="sorting">수정일</th>
							</tr>
						</thead>
						<tbody>
		                   	<c:if test="${empty result.list}">
		                   		<tr>
		                   			<th colspan="7">조회 결과가 없습니다.</th>
		                   		</tr>
		                   	</c:if>
							<c:set value="${result.paginationVO.sizeOfData - (result.paginationVO.pageIndex-1) * result.paginationVO.pageSize}" var="idx"/>
							<c:forEach var="row" items="${result.list}" >
								<tr role="row" data-charge_idx="${row.chargeIdx}">
									<td>
										${idx} 
										<c:set var="idx" value="${idx-1}"/> 
									</td>
									<td class="text-left"><a class="title-link chargePolicy" data-charge-code="charge test">${row.chargeName}</a></td> <!-- 요금제명 -->
									<td>${row.chargeBasic}</td> <!-- 기본요금제여부 -->
									<td>${row.chargeUse}</td> <!-- 사용여부 -->
									<td>${row.chargeStartDate}~${row.chargeEndDate}</td> <!-- 적용기간 -->
									<td>${row.workerId}</td> <!-- 수정자 -->
									<td>${row.updDate}</td> <!-- 수정일 -->
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			${pagination}
		</div>
	</div>
</div>


<script>
//신규정책 등록
$('#addChargePolicy').on('click', function(){
	routie("edit");
});

//정책 수정/상세
$('.chargePolicy').on('click', function(){
	var chargeIdx = $(this).parents('tr').data('charge_idx');
	routie("edit/"+chargeIdx);
});

$('#pagePerRows').on('change', function() {
	data.nowPage = 1;
	searchList();
});
</script>
