function hasErrorMap(data, showMessage) {
	if (typeof data == 'string' || data instanceof String) {
		try {
			var jsonData = $.parseJSON(data);
			return processErrorMap(jsonData, showMessage);
		} catch (E) {
			return false;
		}
	} else {
		return processErrorMap(data, showMessage);
	}
}

function processErrorMap(data, showMessage) {
	if (data.error != null) {
		if (data.error.errorCode == '0') return false;
		if (showMessage) {
			showError(data.error.errorMsg);
		}
		return true;
	}
	return false;
}

function showError(message) {
	alert(message);
}

// initSwitchery
function initSwitchery(_size) {

	$('[data-plugin="switchery"]').each(function(e,a){

	console.log($(this)[0])
	console.log($(this).data())
		new Switchery($(this)[0],$(this).data())
	});

	if(_size != null) {
		$('span.switchery').addClass('switchery-' + _size);
	}

}

function initSwitcheryEl(_el, _size) {

	new Switchery($(_el)[0],$(_el).data());

	if(_size != null) {
		$('span.switchery').addClass('switchery-' + _size);
	}

}

function getTextLength(str) {
    let totalByte=0;
    for(let i=0; i<str.length; i++){
    	const each_char = str.charAt(i);
        const uni_char = escape(each_char) //유니코드 형식으로 변환
        if(uni_char.length>4){
        	// 한글 : 2Byte
            totalByte += 2;
        }else{
        	// 영문,숫자,특수문자 : 1Byte
            totalByte += 1;
        }
    }
    return totalByte;
}


String.prototype.format = function () {
  var args = arguments;
  return this.replace(/\{\{|\}\}|\{(\d+)\}/g, function (m, n) {
    if (m == "{{") { return "{"; }
    if (m == "}}") { return "}"; }
    return (args[n] != undefined ) ? args[n] : '';
  });
};

String.prototype.date = function(){
	var temp = this;
	if(temp == undefined ) return '';

	var formatDate = '';
	if(temp.length == 8){
		formatDate = temp.replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3');
	}else if(temp.length == 12){
		formatDate = temp.replace(/(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})/, '$1-$2-$3 $4:$5');
	}
	return formatDate;
}

String.prototype.htmlChars = function() { 
    var str = ((this.replaceAll('&', '&amp;')).replaceAll("'", '&#039;').replaceAll('"', '&quot;')).replaceAll('\'', '&#39;'); 
    return (str.replaceAll('<', '&lt;')).replaceAll('>', '&gt;'); 
 } 
 
  String.prototype.charsHtml = function() { 
    var str = ((this.replaceAll('&amp;', '&')).replaceAll('&#039;', "'").replaceAll('&quot;', '"')).replaceAll('&#39;', '\'').replaceAll('&#61;', '='); 
    return (str.replaceAll('&lt;', '<')).replaceAll('&gt;', '>'); 
 } 

Date.prototype.format = function(f) {
    if (!this.valueOf()) return " ";

    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    var d = this;

    return f.replace(/(yyyy|yy|MM|M2|dd|d2|E|hh|mm|ss|a\/p)/gi, function($1) {
        switch ($1) {
            case "yyyy": return d.getFullYear();
            case "yy": return (d.getFullYear() % 1000).zf(2);
            case "MM": return (d.getMonth() + 1).zf(2);
            case "M2": return (d.getMonth() + 1);
            case "dd": return d.getDate().zf(2);
            case "d2": return d.getDate();
            case "E": return weekName[d.getDay()];
            case "HH": return d.getHours().zf(2);
            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
            case "mm": return d.getMinutes().zf(2);
            case "ss": return d.getSeconds().zf(2);
            case "a/p": return d.getHours() < 12 ? "AM" : "PM";
            default: return $1;
        }
    });
};

String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
Number.prototype.zf = function(len){return this.toString().zf(len);};

Date.prototype.addDays = function (num) {
    var value = this.valueOf();
    value += 86400000 * num;
    return new Date(value);
}

Date.prototype.addSeconds = function (num) {
    var value = this.valueOf();
    value += 1000 * num;
    return new Date(value);
}

Date.prototype.addMinutes = function (num) {
    var value = this.valueOf();
    value += 60000 * num;
    return new Date(value);
}

Date.prototype.addHours = function (num) {
    var value = this.valueOf();
    value += 3600000 * num;
    return new Date(value);
}

Date.isLeapYear = function (year) {
    return (((year % 4 === 0) && (year % 100 !== 0)) || (year % 400 === 0));
};

