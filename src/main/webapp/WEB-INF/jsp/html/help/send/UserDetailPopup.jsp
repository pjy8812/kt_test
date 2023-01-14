<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" 
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%>
<div id="popup" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" data-owner_id="${vo.ownerId}" data-user_type="${vo.ownerClassification}">
    <div class="modal-dialog modal-dialog-centered">
    	<div class="modal-content">
        	<div class="modal-header">
                <h4 class="modal-title">회원정보</h4>
                <button type="button" class="close btn_modal_dismiss" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
             <div class="modal-body" id="modalInfo">
           	</div>	
    	</div>
    </div>
</div>
<script>
	$('#popup').on('click', '#btnMasking', function(){
		var userType =  $('.modal').data('user_type');
		var ownerId = $('.modal').data('owner_id');
		loadUserDetailPopup(userType, ownerId, 'N');
	});
	
</script>