<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="areaPopup" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg modal-dialog-scrollable" data-group_code="${vo.areaGroupCode}">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">지역 추가</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
				<div class="card-box pt-0">
				    <h5 class="card-title">조회조건</h5>
					<div class="row">
						<div class="col-10">
							<div class="form-group row mb-0">
								<label for="select01" class="col-2 col-form-label">지역구분</label>
								<div class="col-10 col-form-label text-left">${vo.areaGroupName}</div>
							</div>
						</div>
					</div>
					<!-- <div class="row">
						<div class="col-10">
							<div class="form-group row mb-3">
								<label for="" class="col-2 col-form-label">검색어</label>
								<div class="col-10">
									<div class="row">
										<div class="col-4">
											<select class="form-control searchType" id="">
												<option value="codeName">지역명</option>
												<option value="">우편번호</option>
												<option value="codeId">코드ID</option>
											</select>
										</div>
										<div class="col-6">
											<input type="text" class="form-control keyword" id="" placeholder="검색어를 입력하세요.">
										</div>
									</div>
								</div>
							</div>
						</div>
				        <div class="col-2 text-right">
				            <button type="button" name="areaSearchBtn" class="btn btn-custom04 btn-rounded waves-effect waves-dark">조회</button>
				        </div>
					</div>  -->
				</div>
	            <div id="popupList"></div>
            </div>
            <div class="modal-footer">
	            <div class="button-list text-center">
			        <button type="button" class="btn btn-dark width-sm  btn-rounded waves-effect waves-dark" data-dismiss="modal">취소</button>
			        <button type="button" class="btn btn-custom01 width-sm  btn-rounded waves-effect waves-dark" id="btnOkArea">확인</button>
			    </div>
		    </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script>
// 조회
$('button[name="areaSearchBtn"]').on('click touch', function () {
	var groupCode = $('#areaPopup .modal-dialog').data('group_code');
	loadAreaPopupList(1, groupCode)
});


$('#btnOkArea').on('click touch', function () {
	var str='<tr data-type_clw="${vo.areaGroupName}" data-option_clw="{0}">';
	str += '<td class="text-center">';
	str += '	<input type="checkbox" name="${vo.areaGroupCode}_chk"/>'
	str += '</td>';
	str += '<td class="optionClw text-center">{0}</td>';
	str += '<td>'
	str += '	<div class="row">';
	str += '		<div class="col-2">';
	str += '			<input type="number" name="weightClw" class="form-control text-right" min="0"  max="99" value="" onKeyUp="removeChar(event);onlyNumber(event);" onkeydown="onlyNumber(event);"  oninput="maxLengthCheck(this)" maxLength="2">';
	str += '		</div>'
	str += '	</div>';
	str += '</td>';
	str += '</tr>';
	
	var groupCode = $('#areaPopup .modal-dialog').data('group_code');
	var code = $('#areaPopup [name="chk"]:checked').val();
	var name = $('#areaPopup [name="chk"]:checked').data('code_name');
	str = str.format(name); 
	
	if(code == undefined){ //선택한 지역이 없을 경우
		alert('지역을 선택해주세요');
		return;
	}
	
	var list = $('.table_'+groupCode+' tbody tr');
	var flag = true;
	list.each(function (idx, item) {
		//console.log($.isEmptyObject($(item).data('option_clw')));
		if($.isEmptyObject($(item).data('option_clw'))){
			//'조회된 데이터가 없습니다' 삭제
			$(item).remove(); 
		}else{
			//중복체크
			var optionClw = $(item).data('option_clw');
			if(optionClw == name){
				flag = false;
				return false;
			}
		}
	});
	
	if(flag){
		$('.table_'+groupCode+' tbody').append(str);
		$('#areaPopup').modal('hide');
	}else{
		alert('이미 추가된 지역입니다.');
	}
});
</script>
