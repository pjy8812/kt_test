<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="carOwnerPopup" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-full-width modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">차주 선택</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
                <div class="card-box pt-0 mb-0">
					<div class="row">
						<div class="col-12">
							<ul class="nav nav-tabs">
								<c:if test="${mode ne 'manual' || authGroupCode ne 'manualDelivery'}">
								    <li class="nav-item car-owner">
								        <a href="" data-toggle="tab" aria-expanded="true" class="nav-link car-owner active" id="normal">일반차주</a>
								    </li>
							    </c:if>
							    <li class="nav-item car-owner">
							        <a href="" data-toggle="tab" aria-expanded="false" class="nav-link car-owner <c:if test="${mode eq 'manual' && authGroupCode eq 'manualDelivery'}">active</c:if>" id="emergency">비상차주연락망</a>
							    </li>
							    <li class="nav-item car-owner">
							        <a href="" data-toggle="tab" aria-expanded="false" class="nav-link car-owner" id="addEmerCarOwner">비상차주 등록</a>
							    </li>
							</ul>
							
							<div id="carOwnerSearch"></div>
							
							<div id="carOwnerSave"></div>
                
                    	</div>
                    </div>
                </div>
                
				<div id="carOwnerList"></div>
				
            </div>
        </div>
    </div>
</div>


<script>
var param = {
	nowPage : 1
	, pageSize : 10
	, maskingYn : "N"
};

$(document).ready(function() {
	//console.log("${authGroupCode}");
	
	loadCarownListForm();
});

// 검색 폼 
function loadCarownListForm(mode) {
	
	$('#carOwnerSearch').removeClass('d-none');
	$('#carOwnerList').removeClass('d-none');
	$('#carOwnerSave').addClass('d-none');
	
	mode = (mode != null)? mode: $('.nav-link.car-owner.active').attr('id');
	
	$.ajax({
		type : "POST",
		url : "<c:url value='/ui/service/order/carowner/search/'/>" + mode, 
		data : null,
		cache : false,
		async : false,
		beforeSend: function( xhr ) {
			$("#carOwnerSearch").empty();
		},
		success : function(data, textStatus, XMLHttpRequest) {
			if (hasErrorMap(data, true)) {
				return;
			}

			$('#carOwnerSearch').html(data);
			loadCarownList(mode);
		},
		error : function(xhr, ajaxOptions, thrownError) {
			if (hasErrorMap(xhr, false)) {
				return;
			}
		}
	});
}

// 목록
function loadCarownList(mode) {
	//console.log('=== loadCarownList ===');
	//console.log(mode);
	//console.log(param);
	
	$.ajax({
		type : "POST",
		url : "<c:url value='/ui/service/order/carowner/list/'/>" + mode,
		data : param,
		cache : false,
		async : true,
		beforeSend: function( xhr ) {
			$("#carOwnerList").empty();
		},
		success : function(data, textStatus, XMLHttpRequest) {
			if (hasErrorMap(data, true)) {
				return;
			}

			$('#carOwnerList').html(data);
		},
		error : function(xhr, ajaxOptions, thrownError) {
			if (hasErrorMap(xhr, false)) {
				return;
			}
		}
	});
}

// 비상차주 등록
function addEmergencyCarOwner() {
	$('#carOwnerSearch').addClass('d-none');
	$('#carOwnerList').addClass('d-none');
	$('#carOwnerSave').removeClass('d-none');
	
	$.ajax({
		type : "POST",
		url : "<c:url value='/ui/service/order/carowner/add'/>",
		data : param,
		cache : false,
		async : true,
		success : function(data, textStatus, XMLHttpRequest) {
			if (hasErrorMap(data, true)) {
				return;
			}

			$('#carOwnerSave').empty();
			$('#carOwnerSave').html(data);
		},
		error : function(xhr, ajaxOptions, thrownError) {
			if (hasErrorMap(xhr, false)) {
				return;
			}
		}
	});
}

// 탭 선택
$('.nav-item.car-owner').on('click', function(){
	var mode = $(this).children().attr('id');
	
	if(mode == 'addEmerCarOwner') {
		addEmergencyCarOwner();
	} else {
		param.nowPage = 1;
		delete param.searchType;
		delete param.searchText;
		
		loadCarownListForm(mode);
	}
});
</script>