Date.getDaysInMonth = function (year, month) {
    return [31, (Date.isLeapYear(year) ? 29 : 28), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][month];
};

Date.prototype.isLeapYear = function () {
    return Date.isLeapYear(this.getFullYear());
};

Date.prototype.getDaysInMonth = function () {
    return Date.getDaysInMonth(this.getFullYear(), this.getMonth());
};

Date.prototype.addMonths = function (value) {
    var n = this.getDate();
    this.setDate(1);
    this.setMonth(this.getMonth() + value);
    this.setDate(Math.min(n, this.getDaysInMonth()));
    return this;
};

function onlyNumber(event){
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
		return;
	else
		return false;
}

function removeChar(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;

	if (keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39) {
		return;
	} else {
		//숫자와 소수점만 입력가능
		event.target.value = event.target.value.replace(/[^-\.0-9]/g, "");
	}
}

//숫자 타입에서 쓸 수 있도록 format() 함수 추가
Number.prototype.comma = function(){
    if(this==0) return 0;
    var reg = /(^[+-]?\d+)(\d{3})/;
    var n = (this + '');
    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
    return n;
};

function deJsonString(_queryString) {
		var data = JSON.parse(decodeURIComponent(_queryString));
		return data;
	}
	
	
function updateDateRangePicker(_elName, _value) {
	//회원가입일 OR 작성일
	if(_elName === 'test01') {
		data.test01StartDate = _value[0];
		data.test01EndDate = _value[1];
		test01Datepicker.setDate([data.test01StartDate, data.test01EndDate]);
		return;
	}
	
	//최종이용일
	if(_elName === 'test02') {
		data.test02StartDate = _value[0];
		data.test02EndDate = _value[1];
		test02Datepicker.setDate([data.test02StartDate, data.test02EndDate]);
		return;
	}
	
	if(_elName === 'search') {
		data.startDate = _value[0];
		data.endDate = _value[1];
		searchDatepicker.setDate([data.startDate, data.endDate]);
		return;
	}
	
	//회원가입일
	if(_elName === 'joinDate') {
		data.joinStartDate = _value[0];
		data.joinEndDate = _value[1];
		joinDatepicker.setDate([data.joinStartDate, data.joinEndDate]);
		return;
	}
	
	//최종이용일
	if(_elName === 'lastUseDate') {
		data.lastUseStartDate = _value[0];
		data.lastUseEndDate = _value[1];
		lastUseDatepicker.setDate([data.lastUseStartDate, data.lastUseEndDate]);
		return;
	}
}	

function checkTelNum(phone){
	var exptext = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
//	var exptext = /^\s*(?:\+?(\d{1,3}))?([-. (]*(\d{3})[-. )]*)?((\d{3})[-. ]*(\d{2,4})(?:[-.x ]*(\d+))?)\s*$/gm;
	if(exptext.test(phone)==false){
        return false;
    }
	
    return true;
}

function checkEmail(email){
	var exptext = /^[0-9a-zA-Z][0-9a-zA-Z\_\-\.\+]+[0-9a-zA-Z]@[0-9a-zA-Z][0-9a-zA-Z\_\-]*[0-9a-zA-Z](\.[a-zA-Z]{2,6}){1,2}$/;
	
	if(exptext.test(email) == false) {            
            return false;
	}
	
	return true;
}

//첨부파일명 미리보기
function previewFileName(_input, _fileList) {
	if(_input.files && _input.files[0]) {
		var str = '';
		str += '<div class="alert alert-light file-dismissible bg-light text-dark border-0 fade show ml-1 mb-0 mt-2" role="alert" id="alertFile">';
        str += '<button type="button" class="close" data-index="{0}">';
        str += '<span aria-hidden="true">&times;</span>';
        str += '</button>';
        str += '<span id="fileName">{1}</span>';
        str += '</div>';
		
		var result = '';
		var size = _input.files.length;
		for(var i=0; i< size; i++){
			result+= str.format(i, _input.files[i].name)
		}
		_fileList.html(result);
	}
}

//첨부파일명 미리보기 초기화
function clearFileName(_input, _index, _fileList) {
	//console.log(_input[0].files)
	//console.log(_index)
	var dt = new DataTransfer()
    var files = _input[0].files
    for (var i = 0; i < files.length; i++) {
        var file = files[i]
        if (_index !== i) dt.items.add(file) 
    }
	_input[0].files = dt.files
	_fileList.find('.alert').eq(_index).remove()
}


