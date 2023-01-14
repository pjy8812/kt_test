<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" 
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib prefix="iousoft" uri="/WEB-INF/taglib/iousoft.tld"
%>
<!-- start page title -->
<div class="row">
	<div class="col-12">
		<div class="page-title-box">
			<div class="row">
				<div class="col-9">
					<h4 class="page-title">
					${pageTitle}
					<%-- <c:forEach var="menu"  items="${_menuList}" varStatus="i">
		           		<c:if test="${fn:length(menu.subMenuList) == 0 and menu.menuId eq menuId}">${menu.menuName}</c:if>
		           		<c:if test="${fn:length(menu.subMenuList) > 0}">
		                       	<c:forEach var="sub" items="${menu.subMenuList}">
		                       		<c:if test="${sub.menuId  eq  menuId}">${sub.menuName}</c:if>
		                        </c:forEach>
		           		</c:if>
		           	</c:forEach> --%>
					</h4>
				</div>
				<div class="col-3 text-right mt-3">
					<h5 class="">${breadCrumb}</h5>
				</div>
			</div>
        </div>
    </div>
</div>     
<!-- end page title --> 
			
<script type="text/javascript">

var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");

$(document)
.ajaxStart(function () {
	//세션시간체크 추가 by.2022.04.26 mijin.kim
	var last = new Date($('.logout').data('last')).addMinutes(60).getTime();
	var now = new Date().getTime();
	
	if(now>last){ 
		alert('오랜시간 이용하지 않아 로그아웃 되었습니다.');
		logout();
	}else{
		$('.logout').data('last', new Date().getTime());
	}
	
	$('.spinner-wrap').removeClass('d-none');
})
.ajaxStop(function () {
	$('.spinner-wrap').addClass('d-none');
})
.ajaxSend(function(e, xhr, options) { 
	xhr.setRequestHeader(header, token); 
});

 // Logout Timer 객체 정의
	var LogOutTimer = function() {
		var S = {
			timer : null,
	      	limit : 1000 * 60 * 60,
	      	start : function() {
				S.timer = window.setTimeout(S.fnc, S.limit);
	        },
	      	reset : function() {
	            window.clearTimeout(S.timer);
	            S.start();
	       }
	   };
        
		document.onmousemove = function() { S.reset(); };
    	return S;
  }();
      
  // 로그아웃 체크시간 설정
  LogOutTimer.limit = 1000 * 60 * 60;
      
   // 로그아웃 함수 설정
	LogOutTimer.fnc = function() {
		alert('오랜시간 이용하지 않아 로그아웃 되었습니다.');
		logout();
	}
      
    // 로그아웃 타이머 실행
    LogOutTimer.start();
</script>
