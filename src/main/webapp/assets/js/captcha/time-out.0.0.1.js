/**
 * subject : 공통플렛폼 timeOut javaScript
 * author : look
 * default-time : 10:00 (10분 00초)
 * eventTimeEnd : 시간 종료 이벤트
 * eventTimeKeepGoing : 로그인 시간 연장 이벤트
 *
 * onClick="timeAddBtnClick()" : 시간 연장 클릭 이벤트 리스너
 */

$(document).ready(function(){
	var initMin;
	var initSec;

	var currMin; //분단위 변수
	var currSec; //초단위 변수
	var state = 'start'; //상태 정보(start | going | end)

	//초기화
	init = function(setMin, setSec){
		initMin = setTime(setMin, 'min');
		initSec = setTime(setSec);

		if(state != 'going'){
			makeHtml();
		}

		$('.curr_min').html(numAddZero(initMin));
		$('.curr_sec').html(numAddZero(initSec));
		$('.addBtn').css('cursor', 'pointer');

		timeSet();
	}

	setTime = function(time, isMin){
		if(time == '' || time ==null || time == undefined){
			if(isMin == 'min'){
				return '10';
			}else{
				return '00';
			}
		}else{
			return time;
		}
	}

	makeHtml = function(){
		/*
		var htmlRoot = $( ".time_out" );
		htmlRoot.append('<div class="curr_time">');
		htmlRoot.append('남은 시간 ');
		htmlRoot.append('<span class="curr_min">00</span> : ');
		htmlRoot.append('<span class="curr_sec">01</span>'   );
		htmlRoot.append('<span class="addBtn" onClick="timeAddBtnClick()"> 연장</span>'   );
		htmlRoot.append('</div>'   );
		*/
	}

	//time out 인터벌
	timeOut = setInterval(function() {
		secMinus();

		//interval stop
		if(state == 'end'){
			eventTimeEnd();
			clearInterval(timeOut);
		}

		changeHtml();
	}, 1000);

	//시간 종료 이벤트
	eventTimeEnd = function(){
		alert('세션 시간이 종료 되어 로그아웃 되었습니다.');
		postEventEndAjax();
	}

	changeHtml = function(){
		var minHtml = numAddZero(currMin);
		var secHtml = numAddZero(currSec);

		$('.curr_min').html(minHtml);
		$('.curr_sec').html(secHtml);
	}

	numAddZero = function(num){
		var numStr = num+'';

		if(numStr.length > 1){
			return num
		}else{
			return '0' + num;
		}
	}

	// 분단위 빼기
	minMinus = function(){
		if(currMin != 0){
			currMin = currMin-1;
		}
	}

	// 초단위 빼기
	secMinus = function(){
		if(currMin == 0 && currSec == 0){
			state = 'end';
		}else{
			state = 'ongoing';
			if(currSec == 0 ){
				minMinus();
				currSec = 59; //TODO 운영반영 삭제
			}else{
				currSec = currSec-1;
			}
		}
	}

	timeSet = function(){
		currMin = numSet($('.curr_min').html());
		currSec = numSet($('.curr_sec').html());
	}

	numSet = function(str){
		return str * 1;
	}

	isZero = function(currTime){
		if(currTime == 0){
			return true;
		}else{
			return false;
		}
	}

	showLog = function(){
		console.log("show log :::: Min :::: " + currMin);
		console.log("show log :::: Sce :::: " + currSec);
		console.log("initMin ::::: " + initMin);
		console.log("initSec ::::: " + initSec);
		console.log("state :::::: " + state);
	}

	// 연장 클릭 이벤트
	timeAddBtnClick = function(){
		state = 'going';
		eventTimeKeepGoing();
		init(initMin, initSec);
	}

	//TODO 시간 종료 서버 연결
	postEventEndAjax = function(){
		ktCncSNSLoginUtil.logout();
		//$(".btn_logout").click();
		/*
		var url = "/v1/user/logout";
		var data = {};

		$.ajax({
			  type: 'POST',
			  url:  url,
			  data: data,
			  dataType: 'application/json',
			  success: function(obj){
				  //console.log('postEventEndAjax success');
			  }
		});
		*/
	}

	//TODO 초기화 서버 통신 연결
	eventTimeKeepGoing = function(){
		var url = "/token/extend";
		var headerParam = { "Authorization": "Bearer " + authToken };
		var data = null;

		$.ajax({
			type: 'POST',
			url:  url,
			data: data,
			headers: headerParam,
			timeout: 500,
			dataType: 'application/json',
			success: function(obj){
				alert(obj);
			}
		});
	}
});
