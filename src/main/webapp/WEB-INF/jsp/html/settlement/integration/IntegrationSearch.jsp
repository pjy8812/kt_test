<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" 
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ page import="java.sql.*" %>

<script src="<c:url value='/assets/libs/apexcharts/apexcharts.min.js'/>"></script>
<script src="<c:url value='/assets/libs/flatpickr/plugins/monthSelect/index.js'/>"></script>
<link href="<c:url value='/assets/libs/flatpickr/plugins/monthSelect/style.css'/>" rel="stylesheet" type="text/css" />

<!-- Begin search -->
<div class="card-box">
   <h5 class="card-title">조회조건</h5>
   <div class="row">
      <div class="col-10">
         <div class="row">
            <div class="col-6">
               <div class="form-group row mb-3">
                  <label for="freightOwnerSettlementState" class="col-2 col-form-label">청구상태</label>
                  <div class="col-4">
                     <select class="form-control" id="freightOwnerSettlementState" name="freightOwnerSettlementState">
                        <option value="all">전체</option>
                        <c:forEach var="frgSettlementStatusList" items="${frgSettlementStatusList}">
                           <option value="${frgSettlementStatusList.codeId}">${frgSettlementStatusList.codeName}</option>
                        </c:forEach>
                     </select>
                  </div>
                  <label for="carOwnerSettlementState" class="col-2 col-form-label">지급상태</label>
                  <div class="col-3">
                     <select class="form-control" id="carOwnerSettlementState" name="carOwnerSettlementState">
                        <option value="all">전체</option>
                        <c:forEach var="carSettlementStatusList" items="${carSettlementStatusList}">
                           <option value="${carSettlementStatusList.codeId}">${carSettlementStatusList.codeName}</option>
                        </c:forEach>
                     </select>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
	<div class="row">
		<div class="col-10">
			<div class="form-group row mb-3">
				<label for="searchType" class="col-1 col-form-label">검색어</label>
				<div class="col-11">
					<div class="row">
						<div class="col-2">
							<select class="form-control" id="searchType" name="searchType">
								<option value="all">전체</option>
								<option value="freightOwnerSettlementOrderNum">주문번호</option>
								<option value="freightOwnerName">화주명</option>
								<option value="freightOwnerId">화주ID</option>
								<option value="freightOwnerCompany">화주사</option>
								<option value="carNum">차량번호</option>
								<option value="carOwnerId">차주ID</option>
								<option value="forwardName">운송대행사</option>
								<option value="forwardId">운송대행사ID</option>
							</select>
						</div>
						<div class="col-4">
							<input type="text" class="form-control" id="searchText" name="searchText" placeholder="검색어를 입력하세요.">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-2 text-right">
		</div>
	</div>
	
	<div class="row">
		<div class="col-10">
			<div class="form-group row mb-3">
				<label for="range-datepicker" class="col-1 col-form-label">일자/기간</label>
				<div class="col-11">
					<div class="row">
						<div class="col-2">
<!-- 							<select class="form-control" id="pickerType" name="pickerType"> -->
							<select class="form-control basisDate " name="basisDate">
								<option value="settlementDay">청구발생일</option>
								<option value="settlementDoenDay">정산마감일</option>
								<option value="billingDeadMonth">청구마감월</option>
								<option value="payDeadMonth">지급마감월</option>
							</select>
						</div>
 							<div class="col-2  basisType settlementDay settlementDoenDay">
							 <div class="picker-wrap">
								<input type="text" id="settlementPicker" name="settlementPicker"  class="form-control range-datepicker"
									placeholder="기간선택"> <label for="range-datepicker">
								<i class="fas fa-calendar"></i></label>
							 </div>
							</div> 
							<div class="col-1 basisType billingDeadMonth payDeadMonth ">
						    <div class="picker-wrap">
						        <input type="text" class="form-control month-datepicker start" placeholder="시작월">    

						        <label for="range-datepicker"><i class="fas fa-calendar"></i></label>
						    </div> 
						     </div> 
							<div class="col-auto text-center basisType billingDeadMonth payDeadMonth ">
						    <p class="period-ico">~</p>
							</div>
							<div class="col-1 basisType billingDeadMonth payDeadMonth">
						    <div class="picker-wrap">
						        <input type="text" class="form-control month-datepicker end" placeholder="종료월">
						        <label for="range-datepicker"><i class="fas fa-calendar"></i></label>
							</div>
							</div>
						<div class="col-6  basisType buttonMonth">
							<button type="button" class="btn btn-white waves-effect datePicker dateRange 1mon" data-target-input="settlementPicker">최근1개월</button>
							<button type="button" class="btn btn-white waves-effect datePicker dateRange 6mon" data-target-input="settlementPicker">최근6개월</button>
							<button type="button" class="btn btn-white waves-effect datePicker dateRange 1year" data-target-input="settlementPicker">최근1년</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-2 text-right">
			<button type="button" name="searchBtn" class="btn btn-custom04 btn-rounded waves-effect waves-dark">조회</button>
		</div>
	</div>
