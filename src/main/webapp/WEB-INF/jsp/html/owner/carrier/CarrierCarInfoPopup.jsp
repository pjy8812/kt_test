<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="popup" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" data-owner_id="${info.ownerId}">
    <div class="modal-dialog modal-dialog-centered modal-xl">
    	<div class="modal-content">
             <div class="modal-header">
                 <h4 class="modal-title">차량등록</h4>
                 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
             </div>
             <div class="modal-body doc-preview">
                 <div class="row">
                     <div class="col-6">
                         <button type="button" class="btn btn-custom01 width-sm" id="modifyBtn">수정</button>
                         <button type="button" class="btn btn-secondary width-sm" id="deleteBtn">삭제</button>
                     </div>
                     <div class="col-6 text-right">
                         <button type="button" class="btn btn-custom01 width-sm" id="insertBtn">추가</button>
                     </div>
                 </div>
                 <div class="table-responsive">
                     <table class="table mt-2 basic-table text-center" id="carInfoTable">
                         <colgroup>
                             <col style="width: 50px;">
                             <col style="width: %;">
                             <col style="width: %;">
                             <col style="width: %;">
                             <col style="width: %;">
                             <col style="width: 320px;">
                         </colgroup>
                         <thead>
                             <tr>
                                 <th></th>
                                 <th>차량번호</th>
                                 <th>화물 규격</th>
                                 <th>차종</th>
                                 <th>톤수</th>
                                 <th>옵션</th>
                             </tr>
                         </thead>
                         <tbody>
                         	<c:if test="${empty result.carList}">
                         		<tr>
                         			<td>
                                    	<input type="checkbox">
										<input type="hidden" value="N" id="modYn">
	                                </td>
	                                <td>
	                                    <input type="text" class="form-control">
	                                </td>
	                                <td>
	                                	<select class="form-control">
	                                		<c:forEach var="row" items="${packagingType}" varStatus="i">
	                                			<option value="${row.codeId}">${row.codeName}</option>
	                                		</c:forEach>
	                                	</select>
	                                </td>
	                                <td>
	                                	<select class="form-control">
	                                		<c:forEach var="row" items="${carType}" varStatus="i">
	                                			<option value="${row.codeId}">${row.codeName}</option>
	                                		</c:forEach>
	                                	</select>
	                                </td>
	                                <td>
	                                	<select class="form-control">
	                                		<c:forEach var="row" items="${carModel}" varStatus="i">
	                                			<option value="${row.codeId}">${row.codeName}</option>
	                                		</c:forEach>
	                                	</select>
	                                </td>
	                                <td class="label-ty-1">
	                                	<select class="form-control">
	                                		<c:forEach var="row" items="${carOption}" varStatus="i">
	                                			<c:if test="${row.codeId ne 'antiString' and row.codeId ne 'lift'}">
		                                			<option value="${row.codeId}">${row.codeName}</option>
	                                			</c:if>
	                                		</c:forEach>
	                                	</select>
	                                	<select class="form-control">
	                                		<option value="none">없음</option>
	                                		<option value="antiSwing">무진동</option>
	                                	</select>
	                                	<select class="form-control">
	                                		<option value="none">없음</option>
	                                		<option value="lift">리프트</option>
	                                	</select>
	                                </td>
                         		</tr>
                         	</c:if>
                         	
                             <c:forEach var="row" items="${result.carList}" varStatus="i">
                             <tr>
                                 <td>
                                     <input type="checkbox" data-carrier-num="${row.carrierNum}">
									 <input type="hidden" value="Y" id="modYn">
                                 </td>
                                 <td>
                                     <input type="text" class="form-control" value="${row.carrierCarNum}" disabled>
                                 </td>
                                 <td>
									<select class="form-control" disabled>
										<c:forEach var="optionRow" items="${packagingType}" varStatus="j">
											<option value="${optionRow.codeId}" <c:if test="${row.carrierCarPackagingType eq optionRow.codeId}">selected</c:if>>${optionRow.codeName}</option>
										</c:forEach>
									</select>
                                 </td>
                                 <td>
									<select class="form-control" disabled>
										<c:forEach var="optionRow" items="${carType}" varStatus="j">
											<option value="${optionRow.codeId}" <c:if test="${row.carrierCarType eq optionRow.codeId}">selected</c:if>>${optionRow.codeName}</option>
										</c:forEach>
									</select>
                                 </td>
                                 <td>
									<select class="form-control" disabled>
										<c:forEach var="optionRow" items="${carModel}" varStatus="j">
											<option value="${optionRow.codeId}" <c:if test="${row.carrierCarModel eq optionRow.codeId}">selected</c:if>>${optionRow.codeName}</option>
										</c:forEach>
									</select>
                                 </td>
                                 <td class="label-ty-1">
                               		<select class="form-control" disabled>
                               			<option value="none">없음</option>
                                		<c:forEach var="optionRow" items="${carOption}" varStatus="i">
                                			<c:if test="${optionRow.codeId ne 'antiSwing' and optionRow.codeId ne 'lift'}">
	                                			<option value="${optionRow.codeId}" <c:if test="${optionRow.codeId eq row.carrierCarOption.option}">selected</c:if>>${optionRow.codeName}</option>
                                			</c:if>
                                		</c:forEach>
                                	</select>
                                	
                                	<select class="form-control" disabled>
                                		<option value="none">없음</option>
                                		<option value="antiSwing" <c:if test="${row.carrierCarOption.antiSwing eq 'antiSwing'}">selected</c:if>>무진동</option>
                                	</select>
                                	
                                	<select class="form-control" disabled>
                                		<option value="none">없음</option>
                                		<option value="lift" <c:if test="${row.carrierCarOption.lift eq 'lift'}">selected</c:if>>리프트</option>
                                	</select>
                                 </td>
                             </tr>
                             </c:forEach>
                         </tbody>
                     </table>
                 </div>
                 <div class="button-list text-center">
                     <button type="button" class="btn btn-secondary width-sm btn-rounded waves-effect waves-dark" data-dismiss="modal" aria-hidden="true">취소</button>
                     <button type="button" class="btn btn-custom01 width-sm btn-rounded waves-effect waves-dark" id="saveBtn">저장</button>
                 </div>
             </div>
         </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script>
	var checkData = [];
	var carOption;
	var carType;
	var carModel;
	var packagingType;
	
	// 차량정보 저장
	$('#saveBtn').on('click', function () {
		// 차량정보 리스트 저장
		var carData = getCarData();
		
		if (carData.result.length == 0) {
			alert("저장가능한 데이터가 없습니다.");
			return;
		}
		
		for (var i = 0; i < carData.result.length; i++) {
			if (carData.result[i].carrierCarNum == '' || carData.result[i].carrierCarNum == null) {
				alert("차량번호는 필수 입력항목입니다.");
				return;
			}
		}
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/ui/service/owner/carrier/popup/car.save'/>",
			data : {
				"carrierId": carData.carrierId,
				"carData": encodeURIComponent(JSON.stringify(carData.result))
			},
			cache : false,
			async : true,
			success : function(result, textStatus, XMLHttpRequest) {
				if(hasErrorMap(result, true)){
					return;
				}
				
				if (result.resultCode != '00000') {
					alert("차량정보 저장중 오류가 발생하였습니다. \r\nERROR: " + result.resultMsg);
					return;
				}
				
				alert("저장되었습니다.");
				$('#popup').modal('hide');
			},
			error : function(xhr, ajaxOptions, thrownError) {
				if(hasErrorMap(xhr, false)){
					return;
				}
			}
		}); 
	});
	
	function getCarData() {
		var result = [];
		var trs = $('#carInfoTable > tbody > tr');
		var carrierId = carrierData.carrierId;
		
		for (var i = 0; i < trs.length; i++) {
			var tr = $(trs[i]);
			var td = tr.children();
			var length = td.length;

			var modYn;
			var checked;
			var carrierNum;
			var carrierCarNum;
			var carrierCarPackagingType;
			var carrierCarType;
			var carrierCarModel;
			var carrierCarOption = '';
			
			for (var j = 0; j < length; j++) {
				var el = $(td[j]);

				if (j == 0) {
					modYn = el.children("input#modYn").val();
					checked = el.children("input").is(":checked");
					
					if (el.children("input").data("carrier-num") !== undefined) {
						carrierNum = el.children("input").data("carrier-num");
					}
				}

				if (j == 1) {
					carrierCarNum = el.children("input").val();
				}

				if (j == 2) {
					carrierCarPackagingType = el.children("select").val();
				}
				
				if (j == 3) {
					carrierCarType = el.children("select").val();
				}
				
				if (j == 4) {
					carrierCarModel = el.children("select").val();
				}

				if (j == 5) {
					for (var k = 0; k < el.children("select").length; k++) {
						var optionVal = $(el.children("select")[k]).val();

						if (optionVal != 'none') {
							carrierCarOption += optionVal;

							if (k < el.children("select").length) {
								carrierCarOption += ",";
							}
						}
					}

					if (carrierCarOption.substring(carrierCarOption.length-1, carrierCarOption.length) == ',') {
						carrierCarOption = carrierCarOption.substring(0, carrierCarOption.length-1);
					}
				}
			}
			
			if (checked) {
				if (tr.children('.label-ty-1').has("select").length != 0) {
// 					if (carrierCarNum != '') {
						var carrierCorporateRegistrationNumber = carrierData.carrierCorporateRegistrationNumber;
						var carrierName = carrierData.carrierName;
						var carrierCorporateRegistrationNumber = carrierData.carrierCorporateRegistrationNumber;
						var carrierTelephone = carrierData.carrierTelephone;
						var carrierEmail = carrierData.carrierEmail;
						var carrierMemberStatus = carrierData.carrierMemberStatus;
						var carrierRecommendId = carrierData.carrierRecommendId;
						
						result.push({carrierNum, carrierId, carrierCarNum, carrierCarPackagingType,
							carrierCarType, carrierCarModel, carrierCarOption, modYn,
							carrierCorporateRegistrationNumber, carrierName, carrierCorporateRegistrationNumber,
							carrierTelephone, carrierEmail, carrierMemberStatus, carrierRecommendId});
// 					}
				}
			}
		}
		
		return {
			"carrierId": carrierId,
			result
		};
	}

	// 차량정보 추가
	$('#insertBtn').on('click', function () {
		carOption = toJSON("${carOption}");
		// 등록된 내용이 없다는 멘트 삭제
		var tmp = $('#carInfoTable > tbody > tr:nth-child(2) > td');
		var trCnt = $('#carInfoTable > tbody > tr').length;
		var rowHtml = "";
		
		rowHtml += "<tr>";
		rowHtml += "<td><input type='checkbox'><input type='hidden' value='N' id='modYn'></td>"; // 체크박스
		rowHtml += "<td><input type='text' class='form-control'></td>"; // 차량번호
		
		// 팔레트/BOX
		rowHtml += "<td>";
		rowHtml += "<select class='form-control'>";
		rowHtml += "<c:forEach var='optionRow' items='${packagingType}' varStatus='j'>";
		rowHtml += "<option value='${optionRow.codeId}'>${optionRow.codeName}</option>";
		rowHtml += "</c:forEach>";
		rowHtml += "</select></td>";
		
		// 차종
		rowHtml += "<td>";
		rowHtml += "<select class='form-control'>";
		rowHtml += "<c:forEach var='optionRow' items='${carType}' varStatus='j'>";
		rowHtml += "<option value='${optionRow.codeId}'>${optionRow.codeName}</option>";
		rowHtml += "</c:forEach>";
		rowHtml += "</select></td>";
		
		// 톤수
		rowHtml += "<td>";
		rowHtml += "<select class='form-control'>";
		rowHtml += "<c:forEach var='optionRow' items='${carModel}' varStatus='j'>";
		rowHtml += "<option value='${optionRow.codeId}'>${optionRow.codeName}</option>";
		rowHtml += "</c:forEach>";
		rowHtml += "</select></td>";
		
		rowHtml += "<td class='label-ty-1'>";
		
		rowHtml += "<select class='form-control'>";
		rowHtml += "<option value='none'>없음</option>";
		for (var i = 0; i < carOption.length; i++) {
			if (carOption[i].codeId != 'lift' && carOption[i].codeId != 'antiSwing') {
				rowHtml += "<option value='" + carOption[i].codeId + "'>" + carOption[i].codeName + "</option>";
			}
		}
		rowHtml += "</select>";
		
		rowHtml += "<select class='form-control'>";
		rowHtml += "<option value='none'>없음</option>"
		rowHtml += "<option value='antiSwing'>무진동</option>"
		rowHtml += "</select>";
		
		rowHtml += "<select class='form-control'>"
		rowHtml += "<option value='none'>없음</option>"
		rowHtml += "<option value='lift'>리프트</option>"
		rowHtml += "</select>";
		
		rowHtml += "</td>"; // 옵션2
		rowHtml += "</tr>";
		
		if (tmp.text().indexOf("등록된 내용이 없습니다.") != -1) {
			tmp.remove();
			$('#carInfoTable > tbody:last').append(rowHtml);
		} else {
			$('#carInfoTable > tbody:last').append(rowHtml);
		}
	});
	
	// 차량정보 수정
	$('#modifyBtn').on('click', function () {
		var tmp = $('#carInfoTable > tbody > tr');
		var trCnt = $('#carInfoTable > tbody > tr').length;
		
		carOption = toJSON("${carOption}");
		carType = toJSON("${carType}");
		carModel = toJSON("${carModel}");
		packagingType = toJSON("${packagingType}");
		
		var checkedArr = [];
		for (var i = 0; i < tmp.length; i++) {
			if (tmp[i].children[0].querySelector("input").checked) {
				checkedArr.push(tmp[i]);
			}
		}

		if (checkedArr.length != 0) {
			modifyCarData(checkedArr);
		} else {
			alert("선택된 차량이 없습니다.");
		}
	});
	
	function toJSON(model) {
		var tmp = model;
		tmp = tmp.replace("[", "");
		tmp = tmp.replace("]", "");

		var data = tmp.split("}, {");
		data[0] = data[0].replace("{", "");
		data[data.length-1] = data[data.length-1].replace("}", "");
		
		var result = [];
		for (var i = 0; i < data.length; i++) {
			var codeTmp = data[i].split(", ");

			var jsonObj = {};
			for (var j = 0; j < codeTmp.length; j++) {
				jsonObj[codeTmp[j].split("=")[0]] = codeTmp[j].split("=")[1];
			}

			result.push(jsonObj);
		}
		
		return result;
	}

	function modifyCarData(arr) {
		for (var i = 0; i < arr.length; i++) {
			var childrens = arr[i].children;
			
			for (var j = 1; j < childrens.length; j++) {
				$(childrens[j]).children("input").removeAttr("disabled");
				$(childrens[j]).children("select").removeAttr("disabled");
			}
		}
	}
	
	function setOptionData(values) {
		var result = {
			"option": "",
			"antiSwing": "",
			"lift": ""
		};
		
		for (var i = 0; i < values.length; i++) {
			if (values[i] == "무진동") {
				result.antiSwing = values[i];
			} else if (values[i] == "리프트") {
				result.lift = values[i];
			} else {
				result.option = values[i];
			}
		}
		
		return result;
	}
	
	// 차량정보 삭제
	$('#deleteBtn').on('click', function () {
		var rows = $('#carInfoTable > tbody > tr');
		var deleteArr = getCarData();
		
		if (deleteArr.result.length > 0) {
			for (var i = 0; i < rows.length; i++) {
				var modYn = $(rows[i]).children("td:nth-child(1)").children("input#modYn");
				var checkbox = $(rows[i]).children("td:nth-child(1)").children("input[type=checkbox]");
				checkbox.is(":checked");
				
				if (checkbox.is(":checked")) {
					if (modYn.val() == 'N') {
						$(rows[i]).remove();
					}
				}
			}
			
			deleteArr.result = deleteArr.result.filter(function (el) {
				if (el.modYn == 'Y') {
					return true;
				}
			});
					
			// DB 데이터 삭제
			$.ajax({
				type : "POST",
				url : "<c:url value='/ui/service/owner/carrier/popup/car.delete'/>",
				data : {
					"carrierId": deleteArr.carrierId,
					"carData": encodeURIComponent(JSON.stringify(deleteArr))
				},
				cache : false,
				async : true,
				success : function(result, textStatus, XMLHttpRequest) {
					if(hasErrorMap(result, true)){
						return;
					}
					
					if (result.resultCode != '00000') {
						alert("차량정보 삭제중 오류가 발생하였습니다. \r\nERROR: " + result.resultMsg);
						return;
					}
					
					alert("삭제가 완료되었습니다.");
					
					$('#popup').modal('hide');
				},
				error : function(xhr, ajaxOptions, thrownError) {
					if(hasErrorMap(xhr, false)){
						return;
					}
				}
			});
		} else {
			alert("선택된 차량이 없습니다.");
			return;
		}
		
	})

</script>