<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- front 결과 -->
<c:if test="${empty result.result}">
	<h5 class="card-title">업로드 결과 :
		<c:if test="${result.totalRowCount eq result.successCnt}">
			<span>성공</span>
		</c:if>
		<c:if test="${result.failCnt > 0 || !empty result.headerError}">
			<span class="text-danger">실패<c:if test="${!empty result.headerError}"> (${result.headerError})</c:if></span>
		</c:if>
	</h5>
	<div class="table-responsive">
	    <table class="table mb-0 basic-table text-center">
	        <colgroup>
	            <col style="width:25%;">
	            <col style="width:25%;">
	            <col style="width:25%;">
	            <col style="width:auto;">
	        </colgroup>
	        <thead>
				<tr>
					<th scope="row">요청건수</th>
					<th>성공건수</th>
					<th>실패건수</th>
					<th>업로드 일자</th>
				</tr>
	        </thead>
	        <tbody>
	            <tr>
	                <td>${result.totalRowCount}건</td>
	                <td>
	                	<c:if test="${result.totalRowCount eq result.successCnt}">
	                		${result.successCnt}건
	                	</c:if>
                	</td>
	                <td>
	                	<c:if test="${!empty result.failCnt}">
	                		${result.failCnt}건
	                	</c:if>
                	</td>
	                <td>
		                <c:set var="now" value="<%=new java.util.Date()%>" />
	                	<c:if test="${result.totalRowCount eq result.successCnt}">
	                		<fmt:formatDate value="${now}" pattern="yyyy.MM.dd HH:mm" />
	                	</c:if>
	               	</td>
	            </tr>
	        </tbody>
	    </table>
	</div>
	<c:if test="${result.failCnt > 0 && !empty result.failList}">
		<h5 class="card-title mt-2">업로드 실패 사유</h5>
		<div class="border-top border-bottom pt-2">
			<c:forEach items="${result.failList}" var="list">
			    <p>No${list.rowNum} : ${list.error}</p>
		    </c:forEach>
		</div>
	</c:if>
</c:if>

<!-- api 결과 -->
<c:if test="${!empty result.result}">
	<c:if test="${(empty result.result.error && result.result.resultCode eq '00000') || result.result.resultCode ne '00001'}">
		<h5 class="card-title">업로드 결과 :
			<c:if test="${result.result.failCount eq 0 && result.result.successCount eq result.result.totalCount}">
				<span>성공</span>
			</c:if>
			<c:if test="${result.result.failCount > 0}">
				<span class="text-danger">실패</span>
			</c:if>
		</h5>
		<div class="table-responsive">
		    <table class="table mb-0 basic-table text-center">
		        <colgroup>
		            <col style="width:25%;">
		            <col style="width:25%;">
		            <col style="width:25%;">
		            <col style="width:auto;">
		        </colgroup>
		        <thead>
					<tr>
						<th scope="row">요청건수</th>
						<th>성공건수</th>
						<th>실패건수</th>
						<th>업로드 일자</th>
		            </tr>
		        </thead>
		        <tbody>
		            <tr>
		                <td>${result.result.totalCount}건</td>
		                <td>
		                	<c:if test="${result.result.failCount eq 0 && result.result.successCount eq result.result.totalCount}">
		                		${result.result.successCount}건
		                	</c:if>
	                	</td>
		                <td>${result.result.failCount}건</td>
		                <td>
		                	<c:if test="${result.result.failCount eq 0 && result.result.successCount eq result.result.totalCount}">
			                	<fmt:formatDate value="${result.result.date}" pattern="yyyy.MM.dd HH:mm"/>
		                	</c:if>
		               	</td>
		            </tr>
		        </tbody>
		    </table>
		</div>
		<c:if test="${result.result.failCount > 0}">
			<h5 class="card-title mt-2">업로드 실패 사유</h5>
			<div class="border-top border-bottom pt-2">
				<c:forEach items="${result.result.list}" var="list">
				    <p>No${list.no} : ${list.errorMsg}</p>
			    </c:forEach>
			</div>
		</c:if>
	</c:if>
</c:if>


<script>
$(document).ready(function() {
	<c:if test="${not empty result.result}">
		<c:if test="${not empty result.result.error}">
			alert('엑셀 업로드 중 오류가 발생하였습니다.\r\nERROR: ${result.result.error}');
		</c:if>
		<c:if test="${not empty result.result.resultCode and result.result.resultCode ne '00000'}">
			alert('엑셀 업로드 중 오류가 발생하였습니다.\r\nERROR: ${result.result.resultMsg}');
		</c:if>
		<c:if test="${result.result.failCount eq 0 and result.result.successCount eq result.result.totalCount}">
			if(!alert('엑셀 업로드가 완료되었습니다.')) {
				$('#excelUploadPopup').modal('hide');
			}
		</c:if>
	</c:if>
});
</script>