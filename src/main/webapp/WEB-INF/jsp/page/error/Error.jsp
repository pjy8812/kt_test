<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" 
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%>
<div id="wrapper">
   <div class="navbar-custom">
       <div class="container-fluid">
           <ul class="list-unstyled topnav-menu float-right mb-0">
			<c:if test="${not empty User }">
               <li class="dropdown notification-list topbar-dropdown">
                   <a class="nav-link dropdown-toggle nav-user mr-0 waves-effect waves-dark" data-toggle="dropdown" href="javascript:void(0);" role="button" aria-haspopup="false" aria-expanded="false">
                       <span class="pro-user-name ml-1">
                           ${User.userName} <i class="mdi mdi-chevron-down"></i>
                       </span>
                   </a>
                   <div class="dropdown-menu dropdown-menu-right profile-dropdown ">

                       <!-- item-->
                       <a href="<c:url value="/login/logout"/>" class="dropdown-item notify-item">
                           <!-- <i class="fe-log-out"></i> -->
                           <span>๋ก๊ทธ์์</span>
                       </a>

                   </div>
               </li>
			</c:if>
           </ul>

           <!-- LOGO -->
           <div class="logo-box">
               <a href="<c:url value="/"/>" class="logo logo-light text-center">
                   <span class="logo-sm">
                       <img src="<c:url value="/assets/images/SVG/logo_white.svg"/>" alt="" height="30"/>
                   </span>
                   <span class="logo-lg">
                       <img src="<c:url value="/assets/images/SVG/logo_white.svg"/>" alt="" height="30"/>
                   </span>
           		</a>
           </div>

           <div class="clearfix"></div>
       </div>
   </div>
   <!-- end Topbar -->

   <div class="content-wrap type-01">
	    <div class="content">
	        <div class="approve-page">
	            <i class="fe-alert-circle"></i>
	            <h4 class="tit">์์ฒญํ์? ํ์ด์ง๋ฅผ ์ฐพ์ ์ ์์ต๋๋ค.</h4>
	            <p class="small">์?์ํ๋?ค๋ ํ์ด์ง์ ์ฃผ์๊ฐ ์๋ชป ์๋?ฅ๋๊ฑฐ๋,<br>ํ์ด์ง์ ์ฃผ์๊ฐ ๋ณ๊ฒฝ ๋๋ ์ญ์?๋์ด ํด๋น ํ์ด์ง์ ์?์ํ? ์ ์์ต๋๋ค.<br>์๋?ฅํ์? ์ฃผ์๋ฅผ ๋ค์ ํ์ธํด์ฃผ์๊ธฐ ๋ฐ๋๋๋ค.</p>
	            <button type="button" class="btn btn-custom01 waves-effect waves-dark" id="btnHome">๋์๊ฐ๊ธฐ</button>
	        </div>
	    </div>
	</div>

</div>
<!-- END wrapper -->			

<script type="text/javascript">
$(document).ready(function() {
	$('#btnHome').on('click', function(){
		location.href = '<c:url value="/"/>'
	})
});
</script>
