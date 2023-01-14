<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" 
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib prefix="iousoft" uri="/WEB-INF/taglib/iousoft.tld"
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<tiles:insertAttribute name="head"/>
	<script>
	var _CONTEXT_PATH = "<%=request.getContextPath()%>";
	</script>
</head>

<body class="loading" data-layout-mode="detached" data-layout='{"mode": "light", "width": "fluid", "menuPosition": "fixed", "sidebar": { "color": "light", "size": "default", "showuser": true}, "topbar": {"color": "dark"}, "showRightSidebarOnPageLoad": true}'>

	<!-- Begin page -->
    <div id="wrapper">
		<tiles:insertAttribute name="body-header"/>
	
		<%--  <tiles:insertAttribute name="sidebar"/> --%>
		
		<div class="content-page">
			<div class="content">
				<!-- Start Content-->
				<div class="container-fluid">
			
					<tiles:insertAttribute name="page-header"/>
	
					<!-- Content area -->
					<tiles:insertAttribute name="content"/>
					<!-- /content area -->
				
					<!-- Footer -->
					<tiles:insertAttribute name="footer"/>
					<!-- /footer -->
	
	       		</div> <!-- container -->
                  <div class="spinner-wrap d-none">
                      <div class="spinner-box type01">
                          <div class="spinner-border m-2" role="status">
                              <span class="sr-only">Loading...</span>
                          </div>
                      </div>
                 </div>
	   		</div> <!-- content -->
		</div>
		<!-- /page content -->
	</div>
 	
 	<!-- Picker js-->
	<script src="<c:url value='/assets/js/pages/form-pickers.init.js'/>"></script> 
	
 	<!-- App js -->
    <script src="<c:url value='/assets/js/app.min.js'/>"></script>
    <script src="<c:url value='/assets/js/style.js'/>"></script>
    <script type="text/javascript">
	$(function() {
		// 기간검색 오늘 
		$('.content').on('click touch', 'button.datePicker.today', function() {
			var elName = $(this).data('target-input');
			var start = new Date(new Date().setHours(0,0,0,0));
			var end = new Date(new Date().setHours(23,59,59,0));
			var valueList = [start, end];
			updateDateRangePicker(elName, valueList);
		});
		
		// 기간검색 일주일 
		$('.content').on('click touch', 'button.datePicker.week', function() {
			var elName = $(this).data('target-input');
			var start = new Date(new Date().addDays(-6).setHours(0,0,0,0));
			var end = new Date(new Date().setHours(23,59,59,0));
			var valueList = [start, end];
			updateDateRangePicker(elName, valueList);
		});
		
		// 기간검색 최근1개월
		$('.content').on('click touch', 'button.datePicker.30days', function() {
			var elName = $(this).data('target-input');
			var start = new Date(new Date().addMonths(-1).setHours(0,0,0,0));
			var end = new Date(new Date().setHours(23,59,59,0));
			var valueList = [start, end];
			updateDateRangePicker(elName, valueList);
		});
		
		// 기간검색 3~6개월
		$('.content').on('click touch', 'button.datePicker.3to6mon', function() {
			var elName = $(this).data('target-input');
			var start = new Date(new Date().addMonths(-6).setHours(0,0,0,0));
			var end = new Date(new Date().addMonths(-3).setHours(23,59,59,0));
			var valueList = [start, end];
			updateDateRangePicker(elName, valueList);
		});
	
		// 기간검색 6개월 이전
		$('.content').on('click touch', 'button.datePicker.before6mon', function() {
			var elName = $(this).data('target-input');
			var start = new Date(new Date().addMonths(-6).setHours(23,59,59,0));
			var end   = new Date(new Date().setHours(0,0,0,0));
			var valueList = [start, end];
			updateDateRangePicker(elName, valueList);
		});
	});
	</script>
</body>
</html>
