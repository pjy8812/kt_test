<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="row mb-2">
	<div class="col-6">
		<h5 class="card-title">
			조회결과
		</h5>
	</div>
</div>
<div class="table-responsive" >
	<table class="table dt-responsive nowrap dataTable no-footer dtr-inline text-center" role="grid">
   		<thead>
       		<tr role="row">
           		<th class="sorting_asc"></th>
				<th class="sorting">코드ID</th>
				<th class="sorting">지역명</th>
			</tr>
   		</thead>
  	 	<tbody>
  	 		<c:if test="${empty codeList}">
  	 			<tr>
  	 				<td colspan="3">조회 결과가 없습니다.</td>
  	 			</tr>
  	 		</c:if>
        	<c:forEach var="row" items="${codeList}" varStatus="i">
        		<tr role="row">
	            	<td>
						<div class="form-check">
		           			<input type="radio" class="form-check-input chk" name="chk" value="${row.codeId}" data-code_name="${row.codeName}">
		            	</div>
					</td>
					<td>${row.codeId}</td>
		            <td>${row.codeName}</td>
		        </tr>
        	</c:forEach>
   		</tbody>
    </table>
</div>
${result.pagination}
<script>
	/*
	<c:if test="${empty result.resultCode}">
		alert('지역 조회중 오류가 발생하였습니다.\r\nERROR: ${result}');
	</c:if>
	<c:if test="${not empty result.resultCode and result.resultCode ne '00000'}">
		alert('지역 조회중 오류가 발생하였습니다.\r\nERROR: ${result.resultMsg}')
	</c:if>
	*/
	
	//페이지네이션 
	$('#modal ul.pagination li').on('click touch', function() {
		var idx = $(this).data('page-index');
		loadHistoryPopupList(idx);
	});
</script>
