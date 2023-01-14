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
<div class="row mb-2">
	<div class="col-12 text-right">
		<!-- <button type="button"
			class="btn btn-custom02 btn-rounded waves-effect waves-dark excelDownloadBtn">
			엑셀다운로드<span class="btn-label-right"><i
				class="far fa-file-excel"></i></span>
		</button> -->
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
					<tbody>
						<c:choose>
							<c:when test="${empty result.list}">
								<tbody>
									<tr role="row" class="listRow noData" data-id="${list.id}">
										<td colspan="${fn:length(headers)}">
											조회 결과가 없습니다.
										</td>
									</tr>
								</tbody>
							</c:when>
							<c:otherwise>
								<%-- TODO --%>
								<c:set value="${result.maxIndex}" var="maxIndex"/>
								<c:forEach items="${result.list}" var="list">
									<tr role="row" class="listRow">
										<td>
											차주 
											<%-- ${maxIndex}
											<c:set var="maxIndex" value="${maxIndex-1}"/> --%>
										</td>
										<td class="text-left title" data-id="${list.carOwnerId}">${list.carOwnerId}</td>
										<%-- <td class="text-left color-text-primary link text-left" data-id="${list.carOwnerId}">${list.carOwnerName}</td> --%>
										<td class="text-left text-left" data-id="${list.carOwnerId}">${list.carOwnerName}</td>
										<td>${list.carOwnerTerminalDevice}</td>
										<td>${list.carOwnerTerminalOs}</td>
										<td>${list.carOwnerTerminalOSVersion}</td>
										<td>${list.carOwnerTerminalAppVersion}</td>
										<td>${list.carOwnerfirstUseDateString}</td>
										<td>${list.carOwnerLastUseDateString}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
		${result.pagination}
	</div>
</div>
<script>
	
	// 페이지네이션 
	$('.searchList ul.pagination li').on('click touch', function() {
		data.pageIndex = $(this).data('page-index');
		searchList();
	})
	
	// 차주 목록 엑셀 다운로드 
	/* $('.excelDownloadBtn').on('click touch', function () {
		location.href = "<c:url value='/ui/service/system/device/excel/download'/>"
	}) */

	// 상세페이지 
	/* $('tr.listRow').not('.noData').css('cursor', 'pointer');
	$('tr.listRow .link').on('click', function() {
		var id = $(this).data('id');
		if(id !== '' && id !== undefined) {
			location.replace('<c:url value="/ui/page/owner/carown#detail/"/>' + id);
		}
	}); */
</script>