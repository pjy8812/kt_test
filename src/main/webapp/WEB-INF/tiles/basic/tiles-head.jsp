<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" 
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib prefix="iousoft" uri="/WEB-INF/taglib/iousoft.tld"
%>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
  	<meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
   	<meta content="Coderthemes" name="author" />
   	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
   	<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/> 	<!-- default header name is X-CSRF-TOKEN -->
	<title>브로캐리-관리자용</title>

	<!-- App favicon -->
	<link rel="shortcut icon" href="<c:url value="/assets/images/favicon.ico"/>" type="image/x-icon" />
	<link rel="icon" href="<c:url value="/assets/images/favicon.ico"/>" type="image/x-icon"/>
	
	<!-- Plugins css -->
    <link href="<c:url value='/assets/libs/flatpickr/flatpickr.min.css'/>" rel="stylesheet" type="text/css" />
   	<link href="<c:url value='/assets/libs/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css'/>" rel="stylesheet" type="text/css" />
   	<link href="<c:url value='/assets/libs/clockpicker/bootstrap-clockpicker.min.css'/>" rel="stylesheet" type="text/css" />
   	<link href="<c:url value='/assets/libs/bootstrap-datepicker/css/bootstrap-datepicker.min.css'/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value='/assets/libs/mohithg-switchery/switchery.min.css'/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value='/assets/libs/quill/quill.snow.css'/>" rel="stylesheet" type="text/css" />
   
    <!-- App css -->
    <link href="<c:url value='/assets/css/bootstrap-modern.min.css'/>" rel="stylesheet" type="text/css" id="bs-default-stylesheet" />
   	<link href="<c:url value='/assets/css/app-modern.min.css'/>" rel="stylesheet" type="text/css" id="app-default-stylesheet" />
   	<!-- icons -->
   	<link href="<c:url value='/assets/css/icons.min.css'/>" rel="stylesheet" type="text/css" />
    <!-- custom -->
   	<link href="<c:url value='/assets/css/kt_custom3.css'/>" rel="stylesheet" type="text/css" />
   	<link href="<c:url value='/assets/css/kt_custom2.css'/>" rel="stylesheet" type="text/css" />
   	<link href="<c:url value='/assets/css/custom.css'/>" rel="stylesheet" type="text/css" />

	<!-- Vendor js -->
   	<script src="<c:url value='/assets/js/jquery.min.js'/>"></script> 
    <script src="<c:url value='/assets/js/vendor.min.js'/>"></script>
        
    <!-- Plugins js-->
    <script src="<c:url value='/assets/libs/flatpickr/flatpickr.min.js'/>"></script>
    <script src="<c:url value='/assets/libs/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js'/>"></script>
    <script src="<c:url value='/assets/libs/clockpicker/bootstrap-clockpicker.min.js'/>"></script>
    <script src="<c:url value='/assets/libs/bootstrap-datepicker/js/bootstrap-datepicker.min.js'/>"></script>
    <script src="<c:url value='/assets/libs/selectize/js/standalone/selectize.min.js'/>"></script>
    <script src="<c:url value='/assets/libs/mohithg-switchery/switchery.min.js'/>"></script>
    <script src="<c:url value='/assets/libs/select2/js/select2.min.js'/>"></script>
    <script src="<c:url value='/assets/libs/bootstrap-maxlength/bootstrap-maxlength.min.js'/>"></script>
    <script src="<c:url value='/assets/js/routie.min.js'/>"></script>
    <script src="<c:url value='/assets/libs/quill/quill.min.js'/>"></script>

    <script src="<c:url value='/assets/js/custom.js'/>"></script>