<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="table-responsive" >
	<table class="table dt-responsive nowrap dataTable no-footer dtr-inline text-center" role="grid">
   		<thead>
       		<tr role="row">
           		<th class="sorting_asc">No</th>
           		<th class="sorting">계약구분</th>
				<th class="sorting">사업자구분</th>
				<th class="sorting">사업자유형</th>
				<th class="sorting">이용상태</th>
				<th class="sorting">월정산횟수</th>
				<th class="sorting">메모</th>
				<th class="sorting">수정자</th>
				<th class="sorting">수정일시</th>
			</tr>
   		</thead>
  	 	<tbody>
  	 		<c:if test="${empty result.list}">
  	 			<tr>
  	 				<td colspan="9">조회 결과가 없습니다.</td>
  	 			</tr>
  	 		</c:if>
  	 		<c:set var="idx" value="${result.paginationVO.sizeOfData - (result.paginationVO.pageIndex-1) * result.paginationVO.pageSize}"/> 
        	<c:forEach var="row" items="${result.list}" varStatus="i">
        		<tr role="row">
	            	<td>
						${idx}
						<c:set var="idx" value="${idx-1}"/>
					</td>
		            <td>
						<c:choose>
							<c:when test="${row.freightOwnerType eq 'normal'}">일반</c:when>
							<c:when test="${row.freightOwnerType eq 'contract'}">계약</c:when>
							<c:when test="${row.freightOwnerType eq 'manualDelivery'}">계약화주-수동배차</c:when>
							<c:otherwise>${row.freightOwnerType}</c:otherwise>
						</c:choose>
					</td>
		            <td>
		            	<c:choose>
							<c:when test="${row.freightOwnerMemberType eq 'nonBusiness'}">비사업자</c:when>
							<c:when test="${row.freightOwnerMemberType eq 'business'}">사업자</c:when>
							<c:otherwise>${row.freightOwnerMemberType}</c:otherwise>
						</c:choose>
		            </td>
		            <td>
		            	<c:choose>
							<c:when test="${row.freightOwnerBusinessType eq 'normal'}">일반</c:when>
							<c:when test="${row.freightOwnerBusinessType eq 'carrier'}">운송사</c:when>
							<c:when test="${row.freightOwnerBusinessType eq 'forwarder'}">주선사</c:when>
							<c:otherwise>${row.freightOwnerBusinessType}</c:otherwise>
						</c:choose>
		            </td>
		            <td>
		            	<c:choose>
							<c:when test="${row.freightOwnerMemberStatus eq 'normal'}">
								<span class="color-status-complete">정상</span>
							</c:when>
							<c:when test="${row.freightOwnerMemberStatus eq 'suspension'}">
								<span class="color-status-cancel">중지</span>
							</c:when>
							<c:when test="${row.freightOwnerMemberStatus eq 'withdrawalRequested'}">
								<span class="color-status-ing">탈퇴요청</span>
							</c:when>
							<c:when test="${row.freightOwnerMemberStatus eq 'withdrawal'}">
								<span class="color-status-ing">탈퇴</span>
							</c:when>
							<c:when test="${row.freightOwnerMemberStatus eq 'standby'}">
								<span class="color-status-ing">심사대기</span>
							</c:when>
							<c:otherwise>${row.freightOwnerMemberStatus}</c:otherwise>
						</c:choose>
					</td>
		            <td>${row.freightOwnerMonthSettlementNum}</td>
		            <td>${row.freightOwnerHistoryChangeReason}</td>
		            <td>${row.freightOwnerHistoryAmender}</td>
		            <td>
		            	<%-- ${row.freightOwnerInfoUpdateDateTime} --%>
		            	<fmt:formatDate value="${row.freightOwnerHistoryModifyDate}" pattern="yyyy.MM.dd"/><br/>
		            	<fmt:formatDate value="${row.freightOwnerHistoryModifyDate}" pattern="HH:mm"/> 
		            </td>
		        </tr>
        	</c:forEach>
   		</tbody>
    </table>
</div>
${result.pagination}
<script>
	<c:if test="${empty result.resultCode}">
		alert('화주 변경내역 조회중 오류가 발생하였습니다.\r\nERROR: ${result}');
	</c:if>
	<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
		alert('화주 변경내역 조회중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}')
	</c:if>
	
	//페이지네이션 
	$('#modal ul.pagination li').on('click touch', function() {
		var idx = $(this).data('page-index');
		loadHistoryPopupList(idx);
	});
</script>
