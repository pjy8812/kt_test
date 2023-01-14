<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" 
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%>
<div id="popup" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" data-owner_id="${info.ownerId}">
    <div class="modal-dialog modal-dialog-centered modal-xl">
    	<div class="modal-content">
        	<div class="modal-header">
                <h4 class="modal-title">
                	<c:choose>
                		<c:when test="${info.popupType eq 'placebofee'}">위약수수료 내역</c:when>
                		<c:when test="${info.popupType eq 'history'}">변경 내역</c:when>
                		<c:when test="${info.popupType eq 'penalty'}">패널티 내역</c:when>
                	</c:choose>
                </h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
            	<div class="row">
                   	<div class="col-12" id="popupList">
       				</div>
       			</div>
        	</div>
    	</div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->