// 숫자 input
// 숫자
function filterNumber(_value) {
	_value = _value.replace(/[^0-9]/g,'');
	_value = _value.replace(/,/g,'');
	
	if(_value === '') return 0;
	return _value;
}

// 텍스트 > 숫자값 comma (,) 처리 
function filterNumberEl(_el, _maxLength) {
	$(_el).on('keyup', function() {
		var numVal = filterNumber($(this).val());
		$(this).val(Number(numVal).comma());
	})
	
	if(_maxLength !== null) {
		// comma를 제외한 숫자만의 길이 + comma 길이 
		$(_el).attr('maxlength', _maxLength + (_maxLength/3 -1));
		// $(_el).attr('maxlength', null);
	}
}

// 비밀번호 정책
function checkPasswordType(id) {
	// init
	cData.loginPwFlag = false;
	$('p.loginPw').addClass('d-none');
	
	var typnCnt = 0;
	var pw = $('#loginPw').val();
	
	// ID와 4자리이상 동일한지 체크
	var tmp = "";
	var cnt = 0;
	for(i=0; i<id.length-2; i++){
		tmp = id.charAt(i) + id.charAt(i+1) + id.charAt(i+2) + id.charAt(i+3);
		
		if(pw.indexOf(tmp) > -1){
			cnt = cnt + 1;
		}
	}
	// 연속된 문자/숫자 체크
	var continuous = chkPwContinue(pw);
	
	if(cnt > 0) {
		cData.loginPwFlag = false;
		var str = 'ID와 4자리 이상 동일한 비밀번호는 사용할 수 없습니다.';
		$('p.loginPw-invalid').html(str).removeClass('d-none');
		return;
	} else if(continuous || /(\w)\1\1\1/.test(pw)) {
		cData.loginPwFlag = false;
        var str = '4자리 이상 연속되거나 중복되는 숫자/문자는 비밀번호에 포함될 수 없습니다.';
		$('p.loginPw-invalid').html(str).removeClass('d-none');
		return;
    } else if(pw.length < 8) {
		cData.loginPwFlag = false;
		var str = '8자리 이상/영문 대소문자, 숫자, 특수문자 중 3종류를 포함해 입력해주세요.';
		$('p.loginPw-invalid').html(str).removeClass('d-none');
		return;
	}

	var flagEng = false;
	var flagNum = false;
	var flagSC = false;

	// 대소문자
	if(/[A-Z]/g.test($('#loginPw').val()) || /[a-z]/g.test($('#loginPw').val())) {
		typnCnt++;
		flagEng = true;
	}
	// 숫자
	if(/\d/g.test($('#loginPw').val())) {
		typnCnt++;
		flagNum = true;
	}
	// 특수문자
	if(/[-\'/`~!#*$@_%+=.,^&(){}[\]|;:\"<>?\\]/g.test($('#loginPw').val())) {
		typnCnt++;
		flagSC = true;
	}

	if(typnCnt > 2) {
		cData.loginPwFlag = true;
		$('p.loginPw-avail').removeClass('d-none');
		return;
	} else {
		cData.loginPwFlag = false;
		var temp ='';
		if(flagEng == false){
			temp += '영문 대문자 또는 소문자'
		}

		if(flagNum == false){
			if(temp.length > 0) temp += ' 또는 '
			temp += '숫자'
		}

		if(flagSC == false){
			if(temp.length > 0) temp += ' 또는 '
			temp += '특수문자'
		}

		var str = '8자리 이상/영문 대소문자, 숫자, 특수문자 중 3종류를 포함해 입력해주세요. ({0}을/를 포함하세요.)'.format(temp);
		$('p.loginPw-invalid').html(str).removeClass('d-none');
		return;
	}
}

// 연속된 문자/숫자 체크(4자리)
function chkPwContinue(pw){
	var cnt1 = 0;
	var cnt2 = 0;
	var tmp0 = "";
	var tmp1 = "";
	var tmp2 = "";
	var tmp3 = "";

    for (var i=0; i<pw.length; i++) {
        tmp0 = pw.charAt(i);
        tmp1 = pw.charAt(i+1);
        tmp2 = pw.charAt(i+2);
        tmp3 = pw.charAt(i+3);

        if(tmp0.charCodeAt(0)-tmp1.charCodeAt(0) == 1
        && tmp1.charCodeAt(0)-tmp2.charCodeAt(0) == 1
        && tmp2.charCodeAt(0)-tmp3.charCodeAt(0) == 1) {
			cnt1 = cnt1 + 1;
        }

		if(tmp0.charCodeAt(0)-tmp1.charCodeAt(0) == -1
		&& tmp1.charCodeAt(0)-tmp2.charCodeAt(0) == -1
		&& tmp2.charCodeAt(0)-tmp3.charCodeAt(0) == -1) {
			cnt2 = cnt2 + 1;
		}
    }

    if(cnt1 > 0 || cnt2 > 0) {
		return true;
    } else {
		return false;
    }
}

function fnCheckByteTitle(_max, _obj){
    const maxByte = _max; //최대 100바이트
    const text_val = _obj.value; //입력한 문자
    const text_len = text_val.length; //입력한 문자수
    
    let totalByte=0;
    for(let i=0; i<text_len; i++){
    	const each_char = text_val.charAt(i);
        const uni_char = escape(each_char) //유니코드 형식으로 변환
        if(uni_char.length>4){
        	// 한글 : 2Byte
            totalByte += 2;
        }else{
        	// 영문,숫자,특수문자 : 1Byte
            totalByte += 1;
        }
    }

	if(totalByte>maxByte){
		alert('최대 '+_max+'Byte까지만 입력가능합니다.');
    }
}

function fnCheckByte(_max, _obj){
    const maxByte = _max; //최대 100바이트
    const text_val = _obj.value; //입력한 문자
    const text_len = text_val.length; //입력한 문자수
    
    let totalByte=0;
    for(let i=0; i<text_len; i++){
    	const each_char = text_val.charAt(i);
        const uni_char = escape(each_char) //유니코드 형식으로 변환
        if(uni_char.length>4){
        	// 한글 : 2Byte
            totalByte += 2;
        }else{
        	// 영문,숫자,특수문자 : 1Byte
            totalByte += 1;
        }
    }
    
	if(totalByte>maxByte){
		alert('최대 '+_max+'Byte까지만 입력가능합니다.');
		$(_obj).val(cutByLen(text_val, _max));
		
    	document.getElementById("nowByte").innerText = maxByte;
        document.getElementById("nowByte").style.color = "red";
    }else{
    	document.getElementById("nowByte").innerText = totalByte;
        document.getElementById("nowByte").style.color = "green";
    }
}

//byte만큼 자르기
 function cutByLen(str, maxByte) {
	for(b=i=0;c=str.charCodeAt(i);) {
		b+=c>>7?2:1;
		if (b > maxByte) break;
		i++;
	}

	return str.substring(0,i);
}



function isEmptyObject(param) {
  return Object.keys(param).length === 0;
}

function base64ImageToBlob(str) {
  // extract content type and base64 payload from original string
  var pos = str.indexOf(';base64,');
  var type = str.substring(5, pos);
  var b64 = str.substr(pos + 8);

  // decode base64
  var imageContent = atob(b64);

  // create an ArrayBuffer and a view (as unsigned 8-bit)
  var buffer = new ArrayBuffer(imageContent.length);
  var view = new Uint8Array(buffer);

  // fill the view, using the decoded base64
  for(var n = 0; n < imageContent.length; n++) {
    view[n] = imageContent.charCodeAt(n);
  }

  // convert ArrayBuffer to Blob
  var blob = new Blob([buffer], { type: type });

  return blob;
}


//input number maxLength 설정
function maxLengthCheck(obj){
	//console.log("maxLength:", obj.maxLength);
	//console.log("length:", obj.value.length);
	
	if (obj.value.length > obj.maxLength) {
		obj.value = obj.value.slice(0, obj.maxLength);
	}
}

function uncomma(str) {
    str = "" + str.replace(/,/gi, ''); // 콤마 제거 
    str = str.replace(/(^\s*)|(\s*$)/g, ""); // trim()공백,문자열 제거 
    return str;//문자열을 숫자로 반환
}

function comma(obj) {
    var regx = new RegExp(/(-?\d+)(\d{3})/);
    var bExists = obj.indexOf(".", 0);//0번째부터 .을 찾는다.
    var strArr = obj.split('.');
    while (regx.test(strArr[0])) {//문자열에 정규식 특수문자가 포함되어 있는지 체크
        //정수 부분에만 콤마 달기 
        strArr[0] = strArr[0].replace(regx, "$1,$2");//콤마추가하기
    }
    if (bExists > -1) {
        //. 소수점 문자열이 발견되지 않을 경우 -1 반환
        obj = strArr[0] + "." + strArr[1].substring(0,2);
    } else { 
        //정수만 있을경우 //소수점 문자열 존재하면 양수 반환 
        obj = strArr[0];
    }
 
    console.log(obj);
    return obj;//문자열 반환
}
