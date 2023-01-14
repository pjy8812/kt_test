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
<c:set var="isUpdate" value="false"/>
<c:forEach items="${autUriList}" var="autUriList">
	<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'U') gt -1}"><c:set var="isUpdate" value="true"/></c:if>
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
			<button type="button" id="btnPopupSms" class="btn btn-custom01 btn-rounded waves-effect waves-dark">단체발송</button>
		</c:if>
	</div>
</div>

<div class="row">
	<div class="col-12">
		<div class="scroll-table-wrap">
			<div class="scroll-table-box">
				<table class="table dt-responsive nowrap dataTable no-footer dtr-inline text-center w-100" role="grid">
					<colgroup>
						<col width="7%"/>
						<col width="7%"/>
						<col width="8%"/>
						<col width="7%"/>
						<col width="7%"/>
						<col width="10%"/>
						<col/>
						<col width="10%"/>
						<col width="10%"/>
						<col width="8%"/>
						<col width="10%"/>
					</colgroup>
					<thead>
						<tr role="row">
							<th class="sorting_asc">No.</th>
							<th class="sorting">발송구분</th>
							<th class="sorting">발송항목</th>
							<th class="sorting">발송유형</th>
							<th class="sorting">발송대상</th>
							<th class="sorting">회원명</th>
							<th class="sorting">발송내용</th>
							<th class="sorting">발송자ID</th>
							<th class="sorting">발송일시</th>
							<th class="sorting">발송상태</th>
							<th class="sorting">재발송</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty result.list}">
							<tr>
								<td colspan="11">조회 결과가 없습니다.</td>
							</tr>
						</c:if>
						<c:set var="idx" value="${result.paginationVO.sizeOfData - (result.paginationVO.pageIndex-1) * result.paginationVO.pageSize}"/> 
						<c:forEach var="row" items="${result.list}" varStatus="i">
							<tr role="row" data-id="1" data-send_seq="${row.sendSeq}" data-to_id="${row.toId}" data-send_target_name="${row.sendTargetName}">
								<td>
									${idx}
									<c:set var="idx" value="${idx-1}"/>
								</td>
								<td>${row.sendCategoryName}</td>
								<td>${row.templateNameKr}</td>
								<td>${row.sendTypeName}</td>
								<td>${row.sendTargetName}</td>
								<td>
									<c:choose>
										<c:when test="${row.sendTargetName eq '관리자'}">
											${row.toName}
										</c:when>
										<c:otherwise>
											<a class="title-link user">${row.toName}</a>
										</c:otherwise>
									</c:choose>
								</td>
								<td class="text-left"><a class="title-link title-overflow title">${row.msg}</a></td>
								<td>${row.fromId}</td>
								<td>
									<fmt:formatDate value="${row.sendDate}" pattern="yyyy.MM.dd HH:mm"/>
								</td>
								<td>
									<span class="
									<c:choose>
										<c:when test="${row.sendStatusName eq '발송완료' or row.sendStatus eq 'complete'}">color-status-complete</c:when>
										<c:when test="${row.sendStatusName eq '발송중'}">color-status-wait</c:when>
										<c:when test="${row.sendStatusName eq '빌송실패' or row.sendStatus eq 'fail'}">color-status-cancel</c:when>
									</c:choose>
									">${row.sendStatusName}</span>
								</td>
								<td>
									<c:choose>
										<c:when test="${empty row.resendDate}">
											<c:choose>
												<c:when test="${row.sendStatusName eq '발송완료' or row.sendStatusName eq '빌송실패' or row.sendStatus eq 'complete' or row.sendStatus eq 'fail'}">
													<c:if test="${isUpdate}">
													<button type="button" class="btn btn-white waves-effect waves-dark btnResend">재발송</button>
													</c:if>
												</c:when>
												<c:otherwise>-</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<fmt:formatDate value="${row.resendDate}" pattern="yyyy.MM.dd HH:mm"/>
										</c:otherwise>
									</c:choose>
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
	//단체발송 버튼 클릭
	$('#btnPopupSms').on('click touch', function(){
	 	showSmsPopup();
	});
	
	$('#modal').on('click touch', '#btnCancelSms', function(){
		if(!confirm('메시지 발송을 취소하시겠습니까?')){
			return;
		}
		
		$('#popup').modal('hide');
	});
	
	$('#modal').on('click touch', '#btnSensSms', function(){
		if(!confirm('메시지를 발송하시겠습니까?')){
			return;
		}
		
		sendSMS();
	});
	
	//페이지네이션 
	$('.searchList ul.pagination li').on('click touch', function() {
		data.nowPage = $(this).data('page-index');
		searchSmsList();
	});
</script>