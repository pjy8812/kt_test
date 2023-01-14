<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" 
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%>
<script type="text/javascript">
	$(document).ready(function() {
		<c:choose>
		<c:when test="${null ne User and !empty User}">
			alert('권한이 없습니다.');
			<%-- 로그인 상태면 권한설정값이 없는 대시보드로 이동--%>
			<c:if test="${null ne redirectUri and '' ne redirectUri}">
				location.href = '<c:url value="${redirectUri}"/>';
			</c:if>	
		</c:when>
		<c:otherwise>
			alert('로그인이 필요합니다.');
			location.href = "<c:url value='/'/>";
		</c:otherwise>
		</c:choose>
	});
</script>