</div>
<!-- End search -->

<!-- Begin result -->
<div class="card-box searchList ">

</div>

<script>
var monthStartPicker;
var monthEndPicker;

// 조회
$('button[name="searchBtn"]').on('click touch', function () {
   data.pageIndex = 1;
   searchList();
})

// 기간검색 1개월 
$('button.datePicker.1mon').on('click touch', function() {
   var elName = $(this).data('target-input');
   var valueList = getDateRange(elName, 1, 0);
   updateDateRangePicker(elName, valueList);
})

// 기간검색 6개월 
$('button.datePicker.6mon').on('click touch', function() {
   var elName = $(this).data('target-input');
   var valueList = getDateRange(elName, 6, 0);
   updateDateRangePicker(elName, valueList);
})

// 기간검색 1년 
$('button.datePicker.1year').on('click touch', function() {
   var elName = $(this).data('target-input');
   var valueList = getDateRange(elName, 0, 365);
   updateDateRangePicker(elName, valueList);
})

// 기간 범위
function getDateRange(_elName, _month, _day) {
   
   var from = new Date();
   var to   = new Date();
   
   var fromMonth = new Date(from.setMonth(from.getMonth() - _month));
   var fromDay   = new Date(fromMonth.setDate(fromMonth.getDate() - _day));
   
   return [fromDay, to]; 
}

// 날짜정보 업데이트 
function updateDateRangePicker(_elName, _value) {
	var startDate;
	var lastDate;
   
   if(_elName === 'settlementPicker') {
      if(_value.length === 2) {
    	  startDate = _value[0].setHours(0,0,0,0);;
    	  lastDate = _value[1].setHours(0,0,0,0);;
      } else if (_value.length === 1) {
    	  startDate = _value[0].setHours(0,0,0,0);;
    	  lastDate = _value[0].setHours(0,0,0,0);;
      } else {
    	  startDate = new Date().setHours(0,0,0,0);;
    	  lastDate = new Date().setHours(0,0,0,0);;
      }
      
      data.settlementStartDate = data.settlementDoenStartDate = startDate;;
      data.settlementEndDate = data.settlementDoenEndDate = lastDate;;
      
      settlementPicker.setDate([startDate, lastDate]);
   
      return;
   }
   
}

var settlementPicker;

function initServiceEvent() {
	updateStatus();
   settlementPicker = flatpickr($('#settlementPicker'), {
      mode : "range",
      locale: {
         rangeSeparator: ' - '
        },
        dateFormat: "Y.m.d",
      defaultDate : [
         data.settlementStartDate
         , data.settlementEndDate
      ], 
      onReady : function(selectedDates, dateStr, instance) {
         data.settlementStartDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
         if($('#settlementPicker').val().length === 10) {
            data.settlementEndDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
         } else {
            data.settlementEndDate = new Date(new Date(dateStr.substring(13, 23)).setHours(0,0,0,0));
            
         }
      },
      onChange : function(selectedDates, dateStr, instance) {
         data.settlementStartDate = data.settlementDoenStartDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
         if($('#settlementPicker').val().length === 10) {
            data.settlementEndDate = data.settlementDoenEndDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
         } else {
            data.settlementEndDate = data.settlementDoenEndDate = new Date(new Date(dateStr.substring(13, 23)).setHours(0,0,0,0));
         }
      }
   })
}

//정산 대기일 경우 정산발생일/입금완료일이 없으므로 picker 비활성화 
function updateStatus() {
	$('#settlementPicker').prop('disabled', null);
}

$(document).ready(function() {
	disabledSearchInput();
	
   initPicker();
   
   initServiceEvent();
   searchList();
});

function disabledSearchInput() {
	if ($('#searchType').val() == 'all') {
		$('#searchText').attr('disabled', 'disabled');
	} else {
		$('#searchText').removeAttr('disabled');
	}
}

// 검색어 콤보박스가 '전체'로 설정되어있으면 검색어 input disabled 처리
$('#searchType').on('change', function (_el) {
	disabledSearchInput();
});

//기간구분 선택
$('.basisDate').on('change', function(){
	toggleBasisType();
});

