<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib prefix="form"
	uri="http://www.springframework.org/tags/form"%><%@ taglib prefix="spring"
	uri="http://www.springframework.org/tags"%><%@ taglib prefix="fn"
	uri="http://java.sun.com/jsp/jstl/functions"%><%@ taglib
	prefix="iousoft" uri="/WEB-INF/taglib/iousoft.tld"%>
	
<!-- ========== Left Sidebar Start ========== -->
<div class="left-side-menu">
    <div class="h-100" data-simplebar>
        <!--- Sidemenu -->
        <div id="sidebar-menu">
            <ul id="side-menu">
            	<c:forEach var="menu"  items="${_menuList}" varStatus="i">
            		<c:if test="${fn:length(menu.subMenuList) == 0}">
            			<li class="<c:if test="${menu.menuUrl eq _pageUri}">menuitem-active</c:if>">
	                    <a href="<c:url value="${menu.menuUrl}"/>">
	                        <i data-feather="${menu.iconCss}"></i>
	                        <span>${menu.menuName}</span>
	                    </a>
	                	</li>
            		</c:if>
            		<c:if test="${fn:length(menu.subMenuList) > 0}">
            		<li class="<c:forEach var="sub" items="${menu.subMenuList}"><c:if test="${sub.menuUrl eq _pageUri}">menuitem-active</c:if></c:forEach>">
	                    <a href="#sub${menu.menuSqn}" data-toggle="collapse" class="<c:forEach var="sub" items="${menu.subMenuList}"><c:if test="${sub.menuUrl eq _pageUri}">active</c:if></c:forEach>">
	                        <i data-feather="${menu.iconCss}"></i>
	                        <span>${menu.menuName}</span>
	                        <span class="menu-arrow"></span>
	                    </a>
	               	 	<div class="collapse <c:forEach var="sub" items="${menu.subMenuList}"><c:if test="${sub.menuUrl eq _pageUri}">show</c:if></c:forEach>" id="sub${menu.menuSqn}">
	                        <ul class="nav-second-level">
	                        	<c:forEach var="sub" items="${menu.subMenuList}">
		                        	<li>
		                                <a href="<c:url value="${sub.menuUrl}"/>" class="<c:if test="${sub.menuUrl eq _pageUri}">active</c:if>">
		                                	${sub.menuName}
	                                	</a>
		                            </li>
	                        	</c:forEach>
	                        </ul>
	                    </div>
                     </li>
            		</c:if>
            	</c:forEach>
            </ul>
        </div>
        <!-- End Sidebar -->
        <div class="clearfix"></div>
    </div>
    <!-- Sidebar -left -->
</div>
<!-- Left Sidebar End -->
