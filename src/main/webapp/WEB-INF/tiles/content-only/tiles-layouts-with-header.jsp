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
</head>

 <body class="loading" data-layout-mode="detached" data-layout='{"mode": "dark", "width": "fluid", "menuPosition": "fixed", "sidebar": { "color": "dark", "size": "default", "showuser": true}, "topbar": {"color": "light"}, "showRightSidebarOnPageLoad": true}'>
	
	<tiles:insertAttribute name="body-header"/>
	
	<!-- Content area -->
	<tiles:insertAttribute name="content"/>
	<!-- /content area -->
	
<script src="<c:url value='/assets/js/app.js'/>"></script>
</body>
</html>