function toggleBasisType() {
	$('.basisType').addClass('d-none');

	data.basisDate = $('.basisDate').val() === undefined ? 'settlementDoenDay' : $('.basisDate').val(); 

	if(data.basisDate === 'settlementDay' || data.basisDate === 'settlementDoenDay') {
		$('.basisType.settlementDay').removeClass('d-none');
		$('.basisType.settlementDoenDay').removeClass('d-none');
		$('.basisType.buttonMonth').removeClass('d-none');
	} else if(data.basisDate === 'billingDeadMonth') {
		$('.basisType.billingDeadMonth').removeClass('d-none');
		$('.basisType.buttonMonth').addClass('d-none');
	} else if(data.basisDate === 'payDeadMonth') {
		$('.basisType.payDeadMonth').removeClass('d-none');
		$('.basisType.buttonMonth').addClass('d-none');
	}
}

function initPicker() {
   //일 기준
   datePicker = flatpickr($('.range-datepicker'), {
      mode : "range",
      locale: {
         rangeSeparator: ' - '
        },
        dateFormat: "Y.m.d",
      defaultDate : [
         data.dateStartDate
         , data.dateEndDate
      ], 
      onReady : function(selectedDates, dateStr, instance) {
         data.dateStartDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
         if($('.range-datepicker').val().length === 10) {
            data.dateEndDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
         } else {
            data.dateEndDate = new Date(new Date(dateStr.substring(13, 23)).setHours(0,0,0,0));
         }
      },
      onChange : function(selectedDates, dateStr, instance) {
         data.dateStartDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
         if($('.range-datepicker').val().length === 10) {
            data.dateEndDate = new Date(new Date(dateStr.substring(0, 10)).setHours(0,0,0,0));
         } else {
            data.dateEndDate = new Date(new Date(dateStr.substring(13, 23)).setHours(0,0,0,0));
         }
      }
      , onOpen: function(selectedDates, dateStr, instance){
      }
   });
   
   var starMonth = new Date(startDate).getTime(0,0,0,0);
   var endMonth  = new Date(new Date(new Date(yesterday)).setDate(1)).setHours(0,0,0,0);
   
   monthStartPicker = flatpickr($('.month-datepicker.start'), {
        plugins: [
             new monthSelectPlugin({
                shorthand: true,
                dateFormat: "Y.m",
                altFormat: "Y.m", 
                theme: "light"
             })
        ],
        defaultDate : [
			data.monthStartDate
      ],
      onReady : function(selectedDates, dateStr, instance) {
      	data.monthStartDate = dateStr;
      },
      onChange : function(selectedDates, dateStr, instance) {
        data.monthStartDate     = selectedDates[0];
           
       	var rangeStartDate = new Date(new Date(new Date(selectedDates[0]).setHours(0,0,0,0)).setDate(1)).addMonths(0);
    	var rangeEndDate = new Date(new Date(new Date(selectedDates[0]).setHours(0,0,0,0)).setDate(1)).addMonths(2);
    	
	    if(rangeStartDate < starMonth) {
			monthEndPicker.set('minDate', starMonth);
		} else {
			monthEndPicker.set('minDate', rangeStartDate);
		}
		
      },
      onOpen: function(selectedDates, dateStr, instance) {
      	monthStartPicker.set('minDate', startDate);
		monthStartPicker.set('maxDate', yesterday);
      }
   })
   
   monthEndPicker = flatpickr($('.month-datepicker.end'), {
      plugins: [
             new monthSelectPlugin({
                shorthand: true,
                dateFormat: "Y.m",
                altFormat: "Y.m", 
                theme: "light"
             })
      ],
      defaultDate : [
        	endMonth
      ], 
      onReady : function(selectedDates, dateStr, instance) {
           data.monthEndDate = dateStr;
        },
      onChange : function(selectedDates, dateStr, instance) {
    	    data.monthEndDate = selectedDates[0];
			
        	var rangeStartDate = new Date(new Date(new Date(selectedDates[0]).setHours(0,0,0,0)).setDate(1)).addMonths(-2);
        	var rangeEndDate = new Date(new Date(new Date(selectedDates[0]).setHours(0,0,0,0)).setDate(1)).addMonths(0);
        	
        	if(rangeStartDate < starMonth) {
        		monthStartPicker.set('minDate', starMonth);
        	} else {
        		monthStartPicker.set('minDate', rangeStartDate);
        	}
        	
        	if(rangeEndDate > endMonth) {
        		monthStartPicker.set('maxDate', endMonth);
        	} else {
        		monthStartPicker.set('maxDate', rangeEndDate);
        	}
    	   
      },
      onOpen: function(selectedDates, dateStr, instance) {
      	monthEndPicker.set('minDate', startDate);
      	monthEndPicker.set('maxDate', yesterday);
      }
   })
   
	monthStartPicker.set('minDate', startDate);
	monthStartPicker.set('maxDate', yesterday);
	
	monthEndPicker.set('minDate', startDate);
	monthEndPicker.set('maxDate', yesterday);
   
   
   toggleBasisType();
   
}

</script>
