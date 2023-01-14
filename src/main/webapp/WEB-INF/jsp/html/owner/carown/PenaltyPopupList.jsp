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
             <th class="sorting">주문ID</th>
             <th class="sorting">종류</th>
             <th class="sorting">상세</th>
             <th class="sorting">패널티</th>
             <th class="sorting">발생일</th>
         </tr>
   		</thead>
  	 	<tbody>
  	 		<c:if test="${empty result.list}">
  	 			<tr>
  	 				<td colspan="6">조회 결과가 없습니다.</td>
  	 			</tr>
  	 		</c:if>
  	 		<c:set var="idx" value="${result.paginationVO.sizeOfData - (result.paginationVO.pageIndex-1) * result.paginationVO.pageSize}"/> 
  	 		<c:forEach var="row" items="${result.list}">
		        <tr role="row">
		            <td>
						${idx}
						<c:set var="idx" value="${idx-1}"/>
					</td>
		            <td>${row.orderNum}</td>
		            <td>${row.carOwnerPenaltyPolicyActicity}</td>
		            <td>${row.carOwnerPenaltyPolicyDetails}</td>
		            <td>
		            	<c:if test="${not empty row.carOwnerPenaltyPolicyCount}">${row.carOwnerPenaltyPolicyCount}회</c:if>
		            	<c:if test="${not empty row.carOwnerPenaltyPolicyDescription}">- ${row.carOwnerPenaltyPolicyDescription}</c:if>
		            </td>
		            <td>
		            	<fmt:formatDate value="${row.penaltyRegisterDate}" pattern="yyyy.MM.dd"/> <br/>
		           	 	<fmt:formatDate value="${row.penaltyRegisterDate}" pattern="HH:mm"/> 
		            </td>
		        </tr>
	        </c:forEach>
   		</tbody>
    </table>
</div>
${result.pagination}
<script>
	<c:if test="${empty result.resultCode}">
		alert('패널티 목록 조회중 오류가 발생하였습니다.\r\nERROR: ${result}');
	</c:if>
	<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
		alert('패널티 목록 조회중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}')
	</c:if>
	
	//페이지네이션 
	$('#modal ul.pagination li').on('click touch', function() {
		var idx = $(this).data('page-index');
		loadPenaltyPopupList(idx);
	});
</script>