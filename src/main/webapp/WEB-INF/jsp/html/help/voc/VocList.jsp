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
		<h5 class="card-title">조회결과</h5>
		<div class="row">
			<div class="col-2">
				전체: 
				<span>
					<c:choose>
						<c:when test="${empty result.listCount}">0</c:when>
						<c:otherwise><fmt:formatNumber value="${result.listCount}" pattern="#,###"/></c:otherwise>
					</c:choose>
				</span>건
			</div>
			<div class="col-2 pl-0">
				답변대기: 
				<span>
					<c:choose>
						<c:when test="${empty result.waitCount}">0</c:when>
						<c:otherwise><fmt:formatNumber value="${result.waitCount}" pattern="#,###"/></c:otherwise>
					</c:choose>
				</span>건
			</div>
			<div class="col-2">
				답변완료: 
				<span>
					<c:choose>
						<c:when test="${empty result.completeCount}">0</c:when>
						<c:otherwise><fmt:formatNumber value="${result.completeCount}" pattern="#,###"/></c:otherwise>
					</c:choose>
				</span>건
			</div>
		</div>
	</div>
	<div class="col-6 text-right">
		<div class="button-list">
			<c:if test="${isCreate}">
				<button type="button" class="btn btn-custom01 btn-rounded waves-effect waves-dark" id="btnEdit">1:1문의 작성</button>
			</c:if>
		</div>
	</div>
</div>
<div class="row table-voc">
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
						<col/>
						<col/>
					</colgroup>
					<thead>
						<tr role="row">
							<th class="sorting_asc">No.</th>
							<th class="sorting">등록일시</th>
							<th class="sorting">회원</th>
							<th class="sorting">주문번호</th>
							<th class="sorting">제목</th>
							<th class="sorting">작성자ID</th>
							<th class="sorting">상태</th>
							<th class="sorting">답변일시</th>
							<th class="sorting">답변자ID</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty result.vocList}">
							<tr>
								<td colspan="7">조회 결과가 없습니다.</td>
							</tr>
						</c:if>
						<c:set var="idx" value="${result.paginationVO.sizeOfData - (result.paginationVO.pageIndex-1) * result.paginationVO.pageSize}"/> 
						<c:forEach var="row" items="${result.vocList}">
							<tr role="row" data-voc_seq="${row.vocSeq}" data-voc_order_num="${row.vocOrderNum}" data-voc_order_id="${row.vocOrderId}"
							data-voc_owner_classification="${row.vocOwnerClassification}" data-voc_owner_id="${row.vocOwnerId}" data-voc_stauts_name="${vocStatusName}" data-voc_stauts="${vocStatus}">
								<td>
									${idx}
									<c:set var="idx" value="${idx-1}"/>
								</td>
								<td>
									<fmt:formatDate value="${row.vocRegisterDateByLongType}" pattern="yyyy.MM.dd HH:mm:ss"/> 
								</td>
								<td>
									<span class="<c:choose><c:when test="${row.vocOwnerClassification eq '차주'}">color-status-ing</c:when><c:when test="${row.vocOwnerClassification eq '화주'}">color-status-wait</c:when></c:choose>">${row.vocOwnerClassification}</span>
								</td> 
								<td><a class="title-link orderNumber">${row.vocOrderNum}</a></td>
								<td class="text-left"><a class="title-link title-overflow title">${row.vocTitle}</a></td>
								<td><a class="<c:if test="${row.vocAdminWriteYn ne 'Y'}">title-link userId</c:if>">${row.vocOwnerId}</a></td>
								<td>
									<span class="<c:if test="${row.vocStatus eq 'standby'}">color-status-cancel</c:if>">
										<c:choose>
											<c:when test="${not empty row.vocStatusName}">
												${row.vocStatusName}
											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${row.vocStatus eq 'standby'}">답변대기</c:when>
													<c:when test="${row.vocStatus eq 'complete'}">답변완료</c:when>
													<c:otherwise>${row.row.vocStatus}</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
									</span>
								</td>
								<td>
									<c:choose>
										<c:when test="${empty row.vocAnswerDateByLongType}">-</c:when>
										<c:otherwise>
											<fmt:formatDate value="${row.vocAnswerDateByLongType}" pattern="yyyy.MM.dd HH:mm:ss"/>
										</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${empty row.vocAnswerId}">-</c:when>
										<c:otherwise>
											${row.vocAnswerId}
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
	<c:if test="${empty result.resultCode}">
		alert("1:1문의 목록 조회중 오류가 발생하였습니다.\r\nERROR: ${result}');
	</c:if>
	<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
		alert("1:1문의 목록 조회중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}");
	</c:if>
	
	//VOC 작성
	$('#btnEdit').on('click', function(){
		routie("edit");
	});

	//제목 클릭시 주문상세화면으로 이동
	$('.title-link.title').on('click', function() {
		var vocSeq = $(this).parents('tr').data('voc_seq');
		routie("detail/"+vocSeq);
	});
	
	//주문번호 클릭시 상세화면으로 이동
	$('.title-link.orderNumber').on('click', function() {
		//주문배송 상세조회가 주문번호에서 주문ID로 변경되어 추가 by 2022.03.29
		var orderId = $(this).parents('tr').data('voc_order_id');
		if(orderId == undefined || orderId == ''){
			alert('주문ID가 없어 상세 페이지로 이동할 수 없습니다.');
			return;
		}
		movePageOrder(orderId);
	});
	
	//UserID 클릭시 회원정보화면으로 이동
	$('.title-link.userId').on('click', function() {
		var vocOwnerClassification = $(this).parents('tr').data('voc_owner_classification');
		var vocOwnerId = $(this).parents('tr').data('voc_owner_id');
		
		//console.log(vocOwnerClassification, vocOwnerId);
		
		movePageUser(vocOwnerClassification, vocOwnerId)
	});
	
	//페이지네이션 
	$('.searchList .table-voc ul.pagination li').on('click touch', function() {
		data.nowPage = $(this).data('page-index');
		searchList();
	})
</script>