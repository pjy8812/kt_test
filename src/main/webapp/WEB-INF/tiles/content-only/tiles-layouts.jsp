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

 <body class="loading" data-layout-mode="detached" data-layout='{"mode": "light", "width": "fluid", "menuPosition": "fixed", "sidebar": { "color": "light", "size": "default", "showuser": true}, "topbar": {"color": "dark"}, "showRightSidebarOnPageLoad": true}'>
	<!-- Content area -->
	<tiles:insertAttribute name="content"/>
	<div class="spinner-wrap d-none">
	    <div class="spinner-box">
	        <div class="spinner-border text-light m-2" role="status">
	            <span class="sr-only">Loading...</span>
	        </div>
	    </div>
	</div>
	<!-- /content area -->
	
<script src="<c:url value='/assets/js/app.js'/>"></script>
<script type="text/javascript">

var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");

$(document)
.ajaxStart(function () {
	$('.spinner-wrap').removeClass('d-none');
})
.ajaxStop(function () {
	$('.spinner-wrap').addClass('d-none');
})
.ajaxSend(function(e, xhr, options) { 
	// TODO
	xhr.setRequestHeader(header, token); 
});
</script>
</body>
</html>
