<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" 
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ page import="java.sql.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h5 class="card-title">조회결과 (총 
	<c:choose>
		<c:when test="${!empty result.listCount and null ne result.listCount}">
			<fmt:formatNumber value="${result.listCount}"/>
		</c:when>
		<c:otherwise>
			0
		</c:otherwise>
	</c:choose>건)
</h5>

<div class="row">
	<div class="col"></div>
	<div class="col-3 text-right">
		<div class="form-group row mb-2">
			<div class="col-12 text-right">
				<div class="row">
					<div class="col-6">
						<select class="form-control" id="pagePerRows" name="pagePerRows">
							<option value="10"<c:if test="${'10' eq vo.pagePerRows}"> selected="selected"</c:if>>10개씩 보기</option>
							<option value="20"<c:if test="${'20' eq vo.pagePerRows}"> selected="selected"</c:if>>20개씩 보기</option>
							<option value="50"<c:if test="${'50' eq vo.pagePerRows}"> selected="selected"</c:if>>50개씩 보기</option>
						</select>
					</div>
					<div class="col-6">
						<c:forEach items="${autUriList}" var="autUriList">
							<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'C') gt -1}">
							<button type="button"
								class="btn btn-custom03 btn-rounded waves-effect waves-dark"
								id="addTerms" name="addTerms">신규약관등록</button>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-12">
		<div class="scroll-table-wrap">
			<div class="scroll-table-box">
				<table
					class="table dt-responsive nowrap dataTable no-footer dtr-inline text-center"
					role="grid">
					<thead>
						<tr role="row">
							<c:forEach var="headers" items="${headers}" varStatus="idx">
								<c:choose>
									<c:when test="${'0' eq idx}">
										<th class="sorting_asc">${headers}</th>
									</c:when>
									<c:otherwise>
										<th class="sorting">${headers}</th>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</tr>
					</thead>
					<c:choose>
						<c:when test="${empty result.list}">
							<tbody>
								<tr role="row" class="listRow noData" data-seq="">
									<td colspan="${fn:length(headers)}">
										조회 결과가 없습니다.
									</td>
								</tr>
							</tbody>
						</c:when>
						<c:otherwise>
							<tbody>
								<c:set value="${result.maxIndex}" var="maxIndex"/>
								<c:forEach items="${result.list}" var="list">
									<tr role="row" class="listRow">
										<td>
											${maxIndex}
											<c:set var="maxIndex" value="${maxIndex-1}"/>
										</td>
										<td class="title color-text-primary text-left" data-seq="${list.termsSeq}">${list.termsName}</td>
										<td class="">
											<c:choose>
												<c:when test="${'all' eq list.termsServiceClassify}">
													전체 
												</c:when>
												<c:otherwise>
													${list.termsServiceClassify}
												</c:otherwise>
											</c:choose>
										</td>
										<td>${list.termsRequiredYn}</td>
										<td>${list.termsRevisionVersion}</td>
										<td>
											${list.termsUseStartDateByLongTypeString}
											<c:if test="${null ne list.termsUseStartDateByLongTypeString or null ne list.termsUseEndDateByLongTypeString}">
												 ~ 
											</c:if>
											${list.termsUseEndDateByLongTypeString}
										</td>
										<td class="text-left">${list.termsWriter}</td>
										<td>${list.termsRegisterDateByLongTypeString}</td>
									</tr>
								</c:forEach>
							</tbody>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
		</div>
		${result.pagination}
		<%-- ${result} --%>
	</div>
</div>
<script>
	
	// 페이지사이즈 
	$('select[name="pagePerRows"]').on('change', function() {
		data.pagePerRows = $('select[name="pagePerRows"]').val();
		searchList();
	})
	
	// 신규약관등록 
	$('#addTerms').on('click touch', function() {
		routie("detail/insert");
	})
	
	// 페이지네이션 
	$('.searchList ul.pagination li').on('click touch', function() {
		data.pageIndex = $(this).data('page-index');
		searchList();
	})

	// 상세페이지 
	$('tr.listRow .title').css('cursor', 'pointer');
	$('tr.listRow .title').on('click', function() {
		var id = $(this).data('seq');

		if (id !== undefined && id !== '') {
			routie("detail/update/" + id);
		}
	});
	
	$(document).ready(function(){
		
		<c:if test="${empty result.resultCode}">
			alert('약관 목록 조회 중 오류가 발생하였습니다.\r\nERROR: ${result}')
		</c:if>
		<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
			alert('약관 목록 조회 중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}')
		</c:if>
	})
</script>