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
	<div class="col text-right">
		<div class="button-list">
			<c:if test="${isCreate}">
				<button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark" id="btnEdit">매뉴얼 작성</button>
			</c:if>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-12">
		<div class="scroll-table-wrap">
			<div class="scroll-table-box">
				<table class="table dt-responsive nowrap dataTable no-footer dtr-inline text-center" role="grid">
					<colgroup>
						<col/>
						<col/>
						<col/>
						<col width="15%"/>
						<col width="20%"/>
						<col/>
						<col/>
						<col/>
					</colgroup>
					<thead>
						<tr role="row">
							<th class="sorting_asc">No.</th>
							<th class="sorting">카테고리</th>
							<th class="sorting">대상</th>
							<th class="sorting">제목</th>
							<th class="sorting">첨부파일</th>
							<th class="sorting">최종 작성자</th>
							<th class="sorting">최종 작성일</th>
							<th class="sorting">게시기간</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty result.manualList}">
							<tr>
								<td colspan="8">조회 결과가 없습니다.</td>
							</tr>
						</c:if>
						<c:set var="idx" value="${result.paginationVO.sizeOfData - (result.paginationVO.pageIndex-1) * result.paginationVO.pageSize}"/> 
						<c:forEach var="row" items="${result.manualList}" varStatus="i">
							<tr role="row" data-manual_seq="${row.manualSeq}">
								<td>
									${idx}
									<c:set var="idx" value="${idx-1}"/>
								</td>
								<td>
									<c:choose>
										<c:when test="${row.manualCategory eq 'reservationcAndChange'}">예약/변경</c:when>
										<c:when test="${row.manualCategory eq 'chargeAndPayment'}">요금/결제</c:when>
										<c:when test="${row.manualCategory eq 'transportationAndDriver'}">운송/기사</c:when>
										<c:when test="${row.manualCategory eq 'vocAndReport'}">문의/신고</c:when>
										<c:otherwise>${row.manualCategory}</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${row.manualRecipient eq '공통'}">
											<span class="color-status-complete">공통</span>
										</c:when>
										<c:when test="${row.manualRecipient eq '화주'}">
											<span class="color-status-wait">화주</span>
										</c:when>
										<c:when test="${row.manualRecipient eq '차주'}">
											<span class="color-status-ing">차주</span>
										</c:when>
										<c:otherwise>${row.manualRecipient}</c:otherwise>
									</c:choose>
								</td>
								<td class="text-left"><a class="title-link title-overflow">${row.manualTitle}</a></td>
								<td class="text-left">
									<c:forEach var="file" items="${row.fileList}" varStatus="i">
										<c:if test="${not empty file.fileName}">
										<a class="file-name" href="data:application/png;base64,${file.fileData}" download="${file.fileName}"><i class="fe-paperclip mr-1"></i>${file.fileName}</a>
										<c:if test="${not i.last}"><br/></c:if>
										</c:if>
									</c:forEach>
								</td>
								<td>${row.manualWriter}</td>
								<td>
									<fmt:formatDate value="${row.manualRegisterDateByLongType}" pattern="yyyy.MM.dd HH:mm:ss"/>
								</td>
								<td>
									<span <c:if test="${row.manualExposedNowYn ne 'Y'}">class="color-status-disable"</c:if> >
										<c:choose>
											<c:when test="${row.manualExposedAlwaysYn eq 'Y'}">상시게시</c:when>
											<c:otherwise>
												<c:if test="${not empty row.manualExposedStartDateByLongType and not empty row.manualExposedEndDateByLongType}">
												<fmt:formatDate value="${row.manualExposedStartDateByLongType}" pattern="yyyy.MM.dd HH:mm"/> ~ <fmt:formatDate value="${row.manualExposedEndDateByLongType}" pattern="yyyy.MM.dd HH:mm"/>
												</c:if>
											</c:otherwise>
										</c:choose>
									</span>
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
		alert('메뉴얼 목록 조회중 오류가 발생하였습니다.\r\nERROR: ${result}');
	</c:if>
	<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
		alert('메뉴얼 목록 조회중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}');
	</c:if>

	//매뉴얼 작성
	$('#btnEdit').on('click', function(){
		routie("edit");
	});

	//제목 클릭시 상세화면으로 이동
	$('.title-link').on('click', function() {
		var manualSeq = $(this).parents('tr').data('manual_seq');
		//console.log(manualSeq)
		routie("detail/"+manualSeq);
	});
	
	//페이지네이션 
	$('.searchList ul.pagination li').on('click touch', function() {
		data.nowPage = $(this).data('page-index');
		searchList();
	});
</script>