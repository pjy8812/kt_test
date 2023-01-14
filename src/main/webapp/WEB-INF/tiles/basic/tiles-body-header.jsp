<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" 
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib prefix="iousoft" uri="/WEB-INF/taglib/iousoft.tld"
%>

<c:set var="__pageUri" value="${_pageUri}" scope="session"/>

<!-- Topbar Start -->
<div class="navbar-custom">
     <div class="container-fluid">
         <ul class="list-unstyled topnav-menu float-right mb-0">

             <li class="dropdown notification-list topbar-dropdown">
                 <a class="nav-link dropdown-toggle nav-user mr-0 waves-effect waves-dark" data-toggle="dropdown" href="javascript:void(0);" role="button" aria-haspopup="false" aria-expanded="false">
                     <span class="pro-user-name ml-1">
                         ${User.adminName}
                         <i class="mdi mdi-chevron-down"></i> 
                     </span>
                 </a>
                 <c:if test="${not empty User}">
	                 <div class="dropdown-menu dropdown-menu-right profile-dropdown ">
	                     <!-- item-->
	                     <a class="dropdown-item notify-item logout" data-last="<%=session.getLastAccessedTime()%>">
	                         <i class="fe-log-out"></i>
	                         <span>로그아웃</span>
	                     </a>
	                     <a href="<c:url value="/ui/page/login/change"/>" class="dropdown-item notify-item">
	                         <span>비밀번호 재설정</span>
	                     </a>
	
	                 </div>
                 </c:if>
             </li>
         </ul>
		
         <!-- LOGO -->
         <div class="logo-box">
             <a href="<c:url value="/ui/page/dashboard/index"/>" class="logo logo-light text-center">
                 <span class="logo-sm">
                     <img src="<c:url value="/assets/images/SVG/logo.svg"/>" alt="" height="35">
                 </span>
                 <span class="logo-lg">
                     <img src="<c:url value="/assets/images/SVG/logo.svg"/>" alt="" height="35">
                 </span>
             </a>
         </div>

         <ul class="list-unstyled topnav-menu topnav-menu-left m-0">
             <li>
                 <button class="button-menu-mobile waves-effect waves-dark">
                     <i class="fe-menu"></i>
                 </button>
             </li>
         </ul>
		<div class="top-menu-list-wrap">
			<ul class="list-unstyled top-menu-list">
				<c:choose>
					<c:when test="${null ne User.adminAuthorityGroupCode and 'manualDelivery' eq User.adminAuthorityGroupCode}">
					</c:when>
					<c:otherwise>
						<li class="<c:if test="${fn:indexOf(_pageUri, '/dashboard') > -1}">active</c:if>">
							<a href="<c:url value="/ui/page/dashboard/index"/>">Dashboard</a>
						</li>
					</c:otherwise>
				</c:choose>
               	<c:forEach items="${topMenuList}" var="topMenuData">
					<li
						class="<c:if test="${fn:indexOf(_pageUri, topMenuData.menuUrl) > -1}">active</c:if>">
						<span><c:out value="${topMenuData.menuNm}" /></span>
					</li>
				</c:forEach>				
			</ul>
		</div>
		<div class="top-menu-list-sub-wrap">
             <ul class="list-unstyled top-menu-list-sub">
				<c:choose>
					<c:when test="${null ne User.adminAuthorityGroupCode and 'manualDelivery' eq User.adminAuthorityGroupCode}">
					</c:when>
					<c:otherwise>
						<li></li>
					</c:otherwise>
				</c:choose>             
               	<c:forEach items="${topMenuList}" var="topMenuData">
					<li>
	                 	<c:forEach items="${subMenuList}" var="subMenuData">
							<c:if
								test="${fn:indexOf(topMenuData.menuNm, subMenuData.upMenuNm) gt -1 and fn:indexOf(subMenuData.authorityCRUD, 'R') gt -1}">
								<a href="<c:url value="${subMenuData.menuUrl}"/>"
									class="<c:if test="${fn:indexOf(_pageUri, subMenuData.menuUrl) > -1}">active</c:if>"><c:out value="${subMenuData.menuNm}" /></a>
							</c:if>
						</c:forEach>					
					</li>
				</c:forEach>					
             </ul>
         </div>
         <div class="clearfix"></div>
     </div>
 </div>

<!-- end Topbar -->


<script>
$('.logout').on('click', function(){
	if(!confirm("로그아웃하시겠습니까?")) {
		return;
	}
	logout();
});


//로그아웃
function logout() {
	$.ajax({
		type : "POST",
		url : "<c:url value='/ui/service/login/logout'/>",
		data : {
			"accessToken" : "${User.accessToken}"
		},
		cache : false,
		async : true,
		success : function(data, textStatus, XMLHttpRequest) {
			//console.log(data);
			
			// error, result code 무시하고 로그아웃 처리(2022.03.15 임시적용)
			location.href = '<c:url value="/page/index"/>';
			
			/*
			if(data.error != null && data.error != "invalid_token") {
				alert('로그아웃 도중 오류가 발생하였습니다.\r\nERROR: '+data.error);
			} else if(data.resultCode != null && data.resultCode != '00000') {
				alert('로그아웃 도중 오류가 발생하였습니다.\r\nERROR: '+data.resultMsg);
			} else if(data.resultCode == '00000' || data == null) {
				location.href = '<c:url value="/page/index"/>';
			}
			*/
		},
		error : function(xhr, ajaxOptions, thrownError) {
			if (hasErrorMap(xhr, false)){
				return;
			}
		}
	});
}
	
</script>
