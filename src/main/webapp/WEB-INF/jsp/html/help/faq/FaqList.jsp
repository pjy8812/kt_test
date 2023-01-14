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
				<button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark" id="btnEdit">FAQ 작성</button>
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
						<col width="30%"/>
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
							<th class="sorting">최종 작성자</th>
							<th class="sorting">최종 작성일</th>
							<th class="sorting">게시기간</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty result.faqList}">
							<tr>
								<td colspan="7">조회 결과가 없습니다.</td>
							</tr>
						</c:if>
						<c:set var="idx" value="${result.paginationVO.sizeOfData - (result.paginationVO.pageIndex-1) * result.paginationVO.pageSize}"/> 
						<c:forEach var="row" items="${result.faqList}" varStatus="i">
							<tr role="row" data-faq_seq="${row.faqSeq}">
								<td>
									${idx}
									<c:set var="idx" value="${idx-1}"/>
								</td>
								<td>
									${row.faqCategoryName}
								</td>
								<td>
									<c:choose>
										<c:when test="${row.faqRecipient eq '공통'}">
											<span class="color-status-complete">공통</span>
										</c:when>
										<c:when test="${row.faqRecipient eq '화주'}">
											<span class="color-status-wait">화주</span>
										</c:when>
										<c:when test="${row.faqRecipient eq '차주'}">
											<span class="color-status-ing">차주</span>
										</c:when>
										<c:otherwise>${row.faqRecipient}</c:otherwise>
									</c:choose>
								</td>
								<td class="text-left"><a class="title-link title-overflow">${row.faqTitle}</a></td>
								<td>${row.faqWriter}</td>
								<td>
									<fmt:formatDate value="${row.faqRegisterDateByLongType}" pattern="yyyy.MM.dd HH:mm:ss"/> 
								</td>
								<td>
									<span <c:if test="${row.faqExposedNowYn ne 'Y'}">class="color-status-disable"</c:if>>
										<c:choose>
											<c:when test="${row.faqAlwaysPostYn eq 'Y'}">상시게시</c:when>
											<c:otherwise>
												<c:if test="${not empty row.faqExposedStartDateByLongType and not empty row.faqExposedEndDateByLongType}">
													<fmt:formatDate value="${row.faqExposedStartDateByLongType}" pattern="yyyy.MM.dd HH:mm"/> ~ <fmt:formatDate value="${row.faqExposedEndDateByLongType}" pattern="yyyy.MM.dd HH:mm"/>
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
		alert('FAQ 목록 조회중 오류가 발생하였습니다.\r\nERROR: ${result}');
	</c:if>
	<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
		alert('FAQ 목록 조회중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}');
	</c:if>
	
	//FAQ 작성
	$('#btnEdit').on('click', function(){
		routie("edit");
	});

	//제목 클릭시 상세화면으로 이동
	$('.title-link').on('click', function() {
		var faqSeq = $(this).parents('tr').data('faq_seq');
		//console.log(faqSeq)
		routie("detail/"+faqSeq);
	});
	
	//페이지네이션 
	$('.searchList ul.pagination li').on('click touch', function() {
		data.nowPage = $(this).data('page-index');
		searchList();
	});
</script>