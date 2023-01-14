<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- orderTracking iframe -->
<!-- 
<body style="overflow:hidden;">
	<div id="map_div" style="width: 100%; height: 100%;">
	</div>
</body>
 -->

<!-- orderTracking popup -->
<div class="modal-content">
	<div class="modal-body pb-0" style="width: 100%; height: 760px;">
		<div id="map_div" style="width: 100%; height: 580px;">
		</div>
		<div class="modal-body pt-1 pl-0 pr-0">
		    <div class="row">
		        <div class="col-6">
		            <div class="card border m-2">
		                <div class="card-box mb-0" style="color:black;">
		                    <h5 class="card-title" style="color:black;">상차지</h5>
		                    <p class="mb-0">${info.loadingAddress}<c:if test="${!empty info.loadingDetailAddress}">, ${info.loadingDetailAddress}</c:if></p>
		                    <p class="mb-0">${info.loadingDateTime}</p>
		                </div>
		            </div>
		        </div>
		        <div class="col-6">
		            <div class="card border m-2">
		                <div class="card-box mb-0" style="color:black;">
		                    <h5 class="card-title" style="color:black;">하차지</h5>
		                    <p class="mb-0">${info.unloadingAddress}<c:if test="${!empty info.unloadingDetailAddress}">, ${info.unloadingDetailAddress}</c:if></p>
		                    <p class="mb-0">${info.unloadingDateTime} (예정)</p>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
	</div>
</div>
<script type="text/javascript" src="<c:url value='/assets/js/ktmap/ktmap-all-desktop-min.js'/>"></script>


<script>
$(document).ready(function(){
	document.body.style.overflow = "hidden";
});

function initialize() {
	var options = {
		center: new olleh.maps.LatLng("${info.lat}", "${info.lon}"), //위경도
		zoom: 6,
		mapTypeId: 'ROADMAP',
		disableDefaultUI: true //컨트롤 비활성화
	};
	var map = new olleh.maps.Map(document.getElementById('map_div'), options);
	
	// 현위치 마커
	var marker = new olleh.maps.overlay.Marker({
    	position: options.center,
    	map: map,
        icon: ({
            url: "<c:url value='/assets/images/SVG/marker.png'/>"
        }),
	});
	
	// 지도 중심점 설정
	// map.setCenter(new olleh.maps.LatLng("${info.loadingLat}", "${info.loadingLon}"));
}
window.onload = initialize();

/*
// js import로 대체
function loadScript() {
	var head= document.getElementsByTagName('head')[0];
	var script= document.createElement('script');
	script.type= 'text/javascript';
	script.onreadystatechange = function () { // IE
		if (this.readyState == 'complete') initialize();
	}
	script.onload = initialize;
	script.src = 'https://gis.kt.com/maps/v3.0/sdk.js?key=3cec283c685cad2a055b7b8ad6504dc5903b7e0e839de51b481b78896f187a6c7d4f4eb0';
	head.appendChild(script);
}

window.onload = loadScript();
*/
</script>
