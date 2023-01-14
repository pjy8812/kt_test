<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		<div class="button-list">
			<c:forEach items="${autUriList}" var="autUriList">
				<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'C') gt -1}">
					<button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark" id="btnEdit">공지사항 작성</button>
				</c:if>
			</c:forEach>
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
						<col width="30%"/>
						<col/>
						<col/>
						<col/>
						<col/>
						<col/>
					</colgroup>
					<thead>
						<tr role="row">
							<th class="sorting_asc">No</th>
							<th class="sorting">대상</th>
							<th class="sorting">제목</th>
							<th class="sorting">최종 작성자</th>
							<th class="sorting">최종 작성일</th>
							<th class="sorting">게시기간</th>
							<th class="sorting">팝업설정</th>
							<th class="sorting">상단고정</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty result.noticeList}">
							<tr>
								<td colspan="8">조회 결과가 없습니다.</td>
							</tr>
						</c:if>
						<c:set var="idx" value="${result.paginationVO.sizeOfData - (result.paginationVO.pageIndex-1) * result.paginationVO.pageSize}"/> 
						<c:forEach var="row" items="${result.noticeList}" varStatus="i">
							<tr role="row" data-notice_seq="${row.noticeSeq}">
								<td>
									${idx}
									<c:set var="idx" value="${idx-1}"/>
								</td>
								<td>
									<c:choose>
										<c:when test="${row.noticeRecipient eq '공통'}">
											<span class="color-status-complete">공통</span>
										</c:when>
										<c:when test="${row.noticeRecipient eq '화주'}">
											<span class="color-status-wait">화주</span>
										</c:when>
										<c:when test="${row.noticeRecipient eq '차주'}">
											<span class="color-status-ing">차주</span>
										</c:when>
										<c:otherwise>${row.noticeRecipient}</c:otherwise>
									</c:choose>
								</td>
								<td class="text-left"><a class="title-link title-overflow">${row.noticeTitle}</a></td>
								<td>${row.noticeWriter}</td>
								<td>
									<fmt:formatDate value="${row.noticeRegisterDateByLongType}" pattern="yyyy.MM.dd HH:mm:ss"/>
								</td>
								<td>
									<span <c:if test="${row.noticeExposedNowYn ne 'Y'}">class="color-status-disable"</c:if>>
										<c:choose>
											<c:when test="${row.noticeAlwaysPostYn eq 'Y'}">상시게시</c:when>
											<c:otherwise>
												<c:if test="${not empty row.noticeExposedStartDateByLongType and not empty row.noticeExposedEndDateByLongType}">
													<fmt:formatDate value="${row.noticeExposedStartDateByLongType}" pattern="yyyy.MM.dd HH:mm"/> ~ <fmt:formatDate value="${row.noticeExposedEndDateByLongType}" pattern="yyyy.MM.dd HH:mm"/>
												</c:if>
											</c:otherwise>
										</c:choose>
									</span>
									
								</td>
								<td>
									<c:set var="isUpdate" value="false"/>
									<c:forEach items="${autUriList}" var="autUriList">
										<c:if test="${autUriList.key eq __pageUri and fn:indexOf(autUriList.value, 'U') gt -1}"><c:set var="isUpdate" value="true"/></c:if>
									</c:forEach>
									<input type="checkbox"  class="switch_popup" data-plugin="switchery" data-color="#14b34c" data-size="small" <c:if test="${row.noticePopupSetting eq 'Y'}">checked</c:if>
										<c:if test="${not isUpdate}">disabled</c:if>/>
								</td>
								<td>
									<input type="checkbox"  class="switch_fixed_top" data-plugin="switchery" data-color="#14b34c" data-size="small" <c:if test="${row.noticeTopExposed eq 'Y'}">checked</c:if>
										<c:if test="${not isUpdate}">disabled</c:if>/>
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
		alert('공지사항 목록 조회중 오류가 발생하였습니다.\r\nERROR: ${result}');
	</c:if>
	<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
		alert('공지사항 목록 조회중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}');
	</c:if>
	
	//상단고정, 팝업설정 토글 기본설정
	$('[data-plugin="switchery"]').each(function(e,a){
		var switchery = new Switchery($(this)[0],$(this).data())
	});

	//공지사항 작성
	$('#btnEdit').on('click', function(){
		routie("edit");
	});

	//제목 클릭시 상세화면으로 이동
	$('.title-link').on('click', function() {
		var noticeSeq = $(this).parents('tr').data('notice_seq');
		routie("detail/"+noticeSeq);
	});
	
	//상단고정 변경 시 상태값 변경
	$('.switch_fixed_top').on('change', function(){
		var noticeSeq = $(this).parents('tr').data('notice_seq');
		var index = $('.switch_fixed_top').index(this);
		var topFlag = $(this).is(':checked') ?  'Y': 'N'
		var popupFlag = $('.switch_popup').eq(index).is(':checked') ?  'Y': 'N'
		
		//console.log(noticeSeq, topFlag, popupFlag);
		updateStatus(noticeSeq, topFlag, popupFlag);
	});
	
	//팝업설정 변경 시 상태값 변경
	$('.switch_popup').on('change', function(){
		var noticeSeq = $(this).parents('tr').data('notice_seq');
		var index = $('.switch_popup').index(this);
		var topFlag = $('.switch_fixed_top').eq(index).is(':checked') ?  'Y': 'N'
		var popupFlag = $(this).is(':checked') ?  'Y': 'N';
		
		//console.log(noticeSeq, topFlag, popupFlag);
		updateStatus(noticeSeq, topFlag, popupFlag);
	});
	
	
	//페이지네이션 
	$('.searchList ul.pagination li').on('click touch', function() {
		data.nowPage = $(this).data('page-index');
		searchList();
	});
</script>