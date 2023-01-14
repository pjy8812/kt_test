<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${empty result.addresses}">
	<p class="no-data-txt">결과가 존재하지 않습니다.</p>
</c:if>

<c:if test="${!empty result.addresses}">
	<div class="modal-address-list-box">
    	<ul class="address-list">
	    	<c:forEach items="${result.addresses}" var="list">
		        <li class="selectAddr" data-pnu="${list.parcelAddress.pnucode}" data-rbu="${list.roadAddress.rbucode}"
		        	data-lat="${list.parcelAddress.geographicInformation.point.lat}"
		        	data-lng="${list.parcelAddress.geographicInformation.point.lng}">
		            <a href="javascript:void(0);">
		                <dl>
		                    <dt>도로명</dt>
		                    <dd>${list.roadAddress.fullAddress}</dd>
		                </dl>
		                <dl>
		                    <dt>지번</dt>
		                    <dd>${list.parcelAddress.fullAddress}</dd>
		                </dl>
		                <dl>
		                    <dt>우편번호</dt>
		                    <dd>${list.parcelAddress.postCode}</dd>
		                </dl>
		            </a>
		        </li>
	        </c:forEach>
	    </ul>
	</div>
</c:if>


<script>
var chargeCal;
var addrFlag;

//주소 선택
$('.selectAddr').on('click', function(){
	if("${mode}" == 'loading') {
		//상차주소	
		$('#loadingAddr').val($(this).find('dd').eq(0).text()); //도로명
		$('#loadingZip').val($(this).find('dd').eq(2).text());
		$('#loadingDetailAddr').val('');
		
		//선택한 상차지주소 정보
		$('.loading.point.lat').val($(this).data('lat'));
		$('.loading.point.lng').val($(this).data('lng'));
		$('.loading.pnu').val($(this).data('pnu'));
		$('.loading.rbu').val($(this).data('rbu'));
		$('.loading.post').val($(this).find('dd').eq(2).text());
	} else if("${mode}" == 'unloading') {
		//하차주소
		$('#unloadingAddr').val($(this).find('dd').eq(0).text()); //도로명
		$('#unloadingZip').val($(this).find('dd').eq(2).text());
		$('#unloadingDetailAddr').val('');
		
		//선택한 하차지주소 정보
		$('.unloading.point.lat').val($(this).data('lat'));
		$('.unloading.point.lng').val($(this).data('lng'));
		$('.unloading.pnu').val($(this).data('pnu'));
		$('.unloading.rbu').val($(this).data('rbu'));
		$('.unloading.post').val($(this).find('dd').eq(2).text());
	}
	addrFlag = true;
	chargeCal = false; //주소변경시 표준요금재계산 강제함
	$('#addressSearchPopup').modal('hide');
});
</script>