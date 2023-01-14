<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" 
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ page import="java.sql.*" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Begin search -->
<div class="card">
	<div class="card-body">
		<div class="row mb-2">
			<div class="col-6 text-dark">
				<span class="day-txt baseTime"></span>
				<a class="" href="javascript: void(0);" data-toggle="reload" onclick="javascript: refreshData();"> 
					<i class="mdi mdi-refresh text-dark"></i>
				</a>
			</div>
			<div class="col-6 text-right">
				<button type="button" class="btn btn-custom03 btn-rounded waves-effect waves-dark excelDetailDownloadBtn">
					엑셀다운로드
		        </button>
			</div>
		</div>
		<div class="searchList">
		
		</div>
	</div>
</div>
<!-- End search -->

<script>

	// 기준시간 update
	function refreshData() {
		// console.log('refreshData');
		loadList(getData());
		$('span.baseTime').html((new Date()).format('yyyy-MM-dd hh:mm') + " 기준");
	}
	
	function initServiceEvent() {
		refreshData();
	}
	
	$(document).ready(function() {
		initServiceEvent();
		searchList();
		
		setInterval(refreshData, 60000 * 3);
	})

</script>
