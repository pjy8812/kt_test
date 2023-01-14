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

<body class="loading" data-layout-mode="detached" data-layout='{"mode": "dark", "width": "fluid", "menuPosition": "fixed", "sidebar": { "color": "dark", "size": "default", "showuser": true}, "topbar": {"color": "light"}, "showRightSidebarOnPageLoad": true}'>

	<!-- Begin page -->
    <div id="wrapper">
		<tiles:insertAttribute name="body-header"/>
	
		<%-- <tiles:insertAttribute name="sidebar"/> --%>
		
            <div class="content-wrap type-01">
                <div class="content mb-3">
				<!-- Start Content-->
				<div class="container-fluid">
			
					<%-- <tiles:insertAttribute name="page-header"/> --%>
	
					<!-- Content area -->
					<tiles:insertAttribute name="content"/>
					<!-- /content area -->
				
					<!-- Footer -->
					<tiles:insertAttribute name="footer"/>
					<!-- /footer -->
	
	       		</div> <!-- container -->
	   		</div> <!-- content -->
		</div>
		
		
		<!-- /page content -->
	</div>
 	
 	<!-- App js -->
    <script src="<c:url value='/assets/js/app.min.js'/>"></script>
</body>
</html>
