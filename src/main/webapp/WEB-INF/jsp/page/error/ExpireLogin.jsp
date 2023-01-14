<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" 
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%>
<script type="text/javascript">
$(document).ready(function() {
	alert('중복된 아이디로 로그인하여 로그아웃 처리되었습니다.');
	location.href = '<c:url value="/page/index"/>'
	
});
</script>
