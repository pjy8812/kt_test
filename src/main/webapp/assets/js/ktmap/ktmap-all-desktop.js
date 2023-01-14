/*
 * KT Map JavaScript API v3.0.44
 * 
 * Copyright (c) 2013-2018 kt corp. All rights reserved.
 * 
 * This is a proprietary software of kt corp, and you may not use this software
 * except in compliance with license agreement with kt corp. Any redistribution
 * or use of this software, with or without modification shall be strictly
 * prohibited without prior written approval of kt corp, and the copyright
 * notice above does not evidence any actual or intended publication of such
 * software.
 */
document.write('<style type="text/css">.ollehmap *,.ollehmap :after,.ollehmap :before{box-sizing:content-box;-webkit-box-sizing:content-box;-moz-box-sizing:content-box}.ollehmap{position:relative;overflow:hidden;padding:0;margin:0;border:none;background-color:#EEE;-webkit-user-select:none;-khtml-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none}.ollehmap-noevent{pointer-events:none!important}.ollehmap-event{pointer-events:auto}.ollehmap-drag .ollehmap-info,.ollehmap-drag .ollehmap-info-shadow{opacity:.3}.ollehmap-dragging{z-index:357913941!important}.ollehmap-vector{pointer-events:visiblePainted}.ollehmap-info{position:absolute}.ollehmap-info-defaultStyle{font-family:Dotum,Baekmuk Dotum,Undotum,Apple Gothic,Latin font,sans-serif;font-size:12px;font-weight:400;line-height:normal;font-style:normal}.ollehmap-info-area{cursor:default;position:relative;left:0;top:0;background-color:#fff;border:2px solid #474747}.ollehmap-info-content{cursor:auto;position:absolute;min-height:60px;min-width:300px;max-height:500px;z-index:9999;-webkit-user-select:text;-khtml-user-select:text;-moz-user-select:text;-ms-user-select:text;user-select:text}.ollehmap-info-content-overflow{overflow:auto;-webkit-overflow-scrolling:auto}.ollehmap-info-tip{width:16px;height:26px;overflow:hidden;z-index:1;position:absolute}.ollehmap-info-tip-img{position:absolute;border:0;padding:0;margin:0;top:-348px;left:0;z-index:auto}.ollehmap-info-bottom{position:absolute;left:0;top:0;border:2px solid #474747}.ollehmap-info-shadow{position:absolute}.ollehmap-info-shadow>div{overflow:hidden;position:absolute;z-index:1;-webkit-user-select:none;-khtml-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none}.ollehmap-info-shadow img{position:absolute;-webkit-user-select:none;-khtml-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;border:0;padding:0;margin:0}.ollehmap-info-shadow-topleft,.ollehmap-info-shadow-topright{top:0;width:70px;height:10px}.ollehmap-info-shadow-topleft>img{left:-296px;top:0}.ollehmap-info-shadow-topright>img{left:-1036px;top:0}.ollehmap-info-shadow-bottomleft,.ollehmap-info-shadow-bottomright{width:70px;height:30px}.ollehmap-info-shadow-bottomleft>img{left:12px;top:-315px}.ollehmap-info-shadow-bottomright>img{left:-716px;top:-315px}.ollehmap-info-shadow-bottomtip{width:40px;height:30px}.ollehmap-info-shadow-bottomtip>img{left:-356px;top:-315px}.ollehmap-info-shadow-topcenter{height:10px}.ollehmap-info-shadow-topcenter>img{left:-366px;top:0}.ollehmap-info-shadow-centerleft>img{top:-10px}.ollehmap-info-shadow-centerright>img{top:-10px}.ollehmap-info-shadow-bottomleftoftip,.ollehmap-info-shadow-bottomrightoftip{height:30px}.ollehmap-info-shadow-bottomleftoftip>img,.ollehmap-info-shadow-bottomrightoftip>img{left:-396px;top:-315px}.ollehmap-info-shadow-center>img{left:-366px;top:-10px}.ollehmap-info-tooltip-area{position:relative;background-color:#fff;left:0;top:0;border:1px solid #555;border-radius:2px}.ollehmap-info-tooltip-data{font-family:Dotum,Baekmuk Dotum,Undotum,Apple Gothic,Latin font,sans-serif;font-size:13px;font-weight:700;line-height:normal;font-style:normal}.ollehmap-corner-container{position:relative}.ollehmap-corner-container-horizontal{display:inline-block}.ollehmap-corner{position:absolute;z-index:1}.ollehmap-corner-area{position:relative;display:inline-block}.ollehmap-control-rightAlign{margin-left:auto;margin-right:0}.ollehmap-copyright-control{color:#000;font:700 12px/1.5 Dotum,Arial,Helvetica,sans-serif;text-shadow:-1px 0 white,0 1px white,1px 0 white,0 -1px #fff;display:inline}.ollehmap-logo-control,.ollehmap-logo-control.imagery{background-position:-78px -316px;width:22px;height:22px;margin:0 8px 12px 2px}.ollehmap-logo-control.imagery{background-position:-100px -316px}.ollehmap-maptype-control-expandtype{padding:6px;margin:6px;box-shadow:0 1px 7px #999;border:1px solid #000;background-color:#fff;border-radius:8px;-moz-border-radius:8px;font:12px/1.5 "Helvetica Neue",Arial,Helvetica,sans-serif;color:#000;opacity:.8}.ollehmap-maptype-control-expandtype:hover{opacity:1}.ollehmap-maptype-control-expandtype .ollehmap-maptype-control-toggle{display:block;width:27px;height:27px}.ollehmap-maptype-control-expanded .ollehmap-maptype-control-toggle,.ollehmap-maptype-control-expandtype .ollehmap-maptype-control-list{display:none}.ollehmap-maptype-control-expanded .ollehmap-maptype-control-list{display:block}.ollehmap-maptype-control-expanded .ollehmap-maptype-control-separator{height:0;border-top:1px solid #000;margin:5px -6px}.ollehmap-scale-control{background-repeat:no-repeat;background-position:bottom;color:#000;font:11px Dotum,Arial,Helvetica,sans-serif;font-weight:700;text-shadow:-1px 0 white,0 1px white,1px 0 white,0 -1px #fff;text-align:center;margin-bottom:12px}.ollehmap-scale-image{width:46px;height:8px;border:2px solid #000;border-top:none;margin-top:-4px}.ollehmap-scale-image.imagery{border-color:#fff}.ollehmap-zoom-control{position:relative;width:26px}.ollehmap-zoom-control .highlighted{border:1px dashed red}.ollehmap-hidden{display:none!important}.ollehmap-traffic-control{opacity:.8;padding:6px;margin:6px;box-shadow:gray 0 1px 7px;background-color:#fff;border-radius:8px;font-size:11px;font-family:Dotum,sans-serif;letter-spacing:-1px;text-align:left}.ollehmap-traffic-control .imgDiv{height:26px}.ollehmap-traffic-control:hover{opacity:1}.ollehmap-traffic-control .tooltip{position:absolute;top:50px;width:142px}.ollehmap-traffic-control h1{color:#1065ac;font-size:11px;margin:6px}.ollehmap-traffic-control ul{padding:5px;margin:5px 0;list-style-position:inside}.ollehmap-traffic-control li{line-height:15px}.ollehmap-traffic-control .trafficbar{width:55px;height:8px;display:inline-block;padding:1px 0}.ollehmap-traffic-control .trafficbar:hover{padding:0;width:53px;border:1px solid #444}.control-zoombar-active{background-position:0 0;width:26px;height:180px}.control-zoombar-deactive{background-position:-26px 0;width:26px;height:180px}.control-traffic-info{background-position:0 -180px;width:142px;height:63px}.control-pan{background-position:-52px 0;width:60px;height:63px}.control-zoomout{background-position:-112px 0;width:26px;height:26px}.control-zoomin{background-position:-112px -26px;width:26px;height:26px}.control-distance-selected{background-position:-112px -52px;width:26px;height:25px}.control-distance-out{background-position:-52px -63px;width:26px;height:25px}.control-shape-out{background-position:-78px -63px;width:26px;height:25px}.control-shape-selected{background-position:-104px -77px;width:26px;height:25px}.control-change:hover{background-position:-52px -88px;width:26px;height:24px}.control-change{background-position:-78px -88px;width:26px;height:24px}.control-roadmap-out{background-position:-52px -112px;width:55px;height:22px}.control-roadmap-selected{background-position:-52px -156px;width:55px;height:22px}.control-hybrid-out{background-position:0 -265px;width:75px;height:22px}.control-hybrid-selected{background-position:-52px -134px;width:75px;height:22px}.control-satellite-out{background-position:0 -243px;width:55px;height:22px}.control-satellite-selected{background-position:-55px -243px;width:55px;height:22px}.control-engmap-out{background-position:0 -335px;width:55px;height:22px}.control-engmap-selected{background-position:-55px -335px;width:55px;height:22px}.control-measure-distance-start{background-position:-75px -265px;width:37px;height:21px}.control-measure-area-delete{background-position:-107px -112px;width:18px;height:17px}.control-measure-distance-delete{background-position:-107px -156px;width:18px;height:17px}.control-measure-redmouse{background-position:-112px -254px;width:11px;height:16px}.control-measure-bluemouse{background-position:-124px -254px;width:11px;height:16px}.control-level1{background-position:-75px -286px;width:39px;height:15px}.control-level5{background-position:0 -287px;width:39px;height:15px}.control-level3{background-position:-39px -301px;width:39px;height:15px}.control-level13{background-position:-78px -301px;width:39px;height:15px}.control-level11{background-position:0 -302px;width:39px;height:15px}.control-level8{background-position:-39px -316px;width:39px;height:15px}.control-panleft{background-position:-104px -63px;width:8px;height:13px}.control-panright{background-position:-130px -77px;width:8px;height:13px}.control-panleft:hover{background-position:-130px -90px;width:8px;height:13px}.control-panright:hover{background-position:-125px -112px;width:9px;height:12px}.control-area-icon{background-position:-127px -134px;width:11px;height:11px}.control-distance-icon{background-position:-127px -145px;width:11px;height:11px}.control-zoomslider{background-position:-110px -243px;width:20px;height:11px}.control-scale{background-position:-78px -332px;width:54px;height:10px}.control-panup:hover{background-position:-125px -156px;width:12px;height:10px}.control-panup{background-position:-125px -166px;width:12px;height:10px}.control-pandown:hover{background-position:-125px -124px;width:12px;height:9px}.control-pandown{background-position:-130px -243px;width:12px;height:9px}.control-traffic-bullet{background-position:-138px 0;width:4px;height:1px}.control-gauge{background-position:-130px -103px;width:8px;height:1px}.infowin-shadow{background-position:0 0;width:1068px;height:347px}.infowin-tip{background-position:0 -347px;width:18px;height:25px}.infowin-close{background-position:-18px -347px;width:13px;height:13px}.olleh-maps-inline{display:inline-block;margin-left:3px}.ollehmap-measure{background:#fff;white-space:nowrap;width:auto;border:1px solid;position:absolute;font-family:dotum}.ollehmap-measure strong{color:#df2428;font-weight:700}.ollehmap-measure-areaInfo{padding:8px;font-size:11px;border:1px solid #555;background:#F7F7F7;color:#333;white-space:normal;width:110px;margin-top:-63px;margin-left:30px}.ollehmap-measure-finalAreaInfo{padding:10px;font-size:12px;font-weight:700;border:1px solid;color:#333;margin-top:-49px;margin-left:30px}.ollehmap-measure-pointStart{border:1px solid #BC1437;color:#fff;background:#E02428;font-size:12px;font-weight:700;padding:5px}.ollehmap-measure-pointInfo{border:1px solid #DF2428;color:#333;background:#F9F9F9;font-size:12px;font-weight:400;padding:5px}.ollehmap-measure-pointDetail{font-size:12px;border:1px solid #555;padding:10px 10px 55px;color:#333;width:130px;margin-top:-135px;margin-left:30px}.ollehmap-measure-pointDetail1{float:left;clear:left;width:60px;font-weight:700}.ollehmap-measure-pointDetail2{float:left;width:70px;font-weight:700}.ollehmap-measure-finish{padding:8px 19px;background:#F7F7F7;border-top:1px solid #DBDBDB;position:absolute;left:0;bottom:0;right:0;font-size:11px;white-space:normal}</style><style type="text/css">.ollehmap{cursor:default}.ollehmap-boxzoom{position:absolute;background-color:#fff;opacity:.5;border:2px dotted red;width:0;height:0}.ollehmap-transparent{background-color:#fff;opacity:0}.ollehmap-control-clickable{cursor:pointer}.ollehmap-info-close{position:absolute;width:14px;height:14px;overflow:hidden;right:18px;top:13px;z-index:10000;cursor:pointer}.ollehmap-info-close-img{position:absolute;-webkit-user-select:none;-khtml-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;border:0;padding:0;margin:0;top:-346px;left:-51px}</style><!--[if lte IE 8]><style type="text/css">.ollehmap-vml{behavior:url(#default#VML);position:absolute}.ollehmap-boxzoom{-ms-filter:"alpha(Opacity=50)";filter:alpha(opacity=50)}.ollehmap-transparent{-ms-filter:"alpha(Opacity=0)";filter:alpha(opacity=0)}.ollehmap-corner-area{margin:1px}.ollehmap-maptype-control-expandtype>form{height:100%;padding:0;margin:0}.ollehmap-measure-pointDetail{width:135px}.ollehmap-measure-areaInfo{width:120px}</style><![endif]-->');
!function (GLOBAL) {
  if (!Date.now) {
    Date.now = function () {
      return +(new Date);
    };
  }
  
  if (!Function.prototype.bind) {
    Function.prototype.bind = function (oThis) {
      if (typeof this !== 'function') {
        throw new TypeError('Bind must be called on a function');
      }
      
      var aArgs = Array.prototype.slice.call(arguments, 1);
      var fToBind = this;
      var fNOP = function () {};
      var fBound = function () {
        return fToBind.apply(this instanceof fNOP && oThis ? this : oThis, 
            aArgs.concat(Array.prototype.slice.call(arguments)));
      };
      fNOP.prototype = this.prototype;
      fBound.prototype = new fNOP();
      return fBound;
    };
  }
  
  if (!GLOBAL.requestAnimationFrame) {
    GLOBAL.requestAnimationFrame = GLOBAL.webkitRequestAnimationFrame
      || GLOBAL.mozRequestAnimationFrame
      || GLOBAL.msRequestAnimationFrame
      || GLOBAL.oRequestAnimationFrame;
  }

  if (!GLOBAL.cancelAnimationFrame) {
    GLOBAL.cancelAnimationFrame = GLOBAL.cancelRequestAnimationFrame
      || GLOBAL.webkitCancelAnimationFrame
      || GLOBAL.webkitCancelRequestAnimationFrame
      || GLOBAL.mozCancelAnimationFrame
      || GLOBAL.mozCancelRequestAnimationFrame
      || GLOBAL.msCancelAnimationFrame
      || GLOBAL.msCancelRequestAnimationFrame
      || GLOBAL.oCancelAnimationFrame
      || GLOBAL.oCancelRequestAnimationFrame;
  }
  
  if (!GLOBAL.requestAnimationFrame || !GLOBAL.cancelAnimationFrame) {
    GLOBAL.requestAnimationFrame = function (callback) {
      return GLOBAL.setTimeout(callback.bind(undefined, +Date.now()), 17);
    };
    GLOBAL.cancelAnimationFrame = function (requestid) {
      window.clearTimeout(requestid);
    };
  }

} (window);/**
 * @name olleh Maps
 * @version 3
 * @author KT
 * @copyright (c) 2013 KT Corp.
 * @fileoverview
 */
!function (GLOBAL) {
  
  var indexOf = [].indexOf || function(elem) { // ie 9이하 support하기 위함.
    for (var i = 0, len = this.length ; i < len; i++ ) {
      if ( this[i] === elem ) return i;
    }
    return -1;
  };
  
  // Mapping of normalized type names for olleh.maps.typeOf()
  var _OBJ2TYPE = {
    '[object Boolean]'  : 'boolean',
    '[object Number]'   : 'number',
    '[object String]'   : 'string',
    '[object Function]' : 'function',
    '[object Object]'   : 'object',
    '[object Array]'    : 'array',
    '[object Date]'     : 'date',
    '[object RegExp]'   : 'regexp',
    '[object Error]'    : 'error'
  };
  
  if (!GLOBAL.olleh) {
    GLOBAL.olleh = {};
  }
  
  /**
   * 최상위 네임스페이스. 핵심적인 시스템 및 유틸리티 메소드가 정의되어 있다.
   * @name olleh.maps
   * @namespace 
   */
  
  /**
   * @lends olleh.maps
   */
  GLOBAL.olleh.maps = {
    
    /**
     * Normalize된 typeof 함수로서 대상 객체의 종류에 따라 일관된 형태로 타입을
     * 문자열로 반환한다.(예를 들면, 대상 객체가 null일경우 JavaScript의 내장
     * typeof 사용하면 'object'를 반환하지만 olleh.maps.typeOf를 사용하면
     * 'null'을 반환한다)
     * <p/>
     * Normalize된 JavaScript의 타입은 다음과 같다
     * <pre>
     *   ARRAY:       'array'
     *   BOOLEAN:     'boolean'
     *   DATE:        'date'
     *   ERROR:       'error'
     *   FUNCTION:    'function'
     *   NUMBER:      'number'
     *   NULL:        'null'
     *   OBJECT:      'object'
     *   REGEXP:      'regexp'
     *   STRING:      'string'
     *   UNDEFINED:   'undefined'
     * </pre>
     * @example
     * olleh.maps.typeOf('foo'); // 'string'
     * olleh.maps.typeOf(123); // 'number'
     * olleh.maps.typeOf([]); // 'array'
     * olleh.maps.typeOf({}); // 'object'
     * olleh.maps.typeOf(null); 'null'
     * olleh.maps.typeOf(new Date); // 'date'
     * olleh.maps.typeOf(true); // 'boolean'
     *
     * @param {Object} obj JavaScript 객체
     * @returns {String} Normalize된 JavaScript 타입(문자열)
     */
    typeOf: function (obj) {
      return _OBJ2TYPE[Object.prototype.toString.call(obj)]
          || (obj ? 'object' : obj === null ? 'null' : 'undefined');
    },
    
    /**
     * 명시된 객체가 배열인지 확인하고 그 결과를 true/false로 반환한다.
     * @example
     * olleh.maps.isArray([]); // true
     * olleh.maps.isArray({}); // false
     *
     * @param {Object} obj JavaScript 객체
     * @param {Boolean} relaxed 좀더 확장된 형태의 배열인지 확인하기 위한
     * 옵션(즉, 상속관계를 허용한다)
     * @returns {Boolean} 명시된 객체가 배열일경우 true를 반환하고 그렇지
     * 않을경우  false를 반환한다.
     */
    isArray: function (obj, relaxed) {
      if (!relaxed) {
        return Array.isArray && (Array.isArray(obj)) || this.typeOf(obj) === 'array';
      } else {
        // Handles arrays inheritance and arrays from external frame/window
        return obj && (typeof obj === 'object'
            && typeof obj.length === 'number'
            && typeof obj.splice === 'function'
            && !obj.propertyIsEnumerable('length')) || (obj instanceof Array);
      }
    },
    
    /**
     * 명시된 객체가 Boolean의 값인지 확인하고 그 결과를 true/false로 반환한다.
     * @example
     * olleh.maps.isBoolean(true); // true
     * olleh.maps.isBoolean(false); // true
     * olleh.maps.isBoolean({}); // false
     * olleh.maps.isBoolean([]); // false
     * olleh.maps.isBoolean(1); // false
     * olleh.maps.isBoolean(0); // false
     *
     * @param {Object} obj JavaScript 객체
     * @returns {Boolean} 만약 명시된 객체가 boolean이면 true를 그렇지
     * 않으면 false를 반환한다.
     */
    isBoolean: function (obj) {
      return typeof obj === 'boolean';
    },
    
    /**
     * 명시된 객체가 Date인지 확인하고 그 결과를 true/false로 반환한다.
     * @example
     * olleh.maps.isDate(new Date()); // true
     * olleh.maps.isDate({}); // false
     *
     * @param {Object} obj JavaScript 객체
     * @returns {Boolean} 명시된 객체가 Date일경우 true를
     * 그렇지 않을경우 false를 반환한다.
     */
    isDate: function (obj) {
      return this.typeOf(obj) === 'date';
    },
    
    /**
     * 명시된 객체가 RegExp인지 확인하고 그 결과를 true/false로 반환한다.
     * @example
     * olleh.maps.isDate(new RegExp()); // true
     * olleh.maps.isDate(/abc/); // true
     * olleh.maps.isDate({}); // false
     * 
     * @param {Object} obj JavaScript 객체
     * @returns {Boolean} 명시된 객체가 RegExp일경우 true를
     * 그렇지 않을경우 false를 반환한다.
     */
    isRegExp: function (obj) {
      return this.typeOf(obj) === 'regexp';
    },

    /**
     * 명시된 객체가 HTML DOM앨리먼트 타입인지 확인하고 그 결과를 true/false로
     * 반환한다.
     * @example
     * olleh.maps.isElement(document.createElement('div')); // true
     * olleh.maps.isElement(document.createTextNode('foo')); // false
     *
     * @param {Object} obj JavaScript 객체 
     * @returns {Boolean} 명시된 객체가 DOM 앨리먼트 타입이면
     * true를 그렇지 않으면 false를 반환한다.
     */
    isElement: function (obj) {
      return !!(obj && obj.nodeType === 1);
    },
    
    /**
     * 명시된 객체가 HTML DOM Fragment인지 확인하고 그 결과를 true/false로
     * 반환한다.
     * @example
     * olleh.maps.isFragment(document.createElement('div')); // false
     * olleh.maps.isFragment(document.createDocumentFragment()); // true
     *
     * @param {Object} obj JavaScript 객체 
     * @returns {Boolean} 명시된 객체가 DOM Fragment이면
     * true를 그렇지 않으면 false를 반환한다.
     */
    isFragment: function (obj) {
      return !!(obj && obj.nodeType === 11);
    },
    
    /**
     * 명시된 객체가 function 또는 class인지 확인하고 그 결과를 true/false로
     * 반환한다.
     * @example
     * olleh.maps.isFunction(123); // false
     * olleh.maps.isFunction(new Function()); // true
     * olleh.maps.isFunction(olleh.maps.isString); // true
     *
     * @param {Object} obj JavaScript 객체 
     * @returns {Boolean} 명시된 객체가 function이면 true를 그렇지 않으면
     * false를 반환한다.
     */
    isFunction: function (obj) {
      return this.typeOf(obj) === 'function';
    },
    
    /**
     * 명시된 문자열이 네임스페이스 형태인지 확인하고 그 결과를 true/false로
     * 반환한다.
     * @example
     * olleh.maps.isNamespace('foo'); // true
     * olleh.maps.isNamespace('foo.bar'); // true
     * olleh.maps.isNamespace('foo,bar'); // false
     * olleh.maps.isNamespace('foo-bar'); // false
     *
     * @param {String} ns 네임스페이스 문자열
     * @returns {Boolean} 명시된 문자열이 적법한 네임스페이스 문자열이면 
     * true를 반환하고 그렇지 않으면 false를 반환한다.
     */
    isNamespace: function (ns) {
      return this.isString(ns) && /^[\w]+(\.[\w]+)*$/.test(ns);
    },
    
    /**
     * 명시된 객체가 숫자인지를 확인하고 그 결과를
     * Boolean값으로 반환한다.
     * @example
     * olleh.maps.isNumber(0); // true
     * olleh.maps.isNumber(2.3); // true
     * olleh.maps.isNumber('foo'); // false
     *
     * @param {Object} obj JavaScript 객체
     * @returns {Boolean} 객체가 숫자이면 true를 그렇지 않으면
     * false를 반환한다.
     */
    isNumber: function (obj) {
      return typeof obj === 'number' && isFinite(obj);
    },
    
    /**
     * 명시된 객체가 인스턴스인지 확인하고 그 결과를
     * true/false로 반환한다. 만약 명시된 객체가
     * function인지 같이 확인하고자 한다면 isFunction 파라미터의
     * 값을 true로 설정하면 된다.
     * @example
     * olleh.maps.isObject({}); // true
     * olleh.maps.isObject([]); // true
     * olleh.maps.isObject(new Function()); // false
     * olleh.maps.isObject(new Function(), true); // true
     *
     * @param {Object} obj JavaScript 객체 
     * @param {Boolean} isFunction true 일경우 function객체도
     * true를 반환한다.
     * @returns {Boolean} 명시된 객체가 Object 또는 function일경우 true를
     * 그렇지 않을 경우 false를 반환한다.
     */
    isObject: function (obj, isFunction) {
      return obj && ((typeof obj === 'object') 
          || (isFunction && this.isFunction(obj))) || false;
    },

    /**
     * 명시된 객체가 String인지 확인하고 그 결과를
     * true/false로 반환한다.
     * @example
     * olleh.maps.isString(123); // false
     * olleh.maps.isString('foo'); // true
     * olleh.maps.isString(''); // true
     *
     * @param {Object} obj JavaScript 객체
     * @returns {Boolean} 만약 명시된 객체가 String이면 true를 그렇지 않으면
     * false를 반환한다.
     */
    isString: function (obj) {
      return typeof obj === 'string';
    },
    
    /**
     * 명시된 객체(obj)가 'undefined' 인지를 확인하고 그
     * 결과를 Boolean값으로 반환한다.
     * @example
     * olleh.maps.isUndefined(undefined); // true
     * olleh.maps.isUndefined(); // true
     * olleh.maps.isUndefined(null); // false
     * olleh.maps.isUndefined(0); // false
     * olleh.maps.isUndefined(''); // false
     *
     * @param {Object} obj JavaScript 객체
     * @returns {Boolean} 객체가 undefined이면 true를 그렇지
     * 않으면 false를 반환한다.
     */
    isUndefined: function (obj) {
      return typeof obj === 'undefined';
    },

    /**
     * 명시된 객체가 적절한 값을 가지는지 확인하고 그 결과를
     * true/false로 반환한다. 그 값이 undefined/null/NaN/""
     * 이 아닐경우 true를 반환한다.
     * @example
     * olleh.maps.isValue({}); // true
     * olleh.maps.isValue([]); // true
     * olleh.maps.isValue(null); // false
     * olleh.maps.isValue(undefined); // false
     * olleh.maps.isValue(''); // false
     *
     * @param {Object} obj JavaScript 객체
     * @returns {Boolean} 명시된 객체가 undefined, null, NaN, "" 이 아닐경우
     * true를 반환하고 그렇지 않을경우 false를 반환한다.
     */
    isValue: function (obj) {
      var t = this.typeOf(obj);
      switch (t) {
      case 'undefined':
      case 'null':
        return false;
      case 'number':
        return isFinite(obj);
      case 'string':
        return '' !== obj;
      }
      return !!(t);
    },

    /**
     * 명시된 function을 호출할 때 function에 정의된
     * 파라미터 외에 추가적인 파라미터를 넘기고자 할 경우
     * 사용한다. 추가하고자 하는 파라미터의 개수에는 제한이
     * 없다.
     * <p/>
     * @example
     * function showArguments() {
     *   alert(Array.prototype.join.call.join(arguments, ', '));
     * }
     * showArguments(1, 2, 3);
     * // -> alerts "1, 2, 3"
     * var f = olleh.maps.curry(showArguments, this, 1, 2, 3);
     * f('a', 'b');
     * // -> alerts "a, b, 1, 2, 3"
     *
     * @param {Function} fn 최종적으로 호출할 function
     * @param {Object} ctx context 객체
     * @param {Arguments} [args] 추가적으로 넘기고자 하는 파라미터
     */
    curry: function (fn, ctx, args) {
      if (!arguments.length) {
        throw new SyntaxError('method reference to curry is missing!');
      }
      if (arguments.length === 1) return arguments[0];
      var _fn = fn, _args = Array.prototype.slice.call(arguments, 2);
      return function () {
        var arr = Array.prototype,
            a = arr.concat.call(arr.slice.call(arguments), _args);
        return _fn.apply(ctx, a);
      };
    },
    
    /**
     * 소스(src) 객체의 프로퍼티들을 대상(dest) 객체에
     * 복사 한다.
     * <p/>
     * 오직 소스 객체(상속된 프로퍼티 배제)에 있는 프로퍼티들만이
     * 대상객체로 복사된다.
     *
     * @example
     * var src = {
     *   level: 'low',
     *   opts: {one: 1, two: 2},
     *   add: function (a, b) {
     *     return a + b;
     *   }
     * };
     *
     * var dest = {
     *   level: 'high',
     *   opts: {three: 3, four: 4},
     *   multiply: function (a, b) {
     *     return a * b;
     *   }
     * }
     * var d = olleh.maps.mixin(dest, src); // mixin
     * d.multiply(2, 3); // 6
     * d.add(2, 3); // 5 (mixed in)
     * d.level; // 'high'
     *
     * d = olleh.maps.mixin(dest, src, true); // override
     * d.level; // 'low' (overridden)
     * d.opts; // {one: 1, two: 2}
     *
     * d = olleh.maps.mixin(dest, src, 'remix'); // 'remix'
     * d.opts; // {one: 1, two: 2, three: 3, four: 4}
     *
     * d = olleh.maps.mixin(dest, src, true, ['level', 'add']); // 'filter'
     * d.add(2, 3); // 5
     * d.level; // 'low'
     * d.opts; // {three: 3, four: 4}
     *
     * @param {Object} dest 프로퍼티들을 적용되는 목적 객체 또는 클래스
     * @param {Object} src 프로퍼티들을 복사하기 위한 소스 객체 또는 클래스
     * @param {Boolean|String} [override] Override 또는 'remix' (recursive mix)
     * @param {Array} [filter] 복사할 소스 객체의 프로퍼티를 지정한다.
     * @returns {Object} 소스객체에 있는 프로퍼티들이 적용된 대상 객체
     */
    mixin: function (dest, src, override, filter) {
      dest = dest || {};
      if (src !== dest) {
        // Copy properties on override or if it doesn't already exist
        for (var p in src) {
          // Copy owned/filtered src properties to undefined/overriden dest
          if (src.hasOwnProperty(p) && (override || dest[p] === undefined)
              && (!filter || indexOf.call(filter, p) > -1)) {
            // Recursively mix or overwrite to dest property
            if (override === 'remix' && this.isObject(dest[p])) {
              dest[p] = this.mixin(dest[p], src[p], override, filter);
            } else {
              dest[p] = src[p];
            }
          }
        }
      }
      return dest;
    },
    
    /**
     * JavaScript의 네임스페이스를 정의한다.
     * <p/>
     * 기존에 정의된 네임스페이스 구조에서 정의된
     * 네임스페이스가 존재하지 않는다면 기존의 네임스페이스
     * 구조를 덮어쓰지 않고 새로운 네임스페이스를 추가한다.
     * <p/>
     * 네임스페이스의 문법이 적절하지 않거나 기존에 있는
     * 네임스페이스를 덮어쓰려고할 경우 Error가 발생된다.
     * @example
     * olleh.maps.namespace('foo.bar'); // creates namespace 'foo.bar'
     * olleh.maps.namespace('foo.bar', {name: 'mobell'});
     * foo.bar.name; // 'mobell'
     *
     * olleh.maps.namespace('foo.bar.baz', function () { return 'mobello';});
     * foo.bar.baz(); // 'mobello'
     *
     * @param {String} ns 선언할 네임스페이스 문자열
     * @param {Object|Function} [attach] 네임스페이스에 추가할 
     * 프로퍼티 또는 Function
     * @param {Boolean} [overwrite] true이면 기존의 네임스페이스를 덮어쓴다.
     * @returns {Boolean} 적어도 하나이상의 네임스페이스가 수정되었다면
     * true를 반환한다.
     * @throws {Error} 네임스페이스의 형식이 적절하지 않거나 이전에 동일한
     * 이름의 네임스페이스가 정의되어 있을 경우
     */
    namespace: function (ns, attach, overwrite) {
      if (!this.isNamespace(ns)) {
        throw new SyntaxError('olleh.maps.namespace: invalid namespace, ' + ns);
      }
      
      var i, len; 
      var parent = window;
      var modified = false;
      var parts = ns.split('.'); 
      var isFn = this.isFunction(attach);

      // Validate each namespace parts (create one if it doesn't exist)
      for (i = 0, len = isFn ? parts.length - 1 : parts.length; i < len; i++) {
        if (typeof parent[parts[i]] === 'undefined') {
          parent[parts[i]] = {};
          modified = true;
        } else if (!overwrite && this.isFunction(parent[parts[i]]) && i < len - 1) {
          // Any parent part in the namespace must not be a function
          throw new Error('olleh.maps.namespace: \"' + parts.slice(0, i + 1)
              .join('.') + '\" function was previously defined in hierarchy');
        }
        parent = parent[parts[i]];
      }
      
      if (isFn) {
        // Function assignment for the last portion of namespace
        if (overwrite || typeof parent[parts[i]] === 'undefined') {
          parent[parts[i]] = attach;
          modified = true;
        } else {
          throw new Error('olleh.maps.namespace: \"' + ns + '\" definition ' + ' already exists, cannot be overridden');
        }
      } else {
        // Attach properties to the final namespace part; does not overwrite
        for (i in attach) {
          if (typeof parent[i] === 'undefined' && attach.hasOwnProperty(i)) {
            parent[i] = attach[i];
            modified = true;
          }
        }
      }
      
      return modified;
    },
    
    /**
     * @name olleh.maps.TObject 
     * @class
     * $class()를 이용하여 생성하는 모든 KT맵 클래스의 최상위 클래스이다.
     * 따라서 다음과 같이 instanceof를 통해 KT맵 객체인지 확인할 수 있다.
     * @example
     * var foo = // KT맵 클래스 인스턴스 
     * if (foo instanceof olleh.maps.TObject) {} // true
     * @see $class
     * @private
     */
    TObject: (function () {
      var obj = function TObject() {};
      
      /**
       * 현재 클래스의 부모 클래스를 가리킨다.
       * KT맵 클래스 시스템을 사용하는 모든 클래스는 이 값을 가진다.
       * @example
       * $class('com.mycompany.MySuper').define({
       *   foo: function () { // override
       *     return 'MySuper';
       *   }
       * });
       *
       * $class('com.mycompany.MyClass').extend(com.mycompany.MySuper).define({
       *   foo: function () { // override
       *     var msg = com.mycompany.MyClass.$super.foo.apply(this, arguments);
       *     return msg + ' and MyClass';
       *   }
       * });
       * 
       * @example
       * var my = new com.mycompany.MyClass();
       * my.foo(); // prints 'MySuper and MyClass'
       *
       * @name olleh.maps.TObject.$super
       */
      obj.$super = null;
      
      /**
       * 현재 인스턴스의 클래스명을 가리킨다.
       * @example
       * $class('foo.Bar').define({
       *   ...
       * });
       * 
       * @example
       * var bar = new foo.Bar();
       * bar.$classname // 'foo.Bar'
       *
       * @name $classname
       * @field
       * @memberOf olleh.maps.TObject.prototype
       * @constant
       * @type String
       */
      obj.prototype.$classname = 'olleh.maps.TObject';
      
      /**
       * 현재 객체를 문자열로 변환하여 반환한다. 일반적으로
       * KT맵 클래스가 foo.Bar로 정의되었다면 반환되는
       * 문자열은 "[object foo.Bar]"가 된다.
       * @example
       * var v = new foo.Bar();
       * v.toString(); // '[object foo.Bar]'
       * @name toString
       * @function
       * @memberOf olleh.maps.TObject.prototype
       * @returns {String} 객체를 표현하는 문자열
       */
      obj.prototype.toString = function () {
        return '[object '.concat(this.$classname, ']');
      };
      
      /**
       * 현재 callstack의 정보를 반환한다. 이 메소드의
       * 호출이 빈번히 발생할 경우 성능저하가 발생할 수
       * 있으므로 신중하게 사용해야 한다.
       * @example
       * var aa = ...
       * aa.currentStack().toString();
       * // prints callstack as a String
       *
       * @name currentStack
       * @function
       * @memberOf olleh.maps.TObject.prototype
       * @returns {Object} 현재의 callstack 정보를 담고있는
       * 객체
       */
      obj.prototype.currentStack = function  () {
        var that = this, current = arguments.callee.caller;
        return  {
          toString: function () {
            var cs = ' @'.concat(that.$classname);
            for(var name in that) {
              if (that[name] === current) {
                return cs.concat('.', name, '();');
              }
            }
            return cs;
          }
        };
      };

      /**
       * 명시된 클래스가 현재 객체에 mixin되었는지 여부를
       * 확인하고 결과를 true/false로 반환한다.
       * @example
       * $class('foo.Bar').mixin(foo.Baz).define({
       *   ...
       * });
       *
       * @example
       * var bar = new foo.Bar();
       * bar.isMixinOf(foo.Baz); // true
       *
       * @name isMixinOf
       * @function
       * @memberOf olleh.maps.TObject.prototype
       * @param {Object} target 현재 객체에 mixin이 적용되었는지
       * 확인하고자 하는 클래스
       * @returns {Boolean} 현재 객체에 명시된 클래스가
       * mixin되었다면 true를 그렇지 않으면 false를
       * 반환한다.
       */
      obj.prototype.isMixinOf = function (target) {
        var cls = this.constructor;
        for (var i = 0; cls.mixins && i < cls.mixins.length; i++) {
          if (cls.mixins[i] === target.prototype.$classname) {
            return true;
          }
        }
        return cls.$super ? cls.$super.isMixinOf(target) : false;
      };

      /**
       * 현재 인스턴스의 Class를 반환한다.
       * @example
       * var bar = new foo.Bar();
       * var clazz = bar.getClass();
       * // clazz is foo.Bar
       * 
       * @name getClass
       * @function
       * @memberOf olleh.maps.TObject.prototype
       * @returns {olleh.maps.TObject} 클래스
       */
      obj.prototype.getClass = function () {
        return this.constructor;
      };
      
      return obj;
    })()
  };
  
  GLOBAL.$class = (function () {
    var maps = olleh.maps;
    var dontEnumProperties;
    var dontEnumBug = !{toString:'foo'}.propertyIsEnumerable('toString');
    
    // ie8 이하 DontEnum bug
    // https://developer.mozilla.org/en-US/docs/ECMAScript_DontEnum_attribute#section_2
    if (dontEnumBug) {
      dontEnumProperties = function (src, desc) {
        if (!src || !desc) return;
        
        var dontEnumProps = ['toLocaleString', 'toString', 'valueOf', 'equals'];
        var i = dontEnumProps.length;
        var p;
        
        while(i--) {
          p = dontEnumProps[i];
          if (src.hasOwnProperty(p)) {
            desc[p] = src[p];
          }
        }
      };
    }
    
    /**
     * KT맵에서 클래스 정의시 생성되는 시스템 클래스.
     * $class('foo.Bar').define({ ... });와 같이
     * 클래스를 정의할 경우 시스템 내부적으로 클래스의 객체를 생성하게
     * 되며 개별 클래스 시스템을 구성하기 위한
     * 기능들을 정의한다. 클래스 정의가 종료됨가 동시에 이
     * 클래스의 객체도 사라진다.
     * <p/>
     * KT맵 클래스 시스템을 통해 객체지향 언어에서 얻을 수
     * 있는 추상화, 상속, 다형성, 캡슐화(정보은닉)를활 용할 수
     * 있으며 이를 위해 다음과 같은 메소드들을 지원한다.
     * <ul>
     *   <li>extend: 상속관계를 정의한다.</li> 
     *   <li>mixin: 자주사용하는 기능들을 별도의 클래스로
     *   모듈과 하고 이들 기능들을 클래스 정의시 재사용한다. </li>
     *   <li>define: 정의된 클래스의 멤버함수들을 정의한다.</li>
     * </ul>
     * 주의: 사용자가 직접 클래스의 인스턴스를 생성할 수
     * 없으며 시스템 내부적으로 인스턴스가 생성된다.
     * @name $class
     * @class
     * @example
     * $class('foo.Bar').extend(foo.Baz).define({
     *   Bar: function () { // Constructor
     *     // ...
     *   },
     *
     *   say: function () { // Member function
     *     // ...
     *   }
     * });
     */
    function $class (name) {
      return {
        name: name,
        extend: extend,
        mixin: mixin,
        define: define
      };
    }
    
    /**
     * 기존에 정의의된 클래스를 상속(확장)한다. 기존의
     * 클래스를 상속할 경우 부모클래스에 있는 모든 기능들을
     * 활용할 수 있으며 추가적으로 확장된 기능들을 정의할 수
     * 있다. 또한 부모클래스에 정의된 기능을 오버라이드하여
     * 기능을 확장할 수도 있다.
     * @example
     * $class('com.mycompany.MySuper').define({
     *   $static: {                     // Static variables
     *     MAX_SIZE: 1000
     *   },
     *
     *   MySuper: function (a, b) { // Class constructor
     *     this._a = a;
     *     this._b = b;
     *   },
     *
     *   foo: function () { // Class member
     *     return this._a + this._b;
     *   },
     *
     *   getMax: function () {
     *     return com.mycompany.MySuper.MAX_SIZE;
     *   },
     *   
     *   $afterDefine: function () { // class define callbackFn
     *     var clazz = this;
     *   }
     * });
     *
     * $class('com.mycompany.MyClass').extend(com.mycompany.MySuper).define({
     *   foo: function () { // override
     *     return this._a * this._b;
     *   },
     *
     *   bar: function () { // add new function
     *     return this._a - this._b;
     *   }
     * });
     *
     * @name extend
     * @function
     * @memberof $class
     * @param {Function} superclass 상속할 부모클래스를 지정한다.
     * @returns {$class} 클래스를 생성하기 위한 시스템 클래스 객체
     * @throws {Error} superclass가 클래스가 아닐 경우
     */
    function extend(superclass) {
      if (!olleh.maps.isFunction(superclass)) {
        throw new Error('$class.extend: '+ this.name 
            + ' cannot extend undefined class, \"' + superclass + '\"');
      }
      this.sup = superclass;
      delete this.extend;
      return this;
    }
    
    /**
     * 명시된 클래스의 멤버들을 현재 클래스의 기능으로
     * 가져온다. 만약 기존에 동일한 멤버들이 존재한다면
     * 덮어쓰지 않는다.
     * @example
     * $class('com.mycompany.MySuper').mixin(com.mycompany.Util).define({
     *   ...
     * });
     *
     * @example
     * $class('com.mycompany.MySuper').mixin( // more than one class
     *     com.mycompany.Util, com.mycompany.Common).define({ //
     *   ...
     * });
     *
     * @name mixin
     * @function
     * @memberof $class
     * @param {Object} args mixin할 클래스, 다수개의 클래스를 명시할 수 있다.
     * @returns {$class} 클래스를 생성하기 위한 시스템 클래스 객체
     */
    function mixin() {
      this.mixins = arguments;
      delete this.mixin;
      return this;
    }
    
    /**
     * 클래스의 멤버들을 정의한다.
     * <p/>
     * 클래스의 생성자를 정의할 수 있으며 생성자는 클래스의
     * 이름과 동일한 이름의 메소드로 정의한다.
     * @example
     * $class('com.mycompany.MySuper').define({
     *   MySuper: function () { // constructor
     *
     *   },
     *
     *   foo: function (a, b) { // member function
     *
     *   }
     * });
     * <p/>
     *
     * @name define
     * @function
     * @memberof $class
     * @param {Object} m 클래스 정의를 위한 멤버들
     * @throws {Error} 기존에 동일한 클래스가 이미 정의되어 있을 경우
     */
    function define(m) {
      var p, len, mm;
      var sup = this.sup || maps.TObject;
      var name = this.name, mixins = this.mixins;
      var shortname = name.substring(name.lastIndexOf('.') + 1);
      
      var cls = function () {
        var ctor, stack = [], current = this;
        
        do {
          stack.push(current);
          current = current.constructor.$super;
        } while (current);

        while (current = stack.pop()) {
          if (ctor = current.$constructor) {
            ctor.apply(this, arguments);
          }
        }
      };
      
      if (!maps.namespace(name, cls)) {
        throw new Error('$class.define: \"' + name +'\" already defined');
      }
      
      var parent = function () {};
      parent.prototype = sup.prototype;
      
      cls.$super = sup.prototype;
      cls.prototype = new parent();
      cls.prototype.constructor = cls;
      cls.prototype.$constructor = null;
      cls.prototype.$classname = name;

      var afterDefine = [];
      var supCls = cls.$super;
      var supClsProto;

      while(supCls && supCls !== maps.TObject) {
        supClsProto = supCls.constructor; 
        for (p = 0, len = supClsProto.mixins ? supClsProto.mixins.length : 0; p < len; p++) {
          mm = supClsProto.mixins[p].prototype;
          if (mm && mm.$afterDefine) {
            afterDefine.push(mm.$afterDefine);
          }
        }
        supCls = supCls.$super;
      }
      
      // Apply mixin properties 
      for (p = 0, len = mixins ? mixins.length : 0; p < len; p++) {
        //olleh.maps.mixin(cls.prototype, this.mixins[p]);
        //tweaked for efficiency by genie
        if (p === 0) {
          cls.mixins = [];
        }
        mm = mixins[p].prototype;
        if (mm) {
          cls.mixins.push(mm.$classname);
          if (mm.$afterDefine) {
            afterDefine.push(mm.$afterDefine);
          }
        } else {
          mm = mixins[p];
        }
        maps.mixin(cls.prototype, mm);
      }

      if (m.$afterDefine) {
        afterDefine.push(m.$afterDefine);
      } else if (cls.prototype.$afterDefine) {
        afterDefine.push(cls.prototype.$afterDefine);
      }

      // Define static properties/methods
      for (p in m.$static) {
        if (m.$static.hasOwnProperty(p)) {
          cls[p] = m.$static[p];
        }
      }

      // Define prototype properties/methods
      for (p in m) {
        if (p !== '$static' && m.hasOwnProperty(p)) {
          if (shortname == p) {
            cls.prototype.$constructor = m[p];
          }
          cls.prototype[p] = m[p];
        }
      }
      
      // ie8 이하 DontEnum bug
      if (dontEnumBug) {
        dontEnumProperties(m.$static, cls);
        dontEnumProperties(m, cls.prototype);
      }
      
      for (var i = 0; i < afterDefine.length; i++) {
        afterDefine[i].apply(cls);
      }
    }
    
    return $class;
  })();
} (window);


olleh.maps.namespace('olleh.maps', {
  $skeleton: []
});
/**
 * 기본 환경 변수 네임스페이스
 * @example
 * olleh.maps.env = {
 *   RESOURCE_URL: '../resources'
 * };
 */
(function (GLOBAL) {

  var PROTOCOL = location.protocol == 'https:' ? 'https:' : 'http:';
  var PORT = PROTOCOL == 'https:' ? '10083' : '10080';
  var VERSION = "v=yyyymmdd";
  olleh.maps.namespace('olleh.maps.env', {
    PROTOCOL: PROTOCOL,
    RESOURCE_URL: PROTOCOL + '//api.ktgis.com:' + PORT + '/ollehmap/resource/v3/',
    TILE_URL: {
      // BASE: PROTOCOL + '//map.ktgis.com/BaseMap/olleh7.10.1_1027/layers/_alllayers/l#{z}/r#{y}/c#{x}.png',
      // AIR: PROTOCOL + '//map.ktgis.com/ServiceAir/version20110705/l#{z}/r#{y}/c#{x}.jpg',
      // HYBRID: PROTOCOL + '//map.ktgis.com/HybridMap/olleh6.03.1_0405_hyb/layers/_alllayers/l#{z}/r#{y}/c#{x}.png',
      BASE: PROTOCOL + '//tile.gis.kt.com/current/base.default/#{z}/#{y}/#{x}.png?' + VERSION,
      AIR: PROTOCOL + '//tile.gis.kt.com/current/base.satellite/#{z}/#{y}/#{x}.jpg?' + VERSION,
      HYBRID: PROTOCOL + '//tile.gis.kt.com/current/overlay.hybrid/#{z}/#{y}/#{x}.png?' + VERSION,
      ENG: PROTOCOL + '//tile.gis.kt.com/current/base.english/#{z}/#{y}/#{x}.png?' + VERSION,
      TRAFFIC: PROTOCOL + '//roadtiledmz.ktgis.com/NTraffic/TTileServlet/256/L#{z}/R#{y}/C#{x}.png',
      HD_BASE: PROTOCOL + '//map.ktgis.com/BaseMaphd/olleh5.04.1_0511_hd/layers/_alllayers/l#{z}/r#{y}/c#{x}.png',
      HD_HYBRID: PROTOCOL + '//map.ktgis.com/HybridMaphd/olleh5.04.1_0511_hyb_hd/layers/_alllayers/l#{z}/r#{y}/c#{x}.png'
    },
    TILE_COPYRIGHT: {
      BASE: '© KT corp.',
      AIR: '© KT corp.',
      HD_BASE: '© KT corp.'
    },
    LANG: GLOBAL.$LANG || 'ko',
    LOG_LEVEL: 3 // 1(DEBUG), 2(INFO), 3(WARN), 4(ERROR), 5(FATAL), 6(NONE)
  });
})(window);
!function (GLOBAL) {

  var MSG = {
    'en': {
      '일반지도': 'roadmap',
      '위성지도': 'satellite',
      '하이브리드 라벨': 'hybrid label',
      '실시간 교통': 'real-time traffic',
      '벡터': 'vector',
      '실시간교통 범례': 'Real-Time Traffic Legend',
      '원활': 'fast',
      '정체': 'slow',
      '국도,일반': 'National Highway',
      '도시고속': 'Urban Expressway',
      '고속도로': 'highway',
      '속도 정보 라인 위를 클릭하면, 상세 정보 확인 가능': 'Clicking on the above line speed information, check detailed information available',
      '시내 도로는 신호 정차 등으로 실제 속도와 다를 수 있음': 'In the city roads may differ from the actual speed signal stops , etc.'
    }
  };

  olleh.maps.namespace('olleh.maps', {

    msg: function (key, lang) {
      var l, m;
      var lang = lang === undefined ? olleh.maps.env.LANG : lang;

      if (lang === 'ko') {
        return key;
      }
      l = MSG[lang];
      if (!l) {
        console.warn('unsupported language: ' + lang);
        return key;
      }
      m = l[key];
      if (!m) {
        console.warn('unsupported key: ' + key);
        return key;
      }
      return m;
    }
  });

  olleh.maps.namespace('olleh.maps.msg', {
  // TODO
  });
}(window);/**
 * browser 관련 네임스페이스
 */
olleh.maps.namespace('olleh.maps.browser', {
  /**
   * 브라우저이름
   * @enum {String}
   */
  BROWSER_NAME: {
    ie: 'IE',
    firefox: 'FireFox',
    safari: 'Safari',
    chrome: 'Chrome',
    opera: 'Opera',
    /**
     * @ignore
     */
    chromeMobile: 'Chrome',
    /**
     * @ignore
     */
    chromeForAndroid: 'Chrome',
    /**
     * @ignore
     */
    chromeForIos: 'Chrome',
    other: ''
  },

  /**
   * 브라우저 엔진이름
   * @enum {String}
   */
  ENGINE_NAME: {
    webkit: 'WebKit',
    gecko: 'Gecko',
    presto: 'Presto',
    trident: 'Trident',
    other: ''
  },

  /**
   * OS 이름
   * @enum {String}
   */
  OS_NAME: {
    ios: 'iOS',
    android: 'Android',
    mac: 'Mac',
    win: 'Windows',
    linux: 'Linux',
    other: ''
  },

  /**
   * 브라우저 엔진 CSS dath(-) prefix
   * @enum {String}
   */
  STYLE_DASH_PREFIX: {
    webkit: '-webkit-',
    gecko: '-moz-',
    trident: '-ms-',
    presto: '-o-',
    other: ''
  },

  /**
   * 브라우저 엔진 CSS prefix
   * @enum {String}
   */
  STYLE_PREFIX: {
    webkit: 'webkit',
    gecko: 'moz',
    trident: 'ms',
    presto: 'o',
    other: ''
  },
  
  /**
   * 현재 브라우저이름
   * @type olleh.maps.browser.BROWSER_NAME
   */
  browserName: '', // BROWSER_NAME['other']
  /**
   * 현재 브라우저 버전
   * @example
   * olleh.maps.browser.browserVer; // 5
   * @type String
   */
  browserVer: '',
  /**
   * 현재 브라우저 엔진이름
   * @type olleh.maps.browser.ENGINE_NAME
   */
  engineName: '', // ENGINE_NAME['other']
  /**
   * 현재 브라우저 엔진 버전
   * @type String
   */
  engineVer: '',
  /**
   * cross-browser를 지원을 위한 이벤트 속성 정보
   * @type Object
   * @property {String} transitionend 
   */
  event: {}, 
  
  /** 
   * 현재 실행중인 디바이스가 orientationchange 지원하는지
   * 확인한다.
   * @type Boolean
   */
  hasOrientationChange: ('onorientationchange' in window),
  
  /** 
   * 현재 실행중인 디바이스가 touch 이벤트를 지원하는지 확인한다.
   * @type Boolean
   */
  hasTouch: ('ontouchstart' in window) && !/chrome/i.test(window.navigator.userAgent),

  /** 
   * 현재 실행중인 디바이스가 3D를 지원하는지 확인한다.
   * @type Boolean
   */
  has3D: false,
  /**
   * canvas 지원여부
   * @type Boolean
   */
  hasCanvas: !!document.createElement("canvas").getContext,
  /**
   * HTML element pointer-events css 지원여부
   * @type Boolean
   */
  hasPointerEvents: false,
  /**
   * svg 지원여부
   * @type Boolean
   */
  hasSVG: document.implementation.hasFeature('http://www.w3.org/TR/SVG11/feature#BasicStructure', '1.1'),
  /**
   * vml 지원여부
   * @type Boolean
   */
  hasVML: (function () {
    if (!document.namespaces) return false;
    
    var div = document.createElement('div');
    div.innerHTML = '<!--[if vml]><br><![endif]-->';
    return div.childNodes.length == 1;
  })(),
  /**
   * 디바이스가 모바일인지 여부
   * @type Boolean
   */
  isMobile: false,
  /**
   * 디바이스가 테블릿인지 여부
   * @type Boolean
   */
  isTablet: false,  
  /**
   * 현재 OS 명
   * @type olleh.maps.browser.OS_NAME
   */
  osName: '', // OS_NAME['other']
  /**
   * 현재 OS 버전
   * @example
   * olleh.maps.browser.osVer; // 2.3
   * @type String
   */
  osVer: '',
  /**
   * cross-browser 지원을 위한 스타일 속성 정보
   * @param {String} transition
   */
  style: {},
  /**
   * 현재 브라우저 엔진 dash(-)형태의 CSS prefix
   * @type olleh.maps.browser.STYLE_DASH_PREFIX
   */
  styleDashPrefix: '', // STYLE_DASH_PREFIX['other']
  /**
   * 현재 브라우저 엔진 CSS prefix
   * @type olleh.maps.browser.STYLE_PREFIX
   */
  stylePrefix: '', //STYLE_PREFIX['other']
  /**
   * translate template
   * <pre>
   *   translate3d(#{x}px,#{y}px,0) 
   *   translate(#{x}px,#{y}px)
   * </pre>
   * @type String
   */
  styleTranslateTmpl: '',
  /**
   * 지원하는 대표 vector명 (SVG, Canvas, VML)
   * @type String
   */
  vector: '',

  /**
   * 스타일 지원여부을 확인한다.
   * @param {String} name 지원여부를 확인할 스타일명
   * @returns {Boolean}
   * @static
   */
  isStyleSupported: function (name) {
    var browser = olleh.maps.browser;
    var bodyStyle = document.body.style;

    return (name in bodyStyle) || 
    (browser.stylePrefix !== '' && 
        (browser.stylePrefix + capitalize(name) in bodyStyle));
  }
});


!function (GLOBAL) {
  var prop, browsers, engine, os;
  var browser = olleh.maps.browser;
  var body = document.body || document.documentElement;
  var bodyStyle = body.style;
  var BROWSER_NAME = browser.BROWSER_NAME;
  var ENGINE_NAME = browser.ENGINE_NAME;
  var OS_NAME = browser.OS_NAME;
  var STYLE_DASH_PREFIX = browser.STYLE_DASH_PREFIX;
  var STYLE_PREFIX = browser.STYLE_PREFIX;
  var userAgent = GLOBAL.navigator.userAgent;
  var enginePrefix = {
    webkit: 'AppleWebKit/',
    gecko: 'Gecko/',
    presto: 'Presto/',
    trident: 'Trident/'
  };
  var browserPrefix = {
    ie: 'MSIE ',
    firefox: 'Firefox/',
    chromeMobile: 'CrMo', // 이전에는 CrMo -> Chrome으로 변경되었음. 하위 호환성을 위해 유지
    chromeForAndroid: 'Android[\\W|\\w]*Chrome\/',
    chromeForIos: 'CriOS/',
    chrome: 'Chrome/',
    safari: 'Version/',
    opera: 'Opera/'
  };
  var osPrefix = {
    ios: 'i(?:Pad|Phone|Pod)(?:.*)CPU(?: iPhone)? OS ',
    android: '(Android |HTC_|Silk/)', // Some HTC devices ship with an OSX userAgent by default,
    // so we need to add a direct check for HTC_,
    mac: 'Macintosh; Intel Mac OS X ',
    win: 'Windows NT ',
    linux: 'Linux; '
  };
  var mobile = {
    other: /Mobile/,
    android_tablet: /Android/,
    ipad: /ipad/
  };
  var ics3DWhiteList = /SHW-|SHV-|GT-|SCH-|SGH-|SPH-|LG-F160|LG-F100|LG-F180|LG-F200|EK-|IM-A|LG-F240|LG-F260/;
  var ics3DBlackList = /SHW-M250|SHW-M420|SHW-M200|GT-S7562/;
  
  var capitalize = function (str) {
    return str ? str.charAt(0).toUpperCase() + str.substr(1) : '';
  };
  var testStyle = function (name) {
    if (name in bodyStyle) {
      return name;
    }
    return null;
  };
  var testPrefixedStyle = function (name) {
    name = browser.stylePrefix + capitalize(name);
    if (name in bodyStyle) {
      return name;
    }
    return null;
  };
  
  // browser이름, 버전
  for (prop in browserPrefix) {
    browsers = userAgent.match(new RegExp(browserPrefix[prop] + '([0-9]{1,}[\.0-9]{0,})'));

    if (browsers) {
      browser.browserName = BROWSER_NAME[prop];
      browser.browserVer = browsers[1];
      break;
    }
  }

  // browser 엔진 이름, 버전
  for (prop in enginePrefix) {
    engine = userAgent.match(new RegExp(enginePrefix[prop] + '([0-9]{1,}[\.0-9]{0,})'));

    if (engine) {
      browser.engineName = ENGINE_NAME[prop];
      browser.engineVer = engine[1];
      browser.styleDashPrefix = STYLE_DASH_PREFIX[prop] || '';
      browser.stylePrefix = STYLE_PREFIX[prop] || '';
      break;
    }
  }

  // OS 이름, 버전
  for (prop in osPrefix) {
    os = userAgent.match(new RegExp(osPrefix[prop] + '([0-9]{1,}[\.0-9]{0,})'));

    if (os) {
      browser.osName = OS_NAME[prop];
      browser.osVer = os[2] || os[1];
      break;
    }
  }

  // 모바일관련 여부
  if (mobile.other.test(userAgent)) {
    browser.isMobile = true;

    if (mobile.ipad.test(userAgent))
      browser.isTablet = true;

  } else if (mobile.android_tablet.test(userAgent)) {
    browser.isMobile = true;
    browser.isTablet = true;
  }
  browser.style = {
    transition: testPrefixedStyle('transition') || testStyle('transition'),
    transform:
      // #3764 Windows Safari에서 tranform를 사용하면 object tag가 제대로 위치를 못잡는 이슈 회피
      browser.osName == 'Windows' && browser.browserName == 'Safari' ? null :
        testStyle('transform') || testPrefixedStyle('transform'),
    transformOrigin: testStyle('transformOrigin') || testPrefixedStyle('transformOrigin'),
    backgroundSize:
      // #3728: 윈도우 크롬에서 3d transform 과 sprited image 를 동시에 사용하면 repaint 가 안되는 이슈 회피
      //        backgroundSize 를 강제로 false 시키면 SpritedImage 에서 background image 가 아닌 img 태그 사용
      browser.osName == 'Windows' && browser.browserName == 'Chrome' ? null :  
        testStyle('backgroundSize'),
    opacity: (browser.osName == 'Android' && browser.osVer >= '4.2.2' && browser.osVer < '4.3') ? null : testStyle('opacity'), // #1285
    userSelect: testStyle('userSelect') || testPrefixedStyle('userSelect') || {
      get: function (elem) {
        return elem.getAttribute('unselectable') == 'on' ? 'none' : 'auto';
      },
      set: function (elem, value) {
        if (value === 'none') {
          elem.setAttribute('unselectable', 'on');
        } else {
          elem.removeAttribute('unselectable');
        }
      }
    }
  };
  
  browser.event = {
    transitionend: (function () {
      var transition = browser.style.transition;
      if (transition) {
        if (transition == 'transition' || transition == 'msTransition') {
          return 'transitionend';
        }
        if (transition == 'oTransition' && parseFloat(browser.browserVer) >= 12) {
          return 'otransitionend';
        }
        return transition + 'End';
      }
      return null;
    })()
  };
  
  browser.isHD = false;//window.devicePixelRatio > 1;
  browser.isHDTile = (function() {
    if(!browser.isHD)
      return false;
    if(browser.osName == 'Android')
      return browser.osVer >= '4.3';
    return true;
  })();

  browser.has3D = (function () {
    if (!browser.style.transform) {
      return false;
    }
    if (!testStyle('perspective') && !testPrefixedStyle('perspective')) {
      return false;
    }
    // 안드로이드 단말별 처리
    if (browser.osName == 'Android') {
      // ICS 미만은 무조건 사용하지 않음
      if (browser.osVer < '4.0.3') {
        return false;
      }
      // ICS일 경우 whiteList에 없거나 blackList에 있는 경우 사용하지 않음, 그 외엔 사용
      if (browser.osVer < '4.1.0') {
        if (!ics3DWhiteList.test(userAgent) || ics3DBlackList.test(userAgent)) {
          return false;
        }
      }
      // 4.2.2부터는 3D 이슈가 발생하지 않으며 기본 브라우저가 크롬임 (#1285)
      // -옵티머스G 4.1.2 크롬에서 3D 사용할때 성능 향상됨 (2013/07/01)
      if (browser.osVer < '4.1.0' && browser.browserName === 'Chrome') {
        return false;
      }
      // 젤리빈 이상은 무조건 사용
    }
    return true;
  })();
  
  browser.usePulseForZoom = !browser.isMobile;
  
  browser.use3DRootPane = (function () {
    if (!browser.has3D) {
      return false;
    }
    if (browser.osName == 'Android') {
      return false;
    }
    // #2945, #3528
    if (browser.osName != 'iOS' && browser.browserName == 'Safari') {
      return false;
    } 
    return true;
  })();

  browser.hotfixAndroid = (function () {
    if (browser.osName !== 'Android') {
      return false;
    }
    // android 기본 웹브라우저가 아닌 경우
    var ver = browser.browserVer;
    if (ver) {
      var majorVers = ver.split('.');
      var majorVer = majorVers.length > 0 ? majorVers[0] : 0;
      if (majorVer < 43) { // Lollipop 이하
        return true;
      }
    }
    return false; 
  })();

  browser.hasPointerEvents = ('pointer-events' in bodyStyle) && browser.browserName !== browser.BROWSER_NAME.ie;
  
  browser.vector = browser.hasSVG ? 'SVG' : browser.hasCanvas ? 'Canvas' : browser.hasVML ? 'VML' : '';
  
  browser.styleTranslateTmpl = browser.has3D ? 'translate3d(#{x}px,#{y}px,0)' : 'translate(#{x}px,#{y}px)';
  
  browser.styleScaleTmpl = browser.has3D ? 'scale3d(#{scale}, #{scale}, 1)' : 'scale(#{scale}, #{scale})';

}(window);
olleh.maps.namespace('olleh.maps', {
  /**
   * 주어진 메시지를 로깅한다.
   * <pre>
   *  Log levels (tau.log.*):
   *   DEBUG  : 1 (default)
   *   INFO   : 2
   *   WARN   : 3 
   *   ERROR  : 4
   *   FATAL  : 5
   *   NONE   : 6
   * </pre>
   * @example
   * olleh.maps.log('olleh.maps'); // "olleh.maps"
   * olleh.maps.log('olleh.maps', 1); // "[614] olleh.maps" (614 is milliseconds)
   * olleh.maps.log('olleh.maps', 3, 'debug'); // "[debug] olleh.maps"
   * olleh.maps.log('olleh.maps', 3, this, {$tag: 'event'}); // "@event:[olleh.maps.XXX] olleh.maps"
   * @param {String} msg 로그로 남길 메시지
   * @param {Number} [level=1] 로깅레벨: 1(debug) - 6(none), 기본값은 1(debug)
   * @param {String|Class} [src] 로깅메시지 앞에 붙일 문자열
   * @param {Object} [opts] 옵션
   * @param {String} [opts.$tag] 로그 태그.
   * @returns {String} 포맷된 로깅 메시지
   */
  log: function (msg, level, src, opts) {
    if (olleh.maps.isUndefined(window.console))
      return msg;
    var config = this.log.config, _level = this.log.LEVEL, _class, _package, _tag;
    if (config) {
      _tag = config.$tag;
      // config에 있는 tag에 설정이 되어 있는 경우에만 로그를 출력한다.
      if (_tag && _tag.length && olleh.maps.util.indexOf(_tag, opts.$tag) == -1)
        return;

      if (src && (_class = src.$classname)) {
        _package = _class.substring(0, _class.lastIndexOf('.'));
      }

      if (_class && _class !== '' && config[_class]) {
        _level = config[_class];
      } else if (_package && _package !== '') {
        while (_package !== '' && !(_level = config[_package])) {
          _package = _package.substring(0, _package.lastIndexOf('.'));
        }
      }
      _level = _level || this.log.LEVEL;
    }
    if (_level <= (olleh.maps.isUndefined(level) ? olleh.maps.log.DEBUG : level)) {
      // Prepends class/context from which the logging is done
      if (level == this.log.DEBUG) {
        msg = '[' + new Date().getMilliseconds() + '] ' + msg;
      }
      if (this.isString(src)) {
        msg = '[' + src + '] ' + msg;
      } else if (this.isObject(src) && src.$classname) {
        msg = '[' + src.$classname + '] ' + msg;
      }
      console.log(msg);
    }
    return msg;
  }
});

/** 
 * log
 * @example
 * olleh.maps.log.LEVEL = olleh.maps.log.DEBUG;
 * olleh.maps.log.config = {
 *   tag: ['event', 'test1'],
 *   'olleh.maps': olleh.maps.log.DEBUG,
 *   'olleh.maps.Marker': olleh.maps.log.DEBUG
 * };
 * 
 * olleh.maps.log.debug('message....', olleh.maps.log.DEBUG, {tag: 'test1'});
 */
olleh.maps.namespace('olleh.maps.log', {

  LEVEL: olleh.maps.env.LOG_LEVEL !== undefined ? olleh.maps.env.LOG_LEVEL : 3, // Logging level 
  DEBUG: 1,
  INFO: 2,
  WARN: 3,
  ERROR: 4,
  FATAL: 5,
  NONE: 6,

  /**
   * log 설정을 위한 config
   * @example
   * olleh.maps.log.config.$tag = ['event', 'test1', 'test2']; //
   * olleh.maps.log.config['com.Test'] = olleh.maps.log.DEBUG; // 클래스명에 로그레벨을 설정한다.
   * olleh.maps.log.config['com.test'] = olleh.maps.log.DEBUG; // 패키지명에 로그레벨을 설정한다.
   * @type {Object} 
   */
  config: {},

  /** Checks if the current logging level */
  isLevel: function (level) {
    return this.LEVEL <= level;
  },
  /** Debug logging */
  debug: function (msg, src, opts) {
    this.call(olleh.maps, msg, this.DEBUG, src, opts);
  },
  /** Information logging */
  info: function (msg, src, opts) {
    this.call(olleh.maps, msg, this.INFO, src, opts);
  },
  /** Warning logging */
  warn: function (msg, src, opts) {
    this.call(olleh.maps, msg, this.WARN, src, opts);
  },
  /** Error logging */
  error: function (msg, src, opts) {
    this.call(olleh.maps, msg, this.ERROR, src, opts);
  },
  /** Fatal logging */
  fatal: function (msg, src, opts) {
    this.call(olleh.maps, msg, this.FATAL, src, opts);
  }
});
/**
 * Map처리관련 Utility메소드들을 정의한다.
 */
olleh.maps.namespace('olleh.maps.util', {

  /**
   * The number of significant digits to retain to avoid floating point
   * precision errors.
   *
   * We use 14 as a "safe" default because, although IEEE 754 double floats
   * (standard on most modern operating systems) support up to about 16
   * significant digits, 14 significant digits are sufficient to represent
   * sub-millimeter accuracy in any coordinate system that anyone is likely to
   * use with OpenLayers.
   *
   * If DEFAULT_PRECISION is set to 0, the original non-truncating behavior
   * of OpenLayers <2.8 is preserved. Be aware that this will cause problems
   * with certain projections, e.g. spherical Mercator.
   * @type {Number}
   */
  DEFAULT_PRECISION: 14,

  /**
   * 인치에 해당하는 단위의 값을 가지고 있는 객체.
   * 다음 단위들을 제공한다.
   * <pre>
   *   inches :       U.S. Surveyor's Inch
   *   ft:
   *   mi:
   *   m:
   *   km:
   *   dd:
   *   yd:
   *   in:            inches와 동일
   *   degrees:       dd와 동일
   *   nmi:           International Nautical Mile
   *   Inch:          inches와 동일
   *   Meter:         EPSG:9001
   *   Foot:          EPSG:9003
   *   IFoot:         EPSG:9002
   *   ClarkeFoot:    EPSG:9005
   *   SearsFoot:     EPSG:9041
   *   GoldCoastFoot: EPSG:9094
   *   IInch:
   *   MicroInch:
   *   Mil:
   *   Centimeter:
   *   Kilometer:     EPSG:9036
   *   Yard:          U.S. Surveyor's Yard
   *   SearsYard:     EPSG:9040
   *   IndianYard:    EPSG:9084
   *   IndianYd37:    EPSG:9085
   *   IndianYd62:    EPSG:9086
   *   IndianYd75:    EPSG:9087
   *   IndianFoot:    EPSG:9080
   *   IndianFt37:    EPSG:9081
   *   IndianFt62:    EPSG:9082
   *   IndianFt75:    EPSG:9083
   *   Mile:          U.S. Surveyor's Statute Mile
   *   IYard:         EPSG:9096
   *   IMile:         EPSG:9093
   *   NautM:         EPSG:9030
   *   Lat-66:
   *   Lat-83:
   *   Decimeter:
   *   Millimeter:
   *   Dekameter:
   *   Decameter:
   *   Hectometer:
   *   GermanMeter:   EPSG:9031
   *   CaGrid:
   *   ClarkeChain:   EPSG:9038
   *   GunterChain:   EPSG:9033
   *   BenoitChain:   EPSG:9062
   *   SearsChain:    EPSG:9042
   *   ClarkeLink:    EPSG:9039
   *   GunterLink:    EPSG:9034
   *   BenoitLink:    EPSG:9063
   *   SearsLink:     EPSG:9043
   *   Rod:
   *   IntnlChain:    EPSG:9097
   *   IntnlLink:     EPSG:9098
   *   Perch:
   *   Pole:
   *   Furlong:
   *   Rood:
   *   CapeFoot:
   *   Brealey:
   *   ModAmFt:
   *   Fathom:        International Fathom
   *   NautM-UK:
   *   50kilometers:
   *   150kilometers:
   *   
   *   mm:            Milimeter와 동일
   *   cm:            Centimeter와 동일
   *   dm:            
   *   km:            Kilometer와 동일
   *   kmi:           nmi와 동일
   *   fath:          Fathom와 동일
   *   ch:            IntnlChain와 동일
   *   lnk:           IntnlLink와 동일
   *   us-in:         inches와 동일
   *   us-ft:         Foot과 돋일
   *   us-yd:         Yard와 동일
   *   us-ch:         GunterChain와 동일
   *   us-mi::        Mile과 동일
   *   ind-yd:        IndianYd37와 동일
   *   ind-ft:        IndianFt37와 동일
   *   ind-ch:        Indian Chain
   * </pre>
   * @type {Object}
   */
  INCHES_PER_UNIT: (function () {
    var meters_per_inch = .02540005080010160020;
    var inches_per_unit = {
      'inches': 1.0,
      'ft': 12.0,
      'mi': 63360.0,
      'm': 39.3701,
      'km': 39370.1,
      'dd': 4374754,
      'yd': 36,
      "nmi": 1852 * 39.3701,
      "in": 1.0, // inches
      "degrees": 4374754 // dd
    };

    olleh.maps.mixin(inches_per_unit, { // Units from CS-Map
      "Inch": 1.0,
      "Meter": 1.0 / meters_per_inch, //EPSG:9001
      "Foot": .30480060960121920243 / meters_per_inch, //EPSG:9003
      "IFoot": .30480000000000000000 / meters_per_inch, //EPSG:9002
      "ClarkeFoot": .3047972651151 / meters_per_inch, //EPSG:9005
      "SearsFoot": .30479947153867624624 / meters_per_inch, //EPSG:9041
      "GoldCoastFoot": .30479971018150881758 / meters_per_inch, //EPSG:9094
      "IInch": .02540000000000000000 / meters_per_inch,
      "MicroInch": .00002540000000000000 / meters_per_inch,
      "Mil": .00000002540000000000 / meters_per_inch,
      "Centimeter": .01000000000000000000 / meters_per_inch,
      "Kilometer": 1000.00000000000000000000 / meters_per_inch, //EPSG:9036
      "Yard": .91440182880365760731 / meters_per_inch,
      "SearsYard": .914398414616029 / meters_per_inch, //EPSG:9040
      "IndianYard": .91439853074444079983 / meters_per_inch, //EPSG:9084
      "IndianYd37": .91439523 / meters_per_inch, //EPSG:9085
      "IndianYd62": .9143988 / meters_per_inch, //EPSG:9086
      "IndianYd75": .9143985 / meters_per_inch, //EPSG:9087
      "IndianFoot": .30479951 / meters_per_inch, //EPSG:9080
      "IndianFt37": .30479841 / meters_per_inch, //EPSG:9081
      "IndianFt62": .3047996 / meters_per_inch, //EPSG:9082
      "IndianFt75": .3047995 / meters_per_inch, //EPSG:9083
      "Mile": 1609.34721869443738887477 / meters_per_inch,
      "IYard": .91440000000000000000 / meters_per_inch, //EPSG:9096
      "IMile": 1609.34400000000000000000 / meters_per_inch, //EPSG:9093
      "NautM": 1852.00000000000000000000 / meters_per_inch, //EPSG:9030
      "Lat-66": 110943.316488932731 / meters_per_inch,
      "Lat-83": 110946.25736872234125 / meters_per_inch,
      "Decimeter": .10000000000000000000 / meters_per_inch,
      "Millimeter": .00100000000000000000 / meters_per_inch,
      "Dekameter": 10.00000000000000000000 / meters_per_inch,
      "Decameter": 10.00000000000000000000 / meters_per_inch,
      "Hectometer": 100.00000000000000000000 / meters_per_inch,
      "GermanMeter": 1.0000135965 / meters_per_inch, //EPSG:9031
      "CaGrid": .999738 / meters_per_inch,
      "ClarkeChain": 20.1166194976 / meters_per_inch, //EPSG:9038
      "GunterChain": 20.11684023368047 / meters_per_inch, //EPSG:9033
      "BenoitChain": 20.116782494375872 / meters_per_inch, //EPSG:9062
      "SearsChain": 20.11676512155 / meters_per_inch, //EPSG:9042
      "ClarkeLink": .201166194976 / meters_per_inch, //EPSG:9039
      "GunterLink": .2011684023368047 / meters_per_inch, //EPSG:9034
      "BenoitLink": .20116782494375872 / meters_per_inch, //EPSG:9063
      "SearsLink": .2011676512155 / meters_per_inch, //EPSG:9043
      "Rod": 5.02921005842012 / meters_per_inch,
      "IntnlChain": 20.1168 / meters_per_inch, //EPSG:9097
      "IntnlLink": .201168 / meters_per_inch, //EPSG:9098
      "Perch": 5.02921005842012 / meters_per_inch,
      "Pole": 5.02921005842012 / meters_per_inch,
      "Furlong": 201.1684023368046 / meters_per_inch,
      "Rood": 3.778266898 / meters_per_inch,
      "CapeFoot": .3047972615 / meters_per_inch,
      "Brealey": 375.00000000000000000000 / meters_per_inch,
      "ModAmFt": .304812252984505969011938 / meters_per_inch,
      "Fathom": 1.8288 / meters_per_inch,
      "NautM-UK": 1853.184 / meters_per_inch,
      "50kilometers": 50000.0 / meters_per_inch,
      "150kilometers": 150000.0 / meters_per_inch
    });

    olleh.maps.mixin(inches_per_unit, { //unit abbreviations supported by PROJ.4
      "mm": inches_per_unit["Meter"] / 1000.0,
      "cm": inches_per_unit["Meter"] / 100.0,
      "dm": inches_per_unit["Meter"] * 100.0,
      "km": inches_per_unit["Meter"] * 1000.0,
      "kmi": inches_per_unit["nmi"], //International Nautical Mile
      "fath": inches_per_unit["Fathom"], //International Fathom
      "ch": inches_per_unit["IntnlChain"], //International Chain
      "link": inches_per_unit["IntnlLink"], //International Link
      "us-in": inches_per_unit["inches"], //U.S. Surveyor's Inch
      "us-ft": inches_per_unit["Foot"], //U.S. Surveyor's Foot
      "us-yd": inches_per_unit["Yard"], //U.S. Surveyor's Yard
      "us-ch": inches_per_unit["GunterChain"], //U.S. Surveyor's Chain
      "us-mi": inches_per_unit["Mile"], //U.S. Surveyor's Statute Mile
      "ind-yd": inches_per_unit["IndianYd37"], //Indian Yard
      "ind-ft": inches_per_unit["IndianFt37"], //Indian Foot
      "ind-ch": 20.11669506 / meters_per_inch //Indian Chain
    });
    
    return inches_per_unit;
  })(),

  /**
   * dot에 해당하는 인치값
   * @type Number
   */
  DOTS_PER_INCH: 72,

  /**
   * Unique id seed (incremented as new IDs are created)
   * @type {Number}
   */
  _ID_SEED: new Date().getTime(),

  /**
   * 중복되지 않는 랜덤숫자를 생성하여 반환한다.
   * <p/>
   * 파라미터로 <code>null</code> 또는 <code>''</code>를
   * 사요하면 prefix를 사용하지 않는 문자열 형태의 id를
   * 생성하여 반환한다.
   * @example
   * olleh.maps.util.genId(); // "ollehmap1339376987400"
   * olleh.maps.util.getId(null); // 1339376987401
   * olleh.maps.util.genId(''); // "1339376987402"
   * olleh.maps.util.genId('olleh'); // "olleh1339376987403"
   *
   * @param {String} [prefix] 생성될 id앞에 붙이는 prefix (default: 'ollehmap') 
   * @returns {String} 유일하게 생성된 id값
   */
  genId: function (prefix) {
    return (olleh.maps.isUndefined(prefix) ? 'ollehmap' : (prefix || '')) + (++olleh.maps.util._ID_SEED);
  },

  /**
   * 라디안 값으로 각도를 반환한다.
   * @example
   * olleh.maps.util.radToDeg(1.5707963267948966); // 90.0000000000002
   * @param {Float} degree 각도
   * @returns {Float}
   */
  radToDeg: function (radian) {
    return radian * 180 / Math.PI;
  },

  /**
   * 각도값으로 라디안 값을 반환한다.
   * @example
   * olleh.maps.util.degToRad(90); // 각도 90의 라디안값을 구한다. 1.5707963267948966
   * @param {Float} degree 각도
   * @returns {Float}
   */
  degToRad: function (degree) {
    return degree * Math.PI / 180; //  Math.PI / 180 : 1도의 값
  },

  /**
   * Convenience method to cast an object to a Number, rounded to the
   * desired floating point precision.
   * @param {Number|String} num Number 문자열인 경우 Number로 변환한다.
   * @param {Number} [precision=olleh.maps.util.DEFAULT_PRECISION] An integer suitable for use with
   *      Number.toPrecision(). If set to 0, no rounding is performed. 
   * @returns {Number} The cast, rounded number
   * @throws {TypeError} num이 Number type이 아니고, 숫자로 이루어진 문자열이 아닌 경우 에러를 발생시킨다.
   */
  toFloat: function (num, precision) {
    olleh.maps.isString(num) && (num = parseFloat(num));

    if (!olleh.maps.isNumber(num))
      throw new TypeError('Specified num is not Number type: ' + num);

    precision = precision || olleh.maps.util.DEFAULT_PRECISION;

    return precision === 0 ? num : parseFloat(num.toPrecision(precision));
  },

  /**
   * 축척(scale)값과 단위('km', 'cm'...)에 해당하는 resolution값을 반환한다.
   * @example
   * olleh.maps.util.getResolutionFromScale(25000);
   * olleh.maps.util.getResolutionFromScale(1/25000);
   * @param {Number} scale
   * @param {String} [units='Meter'] {@link olleh.maps.util.INCHES_PER_UNIT}에 정의되어 있는 단위.
   * @returns {Number}
   * @throws {TypeError} scale이 Number 타입이 아닌 경우 에러를 발생시킨다.
   */
  getResolutionFromScale: function (scale, units) {
    if (!olleh.maps.isNumber(scale))
      throw new TypeError('Specified scale is not Number type: ' + scale);

    var resolution;
    if (scale) {
      units = units || "Meter"; // olleh map에선 기본값이 Meter?
      var normScale = (scale > 1.0) ? (1.0 / scale) : scale;
      resolution = 1 / (normScale * this.INCHES_PER_UNIT[units] * this.DOTS_PER_INCH);
    }
    return resolution;
  },

  /**
   * resolution값과 단위('km', 'cm'...)에 해당하는 축척값(scale)값을 반환한다.
   * @example
   * olleh.maps.util.getScaleFromResolution(1024);
   * olleh.maps.util.getScaleFromResolution(2048);
   * @param {Number} resolution
   * @param {String} [units='Meter'] {@link olleh.maps.util.INCHES_PER_UNIT}에 정의되어 있는 단위.
   * @returns {Number}
   * @throws {TypeError} resolution이 Number 타입이 아닌 경우 에러를 발생시킨다.
   */
  getScaleFromResolution: function (resolution, units) {
    if (!olleh.maps.isNumber(resolution))
      throw new TypeError('Specified resolution is not Number type: ' + resolution);

    return resolution * this.INCHES_PER_UNIT[units || "Meter"] * this.DOTS_PER_INCH;
  },

  /**
   * 템플릿에 정의된 place holder를 주어진 값으로 치환하여 반환한다.
   * 템플릿에서 Place Holder는 주어진 data객체의 property 이름 앞과 뒤를
   * '#{' 와 '}'로 표시한다.
   * @example
   * var tmpl = '<h2>#{title}</h2><p>#{content}</p>';
   * var data = {title: 'Some title', content: 'Some cool content coming...'};
   * var result = olleh.maps.util.applyTemplate(tmpl, data);
   * // result value is '<h2>Some title</h2><p>Some cool content coming...</p>'
   * @param {String} tmpl 템플릿 문자열
   * @param {Object} data 치환하고자 하는 값을 가지고 있는 JSON객체
   */
  applyTemplate: function (tmpl, data) {
    var item, to, regexp = /#\{(\w+)\}/g;
    while (item = regexp.exec(tmpl)) {
      to = data[item[1]];
      if (to !== undefined && to !== null) {
        tmpl = tmpl.replace(new RegExp(item[0], 'g'), to);
        regexp.lastIndex = item.index;
      }
    }
    return tmpl;
  },

  /**
   * 배열에서 특정 elem을 찾아 첫번째 인덱스를 반환한다.
   * @param {Array} arr
   * @param {Object} elem 배열에서 찾을 element
   * @param {Number} fromIndex 찾기 시작하는 인덱스
   * @returns {Number}
   * @see http://www.ecma-international.org/ecma-262/5.1/#sec-15.4.4.14
   */
  indexOf: function (arr, elem, fromIndex) {
    var indexOf = arr.indexOf;

    if (indexOf) {
      return indexOf.call(arr, elem, fromIndex);
    }

    if (!olleh.maps.isArray(arr)) {
      throw new TypeError();
    }
    var len = arr.length;
    if (len === 0) {
      return -1;
    }
    var n = 0;
    if (arguments.length > 2) {
      n = Number(fromIndex);
      if (n != n) {
        n = 0;
      } else if (n != 0 && n != Infinity && n != -Infinity) {
        n = (n > 0 || -1) * Math.floor(Math.abs(n));
      }
    }
    if (n >= len) {
      return -1;
    }
    var k = n >= 0 ? n : Math.max(len - Math.abs(n), 0);
    for (; k < len; k++) {
      if (arr[k] === elem) {
        return k;
      }
    }
    return -1;
  },

  /**
   * 배열에서 특정 elem을 찾아 마지막 인덱스를 반환한다.
   * @param {Array} arr
   * @param {Object} elem 배열에서 찾을 element
   * @param {Number} fromIndex 찾기 시작하는 인덱스
   * @returns {Number}
   * @see http://www.ecma-international.org/ecma-262/5.1/#sec-15.4.4.15
   */
  lastIndexOf: function (arr, elem, fromIndex) {
    var lastIndexOf = arr.lastIndexOf;

    if (lastIndexOf) {
      return lastIndexOf.call(arr, elem, olleh.maps.isNumber(fromIndex) ? fromIndex : -1);
    }

    if (!olleh.maps.isArray(arr)) {
      throw new TypeError();
    }
    var len = arr.length;
    if (len === 0) {
      return -1;
    }
    var n = len;
    if (arguments.length > 2) {
      n = Number(fromIndex);
      if (n != n) {
        n = 0;
      } else if (n != 0 && n != Infinity && n != -Infinity) {
        n = (n > 0 || -1) * Math.floor(Math.abs(n));
      }
    }

    var k = n >= 0 ? Math.min(n, len - 1) : len - Math.abs(n);
    for (; k >= 0; k--) {
      if (arr[k] === elem) {
        return k;
      }
    }
    return -1;
  },

  /**
   * Array 에서 객체를 찾아서 제거한다.
   * @param {Array} arr
   * @param {Object} toRemove
   * @returns {Number} 삭제가 완료된 경우 삭제된 객체의 index, 삭제할 객체가 없으면 -1
   */
  removeFromArray: function (arr, toRemove) {
    var index = olleh.maps.util.indexOf(arr, toRemove);
    if (index > -1) {
      arr.splice(index, 1);
    }
    return index;
  },

  /**
   * 문자열 트림
   * @param {String} string
   * @returns {String}
   */
  trim: function (string) {
    var trim = string.trim;

    if (trim) {
      return trim.call(string);
    }

    var str = string.replace(/^\s+/, "");
    var end = str.length - 1;
    var ws = /\s/;

    while (ws.test(str.charAt(end))) {
      end--;
    }

    return str.slice(0, end + 1);
  },

  /**
   * src 객체의 프로퍼티들을 dest 객체에 그대로 복사한다.
   * @param {Object} dest 대상 객체
   * @param {Object} src 원본 객체
   * @param {Array} excludes 복사 대상에서 제외할 프로퍼티 이름
   */
  copyOpts: function (dest, src, excludes) {
    var p;
    for (p in src) {
      if (src.hasOwnProperty(p) && (!excludes || olleh.maps.util.indexOf(excludes, p) === -1)) {
        dest[p] = src[p];
      }
    }
    return dest;
  },

  /**
   * @param {Object} object
   * @returns {Object}
   */
  clone: function (object) {
    var i, clone;
    if (object == null) {
      clone = null;
    } else if (olleh.maps.isObject(object)) {
      if (olleh.maps.isArray(object)) {
        clone = [];
        for(i = 0; i < object.length ; i++) {
          clone[i] = olleh.maps.util.clone(object[i]);
        }
      } else if (olleh.maps.isDate(object)) {
        clone = new Date(object.getTime());
      } else if (olleh.maps.isRegExp(object)) {
        clone = new RegExp(object.source);
      } else if (object.clone) {
        clone = object.clone();
      } else {
        clone = {};
        for (i in object) {
          if (object.hasOwnProperty(i)) {
            clone[i] = object[i];
          }
        }
      }
    } else {
      clone = object;
    }
    return clone;
  },
  
  /**
   * string 이 prefix 로 시작하는 지 확인한다.
   * @returns {Boolean} string 이 prefix 로 시작하면 true
   */
  startsWith: function(str, prefix) {
    return str.slice(0, prefix.length) === prefix;
  },
  
  /**
   * 일정 시간 후에 함수가 실행되도록 만든다.
   * @param {Function} fn 실행할 함수
   * @param {Number} milis 지연할 시간
   * @param {Object} [ctx] context 객체
   * @param {Any} [args...] 함수에 전달할 파라메터들
   */
  delay: function (fn, milis, ctx, args) {
    args = Array.prototype.slice.call(arguments, 3);
    var curried = Function.prototype.bind.apply(fn, [ctx].concat(args));
    return window.setTimeout(curried, milis);
  },
  
  /**
   * 현재 콜스택이 클리어된 이후에 함수가 실행되도록 만든다.
   * @param {Function} fn 실행할 함수
   * @param {Object} [ctx] context 객체
   * @param {Any} [args...] 함수에 전달할 파라메터들
   */
  defer: function (fn, ctx, args) {
    args = Array.prototype.slice.call(arguments, 2);
    return olleh.maps.util.delay.apply(this, [fn, 1, ctx].concat(args));
  },
  
  /**
   * 다음 애니메이션 프레임에 함수가 실행되도록 만든다.
   * @param {Function} fn 실행할 함수
   * @param {Object} [ctx] context 객체
   * @param {Any} [args...] 함수에 전달할 파라메터들
   */
  deferAF: function (fn, ctx, args) {
    args = Array.prototype.slice.call(arguments, 2);
    //var curried = Function.prototype.bind.apply(fn, [ctx].concat(args)); 
    //bind할 시에 requestAnimationFrame 콜백함수의 첫번째 인자인 timeStamp값이 전달 되지 않음
    var curried = olleh.maps.curry.apply(this, [fn, ctx].concat(args));
    return window.requestAnimationFrame(curried);
  }
  
});
/**
 * DOM 처리관련 유틸리티 메소드들을 정의한다.
 * <h3>DOM Element 스타일 관련 유틸</h3>
 * <ul>
 *   <li>{@link olleh.maps.util.dom.getStyle}</li>
 *   <li>{@link olleh.maps.util.dom.getComputedStyle}</li>
 *   <li>{@link olleh.maps.util.dom.setStyle}</li>
 *   <li>{@link olleh.maps.util.dom.setStyles}</li>
 *   <li>{@link olleh.maps.util.dom.addClass}</li>
 *   <li>{@link olleh.maps.util.dom.hasClass}</li>
 *   <li>{@link olleh.maps.util.dom.removeClass}</li>
 *   <li>{@link olleh.maps.util.dom.toggleClass}</li>
 * </ul>
 * <h3>DOM Element 추가 삭제</h3>
 * <ul>
 *   <li>{@link olleh.maps.util.dom.elementOf}</li>
 *   <li>{@link olleh.maps.util.dom.pushElement}</li>
 *   <li>{@link olleh.maps.util.dom.popElement}</li>
 *   <li>{@link olleh.maps.util.dom.removeElements}</li>
 * </ul>
 * <h3>DOM Element 위치</h3>
 * <ul>
 *   <li>{@link olleh.maps.util.dom.getXY}</li>
 * </ul>
 */
olleh.maps.namespace('olleh.maps.util.dom', {
  
  /**
   * CSS UNIT
   * @private
   */
  CSS_UNITS: ['in', 'cm', 'mm', 'em', 'ex', 'pt', 'pc', 'px'],
  
  /**
   * DOM element에 인라인 스타일로 적용되어 있는 특정 스타일 값을 가져온다.
   * @example
   * 
   * var elem = document.getElementById('div1');
   * elem.style['background'] = 'red';
   * var value = olleh.maps.util.dom.getStyle(elem, 'background');  // red
   * 
   * @param {HTMLElement} elem DOM Element
   * @param {String} style 스타일 이름. Camel Notation로 기술한다.background-image -> backgroundImage
   * @returns {String} DOM Element의 해당 스타일 값
   */
  getStyle: function (elem, style) {
    if (!olleh.maps.isElement(elem)) {
      olleh.maps.log.error('Specified elem is not HTML Element: ' + elem);
      return;
    }

    style = olleh.maps.browser.style[style] || style;
    if (style.get) {
      return style.get(elem);
    }
    return elem.style[style];
  },

  /**
   * DOM Element를 브라우저가 스타일을 계산해서 반환한다.
   * @example
   * 
   * var elem = document.getElementById('div1');
   * ...
   * 
   * var value = olleh.maps.util.dom.getComputedStyle(elem, 'width');
   *  
   * @param {HTMLElement} elem DOM Element
   * @param {String} style 스타일 이름. Camel Notation로 기술한다.background-image -> backgroundImage
   * @returns {String} 브라우저가 계산한 DOM Element의 스타일 값
   */
  getComputedStyle: function (elem, style) {
    var ns = olleh.maps.util.dom;
    var n, t = null;

    var browserStyle = olleh.maps.browser.style;
    if (browserStyle[style]) {
      style = browserStyle[style];
      if (style.get) {
        return style.get(elem);
      }
    }
    
    if (elem.currentStyle) {
      t = elem.currentStyle[style];
      if (t == 'auto') {
        n = ns.hyphenToCamelCase('offset-' + style);
        if (n in elem) {
          t = elem[n];
        } else {
          t = '0';
        }
      }
    } else if (window.getComputedStyle) {
      t = document.defaultView.getComputedStyle(elem, null).getPropertyValue(
          ns.camelCaseToHyphen(style));
    }

    if (t == 'none') {
      if (style == 'transform') {
        t = 'matrix(1,0,0,1,0,0)';
      }
    }
    
    return t || ns.getStyle(elem, style);
  },
  
  /**
   * DOM Element에 인라인 스타일을 설정한다.
   * @example
   * var elem = document.getElementById('div1');
   * 
   * olleh.maps.util.dom.setStyle(elem, 'width', '100px');
   * olleh.maps.util.dom.setStyle(elem, 'paddingLeft', '10px');
   * var value = olleh.maps.util.dom.getStyle(elem, 'width'); // 100px
   * @param {HTMLElement} elem HTML 앨리먼트
   * @param {String} style 스타일 이름. Camel Notation로 기술한다.background-image -> backgroundImage 
   * @param {String} value 스타일 값
   * @see olleh.maps.util.dom.getStyle
   */
  setStyle: function (elem, style, value) {
    if (!olleh.maps.isElement(elem)) {
      olleh.maps.log.error('Specified elem is not HTML Element: ' + elem);
      return;
    }
    
    var browserStyle = olleh.maps.browser.style;
    
    if (browserStyle[style]) {
      style = browserStyle[style];
      if (style.set) {
        style.set(elem, value);
        return;
      }
    }
    
    elem.style[style] = value;
  },

  /**
   * DOM Element의 스타일을 json 형태로 설정할 수 있다.
   * @example
   * var elem = document.getElementById('div1');
   * 
   * olleh.maps.util.dom.setStlyes(elem, {
   *   'width': '100px',
   *   'height': '200px',
   *   'backgroundColor': 'red'
   * });
   * @param {HTMLElement} elem HTML element
   * @param {Object} styles style name 과 value 로 이루어진 Object Literals
   * @param {String} styles.style 스타일 이름. Camel Notation로 기술한다.background-image -> backgroundImage
   * @param {String} styles.value 스타일 값
   * @see olleh.maps.util.dom.setStyle 
   */
  setStyles: function (elem, styles) {
    var setStyle = olleh.maps.util.dom.setStyle;
    for (var k in styles) {
      setStyle(elem, k, styles[k]);
    }
  },

  /**
   * 명시된 DOM Element에 className을 설정한다.
   * @example
   * var elem = document.getElementById('div1');
   * 
   * olleh.maps.util.dom.addClass(elem, 'foo1');
   * olleh.maps.util.dom.addClass(elem, 'foo2');
   * 
   * @param {HTMLElement} elem HTML DOM Element
   * @param {String} className CSS 클래스 이름
   * @returns {Boolean} 성공적으로 CSS class가 설정되었다면 <code>true</code>를 반환한다.
   */
  addClass: function (elem, className) {
    if (!elem || !className) {
      return false;
    }
    var classList = elem.classList;
    if (classList) {
      classList.add(className);
      return true;
    } else if (olleh.maps.isString(elem.className)){
      if (!olleh.maps.util.dom.hasClass(elem, className)) {
        elem.className += (elem.className ? ' ' : '') + className;
        return true;
      }
    }
    return false;
  },

  /**
   * 명시된 DOM Element에 CSS className이 설정되었는지 확인하고
   * 그 결과를 반환한다.
   * @example
   * var elem = document.getElementById('div1');
   * 
   * olleh.maps.util.dom.addClass(elem, 'foo');
   * olleh.maps.log.info(olleh.maps.util.dom.hasClass(elem, 'foo')); // true
   * @param {HTMLElement} elem DOM Element
   * @param {String} className CSS클래스 이름
   * @returns {Boolean} 명시된 className이 설정되어 있다면 <code>true</code>를 반환한다.
   */
  hasClass: function (elem, className) {
    if (elem) {
      var classList = elem.classList;
      if (classList) {
        return classList.contains(className);
      } else {
        var elemClassName = elem.className;
        return (olleh.maps.isString(elemClassName) && 
            elemClassName.length > 0 && (elemClassName == className || 
            new RegExp('\\b' + className + '\\b').test(elemClassName)));
      }
    }
    return false;
  },

  /**
   * 명시된 HTML DOM에서 className을 제거한다.
   * @example
   * var elem = document.getElementById('div1');
   * 
   * olleh.maps.util.dom.addClass(elem, 'foo');
   * olleh.maps.log.info(olleh.maps.util.dom.hasClass(elem, 'foo')); // true
   * olleh.maps.util.dom.removeClass(elem, 'foo');
   * olleh.maps.log.info(olleh.maps.util.dom.hasClass(elem, 'foo')); // false 
   * @param {HTMLElement} elem DOM Element
   * @param {String} className css 클래스 이름
   * @returns {Boolean} 설공적으로 CSS class가 삭제되었다면 <code>true</code>를 반환한다.
   */
  removeClass: function (elem, className) {
    if (elem && className) {
      var classList = elem.classList;
      if (classList) {
        classList.remove(className);
      } else {
        if (olleh.maps.isString(elem.className)) {
          elem.className = elem.className.replace(new RegExp("(^|\\s+)" + 
              className + "(\\s+|$)"), ' ').replace(/^\s+/, '').replace(/\s+$/, '');
        }
      }
      return true;
    }
    return false;
  },

  /**
   * 명시된 DOM Element에서 oldClassName 스타일 클래스를 newClassName 스타일 클래스로 교체한다.<p/>
   * 만약 oldClassName가 설정되어 있지 않다면 newClassName스타일 클래스가 추가된다.
   * @exmple
   * var elem = document.getElementById('div1');
   * 
   * olleh.maps.util.dom.addClass(elem, 'foo1');
   * olleh.maps.log.info(olleh.maps.util.dom.hasClass(elem, 'foo1')); // true
   * olleh.maps.util.dom.replaceClass(elem, 'foo2');
   * olleh.maps.log.info(olleh.maps.util.dom.hasClass(elem, 'foo1')); // false 
   * olleh.maps.log.info(olleh.maps.util.dom.hasClass(elem, 'foo2')); // true 
   * @param {HTMLElement} elem DOM Element
   * @param {String} oldC 교체될 스타일 클래스 이름
   * @param {String} newC 교체할 스타일 클래스 이름
   * @returns {Boolean} 성공적으로 스타일 클래스가 교체되었다면 <code>true</code>를 반환한다.
   */
  replaceClass: function (elem, oldC, newC) {
    if (elem) {
      var classList = elem.classList;
      if (classList) {
        if (oldC) {
          classList.remove(oldC);
        }
        classList.add(newC);
      } else {
        var ns = olleh.maps.util.dom;
        if (ns.hasClass(elem, oldC)) {
          elem.className = elem.className.replace(new RegExp("(^|\\s+)" + 
              oldC + "(\\s+|$)"), ' ' + newC).replace(/^\s+/, '').replace(/\s+$/, '');
        } else {
          ns.addClass(elem, newC);
        }
      }
      return true;
    }
    return false;
  },

  /**
   * 명시된 DOM Element에서 oldClassName 스타일 클래스를 newClassName 스타일 클래스로 교체한다.<p/>
   * 만약 oldClassName가 설정되어 있지 않다면 newClassName스타일 클래스가 추가된다.
   * @exmple
   * var elem = document.getElementById('div1');
   * 
   * olleh.maps.util.dom.addClass(elem, 'foo1');
   * olleh.maps.log.info(olleh.maps.util.dom.hasClass(elem, 'foo1')); // true
   * olleh.maps.util.dom.toggleClass(elem, 'foo1');
   * olleh.maps.log.info(olleh.maps.util.dom.hasClass(elem, 'foo1')); // false
   * olleh.maps.util.dom.toggleClass(elem, 'foo1'); 
   * olleh.maps.log.info(olleh.maps.util.dom.hasClass(elem, 'foo1')); // true
   * @param {HTMLElement} dom HTML DOM Element
   * @param {String} oldClassName 교체될 스타일 클래스 이름
   * @param {String} newClassName 교체할 스타일 클래스 이름
   * @returns {Boolean} 성공적으로 스타일 클래스가 교체되었다면 true를 반환한다.
   */
  toggleClass: function (elem, name) {
    var ns = olleh.maps.util.dom;
    return ns.hasClass(elem, name) ? ns.removeClass(elem, name) : ns.addClass(elem, name);
  },

  /**
   * 명시된 id를 이용하여 해당 HTML 앨리먼트를 찾아
   * 반환한다.
   * @example
   * var elem = document.getElementById('div1');
   * 
   * var div1 = olleh.maps.util.dom.elementOf('div1');
   * 
   * olleh.maps.log.info(elem === div1);  // true
 
   * @param {String|Object} id 컴포넌트 id 또는 HTMLElement id
   * 또는 element키로 DOM element를 가지는 객체
   * @return {HTMLElement} DOM element specified by the id
   */
  elementOf: function (id) {
    return id ? document.getElementById(id) : null;
  },

  /**
   * 명시된 HTML 앨리먼트(elem)를 parent 노드의 첫번째
   * child로 추가한다.
   * @param {HTMLElement} parent 부모 DOM Element
   * @param {HTMLElement} elem 추가할 DOM Element
   * @returns {Boolean} 명시된 앵ㄹ리먼트(elm)가 성공적으로 추가되었으면
   * true를 반환한다.
   */
  pushElement: function (parent, elem) {
    if (parent.children && parent.children[0]) {
      return parent.insertBefore(elem, parent.children[0]) !== null;
    } else {
      return parent.appendChild(elem) !== null;
    }
  },

  /**
   * parent 노드의 Child노드들 중 첫번째 child노드를
   * 제거하고 제거된 노드를 반환한다.
   * @param {HTMLElement} parent 부모 DOM Element
   * @param {HTMLElement} elem 삭제할 DOM Element
   */
  popElement: function (parent, elem) {
    if (!parent) {
      parent = elem.parent;
    }
    if (parent && elem && parent.removeChild(elem)) {
      return elem;
    }
    return null;
  },

  /** 
   * 명시된 HTML 앨리먼트를 부모 노드로 부터 삭제한다.
   * 삭제할 앨리먼트를 comma(,)로 분리하여 복수개를 지정할
   * 수 있다.
   * @example
   * olleh.maps.util.dom.removeElements(div1);
   * olleh.maps.util.dom.removeElements(div1, div2, div3);
   * olleh.maps.util.dom.removeElements([div1, div2, div3]);
   * 
   * @param {...HTMLElement|Array.<HTMLElement>} elem 삭제할 DOM Element. DOM Element 배열 혹은 1개 이상의 DOM Element를 파라미터로 넘긴다.
   * @returns {Array.<HTMLElement>} 삭제된 HTML DOM Element 배열
   */
  removeElements: function (elem) {
    var i, e, r, elems, removed;
    var ns = olleh.maps.util.dom;
    if (arguments.length === 1 && elem.parentNode) {
      return elem.parentNode.removeChild(elem); // Remove a single DOM element
    } else if (arguments.length > 1) {
      elems = arguments; // Multiple parameters
    } else if (!olleh.maps.isString(elem) && elem.length) {
      elems = elem; // Single array parameter
    }

    // Handles Paramter/Element list removal
    removed = [];
    if (elems) {
      i = elems.length;
      while(i--) {
        e = elems[i];
        r = null;
        if (e.length) {
          r = ns.removeElements(e); // Recursively remove a list
        } else if (e.parentNode) {
          r = e.parentNode.removeChild(e); // Remove single DOM directly
        }

        // Update removed DOM list
        if (olleh.maps.isArray(r)) {
          removed.unshift.apply(removed, r);
        } else if (r) {
          removed.unshift(r);
        }
      }
    }
    return removed;
  },

  /** 
   * CSS 스타일에서 단위를 제거하고 값만을 숫자로 리턴한다.
   * @example
   * olleh.maps.util.extractValueFromStyle('200px') == 200.0 // true
   * @TODO olleh.maps.util 로 이동
   * @param {String} str CSS 스타일 문자열
   * @returns {Number} CSS 스타일의 숫자부
   */
  extractValueFromStyle: function (str) {
    try {
      var result = parseFloat(str);
      if (isNaN(result)) {
        return 0;
      }
      return result;
    } catch (e) {
      return 0;
    }
  },

  /** 
   * CSS 스타일에서 단위만을 리턴한다.
   * @example
   * olleh.maps.util.extractValueFromStyle('200px') == 'px' // true
   * @TODO olleh.maps.util 로 이동
   * @param {String} str CSS 스타일 문자열
   * @returns {String} CSS 스타일의 단위부
   */
  extractUnitFromStyle: function (str) {
    if (str === "") {
      return "";
    }
    var value = olleh.maps.util.dom.extractValueFromStyle(str);
    var unit = str.replace(value, "");
    return unit;
  },

  /**
   * 브라우저에 따라 하드웨어 가속을 활용할 수 있는 경우 translate3d를 반환한다.
   * 그렇지 않는 경우 translate를 반환한다.
   * @example
   * var str = olleh.maps.util.getTranslateString(100px, 100px); // translate3d(100px,100px,0) 혹은 translate(100px,100px)
   * @TODO olleh.maps.util 로 이동
   * @param {Number} x x offset
   * @param {Number} y y offset
   * @param {Boolean} use3D <code>false</code>면 3D를 지원하는 브라우저에서도 3D를 사용하지 않는다.
   * @returns {String}
   */
  getTranslateString: function (x, y, use3D) {
    var tmpl = olleh.maps.browser.has3D && use3D !== false ? 'translate3d(#{x}px, #{y}px, 0px)' : 'translate(#{x}px, #{y}px)';
    return olleh.maps.util.applyTemplate(tmpl, {
      x: x,
      y: y
    });
  },

  /**
   * 브라우저에 따라 하드웨어 가속을 활용할 수 있는 경우 scale3d를 반환한다.
   * 그렇지 않는 경우 scale를 반환한다.
   * @example
   * var str = olleh.maps.util.getScaleString(100px, 100px); // scale3d(2,2,1) 혹은 scale(2,2)
   * @TODO olleh.maps.util 로 이동
   * @param {Number} scale scale
   * @param {Boolean} use3D <code>false</code>면 3D를 지원하는 브라우저에서도 3D를 사용하지 않는다.
   * @returns {String}
   */
  getScaleString: function (scale, use3D) {
    var tmpl = olleh.maps.browser.has3D && use3D !== false ? 'scale3d(#{scale}, #{scale}, 1)' : 'scale(#{scale}, #{scale})';
    return olleh.maps.util.applyTemplate(tmpl, {
      scale: scale
    });
  },
  

  /**
   * Position 변경을 위한 left, top에 해당하는 스타일 값을 가지는 json 객체를 반환한다.
   * transform 이 지원되면 이를 활용하고 
   * 지원되지 않으면 left/top 속성을 변경하도록 한다.
   * @example
   * olleh.maps.util.getPositionStyles(100, 100); // {left: 100px, top: 100px}
   * olleh.maps.util.getPositionStyles(100, 100, true); // translate3d(100px,100px,0) 혹은 translate(100px,100px)
   * @TODO olleh.maps.util 로 이동
   * @param {Number} x x offset
   * @param {Number} y y offset
   * @param {Boolean} useTransform <code>false</code>면 transform을 지원하는 브라우저에서도 transform을 사용하지 않는다.
   * @param {Boolean} use3D <code>false</code>면 3D를 지원하는 브라우저에서도 3D를 사용하지 않는다. 
   * @returns {{transform: String} | {left: String, top: String}}
   */
  getPositionStyles: function (x, y, useTransform, use3D) {
    if (useTransform !== false && olleh.maps.browser.style.transform) {
      return {
        transform: olleh.maps.util.dom.getTranslateString(x, y, use3D)
      };
    }
    return {
      left: x + 'px',
      top: y + 'px'
    };
  },

  /**
   * json 형태로 스타일을 값을 유지하는 객체에서 좌표값을 얻어온다.
   * <p/>
   * 주로 animation 이 완료되기전에 중지된 경우 대상 DOM Element 의 좌표를 얻기 위해서 사용한다.
   * @example
   * olleh.maps.util.getPointFromStyle({left: 100px, top: 100px, background: red});
   * olleh.maps.util.getPointFromStyle({translate(100px, 200px), background: red});
   * olleh.maps.util.getPointFromStyle({translate3d(100px, 200px, 0), background: red});
   * @TODO olleh.maps.util 로 이동
   * @param {Object} styles
   * @returns {olleh.maps.Point}
   */
  getPointFromStyle: function (style) {
    var x = 0, y = 0;
    if (style.transform) {
      var parsed = olleh.maps.util.dom.parseStyleValue(style.transform);
      loop: for (var i = 0; i < parsed.length; i++) {
        var params = parsed[i].params;
        switch (parsed[i].name) {
        case 'translate': // translate(tx,ty)
        case 'translate3d': // translate3d(tx,ty,tz)
          x = params[0].value;
          y = params[1].value;
          break loop;
        case 'matrix': // matrix(1,0,0,1,tx,ty)
          x = params[4].value;
          y = params[5].value;
          break loop;
        case 'matrix3d': // matrix3d(1,0,0,0, 0,1,0,0, 0,0,1,0, tx,ty,tz,1)
          x = params[12].value;
          y = params[13].value;
          break loop;
        }
      }
    } else {
      style.left && (x = style.left);
      style.top && (y = style.top);
    }
    return new olleh.maps.Point(parseFloat(x), parseFloat(y));
  },

  /**
   * viewport(body) 가준으로 DOM element의 x,y 좌표를 구한다.
   * @param {HTMLElement} elem DOM element
   * @return {olleh.maps.Point} viewport(body) 기준으로 element의 x,y 좌표값을 반환한다. {x: 10, y:20} 
   */
  getXY: function (elem) {
    var webkitConvert = window.webkitConvertPointFromNodeToPage;
    if (webkitConvert) {
      var point = webkitConvert(elem, new WebKitPoint(0, 0));
      return new olleh.maps.Point(point.x, point.y);
    }
    var rect = elem.getBoundingClientRect();
    var pageXOffset = 0, pageYOffset = 0; 
    if (olleh.maps.isNumber(window.pageXOffset) && olleh.maps.isNumber(window.pageYOffset)) {
      pageXOffset = window.pageXOffset;
      pageYOffset = window.pageYOffset;
    } else {
      var body = document.body;
      var browser = olleh.maps.browser;
      var ie8 = (browser.browserName === browser.BROWSER_NAME.ie) &&(browser.browserVer < 9);

      pageXOffset = body.scrollLeft;
      pageYOffset = body.scrollTop +  ie8 ? document.documentElement.scrollTop : 0;
    }
    
    return new olleh.maps.Point(rect.left + pageXOffset, rect.top + pageYOffset)._round();
  },
  
  /**
   * 하이픈으로 표현한 CSS 속성을 camelCase로 변환한다.
   * @example
   * olleh.maps.util.hyphenToCamelCase('margin-top') === 'marginTop';
   * olleh.maps.util.hyphenToCamelCase('-webkit-transition') === 'webkitTransition'
   * @TODO olleh.maps.util 로 이동
   * @params {String} 하이픈으로 표현한 CSS 속성
   * @returns {String} camelCase로 표현된 CSS 속성
   */
  hyphenToCamelCase: function (str) {
    if(str.lastIndexOf('-', 0) === 0)
      str = str.substr(1);
    return str.replace(/-([a-z])/g, olleh.maps.util.dom._cbHyphenToCamelCase);
  },
  
  /**
   * @private
   */
  _cbHyphenToCamelCase: function (_, c) {
    return c.toUpperCase();
  },

  /**
   * camelCase로로 표현한 CSS 속성을 하이픈으로 변환한다.
   * @example
   * olleh.maps.util.hyphenToCamelCase('marginTop') === 'margin-top';
   * olleh.maps.util.hyphenToCamelCase('webkitTransition') === '-webkit-transition'
   * @TODO olleh.maps.util 로 이동
   * @params {String} camelCase로 표현한 CSS 속성
   * @returns {String} 하이픈으로 표현된 CSS 속성
   */
  camelCaseToHyphen: function (str) {
    var result = str.replace(/([A-Z])/g, olleh.maps.util.dom._cbCamelCaseToHyphen);
    if(result.lastIndexOf('webkit-', 0) === 0 || result.lastIndexOf('moz-', 0) === 0
        || result.lastIndexOf('ms-', 0) === 0 || result.lastIndexOf('o-', 0) === 0) {
      result = '-' + result;
    }
    return result;
  },
  
  /**
   * @private
   */
  _cbCamelCaseToHyphen: function (_, c) {
    return '-' + c.toLowerCase();
  },
  
  /**
   * @param {Array} value 
   * @TODO olleh.maps.util 로 이동
   * @returns {Array}
   */
  parseStyleValue: function (value) {
    var trim = olleh.maps.util.trim; 
    var uv = olleh.maps.util.dom.getUnitAndValue;
    var i, c, stack = [], opts = [], methodParams = [], methodName = null;
    
    if (!value) return opts;
    value = '' + value;
    
    for (i = 0; i < value.length; i++) {
      c = value.charAt(i);
      if (c == '(') {
        methodName = trim(stack.join(''));
        stack.length = 0;
        continue;
      } else if (c == ')') {
        if (stack.length > 0) {
          methodParams.push(uv(trim(stack.join(''))));
          stack = [];
        }
        opts.push({
          name: methodName,
          params: methodParams
        });
        methodName = null;
        methodParams = [];
        continue;
      } else if (c == ',' && methodName) {
        if (stack.length > 0) {
          methodParams.push(uv(trim(stack.join(''))));
          stack = [];
        }
      } else if(c == ' ' && !methodName) {
        if(stack.length > 0) {
          opts.push(uv(stack.join('')));
          stack = [];
        }
      } else {
        stack.push(c);
      }
    }
    if (stack.length > 0) {
      opts.push(uv(stack.join('')));
    }
    return opts;
  },
  
  /**
   * @param {Array} parsedStyle
   * @TODO olleh.maps.util 로 이동 
   * @returns {String}
   */
  parsedStyleToString: function (parsedStyle) {
    var i, j, s, methodResult, result = [];
    
    if (!parsedStyle) return '';
    
    for (i = 0; i < parsedStyle.length; i++) {
      s = parsedStyle[i];
      if (s.name) {
        methodResult = [];
        for (j = 0; j < s.params.length; j++) {
          methodResult.push(s.params[j].value + s.params[j].unit);
        }
        result.push(s.name + '(' + methodResult.join(', ') + ')');
      } else {
        result.push(s.value + s.unit);
      }
    }
    return result.join(' ');
  },
  
  /** 
   * CSS 속성의 값과 단위를 분리해 배열로 리턴한다.
   * px, em, %등을 단위로 간주하며, rgb(), url()등은 단위가 아닌 값으로 간주한다.
   * 단위가 존재하는 경우에는 값을 숫자로 변환해 리턴한다.
   * 단위가 존재하지 않을 경우에는 단위로 빈 문자열을 리턴한다.
   * 공백으로 구분된 값이 들어올 경우 전체를 값으로 간주하므로 먼저 split한 후 사용하여야 한다.
   *  
   * @example 
   * olleh.maps.util.extractValueFromStyle('200px') === [200, 'px'];
   * olleh.maps.util.extractValueFromStyle('0') === [0, ''];
   * olleh.maps.util.extractValueFromStyle('blue') === ['blue', ''];
   * olleh.maps.util.extractValueFromStyle('rgb(10,20,30)') === ['rgb(10,20,30)', ''];
   * olleh.maps.util.extractValueFromStyle('200px 100px') === ['200px 100px', ''];
   * @TODO olleh.maps.util 로 이동
   * @param {String} str CSS 스타일 문자열
   * @returns {Array} 0: CSS 스타일의 값, 1: CSS 스타일의 단위
   */
  getUnitAndValue: function (str) {
    var i, unit, value, floatValue;
    var CSS_UNITS = olleh.maps.util.dom.CSS_UNITS;
          
    if (str == '') {
      return { unit: '', value: '' };
    }
    
    if (str.slice(-1) == '%') {
      unit = '%';
      value = str.slice(0, -1);
    } else {
      i = olleh.maps.util.indexOf(CSS_UNITS, str.slice(-2));
      if (i == -1) {
        unit = '';
        value = str;
      } else {
        unit = CSS_UNITS[i];
        value = str.slice(0, -2);
      }
    }
    
    floatValue = parseFloat(value);
    
    if (floatValue != value) {
      return { unit: '', value: value + unit };
    } 
    return { unit: unit, value: floatValue };
  }
});
/**
 * 지도 구성 요소를 지도에 추가하는 방법을 정의 하는 인터페이스.
 * KT맵을 구성하는 구성 요소중 지도에 동적 추가/삭제가 가능한 요소들은 이 Adaptable 인터페이스를 
 * 구현하도록 한다. Adpatable 인터페이스를 구현하는 구성 요소를 지도에 추가할때는
 * setMap(map) 을 사용하고 제거할때는 setMap(null) 을 사용하면 된다.
 * Adaptable 은 mixin 용도로 만들어졌기 때문에 extend 하지 말고 mixin 으로 대상에 적용한다.
 * @group Base 
 */
$class('olleh.maps.Adaptable').define({
  
  /**
   * 지도 객체
   * @name map
   * @field
   * @memberof olleh.maps.Adaptable.prototype
   * @type olleh.maps.Map
   */
  /**
   * Service Id. Service Id 를 지정하면 지도에 추가할 때 
   * {@link olleh.maps.Map#services} 에도 자동으로 추가되어 serviceId 를 key 로
   * 해당 개체를 참조할 수 있다.
   * @name serviceId
   * @field
   * @memberof olleh.maps.Adaptable.prototype 
   * @type String
   */
  
  /**
   * 지도에 추가된 상태인지 여부를 리턴한다.
   * @return {boolean} 지도에 추가된 경우 <code>true</code>, 그렇지 않은 경우 <code>false</code>
   */
  isAttached: function () {
    return !!this.map;
  },

  /**
   * 지도 객체를 리턴한다.
   * @return {olleh.maps.Map} 지도에 추가된 경우 해당되는 {@link olleh.maps.Map} 객체, 그렇지 않을 경우 <code>null</code>. 
   */
  getMap: function () {
    return this.map;
  },
  
  /**
   * 지도에 Adaptable 구현체를 추가하거나 제거한다.
   * @param {olleh.maps.Map|null} map Adaptable 구현체가 추가될 지도. <code>null</code>일 경우 기존에 추가되었던 지도에서 삭제된다. 
   */
  setMap: function (map) {
    if (this.map != map) {
      if (this.map) {
        this._unregisterService();
        this.detach();
      }
      this.map = map;
      if (this.map) {
        this._registerService();
        this.attach();
      }
    }
  },
  
  /**
   *  map service registry 에서 제거
   * @private
   */
  _unregisterService: function() {
    if(this.serviceId) {
      this.map.services[this.serviceId] === this && delete this.map.services[this.serviceId];
    }
  },

  /**
   * service id 가 지정된 경우 map service registry 에 등록
   * @private
   */
  _registerService: function() {
    if(this.serviceId) {
      if(this.map.services[this.serviceId])
        olleh.maps.log('[Warning] Duplicate service id: ' + this.serviceId);
      else
        this.map.services[this.serviceId] = this;
    }
  },
  
  /**
   * 지도에 추가될 때 호출되는 함수이다. {@link olleh.maps.Adaptable} 구현체는
   * 이 함수에서 지도에 추가되는 시점에 수행해야 할 동작을 정의해야 한다.
   * 이 함수가 불리는 시점에 {@link olleh.maps.Adaptable#map} 의 값은 Adaptable 구현체가 추가된 {@link olleh.maps.Map} 객체임이 보장된다.
   */
  attach: function () {
  },

  /**
   * 지도에서 제거될 때 호출되는 함수이다. {@link olleh.maps.Adaptable}을 구현체는
   * 이 함수에서 지도에서 제거되는 시점에 수행해야 할 동작을 정의해야 한다.
   * 이 함수가 불리는 시점에 {@link olleh.maps.Adaptable#map}은 기존에 Adaptable 구현체가 추가되었던 {@link olleh.maps.Map} 객체임이 보장된다.
   */
  detach: function () {
  }
});
/**
 * PluginInfo 에서는 Plugin 에 관련된 정보들을 정의한다. 
 * @typedef olleh.maps.PluginInfo 
 * @property {String} [label] PluginControl 등에서 사용자에게 표시되는 라벨
 * @property {String} [group] group 을 지정하면 PluginControl 에서 그룹지어 표시된다.
 * @property {Boolean} [autoActivate=false] true 이면 plugin 이 지도에 추가되는 시점에 자동으로 activate() 를 호출해준다. 
 * @property {boolean} [drawingTool=false] Drawing tool 로 등록된다. Drawing tool 로 등록된 plugin 은 항상 하나의 plugin 만 active 되며
 * 다른 drawing tool plugin 은 자동으로 deactivate 된다.  
 */

/**
 * Plugin 은 동적으로 활성화/비활성화될 수 있는 지도 구성요소에 대한 interface 이다. 
 */
$class('olleh.maps.Plugin').mixin(olleh.maps.Adaptable).define({

  /**
   * Plugin 에 관한 여러가지 정보를 정의한다.
   * @name olleh.maps.Plugin#pluginInfo
   * @type olleh.maps.PluginInfo
   */
  /**
   * pluginInfo 를 설정하기 위한 함수. 기존 pluginInfo 속성을 모두 대체하지 않고
   * 지정된 속성만 대체한다.
   * @param {olleh.maps.PluginInfo} 
   */
  setPluginInfo: function(pluginInfo) {
    var current = olleh.maps.util.clone(this.pluginInfo);
    this.pluginInfo = olleh.maps.mixin(current, pluginInfo, true);
  },

  /**
   * 지도에 Plugin 구현체를 추가하거나 제거한다.  오버라이드 해서는 안된다.
   * @param {olleh.maps.Map|null} map Plugin 구현체가 추가될 지도. <code>null</code>일 경우 기존에 추가되었던 지도에서 삭제된다. 
   */
  setMap: function (map) {
    if (this.map != map) {
      if (this.map) {
        this._unregisterService();
        this.map.pluginRegistry.remove(this);
        this.deactivate();
        this.detach();
      }
      this.map = map;
      if (map) {
        this._registerService();
        this.map.pluginRegistry.add(this);
        this.attach();
        if(this.pluginInfo && this.pluginInfo.autoActivate) {
          if(map.isStarted()) {
            this.activate();
          } else {
            var callActivate = function() {
              this.activate();
              this.map.unsubscribeEvent(callActivate);
            };
            map.onEvent('started', callActivate, this);
          }
        }
      }
    }
  },

  /**
   * Plugin 활성화 여부를 반환한다.  오버라이드 해서는 안된다.
   * @returns {Boolean}
   */
  isActive: function () {
    return !!this._active;
  },

  /**
   * Plugin 을 활성화시킨다. 오버라이드 해서는 안된다.
   */
  activate: function () {
    if (!this.isAttached() || this.isActive())
      return;
    if(this.map && this.pluginInfo && this.pluginInfo.drawingTool) {
      this.map.pluginRegistry.drawingToolActivate(this);
    }
    this.doActivate();
    this.setActive(true);
  },

  /**
   * 플러그인이 activate 되거나 deactive 될때 발생하는 이벤트
   * @name plugin_state_changed
   * @event
   * @memberOf olleh.maps.PluginRegistry.prototype
   * @param {olleh.maps.event.Event} event
   */
  /**
   * active 상태를 변경하고 이벤트를 fire 한다.
   * doActivate() 를 호출할 필요가 없는 경우에만 직접 호출해야 하며 일반적으로는 activate() 를 호출해야 한다. 
   * @param active
   * @private 
   */
  setActive: function(active) {
    this._active = active;
    if(this.map) {
      this.map.pluginRegistry.fireEvent('plugin_state_changed', {
        plugin: this,
        active: active
      });
    }
  },

  /**
   * Plugin 을 비활성화시킨다.  오버라이드 해서는 안된다.
   */
  deactivate: function () {
    if (!this.isAttached() || !this.isActive())
      return;
    this.doDeactivate();
    this.setActive(false);
  },

  /**
   * Plugin 이 활성화 될때 호출되는 함수. Plugin 구현체는 이 함수에서 활성화시에 수행해야할 동작을 정의해야 한다.
   * @private 
   */
  doActivate: function () {
    // Clients should implments this
  },

  /**
   * Plugin 이 비활성화 될때 호출되는 함수. Plugin 구현체는 이 함수에서 비활성화시에 수행해야할 동작을 정의해야 한다.
   * @private
   */
  doDeactivate: function () {
    // Clients should implments this
  }

});
/**
 * 클래스의 인스턴스를 생성할 경우 상속관계에 있는 생성자에서 업무로직을 수행할 경우 발생할 수 있는
 * 오동작을 방지하기 위해 제공하는 클래스이다.
 * 
 * 일반적으로 클래스 생성자는 클래스의 인스턴스가 생성될 때 해당 객체의 초기상태를 설정하는 작업을 수행하며
 * 인스턴스 생성 후 인스턴스 메소드를 통해 객체의 오퍼레이션을 수행하거나 객체의 상태를 변경시키게 된다.
 * 하지만 클래스 생성자에서 초기상태 설정이 아닌 업무로직을 수행하게 된다면 상속관계에 있는 클래스 생성자들이
 * 상태의 일관성을 유지할 수 없어 예기치 않은 오류를 발생시킬 가능성이 있다.<p/>
 * 
 * 또한, 생성자에서 업무로직을 수행해야할 필요가 있을 경우 이 업무로직은 객체의 모든 상태가 초기화 된 다음
 * 최종적으로 수행해야 상태의 불일치로 인해 발생할 수 있는 오류를 방지할 수 있다.<p/>
 * 
 * {@link olleh.maps.Initializable}은 이런 문제를 해결하기 위해 제공되는 클래스이며 이 클래스
 * 를 상속받는 클래스들은 {@link olleh.maps.Initializable#init} 메소드를 오버라이드함으로써
 * 생성자의 모든 동작이 수행된 후 최종적으로 callback받을 수 있다. 따라서 {@link olleh.maps.Initializable#init} 메소드에서
 * 업무로직을 수행하면 객체 생성시 상태의 불일치로 인해 발생할 수 있는 오류는 회피할 수 있다.<p/>

 * 아래의 코드에서 olleh.maps.Initializable 클래스를 상속하지 않고 생성자 내에서 setMap 메소드를
 * 실행한다면 foo.Bar클래스를 상속받은 foo.Baz 클래스에서는 opts의 property를 변경하더라도
 * setMap 메소드 수행시 이 변경된 값이 반영되지 않는 오동작이 발생할 수 있다. <p/>
 * 하지만 생성자에서는 업무로직 수행없이 속성값만 저장하고 최종적으로 init 메소드에서 업무로직을 수행하면 이런
 * 오동작을 통한 오류를 방지할 수 있다. 
 * @example
 * $('foo.Bar').extend(olleh.maps.Initializable).define({
 *   Bar: function (opts) {
 *     this.opts = opts;
 *     //this.setMap(opts.map); <-- erroneous use
 *   },
 *   
 *   init: function () { // called back after instance construction
 *     this.setMap(this.opts.map);
 *   },
 *   
 *   setMap: function (map) {
 *     ...
 *   },
 *   
 *   ...
 * });
 * 
 * $('foo.Baz').extend(foo.Bar).define({
 *   Baz: function (opts) {
 *     // tweak opts properties
 *     this.opts.xxx = ...
 *   }
 * });
 */
$class('olleh.maps.Initializable').define({
  
  /**
   * 이 클래스는 직접 생성할 수 없다.
   */
  Initializable: function () {
    var $constructor = this.$constructor;
    if ($constructor) {
      // wrap origin constructor and do indirect call
      this.$constructor = function () {
        $constructor.apply(this, arguments);
        this.init();
      };
    } else {
      this.$constructor = this.init;
    }
  },
  
  /**
   * 상속관계에 있는 모든 클래스의 생성자가 수행된 후 최종적으로 callback을 받는다. Initializable 클래스를
   * 상속받은 클래스들은 init메소드를 오버라이드 함으로써 해당 클래스에서 수행할 업무로직을 처리할 수 있다. 
   */
  init: function () {
    // do nothing
  }
});/*
Author:       Mike Adair madairATdmsolutions.ca
              Richard Greenwood rich@greenwoodmap.com
License:      LGPL as per: http://www.gnu.org/copyleft/lesser.html

$Id: Proj.js 2956 2007-07-09 12:17:52Z steven $
*/

/**
 * Namespace: Proj4js
 *
 * Proj4js is a JavaScript library to transform point coordinates from one 
 * coordinate system to another, including datum transformations.
 *
 * This library is a port of both the Proj.4 and GCTCP C libraries to JavaScript. 
 * Enabling these transformations in the browser allows geographic data stored 
 * in different projections to be combined in browser-based web mapping 
 * applications.
 * 
 * Proj4js must have access to coordinate system initialization strings (which
 * are the same as for PROJ.4 command line).  Thes can be included in your 
 * application using a <script> tag or Proj4js can load CS initialization 
 * strings from a local directory or a web service such as spatialreference.org.
 *
 * Similarly, Proj4js must have access to projection transform code.  These can
 * be included individually using a <script> tag in your page, built into a 
 * custom build of Proj4js or loaded dynamically at run-time.  Using the
 * -combined and -compressed versions of Proj4js includes all projection class
 * code by default.
 *
 * Note that dynamic loading of defs and code happens ascynchrously, check the
 * Proj.readyToUse flag before using the Proj object.  If the defs and code
 * required by your application are loaded through script tags, dynamic loading
 * is not required and the Proj object will be readyToUse on return from the 
 * constructor.
 * 
 * All coordinates are handled as points which have a .x and a .y property
 * which will be modified in place.
 *
 * Override Proj4js.reportError for output of alerts and warnings.
 *
 * See http://trac.osgeo.org/proj4js/wiki/UserGuide for full details.
*/

/**
 * Global namespace object for Proj4js library
 */
var Proj4js = {

    /**
     * Property: defaultDatum
     * The datum to use when no others a specified
     */
    defaultDatum: 'WGS84',                  //default datum

    /** 
    * Method: transform(source, dest, point)
    * Transform a point coordinate from one map projection to another.  This is
    * really the only public method you should need to use.
    *
    * Parameters:
    * source - {Proj4js.Proj} source map projection for the transformation
    * dest - {Proj4js.Proj} destination map projection for the transformation
    * point - {Object} point to transform, may be geodetic (long, lat) or
    *     projected Cartesian (x,y), but should always have x,y properties.
    */
    transform: function(source, dest, point) {
        if (!source.readyToUse) {
            this.reportError("Proj4js initialization for:"+source.srsCode+" not yet complete");
            return point;
        }
        if (!dest.readyToUse) {
            this.reportError("Proj4js initialization for:"+dest.srsCode+" not yet complete");
            return point;
        }
        
        // Workaround for datum shifts towgs84, if either source or destination projection is not wgs84
        if (source.datum && dest.datum && (
            ((source.datum.datum_type == Proj4js.common.PJD_3PARAM || source.datum.datum_type == Proj4js.common.PJD_7PARAM) && dest.datumCode != "WGS84") ||
            ((dest.datum.datum_type == Proj4js.common.PJD_3PARAM || dest.datum.datum_type == Proj4js.common.PJD_7PARAM) && source.datumCode != "WGS84"))) {
            var wgs84 = Proj4js.WGS84;
            this.transform(source, wgs84, point);
            source = wgs84;
        }

        // DGR, 2010/11/12
        if (source.axis!="enu") {
            this.adjust_axis(source,false,point);
        }

        // Transform source points to long/lat, if they aren't already.
        if ( source.projName=="longlat") {
            point.x *= Proj4js.common.D2R;  // convert degrees to radians
            point.y *= Proj4js.common.D2R;
        } else {
            if (source.to_meter) {
                point.x *= source.to_meter;
                point.y *= source.to_meter;
            }
            source.inverse(point); // Convert Cartesian to longlat
        }

        // Adjust for the prime meridian if necessary
        if (source.from_greenwich) { 
            point.x += source.from_greenwich; 
        }

        // Convert datums if needed, and if possible.
        point = this.datum_transform( source.datum, dest.datum, point );

        // Adjust for the prime meridian if necessary
        if (dest.from_greenwich) {
            point.x -= dest.from_greenwich;
        }

        if( dest.projName=="longlat" ) {             
            // convert radians to decimal degrees
            point.x *= Proj4js.common.R2D;
            point.y *= Proj4js.common.R2D;
        } else  {               // else project
            dest.forward(point);
            if (dest.to_meter) {
                point.x /= dest.to_meter;
                point.y /= dest.to_meter;
            }
        }

        // DGR, 2010/11/12
        if (dest.axis!="enu") {
            this.adjust_axis(dest,true,point);
        }

        return point;
    }, // transform()

    /** datum_transform()
      source coordinate system definition,
      destination coordinate system definition,
      point to transform in geodetic coordinates (long, lat, height)
    */
    datum_transform : function( source, dest, point ) {

      // Short cut if the datums are identical.
      if( source.compare_datums( dest ) ) {
          return point; // in this case, zero is sucess,
                    // whereas cs_compare_datums returns 1 to indicate TRUE
                    // confusing, should fix this
      }

      // Explicitly skip datum transform by setting 'datum=none' as parameter for either source or dest
      if( source.datum_type == Proj4js.common.PJD_NODATUM
          || dest.datum_type == Proj4js.common.PJD_NODATUM) {
          return point;
      }

      // Do we need to go through geocentric coordinates?
      if( source.es != dest.es || source.a != dest.a
          || source.datum_type == Proj4js.common.PJD_3PARAM
          || source.datum_type == Proj4js.common.PJD_7PARAM
          || dest.datum_type == Proj4js.common.PJD_3PARAM
          || dest.datum_type == Proj4js.common.PJD_7PARAM)
      {

        // Convert to geocentric coordinates.
        source.geodetic_to_geocentric( point );
        // CHECK_RETURN;

        // Convert between datums
        if( source.datum_type == Proj4js.common.PJD_3PARAM || source.datum_type == Proj4js.common.PJD_7PARAM ) {
          source.geocentric_to_wgs84(point);
          // CHECK_RETURN;
        }

        if( dest.datum_type == Proj4js.common.PJD_3PARAM || dest.datum_type == Proj4js.common.PJD_7PARAM ) {
          dest.geocentric_from_wgs84(point);
          // CHECK_RETURN;
        }

        // Convert back to geodetic coordinates
        dest.geocentric_to_geodetic( point );
          // CHECK_RETURN;
      }

      return point;
    }, // cs_datum_transform

    /**
     * Function: adjust_axis
     * Normalize or de-normalized the x/y/z axes.  The normal form is "enu"
     * (easting, northing, up).
     * Parameters:
     * crs {Proj4js.Proj} the coordinate reference system
     * denorm {Boolean} when false, normalize
     * point {Object} the coordinates to adjust
     */
    adjust_axis: function(crs, denorm, point) {
        var xin= point.x, yin= point.y, zin= point.z || 0.0;
        var v, t;
        for (var i= 0; i<3; i++) {
            if (denorm && i==2 && point.z===undefined) { continue; }
                 if (i==0) { v= xin; t= 'x'; }
            else if (i==1) { v= yin; t= 'y'; }
            else           { v= zin; t= 'z'; }
            switch(crs.axis[i]) {
            case 'e':
                point[t]= v;
                break;
            case 'w':
                point[t]= -v;
                break;
            case 'n':
                point[t]= v;
                break;
            case 's':
                point[t]= -v;
                break;
            case 'u':
                if (point[t]!==undefined) { point.z= v; }
                break;
            case 'd':
                if (point[t]!==undefined) { point.z= -v; }
                break;
            default :
                alert("ERROR: unknow axis ("+crs.axis[i]+") - check definition of "+crs.projName);
                return null;
            }
        }
        return point;
    },

    /**
     * Function: reportError
     * An internal method to report errors back to user. 
     * Override this in applications to report error messages or throw exceptions.
     */
    reportError: function(msg) {
      //console.log(msg);
    },

/**
 *
 * Title: Private Methods
 * The following properties and methods are intended for internal use only.
 *
 * This is a minimal implementation of JavaScript inheritance methods so that 
 * Proj4js can be used as a stand-alone library.
 * These are copies of the equivalent OpenLayers methods at v2.7
 */
 
/**
 * Function: extend
 * Copy all properties of a source object to a destination object.  Modifies
 *     the passed in destination object.  Any properties on the source object
 *     that are set to undefined will not be (re)set on the destination object.
 *
 * Parameters:
 * destination - {Object} The object that will be modified
 * source - {Object} The object with properties to be set on the destination
 *
 * Returns:
 * {Object} The destination object.
 */
    extend: function(destination, source) {
      destination = destination || {};
      if(source) {
          for(var property in source) {
              var value = source[property];
              if(value !== undefined) {
                  destination[property] = value;
              }
          }
      }
      return destination;
    },

/**
 * Constructor: Class
 * Base class used to construct all other classes. Includes support for 
 *     multiple inheritance. 
 *  
 */
    Class: function() {
      var Class = function() {
          this.initialize.apply(this, arguments);
      };
  
      var extended = {};
      var parent;
      for(var i=0; i<arguments.length; ++i) {
          if(typeof arguments[i] == "function") {
              // get the prototype of the superclass
              parent = arguments[i].prototype;
          } else {
              // in this case we're extending with the prototype
              parent = arguments[i];
          }
          Proj4js.extend(extended, parent);
      }
      Class.prototype = extended;
      
      return Class;
    },

    /**
     * Function: bind
     * Bind a function to an object.  Method to easily create closures with
     *     'this' altered.
     * 
     * Parameters:
     * func - {Function} Input function.
     * object - {Object} The object to bind to the input function (as this).
     * 
     * Returns:
     * {Function} A closure with 'this' set to the passed in object.
     */
    bind: function(func, object) {
        // create a reference to all arguments past the second one
        var args = Array.prototype.slice.apply(arguments, [2]);
        return function() {
            // Push on any additional arguments from the actual function call.
            // These will come after those sent to the bind call.
            var newArgs = args.concat(
                Array.prototype.slice.apply(arguments, [0])
            );
            return func.apply(object, newArgs);
        };
    },
    
/**
 * The following properties and methods handle dynamic loading of JSON objects.
 */
 
    /**
     * Property: scriptName
     * {String} The filename of this script without any path.
     */
    scriptName: "proj4js.js",

    /**
     * Property: defsLookupService
     * AJAX service to retreive projection definition parameters from
     */
    defsLookupService: 'http://spatialreference.org/ref',

    /**
     * Property: libPath
     * internal: http server path to library code.
     */
    libPath: null,

    /**
     * Function: getScriptLocation
     * Return the path to this script.
     *
     * Returns:
     * Path to this script
     */
    getScriptLocation: function () {
        if (this.libPath) return this.libPath;
        var scriptName = this.scriptName;
        var scriptNameLen = scriptName.length;

        var scripts = document.getElementsByTagName('script');
        for (var i = 0; i < scripts.length; i++) {
            var src = scripts[i].getAttribute('src');
            if (src) {
                var index = src.lastIndexOf(scriptName);
                // is it found, at the end of the URL?
                if ((index > -1) && (index + scriptNameLen == src.length)) {
                    this.libPath = src.slice(0, -scriptNameLen);
                    break;
                }
            }
        }
        return this.libPath||"";
    },

    /**
     * Function: loadScript
     * Load a JS file from a URL into a <script> tag in the page.
     * 
     * Parameters:
     * url - {String} The URL containing the script to load
     * onload - {Function} A method to be executed when the script loads successfully
     * onfail - {Function} A method to be executed when there is an error loading the script
     * loadCheck - {Function} A boolean method that checks to see if the script 
     *            has loaded.  Typically this just checks for the existance of
     *            an object in the file just loaded.
     */
    loadScript: function(url, onload, onfail, loadCheck) {
      var script = document.createElement('script');
      script.defer = false;
      script.type = "text/javascript";
      script.id = url;
      script.src = url;
      script.onload = onload;
      script.onerror = onfail;
      script.loadCheck = loadCheck;
      if (/MSIE/.test(navigator.userAgent)) {
        script.onreadystatechange = this.checkReadyState;
      }
      document.getElementsByTagName('head')[0].appendChild(script);
    },
    
    /**
     * Function: checkReadyState
     * IE workaround since there is no onerror handler.  Calls the user defined 
     * loadCheck method to determine if the script is loaded.
     * 
     */
    checkReadyState: function() {
      if (this.readyState == 'loaded') {
        if (!this.loadCheck()) {
          this.onerror();
        } else {
          this.onload();
        }
      }
    }
};

/**
 * Class: Proj4js.Proj
 *
 * Proj objects provide transformation methods for point coordinates
 * between geodetic latitude/longitude and a projected coordinate system. 
 * once they have been initialized with a projection code.
 *
 * Initialization of Proj objects is with a projection code, usually EPSG codes,
 * which is the key that will be used with the Proj4js.defs array.
 * 
 * The code passed in will be stripped of colons and converted to uppercase
 * to locate projection definition files.
 *
 * A projection object has properties for units and title strings.
 */
Proj4js.Proj = Proj4js.Class({

  /**
   * Property: readyToUse
   * Flag to indicate if initialization is complete for this Proj object
   */
  readyToUse: false,   
  
  /**
   * Property: title
   * The title to describe the projection
   */
  title: null,  
  
  /**
   * Property: projName
   * The projection class for this projection, e.g. lcc (lambert conformal conic,
   * or merc for mercator).  These are exactly equivalent to their Proj4 
   * counterparts.
   */
  projName: null,
  /**
   * Property: units
   * The units of the projection.  Values include 'm' and 'degrees'
   */
  units: null,
  /**
   * Property: datum
   * The datum specified for the projection
   */
  datum: null,
  /**
   * Property: x0
   * The x coordinate origin
   */
  x0: 0,
  /**
   * Property: y0
   * The y coordinate origin
   */
  y0: 0,
  /**
   * Property: localCS
   * Flag to indicate if the projection is a local one in which no transforms
   * are required.
   */
  localCS: false,

  /**
  * Property: queue
  * Buffer (FIFO) to hold callbacks waiting to be called when projection loaded.
  */
  queue: null,

  /**
  * Constructor: initialize
  * Constructor for Proj4js.Proj objects
  *
  * Parameters:
  * srsCode - a code for map projection definition parameters.  These are usually
  * (but not always) EPSG codes.
  */
  initialize: function(srsCode, callback) {
      this.srsCodeInput = srsCode;
      
      //Register callbacks prior to attempting to process definition
      this.queue = [];
      if( callback ){
           this.queue.push( callback );
      }
      
      //check to see if this is a WKT string
      if ((srsCode.indexOf('GEOGCS') >= 0) ||
          (srsCode.indexOf('GEOCCS') >= 0) ||
          (srsCode.indexOf('PROJCS') >= 0) ||
          (srsCode.indexOf('LOCAL_CS') >= 0)) {
            this.parseWKT(srsCode);
            this.deriveConstants();
            this.loadProjCode(this.projName);
            return;
      }
      
      // DGR 2008-08-03 : support urn and url
      if (srsCode.indexOf('urn:') == 0) {
          //urn:ORIGINATOR:def:crs:CODESPACE:VERSION:ID
          var urn = srsCode.split(':');
          if ((urn[1] == 'ogc' || urn[1] =='x-ogc') &&
              (urn[2] =='def') &&
              (urn[3] =='crs')) {
              srsCode = urn[4]+':'+urn[urn.length-1];
          }
      } else if (srsCode.indexOf('http://') == 0) {
          //url#ID
          var url = srsCode.split('#');
          if (url[0].match(/epsg.org/)) {
            // http://www.epsg.org/#
            srsCode = 'EPSG:'+url[1];
          } else if (url[0].match(/RIG.xml/)) {
            //http://librairies.ign.fr/geoportail/resources/RIG.xml#
            //http://interop.ign.fr/registers/ign/RIG.xml#
            srsCode = 'IGNF:'+url[1];
          }
      }
      this.srsCode = srsCode.toUpperCase();
      if (this.srsCode.indexOf("EPSG") == 0) {
          this.srsCode = this.srsCode;
          this.srsAuth = 'epsg';
          this.srsProjNumber = this.srsCode.substring(5);
      // DGR 2007-11-20 : authority IGNF
      } else if (this.srsCode.indexOf("IGNF") == 0) {
          this.srsCode = this.srsCode;
          this.srsAuth = 'IGNF';
          this.srsProjNumber = this.srsCode.substring(5);
      // DGR 2008-06-19 : pseudo-authority CRS for WMS
      } else if (this.srsCode.indexOf("CRS") == 0) {
          this.srsCode = this.srsCode;
          this.srsAuth = 'CRS';
          this.srsProjNumber = this.srsCode.substring(4);
      } else {
          this.srsAuth = '';
          this.srsProjNumber = this.srsCode;
      }
      
      this.loadProjDefinition();
  },
  
/**
 * Function: loadProjDefinition
 *    Loads the coordinate system initialization string if required.
 *    Note that dynamic loading happens asynchronously so an application must 
 *    wait for the readyToUse property is set to true.
 *    To prevent dynamic loading, include the defs through a script tag in
 *    your application.
 *
 */
    loadProjDefinition: function() {
      //check in memory
      if (Proj4js.defs[this.srsCode]) {
        this.defsLoaded();
        return;
      }

      //else check for def on the server
      var url = Proj4js.getScriptLocation() + 'defs/' + this.srsAuth.toUpperCase() + this.srsProjNumber + '.js';
      Proj4js.loadScript(url, 
                Proj4js.bind(this.defsLoaded, this),
                Proj4js.bind(this.loadFromService, this),
                Proj4js.bind(this.checkDefsLoaded, this) );
    },

/**
 * Function: loadFromService
 *    Creates the REST URL for loading the definition from a web service and 
 *    loads it.
 *
 */
    loadFromService: function() {
      //else load from web service
      var url = Proj4js.defsLookupService +'/' + this.srsAuth +'/'+ this.srsProjNumber + '/proj4js/';
      Proj4js.loadScript(url, 
            Proj4js.bind(this.defsLoaded, this),
            Proj4js.bind(this.defsFailed, this),
            Proj4js.bind(this.checkDefsLoaded, this) );
    },

/**
 * Function: defsLoaded
 * Continues the Proj object initilization once the def file is loaded
 *
 */
    defsLoaded: function() {
      this.parseDefs();
      this.loadProjCode(this.projName);
    },
    
/**
 * Function: checkDefsLoaded
 *    This is the loadCheck method to see if the def object exists
 *
 */
    checkDefsLoaded: function() {
      if (Proj4js.defs[this.srsCode]) {
        return true;
      } else {
        return false;
      }
    },

 /**
 * Function: defsFailed
 *    Report an error in loading the defs file, but continue on using WGS84
 *
 */
   defsFailed: function() {
      Proj4js.reportError('failed to load projection definition for: '+this.srsCode);
      Proj4js.defs[this.srsCode] = Proj4js.defs['WGS84'];  //set it to something so it can at least continue
      this.defsLoaded();
    },

/**
 * Function: loadProjCode
 *    Loads projection class code dynamically if required.
 *     Projection code may be included either through a script tag or in
 *     a built version of proj4js
 *
 */
    loadProjCode: function(projName) {
      if (Proj4js.Proj[projName]) {
        this.initTransforms();
        return;
      }

      //the URL for the projection code
      var url = Proj4js.getScriptLocation() + 'projCode/' + projName + '.js';
      Proj4js.loadScript(url, 
              Proj4js.bind(this.loadProjCodeSuccess, this, projName),
              Proj4js.bind(this.loadProjCodeFailure, this, projName), 
              Proj4js.bind(this.checkCodeLoaded, this, projName) );
    },

 /**
 * Function: loadProjCodeSuccess
 *    Loads any proj dependencies or continue on to final initialization.
 *
 */
    loadProjCodeSuccess: function(projName) {
      if (Proj4js.Proj[projName].dependsOn){
        this.loadProjCode(Proj4js.Proj[projName].dependsOn);
      } else {
        this.initTransforms();
      }
    },

 /**
 * Function: defsFailed
 *    Report an error in loading the proj file.  Initialization of the Proj
 *    object has failed and the readyToUse flag will never be set.
 *
 */
    loadProjCodeFailure: function(projName) {
      Proj4js.reportError("failed to find projection file for: " + projName);
      //TBD initialize with identity transforms so proj will still work?
    },
    
/**
 * Function: checkCodeLoaded
 *    This is the loadCheck method to see if the projection code is loaded
 *
 */
    checkCodeLoaded: function(projName) {
      if (Proj4js.Proj[projName]) {
        return true;
      } else {
        return false;
      }
    },

/**
 * Function: initTransforms
 *    Finalize the initialization of the Proj object
 *
 */
    initTransforms: function() {
      Proj4js.extend(this, Proj4js.Proj[this.projName]);
      this.init();
      this.readyToUse = true;
      if( this.queue ) {
        var item;
        while( (item = this.queue.shift()) ) {
          item.call( this, this );
        }
      }
  },

/**
 * Function: parseWKT
 * Parses a WKT string to get initialization parameters
 *
 */
 wktRE: /^(\w+)\[(.*)\]$/,
 parseWKT: function(wkt) {
    var wktMatch = wkt.match(this.wktRE);
    if (!wktMatch) return;
    var wktObject = wktMatch[1];
    var wktContent = wktMatch[2];
    var wktTemp = wktContent.split(",");
    var wktName;
    if (wktObject.toUpperCase() == "TOWGS84") {
      wktName = wktObject;  //no name supplied for the TOWGS84 array
    } else {
      wktName = wktTemp.shift();
    }
    wktName = wktName.replace(/^\"/,"");
    wktName = wktName.replace(/\"$/,"");
    
    /*
    wktContent = wktTemp.join(",");
    var wktArray = wktContent.split("],");
    for (var i=0; i<wktArray.length-1; ++i) {
      wktArray[i] += "]";
    }
    */
    
    var wktArray = new Array();
    var bkCount = 0;
    var obj = "";
    for (var i=0; i<wktTemp.length; ++i) {
      var token = wktTemp[i];
      for (var j=0; j<token.length; ++j) {
        if (token.charAt(j) == "[") ++bkCount;
        if (token.charAt(j) == "]") --bkCount;
      }
      obj += token;
      if (bkCount === 0) {
        wktArray.push(obj);
        obj = "";
      } else {
        obj += ",";
      }
    }
    
    //do something based on the type of the wktObject being parsed
    //add in variations in the spelling as required
    switch (wktObject) {
      case 'LOCAL_CS':
        this.projName = 'identity';
        this.localCS = true;
        this.srsCode = wktName;
        break;
      case 'GEOGCS':
        this.projName = 'longlat';
        this.geocsCode = wktName;
        if (!this.srsCode) this.srsCode = wktName;
        break;
      case 'PROJCS':
        this.srsCode = wktName;
        break;
      case 'GEOCCS':
        break;
      case 'PROJECTION':
        this.projName = Proj4js.wktProjections[wktName];
        break;
      case 'DATUM':
        this.datumName = wktName;
        break;
      case 'LOCAL_DATUM':
        this.datumCode = 'none';
        break;
      case 'SPHEROID':
        this.ellps = wktName;
        this.a = parseFloat(wktArray.shift());
        this.rf = parseFloat(wktArray.shift());
        break;
      case 'PRIMEM':
        this.from_greenwich = parseFloat(wktArray.shift()); //to radians?
        break;
      case 'UNIT':
        this.units = wktName;
        this.unitsPerMeter = parseFloat(wktArray.shift());
        break;
      case 'PARAMETER':
        var name = wktName.toLowerCase();
        var value = parseFloat(wktArray.shift());
        //there may be many variations on the wktName values, add in case
        //statements as required
        switch (name) {
          case 'false_easting':
            this.x0 = value;
            break;
          case 'false_northing':
            this.y0 = value;
            break;
          case 'scale_factor':
            this.k0 = value;
            break;
          case 'central_meridian':
            this.long0 = value*Proj4js.common.D2R;
            break;
          case 'latitude_of_origin':
            this.lat0 = value*Proj4js.common.D2R;
            break;
          case 'more_here':
            break;
          default:
            break;
        }
        break;
      case 'TOWGS84':
        this.datum_params = wktArray;
        break;
      //DGR 2010-11-12: AXIS
      case 'AXIS':
        var name= wktName.toLowerCase();
        var value= wktArray.shift();
        switch (value) {
          case 'EAST' : value= 'e'; break;
          case 'WEST' : value= 'w'; break;
          case 'NORTH': value= 'n'; break;
          case 'SOUTH': value= 's'; break;
          case 'UP'   : value= 'u'; break;
          case 'DOWN' : value= 'd'; break;
          case 'OTHER':
          default     : value= ' '; break;//FIXME
        }
        if (!this.axis) { this.axis= "enu"; }
        switch(name) {
          case 'x': this.axis=                         value + this.axis.substr(1,2); break;
          case 'y': this.axis= this.axis.substr(0,1) + value + this.axis.substr(2,1); break;
          case 'z': this.axis= this.axis.substr(0,2) + value                        ; break;
          default : break;
        }
      case 'MORE_HERE':
        break;
      default:
        break;
    }
    for (var i=0; i<wktArray.length; ++i) {
      this.parseWKT(wktArray[i]);
    }
 },

/**
 * Function: parseDefs
 * Parses the PROJ.4 initialization string and sets the associated properties.
 *
 */
  parseDefs: function() {
      this.defData = Proj4js.defs[this.srsCode];
      var paramName, paramVal;
      if (!this.defData) {
        return;
      }
      var paramArray=this.defData.split("+");

      for (var prop=0; prop<paramArray.length; prop++) {
          var property = paramArray[prop].split("=");
          paramName = property[0].toLowerCase();
          paramVal = property[1];

          switch (paramName.replace(/\s/gi,"")) {  // trim out spaces
              case "": break;   // throw away nameless parameter
              case "title":  this.title = paramVal; break;
              case "proj":   this.projName =  paramVal.replace(/\s/gi,""); break;
              case "units":  this.units = paramVal.replace(/\s/gi,""); break;
              case "datum":  this.datumCode = paramVal.replace(/\s/gi,""); break;
              case "nadgrids": this.nagrids = paramVal.replace(/\s/gi,""); break;
              case "ellps":  this.ellps = paramVal.replace(/\s/gi,""); break;
              case "a":      this.a =  parseFloat(paramVal); break;  // semi-major radius
              case "b":      this.b =  parseFloat(paramVal); break;  // semi-minor radius
              // DGR 2007-11-20
              case "rf":     this.rf = parseFloat(paramVal); break; // inverse flattening rf= a/(a-b)
              case "lat_0":  this.lat0 = paramVal*Proj4js.common.D2R; break;        // phi0, central latitude
              case "lat_1":  this.lat1 = paramVal*Proj4js.common.D2R; break;        //standard parallel 1
              case "lat_2":  this.lat2 = paramVal*Proj4js.common.D2R; break;        //standard parallel 2
              case "lat_ts": this.lat_ts = paramVal*Proj4js.common.D2R; break;      // used in merc and eqc
              case "lon_0":  this.long0 = paramVal*Proj4js.common.D2R; break;       // lam0, central longitude
              case "alpha":  this.alpha =  parseFloat(paramVal)*Proj4js.common.D2R; break;  //for somerc projection
              case "lonc":   this.longc = paramVal*Proj4js.common.D2R; break;       //for somerc projection
              case "x_0":    this.x0 = parseFloat(paramVal); break;  // false easting
              case "y_0":    this.y0 = parseFloat(paramVal); break;  // false northing
              case "k_0":    this.k0 = parseFloat(paramVal); break;  // projection scale factor
              case "k":      this.k0 = parseFloat(paramVal); break;  // both forms returned
              case "r_a":    this.R_A = true; break;                 // sphere--area of ellipsoid
              case "zone":   this.zone = parseInt(paramVal,10); break;  // UTM Zone
              case "south":   this.utmSouth = true; break;  // UTM north/south
              case "towgs84":this.datum_params = paramVal.split(","); break;
              case "to_meter": this.to_meter = parseFloat(paramVal); break; // cartesian scaling
              case "from_greenwich": this.from_greenwich = paramVal*Proj4js.common.D2R; break;
              // DGR 2008-07-09 : if pm is not a well-known prime meridian take
              // the value instead of 0.0, then convert to radians
              case "pm":     paramVal = paramVal.replace(/\s/gi,"");
                             this.from_greenwich = Proj4js.PrimeMeridian[paramVal] ?
                                Proj4js.PrimeMeridian[paramVal] : parseFloat(paramVal);
                             this.from_greenwich *= Proj4js.common.D2R; 
                             break;
              // DGR 2010-11-12: axis
              case "axis":   paramVal = paramVal.replace(/\s/gi,"");
                             var legalAxis= "ewnsud";
                             if (paramVal.length==3 &&
                                 legalAxis.indexOf(paramVal.substr(0,1))!=-1 &&
                                 legalAxis.indexOf(paramVal.substr(1,1))!=-1 &&
                                 legalAxis.indexOf(paramVal.substr(2,1))!=-1) {
                                this.axis= paramVal;
                             } //FIXME: be silent ?
                             break;
              case "no_defs": break; 
              default: //alert("Unrecognized parameter: " + paramName);
          } // switch()
      } // for paramArray
      this.deriveConstants();
  },

/**
 * Function: deriveConstants
 * Sets several derived constant values and initialization of datum and ellipse
 *     parameters.
 *
 */
  deriveConstants: function() {
      if (this.nagrids == '@null') this.datumCode = 'none';
      if (this.datumCode && this.datumCode != 'none') {
        var datumDef = Proj4js.Datum[this.datumCode];
        if (datumDef) {
          this.datum_params = datumDef.towgs84 ? datumDef.towgs84.split(',') : null;
          this.ellps = datumDef.ellipse;
          this.datumName = datumDef.datumName ? datumDef.datumName : this.datumCode;
        }
      }
      if (!this.a) {    // do we have an ellipsoid?
          var ellipse = Proj4js.Ellipsoid[this.ellps] ? Proj4js.Ellipsoid[this.ellps] : Proj4js.Ellipsoid['WGS84'];
          Proj4js.extend(this, ellipse);
      }
      if (this.rf && !this.b) this.b = (1.0 - 1.0/this.rf) * this.a;
      if (this.rf === 0 || Math.abs(this.a - this.b)<Proj4js.common.EPSLN) {
        this.sphere = true;
        this.b= this.a;
      }
      this.a2 = this.a * this.a;          // used in geocentric
      this.b2 = this.b * this.b;          // used in geocentric
      this.es = (this.a2-this.b2)/this.a2;  // e ^ 2
      this.e = Math.sqrt(this.es);        // eccentricity
      if (this.R_A) {
        this.a *= 1. - this.es * (Proj4js.common.SIXTH + this.es * (Proj4js.common.RA4 + this.es * Proj4js.common.RA6));
        this.a2 = this.a * this.a;
        this.b2 = this.b * this.b;
        this.es = 0.;
      }
      this.ep2=(this.a2-this.b2)/this.b2; // used in geocentric
      if (!this.k0) this.k0 = 1.0;    //default value
      //DGR 2010-11-12: axis
      if (!this.axis) { this.axis= "enu"; }

      this.datum = new Proj4js.datum(this);
  }
});

Proj4js.Proj.longlat = {
  init: function() {
    //no-op for longlat
  },
  forward: function(pt) {
    //identity transform
    return pt;
  },
  inverse: function(pt) {
    //identity transform
    return pt;
  }
};
Proj4js.Proj.identity = Proj4js.Proj.longlat;

/**
  Proj4js.defs is a collection of coordinate system definition objects in the 
  PROJ.4 command line format.
  Generally a def is added by means of a separate .js file for example:

    <SCRIPT type="text/javascript" src="defs/EPSG26912.js"></SCRIPT>

  def is a CS definition in PROJ.4 WKT format, for example:
    +proj="tmerc"   //longlat, etc.
    +a=majorRadius
    +b=minorRadius
    +lat0=somenumber
    +long=somenumber
*/
Proj4js.defs = {
  // These are so widely used, we'll go ahead and throw them in
  // without requiring a separate .js file
  'WGS84': "+title=long/lat:WGS84 +proj=longlat +ellps=WGS84 +datum=WGS84 +units=degrees",
  'EPSG:4326': "+title=long/lat:WGS84 +proj=longlat +a=6378137.0 +b=6356752.31424518 +ellps=WGS84 +datum=WGS84 +units=degrees",
  'EPSG:4269': "+title=long/lat:NAD83 +proj=longlat +a=6378137.0 +b=6356752.31414036 +ellps=GRS80 +datum=NAD83 +units=degrees",
  'EPSG:3875': "+title= Google Mercator +proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +no_defs"
};
Proj4js.defs['EPSG:3785'] = Proj4js.defs['EPSG:3875'];  //maintain backward compat, official code is 3875
Proj4js.defs['GOOGLE'] = Proj4js.defs['EPSG:3875'];
Proj4js.defs['EPSG:900913'] = Proj4js.defs['EPSG:3875'];
Proj4js.defs['EPSG:102113'] = Proj4js.defs['EPSG:3875'];

Proj4js.common = {
  PI : 3.141592653589793238, //Math.PI,
  HALF_PI : 1.570796326794896619, //Math.PI*0.5,
  TWO_PI : 6.283185307179586477, //Math.PI*2,
  FORTPI : 0.78539816339744833,
  R2D : 57.29577951308232088,
  D2R : 0.01745329251994329577,
  SEC_TO_RAD : 4.84813681109535993589914102357e-6, /* SEC_TO_RAD = Pi/180/3600 */
  EPSLN : 1.0e-10,
  MAX_ITER : 20,
  // following constants from geocent.c
  COS_67P5 : 0.38268343236508977,  /* cosine of 67.5 degrees */
  AD_C : 1.0026000,                /* Toms region 1 constant */

  /* datum_type values */
  PJD_UNKNOWN  : 0,
  PJD_3PARAM   : 1,
  PJD_7PARAM   : 2,
  PJD_GRIDSHIFT: 3,
  PJD_WGS84    : 4,   // WGS84 or equivalent
  PJD_NODATUM  : 5,   // WGS84 or equivalent
  SRS_WGS84_SEMIMAJOR : 6378137.0,  // only used in grid shift transforms

  // ellipoid pj_set_ell.c
  SIXTH : .1666666666666666667, /* 1/6 */
  RA4   : .04722222222222222222, /* 17/360 */
  RA6   : .02215608465608465608, /* 67/3024 */
  RV4   : .06944444444444444444, /* 5/72 */
  RV6   : .04243827160493827160, /* 55/1296 */

// Function to compute the constant small m which is the radius of
//   a parallel of latitude, phi, divided by the semimajor axis.
// -----------------------------------------------------------------
  msfnz : function(eccent, sinphi, cosphi) {
      var con = eccent * sinphi;
      return cosphi/(Math.sqrt(1.0 - con * con));
  },

// Function to compute the constant small t for use in the forward
//   computations in the Lambert Conformal Conic and the Polar
//   Stereographic projections.
// -----------------------------------------------------------------
  tsfnz : function(eccent, phi, sinphi) {
    var con = eccent * sinphi;
    var com = .5 * eccent;
    con = Math.pow(((1.0 - con) / (1.0 + con)), com);
    return (Math.tan(.5 * (this.HALF_PI - phi))/con);
  },

// Function to compute the latitude angle, phi2, for the inverse of the
//   Lambert Conformal Conic and Polar Stereographic projections.
// ----------------------------------------------------------------
  phi2z : function(eccent, ts) {
    var eccnth = .5 * eccent;
    var con, dphi;
    var phi = this.HALF_PI - 2 * Math.atan(ts);
    for (var i = 0; i <= 15; i++) {
      con = eccent * Math.sin(phi);
      dphi = this.HALF_PI - 2 * Math.atan(ts *(Math.pow(((1.0 - con)/(1.0 + con)),eccnth))) - phi;
      phi += dphi;
      if (Math.abs(dphi) <= .0000000001) return phi;
    }
    alert("phi2z has NoConvergence");
    return (-9999);
  },

/* Function to compute constant small q which is the radius of a 
   parallel of latitude, phi, divided by the semimajor axis. 
------------------------------------------------------------*/
  qsfnz : function(eccent,sinphi) {
    var con;
    if (eccent > 1.0e-7) {
      con = eccent * sinphi;
      return (( 1.0- eccent * eccent) * (sinphi /(1.0 - con * con) - (.5/eccent)*Math.log((1.0 - con)/(1.0 + con))));
    } else {
      return(2.0 * sinphi);
    }
  },

/* Function to eliminate roundoff errors in asin
----------------------------------------------*/
  asinz : function(x) {
    if (Math.abs(x)>1.0) {
      x=(x>1.0)?1.0:-1.0;
    }
    return Math.asin(x);
  },

// following functions from gctpc cproj.c for transverse mercator projections
  e0fn : function(x) {return(1.0-0.25*x*(1.0+x/16.0*(3.0+1.25*x)));},
  e1fn : function(x) {return(0.375*x*(1.0+0.25*x*(1.0+0.46875*x)));},
  e2fn : function(x) {return(0.05859375*x*x*(1.0+0.75*x));},
  e3fn : function(x) {return(x*x*x*(35.0/3072.0));},
  mlfn : function(e0,e1,e2,e3,phi) {return(e0*phi-e1*Math.sin(2.0*phi)+e2*Math.sin(4.0*phi)-e3*Math.sin(6.0*phi));},

  srat : function(esinp, exp) {
    return(Math.pow((1.0-esinp)/(1.0+esinp), exp));
  },

// Function to return the sign of an argument
  sign : function(x) { if (x < 0.0) return(-1); else return(1);},

// Function to adjust longitude to -180 to 180; input in radians
  adjust_lon : function(x) {
    x = (Math.abs(x) < this.PI) ? x: (x - (this.sign(x)*this.TWO_PI) );
    return x;
  },

// IGNF - DGR : algorithms used by IGN France

// Function to adjust latitude to -90 to 90; input in radians
  adjust_lat : function(x) {
    x= (Math.abs(x) < this.HALF_PI) ? x: (x - (this.sign(x)*this.PI) );
    return x;
  },

// Latitude Isometrique - close to tsfnz ...
  latiso : function(eccent, phi, sinphi) {
    if (Math.abs(phi) > this.HALF_PI) return +Number.NaN;
    if (phi==this.HALF_PI) return Number.POSITIVE_INFINITY;
    if (phi==-1.0*this.HALF_PI) return -1.0*Number.POSITIVE_INFINITY;

    var con= eccent*sinphi;
    return Math.log(Math.tan((this.HALF_PI+phi)/2.0))+eccent*Math.log((1.0-con)/(1.0+con))/2.0;
  },

  fL : function(x,L) {
    return 2.0*Math.atan(x*Math.exp(L)) - this.HALF_PI;
  },

// Inverse Latitude Isometrique - close to ph2z
  invlatiso : function(eccent, ts) {
    var phi= this.fL(1.0,ts);
    var Iphi= 0.0;
    var con= 0.0;
    do {
      Iphi= phi;
      con= eccent*Math.sin(Iphi);
      phi= this.fL(Math.exp(eccent*Math.log((1.0+con)/(1.0-con))/2.0),ts);
    } while (Math.abs(phi-Iphi)>1.0e-12);
    return phi;
  },

// Needed for Gauss Schreiber
// Original:  Denis Makarov (info@binarythings.com)
// Web Site:  http://www.binarythings.com
  sinh : function(x)
  {
    var r= Math.exp(x);
    r= (r-1.0/r)/2.0;
    return r;
  },

  cosh : function(x)
  {
    var r= Math.exp(x);
    r= (r+1.0/r)/2.0;
    return r;
  },

  tanh : function(x)
  {
    var r= Math.exp(x);
    r= (r-1.0/r)/(r+1.0/r);
    return r;
  },

  asinh : function(x)
  {
    var s= (x>= 0? 1.0:-1.0);
    return s*(Math.log( Math.abs(x) + Math.sqrt(x*x+1.0) ));
  },

  acosh : function(x)
  {
    return 2.0*Math.log(Math.sqrt((x+1.0)/2.0) + Math.sqrt((x-1.0)/2.0));
  },

  atanh : function(x)
  {
    return Math.log((x-1.0)/(x+1.0))/2.0;
  },

// Grande Normale
  gN : function(a,e,sinphi)
  {
    var temp= e*sinphi;
    return a/Math.sqrt(1.0 - temp*temp);
  },
  
  //code from the PROJ.4 pj_mlfn.c file;  this may be useful for other projections
  pj_enfn: function(es) {
    var en = new Array();
    en[0] = this.C00 - es * (this.C02 + es * (this.C04 + es * (this.C06 + es * this.C08)));
    en[1] = es * (this.C22 - es * (this.C04 + es * (this.C06 + es * this.C08)));
    var t = es * es;
    en[2] = t * (this.C44 - es * (this.C46 + es * this.C48));
    t *= es;
    en[3] = t * (this.C66 - es * this.C68);
    en[4] = t * es * this.C88;
    return en;
  },
  
  pj_mlfn: function(phi, sphi, cphi, en) {
    cphi *= sphi;
    sphi *= sphi;
    return(en[0] * phi - cphi * (en[1] + sphi*(en[2]+ sphi*(en[3] + sphi*en[4]))));
  },
  
  pj_inv_mlfn: function(arg, es, en) {
    var k = 1./(1.-es);
    var phi = arg;
    for (var i = Proj4js.common.MAX_ITER; i ; --i) { /* rarely goes over 2 iterations */
      var s = Math.sin(phi);
      var t = 1. - es * s * s;
      //t = this.pj_mlfn(phi, s, Math.cos(phi), en) - arg;
      //phi -= t * (t * Math.sqrt(t)) * k;
      t = (this.pj_mlfn(phi, s, Math.cos(phi), en) - arg) * (t * Math.sqrt(t)) * k;
      phi -= t;
      if (Math.abs(t) < Proj4js.common.EPSLN)
        return phi;
    }
    Proj4js.reportError("cass:pj_inv_mlfn: Convergence error");
    return phi;
  },

/* meridinal distance for ellipsoid and inverse
**	8th degree - accurate to < 1e-5 meters when used in conjuction
**		with typical major axis values.
**	Inverse determines phi to EPS (1e-11) radians, about 1e-6 seconds.
*/
  C00: 1.0,
  C02: .25,
  C04: .046875,
  C06: .01953125,
  C08: .01068115234375,
  C22: .75,
  C44: .46875,
  C46: .01302083333333333333,
  C48: .00712076822916666666,
  C66: .36458333333333333333,
  C68: .00569661458333333333,
  C88: .3076171875  

};

/** datum object
*/
Proj4js.datum = Proj4js.Class({

  initialize : function(proj) {
    this.datum_type = Proj4js.common.PJD_WGS84;   //default setting
    if (proj.datumCode && proj.datumCode == 'none') {
      this.datum_type = Proj4js.common.PJD_NODATUM;
    }
    if (proj && proj.datum_params) {
      for (var i=0; i<proj.datum_params.length; i++) {
        proj.datum_params[i]=parseFloat(proj.datum_params[i]);
      }
      if (proj.datum_params[0] != 0 || proj.datum_params[1] != 0 || proj.datum_params[2] != 0 ) {
        this.datum_type = Proj4js.common.PJD_3PARAM;
      }
      if (proj.datum_params.length > 3) {
        if (proj.datum_params[3] != 0 || proj.datum_params[4] != 0 ||
            proj.datum_params[5] != 0 || proj.datum_params[6] != 0 ) {
          this.datum_type = Proj4js.common.PJD_7PARAM;
          proj.datum_params[3] *= Proj4js.common.SEC_TO_RAD;
          proj.datum_params[4] *= Proj4js.common.SEC_TO_RAD;
          proj.datum_params[5] *= Proj4js.common.SEC_TO_RAD;
          proj.datum_params[6] = (proj.datum_params[6]/1000000.0) + 1.0;
        }
      }
    }
    if (proj) {
      this.a = proj.a;    //datum object also uses these values
      this.b = proj.b;
      this.es = proj.es;
      this.ep2 = proj.ep2;
      this.datum_params = proj.datum_params;
    }
  },

  /****************************************************************/
  // cs_compare_datums()
  //   Returns TRUE if the two datums match, otherwise FALSE.
  compare_datums : function( dest ) {
    if( this.datum_type != dest.datum_type ) {
      return false; // false, datums are not equal
    } else if( this.a != dest.a || Math.abs(this.es-dest.es) > 0.000000000050 ) {
      // the tolerence for es is to ensure that GRS80 and WGS84
      // are considered identical
      return false;
    } else if( this.datum_type == Proj4js.common.PJD_3PARAM ) {
      return (this.datum_params[0] == dest.datum_params[0]
              && this.datum_params[1] == dest.datum_params[1]
              && this.datum_params[2] == dest.datum_params[2]);
    } else if( this.datum_type == Proj4js.common.PJD_7PARAM ) {
      return (this.datum_params[0] == dest.datum_params[0]
              && this.datum_params[1] == dest.datum_params[1]
              && this.datum_params[2] == dest.datum_params[2]
              && this.datum_params[3] == dest.datum_params[3]
              && this.datum_params[4] == dest.datum_params[4]
              && this.datum_params[5] == dest.datum_params[5]
              && this.datum_params[6] == dest.datum_params[6]);
    } else if ( this.datum_type == Proj4js.common.PJD_GRIDSHIFT ||
                dest.datum_type == Proj4js.common.PJD_GRIDSHIFT ) {
      alert("ERROR: Grid shift transformations are not implemented.");
      return false;
    } else {
      return true; // datums are equal
    }
  }, // cs_compare_datums()

  /*
   * The function Convert_Geodetic_To_Geocentric converts geodetic coordinates
   * (latitude, longitude, and height) to geocentric coordinates (X, Y, Z),
   * according to the current ellipsoid parameters.
   *
   *    Latitude  : Geodetic latitude in radians                     (input)
   *    Longitude : Geodetic longitude in radians                    (input)
   *    Height    : Geodetic height, in meters                       (input)
   *    X         : Calculated Geocentric X coordinate, in meters    (output)
   *    Y         : Calculated Geocentric Y coordinate, in meters    (output)
   *    Z         : Calculated Geocentric Z coordinate, in meters    (output)
   *
   */
  geodetic_to_geocentric : function(p) {
    var Longitude = p.x;
    var Latitude = p.y;
    var Height = p.z ? p.z : 0;   //Z value not always supplied
    var X;  // output
    var Y;
    var Z;

    var Error_Code=0;  //  GEOCENT_NO_ERROR;
    var Rn;            /*  Earth radius at location  */
    var Sin_Lat;       /*  Math.sin(Latitude)  */
    var Sin2_Lat;      /*  Square of Math.sin(Latitude)  */
    var Cos_Lat;       /*  Math.cos(Latitude)  */

    /*
    ** Don't blow up if Latitude is just a little out of the value
    ** range as it may just be a rounding issue.  Also removed longitude
    ** test, it should be wrapped by Math.cos() and Math.sin().  NFW for PROJ.4, Sep/2001.
    */
    if( Latitude < -Proj4js.common.HALF_PI && Latitude > -1.001 * Proj4js.common.HALF_PI ) {
        Latitude = -Proj4js.common.HALF_PI;
    } else if( Latitude > Proj4js.common.HALF_PI && Latitude < 1.001 * Proj4js.common.HALF_PI ) {
        Latitude = Proj4js.common.HALF_PI;
    } else if ((Latitude < -Proj4js.common.HALF_PI) || (Latitude > Proj4js.common.HALF_PI)) {
      /* Latitude out of range */
      Proj4js.reportError('geocent:lat out of range:'+Latitude);
      return null;
    }

    if (Longitude > Proj4js.common.PI) Longitude -= (2*Proj4js.common.PI);
    Sin_Lat = Math.sin(Latitude);
    Cos_Lat = Math.cos(Latitude);
    Sin2_Lat = Sin_Lat * Sin_Lat;
    Rn = this.a / (Math.sqrt(1.0e0 - this.es * Sin2_Lat));
    X = (Rn + Height) * Cos_Lat * Math.cos(Longitude);
    Y = (Rn + Height) * Cos_Lat * Math.sin(Longitude);
    Z = ((Rn * (1 - this.es)) + Height) * Sin_Lat;

    p.x = X;
    p.y = Y;
    p.z = Z;
    return Error_Code;
  }, // cs_geodetic_to_geocentric()


  geocentric_to_geodetic : function (p) {
/* local defintions and variables */
/* end-criterium of loop, accuracy of sin(Latitude) */
var genau = 1.E-12;
var genau2 = (genau*genau);
var maxiter = 30;

    var P;        /* distance between semi-minor axis and location */
    var RR;       /* distance between center and location */
    var CT;       /* sin of geocentric latitude */
    var ST;       /* cos of geocentric latitude */
    var RX;
    var RK;
    var RN;       /* Earth radius at location */
    var CPHI0;    /* cos of start or old geodetic latitude in iterations */
    var SPHI0;    /* sin of start or old geodetic latitude in iterations */
    var CPHI;     /* cos of searched geodetic latitude */
    var SPHI;     /* sin of searched geodetic latitude */
    var SDPHI;    /* end-criterium: addition-theorem of sin(Latitude(iter)-Latitude(iter-1)) */
    var At_Pole;     /* indicates location is in polar region */
    var iter;        /* # of continous iteration, max. 30 is always enough (s.a.) */

    var X = p.x;
    var Y = p.y;
    var Z = p.z ? p.z : 0.0;   //Z value not always supplied
    var Longitude;
    var Latitude;
    var Height;

    At_Pole = false;
    P = Math.sqrt(X*X+Y*Y);
    RR = Math.sqrt(X*X+Y*Y+Z*Z);

/*      special cases for latitude and longitude */
    if (P/this.a < genau) {

/*  special case, if P=0. (X=0., Y=0.) */
        At_Pole = true;
        Longitude = 0.0;

/*  if (X,Y,Z)=(0.,0.,0.) then Height becomes semi-minor axis
 *  of ellipsoid (=center of mass), Latitude becomes PI/2 */
        if (RR/this.a < genau) {
            Latitude = Proj4js.common.HALF_PI;
            Height   = -this.b;
            return;
        }
    } else {
/*  ellipsoidal (geodetic) longitude
 *  interval: -PI < Longitude <= +PI */
        Longitude=Math.atan2(Y,X);
    }

/* --------------------------------------------------------------
 * Following iterative algorithm was developped by
 * "Institut f�r Erdmessung", University of Hannover, July 1988.
 * Internet: www.ife.uni-hannover.de
 * Iterative computation of CPHI,SPHI and Height.
 * Iteration of CPHI and SPHI to 10**-12 radian resp.
 * 2*10**-7 arcsec.
 * --------------------------------------------------------------
 */
    CT = Z/RR;
    ST = P/RR;
    RX = 1.0/Math.sqrt(1.0-this.es*(2.0-this.es)*ST*ST);
    CPHI0 = ST*(1.0-this.es)*RX;
    SPHI0 = CT*RX;
    iter = 0;

/* loop to find sin(Latitude) resp. Latitude
 * until |sin(Latitude(iter)-Latitude(iter-1))| < genau */
    do
    {
        iter++;
        RN = this.a/Math.sqrt(1.0-this.es*SPHI0*SPHI0);

/*  ellipsoidal (geodetic) height */
        Height = P*CPHI0+Z*SPHI0-RN*(1.0-this.es*SPHI0*SPHI0);

        RK = this.es*RN/(RN+Height);
        RX = 1.0/Math.sqrt(1.0-RK*(2.0-RK)*ST*ST);
        CPHI = ST*(1.0-RK)*RX;
        SPHI = CT*RX;
        SDPHI = SPHI*CPHI0-CPHI*SPHI0;
        CPHI0 = CPHI;
        SPHI0 = SPHI;
    }
    while (SDPHI*SDPHI > genau2 && iter < maxiter);

/*      ellipsoidal (geodetic) latitude */
    Latitude=Math.atan(SPHI/Math.abs(CPHI));

    p.x = Longitude;
    p.y = Latitude;
    p.z = Height;
    return p;
  }, // cs_geocentric_to_geodetic()

  /** Convert_Geocentric_To_Geodetic
   * The method used here is derived from 'An Improved Algorithm for
   * Geocentric to Geodetic Coordinate Conversion', by Ralph Toms, Feb 1996
   */
  geocentric_to_geodetic_noniter : function (p) {
    var X = p.x;
    var Y = p.y;
    var Z = p.z ? p.z : 0;   //Z value not always supplied
    var Longitude;
    var Latitude;
    var Height;

    var W;        /* distance from Z axis */
    var W2;       /* square of distance from Z axis */
    var T0;       /* initial estimate of vertical component */
    var T1;       /* corrected estimate of vertical component */
    var S0;       /* initial estimate of horizontal component */
    var S1;       /* corrected estimate of horizontal component */
    var Sin_B0;   /* Math.sin(B0), B0 is estimate of Bowring aux variable */
    var Sin3_B0;  /* cube of Math.sin(B0) */
    var Cos_B0;   /* Math.cos(B0) */
    var Sin_p1;   /* Math.sin(phi1), phi1 is estimated latitude */
    var Cos_p1;   /* Math.cos(phi1) */
    var Rn;       /* Earth radius at location */
    var Sum;      /* numerator of Math.cos(phi1) */
    var At_Pole;  /* indicates location is in polar region */

    X = parseFloat(X);  // cast from string to float
    Y = parseFloat(Y);
    Z = parseFloat(Z);

    At_Pole = false;
    if (X != 0.0)
    {
        Longitude = Math.atan2(Y,X);
    }
    else
    {
        if (Y > 0)
        {
            Longitude = Proj4js.common.HALF_PI;
        }
        else if (Y < 0)
        {
            Longitude = -Proj4js.common.HALF_PI;
        }
        else
        {
            At_Pole = true;
            Longitude = 0.0;
            if (Z > 0.0)
            {  /* north pole */
                Latitude = Proj4js.common.HALF_PI;
            }
            else if (Z < 0.0)
            {  /* south pole */
                Latitude = -Proj4js.common.HALF_PI;
            }
            else
            {  /* center of earth */
                Latitude = Proj4js.common.HALF_PI;
                Height = -this.b;
                return;
            }
        }
    }
    W2 = X*X + Y*Y;
    W = Math.sqrt(W2);
    T0 = Z * Proj4js.common.AD_C;
    S0 = Math.sqrt(T0 * T0 + W2);
    Sin_B0 = T0 / S0;
    Cos_B0 = W / S0;
    Sin3_B0 = Sin_B0 * Sin_B0 * Sin_B0;
    T1 = Z + this.b * this.ep2 * Sin3_B0;
    Sum = W - this.a * this.es * Cos_B0 * Cos_B0 * Cos_B0;
    S1 = Math.sqrt(T1*T1 + Sum * Sum);
    Sin_p1 = T1 / S1;
    Cos_p1 = Sum / S1;
    Rn = this.a / Math.sqrt(1.0 - this.es * Sin_p1 * Sin_p1);
    if (Cos_p1 >= Proj4js.common.COS_67P5)
    {
        Height = W / Cos_p1 - Rn;
    }
    else if (Cos_p1 <= -Proj4js.common.COS_67P5)
    {
        Height = W / -Cos_p1 - Rn;
    }
    else
    {
        Height = Z / Sin_p1 + Rn * (this.es - 1.0);
    }
    if (At_Pole == false)
    {
        Latitude = Math.atan(Sin_p1 / Cos_p1);
    }

    p.x = Longitude;
    p.y = Latitude;
    p.z = Height;
    return p;
  }, // geocentric_to_geodetic_noniter()

  /****************************************************************/
  // pj_geocentic_to_wgs84( p )
  //  p = point to transform in geocentric coordinates (x,y,z)
  geocentric_to_wgs84 : function ( p ) {

    if( this.datum_type == Proj4js.common.PJD_3PARAM )
    {
      // if( x[io] == HUGE_VAL )
      //    continue;
      p.x += this.datum_params[0];
      p.y += this.datum_params[1];
      p.z += this.datum_params[2];

    }
    else if (this.datum_type == Proj4js.common.PJD_7PARAM)
    {
      var Dx_BF =this.datum_params[0];
      var Dy_BF =this.datum_params[1];
      var Dz_BF =this.datum_params[2];
      var Rx_BF =this.datum_params[3];
      var Ry_BF =this.datum_params[4];
      var Rz_BF =this.datum_params[5];
      var M_BF  =this.datum_params[6];
      // if( x[io] == HUGE_VAL )
      //    continue;
      var x_out = M_BF*(       p.x - Rz_BF*p.y + Ry_BF*p.z) + Dx_BF;
      var y_out = M_BF*( Rz_BF*p.x +       p.y - Rx_BF*p.z) + Dy_BF;
      var z_out = M_BF*(-Ry_BF*p.x + Rx_BF*p.y +       p.z) + Dz_BF;
      p.x = x_out;
      p.y = y_out;
      p.z = z_out;
    }
  }, // cs_geocentric_to_wgs84

  /****************************************************************/
  // pj_geocentic_from_wgs84()
  //  coordinate system definition,
  //  point to transform in geocentric coordinates (x,y,z)
  geocentric_from_wgs84 : function( p ) {

    if( this.datum_type == Proj4js.common.PJD_3PARAM )
    {
      //if( x[io] == HUGE_VAL )
      //    continue;
      p.x -= this.datum_params[0];
      p.y -= this.datum_params[1];
      p.z -= this.datum_params[2];

    }
    else if (this.datum_type == Proj4js.common.PJD_7PARAM)
    {
      var Dx_BF =this.datum_params[0];
      var Dy_BF =this.datum_params[1];
      var Dz_BF =this.datum_params[2];
      var Rx_BF =this.datum_params[3];
      var Ry_BF =this.datum_params[4];
      var Rz_BF =this.datum_params[5];
      var M_BF  =this.datum_params[6];
      var x_tmp = (p.x - Dx_BF) / M_BF;
      var y_tmp = (p.y - Dy_BF) / M_BF;
      var z_tmp = (p.z - Dz_BF) / M_BF;
      //if( x[io] == HUGE_VAL )
      //    continue;

      p.x =        x_tmp + Rz_BF*y_tmp - Ry_BF*z_tmp;
      p.y = -Rz_BF*x_tmp +       y_tmp + Rx_BF*z_tmp;
      p.z =  Ry_BF*x_tmp - Rx_BF*y_tmp +       z_tmp;
    } //cs_geocentric_from_wgs84()
  }
});

/** point object, nothing fancy, just allows values to be
    passed back and forth by reference rather than by value.
    Other point classes may be used as long as they have
    x and y properties, which will get modified in the transform method.
*/
Proj4js.Point = Proj4js.Class({

    /**
     * Constructor: Proj4js.Point
     *
     * Parameters:
     * - x {float} or {Array} either the first coordinates component or
     *     the full coordinates
     * - y {float} the second component
     * - z {float} the third component, optional.
     */
    initialize : function(x,y,z) {
      if (typeof x == 'object') {
        this.x = x[0];
        this.y = x[1];
        this.z = x[2] || 0.0;
      } else if (typeof x == 'string' && typeof y == 'undefined') {
        var coords = x.split(',');
        this.x = parseFloat(coords[0]);
        this.y = parseFloat(coords[1]);
        this.z = parseFloat(coords[2]) || 0.0;
      } else {
        this.x = x;
        this.y = y;
        this.z = z || 0.0;
      }
    },

    /**
     * APIMethod: clone
     * Build a copy of a Proj4js.Point object.
     *
     * Return:
     * {Proj4js}.Point the cloned point.
     */
    clone : function() {
      return new Proj4js.Point(this.x, this.y, this.z);
    },

    /**
     * APIMethod: toString
     * Return a readable string version of the point
     *
     * Return:
     * {String} String representation of Proj4js.Point object. 
     *           (ex. <i>"x=5,y=42"</i>)
     */
    toString : function() {
        return ("x=" + this.x + ",y=" + this.y);
    },

    /** 
     * APIMethod: toShortString
     * Return a short string version of the point.
     *
     * Return:
     * {String} Shortened String representation of Proj4js.Point object. 
     *         (ex. <i>"5, 42"</i>)
     */
    toShortString : function() {
        return (this.x + ", " + this.y);
    }
});

Proj4js.PrimeMeridian = {
    "greenwich": 0.0,               //"0dE",
    "lisbon":     -9.131906111111,   //"9d07'54.862\"W",
    "paris":       2.337229166667,   //"2d20'14.025\"E",
    "bogota":    -74.080916666667,  //"74d04'51.3\"W",
    "madrid":     -3.687938888889,  //"3d41'16.58\"W",
    "rome":       12.452333333333,  //"12d27'8.4\"E",
    "bern":        7.439583333333,  //"7d26'22.5\"E",
    "jakarta":   106.807719444444,  //"106d48'27.79\"E",
    "ferro":     -17.666666666667,  //"17d40'W",
    "brussels":    4.367975,        //"4d22'4.71\"E",
    "stockholm":  18.058277777778,  //"18d3'29.8\"E",
    "athens":     23.7163375,       //"23d42'58.815\"E",
    "oslo":       10.722916666667   //"10d43'22.5\"E"
};

Proj4js.Ellipsoid = {
  "MERIT": {a:6378137.0, rf:298.257, ellipseName:"MERIT 1983"},
  "SGS85": {a:6378136.0, rf:298.257, ellipseName:"Soviet Geodetic System 85"},
  "GRS80": {a:6378137.0, rf:298.257222101, ellipseName:"GRS 1980(IUGG, 1980)"},
  "IAU76": {a:6378140.0, rf:298.257, ellipseName:"IAU 1976"},
  "airy": {a:6377563.396, b:6356256.910, ellipseName:"Airy 1830"},
  "APL4.": {a:6378137, rf:298.25, ellipseName:"Appl. Physics. 1965"},
  "NWL9D": {a:6378145.0, rf:298.25, ellipseName:"Naval Weapons Lab., 1965"},
  "mod_airy": {a:6377340.189, b:6356034.446, ellipseName:"Modified Airy"},
  "andrae": {a:6377104.43, rf:300.0, ellipseName:"Andrae 1876 (Den., Iclnd.)"},
  "aust_SA": {a:6378160.0, rf:298.25, ellipseName:"Australian Natl & S. Amer. 1969"},
  "GRS67": {a:6378160.0, rf:298.2471674270, ellipseName:"GRS 67(IUGG 1967)"},
  "bessel": {a:6377397.155, rf:299.1528128, ellipseName:"Bessel 1841"},
  "bess_nam": {a:6377483.865, rf:299.1528128, ellipseName:"Bessel 1841 (Namibia)"},
  "clrk66": {a:6378206.4, b:6356583.8, ellipseName:"Clarke 1866"},
  "clrk80": {a:6378249.145, rf:293.4663, ellipseName:"Clarke 1880 mod."},
  "CPM": {a:6375738.7, rf:334.29, ellipseName:"Comm. des Poids et Mesures 1799"},
  "delmbr": {a:6376428.0, rf:311.5, ellipseName:"Delambre 1810 (Belgium)"},
  "engelis": {a:6378136.05, rf:298.2566, ellipseName:"Engelis 1985"},
  "evrst30": {a:6377276.345, rf:300.8017, ellipseName:"Everest 1830"},
  "evrst48": {a:6377304.063, rf:300.8017, ellipseName:"Everest 1948"},
  "evrst56": {a:6377301.243, rf:300.8017, ellipseName:"Everest 1956"},
  "evrst69": {a:6377295.664, rf:300.8017, ellipseName:"Everest 1969"},
  "evrstSS": {a:6377298.556, rf:300.8017, ellipseName:"Everest (Sabah & Sarawak)"},
  "fschr60": {a:6378166.0, rf:298.3, ellipseName:"Fischer (Mercury Datum) 1960"},
  "fschr60m": {a:6378155.0, rf:298.3, ellipseName:"Fischer 1960"},
  "fschr68": {a:6378150.0, rf:298.3, ellipseName:"Fischer 1968"},
  "helmert": {a:6378200.0, rf:298.3, ellipseName:"Helmert 1906"},
  "hough": {a:6378270.0, rf:297.0, ellipseName:"Hough"},
  "intl": {a:6378388.0, rf:297.0, ellipseName:"International 1909 (Hayford)"},
  "kaula": {a:6378163.0, rf:298.24, ellipseName:"Kaula 1961"},
  "lerch": {a:6378139.0, rf:298.257, ellipseName:"Lerch 1979"},
  "mprts": {a:6397300.0, rf:191.0, ellipseName:"Maupertius 1738"},
  "new_intl": {a:6378157.5, b:6356772.2, ellipseName:"New International 1967"},
  "plessis": {a:6376523.0, rf:6355863.0, ellipseName:"Plessis 1817 (France)"},
  "krass": {a:6378245.0, rf:298.3, ellipseName:"Krassovsky, 1942"},
  "SEasia": {a:6378155.0, b:6356773.3205, ellipseName:"Southeast Asia"},
  "walbeck": {a:6376896.0, b:6355834.8467, ellipseName:"Walbeck"},
  "WGS60": {a:6378165.0, rf:298.3, ellipseName:"WGS 60"},
  "WGS66": {a:6378145.0, rf:298.25, ellipseName:"WGS 66"},
  "WGS72": {a:6378135.0, rf:298.26, ellipseName:"WGS 72"},
  "WGS84": {a:6378137.0, rf:298.257223563, ellipseName:"WGS 84"},
  "sphere": {a:6370997.0, b:6370997.0, ellipseName:"Normal Sphere (r=6370997)"}
};

Proj4js.Datum = {
  "WGS84": {towgs84: "0,0,0", ellipse: "WGS84", datumName: "WGS84"},
  "GGRS87": {towgs84: "-199.87,74.79,246.62", ellipse: "GRS80", datumName: "Greek_Geodetic_Reference_System_1987"},
  "NAD83": {towgs84: "0,0,0", ellipse: "GRS80", datumName: "North_American_Datum_1983"},
  "NAD27": {nadgrids: "@conus,@alaska,@ntv2_0.gsb,@ntv1_can.dat", ellipse: "clrk66", datumName: "North_American_Datum_1927"},
  "potsdam": {towgs84: "606.0,23.0,413.0", ellipse: "bessel", datumName: "Potsdam Rauenberg 1950 DHDN"},
  "carthage": {towgs84: "-263.0,6.0,431.0", ellipse: "clark80", datumName: "Carthage 1934 Tunisia"},
  "hermannskogel": {towgs84: "653.0,-212.0,449.0", ellipse: "bessel", datumName: "Hermannskogel"},
  "ire65": {towgs84: "482.530,-130.596,564.557,-1.042,-0.214,-0.631,8.15", ellipse: "mod_airy", datumName: "Ireland 1965"},
  "nzgd49": {towgs84: "59.47,-5.04,187.44,0.47,-0.1,1.024,-4.5993", ellipse: "intl", datumName: "New Zealand Geodetic Datum 1949"},
  "OSGB36": {towgs84: "446.448,-125.157,542.060,0.1502,0.2470,0.8421,-20.4894", ellipse: "airy", datumName: "Airy 1830"}
};

Proj4js.WGS84 = new Proj4js.Proj('WGS84');
Proj4js.Datum['OSB36'] = Proj4js.Datum['OSGB36']; //as returned from spatialreference.org

//lookup table to go from the projection name in WKT to the Proj4js projection name
//build this out as required
Proj4js.wktProjections = {
  "Lambert Tangential Conformal Conic Projection": "lcc",
  "Mercator": "merc",
  "Popular Visualisation Pseudo Mercator": "merc",
  "Mercator_1SP": "merc",
  "Transverse_Mercator": "tmerc",
  "Transverse Mercator": "tmerc",
  "Lambert Azimuthal Equal Area": "laea",
  "Universal Transverse Mercator System": "utm"
};


/*******************************************************************************
NAME                            TRANSVERSE MERCATOR

PURPOSE:	Transforms input longitude and latitude to Easting and
		Northing for the Transverse Mercator projection.  The
		longitude and latitude must be in radians.  The Easting
		and Northing values will be returned in meters.

ALGORITHM REFERENCES

1.  Snyder, John P., "Map Projections--A Working Manual", U.S. Geological
    Survey Professional Paper 1395 (Supersedes USGS Bulletin 1532), United
    State Government Printing Office, Washington D.C., 1987.

2.  Snyder, John P. and Voxland, Philip M., "An Album of Map Projections",
    U.S. Geological Survey Professional Paper 1453 , United State Government
    Printing Office, Washington D.C., 1989.
*******************************************************************************/


/**
  Initialize Transverse Mercator projection
*/

Proj4js.Proj.tmerc = {
  init : function() {
    this.e0 = Proj4js.common.e0fn(this.es);
    this.e1 = Proj4js.common.e1fn(this.es);
    this.e2 = Proj4js.common.e2fn(this.es);
    this.e3 = Proj4js.common.e3fn(this.es);
    this.ml0 = this.a * Proj4js.common.mlfn(this.e0, this.e1, this.e2, this.e3, this.lat0);
  },

  /**
    Transverse Mercator Forward  - long/lat to x/y
    long/lat in radians
  */
  forward : function(p) {
    var lon = p.x;
    var lat = p.y;

    var delta_lon = Proj4js.common.adjust_lon(lon - this.long0); // Delta longitude
    var con;    // cone constant
    var x, y;
    var sin_phi=Math.sin(lat);
    var cos_phi=Math.cos(lat);

    if (this.sphere) {  /* spherical form */
      var b = cos_phi * Math.sin(delta_lon);
      if ((Math.abs(Math.abs(b) - 1.0)) < .0000000001)  {
        Proj4js.reportError("tmerc:forward: Point projects into infinity");
        return(93);
      } else {
        x = .5 * this.a * this.k0 * Math.log((1.0 + b)/(1.0 - b));
        con = Math.acos(cos_phi * Math.cos(delta_lon)/Math.sqrt(1.0 - b*b));
        if (lat < 0) con = - con;
        y = this.a * this.k0 * (con - this.lat0);
      }
    } else {
      var al  = cos_phi * delta_lon;
      var als = Math.pow(al,2);
      var c   = this.ep2 * Math.pow(cos_phi,2);
      var tq  = Math.tan(lat);
      var t   = Math.pow(tq,2);
      con = 1.0 - this.es * Math.pow(sin_phi,2);
      var n   = this.a / Math.sqrt(con);
      var ml  = this.a * Proj4js.common.mlfn(this.e0, this.e1, this.e2, this.e3, lat);

      x = this.k0 * n * al * (1.0 + als / 6.0 * (1.0 - t + c + als / 20.0 * (5.0 - 18.0 * t + Math.pow(t,2) + 72.0 * c - 58.0 * this.ep2))) + this.x0;
      y = this.k0 * (ml - this.ml0 + n * tq * (als * (0.5 + als / 24.0 * (5.0 - t + 9.0 * c + 4.0 * Math.pow(c,2) + als / 30.0 * (61.0 - 58.0 * t + Math.pow(t,2) + 600.0 * c - 330.0 * this.ep2))))) + this.y0;

    }
    p.x = x; p.y = y;
    return p;
  }, // tmercFwd()

  /**
    Transverse Mercator Inverse  -  x/y to long/lat
  */
  inverse : function(p) {
    var con, phi;  /* temporary angles       */
    var delta_phi; /* difference between longitudes    */
    var i;
    var max_iter = 6;      /* maximun number of iterations */
    var lat, lon;

    if (this.sphere) {   /* spherical form */
      var f = Math.exp(p.x/(this.a * this.k0));
      var g = .5 * (f - 1/f);
      var temp = this.lat0 + p.y/(this.a * this.k0);
      var h = Math.cos(temp);
      con = Math.sqrt((1.0 - h * h)/(1.0 + g * g));
      lat = Proj4js.common.asinz(con);
      if (temp < 0)
        lat = -lat;
      if ((g == 0) && (h == 0)) {
        lon = this.long0;
      } else {
        lon = Proj4js.common.adjust_lon(Math.atan2(g,h) + this.long0);
      }
    } else {    // ellipsoidal form
      var x = p.x - this.x0;
      var y = p.y - this.y0;

      con = (this.ml0 + y / this.k0) / this.a;
      phi = con;
      for (i=0;true;i++) {
        delta_phi=((con + this.e1 * Math.sin(2.0*phi) - this.e2 * Math.sin(4.0*phi) + this.e3 * Math.sin(6.0*phi)) / this.e0) - phi;
        phi += delta_phi;
        if (Math.abs(delta_phi) <= Proj4js.common.EPSLN) break;
        if (i >= max_iter) {
          Proj4js.reportError("tmerc:inverse: Latitude failed to converge");
          return(95);
        }
      } // for()
      if (Math.abs(phi) < Proj4js.common.HALF_PI) {
        // sincos(phi, &sin_phi, &cos_phi);
        var sin_phi=Math.sin(phi);
        var cos_phi=Math.cos(phi);
        var tan_phi = Math.tan(phi);
        var c = this.ep2 * Math.pow(cos_phi,2);
        var cs = Math.pow(c,2);
        var t = Math.pow(tan_phi,2);
        var ts = Math.pow(t,2);
        con = 1.0 - this.es * Math.pow(sin_phi,2);
        var n = this.a / Math.sqrt(con);
        var r = n * (1.0 - this.es) / con;
        var d = x / (n * this.k0);
        var ds = Math.pow(d,2);
        lat = phi - (n * tan_phi * ds / r) * (0.5 - ds / 24.0 * (5.0 + 3.0 * t + 10.0 * c - 4.0 * cs - 9.0 * this.ep2 - ds / 30.0 * (61.0 + 90.0 * t + 298.0 * c + 45.0 * ts - 252.0 * this.ep2 - 3.0 * cs)));
        lon = Proj4js.common.adjust_lon(this.long0 + (d * (1.0 - ds / 6.0 * (1.0 + 2.0 * t + c - ds / 20.0 * (5.0 - 2.0 * c + 28.0 * t - 3.0 * cs + 8.0 * this.ep2 + 24.0 * ts))) / cos_phi));
      } else {
        lat = Proj4js.common.HALF_PI * Proj4js.common.sign(y);
        lon = this.long0;
      }
    }
    p.x = lon;
    p.y = lat;
    return p;
  } // tmercInv()
};Proj4js.defs['UTMK'] = '+title=UTMK +proj=tmerc +lat_0=38.0 +lon_0=127.5 +x_0=1000000.0 +y_0=2000000.0 +k=0.9996 +a=6378137.0 +b=6356752.3141403 +ellps=GRS80 +towgs84=0,0,0 +no_defs';
Proj4js.defs['KATECH'] = '+title=KATECH +proj=tmerc +lat_0=38.0 +lon_0=128.0 +x_0=400000.0 +y_0=600000.0 +k=0.9999 +a=6377397.155 +b=6356078.9633422494 +ellps=bessel +towgs84=-115.80,474.99,674.11,1.16,-2.31,-1.63,6.43 +no_defs';
/**
 * 좌표를 나타내는 클래스. Coord 클래스는 인스턴스를 생성할 수 없으며,
 * 특정 좌표계를 나타내는 구상 클래스를 사용해야 한다.
 * @group Base
 */
$class('olleh.maps.Coord').define({

  $static: {
    /**
     * {@link olleh.maps.Coord#almostEquals} 에서 기본값으로 사용하는 입실론. 미터 단위.
     * @constant
     * @type Number
     */
    DEFAULT_EPSILON_IN_METER: 0.001 // 1 mm
  },

  /**
   * 이 클래스는 직접 생성할 수 없다.
   */
  Coord: function () {
    if (this.$classname === 'olleh.maps.Coord') {
      throw new TypeError('Cannot instantiate olleh.maps.Coord directly.');
    }
  },

  /**
   * x좌표.
   * @name x
   * @memberof olleh.maps.Coord.prototype
   * @field
   * @type Number
   * @readonly
   */

  /**
   * y좌표.
   * @name y
   * @memberof olleh.maps.Coord.prototype
   * @field
   * @type Number
   * @readonly
   */

  /**
   * 두 좌표가 완전히 일치하는지를 검사한다. 좌표계 또한 일치해야만 일치한다고 간주한다. 
   * @param {olleh.maps.Coord} other 비교할 상대 좌표.
   * @returns {Boolean} 일치할 경우 true, 그렇지 않을 경우 false.
   */
  equals: function (other) {
    return other && this.x === other.x && this.y === other.y && other.getClass() === this.getClass();
  },

  /**
   * 두 좌표가 거의 일치하는지를 검사한다.
   * 두 좌표간의 거리가 지정된 입실론값보다 작을 경우 거의 일치한다고 간주한다.
   * 변환 오차가 무시되므로 서로 다른 좌표계를 사용하는 좌표를 비교할 때 사용한다. 
   * @param {olleh.maps.Coord} other 비교할 상대 좌표
   * @param {Number} [epsilonInMeter=olleh.maps.Coord.DEFAULT_EPSILON_IN_METER] 입실론 값. 미터 단위.
   * @returns {Boolean} 두 좌표가 거의 일치할 경우 true, 그렇지 않을 경우 false.
   */
  almostEquals: function (other, epsilonInMeter) {
    return this.distanceTo(other) < (epsilonInMeter || olleh.maps.Coord.DEFAULT_EPSILON_IN_METER);
  },

  /**
   * 두 좌표간의 거리를 계산한다.
   * @param {olleh.maps.Coord} other 상대 좌표.
   * @returns {Number} 두 좌표간의 거리. 미터 단위.
   */
  distanceTo: function (other) {
    var utmkThis = this.asDefault();
    var utmkOther = other ? other.asDefault() : {
      x: 0,
      y: 0
    };
    var diff = {
      x: utmkThis.x - utmkOther.x,
      y: utmkThis.y - utmkOther.y
    };
    return Math.sqrt(Math.abs(diff.x * diff.x + diff.y * diff.y));
  },
  
  /**
   * 좌표를 x, y 속성을 가진 단순 객체로 변환하여 리턴한다.
   * @returns {Object} Plain-old JavaScript Object 
   */
  xy: function () {
    return {
      x: this.x,
      y: this.y
    };
  },

  /**
   * 현재 좌표를 다른 좌표계로 변환해 리턴한다.
   * @private
   * @param {cls} Type 변환할 좌표계 타입.
   * @returns {olleh.maps.Coord} 변환된 좌표계.
   */
  transform: function (Type) {
    if (this.getClass() === Type) {
      return this;
    }
    return new Type(Proj4js.transform(this.getClass().PROJ, Type.PROJ, this.xy()));
  },

  /**
   * 현재 좌표를 기본 좌표계인 {@link olleh.maps.UTMK}로 변환해 리턴한다.
   * @returns {olleh.maps.UTMK} 변환된 좌표.
   */
  asDefault: function () {
    return olleh.maps.UTMK.valueOf(this);
  },
  
  /**
   * Coord 객체를 복제한다.
   * @returns {olleh.maps.Coord} 복제된 객체
   */
  clone: function () {
    return new this.constructor(this.xy());
  }

});
/**
 * UTM-K 좌표계를 사용하는 좌표를 나타내는 클래스.
 * @group Base
 */
$class('olleh.maps.UTMK').extend(olleh.maps.Coord).define({

  $static: {
    /**
     * @constant
     * @type Proj4js.Proj
     */
    PROJ: new Proj4js.Proj('UTMK'),
    
    _projs: {},
    
    /**
     * 다른 좌표를 UTM-K 좌표계의 좌표로 변환한다.
     * @param {olleh.maps.Coord} coord 변환하고자 하는 좌표.
     * @returns {olleh.maps.UTMK} 변환된 좌표.
     *//**
     * 다른 좌표계로 표현된 좌표를 UTM-K 좌표계로 변환하여 인스턴스를 생성한다.
     * {@link olleh.maps.LatLng}, {@link olleh.maps.Katech} 등 별도의 클래스가
     * 존재하는 좌표계에 대해서는 사용을 권장하지 않으며, 대신 해당 클래스의
     * 인스턴스를 생성한 후 {@link olleh.maps.UTMK.valueOf(coord)}를 사용하는
     * 것을 권장한다.
     * @param {Object} xy x와 y 속성을 가진 객체.
     * @param {Number} xy.x x좌표.
     * @param {Number} xy.y y좌표.
     * @param {String} crs 원 좌표계의 Proj4js CRS 파라메터.
     * @returns {olleh.maps.UTMK} 변환된 좌표.
     * @see http://trac.osgeo.org/proj4js/wiki/UserGuide
     *//**
     * 다른 좌표계로 표현된 좌표를 UTM-K 좌표계로 변환하여 인스턴스를 생성한다.
     * {@link olleh.maps.LatLng}, {@link olleh.maps.Katech} 등 별도의 클래스가
     * 존재하는 좌표계에 대해서는 사용을 권장하지 않으며, 대신 해당 클래스의
     * 인스턴스를 생성한 후 {@link olleh.maps.UTMK.valueOf(coord)}를 사용하는
     * 것을 권장한다.
     * @param {Number} x x좌표.
     * @param {Number} y y좌표.
     * @param {String} crs 원 좌표계의 Proj4js CRS 파라메터.
     * @returns {olleh.maps.UTMK} 변환된 좌표.
     * @see http://trac.osgeo.org/proj4js/wiki/UserGuide
     */
    valueOf: function () {
      var proj, xy, crs;
      switch (arguments.length) {
      case 0:
        return olleh.maps.UTMK;
      case 1:
        return arguments[0].transform(olleh.maps.UTMK);
      case 2:
        xy = arguments[0];
        crs = arguments[1];
        break;
      default:
        xy = {
          x: arguments[0],
          y: arguments[1]
        };
        crs = arguments[2];
        break;
      } 

      if (crs != 'UTMK') {
        proj = olleh.maps.UTMK._projs[crs];
        if (!proj) {
          proj = olleh.maps.UTMK._projs[crs] = new Proj4js.Proj(crs);
        }
        xy = Proj4js.transform(proj, olleh.maps.UTMK.PROJ, xy);
      }
      
      return new olleh.maps.UTMK(xy);
    }

  },
  
  /**
   * 객체로부터 UTMK 좌표를 생성한다.
   * @param {Object} xy x와 y 속성을 가진 객체.
   * @function UTMK
   * @memberof olleh.maps.UTMK
   * @instance
   */
  /**
   * UTMK 좌표를 생성한다.
   * @param {Number} x x좌표.
   * @param {Number} y y좌표.
   */
  UTMK: function (arg0, arg1) {
    if (arguments.length > 1) {
      this.x = +arg0;
      this.y = +arg1;
    } else {
      this.x = +arg0.x;
      this.y = +arg0.y;
    }
  },
  
  /**
   * 현재 UTMK좌표정보를 문자열로 변환하여 반환한다.<br/>
   * 좌표출력형태는 {x: 957085.70, y: 1944017.52}를 따른다.
   * @returns 문자열로 변환된 좌표정보
   */
  toString: function () {
    return '{x: ' + this.x + ', y: ' + this.y + '}';
  },

  /**
   * 현재 좌표를 기본 좌표계인 {@link olleh.maps.UTMK}로 변환해 리턴한다.
   * @returns {olleh.maps.UTMK} 변환된 좌표.
   */
  asDefault: function () {
    // asDefault() 를 오버라이드 하면 약간의 성능 향상이 있음
    return this;
  }
  
});
/** 
 * LatLng(WGS84) 좌표계를 사용하는 좌표를 나타내는 클래스.
 * @group Base
 */
$class('olleh.maps.LatLng').extend(olleh.maps.Coord).define({

  $static: {
    /**
     * @constant
     * @type Proj4js.Proj
     */
    PROJ: new Proj4js.Proj('WGS84'),
    
    /**
     * 다른 좌표를 LatLng 좌표계의 좌표로 변환한다.
     * @param {olleh.maps.Coord} 변환하고자 하는 좌표.
     * @returns {olleh.maps.LatLng} 변환된 좌표.
     */
   valueOf: function (coord) {
     if (!arguments.length) {
       return olleh.maps.LatLng;
     }
      return coord.transform(olleh.maps.LatLng);
    }
  },


  /**
   * 객체로부터 LatLng 좌표를 생성한다.
   * @param {Object} xy x와 y 속성을 가진 객체.
   * @function LatLng
   * @memberof olleh.maps.LatLng
   * @instance
   */
  /**
   * 객체로부터 LatLng 좌표를 생성한다.
   * @param {Object} latlng lat와 lng 속성을 가진 객체.
   * @function LatLng
   * @memberof olleh.maps.LatLng
   * @instance
   */
  /**
   * LatLng 좌표를 생성한다. 파라메터의 순서가 y, x 순임을 주의하라.
   * @param {Number} y y좌표(Latitude).
   * @param {Number} x x좌표(Longitude).
   */
  LatLng: function (arg0, arg1) {
    if (arguments.length > 1) {
      this.y = +arg0;
      this.x = +arg1;
    } else if (arg0.lat !== undefined) {
      this.y = +arg0.lat;
      this.x = +arg0.lng;
    } else {
      this.y = +arg0.y;
      this.x = +arg0.x;
    }
  },

  /**
   * 현재 LatLng(WGS84)좌표정보를 문자열로 변환하여 반환한다.<br/>
   * 좌표출력형태는 {lat: 37.494416325586315, lng: 127.0145272694056}를 따른다.
   * @returns 문자열로 변환된 좌표정보
   */
  toString: function () {
    return '{lat: ' + this.y + ', lng: ' + this.x + '}';
  }
});
/**
 * Katech 좌표계를 사용하는 좌표를 나타내는 클래스.
 * @group Base
 */
$class('olleh.maps.Katech').extend(olleh.maps.Coord).define({

  $static:  {
    /**
     * @constant
     * @type Proj4js.Proj
     */
    PROJ: new Proj4js.Proj('KATECH'),
    
    /**
     * 좌표를 Katech 좌표계로 변환한다.
     * @param {olleh.maps.Coord} 변환하고자 하는 좌표.
     * @returns {olleh.maps.Katech} 변환된 좌표.
     */
    valueOf: function (coord) {
      if (!arguments.length) {
        return olleh.maps.Katech;
      }
      return coord.transform(olleh.maps.Katech);
    }
  },

  /**
   * 객체로부터 Katech 좌표를 생성한다.
   * @param {Object} xy x와 y 속성을 가진 객체.
   * @function Katech
   * @memberof olleh.maps.Katech
   * @instance
   */
  /**
   * Katech 좌표를 생성한다.
   * @param {Number} x x좌표.
   * @param {Number} y y좌표.
   */
  Katech: function (arg0, arg1) {
    if (arguments.length > 1) {
      this.x = +arg0;
      this.y = +arg1;
    } else {
      this.x = +arg0.x;
      this.y = +arg0.y;
    }
  }
  
});
/**
 * 지도 좌표를 배열로 저장하는 class. 개별 좌표는 {@link olleh.maps.Coord} class 를 사용한다.
 * @group Base
 */
$class('olleh.maps.Path').define({

  /**
   * 생성자, 명시된 coords를 사용해서 새로운 객체를 생성한다.
   * @param {Array.<olleh.maps.Coord>} [coords] {@link olleh.maps.Coord} 배열
   */
  Path: function (coords) {
    this._coords = coords || [];
  },

  /**
   * 현재 설정된 좌표를 모두 제거한다.
   */
  clear: function () {
    this._coords = [];
    this._notifyListeners();
  },

  /**
   * 설정된 좌표를 배열 형태로 반환한다.
   * @returns {Array.<olleh.maps.Coord>}
   */
  getCoords: function () {
    return this._coords;
  },

  /**
   * i 번째 좌표를 반환한다.
   * @param {Number} i
   * @returns {olleh.maps.Coord}
   */
  getAt: function (i) {
    return this._coords[i];
  },

  /**
   * 좌표의 개수를 반환한다.
   * @return {Number}
   */
  getLength: function () {
    return this._coords.length;
  },

  /**
   * 좌표 coord 를 i 번째 위치에 삽입한다.
   * @param {Number} i 
   * @param {olleh.maps.Coord} coord 
   */
  insertAt: function (i, coord) {
    this._coords.splice(i, 0, coord);
    this._notifyListeners();
  },

  /**
   * 마지막 좌표를 제거한다.
   * @returns {olleh.maps.Coord} 제거된 마지막 좌표
   */
  pop: function () {
    var last = this._coords.pop();
    this._notifyListeners();
    return last;
  },

  /**
   * 좌표 coord 를 마지막에 추가한다.
   * @param {olleh.maps.Coord} coord
   */
  push: function (coord) {
    this._coords.push(coord);
    this._notifyListeners();
  },

  /**
   * i 번째 좌표를 제거한다.
   * @param {Number} i
   * @returns {olleh.maps.Coord}
   */
  removeAt: function (i) {
    return this._coords.splice(i, 1)[0];
    this._notifyListeners();
  },

  /**
   * i 번째 좌표를 coord 로 변경한다.
   * @param {Number} i
   * @param {olleh.maps.Coord} coord
   */
  setAt: function (i, coord) {
    this._coords[i] = coord;
    this._notifyListeners();
  },

  /**
   * 이 Path 객체가 변경되면 실행될 callbackFn 을 등록한다. 
   * @param {Function} callbackFn function(path) - path: this object (olleh.maps.Path) 
   */
  onChange: function (callbackFn, ctx) {
    var listener = this._getEventListener(callbackFn, true);
    var idx = olleh.maps.util.indexOf(listener.ctxs, ctx);
    if (idx === -1) {
      listener.ctxs.push(ctx);
    }
  },

  /**
   * onChange() 로 등록한 callbackFn 을 제거한다.
   * @param {Function} callbackFn 
   * @param {Object} ctx 
   */
  unsubscribeChange: function (callbackFn, ctx) {
    var listener = this._getEventListener(callbackFn, false);
    if (listener) {
      var idx = olleh.maps.util.removeFromArray(listener.ctxs, ctx);
      if (idx > -1 && listener.ctxs.length === 0) {
        olleh.maps.util.removeFromArray(this._listeners, listener);
      }
    }
  },

  _notifyListeners: function () {
    if (!this._listeners) {
      return;
    }
    for ( var i = 0, len = this._listeners.length; i < len; i++) {
      var listener = this._listeners[i];
      var callbackFn = listener.callbackFn;
      var ctxs = listener.ctxs;
      for ( var j = 0, len = ctxs.length; j < len; j++) {
        callbackFn.call(ctxs[j], this);
      }
    }
  },

  /**
   * @param {Function} callbackFn
   * @param {Boolean} create
   * @returns {Object} callbackFn: Function, ctxs: {Array} 
   */
  _getEventListener: function (callbackFn, create) {
    var listener;
    var listeners = this._listeners;
    if (listeners) {
      for ( var i = 0, len = listeners.length; i < len; i++) {
        if (listeners[i].callbackFn === callbackFn) {
          listener = listeners[i];
          break;
        }
      }
    }
    if (!listener && create) {
      if(!listeners) {
        this._listeners = [];
      }
      listener = {
        callbackFn: callbackFn,
        ctxs: []
      };
      this._listeners.push(listener);
    }
    return listener;
  },
  
  /**
   * 첫번째 Coord 를 반환한다.
   * @returns {olleh.maps.Coord}
   */
  getFirst: function() {
    return this.getAt(0);
  },
  
  /**
   * 마지막 Coord 를 반환한다.
   * @returns {olleh.maps.Coord}
   */
  getLast: function() {
    return this.getAt(this.getLength() - 1);
  },
  
  /**
   * 총거리를 반환한다.
   * @returns {Number}
   */
  getDistance: function() {
    var coords = this._coords;
    if(coords.length < 2)
      return 0;
    var distance = 0;
    for(var i = 1 ; i < coords.length; i++) {
      distance += coords[i - 1].distanceTo(coords[i]);  
    } 
    return distance;
  },
  
  /**
   * path 로 polygon 을 구성할때의 면적을 구한다.
   * @see http://www.mathopenref.com/coordpolygonarea2.html
   */
  getArea: function() {
    var coords = this._coords;
    if(coords.length < 3)
      return 0;
    var j = coords.length - 1;
    var area = 0;
    for (var i = 0; i < coords.length ; i++) {
      var coord1 = coords[j];
      var coord2 = coords[i];
      area += (coord1.x + coord2.x) * (coord1.y - coord2.y);
      j = i;
    }
    area /= 2;
    if(area < 0)
      area = -area;
    return area;
  },
  
  /**
   * Path 의 좌표계 타입을 리턴한다.
   * @returns {class} 좌표계 타입.
   */
  getType: function () {
    if(this._coords.length === 0)
      return null;
    return this._coords[0].getClass();
  },
  
  /**
   * Path 가 Polygon 을 구성할때의 무게중심을 반환한다.
   * @returns {olleh.maps.Coord} 중심점
   */
  getCenteroid: function() {
    var coords = this._coords;
    var len = coords.length;
    if(len === 0)
      return null;
    if(len === 1)
      return coords[0];
    var sumX = 0.0;
    var sumY = 0.0;
    for (var i=0, j=len-1 ; i < len ; i++ ){
      var b = coords[j];
      var c = coords[i];
      sumX += (b.x + c.x) * (b.x * c.y - c.x * b.y);
      sumY += (b.y + c.y) * (b.x * c.y - c.x * b.y);
      j = i;
    }
    var area = this.getArea();
    var x = sumX / (6 * area);
    var y = sumY / (6 * area);
    var center = new (this.getType())({x: x, y: y});
    return center;
  },

  /**
   * Path 의 bounds 를 반환한다.
   * @returns {olleh.maps.Bounds} bounds
   */
  getBounds: function() {
    var coords = this._coords;
    if (!coords.length) {
      return null;
    }
    
    var left = Infinity, bottom = Infinity, right = 0, top = 0;
    for (var i = 0; i < this.getLength(); i++) {
      var coord = this.getAt(i);
      if (left > coord.x) {
        left = coord.x;
      }
      if (bottom > coord.y) {
        bottom = coord.y;
      }
      if (right < coord.x) {
        right = coord.x;
      }
      if (top < coord.y) {
        top = coord.y;
      }
    }

    var Type = this.getType();
    var leftBottom = new Type({x: left, y: bottom});
    var rightTop = new Type({x: right, y: top});
    return new olleh.maps.Bounds(leftBottom, rightTop);
  },
  
  /**
   * Path 와 coord 좌표간의 최단 거리를 구한다.
   * @param {olleh.maps.Coord} coord 좌표
   * @param {Boolean} [closedPath=false] true 인 경우 시작점과 끝점이 이어지는 closedPath 로 간주한다. 
   * @returns {Number} 
   */
  distanceTo: function(coord, closedPath) {
    coord = coord.asDefault();
    var coords = this._coords;
    var dist;
    for(var i=0; i<coords.length; i++) {
      var coord1;
      var coord2;
      if(i==coords.length-1) {
        if(closedPath) {
          coord1 = coords[i].asDefault();
          coord2 = coords[0].asDefault();
        } else {
          break;
        }
      } else {
        coord1 = coords[i].asDefault();
        coord2 = coords[i+1].asDefault();
      }
      var d = this._distanceToSegment(coord, {x1:coord1.x, y1:coord1.y, x2:coord2.x, y2:coord2.y });
      if(dist === undefined || d < dist) {
        dist = d;
      }
    }
    return dist;
  },
  
  /**
   * point 에서 segment 까지의 거리를 계산한다.
   * @param {olleh.maps.Coord} coord
   * @param {Object} {x1,y1,x2,y2} x1,y1 에서 x2,y2로 이어지는 선 
   * @returns {Number} 거리
   * @private 
   */
  _distanceToSegment: function(point, segment) {
    var x0 = point.x;
    var y0 = point.y;
    var x1 = segment.x1;
    var y1 = segment.y1;
    var x2 = segment.x2;
    var y2 = segment.y2;
    var dx = x2 - x1;
    var dy = y2 - y1;
    var along = ((dx * (x0 - x1)) + (dy * (y0 - y1))) /
                (Math.pow(dx, 2) + Math.pow(dy, 2));
    var x, y;
    if(along <= 0.0) {
        x = x1;
        y = y1;
    } else if(along >= 1.0) {
        x = x2;
        y = y2;
    } else {
        x = x1 + along * dx;
        y = y1 + along * dy;
    }
    return Math.sqrt(Math.pow(x - x0, 2) + Math.pow(y - y0, 2));
  },
  
  /**
   * Path 를 구성하는 좌표를  douglas-peucker 알고리즘으로 단순화한다. <br>
   * douglas-peucker 알고리즘: http://en.wikipedia.org/wiki/Ramer%E2%80%93Douglas%E2%80%93Peucker_algorithm
   * @param {Number} tolerance dp 알고리즘 threshold
   * @returns {olleh.maps.Path} 단순화된 path 객체 
   */
  simplify: function(tolerance) {
    var coords = this._coords;
    if(coords.length < 3)
      return this;
    var firstPoint = 0;
    var lastPoint = coords.length - 1;
    var pointIndexsToKeep = [];
    
    pointIndexsToKeep.push(firstPoint);
    pointIndexsToKeep.push(lastPoint);

    while (coords[firstPoint].equals(coords[lastPoint])) {
        lastPoint--;
        pointIndexsToKeep.push(lastPoint);
    }
    
    this._douglasPeuckerReduction(coords, firstPoint, lastPoint, tolerance, pointIndexsToKeep);
    
    var returnPoints = [];
    pointIndexsToKeep.sort(function(a, b){
        return (a-b);
    });
    for (var index = 0; index < pointIndexsToKeep.length; index++) {
        returnPoints.push(coords[pointIndexsToKeep[index]]);
    }
    return new olleh.maps.Path(returnPoints);
  },
  
  _douglasPeuckerReduction: function(coords, firstPoint, lastPoint, tolerance, pointIndexsToKeep) {
    var maxDistance = 0;
    var indexFarthest = 0;

    for (var index = firstPoint, distance; index < lastPoint; index++) {
        distance = this._perpendicularDistance(coords[firstPoint], coords[lastPoint], coords[index]);
        if (distance > maxDistance) {
            maxDistance = distance;
            indexFarthest = index;
        }
    }

    if (maxDistance > tolerance && indexFarthest != firstPoint) {
        pointIndexsToKeep.push(indexFarthest);
        this._douglasPeuckerReduction(coords, firstPoint, indexFarthest, tolerance, pointIndexsToKeep);
        this._douglasPeuckerReduction(coords, indexFarthest, lastPoint, tolerance, pointIndexsToKeep);
    }
  },
  
  _perpendicularDistance: function(point1, point2, point){
      var area = Math.abs(0.5 * (point1.x * point2.y + point2.x * point.y + point.x * point1.y - point2.x * point1.y - point.x * point2.y - point1.x * point.y));
      var bottom = Math.sqrt(Math.pow(point1.x - point2.x, 2) + Math.pow(point1.y - point2.y, 2));
      var height = area / bottom * 2;
      return height;
  }

});
/**
 * 지도상의 특정 영역을 타나내는 클래스.
 * @group Base
 */
$class('olleh.maps.Bounds').define({

  /**
   * 생성자, 명시된 leftBottom,rightTop를 사용해서 새로운 객체를 생성한다.
   * @param {olleh.maps.Coord} leftBottom 영역의 좌하단 좌표.
   * @param {olleh.maps.Coord} rightTop 영역의 우상단 좌표. <code>leftBottom</code>과 같은 좌표계를 사용해야 한다.
   */
  Bounds: function (leftBottom, rightTop) {
    if (leftBottom.getClass() != rightTop.getClass()) {
      throw new TypeError('Coordinate system mismatch: ' + leftBottom.$classname + ', ' + rightTop.$classname);
    }
    
    /**
     * 영역의 좌하단 좌표. 읽기 전용이므로 수정해서는 안 된다.
     * @type olleh.maps.Coord
     */
    this.leftBottom = leftBottom;

    /**
     * 영역의 우상단 좌표. 읽기 전용이므로 수정해서는 안 된다.
     * @type olleh.maps.Coord
     */
    this.rightTop = rightTop;
  },
  
  /**
   * 영역의 좌표계 타입을 리턴한다.
   * @returns {cls} 좌표계 타입.
   */
  getType: function () {
    return this.leftBottom.getClass();
  },

  /**
   * 두 영역이 완전히 일치하는지를 검사한다. 좌표계 또한 일치해야만 일치한다고 간주한다. 
   * @param {olleh.maps.Bounds} other 비교할 상대 좌표.
   * @returns {Boolean} 일치할 경우 true, 그렇지 않을 경우 false.
   */
  equals: function (other) {
    return this.leftBottom.equals(other.leftBottom)
        && this.rightTop.equals(other.rightTop);
  },

  /**
   * 두 영역이 거의 일치하는지를 검사한다.
   * 서로 다른 좌표계를 사용하는 영역을 비교할 때 사용한다. 
   * @param {olleh.maps.Bounds} other 비교할 상대 영역
   * @param {Number} [epsilonInMeter] 입실론 값. 미터 단위.
   * @returns {Boolean} 두 영역이 거의 일치할 경우 true, 그렇지 않을 경우 false.
   * @see olleh.maps.Coord#almostEquals()
   */
  almostEquals: function (other, epsilonInMeter) {
    return this.leftBottom.almostEquals(other.leftBottom, epsilonInMeter)
        && this.rightTop.almostEquals(other.rightTop, epsilonInMeter);
  },
  
  /**
   * 영역의 좌측 좌표를 리턴한다.
   * @returns {Number} 좌측 좌표.
   */
  getLeft: function () {
    return this.leftBottom.x;
  },

  /**
   * 영역의 하단 좌표를 리턴한다.
   * @returns {Number} 하단 좌표.
   */
  getBottom: function () {
    return this.leftBottom.y;
  },

  /**
   * 영역의 우측 좌표를 리턴한다.
   * @returns {Number} 우측 좌표.
   */
  getRight: function () {
    return this.rightTop.x;
  },

  /**
   * 영역의 상단 좌표를 리턴한다.
   * @returns {Number} 상단 좌표.
   */
  getTop: function () {
    return this.rightTop.y;
  },

  /**
   * 영역의 좌상단 좌표를 리턴한다.
   * @returns {olleh.maps.Coord} 좌상단 좌표.
   */
  getLeftTopCoord: function() {
    return new (this.getType())({x: this.getLeft(), y: this.getTop()});
  },
  
  /**
   * 영역의 우하단 좌표를 리턴한다.
   * @returns {olleh.maps.Coord} 우하단 좌표.
   */
  getRightBottomCoord: function() {
    return new (this.getType())({x: this.getRight(), y: this.getBottom()});
  },

  /**
   * 영역의 너비를 리턴한다.
   * @returns {Number} 너비. 미터 단위.
   */
  getWidth: function () {
    var utmkBounds = this.asDefault();
    return utmkBounds.getRight() - utmkBounds.getLeft();
  },

  /**
   * 영역의 높이를 리턴한다.
   * @returns {Number} 높이. 미터 단위.
   */
  getHeight: function () {
    var utmkBounds = this.asDefault();
    return utmkBounds.getTop() - utmkBounds.getBottom();
  },

  /**
   * 영역의 중심 좌표를 리턴한다.
   * @returns {olleh.maps.UTMK} 영역의 중심 좌표. 기본 좌표계인 {@link olleh.maps.UTMK}로 리턴된다.
   */
  getCenter: function () {
    var utmkThis = this.asDefault();
    var coord = new olleh.maps.UTMK((utmkThis.getLeft() + utmkThis.getRight()) / 2,
        (utmkThis.getBottom() + utmkThis.getTop()) / 2); 
    return coord;
  },
  
  /**
   * 영역이 다른 영역 또는 좌표와 겹치는지 여부를 리턴한다.
   * @param {olleh.maps.Bounds|olleh.maps.Coord} other 비교할 영역 또는 좌표.
   * @returns {Boolean} 다른 영역 또는 좌표와 겹칠 경우 true, 그렇지 않을 경우 false.
   */
  intersects: function (other) {
    if(!other)
      return false;
    if (other.x !== undefined && other.y !== undefined) {
      return this._containsCoord(other);
    }
    var utmkThis = this.asDefault();
    var utmkOther = other.asDefault();
    return utmkThis.getLeft() <= utmkOther.getRight()
        && utmkThis.getBottom() <= utmkOther.getTop()
        && utmkThis.getRight() >= utmkOther.getLeft()
        && utmkThis.getTop() >= utmkOther.getBottom();
  },

  /**
   * 영역이 다른 영역 또는 좌표를 포함하는지 여부를 리턴한다.
   * @param {olleh.maps.Bounds|olleh.maps.Coord} other 비교할 영역 또는 좌표.
   * @returns {Boolean} 다른 영역 또는 좌표를 포함할 경우 true, 그렇지 않을 경우 false.
   */
  contains: function (other) {
    if(!other)
      return false;
    if (other.x !== undefined && other.y !== undefined) {
      return this._containsCoord(other);
    }
    var utmkThis = this.asDefault();
    var utmkOther = other.asDefault();
    return utmkThis.getLeft() <= utmkOther.getLeft()
        && utmkThis.getBottom() <= utmkOther.getBottom()
        && utmkThis.getRight() >= utmkOther.getRight()
        && utmkThis.getTop() >= utmkOther.getTop();
  },

  /**
   * 영역이 다른 좌표를 포함하는지 여부를 리턴한다.
   * @private
   * @param {olleh.maps.Coord} coord 비교할 좌표.
   * @returns {Boolean} 다른 좌표를 포함할 경우 true, 그렇지 않을 경우 false.
   */
  _containsCoord: function (coord) {
    var utmkThis = this.asDefault();
    var utmkCoord = coord.asDefault();
    return utmkThis.getLeft() <= utmkCoord.x
        && utmkThis.getBottom() <= utmkCoord.y
        && utmkThis.getRight() >= utmkCoord.x
        && utmkThis.getTop() >= utmkCoord.y;
  },
  
  /**
   * 다른 영역과 겹치는 영역을 리턴한다.
   * @param {olleh.maps.Bounds} other 다른 영역.
   * @returns {olleh.maps.Bounds} 다른 영역과 겹치는 영역. 기본 좌표계인 {@link olleh.maps.UTMK}를 사용한다. 다른 영역과 겹치지 않을 경우 <code>null</code>을 리턴한다.
   */
  intersection: function (other) {
    if (!this.intersects(other)) {
      return null;
    }
    var utmkThis = this.asDefault();
    var utmkOther = other.asDefault();
    return new olleh.maps.Bounds(
        new olleh.maps.UTMK(Math.max(utmkThis.getLeft(), utmkOther.getLeft()), Math.max(utmkThis.getBottom(), utmkOther.getBottom())),
        new olleh.maps.UTMK(Math.min(utmkThis.getRight(), utmkOther.getRight()), Math.min(utmkThis.getTop(), utmkOther.getTop()))
    );
  },

  /**
   * 다른 영역 또는 좌표를 포함하는 영역을 리턴한다.
   * @param {olleh.maps.Bounds|olleh.maps.Coord} other 다른 영역 또는 좌표.
   * @returns {olleh.maps.Bounds} 다른 영역 또는 좌표를 포함하는 영역. 기본 좌표계인 {@link olleh.maps.UTMK}를 사용한다. 다른 영역 또는 좌표와 겹치지 않을 경우 자기 자신을 리턴한다.
   */
  union: function (other) {
    if (this.contains(other)) {
      return this;
    }
    if (other.x !== undefined && other.y !== undefined) {
      return this._unionCoord(other);
    }
    var utmkThis = this.asDefault();
    var utmkOther = other.asDefault();
    return new olleh.maps.Bounds(
        new olleh.maps.UTMK(Math.min(utmkThis.getLeft(), utmkOther.getLeft()), Math.min(utmkThis.getBottom(), utmkOther.getBottom())),
        new olleh.maps.UTMK(Math.max(utmkThis.getRight(), utmkOther.getRight()), Math.max(utmkThis.getTop(), utmkOther.getTop()))
    );
  },
  
  /**
   * 다른 좌표를 포함하는 영역을 리턴한다.
   * @private
   * @param {olleh.maps.Coord} other 포함시킬 영역 또는 좌표.
   * @returns {olleh.maps.Bounds} 다른 영역 또는 좌표를 포함하는 영역. 기본 좌표계인 {@link olleh.maps.UTMK}를 사용한다.
   */
  _unionCoord: function (coord) {
    var utmkThis = this.asDefault();
    var utmkCoord = coord.asDefault();
    return new olleh.maps.Bounds(
        new olleh.maps.UTMK(Math.min(utmkThis.getLeft(), utmkCoord.x), Math.min(utmkThis.getBottom(), utmkCoord.y)),
        new olleh.maps.UTMK(Math.max(utmkThis.getRight(), utmkCoord.x), Math.max(utmkThis.getTop(), utmkCoord.y))
    );
  },
  
  /**
   * 현재 영역의 크기를 중심점을 기준으로 일정 길이만큼 확장해 리턴한다. 
   * @param {Number} width 확장할 가로 길이. 미터 단위.
   * @param {Number} height 확장할 세로 길이. 미터 단위.
   * @returns {olleh.maps.Bounds} 확장된 영역. 기본 좌표계인 {@link olleh.maps.UTMK}를 사용한다.
   */
  expand: function (width, height) {
    var utmkThis = this.asDefault();
    return new olleh.maps.Bounds(
        new olleh.maps.UTMK(utmkThis.getLeft() - width / 2, utmkThis.getBottom() - height / 2),
        new olleh.maps.UTMK(utmkThis.getRight() + width / 2, utmkThis.getTop() + height / 2)
    );
  },
  
  /**
   * 현재 영역의 좌표계를 다른 좌표계로 변환해 리턴한다.
   * @param {cls} Type 변환할 좌표계 타입.
   * @returns {olleh.maps.Bounds} 변환된 영역.
   * @see olleh.maps.Coord.valueOf()
   */
  transform: function (Type) {
    if (this.getType() === Type) {
      return this;
    }
    return new olleh.maps.Bounds(Type.valueOf(this.leftBottom), Type.valueOf(this.rightTop));
  },
  
  /**
   * 현재 영역의 좌표계를 기본 좌표계인 {@link olleh.maps.UTMK}로 변환해 리턴한다.
   * @returns {olleh.maps.Bounds} 변환된 영역.
   * @see olleh.maps.Coord#asDefault()
   */
  asDefault: function () {
    return this.transform(olleh.maps.UTMK);
  }

});
/**
 * 화면상 좌표를 나타내는 클래스.
 * @group Base
 */
$class('olleh.maps.Point').define({
  
  $static: {
    zero: function () {
      return olleh.maps.Point._zero || (olleh.maps.Point._zero = new olleh.maps.Point(0, 0));
    }
  },

  /**
   * 생성자, 명시된 x, y를 사용해서 새로운 객체를 생성한다.
   * @param {Number} x 화면상 x 좌표. 픽셀 단위.
   * @param {Number} y 화면상 y 좌표. 픽셀 단위.
   */
  Point: function (x, y) {
    /**
     * 화면상 x 좌표.
     * @type Number
     * @readonly
     */
    this.x = +x;

    /**
     * 화면상 y 좌표.
     * @type Number
     * @readonly
     */
    this.y = +y;
  },
  
  /**
   * clone this object
   * @returns {olleh.maps.Point}
   */
  clone: function () {
    return new olleh.maps.Point(this.x, this.y);
  },
  
  /**
   * Test for equality
   * @param {olleh.maps.Point} other
   * @returns {Boolean}
   */
  equals: function (other) {
    return this.x === other.x && this.y === other.y;
  },

  /**
   * point 를 더한 값을 가지는 새로운 객체를 return 한다. 
   * @param {olleh.maps.Point} point
   * @returns {olleh.maps.Point} newly created Point
   */
  //non-destructive, returns a new point
  add: function (point) {
    return this.clone()._add(point);
  },

  /**
   * arg0 Point 를 더하거나 arg0, arg1 값을 각각 x,y 에 더한다. 
   * this 객체 값이 변경된다.
   * @param {olleh.maps.Ponint | Number} arg0
   * @param {Number} arg1 (optional)
   * @returns {olleh.maps.Point} this object
   */
  // destructive, used directly for performance in situations where it's safe to modify existing point
  _add: function (arg0, arg1) {
    if(arguments.length === 1) {
      this.x += arg0.x;
      this.y += arg0.y;
    } else {
      this.x += arg0;
      this.y += arg1;
    }
    return this;
  },

  /**
   * point 를 뺀 새로운 객체를 return 한다.
   * @param {olleh.maps.Point} point
   * @returns {olleh.maps.Point} newly created Point
   */
  subtract: function (point) {
    return this.clone()._subtract(point);
  },

  /**
   * arg0 Point 를 빼거나 arg0, arg1 값을 각각 x,y 에서 뺀다.
   * this 객체의 값이 변경된다.
   * @param {olleh.maps.Ponint | Number} arg0
   * @param {Number} arg1 (optional)
   * @returns {olleh.maps.Point} this object
   */
  _subtract: function (arg0, arg1) {
    if(arguments.length === 1) {
      this.x -= arg0.x;
      this.y -= arg0.y;
    } else {
      this.x -= arg0;
      this.y -= arg1;
    }
    return this;
  },

  /**
   * x, y 값을 num 으로 나눈 새로운 Point 객체를 return
   * @param {Number} num
   * @returns {olleh.maps.Point} 새롭게 생성된 객체
   */
  divideBy: function (num) {
    return this.clone()._divideBy(num);
  },

  /**
   * this 객체의 x, y 값을 num 으로 나눈다.
   * @param {Number} num
   * @returns {olleh.maps.Point} this 객체
   */
  _divideBy: function (num) {
    this.x /= num;
    this.y /= num;
    return this;
  },

  /**
   * x, y 값을 num 으로 곱한 새로운 Point 객체를 return
   * @param {Number} num
   * @returns {olleh.maps.Point} 새롭게 생성된 객체
   */
  multiplyBy: function (num) {
    return this.clone()._multiplyBy(num);
  },

  /**
   * this 객체의 x, y 값을 num 으로 나눈다.
   * @param {Number} num
   * @returns {olleh.maps.Point} this object
   */
  _multiplyBy: function (num) {
    this.x *= num;
    this.y *= num;
    return this;
  },

  /**
   * x,y 값을 반올림한 새로운 Point 객체 생성
   * @returns {olleh.maps.Point} 새롭게 생성된 객체
   */
  round: function () {
    return this.clone()._round();
  },

  /**
   * x,y 값을 반올림한다.
   * @returns {olleh.maps.Point} this object
   */
  _round: function () {
    this.x = Math.round(this.x);
    this.y = Math.round(this.y);
    return this;
  },

  /**
   * x,y 값을 내림한 새로운 Point 객체 생성
   * @returns {olleh.maps.Point} 새롭게 생성된 객체
   */
  floor: function () {
    return this.clone()._floor();
  },

  /**
   * x,y 값을 내림한다.
   * @returns {olleh.maps.Point} this object
   */
  _floor: function () {
    this.x = Math.floor(this.x);
    this.y = Math.floor(this.y);
    return this;
  },

  /**
   * Calculates the distance from this Point to the one specified.
   * @param {olleh.maps.Point} point 
   * @returns {Number}
   */
  distanceTo: function (point) {
    var x = point.x - this.x,
      y = point.y - this.y;
    return Math.sqrt(x * x + y * y);
  },
  
  /**
   * @returns {String}
   */
  toCSSString: function () {
    return this.x + 'px ' +  this.y + 'px';
  }

});
/**
 * 화면상 크기를 나타내는 클래스.
 * @group Base
 */
$class('olleh.maps.Size').define({

  $static: {
    zero: function () {
      return olleh.maps.Size._zero || (olleh.maps.Size._zero = new olleh.maps.Size(0, 0));
    },

    full: function () {
      return olleh.maps.Size._full || (olleh.maps.Size._full = new olleh.maps.Size(100, 100, '%'));
    }
  },
  
  /**
   * 생성자, 명시된 width, height를 사용해서 새로운 객체를 생성한다.
   * @param {Number} width 화면상 너비.
   * @param {Number} height 화면상 높이.
   * @param {String} [unit=px] 너비와 높이의 단위.
   */
  Size: function (width, height, unit) {
    /**
     * 화면상 너비.
     * @type Number
     * @readonly
     */
    this.width = +width;
    
    /**
     * 화면상 높이.
     * @type Number
     * @readonly
     */
    this.height = +height;

    /**
     * 너비와 높이의 단위.
     * @type String
     * @readonly
     */
    this.unit = unit || 'px';
  },
  
  /**
   * clone this object
   * @returns {olleh.maps.Size}
   */
  clone: function () {
    return new olleh.maps.Size(this.width, this.height, this.unit);
  },
  
  /**
   * Test for equality
   * @param {olleh.maps.Size} other
   * @returns {Boolean}
   */
  equals: function (other) {
    return this.width === other.width && this.height === other.height && this.unit === other.unit;
  },

  /**
   * size 의 width, height 를 이 객체에 더한다.
   * @param {olleh.maps.Size} size
   * @returns {olleh.maps.Size} this object
   */
  add: function (size) {
    return this.clone()._add(size);
  },
  
  /**
   * destructive, used directly for performance in situations where it's safe to modify existing Size
   * @param arg0 {Number | olleh.maps.Size} arg0
   * @param arg1 {Number} [arg1]
   * @returns {olleh.maps.Size}
   * @private
   */
  _add: function(arg0, arg1) {
    if (arguments.length === 1) {
      if (this.unit != arg0.unit) {
        throw new TypeError('Unit mismatch: ' + this.unit + ', ' + arg0.unit);
      }
      this.width += arg0.width;
      this.height += arg0.height;
    } else {
      this.width += arg0;
      this.height += arg1;
    }
    return this;
  },
  

  /**
   * size 의 width, height 를 이 객체에서 뺀다.
   * @param {olleh.maps.Size} size
   * @returns {olleh.maps.Size} this object
   */
  subtract: function (size) {
    return this.clone()._subtract(size);
  },
  
  /**
   * destructive, used directly for performance in situations where it's safe to modify existing Size
   * @param arg0 {Number | olleh.maps.Size} arg0
   * @param arg1 {Number} [arg1]
   * @returns {olleh.maps.Size}
   * @private
   */
  _subtract: function (arg0, arg1) {
    if (arguments.length === 1) {
      if (arg0.unit != this.unit) {
        throw new TypeError("unit");
      }
      this.width -= arg0.width;
      this.height -= arg0.height;
    } else {
      this.width -= arg0;
      this.height -= arg1;
    }
    return this;
  },

  /**
   * this 객체의 width, height 값을 num 으로 나눈다.
   * @param {Number} num
   * @returns {olleh.maps.Size} this object
   */
  divideBy: function (num) {
    return this.clone()._divideBy(num);
  },
  
  _divideBy: function (num) {
    this.width /= num;
    this.height /= num;
    return this;
  },

  /**
   * this 객체의 width, height 값을 num 으로 나눈다.
   * @param {Number} num
   * @returns {olleh.maps.Size} this object
   */
  multiplyBy: function (num) {
    return this.clone()._multiplyBy(num);
  },
  
  _multiplyBy: function (num) {
    this.width *= num;
    this.height *= num;
    return this;
  },

  /**
   * this 객체의 width, height 값을 반올림한다.
   * @returns {olleh.maps.Size} this object
   */
  round: function () {
    return this.clone()._round();
  },
  
  _round: function () {
    this.width = Math.round(this.width);
    this.height = Math.round(this.height);
    return this;
  },

  /**
   * this 객체의 width, height 값을 내림한다.
   * @returns {olleh.maps.Size} this object
   */
  floor: function () {
    return this.clone()._floor();
  },
  
  _floor: function () {
    this.width = Math.floor(this.width);
    this.height = Math.floor(this.height);
    return this;
  },
  
  /**
   * @returns {String}
   */
  toCSSString: function () {
    return this.width + this.unit + ' ' +  this.height + this.unit;
  },
  
  /**
   * width => point.x, height => point.y
   * @returns {olleh.maps.Point}
   */
  asPoint: function() {
    if (this.unit != 'px') {
      throw new TypeError('Unit must be a px: ' + this.unit);
    }
    return new olleh.maps.Point(this.width, this.height);
  }

});
/**
 * HTML 엘리먼트를 래핑해 브라우저 호환성 및 각종 유틸리티 기능을 제공하는 클래스.
 */
$class('olleh.maps.Element').define({
  
  $static: {
    /**
     * 지정한 태그 이름을 가진 HTML 엘리먼트와
     * 이를 래핑한 {@link olleh.maps.Element} 인스턴스를 함께 생성한다.
     * @param {String} tagName 태그 이름.
     * @returns {olleh.maps.Element} 생성된 {@link olleh.maps.Element} 인스턴스.
     */
    create: function (tagName) {
      if (!tagName) return null;
      var element = new olleh.maps.Element(document.createElement(tagName));
      var browser = olleh.maps.browser;
      if (browser.browserName === browser.BROWSER_NAME.ie) {
        element.elem.setAttribute('unselectable', 'on');
      }
      return element;
    }
    
  },
  
  /**
   * 생성자, 명시된 elem를 사용해서 새로운 객체를 생성한다.
   * @param {HTMLElement} elem HTML 엘리먼트.
   */
  Element: function (elem) {
    /**
     * HTML 엘리먼트.
     * @readonly
     * @type HTMLElement
     */
    this.elem = elem;
  },
  
  /**
   * HTML 엘리먼트의 속성을 리턴한다.
   * @param {String} name 속성 이름.
   * @returns {String} 속성 값.
   */
  getProperty: function (name) {
    return this.elem[name];
  },
  
  /**
   * HTML 엘리먼트의 속성을 설정한다.
   * @param {String} name 속성 이름.
   * @param {String} value 속성 값.
   * @returns {olleh.maps.Element} 자기 자신.
   */
  setProperty: function (name, value) {
    this.elem[name] = value;
    return this;
  },
  
  /**
   * HTML 엘리먼트의 여러 속성을 한 번에 설정한다.
   * @param {Object} properties key-value 쌍으로 이루어진 속성 값.
   * @returns {olleh.maps.Element} 자기 자신.
   */
  setProperties: function (properties) {
    var k;
    for (k in properties) {
      this.setProperty(k, properties[k]);
    }
    return this;
  },
  
  /**
   * HTML 엘리먼트의 CSS 스타일을 리턴한다.
   * @param {String} style 스타일 이름.
   * @returns {String} 스타일 값.
   */
  getStyle: function (style) {
    return olleh.maps.util.dom.getStyle(this.elem, style);
  },
  
  /**
   * HTML 엘리먼트의 CSS 스타일을 설정한다.
   * @param {String} name 스타일 이름.
   * @param {String} value 스타일 값.
   */
  setStyle: function (name, value) {
    olleh.maps.util.dom.setStyle(this.elem, name, value);
    return this;
  },
  
  /**
   * HTML 엘리먼트의 여러 CSS 스타일을 한 번에 설정한다.
   * @param {Object} styles key-value 쌍으로 이루어진 스타일 값.
   * @returns {olleh.maps.Element} 자기 자신.
   */
  setStyles: function (styles) {
    var k;
    for (k in styles) {
      this.setStyle(k, styles[k]);
    }
    return this;
  },
  
  /**
   * CSS className을 설정한다.
   * @param {String} className CSS 클래스 이름
   * @returns {olleh.maps.Element} 자기 자신.
   */
  addClass: function (className) {
    olleh.maps.util.dom.addClass(this.elem, className);
    return this;
  },

  /**
   * CSS className이 설정되었는지 확인하고 그 결과를 반환한다.
   * @param {String} className CSS클래스 이름
   * @returns {Boolean} 명시된 className이 설정되어 있다면
   * true를 반환한다.
   */
  hasClass: function (className) {
    return olleh.maps.util.dom.hasClass(this.elem, className);
  },

  /**
   * CSS className을 제거한다.
   * @param {String} className css 클래스 이름
   * @returns {olleh.maps.Element} 자기 자신.
   */
  removeClass: function (className) {
    olleh.maps.util.dom.removeClass(this.elem, className);
    return this;
  },

  /**
   * oldClassName 스타일 클래스를 newClassName 스타일 클래스로 교체한다.<p/>
   * 만약 oldClassName가 설정되어 있지 않다면 newClassName스타일 클래스가 추가된다.
   * @param {String} oldClassName 교체될 스타일 클래스 이름
   * @param {String} newClassName 교체할 스타일 클래스 이름
   * @returns {olleh.maps.Element} 자기 자신.
   */
  replaceClass: function (oldClassName, newClassName) {
    olleh.maps.util.dom.replaceClass(this.elem, oldClassName, newClassName);
    return this;
  },

  /**
   * @param {String} name 토글할 스타일 클래스 이름
   * @returns {olleh.maps.Element} 자기 자신.
   */
  toggleClass: function (name) {
    olleh.maps.util.dom.toggleClass(this.elem, name);
    return this;
  },

  /**
   * 자식 엘리먼트를 추가한다.
   * @param {olleh.maps.Element|HTMLElement} elem 추가할 자식 엘리먼트.
   * @returns {olleh.maps.Element} 자기 자신.
   */
  appendChild: function (elem) {
    this.elem.appendChild(elem.elem || elem);
    return this;
  },

  /**
   * 자식 엘리먼트를 제거한다.
   * @param {olleh.maps.Element|HTMLElement} elem 제거할 자식 엘리먼트.
   * @returns {olleh.maps.Element} 자기 자신.
   */
  removeChild: function (elem) {
    this.elem.removeChild(elem.elem || elem);
    return this;
  },
  
  /**
   * 명시된 HTML 엘리먼트를 첫번째 child로 추가한다.
   * @param {olleh.maps.Element|HTMLElement} elem 추가할 HTML 앨리먼트 노드
   * @returns {Boolean} 명시된 엘리먼트(elm)가 성공적으로 추가되었으면
   * true를 반환한다.
   */
  pushElement: function (elem) {
    return olleh.maps.util.dom.pushElement(this.elem, elem.elem || elem);
  },

  /**
   * Child노드들 중 첫번째 child노드를 제거하고 제거된 노드를 반환한다.
   * @param {olleh.maps.Element|HTMLElement} elem 삭제할 DOM 앨리먼트
   * @returns {HTMLElement}
   */
  popElement: function (elem) {
    return olleh.maps.util.dom.popElement(this.elem, elem.elem || elem);
  },

  /**
   * HTML 엘리먼트의 현재 CSS 스타일을 리턴한다. 리플로우를 유발하므로 많은 오버헤드가 걸린다.
   * @param {String} name 스타일 이름.
   * @returns {String} 현재 스타일 값.
   */
  getComputedStyle: function (name) {
    return olleh.maps.util.dom.getComputedStyle(this.elem, name);
  },

  /**
   * 강제로 리플로우를 유발한다. 많은 오버헤드가 걸린다.
   * @returns {olleh.maps.Element} 자기 자신.
   */
  forceReflow: function () {
    var _ = this.elem.clientWidth;
    return this;
  },

  /**
   * HTML 엘리먼트에 이벤트 리스너를 추가한다.
   * @param {String} type 이벤트 이름.
   * @param {Function} fn 이벤트 리스너 함수.
   * @returns {olleh.maps.Element} 자기 자신.
   */
  addEventListener: function (type, fn) {
    var elem = this.elem;
    if (elem.addEventListener) {
      elem.addEventListener(type, fn, false);
    } else if (elem.attachEvent) {
      elem.attachEvent('on' + type, fn);
    } else {
      elem['on' + type] = fn;
    }
    return this;
  },

  /**
   * HTML 엘리먼트에서 이벤트 리스너를 제거한다.
   * @param {String} type 이벤트 이름.
   * @param {Function} fn 제거할 이벤트 리스너 함수.
   * @returns {olleh.maps.Element} 자기 자신.
   */
  removeEventListener: function (type, fn) {
    var elem = this.elem;
    if (elem.removeEventListener) {
      elem.removeEventListener(type, fn, false);
    } else if (elem.detachEvent) {
      elem.detachEvent('on' + type, fn);
    } else {
      elem['on' + type] = null;
    }
    return this;
  }
});
/**
 * <code>backgroundSize</code> CSS 속성을 지원하지 않는 브라우저(IE 8 이하)에서도
 * 별도 처리 없이 스케일된 이미지 스프라이트를 사용할 수 있도록 하는 유틸리티 클래스.<br/>
 * 
 * 최신 브라우저에서는 <code>backgroundImage</code>, <code>backgroundPosition</code>,
 * <code>backgroundSize</code> 속성을 통해 스케일된 이미지 스프라이트를 간단하게 사용할 수 있다.
 * 그러나 <code>backgroundSize</code>가 없는 브라우저에서는
 * 크기를 가지며 <code>overflow:hidden</code>인 상위 <code>div</code>를 만들고
 * 그 하위에 <code>img</code> 엘리먼트를 생성하여 이 엘리먼트의 <code>src</code> 속성으로
 * <code>backgroundImage</code>를, 위치(<code>left</code>/<code>top</code>)로
 * <code>backgroundPosition</code>을, 크기(<code>width</code>/<code>height</code>)로
 * <code>backgroundSize</code>를 대체하는 방식으로 구현하여야 한다.<br/>
 * 
 * 이 클래스를 사용하면 이와 같은 작업이 내부적으로 처리되며,
 * 스프라이트된 이미지와 그렇지 않은 이미지 또한 구분 없이 사용할 수 있다.
 */
$class('olleh.maps.SpritedImage').extend(olleh.maps.Element).define({
  
  /**
   * 생성자. 객체 생성시 <code>div</code> 엘리먼트가 생성된다. 만약 브라우저가
   * <code>backgroundSize</code>를 지원하지 않는다면 <code>div</code> 하위에
   * <code>img</code> 엘리먼트가 추가로 생성된다.  
   */
  SpritedImage: function () {
    this.elem = document.createElement('div');
    this.setStyles({
      position: 'absolute',
      backgroundColor: 'transparent',
      backgroundRepeat: 'no-repeat'
    });
    if (!olleh.maps.browser.style.backgroundSize) {
      this.setStyle('overflow', 'hidden');
      this._img = olleh.maps.Element.create('img').setStyle('position', 'absolute');
      this.appendChild(this._img);
    }
  },
  
  /**
   * 이미지를 변경한다. 이 메소드가 호출되더라도 <code>div</code> 자체의 크기는 설정되지 않는다.
   * @param {String} url 이미지 URL.
   * @param {olleh.maps.Point} [origin] 이미지 스프라이트 사용시 스프라이트될 위치. 
   * @param {olleh.maps.Size} [scaledSize] 스케일된 이미지 스프라이트 사용시 변경할 크기.
   * @returns {olleh.maps.SpritedImage} 자기 자신.
   */
  setImage: function (url, origin, scaledSize) {
    if (this._img) {
      this._img.setStyles({
        left: origin ? -origin.x + 'px' : '0',
        top: origin ? -origin.y + 'px' : '0',
        width: scaledSize ? scaledSize.width + scaledSize.unit : origin ? '' : '100%',
        height: scaledSize ? scaledSize.height + scaledSize.unit : origin ? '' : '100%'
      }).setProperty('src', url);
    } else {
      this.setStyles({
        backgroundImage: 'url(' + url + ')',
        backgroundPosition: origin ? -origin.x + 'px ' + -origin.y + 'px' : '',
        backgroundSize: scaledSize ? scaledSize.toCSSString() : origin ? 'auto' : '100% 100%'
      });
    }
    return this;
  }
  
});/**
 * 타이밍 함수를 나타내는 클래스.
 * 애니메이션 효과에서 특정 시간 t에서의 속성값 x를 구하는 함수를 나타낸다.
 * t와 x는 모두 0~1 사이의 값을 갖는다. 
 */
$class('olleh.maps.fx.timing.Timing').define({
  
  /**
   * 이 클래스는 직접 생성할 수 없다.
   */
  Timing: function () {
    if (this.$classname === 'olleh.maps.fx.timing.Timing') {
      throw new TypeError('Cannot instantiate olleh.maps.fx.timing.Timing directly.');
    }
  },
  
  /**
   * CSS3 transition의 타이밍 함수로 표현되는 문자열을 리턴한다.
   * null을 리턴할 경우 CSS3 transition으로는 나타낼 수 없는 타이밍 함수임을 의미한다.
   * @returns {String}
   */
  getCSSName: function () {
    return null;
  },
  
  /**
   * CSS3 transition에서 반대 방향에 대한 타이밍 함수로 표현되는 문자열을 리턴한다.
   * 직선 y=x에 대칭한 형태를 띄게 된다. 
   * @returns {String}
   */
  getBackwardCSSName: function () {
    return null;
  },

  /**
   * 파라메터로 t를 받아 x를 리턴하는 타이밍 함수를 리턴한다.  
   * @returns {Function} 타이밍 함수.
   */
  getFn: function () {
    if (!this._fn) {
      this._fn = this.genFn();
    }
    return this._fn;
  },

  /**
   * 파라메터로 t를 받아 x를 리턴하는 타이밍 함수를 생성한다. 하위클래스는 반드시 이 함수를 오버라이드해야 한다.
   * @private  
   * @returns {Function} 타이밍 함수.
   */
  genFn: function () {
    return null;
  }
  
});
/**
 * y=x인 선형 효과에 대한 타이밍 클래스.
 */
$class('olleh.maps.fx.timing.Linear').extend(olleh.maps.fx.timing.Timing).define({
  
  /**
   * @returns {String}
   */
  getCSSName: function () {
    return 'linear';
  },
  
  /**
   * @returns {String}
   */
  getBackwardCSSName: function () {
    return this.getCSSName();
  },
  
  /**
   * @private
   * @returns {Function}
   */
  genFn: function () {
    return function(t) {
      return t;
    };
  }
  
});
/**
 * 3차 베지어 곡선의 선형을 따르는 타이밍 클래스.
 */
$class('olleh.maps.fx.timing.CubicBezier').extend(olleh.maps.fx.timing.Timing).define({
  
  /**
   * 새로운 객체를 생성한다.
   * @param {Number} x1 p1의 x좌표.
   * @param {Number} y1 p1의 y좌표.
   * @param {Number} x2 p2의 x좌표.
   * @param {Number} y2 p2의 y좌표.
   */
  CubicBezier: function (x1, y1, x2, y2) {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
  },
  
  /**
   * @returns {String}
   */
  getCSSName: function () {
    return 'cubic-bezier(' + this.x1 + ',' + this.y1 + ',' + this.x2 + ',' + this.y2 + ')';
  },
  
  /**
   * @returns {String}
   */
  getBackwardCSSName: function () {
    return 'cubic-bezier(' + (1 - this.x2) + ',' + (1 - this.y2) + ',' + (1 - this.x1) + ',' + (1 - this.y1) + ')';
  },
  
  /**
   * @private
   * @returns {Function}
   * @see http://blogs.msdn.com/b/eternalcoding/archive/2011/12/06/css3-transitions.aspx 
   */
  genFn: function () {
    var x1 = this.x1, y1 = this.y1, x2 = this.x2, y2 = this.y2;
    return function (t) {
      var i, f0, f1, f2, refinedT, refinedT2, refinedT3, x, slope;
      if (t == 0)
        return 0;
      f0 = 1 - 3 * x2 + 3 * x1;
      f1 = 3 * x2 - 6 * x1;
      f2 = 3 * x1;
      refinedT = t;
      for (i = 0; i < 5; i++) {
        refinedT2 = refinedT * refinedT;
        refinedT3 = refinedT2 * refinedT;
        x = f0 * refinedT3 + f1 * refinedT2 + f2 * refinedT;
        slope = 1.0 / (3.0 * f0 * refinedT2 + 2.0 * f1 * refinedT + f2);
        refinedT -= (x - t) * slope;
        refinedT = Math.min(1, Math.max(0, refinedT));
      }
      return 3 * Math.pow(1 - refinedT, 2) * refinedT * y1 + 3
          * (1 - refinedT) * Math.pow(refinedT, 2) * y2
          + Math.pow(refinedT, 3);
    };
  }
  
});
/**
 * 3차 베지어 곡선에 기반을 둔 타이밍 클래스. 모두 CSS3 transition으로 표현 가능하다.
 */
$class('olleh.maps.fx.timing.CubicBezierBasedTiming').extend(olleh.maps.fx.timing.Timing).define({
  
  /**
   * 이 클래스는 직접 생성할 수 없다.
   */
  CubicBezierBasedTiming: function () {
    if (this.$classname === 'olleh.maps.fx.timing.CubicBezierBasedTiming') {
      throw new TypeError('Cannot instantiate olleh.maps.fx.timing.CubicBezierBasedTiming directly.');
    }
  },

  /**
   * @returns {String}
   */
  getBackwardCSSName: function () {
    return this._curve.getBackwardCSSName();
  },

  /**
   * @returns {String}
   */
  getFn: function () {
    return this._curve.getFn();
  }
  
});
/**
 * Ease 효과에 대한 타이밍 클래스.
 */
$class('olleh.maps.fx.timing.Ease').extend(olleh.maps.fx.timing.CubicBezierBasedTiming).define({
  
  /**
   * 새로운 객체를 생성한다.
   */
  Ease: function() {
    this._curve = new olleh.maps.fx.timing.CubicBezier(0.25, 0.1, 0.25, 1);
  },
  
  /**
   * @returns {String}
   */
  getCSSName: function () {
    return 'ease';
  }
  
});
/**
 * Ease-in 효과에 대한 타이밍 클래스.
 */
$class('olleh.maps.fx.timing.EaseIn').extend(olleh.maps.fx.timing.CubicBezierBasedTiming).define({
  
  /**
   * 새로운 객체를 생성한다.
   */
  EaseIn: function() {
    this._curve = new olleh.maps.fx.timing.CubicBezier(0.42, 0, 1, 1);
  },
  
  /**
   * @returns {String}
   */
  getCSSName: function () {
    return 'ease-in';
  }
  
});

/**
 * Ease-out 효과에 대한 타이밍 클래스.
 */
$class('olleh.maps.fx.timing.EaseOut').extend(olleh.maps.fx.timing.CubicBezierBasedTiming).define({
  
  /**
   * 새로운 객체를 생성한다.
   */
  EaseOut: function() {
    this._curve = new olleh.maps.fx.timing.CubicBezier(0, 0, 0.58, 1);
  },
  
  /**
   * @returns {String}
   */
  getCSSName: function () {
    return 'ease-out';
  }
  
});
/**
 * Ease-in-out 효과에 대한 타이밍 클래스.
 */
$class('olleh.maps.fx.timing.EaseInOut').extend(olleh.maps.fx.timing.CubicBezierBasedTiming).define({
  
  /**
   * 새로운 객체를 생성한다.
   */
  EaseInOut: function() {
    this._curve = new olleh.maps.fx.timing.CubicBezier(0.42, 0, 0.58, 1);
  },
  
  /**
   * @returns {String}
   */
  getCSSName: function () {
    return 'ease-in-out';
  }
  
});
/**
 * 널리 사용되는 효과를 미리 인스턴스로 만들어둔 네임스페이스.
 */
olleh.maps.namespace('olleh.maps.fx.timing', {
  /**
   * @type {olleh.maps.fx.timing.Linear}
   */
  linear: new olleh.maps.fx.timing.Linear(),
  /**
   * @type {olleh.maps.fx.timing.Ease}
   */
  ease: new olleh.maps.fx.timing.Ease(),
  /**
   * @type {olleh.maps.fx.timing.EaseIn}
   */
  easeIn: new olleh.maps.fx.timing.EaseIn(),
  /**
   * @type {olleh.maps.fx.timing.EaseOut}
   */
  easeOut: new olleh.maps.fx.timing.EaseOut(),
  /**
   * @type {olleh.maps.fx.timing.EaseInOut}
   */
  easeInOut: new olleh.maps.fx.timing.EaseInOut()
});
///////////////////////////
//  Animation 생성 옵션  //
///////////////////////////
/**
 * {@link olleh.maps.fx.Animation} 옵션
 * @typedef olleh.maps.fx.AnimationOptions 
 * @property {Object} [from] 애니메이션이 적용될 스타일의 초기값. Key-value쌍으로 정의한다.
 *        지정하지 않을 경우 현재 스타일 값을 계산하므로 성능이 크게 저하된다.
 * @property {Object} to 변경할 스타일. Key-value쌍으로 정의한다.
 * @property {Number} [duration={@link olleh.maps.fx.Animation#DEFAULT_DURATION}] 애니메이션의 지속시간. 초 단위로 지정한다.
 * @property {olleh.maps.fx.timing.Timing} [timing={@link olleh.maps.fx.Animation#DEFAULT_TIMING}] 애니메이션의 타이밍.
 * @property {Number} [repeat=1] 애니메이션의 반복 횟수.
 *        기본값은 <code>1</code>이며, {@link olleh.maps.fx.Animation#REPEAT_FOREVER}일 경우 무한 반복한다.
 * @property {Boolean} [comeback=false] 애니메이션 종료 시점에 처음 위치로 돌아올지 여부이다.
 *        <code>true</code>일 경우 <code>duration/2</code>시간만큼 애니메이션이 적용되고 
 *        나머지 시간만큼 반대 방향으로 애니메이션이 적용되게 된다.
 * @property {Function} [callback] 콜백 함수. 지정될 경우 애니메이션 종료 후에 호출된다.
 *        애니메이션이 정상적으로 종료된 경우 <code>true</code>, {@link olleh.maps.fx.Animator#stop()}이
 *        호출되어 종료된 경우 <code>false</code>가 파라메터로 전달된다.
 * @property {Object} [ctx] 콜백 함수의 컨텍스트. 지정하지 않을 경우 해당 <code>HTMLElement</code>가 컨텍스트가 된다.
 * @property {olleh.maps.fx.Pulse|olleh.maps.fx.PulseAnimator|boolean} [pulse] 펄스 사용 여부.
 *        {@link olleh.maps.fx.Pulse}가 지정될 경우 해당 펄스를,
 *        {@link olleh.maps.fx.PulseAnimator}가 지정될 경우 해당 애니메이터의 펄스를 사용하며,
 *        <code>true</code>가 지정될 경우 새로운 펄스를 생성해 사용한다.
 *        <code>null</code> 또는 <code>false</code>가 지정될 경우 펄스 대신 CSS 트랜지션을 우선적으로 사용하되
 *        CSS 트랜지션이 사용 불가능할 경우 새로운 펄스를 생성해 사용한다.
 */

/**
 * 애니메이션을 나타내는 클래스
 */
$class('olleh.maps.fx.Animation').define({
  
  $static: {
    /**
     * @constant
     * @type Number
     */
    DEFAULT_DURATION: .3,
    
    /**
     * @constant
     * @type olleh.maps.fx.timing.Timing
     */
    DEFAULT_TIMING: olleh.maps.fx.timing.ease,
    
    /**
     * @constant
     * @type Number
     */
    REPEAT_FOREVER: -1
  },
  
  /**
   * 생성자, 명시된 opts를 사용해서 새로운 객체를 생성한다.
   * @param {olleh.maps.fx.AnimationOptions} opts 옵션.
   */
  Animation: function (opts) {
    this.from = {};
    this.to = {};
    this.duration = olleh.maps.fx.Animation.DEFAULT_DURATION;
    this.timing = olleh.maps.fx.Animation.DEFAULT_TIMING;
    this.repeat = 1;
    this.comeback = false;
    this.callback = null;
    this.ctx = null;
    this.pulse = null;
    olleh.maps.mixin(this, opts, true, ['from', 'to', 'duration', 'timing', 'repeat', 'comeback', 'callback', 'ctx', 'pulse']);
  },
  
  /**
   * 현재 효과를 한 엘리먼트에 적용하는 Animator를 생성한다.
   * 선택된 효과, 브라우저 지원 여부 등을 고려해 최적의 Animator 타입을 선택한다.
   * @param {HTMLElement} elem 애니메이션이 적용될 엘리먼트.
   * @param {olleh.maps.fx.AnimationOptions} [opts] 옵션. 지정될 경우 현재 인스턴스의 옵션을 오버라이드한다.
   * @returns {olleh.maps.fx.Animator}
   */
  newAnimator: function (elem, opts) {
    var Animator;
    
    opts = olleh.maps.mixin({
      duration: this.duration,
      timing: this.timing,
      repeat: this.repeat,
      comeback: this.comeback,
      callback: this.callback,
      ctx: this.ctx,
      pulse: this.pulse
    }, opts, true);
    
    opts.from = olleh.maps.mixin(olleh.maps.util.clone(this.from), opts.from || {}, 'remix');
    opts.to = olleh.maps.mixin(olleh.maps.util.clone(this.to), opts.to || {}, 'remix');

    if (opts.duration == 0) {
      Animator = olleh.maps.fx.NoAnimationAnimator;
    } else if (!opts.pulse && olleh.maps.browser.style.transition && opts.timing.getCSSName()) {
      Animator = olleh.maps.fx.CSSAnimator;
    } else {
      Animator = olleh.maps.fx.PulseAnimator;
    }
    
    return new Animator(elem, opts);
  },
  
  /**
   * {@link olleh.maps.fx.Animation#newAnimator()}와 유사하나
   * 애니메이터 생성 직후 {@link olleh.maps.fx.Animator#start}를 자동적으로 호출한다.
   * @param {HTMLElement} elem 애니메이션이 적용될 엘리먼트.
   * @param {olleh.maps.fx.AnimationOptions} [opts] 옵션. 지정될 경우 현재 인스턴스의 옵션을 오버라이드한다.
   * @returns {olleh.maps.fx.Animator}
   */
  animate: function (elem, opts) {
    var a = this.newAnimator(elem, opts);
    a.start();
    return a;
  },

  /**
   * {@link olleh.maps.fx.Animation#newAnimator()}와 유사하나
   * 애니메이터 생성 직후 {@link olleh.maps.fx.Animator#startSync}를 자동적으로 호출한다.
   * @param {HTMLElement} elem 애니메이션이 적용될 엘리먼트.
   * @param {olleh.maps.fx.AnimationOptions} [opts] 옵션. 지정될 경우 현재 인스턴스의 옵션을 오버라이드한다.
   * @returns {olleh.maps.fx.Animator}
   */
  animateSync: function (elem, opts) {
    var a = this.newAnimator(elem, opts);
    a.startSync();
    return a;
  },
  
  /**
   * 현재 등록된 스타일을 애니메이션 없이 엘리먼트에 즉시 적용한다.
   * @param {HTMLElement} elem 애니메이션이 적용될 엘리먼트.
   * @param {olleh.maps.fx.AnimationOptions} [opts] 옵션. 지정될 경우 현재 인스턴스의 옵션을 오버라이드한다. 단 duration은 무시된다.
   * @returns {olleh.maps.fx.Animator}
   */
  applyImmediately: function (elem, opts) {
    opts || (opts = {});
    opts.duration = 0;
    return this.animate(elem, opts);
  }
  
});
/**
 * {@link olleh.maps.fx.PulseAnimator} 애니메이터들이 각 프레임을 실행해야 할 시점을 관리하는 클래스. 
 * 다수의 엘리먼트에 일관된 애니메이션을 적용해야 하는 경우처럼
 * 여러 {@link olleh.maps.fx.Animator}가 동기화된 상태로 동작해야 할 경우 사용되며, 
 * CSS3 transition을 사용할 수 없는 경우에는 단 하나의 엘리먼트에 애니메이션을 줄 경우에도 사용된다.
 */
$class('olleh.maps.fx.Pulse').define({
  
  /**
   * 새로운 펄스를 생성한다.
   * @param {Number} period 반복 주기, 초 단위.
   */
  Pulse: function (period) {
    /**
     * 반복 주기, 초 단위.
     * @readonly
     * @type Number
     */
    this.period = period;
    
    this._jobs = [];
  },
  
  /**
   * @private
   * @param {olleh.maps.fx.PulseAnimator} fn
   */
  add: function (fn, initTime) {
    this._jobs.push(fn);
    if (this._jobs.length == 1) {
      this.start(initTime);
    }
  },

  /**
   * @private
   * @param {olleh.maps.fx.PulseAnimator} fn
   */
  remove: function (fn) {
    olleh.maps.util.removeFromArray(this._jobs, fn);
    if (this._jobs.length == 0) {
      this.stop();
    }
  },
  
  /**
   * 펄스가 실행중인지 여부를 리턴한다.
   * @returns {Boolean} 실행중일 경우 <code>true</code>, 그렇지 않을 경우 <code>false</code>.
   */
  isPlaying: function () {
    return !!this._af;
  },

  /**
   * 펄스를 시작한다.
   */
  start: function (initTime) {
    if (!this._af) {
      this.startTime = olleh.maps.fx.now();
      if (initTime) {
        this.startTime -= initTime * 1000;
      }
      this._af = olleh.maps.util.deferAF(this._step, this);
    }
  },

  /**
   * 펄스를 멈춘다.
   */
  stop: function () {
    if (this._af) {
      window.cancelAnimationFrame(this._af);
      this._af = null;
    }
  },
  
  /**
   * @private
   * @param {Number} time
   */
  _step: function (time) {
    var i, playTime;

    if (this._jobs.length == 0) {
      this.stop();
      return;
    }

    this._af = olleh.maps.util.deferAF(this._step, this);
    
    // See #2718
    if (!olleh.maps.fx.useAFTime) {
      time = olleh.maps.fx.now();
    }

    playTime = (time - this.startTime) / 1000;
    
    // 현재 사이클의 마지막 프레임
    if (playTime >= this.period) {
      playTime = this.period;
      this.startTime = time;
    }

    for (i = this._jobs.length - 1; i >= 0; i--) {
      this._jobs[i](playTime);
    }
  }
  
});
/**
 * 여러 애니메이션이 한 <code>setTimeout</code> 틱에 동시에 시작되도록 하기 위해 사용되는 애니메이터 버퍼 클래스.
 * 시스템 내부에서 사용되는 클래스이므로 사용자가 직접 다뤄서는 안 된다.
 */
$class('olleh.maps.fx.AnimatorBuffer').define({

  /**
   * 애니메이터 버퍼를 생성한다.
   * @private
   */
  AnimatorBuffer: function () {
    this._animators = [];
    this._timer = null;
  },
  
  /**
   * 버퍼에 애니메이터를 추가한다.
   * 다음 <code>setTimeout</code> 틱에 {@link olleh.maps.fx.AnimatorBuffer#flush}가 호출된다.
   * @param {olleh.maps.fx.Animator} animator
   */
  add: function (animator) {
    this._animators.push(animator);
    if (!this._timer) {
      this._timer = olleh.maps.util.defer(this.flush, this);
    }
  },
  
  /**
   * 버퍼를 비우고 버퍼의 모든 애니메이터의 {@link olleh.maps.fx.Animator#startSync}를 호출한다.
   */
  flush: function () {
    var i, l;
    for (i = 0, l = this._animators.length; i < l; i++) {
      this._animators[i].startSync();
    }
    this._animators = [];
    if (this._timer) {
      window.clearTimeout(this._timer);
      this._timer = null;
    }
  }
  
});
/**
 * 애니메이터 클래스. 하나의 HTML 엘리먼트에 애니메이션 효과를 주는 역할을 한다.
 * {@link olleh.maps.fx.Animation} 객체를 통해 생성되며, 사용자가 직접 생성해서는 안 된다.
 */
$class('olleh.maps.fx.Animator').define({

  /**
   * 생성자. 사용자가 직접 호출해서는 안 된다.
   * @private
   * @param {olleh.maps.Element|HTMLElement} elem 애니메이션이 적용될 HTML 엘리먼트.
   * @param {olleh.maps.fx.AnimationOptions} opts 애니메이션 옵션.
   */
  Animator: function (elem, opts) {
    /**
     * 애니메이션이 적용될 HTML 엘리먼트.
     * @readonly
     * @type olleh.maps.Element
     */
    this.element = elem instanceof olleh.maps.Element ? elem : new olleh.maps.Element(elem);

    olleh.maps.mixin(this, opts || {}, true, ['from', 'to', 'duration', 'timing', 'repeat', 'comeback', 'callback', 'ctx', 'pulse']);

    /**
     * 애니메이터의 상태. <code>ready</code>, <code>started</code>, <code>paused</code>, <code>finished</code> 중 하나의 값을 갖는다.
     * @readonly
     * @type String
     */
    this.status = 'ready';
  },

  /**
   * 애니메이션을 시작한다. 애니메이션 효과는 즉시 시작되지 않으며
   * 현재 콜스택이 종료된 후에 시작된다.
   * 이후 duration만큼의 시간이 지나면 애니메이션이 종료되고
   * 스타일이 애니메이션의 최종 상태(t=1)로 설정되며 콜백이 불린다.
   */
  start: function () {
    if (this.status !== 'ready') {
      return;
    }
    if (this.duration == 0) {
      this.startSync();
    } else {
      olleh.maps.fx.animatorBuffer.add(this);
    }
  },

  /**
   * {@link olleh.maps.fx.Animator#start}와 유사하나 애니메이션을 즉시 시작한다.
   * 특별한 이유가 없을 경우에는 사용해서는 안 된다.
   */
  startSync: function () {
    var k;

    if (this.status !== 'ready') {
      return;
    }
    
    if (this.comeback) {
      for (k in this.to) {
        if (this.to[k] == undefined || !this.to.hasOwnProperty(k)) {
          continue;
        }
        if (!this.from[k]) {
          this.from[k] = this.element.getComputedStyle(k);
          olleh.maps.log.info('Initial style "' + k + '" is not defined; can cause performance issue', this);
        }
      }
    }
    
    this.status = 'started';
    this.doInit();
    this.doCycle();
  },

  /**
   * 애니메이션을 중지한다. 즉시 애니메이션이 종료되고
   * 스타일이 애니메이션의 최종 상태(t=1)로 설정되며 콜백이 불린다.
   */
  stop: function () {
    if (this.status === 'finished') {
      return;
    }
    
    if (this.status === 'ready') {
      this.element.setStyles(this.to);
    } else {
      this.doStop();
      this.doClean();
    }
    
    this.status = 'finished';
    
    if (this.callback) {
      this.callback.call(this.ctx || this.element.elem, false);
    }
  },
  
  /**
   * 반복이 설정된 애니메이션을 현재 사이클이 완료되면 중지하도록 설정한다.
   */
  stopRepeat: function () {
    if (this.status === 'finished') {
      return;
    }
    this.repeat = false;
  },

  /**
   * 진행중인 애니메이션을 일시정지한다. 현재 시점의 스타일이 엘리먼트의 스타일로 반영된다.
   * @returns {Object} 현재 엘리먼트의 스타일을 key-value 쌍으로 나타낸 객체.
   */
  pause: function () {
    if (this.status !== 'started') {
      return;
    }
    this.status = 'paused';
    return this.doPause();
  },

  /**
   * 일시정지된 애니메이션을 재시작한다.
   */
  resume: function () {
    if (this.status !== 'paused') {
      return;
    }
    this.status = 'started';
    this.doResume();
  },
  
  /**
   * 진행중인 애니메이션을 리셋해 엘리먼트의 스타일을 초기 상태로 되돌린다.
   * 콜백은 호출되지 않는다.
   */
  cancel: function () {
    if (this.status === 'ready') {
      this.status = 'finished';
      return;
    }
    if (this.status === 'finished') {
      return;
    }
    this.status = 'finished';
    this.doCancel();
    this.doClean();
    // 콜백은 불리지 않음
  },

  /**
   * 진행중인 애니메이션을 현재 상태에서 종료한다. 현재 시점의 스타일이 엘리먼트의 스타일로 반영된다.
   * 콜백은 호출되지 않는다.
   * @returns {Object} 현재 엘리먼트의 스타일을 key-value 쌍으로 나타낸 객체.
   */
  abort: function () {
    if (this.status !== 'finished') {
      this.status = 'finished';
    }
    return this.doPause();
  },
  
  /**
   * 현재 진행중인 애니메이션을 무시한다. abort()에 비해 적은 오버헤드가 발생한다.
   * 애니메이션 효과는 계속 진행될 수도 있고 현재 상태에서 멈출 수도 있다. 콜백은 호출되지 않는다.
   * 엘리먼트의 애니메이션이 진행중인 스타일을 변경하여 새로운 애니메이션 효과를 내고자 할 때 사용된다.
   * @returns {Object} 현재 엘리먼트의 스타일을 key-value 쌍으로 나타낸 객체.
   */
  ignore: function () {
    if (this.status !== 'finished') {
      this.status = 'finished';
    }
    return this.doIgnore();
  },
  
  /**
   * @returns {Boolean} 애니메이션의 최종 종료 여부.
   */
  finishCycle: function () {
    if (this.repeat === -1 && this.duration > 0) {
      this.doCycle();
    } else if (this.repeat > 1) {
      this.repeat--;
      this.doCycle();
    } else {
      this.doClean();
      this.status = 'finished';
    }
    
    if (this.callback) {
      this.callback.call(this.ctx || this.element.elem, true);
    }
  }

});
/**
 * 애니메이션 효과 없이 목표 스타일을 즉시 적용하는 {@link olleh.maps.fx.Animator} 구현체.
 * 사용자가 직접 생성해서는 안 된다. 
 */
$class('olleh.maps.fx.NoAnimationAnimator').extend(olleh.maps.fx.Animator).define({

  /**
   * @private
   */
  doInit: function () {
  },

  /**
   * @private
   */
  doCycle: function () {
    if (!this.comeback) {
      this.element.setStyles(this.to);
    }
    this.finishCycle();
  },

  /**
   * @private
   */
  doClean: function () {
  },

  /**
   * @private
   * @returns {Object}
   */
  doPause: function () {
    return this.to;
  },

  /**
   * @private
   */
  doResume: function () {
  },

  /**
   * @private
   */
  doCancel: function () {
  },

  /**
   * @private
   * @returns {Object}
   */
  doIgnore: function () {
    return this.to;
  }
  
});
/**
 * CSS3 transition을 통해 애니메이션을 적용하는 {@link olleh.maps.fx.Animator} 구현체.
 * 사용자가 직접 생성해서는 안 된다.
 */
$class('olleh.maps.fx.CSSAnimator').extend(olleh.maps.fx.Animator).define({

  /**
   * 생성자. 사용자가 직접 호출해서는 안 된다.
   * @private
   * @param {HTMLElement} elem 애니메이션이 적용될 HTML 엘리먼트.
   * @param {olleh.maps.fx.AnimationOptions} opts 애니메이션 옵션.
   */
  CSSAnimator: function (elem, opts) {
    var browser = olleh.maps.browser;

    this._styleName = browser.style.transition;
    this._eventType = browser.event.transitionend;
    this._bound_onTransitionend = this._onTransitionend.bind(this);
    this._isForward = true;
  },

  /**
   * @private
   */
  doInit: function () {
  },

  /**
   * @private
   */
  doClean: function () {
    if (this._listening) {
      this.element.setStyle(this._styleName, '');
      this.element.removeEventListener(this._eventType, this._bound_onTransitionend);
      this._listening = false;
    }
    this._clearEventFallback();
  },

  /**
   * @private
   */
  doCycle: function () {
    // 일시정지의 구현을 위해서 진행시간을 측정한다.
    // 그러나 CSS 트랜지션 사용시에는 완벽한 일시정지가 불가능하며 재시작시 무조건 t = 0이 된다.
    // 예를 들어 t = 0.7인 시점에 일시정지 후 재시작이 되었을 경우
    // 0.3만큼의 시간동안 t = 0.7 -> 1의 애니메이션이 적용되어야 정상이나
    // CSS 트랜지션 사용시 0.3만큼의 시간동안 t = 0 -> 1의 애니메이션이 적용된다.
    this._startTimestamp = +Date.now();
    this._playedTimestamp = 0;
    this._receivedEvent = 0;

    this._startTransition(this.comeback ? this.duration / 2 : this.duration);
  },

  /**
   * @private
   */
  doStop: function () {
    var k;
    if (this.comeback && this._isForward) {
      for (k in this.to) {
        this.element.setStyle(k, this.from[k]);
      }
    }
  },

  /**
   * @private
   * @returns {Object}
   */
  doPause: function () {
    var k, styles;
    
    if (!this._pausedStyles) {
      olleh.maps.log.info('CSS animator paused; can cause performance issue', this);
      
      styles = {};
      for (k in this.to) {
        styles[k] = this.element.getComputedStyle(k);
        this.element.setStyle(k, styles[k]);
      }
      
      this.doClean();
      this._playedTimestamp += +Date.now() - this._startTimestamp;
      this._pausedStyles = styles;
    }
    
    this._clearEventFallback();
    
    return this._pausedStyles;
  },

  /**
   * @private
   */
  doResume: function () {
    this._pausedStyles = null;
    this._startTimestamp = +Date.now();
    this._startTransition(((this.comeback ? this.duration / 2 : this.duration) - this._playedTimestamp / 1000));
  },

  /**
   * @private
   */
  doCancel: function () {
    var k;
    for (k in this.to) {
      this.element.setStyle(k, this.from[k]);
    }
  },

  /**
   * @private
   * @returns {Object}
   */
  doIgnore: function () {
    if (this._listening) {
      this.element.removeEventListener(this._eventType, this._bound_onTransitionend);
      this._listening = false;
    }
    this._clearEventFallback();
    return this[this._isForward ? 'to' : 'from'];
  },

  /**
   * @private
   * @param {Number} duration
   */
  _startTransition: function (duration) {
    var k, a = [];
    var styles = this[this._isForward ? 'to' : 'from'];
    var timing = this._isForward ? this.timing.getCSSName() : this.timing.getBackwardCSSName();
    var camelCaseToHyphen = olleh.maps.util.dom.camelCaseToHyphen;
    var browserStyle = olleh.maps.browser.style;
    
    // 실제로 변경되는 스타일의 수
    // 이 수만큼의 transitionend 이벤트가 들어와야 애니메이션이 끝났다고 볼 수 있음
    this._styleCount = 0;
    
    for (k in this.to) {
      if (styles[k] != this.element.getStyle(k)) {
        a.push(camelCaseToHyphen(browserStyle[k] ? browserStyle[k] : k) + ' ' + duration + 's ' + timing);
        this._styleCount++;
      }
    }
    
    if (this._styleCount > 0) {
      this.element.addEventListener(this._eventType, this._bound_onTransitionend);
      this.element.setStyle(this._styleName, a.join(','));
      this.element.setStyles(styles);
      this._listening = true;
    }
    
    // 화면에 나타나고 있지 않는 엘리먼트 등의 경우 브라우저에서 트랜지션을
    // 적용하지 않도록 최적화할 수 있으며, 이 경우에는 transitionend 이벤트가
    // 발생하지 않아 _finish()가 불리지 않는다. _styleCount가 잘못 계산된
    // 경우도 마찬가지로 _finish()가 불리지 않는다. 이러한 상황을 대비해
    // duration + 0.1초 후에 무조건 _finish()를 부르도록 설정한다.
    this._eventFallback = olleh.maps.util.delay(this._finish, duration * 1000 + 100, this);
  },

  /**
   * @private
   * @param {Event} event
   */
  _onTransitionend: function (event) {
    if (event.target == this.element.elem) {
      event.stopPropagation();
      this._receivedEvent++;
      if (this._receivedEvent == this._styleCount) {
        this._finish();
      }
    }
  },

  /**
   * @private
   */
  _clearEventFallback: function () {
    if (this._eventFallback) {
      window.clearTimeout(this._eventFallback);
      this._eventFallback = null;
    }
  },
  
  /**
   * @private
   */
  _finish: function () {
    this._clearEventFallback();
    if (this.comeback && this._isForward) {
      this._isForward = false;
      this.doCycle();
    } else {
      this._isForward = true;
      this.finishCycle();
    }
  }

});
/**
 * {@link olleh.maps.fx.Pulse}를 통해 애니메이션을 적용하는 {@link olleh.maps.fx.Animator} 구현체.
 * 사용자가 직접 생성해서는 안 된다.
 */
$class('olleh.maps.fx.PulseAnimator').extend(olleh.maps.fx.Animator).define({

  /**
   * 생성자. 사용자가 직접 호출해서는 안 된다.
   * @private
   * @param {HTMLElement} elem 애니메이션이 적용될 HTML 엘리먼트.
   * @param {olleh.maps.fx.AnimationOptions} opts 애니메이션 옵션.
   */
  PulseAnimator: function (elem, opts) {
    var fn = this.timing.getFn(), pulse = this.pulse;
    
    if (this.comeback) {
      this._fn = function (t) {
        return fn((t > .5 ? 1 - t : t) * 2);
      };
    } else {
      this._fn = fn;
    }
    
    if (pulse && pulse.getPulse) {
      this._pulse = pulse.getPulse();
    } else if (pulse && pulse.add) {
      this._pulse = pulse;
    } else {
      this._pulse = new olleh.maps.fx.Pulse(this.duration);
    }
    
    this._lastStyle = this.from;
  },
  
  /**
   * 애니메이터에 펄스를 설정한다.
   * @param {olleh.maps.fx.Pulse} pulse
   */
  setPulse: function (pulse) {
    if (this._attached) {
      this._pulse.remove(this);
      pulse.add(this);
    }
    this._pulse = pulse;
  },

  /**
   * 애니메이터에 설정된 펄스를 리턴한다.
   * @returns {olleh.maps.fx.Pulse}
   */
  getPulse: function () {
    return this._pulse;
  },

  /**
   * @private
   */
  doInit: function() {
    var k, from, to;
    var parseStyleValue = olleh.maps.util.dom.parseStyleValue;

    this._bound_step = this.step.bind(this);
    this._from = {};
    this._to = {};
    
    for (k in this.to) {
      if (this.to[k] == undefined || !this.to.hasOwnProperty(k)) {
        continue;
      }
      
      if (this.from[k]) {
        from = parseStyleValue(this.from[k]);
      } else {
        olleh.maps.log.info('Initial style "' + k + '" is not defined; can cause performance issue', this);
        from = parseStyleValue(this.element.getComputedStyle(k));
      }
      
      to = parseStyleValue(this.to[k]);
      
      this._from[k] = from;
      this._to[k] = to;
    }
  },
  
  /**
   * @private
   */
  doClean: function () {
    this._detachPulse();
  },

  /**
   * @private
   */
  doCycle: function () {
    this._attachPulse();
  },

  /**
   * @private
   */
  doStop: function () {
    this._applyStyle(1);
  },
  
  /**
   * @private
   * @returns {Object}
   */
  doPause: function () {
    this._detachPulse();
    return this._lastStyle;
  },

  /**
   * @private
   */
  doResume: function () {
    this._attachPulse();
  },

  /**
   * @private
   */
  doCancel: function () {
    var k;
    for (k in this.to) {
      this.element.setStyle(k, this.from[k]);
    }
  },

  /**
   * @private
   * @returns {Object}
   */
  doIgnore: function () {
    this._detachPulse();
    return this._lastStyle;
  },

  /**
   * @private
   */
  _attachPulse: function () {
    if (!this._attached) {
      if (this.duration > this._pulse.period) {
        throw new RangeError('Animator duration must be greater than period: ' + this.duration + ', ' + this._pulse.period);
      }
      this._pulse.add(this._bound_step, this._lastTime);
      this._attached = true;
    }
  },

  /**
   * @private
   */
  _detachPulse: function () {
    if (this._attached) {
      this._pulse.remove(this._bound_step);
      this._attached = false;
    }
  },

  /**
   * @private
   * @param {Number} t
   */
  _applyStyle: function (t) {
    var k, i, j, l, ll, result, params, from, to, fromOpt, toOpt, fromParam, toParam, value, percent = this._fn(t);
    var parsedStyleToString = olleh.maps.util.dom.parsedStyleToString;

    this._lastStyle = {};
    
    for (k in this._to) {
      result = [];
      from = this._from[k];
      to = this._to[k];
      
      for (i = 0, l = to.length; i < l; i++) {
        fromOpt = from[i];
        toOpt = to[i];
        
        if (toOpt.name) {
          params = [];
          
          for (j = 0, ll = toOpt.params.length; j < ll; j++) {
            fromParam = fromOpt && fromOpt.name ? fromOpt.params[j].value : 0;
            toParam = toOpt.params[j];
            value = fromParam + (toParam.value - fromParam) * percent;
            params.push({
              unit: toParam.unit,
              value: toParam.unit === 'px' ? Math.ceil(value) : value
            });
          }

          result.push({
            name: toOpt.name,
            params: params
          });
        } else {
          value = fromOpt.value + (toOpt.value - fromOpt.value) * percent;
          result.push({
            unit: toOpt.unit,
            value: toOpt.unit === 'px' ? Math.ceil(value) : value
          });
        }
      }
      
      this._lastStyle[k] = parsedStyleToString(result);
      this.element.setStyle(k, this._lastStyle[k]);
    }
  },
  
  /**
   * @private
   * @param {Number} playTime
   * @returns {Boolean}
   */
  step: function (playTime) {
    if (!this._attached) {
      return;
    }
    
    this._applyStyle(playTime / this.duration);
    
    this._lastTime = playTime;

    if (playTime == this._pulse.period) {
      this.finishCycle();
    }
  }
  
});
/**
 * 여러 작업이 존재하는 큐에서 한 <code>requestAnimationFrame</code> 틱에 하나의 작업만이 실행되도록 하기 위해 사용되는 클래스.
 * 렌더링과 관련된 작업을 할 때 프리징 현상을 방지하기 위해 사용한다.
 */
$class('olleh.maps.fx.AnimationFrameQueue').define({

  /**
   * 새로운 큐를 생성한다.
   */
  AnimationFrameQueue: function () {
    this._jobs = [];
    this._enabled = false;
  },
  
  /**
   * 큐가 활성화된 상태인지를 리턴한다.
   * @returns {Boolean} 활성화 상태일 경우 <code>true</code>, 그렇지 않을 경우 <code>false</code>.
   */
  isEnabled: function () {
    return this._enabled;
  },
  
  /**
   * 큐를 활성화하거나 비활성화한다.
   * 큐가 비활성화되면 큐에 들어오는 작업들이 <code>requestAnimationFrame</code> 틱을 기다리지 않고 즉시 실행된다.
   * 큐에 작업이 남아있는 상태에서 비활성화되면 즉시 {@link olleh.maps.fx.AnimationFrameQueue#flush}가 호출된다.
   * @param {Boolean} enabled <code>true</code>로 설정할 경우 활성화, 그렇지 않을 경우 비활성화된다.
   */
  setEnabled: function (enabled) {
    if (enabled) {
      this.start();
    } else {
      this.flush();
    }
    this._enabled = enabled;
  },
  
  /**
   * 큐에 존재하는 모든 작업을 즉시 실행한다.
   */
  flush: function () {
    var job, jobs = this._jobs;
    this.stop();
    while (jobs.length) {
      job = jobs.shift();
      job.fn.apply(job.ctx);
    }
  },
  
  /**
   * 큐에 남아있는 모든 작업을 버린다.
   */
  clear: function () {
    this.stop();
    this._jobs.length = 0;
  },
  
  /**
   * 큐에 새로운 작업을 추가한다.
   * @param {Function} fn 작업에 대한 함수.
   * @param {Object} ctx 함수가 실행될 때의 컨텍스트.
   */
  push: function (fn, ctx) {
    if (this._enabled) {
      this._jobs.push({
        fn: fn,
        ctx: ctx
      });
      this.start();
    } else {
      fn.apply(ctx);
    }
  },

  /**
   * @private
   */
  start: function () {
    if (!this._af && this._jobs.length > 0) {
      this._af = olleh.maps.util.deferAF(this._step, this);
    }
  },

  /**
   * @private
   */
  stop: function () {
    if (this._af) {
      window.cancelAnimationFrame(this._af);
      this._af = null;
    }
  },
  
  /**
   * @private
   */
  _step: function () {
    var job, jobs = this._jobs;
    
    if (jobs.length == 0) {
      this.stop();
      return;
    }
    
    this._af = olleh.maps.util.deferAF(this._step, this);
    
    job = jobs.shift();
    job.fn.apply(job.ctx);
  }
  
});
/**
 * FX 네임스페이스.
 * @private
 */
olleh.maps.namespace('olleh.maps.fx', {
  /**
   * 애니메이터 버퍼
   * @private
   * @type olleh.maps.fx.AnimatorBuffer
   */
  animatorBuffer: new olleh.maps.fx.AnimatorBuffer(),
  
  /**
   * @private
   * @returns {Number}
   */
  now: function () {
    return +Date.now();
  },
  
  /**
   * @private
   * @type {Boolean}
   */
  useAFTime: false

});

// See #2718
(function () {
  if (window.performance && window.performance.now) {
    olleh.maps.fx.now = function () {
      return window.performance.now();
    };
    olleh.maps.util.deferAF(function (time) {
      olleh.maps.fx.useAFTime = time && time > 1e12 && olleh.maps.fx.now() > 1e12;
    });
  }
})();/**
 * KT맵에서는 자체정의된 이벤트 시스템을 사용한다.
 * KT맵에서 제공하는 컴포넌트로 부터 발생되는 다양한
 * 이벤트는 <code>olleh.maps.event.Event</code> 객체를 나타낸다.<p/>
 * 이벤트를 받는 클래스는 {@link olleh.maps.event.EventDelegator}를 mixin하고 있다.
 * <p/>
 * <h3>KT맵이 제공하는 이벤트</h3>
 * 일반적으로 이벤트 객체를 직접 생성하지는 않는다.
 * {@link olleh.maps.event.EventManager}에서 브라우저 이벤트를 받아서 hit target에게 전달하거나,
 * {@link olleh.maps.event.Recognizer}에서 이벤트를 추적해서 이벤트를 생성하는 경우이다.
 * <p/>
 * <h5>공통 브라우저 이벤트</h5>
 * <ul>
 *   <li>{@link olleh.maps.event.EventDelegator#event:keydown|keydown}</li>
 *   <li>{@link olleh.maps.event.EventDelegator#event:keyup|keyup}</li>
 *   <li>{@link olleh.maps.event.EventDelegator#event:keypress|keypress}</li>
 *   <li>{@link olleh.maps.event.EventDelegator#event:click|click}</li>
 *   <li>{@link olleh.maps.Map#event:resize|resize}</li>
 * </ul>
 * <h5>데스크탑 브라우저 이벤트</h5>
 * <ul>
 *   <li>{@link olleh.maps.event.EventDelegator#event:mousedown|mousedown}</li>
 *   <li>{@link olleh.maps.event.EventDelegator#event:mousemove|mousemove}</li>
 *   <li>{@link olleh.maps.event.EventDelegator#event:mouseup|mouseup}</li>
 *   <li>{@link olleh.maps.event.EventDelegator#event:mouseover|mouseover}</li>
 *   <li>{@link olleh.maps.event.EventDelegator#event:mouseout|mouseout}</li>
 *   <li>{@link olleh.maps.event.EventDelegator#event:mousewheel|mousewheel}</li>
 *   <li>{@link olleh.maps.event.EventDelegator#event:rightclick|rightclick}</li>
 *   <li>{@link olleh.maps.event.EventDelegator#event:dblclick|dblclick}</li>
 * </ul>
 * <h5>모바일 브라우저 이벤트</h5>
 * <ul>
 *   <li>{@link olleh.maps.event.EventDelegator#event:touchstart|touchstart}</li>
 *   <li>{@link olleh.maps.event.EventDelegator#event:touchmove|touchmove}</li>
 *   <li>{@link olleh.maps.event.EventDelegator#event:touchend|touchend}</li>
 *   <li>{@link olleh.maps.event.EventDelegator#event:touchcancel|touchcancel}</li>
 * </ul>
 * <h5>이벤트를 추적해서 생성된 이벤트</h5>
 * <ul>
 *   <li>{@link olleh.maps.event.EventDelegator#event:dragstart|dragstart}</li>
 *   <li>{@link olleh.maps.event.EventDelegator#event:drag|drag}</li>
 *   <li>{@link olleh.maps.event.EventDelegator#event:dragend|dragend}</li>
 *   <li>{@link olleh.maps.event.EventDelegator#event:pinchstart|pinchstart}</li>
 *   <li>{@link olleh.maps.event.EventDelegator#event:pinch|pinch}</li>
 *   <li>{@link olleh.maps.event.EventDelegator#event:pinchend|pinchend}</li>
 * </ul>
 * <h3>사용자 정의 이벤트</h3>
 * KT맵에서 제공하는 이벤트이외에 직접 이벤트를 정의해서 생성할 수 있다.
 * 생성한 이벤트는 {@link olleh.maps.event.EventDelegator#fireEvent}로 전달하고, {@link olleh.maps.event.EventDelegator#onEvent}
 * 로 이벤트를 처리한다.
 * @example
 * marker.onEvent('custom', function (event, payload) {
 *   olleh.maps.log.info(payload.x);
 * });
 * ... 
 * var customEvent = new olleh.maps.event.Event('custom', marker);
 * marker.fireEvent(customEvent, {x: 1, y: 1, z:1});
 * 
 * @summary KT맵에서 사용되는 이벤트 클래스를 정의한다.
 */
$class('olleh.maps.event.Event').define({
  $static: {
    /** 
     * 이벤트의 단계중 CAPTURE단계를 나타낸다.
     * @type Number
     */
    CAPTURING_PHASE: 1,
    /** 
     * 이벤트의 단계중 TARGET단계를 나타낸다.
     * @type Number
     */
    AT_TARGET: 2,
    /** 
     * 이벤트의 단계중 BUBBLING단계를 나타낸다.
     * @type Number
     */
    BUBBLING_PHASE: 3,
    /**
     * 모든 phase를 마치고 default behavior 수행 단계를 나타낸다. 
     * @private
     * @type Number
     */
    DEFAULT_PHASE: 8
  },
  
  /**
   * 생성자, 새로운 Event 객체를 생성한다.
   * @param {String} name 이벤트 이름
   * @param {Object} src
   * @param {olleh.maps.event.EventDelegator}  src 이벤트가 발생되는 {@link olleh.maps.event.EventDelegator} 객체
   * @param {Object} [opts] 
   * @param {UIEvent} [opts.originEvent] 브라우저 이벤트 객체
   * @param {HTMLElement} [opts.targetDOM] 이벤트가 밸생한 Event DOM Element
   * @param {Array.<Touch>} [opts.touches] 현재 브라우저 화면에 Touch 배열
   * @param {Array.<Touch>} [opts.targetTouches] 현재 DOM element에 있는 Touch 배열
   * @param {Array.<Touch>} [opts.changedTouches] 현재 터치이벤트에 포함되어 있는 Touch 배열
   * @see http://dvcs.w3.org/hg/webevents/raw-file/tip/touchevents.html#idl-def-TouchEvent|w3c TouchEvent
   */
  Event: function (name, src, opts) {
    var maps = olleh.maps; 
    
    this._name = name;
    this._src = src;
    this._stopPropagation = false;
    this._stopImmediatePropagation = false;
    this._defaultPrevented = false;

    /**
     * 발생된 이벤트의 단계를 나타낸다.<p/>
     * 이벤트 단계는 각각 {@link olleh.maps.event.Event.CAPTURING_PHASE}, {@link olleh.maps.event.Event.AT_TARGET}, 
     * {@link olleh.maps.event.Event.BUBBLING_PHASE} 가 있다.
     * @type Number
     * @see http://www.w3.org/TR/DOM-Level-2-Events/events.html#Events-Event|w3c Event
     */
    this.eventPhase = 0;
    
    this.pageXY = undefined;
    this._point = undefined;
    this._coord = undefined;
    this._map = undefined;
    
    if (opts) {
      maps.mixin(this, opts, true);
      
      if (this.hasOwnProperty('touches')) { // Touch Event members
        this.targetTouches = this.targetTouches || this.touches;
        this.changedTouches = this.changedTouches || this.touches;
      }

      /**
       * 이벤트가 밸생한 Event DOM Element
       * <p />
       * {@link olleh.maps.event.EventDelegator#registerEventDom} 으로 등록한 HTMLElement 
       * @type HTMLElement
       * @name olleh.maps.event.Event#targetDOM
       * @see olleh.maps.event.EventDelegator#registerEventDom
       */
      /**
       * 브라우저 이벤트
       * <p />
       * 브라우저 이벤트가 아닌 경우 <code>undefined</code>
       * @type UIEvent
       * @name olleh.maps.event.Event#originEvent
       */
      var originEvent = opts.originEvent;
      
      if (originEvent) {
        this.timeStamp = originEvent.timeStamp || +(new Date());
        
        if (maps.isUndefined(opts.pageXY)) {
          
          var x = originEvent.pageX;
          var y = originEvent.pageY;
          
          if (x == null && originEvent.x != null) { // ie9이하
            var targetDOM = this.targetDOM ? this.targetDOM.ownerDocument || document : document;
            var doc = targetDOM.documentElement;
            var body = doc.body;
            
            x = originEvent.clientX + (doc && doc.scrollLeft || body && body.scrollLeft || 0) - 
            (doc && doc.clientLeft || body && body.clientLeft || 0);
            y = originEvent.clientY + (doc && doc.scrollTop  || body && body.scrollTop  || 0) - 
            (doc && doc.clientTop  || body && body.clientTop  || 0);
          } 
          /**
           * 이벤트가 밸생한 마우스(터치) 좌표 pageX, pageY에 해당하는 값
           * @type olleh.maps.Point
           */
          this.pageXY = new maps.Point(x || 0, y || 0);
        }
      }
    }

    if (!this.hasOwnProperty('timeStamp')) {
      /**
       * 이벤트가 밸생된 시점의 timestamp 정보<p/>
       * 브라우저 이벤트 {@link #originEvent}가 존재하는 경우 브라우저 이벤트의 <code>timeStamp</code>값과 동일하다.
       * @type Number
       */
      this.timeStamp = +(new Date());
    }
  },

  /**
   * 현재 이벤트 이름을 반환한다.
   * @returns {String} 이벤트 명 
   */
  getName: function () {
    return this._name;
  },

  /**
   * 이벤트가 발생된 원본객체({@link olleh.maps.event.EventDelegator})를 반환한다.
   * @returns {olleh.maps.event.EventDelegator} EventDelegator 객체 
   */
  getSource: function () {
    return this._src;
  },

  /**
   * bubbling, capture phase에서 같은 레벨의 이벤트 리스너는 동작하고 다음 레벨의 이벤트 리스너는 더이상 동작하지 않는다. 
   * @see #stopImmediatePropagation
   * @see http://www.w3.org/TR/2006/WD-DOM-Level-3-Events-20060413/events.html#Events-Event-stopPropagation|w3c Event-stopPropagation
   */ 
  stopPropagation: function () {
    this._stopPropagation = true;
  },

  /**
   * {@link #stopPropagation}와 다르게 즉시 이벤트 리스너는 동작하지 않는다.
   * @see #stopPropagation
   * @see http://www.w3.org/TR/2006/WD-DOM-Level-3-Events-20060413/events.html#Events-Event-stopImmediatePropagation|w3c Event-stopImmediatePropagation
   */ 
  stopImmediatePropagation: function () {
    this._stopImmediatePropagation = true;
  },

  /**
   * 이벤트의 default function이 수행되지 않도록 한다.
   */
  preventDefault: function () {
    this._defaultPrevented = true;
  },

  /**
   * 마우스 혹은 터치 이벤트가 발생했을 때 viewport pixel 좌표를 반환한다.
   * @returns {olleh.maps.Point}
   */
  getPoint: function () {
    var xy = this.pageXY;
    
    if (olleh.maps.isUndefined(xy)) return null;
    
    if (olleh.maps.isUndefined(this._point)) {
      var map = this._getMap();
      if (!map) {
        return (this._point = null);
      }
      var rootXY = map.layerMgr.getViewportOffset();
      this._point = xy.subtract(rootXY);
    }
    return this._point;
  },
  
  /**
   * viewport pixel 을 coord 로 변환한다.
   * @returns {olleh.maps.Coord}
   */
  getCoord: function () {
    if (this._coord !== null) {
      var viewportPx = this.getPoint();
      
      if (!viewportPx) {
        return this._coord = null;
      }
      var map = this._getMap();
      this._coord = map ?  map.layerMgr.getCoordFromViewportPx(viewportPx) : 
        null;
    }
    return this._coord;
  },
  
  /**
   * 맵 객체({@link olleh.maps.Map})를 반환한다.
   * @returns {olleh.maps.Map}
   * @private
   */
  _getMap: function () {
    var hit = this._src;
    
    if (!hit || this._map === null) return null;
    
    var bubble = hit.getMap ? hit.getMap() || hit.getBubble() : hit.getBubble();
    var Map = olleh.maps.Map;
    
    while (bubble && !(bubble instanceof Map)) {
      bubble = bubble.getMap ? bubble.getMap() || bubble.getBubble() : bubble.getBubble();
    }
    bubble = bubble || hit;
    
    if (bubble instanceof Map) {
      this._map = bubble; 
    } else {
      this._map = null;
    }
    return this._map;
  } 
});/**
 * 이벤트를 퍼블리싱하기 위한 기본 인터페이스를 제공한다.
 * 해당 클래스를 mixin한 클래스에서는 {@link #onEvent}, {@link #fireEvent} 기능을 사용할 수 있다. 
 * <p/>
 * <h3>EventDelegator를 mixin한 대표 클래스</h3>
 * KT맵에서 제공되는 UI요소의 클래스들은 대부분 <code>EventDelegator</code>를 mixin하고 있다.
 * 대표적으로 다음 클래스들이 mixin하고 있다. 
 * <ul>
 *   <li>{@link olleh.maps.Map|맵}</li>
 *   <li>{@link olleh.maps.overlay.Marker|마커}</li>
 *   <li>{@link olleh.maps.overlay.InfoWindow|인포윈도우}</li>
 * </ul>
 * <h3>대표적으로 사용되는 API</h3>
 * 아래의 API가 주로 사용되는 API이다. 
 * 그 이외의 API의 경우 직접 호출하지 않고 시스템 내부에서 호출하는 API가 대부분이다.
 * <ul>
 *   <li>{@link #onEvent}</li>
 *   <li>{@link #fireEvent}</li>
 * </ul>
 * <h3>브라우저 이벤트를 처리하기 위해 사용되는 API</h3>
 * 해당 클래스가 관리하는 특정 DOM Element에 브라우저 이벤트를 받을 필요가 있는 경우 
 * {@link #registerEventDom}, 해제할 경우 {@link #unregisterEventDom}을 사용한다.
 * 
 * @example
 * $class('Foo').mixin(olleh.maps.event.EventDelegator).define({
 *   init: function () {
 *     this.fooDOM1 = document.createElement('div');
 *     this.fooDOM2 = document.createElement('div');
 *     this.fooDOM3 = document.createElement('div');
 *     ...
 *     this.registerEventDom(this.fooDOM1);
 *     this.registerEventDom(this.fooDOM2);
 *     this.registerEventDom(this.fooDOM3);
 *   },
 *   
 *   $default_click: function (event, payload) {
 *     if (event.targetDOM === this.fooDOM1) {
 *       olleh.maps.log.info('fooDOM1 clicked');
 *     }
 *   }
 * });
 * 
 * var foo = new Foo();
 *
 * foo.onEvent('click', function (event, payload) {
 *   olleh.maps.log.info(event.targetDOM);
 *   foo.fireEvent('customEvent', {customX: 1, customY: 2});
 * });
 * foo.onEvent('customEvent', function (event, payload) {
 *   olleh.maps.log.info(payload.customX + ',' + payload.customY);
 * });
 * 
 * @summary EventDelegator는 이벤트를 전송하고 받기 위해 필요한 허브역할을 수행한다.
 * 뿐만 아니라 상위 EventDelegator와 Bubbling관계를 형성한다.
 */
$class('olleh.maps.event.EventDelegator').define({
  /**
   * 브라우저 이벤트를 받기 위해 가 발생했을 때 hit test를 위해
   * 현재 객체를 {@link olleh.maps.event.EventManager}에 등록하는 일을 수행한다.
   * <p />
   * 브라우저 이벤트를 받기 위해서는 이 API를 반드시 호출해 주어야 한다.
   * @private
   */
  registerEvent: function () {
    var eventMgr = this._getEventManager();
    eventMgr && eventMgr.registry(this);
  },
  
  /**
   * 브라우저 이벤트를 받기 위해 가 발생했을 때 hit test를 위해
   * 현재 객체를 {@link olleh.maps.event.EventManager}에 등록하는 일을 수행한다.
   * <p />
   * 브라우저 이벤트를 받기 위해서는 이 API를 반드시 호출해 주어야 한다.
   * @param {HTMLElement} elem
   * @private
   */
  registerEventDom: function (elem) {
    if (!elem) return;
    var eventMgr = this._getEventManager();
    eventMgr && eventMgr.registryDom(this, elem);
  },

  /**
   * 지정된 <code>elem</code>에 대해 브라우저 이벤트를 더이상 받지 않는다.
   * <p />
   * 브라우저 이벤트를 받지 않기 위해서는 이 API를 반드시 호출해 주어야 한다.
   * @param {HTMLElement} elem
   * @see #registerEventDom
   * @private
   */
  unregisterEventDom: function (elem) {
    if (!elem) return;
    var eventMgr = this._getEventManager();
    eventMgr && eventMgr.unregistryDom(elem);
  },

  /**
   * 브라우저 이벤트를 더이상 받지 않는다.
   * 현재 객체를 {@link olleh.maps.event.EventManager}에서 해제하는 일을 수행한다.
   * <p />
   * 브라우저 이벤트를 받지 않기 위해서는 이 API를 반드시 호출해 주어야 한다.
   * @see #unregisterEventDom
   * @private
   */
  unregisterEvent: function () {
    var eventMgr = this._getEventManager();
    eventMgr && eventMgr.unregistry(this);
  },

  /**
   * 아이디를 반환한다.
   * 아이디는 자동 생성되어서 반환한다. 이전에 생성이 되었다면 그 아이디를 반환한다.
   * @returns {String}
   * @private
   */
  getId: function () {
    if (!this.hasOwnProperty('_id') || this._id == null) {
      this._id = olleh.maps.util.genId();
    } 
    return this._id;
  },
  
  /**
   * 현재 인스턴스의 bubble-target 객체를 반환한다. 
   * 만약 bubble-target 객체가 존재하지 않으면 <code>null</code>을 반환한다.
   * <p />
   * bubble-target이 있는 경우 반드시 오버라이드해야한다.
   * @returns {olleh.maps.event.EventDelegator} bubble-target 객체, 
   *  없으면 <code>null</code>을 반환
   * @private
   */
  getBubble: function () {
    return null;
  },
  
  /**
   * 명시된 이벤트 이름 또는 이벤트 객체를 이용하여 이벤트를 발생시킨다.
   * <p/>
   * 이벤트가 발생되면 bubbling-up단계를 거치면서 등록된 리스너들을 실행시킨다.
   * <p/>
   * 파라미터 중 delay가 0이상의 값을 가질 경우 Async방식으로 등록된 이벤트 리스너가 호출되지만 -1일
   * 경우 Sync 방식으로 이벤트 리스너가 실행되어 시간지체가 발생되지 않는다.
   * <p/>
   * 주로 시스템 내부에서 호출되고, 커스텀 이벤트를 생성해서 발생시킬 때 사용된다.
   * @example
   * var marker = new olleh.maps.overlay.Marker({
   *   position: new olleh.maps.UTMK(958094.063532902, 1942790.8261742294),
   *   map: map
   * })
   * 
   * var customEvent = new olleh.maps.event.Event('custom1', marker);
   * marker.fireEvent(customEvent, {x: 1, y: 1});
   * marker.fireEvent('custom2', {x: 1, y: 1});
   * 
   * @param {String|olleh.maps.event.Event} event 이벤트명 또는 이벤트 객체
   * @param {Object} payload 이벤트 발생시 같이 전송될 데이터 객체
   * @param {Number} delay 실제 이벤트가 발생될 때까지의 시간(milliseconds)
   * @see #onEvent
   */
  fireEvent: function (event, payload, delay) {
    if (olleh.maps.isString(event)) {
      event = new olleh.maps.event.Event(event, this);
    }
    if (event._stopPropagation) return false;

    if (delay >= 0) {
      olleh.maps.util.delay(this._handleFireEvent, delay, this, event, payload);
    } else {
      this._handleFireEvent(event, payload);
    }
  },
  
  /**
   * 객체들의 구조상에서 bubble-up을 거치게 될 모든 target객체들을 
   * 찾아 반환하며 이때 이 메소드를 호출하는 객체 자신은
   * 배제된다. 만약 bubble-up 을 거칠 target객체가 존재하지
   * 않을 경우 공백의 배열 객체를 반환한다.
   * @returns {Array.<olleh.maps.event.EventDelegator>} 현재 자신을 제외한 모든 bubble-up target 객체들을
   * 저장하고 있는 배열
   * @private
   */
  lookupBubbles: function () {
    var results = [];
    var target = this.getBubble();

    while (target) {
      results.push(target);
      target = target.getBubble();
    }
    return results;
  },
  
  /**
   * 이벤트가 발생되었을 때 처리할 callback 핸들러를 등록한다.
   * <p/>
   * callback 핸들러는 향후 {@link #fireEvent} 메소드가 호출되었을 때 실행된다.
   * @example
   * var map = new olleh.maps.Map(document.getElementById('map'), {
   *  center: new olleh.maps.UTMK(958094.063532902, 1942790.8261742294)
   * });
   * var marker = new olleh.maps.overlay.Marker({
   *   position: new olleh.maps.UTMK(958094.063532902, 1942790.8261742294),
   *   map: map
   * })
   * ...
   *  // marker를 클릭한 경우 map이 capture 단계에서 먼저 이벤트를 받아 처리한다.
   * map.onEvent('click', function (event, payload) {
   *   var src = event.getSource();
   *   olleh.maps.log.info('1 ' + src + ': clicked'); 
   * }, this, true);
   *  // marker를 클릭한 경우 marker가 target 단계에서 이벤트를 받아 처리한다.
   * marker.onEvent('click', function (event, payload) {
   *   var src = event.getSource();
   *   olleh.maps.log.info('2 ' + src + ': clicked');
   * }, this);
   *  // marker를 클릭한 경우 map이 bubbleup 단계에서 이벤트를 받아 처리한다.
   * map.onEvent('click', function (event, payload) {
   *   var src = event.getSource();
   *   olleh.maps.log.info('3 ' + src + ': clicked'); 
   * }, this);
   * @param {String} eventName 이벤트 명
   * @param {Function} callbackFn 이벤트가 발생되었을 때 수행될 callback 핸들러
   * @param {Object} ctx callback핸들러 내에서 사용할 <code>this</code> 객체.
   * 명시되지 않으면 생성자의 source로 지정된 객체를 사용한다.
   * @param {Boolean} [capture = false] 이벤트 단계를 지정한다. 
   * <code>true</code>이면 capture단계이며 그렇지 않을 경우 bubble-up단계가 된다. 
   * @returns {Boolean} 정상적으로 등록되었으면 <code>true</code>를 반환
   * @see #fireEvent
   * @see #unsubscribeEvent
   */
  onEvent: function (eventName, callbackFn, ctx, capture) {

    if (!olleh.maps.isFunction(callbackFn)) {
      throw new TypeError('Specified event listener is not a function: '
          + callbackFn + this.currentStack());
    }
    if (ctx && !olleh.maps.isObject(ctx)) {
      throw new TypeError('Specified event context is not an Object type: '
          + ctx + this.currentStack());
    }
    
    var listener = this._findEventListener(eventName, callbackFn, true);
    // 1(Capture), 2(Bubble), 3 (Both)
    callbackFn.capture |= (capture ? 1 : 2); // BIT-OR operation
    if (listener) {
      ctx = ctx || this;
      if (olleh.maps.util.indexOf(listener.$ctxs, ctx) === -1) {
        listener.$ctxs.push(ctx);
      }
      return true;
    }
    return false;
  },
  
  /**
   * 발생된 이벤트를 다음 {@link olleh.maps.event.EventDelegator}로
   * propatation시킨다.(bubble-up)
   * <p/>
   * 이벤트는 등록된 콜백 리스너들을 실행히키고 계속해서 Bubble-up 과정을 진행해 나간다.
   * <p/>
   * 해당 함수는 직접 호출하지는 않는다. 시스템 내부에서 호출한다.
   * @param {olleh.maps.event.Event} event 객체
   * @param {Object} [payload] 이벤트 발생시 전될되는 데이터 객체
   * @returns {Boolean} 정상적으로 이벤트가 처리되었을 경우 <code>true</code>를 반환
   * @see #fireEvent
   * @private
   */
  propagateEvent: function (event, payload) {
    if (!event) return false;
    
    var bubble;
    var ns = olleh.maps.event.Event;
    
    this._notifyListeners(event, payload);
    
    if (event.eventPhase !== ns.BUBBLING_PHASE) {
      event.eventPhase = ns.BUBBLING_PHASE;
    }
    // Continue bubbling up if it wasn't stopped or local event wasn't fired
    if (!event._stopPropagation && !event._stopImmediatePropagation) {
      bubble = this.getBubble();
      bubble && bubble.propagateEvent.apply(bubble, arguments);
    }
    return true;
  },
  
  /**
   * 등록된 이벤트의 리스닝을 해제한다.
   * <p/>
   * callbackFn이 기술하지 않았다면, 이벤트명에 해당하는 모든 리스너들을 해제시킨다.
   * ctx를 기술하지 않았다면 callbackFn에 해당하는 모든 리스너들을 제거시킨다.
   * @param {String} eventName 이벤트 명
   * @param {Function} [callbackFn] 제거할 이벤트 리스너
   * @param {Object} [ctx] 이벤트 리스너에서 사용할 <code>this</code> 객체
   * @see #onEvent
   */
  unsubscribeEvent: function (eventName, callbackFn, ctx) {
    var listeners = this._getEventListeners(eventName);
    
    if (!listeners || listeners.length === 0) return;

    if (callbackFn) {
      var listener = this._findEventListener(eventName, callbackFn);
      
      if (!listener) return;
      
      if (olleh.maps.isUndefined(ctx)) { // removes all the listeners
        listeners.splice(olleh.maps.util.indexOf(listeners, listener), 1);
        return;
      }
      
      var c = olleh.maps.util.indexOf(listener.$ctxs, ctx || this);
      if (c != -1) {
        listener.$ctxs.splice(c, 1); // remove
      }
      if (listener.$ctxs.length === 0) {
        listener.$fn = undefined;
        listeners.splice(olleh.maps.util.indexOf(listeners, listener), 1);
      }
    } else { // removes all the listeners
      this._eventListeners[eventName] = null;
    }
  },
  
  /**
   * 이벤트명, callbackFn에 해당하는 이벤트리스너 객체를 반환한다. 
   * 없는 경우 등록해서 이벤트리스너 객체를 반환한다.
   * @param {String} name 이벤트명
   * @param {Function} callbackFn 이벤트를 처리하기 위한 콜백함수
   * @param {Boolean} create <code>true</code>인 경우 이벤트리스너가 없는 경우 생성한다.
   * @returns {{$fn: Function, $ctxs: Array}} 이벤트 처리 콜백함수와 context
   *   $fn: 이벤트를 처리하기 위한 콜백함수, 
   *   $ctxs: $fn함수 내에서 <code>this</code>에 해당하는 context 객체 
   * @private
   */
  _findEventListener: function (name, callbackFn, create) {
    var listeners = this._getEventListeners(name); 
    var listener = null;

    if (!listeners && create) {
      listeners = [];
      this._eventListeners[name] = listeners;
      listener = {$fn: callbackFn, $ctxs: []};
      listeners.push(listener);
      return listener;
    }
    
    for(var i = 0, len = listeners.length; i < len; i++) {
      listener = listeners[i];
      if (listener && listener.$fn === callbackFn) {
        return listener;
      }
    }

    if (listeners && create) {
      listener = {$fn: callbackFn, $ctxs: []};
      listeners.push(listener);
      return listener;
    }
    return null;
  },
  
  /**
   * 등록된 모든 callback 리스너 함수들을 반환한다. 
   * @param {Boolean} [capture = false] true이면 capture단계에
   * 등록된 모든 리스너들을 반환하고 그렇지 않을면 bubble up단계의
   * 리스너들을 반환한다.
   * @returns {Array.<{$fn: Function, $ctxs: Array}>}  이벤트 처리 콜백함수와 context에 대한 배열
   *   $fn: 이벤트를 처리하기 위한 콜백함수, 
   *   $ctxs: $fn함수 내에서 <code>this</code>에 해당하는 context 객체 
   * @private
   */
  _findEventListeners: function (event, capture) {
    var listeners = this._getEventListeners(event.getName());
    var results = [];
    var phase = capture ? 1 : 2;
    for (var i = 0, len = listeners ? listeners.length : 0; i < len; i++) {
      if ((listeners[i].$fn.capture & phase) == phase) { // BIT-AND operation
        results.push(listeners[i]);
      }
    }
    return results;
  },

  /**
   * 이벤트명에 해당하는 이벤트 처리 콜백함수와 context에 대한 배열을 반환한다.
   * @param {String} eventName
   * @returns {Array.<{$fn: Function, $ctxs: Array}>} 이벤트 처리 콜백함수와 context에 대한 배열
   *   $fn: 이벤트를 처리하기 위한 콜백함수, 
   *   $ctxs: $fn함수 내에서 <code>this</code>에 해당하는 context 객체 
   * @private
   */
  _getEventListeners: function (eventName) {
    if (!this.hasOwnProperty('_eventListeners')) {
      this._eventListeners = {};
      return null;
    }
    return this._eventListeners[eventName];
  },
  
  /**
   * {@link olleh.maps.event.EventManager}를 반환한다.
   * @returns {olleh.maps.event.EventManager}
   * @private
   * @see #registerEventDom
   * @see #unregisterEventDom
   */
  _getEventManager: function () {
    if (!this.hasOwnProperty('_eventMgr')) {
      var bubble = this.getMap ? this.getMap() || this.getBubble(): this.getBubble();
      var Map = olleh.maps.Map;
  
      while (bubble && !(bubble instanceof Map)) {
        bubble = bubble.getMap ? bubble.getMap() || bubble.getBubble(): bubble.getBubble();
      }
      bubble = bubble || this;
  
      if (bubble instanceof Map) {
        this._eventMgr = bubble.eventMgr;
      } else {
        this._eventMgr = null;
      }
    }
    return this._eventMgr;
  },
  
  /**
   * 이벤트를 fire했을 때 처리하는 메소드
   * <p/>
   * capture단계에 등록된 이벤트리스너를 처리하고,
   * target단계에 등록된 이벤트리스너를 처리하고,
   * 맨 마지막으로 버블업하면서 bubble단계에 등록된 이벤트리스너를 처리한다.
   * @param {olleh.maps.event.Event} event
   * @param {Object} payload
   * @private
   */
  _handleFireEvent: function (event, payload) {
    
    var path = this.lookupBubbles();
    var ns = olleh.maps.event.Event;
    var name = event.getName();
    var ctx, defaultFn, i, len;
    
    event.eventPhase = ns.CAPTURING_PHASE;

    // capture phase
    while (path.length != 0 && !event._stopPropagation && !event._stopImmediatePropagation) {
      path.pop()._notifyListeners(event);
    }
    if (!event._stopPropagation && !event._stopImmediatePropagation) {
      this._notifyListeners(event, payload); // capture phase(target)
      event.eventPhase = ns.AT_TARGET; // 2; target phase
      this.propagateEvent(event, payload);
    }
    // default
    path = [this].concat(this.lookupBubbles());
    for(i = 0, len = path.length; i < len && !event._defaultPrevented; i++) {
      ctx = path[i];
      
      if (this._checkEvent.apply(ctx, [name, ns.DEFAULT_PHASE])) {
        defaultFn = ctx['$default_' + name];
        defaultFn && defaultFn.apply(ctx, arguments);
      }
    }
  },
  
  /**
   * 이벤트에 등록된 모든 callback 리스너들을 실행한다.
   * @param {olleh.maps.event.Event} event 이벤트 객체
   * @param {Object} [payload] 리스너에게 전달될 데이터 객체
   * @returns {Number} 호출된 리스너의 개수
   * @private
   */
  _notifyListeners: function (event, payload) {
    var j, ctxs, ctx, listener, fn;
    var phase = event.eventPhase;
    var capturing = (phase === olleh.maps.event.Event.CAPTURING_PHASE);
    var listeners = this._findEventListeners(event, capturing);
    var i = listeners ? listeners.length : 0;
    var eventName = event.getName();
    
    if (this._checkEvent(eventName, phase)) {
      fn = this[(capturing ? '$capture_' : '$current_') + eventName];
      fn && fn.apply(this, arguments);
    }

    if (event._stopImmediatePropagation) return true;
    
    while (i--) {
      listener = listeners[i];
      if (!listener) continue;
      try {
        ctxs = listener.$ctxs;
        j = ctxs ? ctxs.length : 0;
        while (j--) {
          ctx = ctxs[j];
          ctx && listener.$fn && listener.$fn.apply(ctx, arguments);
          if (event._stopImmediatePropagation) return true;
        }
      } catch (ex) {
        // If graceful errors is set, log error and continue event callback
        olleh.maps.log.error('Error occured during event listener: ' + ex, this);
        
        if (ex.stack) { // chrome
          olleh.maps.log.error(ex.stack, this);
        } else {
          throw ex;
        }
      }
    }
    return true;
  },

  /**
   * @param {String} eventName 이벤트명
   * @param {Number} phase 이벤트 단계
   * @see olleh.maps.event.Event
   * @private
   */
  _checkEvent: function (eventName, phase) {
    var Event = olleh.maps.event.Event;
    
    // targetting, bubbling을 동일하게 $current로 처리함.
    if (phase === Event.BUBBLING_PHASE) {
      phase = Event.AT_TARGET;
    }
    var event = this.$EVENTS[eventName];
    
    return !!(event && event | phase);
  },
  
  /**
   * 클래스가 define될 때 호출되는 함수.
   * <p/>
   * $cature_, $current_, $default_ 함수가 정의되어 있다면 $EVENTS에 해당 이벤트를 등록한다.
   * @private
   */
  $afterDefine: function () {
    var clazz = this;
    var clazzPrototype = clazz.prototype;
    var Event = olleh.maps.event.Event;

    clazzPrototype.$EVENTS = {};
    
    var events = clazzPrototype.$EVENTS;
    
    // TODO 임시 코드 refactoring
    for(var k in clazzPrototype) {
      if (k.indexOf('$') != 0) {
        continue;
      }
      var eventName = null;
      if (k.indexOf('capture_') == 1) {
        eventName = k.substring(9);
        events[eventName] = events[eventName] | Event.CAPTURING_PHASE;
      } else if (k.indexOf('current_') == 1) {
        eventName = k.substring(9);
        events[eventName] = events[eventName] | Event.AT_TARGET;
      } else if (k.indexOf('default_') == 1) {
        eventName = k.substring(9);
        events[eventName] = events[eventName] | Event.DEFAULT_PHASE;
      }
    }
  }
});/**
 * KT맵에 발생하는 브라우저 이벤트를 정제하고 인지해서 {@link olleh.maps.event.Event} 객체를 이벤트가 발생한 {@link olleh.maps.event.EventDelegator}에게 전달하는 역할을 수행한다.
 * EventManager에서는 다음과 같은 역할을 수행한다.
 * <h3>브라우저 이벤트 리스닝</h3>
 * KT맵에서는 특정 브라우저 이벤트에 대해서 최상위 DOM element에서 리스닝을 한다.
 * KT맵의 {@link olleh.maps.event.EventDelegator} 클래스들은 개별적으로 리스닝하는 것이 아니라 EventManager에서 통합적으로 관리한다. 
 * <p/> 
 * EventManager에서는 브라우저 종류에 상관없이(ie7, ff, safari, chrome)에 상관없이 동일한 이벤트를 {@link olleh.maps.event.Event}로 생성해서 전달하고,
 * 모바일인 경우에도 터치 이벤트에 대해서 {@link olleh.maps.event.Event} 객체로 생성해서 이벤트를 전달한다.
 * <h5>공통 브라우저 이벤트</h5>
 * <ul>
 *   <li>{@link olleh.maps.event.EventDelegator#event:keydown|keydown}</li>
 *   <li>{@link olleh.maps.event.EventDelegator#event:keyup|keyup}</li>
 *   <li>{@link olleh.maps.event.EventDelegator#event:keypress|keypress}</li>
 *   <li>{@link olleh.maps.Map#event:resize|resize}</li>
 *   <li>{@link olleh.maps.event.EventDelegator#event:click|click}</li>
 * </ul>
 * <h5>데스크탑 브라우저 이벤트</h5>
 * <ul>
 *   <li>{@link olleh.maps.event.EventDelegator#event:mousedown|mousedown}</li>
 *   <li>{@link olleh.maps.event.EventDelegator#event:mousemove|mousemove}</li>
 *   <li>{@link olleh.maps.event.EventDelegator#event:mouseup|mouseup}</li>
 *   <li>{@link olleh.maps.event.EventDelegator#event:mouseover|mouseover}</li>
 *   <li>{@link olleh.maps.event.EventDelegator#event:mouseout|mouseout}</li>
 *   <li>{@link olleh.maps.event.EventDelegator#event:mousewheel|mousewheel}</li>
 *   <li>{@link olleh.maps.event.EventDelegator#event:rightclick|rightclick}</li>
 *   <li>{@link olleh.maps.event.EventDelegator#event:dblclick|dblclick}</li>
 * </ul>
 * <h5>모바일 브라우저 이벤트</h5>
 * <ul>
 *   <li>{@link olleh.maps.event.EventDelegator#event:touchstart|touchstart}</li>
 *   <li>{@link olleh.maps.event.EventDelegator#event:touchmove|touchmove}</li>
 *   <li>{@link olleh.maps.event.EventDelegator#event:touchend|touchend}</li>
 *   <li>{@link olleh.maps.event.EventDelegator#event:touchcancel|touchcancel}</li>
 * </ul>
 * <p/>
 * <h3>hit Target</h3>
 * 브라우저 이벤트가 발생했을 때 발생한 DOM element의 {@link olleh.maps.event.EventDelegator}를 찾아야 전달해야 한다.
 * EventManger에서는 브라우저 이벤트를 받기를 원하는 {@link olleh.maps.event.EventDelegator}를 관리한다.
 * <h5>{@link olleh.maps.event.EventDelegator} 객체 등록</h5>
 * {@link #registry} 를 통해 {@link olleh.maps.event.EventDelegator} 객체와 브라우저 이벤트를 받을 DOM element를 전달하면 된다.
 * <p/>
 * 참고로 DOM element 하위 DOM element에 발생하는 이벤트는 bubble up이 되기 때문에 등록한 DOM element로 이벤트를 받을 수 있다.  
 * <h5>{@link olleh.maps.event.EventDelegator} 객체 해지</h5>
 * 더 이상 등록한 DOM element로 브라우저 이벤트를 받지 않으려면 {@link #unregistry} 를 호출한다.
 * <h5>hit test</h5>
 * 브라우저 이벤트가 KT맵에 발생하면 <code>UIEvent#target</code> DOM element가 KT맵에서 관리하는 DOM element를 확인한다.
 * 최상위 DOM element까지 bubble up하면 찾게 되는데 찾게 되면 등록되어 있는 DOM element의 {@link olleh.maps.event.EventDelegator} 객체를 바로 가져올 수 있다. 
 * <p/>
 * <h3>이벤트 인지</h3>
 * KT맵에서 인지해야 하는 이벤트는 다음과 같다. 
 * <h5>이벤트를 추적해서 생성된 이벤트</h5>
 * <ul>
 *   <li>{@link olleh.maps.event.EventDelegator#event:dragstart|dragstart}</li>
 *   <li>{@link olleh.maps.event.EventDelegator#event:drag|drag}</li>
 *   <li>{@link olleh.maps.event.EventDelegator#event:dragend|dragend}</li>
 *   <li>{@link olleh.maps.event.EventDelegator#event:pinchstart|pinchstart}</li>
 *   <li>{@link olleh.maps.event.EventDelegator#event:pinch|pinch}</li>
 *   <li>{@link olleh.maps.event.EventDelegator#event:pinchend|pinchend}</li>
 * </ul>
 * 해당 이벤트을 인지하기 위해서는 핸들러가 필요한데 EventManager에서는 {@link olleh.maps.event.Recognizer} 들을 관리한다.
 * {@link #addRecognizer}를 통해 recognizer 객체를 등록하고,
 * {@link #findRecognizer}를 통해 등록되어 있는 recognizer 객체를 찾아 활성화 여부를 수정할 수 있다.
 * 또한, {@link #removeRecognizer}를 통해 더이상 필요없는 recognizer를 해제할 수 있다.
 * <p/>
 * 참고로 EventManager객체는 {@link olleh.maps.Map}에서 Signleton으로 생성, 관리된다.
 * @summary
 * KT맵에 발생하는 브라우저 이벤트를 정제하고 인지해서 {@link olleh.maps.event.Event} 객체를 이벤트가 발생한 {@link olleh.maps.event.EventDelegator}에게 전달하는 역할을 수행한다. 
 * @param {olleh.maps.Map} map Map 객체
 * @param {HTMLElement} elem KT맵 최상위 DOM element
 */
$class('olleh.maps.event.EventManager').define({
  $static: {
    /**
     * 브라우저 event stopPropagation를 수행한다.
     * @example
     * var domEvent = event.originEvent; // event는 olleh.maps.event.Event 객체
     * 
     * olleh.maps.event.EventManager.stopPropagation(domEvent);
     * @param {UIEvent} domEvent 브라우저 이벤트
     * @see http://www.w3.org/TR/DOM-Level-2-Events/events.html#Events-interface|w3c Event#stopPropagation
     */
    stopPropagation: function (domEvent) {
      domEvent.stopPropagation ? domEvent.stopPropagation() : 
        (domEvent.cancelBubble = true); // ie7,8 cancelBubble
    },

    /**
     * 브라우저 event preventDefault를 수행한다.
     * @example
     * var domEvent = event.originEvent; // event는 olleh.maps.event.Event 객체
     * olleh.maps.event.EventManager.preventDefault(domEvent);
     * @param {UIEvent} domEvent 브라우저 이벤트
     * @see http://www.w3.org/TR/DOM-Level-2-Events/events.html#Events-interface|w3c Event#preventDefault
     */
    preventDefault: function (domEvent) {
      domEvent.preventDefault ? domEvent.preventDefault() : 
        (domEvent.returnValue = false); // ie7,8 returnValue
    },
    
    /**
     * 우클릭인지 여부를 반환한다.
     * @param {MouseEvent} domEvent 마우스 이벤트 객체
     * @returns {Boolean}
     */
    isRightClick: function (domEvent) {
      return (domEvent.which && domEvent.which == 3) || (domEvent.button && domEvent.button == 2);
    },
    
    /**
     * 현재 활성화된 영역의 DOM이 input, select, textarea인 경우 <code>false</code>를 반환한다.
     * @returns {Boolean}
     */
    checkEnabledKeyevent: function (activeElement) {
      olleh.maps.isUndefined(activeElement) && (activeElement = document.activeElement);
      
      if (!activeElement) return true;
      
      var nodeName = activeElement.nodeName;
      return !(nodeName === 'INPUT' || nodeName === 'SELECT' || nodeName === 'TEXTAREA');
    }
  },

  /**
   * req_zoomin 이벤트
   * @event olleh.maps.event.EventDelegator#event:req_zoomin
   * @param {olleh.maps.event.Event} event
   * @private
   */
  /**
   * req_zoomout 이벤트
   * @event olleh.maps.event.EventDelegator#event:req_zoomout
   * @param {olleh.maps.event.Event} event
   * @private
   */
  /**
   * 생성자, 새로운 EventManager 객체를 생성한다.
   * @param {olleh.maps.Map} map Map 객체
   * @param {HTMLElement} elem KT맵 최상위 DOM element
   */
  EventManager: function (map, elem) {
    this._map = map;
    this._root = elem;  // olleh.maps.Map 이 결정되면 수정될 수 있음.
    this._hitTargets = {}; // hit test시에 빠르게 찾기 위해 유지하고 있는 hashmap
    this._recognizers = {};
    
    this._desktopIE = false;
    this._clicked = false; // 지도 영역을 클릭했으면 true, 지도밖을 클릭하면 다시 false
  },
  
  /**
   * 브라우저 이벤트 리스너를 등록한다.
   * <p/>
   * 직접 호출하지는 않는다. 시스템 내부에서 호출한다. map이 start될 때 내부적으로 호출된다.
   * @private
   */
  start: function () {
    var browser = olleh.maps.browser;
    var events;
    
    this.registryDom(this._map, this._root);
    this._layerMgr = this._map.layerMgr;

    // Track history map by track ID
    this._history = {};
    
    if (browser.isMobile) {
      /**
       * touchstart 이벤트. 터치를 시작할때 발생한다.
       * @event olleh.maps.event.EventDelegator#event:touchstart
       * @param {olleh.maps.event.Event} event
       */
      /**
       * touchmove 이벤트. 터치한채로 손가락이 움직일 때 발생한다.
       * @event olleh.maps.event.EventDelegator#event:touchmove
       * @param {olleh.maps.event.Event} event
       */
      /**
       * touchend 이벤트. 터치가 끝날때 발생한다.
       * @event olleh.maps.event.EventDelegator#event:touchend
       * @param {olleh.maps.event.Event} event
       */
      /**
       * touchcancel 이벤트. 터치 이벤트를 취소시킬때 발생한다.
       * @event olleh.maps.event.EventDelegator#event:touchcancel
       * @param {olleh.maps.event.Event} event
       */
      this._addEventsListener(document, ['touchstart', 'touchmove', 'touchend',
        'touchcancel'], this, false);
    } else {
      if (browser.browserName === browser.BROWSER_NAME.ie) { // ie 마우스휠 버그 수정
        var hackDOM = document.createElement('div');
        olleh.maps.util.dom.setStyles(hackDOM, {
          position: 'absolute',
          width: '100%',
          height: '100%',
          zIndex: 2
        });
        this._desktopIE = true;
        this._hackDOM = hackDOM;
        this._root.appendChild(hackDOM);
      }
      /**
       * mousewheel 이벤트. 마우스 굴림단추가 개체 위에서 회전할 때 발생한다.
       * <p/> 
       * firefox DOMMouseScroll는 mousewheel로 대체된다.
       * @event olleh.maps.event.EventDelegator#event:mousewheel
       * @param {olleh.maps.event.Event} event
       * @see http://www.w3.org/TR/2007/WD-DOM-Level-3-Events-20071221/events.html#event-mousewheel|w3c mousewheel
       * @see https://developer.mozilla.org/en-US/docs/DOM/DOM_event_reference/DOMMouseScroll|DOMMouseScroll
       */
      /**
       * mousedown 이벤트. 마우스가 개체 위를 눌렀을 때 발생한다.
       * @event olleh.maps.event.EventDelegator#event:mousedown
       * @param {olleh.maps.event.Event} event
       */
      /**
       * mousemove 이벤트. 마우스가 개체 위에서 이동하였을 때 발생한다.
       * @event olleh.maps.event.EventDelegator#event:mousemove
       * @param {olleh.maps.event.Event} event
       */
      /**
       * mouseup 이벤트. 마우스가 개체 위 누른 것을 해제하였을 때 발생한다.
       * @event olleh.maps.event.EventDelegator#event:mouseup
       * @param {olleh.maps.event.Event} event
       */
      /**
       * mouseover 이벤트. 마우스가 개체 위로 이동하였을 때 발생한다.
       * @event olleh.maps.event.EventDelegator#event:mouseover
       * @param {olleh.maps.event.Event} event
       */
      /**
       * mouseout 이벤트. 마우스가 개체 위에서 이탈하였을 때 발생한다.
       * @event olleh.maps.event.EventDelegator#event:mouseout
       * @param {olleh.maps.event.Event} event
       */
      /**
       * click 이벤트. 마우스가 개체 위를 왼쪽 버튼으로 클릭하였을 때 발생한다.
       * @event olleh.maps.event.EventDelegator#event:click
       * @param {olleh.maps.event.Event} event
       */
      /**
       * rightclick 이벤트. 마우스가 개체 위를 오른쪽 버튼으로 클릭하였을 때 발생한다.
       * @event olleh.maps.event.EventDelegator#event:rightclick
       * @param {olleh.maps.event.Event} event
       */
      /**
       * dblclick 이벤트. 마우스가 개체 위를 두번 클릭하였을 때 발생한다.
       * @event olleh.maps.event.EventDelegator#event:dblclick
       * @param {olleh.maps.event.Event} event
       */
      this._mousewheel = (browser.browserName === browser.BROWSER_NAME.firefox)
        ? 'DOMMouseScroll' : 'mousewheel';
      this._addEventsListener(document, ['mousedown', 'mousemove', 'mouseup'], this, false);
      
      if (this._desktopIE) {
        events = ['dragstart', 'contextmenu', this._mousewheel];
      } else {
        events = ['dragstart', 'selectstart', 'contextmenu', this._mousewheel, 'mouseout', 'mouseover'];
      }
      this._addEventsListener(this._root, events, this, false);
    }
    this._addEventsListener(window, ['resize'], this, false);
    this._addEventsListener(this._root, ['click'], this, false);
    this._started = true;
  },

  /**
   * 브라우저 이벤트 리스너를 해제한다.
   * <p/>
   * 직접 호출하지는 않는다. 시스템 내부에서 호출한다. map이 stop될 때 내부적으로 호출된다.
   * @private
   */
  stop: function () {
    var browser = olleh.maps.browser;
    var events;

    this.unregistry(this._map);
    this._history = null;
    
    if (browser.isMobile) {
      this._removeEventsListener(document, ['touchstart', 'touchmove', 
        'touchend', 'touchcancel'], this, false);
    } else {
      this._removeEventsListener(document, ['mousedown', 'mouseup', 'mousemove'], this, false);
      if (this._desktopIE) {
        events = ['dragstart', 'contextmenu', this._mousewheel];
      } else {
        events = ['dragstart', 'selectstart', 'contextmenu', this._mousewheel, 'mouseout', 'mouseover'];
      }
      this._removeEventsListener(this._root, events, this, false);
    }
    this._removeEventsListener(window, ['resize'], this, false);
    this._removeEventsListener(this._root, ['click'], this, false);
    this._started = false;
  },
  
  /**
   * 이벤트 매니저가 현재 실행중인지 여부를 반환한다.
   * @returns {Boolean}
   */
  isStarted: function () {
    return !!this._started;
  },
  

  /**
   * {@link olleh.maps.event.EventDelegator} 객체를 EventManager의 hashmap에 등록한다.
   * <p/>
   * 직접 호출하지는 않는다. 시스템 내부에서 호출한다. {@link olleh.maps.event.EventDelegator#registerEvent}시점에 호출된다.
   * @param {olleh.maps.event.EventDelegator} delegator 등록할 EventDelegator 객체
   */
  registry: function (delegator) {
    var id = delegator.getId();
    this._hitTargets[id] = delegator;
  },
  
  /**
   * DOM element에 data-id, style class를 설정하고,
   * {@link olleh.maps.event.EventDelegator} 객체를 EventManager의 hashmap에 등록한다.
   * <p/>
   * 직접 호출하지는 않는다. 시스템 내부에서 호출한다. {@link olleh.maps.event.EventDelegator#registerEventDom}시점에 호출된다.
   * @param {olleh.maps.event.EventDelegator} delegator 등록할 EventDelegator 객체
   * @param {HTMLElement} elem 브라우저 이벤트를 받으려는 DOM element
   */
  registryDom: function (delegator, elem) {
    if (!elem) return;
    var id = delegator.getId();
    elem.setAttribute('data-id', id);
    olleh.maps.util.dom.addClass(elem, 'ollehmap-event');
    this._hitTargets[id] = delegator;
  },

  /**
   * DOM element에 data-id, style class를 해제한다.
   * <p/>
   * 직접 호출하지는 않는다. 시스템 내부에서 호출한다. {@link olleh.maps.event.EventDelegator#unregisterEventDom}시점에 호출된다.
   * @param {HTMLElement} elem 브라우저 이벤트를 해제하려는 DOM element
   */
  unregistryDom: function (elem) {
    if (elem) {
      elem.removeAttribute('data-id');
      olleh.maps.util.dom.removeClass(elem, 'ollehmap-event');
    }
  },

  /**
   * {@link olleh.maps.event.EventDelegator} 객체를 EventManager의 hashmap에서 해제한다.
   * <p/>
   * 직접 호출하지는 않는다. 시스템 내부에서 호출한다. {@link olleh.maps.event.EventDelegator#unregisterEvent}시점에 호출된다.
   * @param {olleh.maps.event.EventDelegator} delegator 해제할 EventDelegator 객체
   */
  unregistry: function (delegator) {
    this._hitTargets[delegator.getId()] = null;
    delete this._hitTargets[delegator.getId()];
  },

  /**
   * recognizer 객체를 반환한다.
   * @example
   * eventMgr.findRecognizer('olleh.maps.event.DoubleClickZoom');
   * @param {String} classname recognizer 클래스명
   * @returns {olleh.maps.event.Recognizer} recognizer 객체
   */
  findRecognizer: function (classname) {
    return this._recognizers[classname];
  },

  /**
   * event recognizer 객체를 추가한다.
   * @example
   * eventMgr.addRecognizer(new olleh.maps.event.DoubleClickZoom({dblrightclick: true}));
   * @param {olleh.maps.event.Recognizer} recognizer 객체
   * @see olleh.maps.event.Recognizer
   */
  addRecognizer: function (recognizer) {
    if (!recognizer || !recognizer.isMixinOf(olleh.maps.event.Recognizer)) 
      return;
    this._recognizers[recognizer.$classname] = recognizer;
  },

  /**
   * 등록되어 있는 recognizer 를 삭제한다.
   * @example
   * eventMgr.removeRecognizer('olleh.maps.event.DoubleClickZoom');
   * @param {String} classname recognizer 클래스명
   */
  removeRecognizer: function (classname) {
    this._recognizers[classname] = null;
    delete this._recognizers[classname];
  },
  
  /**
   * UIEvent(브라우저 이벤트)를 처리하기 위해 리스너를 등록한다.
   * @param {Object} from 리스링하기 위한 Object(window or DOM)
   * @param {Array.<string>} names 이벤트명에 대한 배열
   * @param {Function|Object} handler 이벤트 리스너, 
      <code>context</code>를 넘길 경우 <code>context#handleEvent</code>가 이벤트 리스너로 등록된다.
   * @param {Boolean} [capture=false] if true, handles event listeners 
   * on capture phase of DOM event propagation process.
   * @private
   */
  _addEventsListener: function (from, names, handler, capture) {
    var i = names.length;

    if (from.addEventListener) {
      capture = !!capture;
      handler = handler || this;
      while(i--) {
        from.addEventListener(names[i], handler, capture);
      }
    } else if (from.attachEvent) {
      if (handler === this || !handler) {
        !this._ieHandler && (this._ieHandler = this.handleEvent.bind(this));
        handler = this._ieHandler;
      } 
      while(i--) {
        from.attachEvent('on' + names[i], handler);
      }
    }
  },
  
  /**
   * UIEvent(브라우저 이벤트)를 처리하기 위해 리스너를 등록한다.
   * @param {Object} from 리스링하기 위한 Object(window or DOM)
   * @param {Array.<string>} names 이벤트명에 대한 배열
   * @param {Function|Object} handler 이벤트 리스너, 
      <code>context</code>를 넘길 경우 <code>context#handleEvent</code>가 이벤트 리스너를 해제한다.
   * @param {Boolean} capture if true, handles event listeners 
   * on capture phase of DOM event propagation process.
   * @private
   */
  _removeEventsListener: function (from, names, handler, capture) {
    var i = names.length;

    if (from.removeEventListener) {
      capture = !!capture;
      handler = handler || this;
      while(i--) {
        from.removeEventListener(names[i], handler, capture);
      }
    } else if (from.detachEvent) {
      (handler === this || !handler) && (handler = this._ieHandler); 
      while(i--) {
        from.detachEvent('on' + names[i], handler);
      }
    }
  },
  
  /**
   * 등록된 이벤트가 발생할 경우 처리작업을 수행한다.
   * <p/>
   * 이 메소드는 DOM객체를 통해 직접 이벤트를 리스닝하며 생성자에서 등록된 모든 이벤트들을 처리한다.
   * @param {UIEvent} domEvent 브라우저 이벤트 객체
   * @private
   */
  handleEvent: function (domEvent) {
    if (!this.isStarted()) {
      return;
    }
    var clazz = olleh.maps.event.EventManager;
    var domTarget = domEvent.target = (domEvent.target || domEvent.srcElement);  // ie7,8 srcElement
    
    domEvent = domEvent || window.event;
    this._prevDomEvent = this._domEvent;
    this._domEvent = domEvent;
    this._prevActiveElement = this._activeElement;
    this._activeElement = document.activeElement;
    
    if (this._prevDomEvent === domEvent) { // ie에서 발생하는 버그임. 이전 이벤트객체가 다시 발생함.
      return;
    }
    switch (domEvent.type) {
      case 'mousedown':
        return this.domMousedownEvent(domEvent);
      case 'mouseup':
        return this.domMouseupEvent(domEvent);
      case 'mousemove':
        //clazz.preventDefault(domEvent);
        return this.domMousemoveEvent(domEvent);
      case 'click':
        return this.domGenericEvent(domEvent);
      case 'mouseover':
        return this.domMouseoverEvent(domEvent);
      case 'mouseout':
        return this.domMouseoutEvent(domEvent);
      case 'resize':
        return this.domResizeEvent(domEvent, 'resize');
      case 'selectstart':
        if (domTarget.nodeType == 3 && domTarget.parentElement && 
            olleh.maps.util.dom.getStyle(domTarget.parentElement, 'userSelect') != 'none') { // webkit에서 드래그시에 cursor 버그 수정
          return;
        }
      case 'dragstart':
        clazz.preventDefault(domEvent);
        return;
      case 'contextmenu':
        return clazz.preventDefault(domEvent);
      case 'keydown':
      case 'keyup':
      case 'keypress':
        return this.domKeyboardEvent(domEvent);
      case 'touchstart':
      case 'touchmove':
      case 'touchend':
      case 'touchcancel':
        return this.handleTouchEvent(domEvent);
      case this._mousewheel:
        return this.domGenericEvent(domEvent, 'mousewheel');
      default:
        return this.domGenericEvent(domEvent);
    }
  },
  
  /**
   * mouseover DOM 이벤트를 처리한다. 
   * <p/>
   * 일반 DOM 이벤트를 받아 {@link olleh.maps.event.EventDelegator}객체가 처리할 수 있는
   * {@link olleh.maps.event.Event}객체를 생성한다음 이벤트를 발생시킨다.
   * @param {UIEvent} domEvent 브라우저 이벤트 객체
   * @returns {Boolean} 이벤트가 성공적으로 발생되었다면 true를 반환
   * @private
   */
  domMouseoverEvent: function (domEvent, name) {
    var hit = this.hitTarget(domEvent.target);
    
    if (!hit) {
      return;
    }
    var relatedTarget = this.hitTarget(domEvent.relatedTarget);
    
    if (relatedTarget && hit.target === relatedTarget.target) return;
    
    var event = new olleh.maps.event.Event(name || domEvent.type, hit.target, {
      originEvent: domEvent, targetDOM: hit.targetDOM, relatedTarget: relatedTarget
    });
    this.handleMapEvent(event);
  },
  
  /**
   * mouseout DOM 이벤트를 처리한다. 
   * <p/>
   * 일반 DOM 이벤트를 받아 {@link olleh.maps.event.EventDelegator}객체가 처리할 수 있는
   * {@link olleh.maps.event.Event}객체를 생성한다음 이벤트를 발생시킨다.
   * @param {UIEvent} domEvent 브라우저 이벤트 객체
   * @returns {Boolean} 이벤트가 성공적으로 발생되었다면 true를 반환
   * @private
   */
  domMouseoutEvent: function (domEvent, name) {
    var hit = this.hitTarget(domEvent.target);
    if (!hit) {
      return;
    }
    
    var relatedTarget = this.hitTarget(domEvent.relatedTarget);
    
    if (relatedTarget && hit.target === relatedTarget.target) return;
    
    var event = new olleh.maps.event.Event(name || domEvent.type, hit.target, {
      originEvent: domEvent, targetDOM: hit.targetDOM, relatedTarget: relatedTarget
    });
    this.handleMapEvent(event);
  },  
  
  /**
   * DOM 이벤트인 resize와 orientationchange 이벤트에 대해 map의 size가 변경되었을 때
   * resize이벤트를 발생시킨다. 
   * @param {UIEvent} domEvent DOM event
   * @param {String} name 이벤트 명
   * @private
   */
  domResizeEvent: function (domEvent, name) {
    var root = this._root;
    var map = this._map;
    var width = root.clientWidth || root.offsetWidth;
    var height = root.clientHeight || root.offsetHeight;
    var payload = {}; 
    
    if (olleh.maps.browser.hasOrientationChange) {
      payload.orientation = window.orientation;
    } 
    payload.width = width;
    payload.height = height;
    
    /**
     * 브라우저 윈도우의 크기가 변경될 때 발생하는 이벤트. (참고: 지도 객체의 크기가 변경될때는 이벤트가 발생하지 않는다.)
     * <p/>
     * <code>resize</code>이벤트는 target이 {@link olleh.maps.Map} 객체이다.
     * 이벤트가 발생하면 payload와 같이 전달된다.
     * @event olleh.maps.Map#event:resize
     * @param {olleh.maps.event.Event} event
     * @param {Object} payload
     * @param {Number} payload.width map viewport width
     * @param {Number} payload.height map viewport height
     * @param {Number} [payload.orientation] 모바일 브라우저인 경우 window.orientation 값을 전달
     */
    var event = new olleh.maps.event.Event(name, map, {originEvent: domEvent, 
      targetDOM: root});
    map.fireEvent(event, payload);
  },
  
  /**
   * @param {UIEvent} domEvent DOM event
   * @param {String} name 이벤트 명
   * @private
   */
  domMousedownEvent: function (domEvent, name) {
    if (this._desktopIE && this._hackDOM) { // desktop ie browser bug fix
      this._root.removeChild(this._hackDOM);
      this._hackDOM = null;
      delete this._hackDOM;
   }
    var doc = document;
    var event;
    var hit = this.hitTarget(domEvent.target);

    if (!hit) {
      this._clicked = false;
      this._removeEventsListener(doc, ['keyup','keydown','keypress'], this, false);
      return;
    }
    this._clicked = true;
    
    // Text selection 해제
    if (window.getSelection) {
      if (window.getSelection().empty) {  // Chrome
        window.getSelection().empty();
      } else if (window.getSelection().removeAllRanges) {  // Firefox
        window.getSelection().removeAllRanges();
      }
    } else if (document.selection) {  // IE
      document.selection.empty();
    }

    if (this._desktopIE) { // desktop ie browser address bar focus bug fix
      if (olleh.maps.event.EventManager.checkEnabledKeyevent()) {
        window.focus();
      } else {
        if (this._prevActiveElement && 
            this._prevActiveElement !== domEvent.target && 
            !olleh.maps.event.EventManager.checkEnabledKeyevent(this._prevActiveElement)) {
          this._prevActiveElement.blur();
        }
      }
    } 
    /**
     * keydown 이벤트. 키보드를 개체 위에서 눌렀을 때 발생한다.
     * @event olleh.maps.event.EventDelegator#event:keydown
     * @param {olleh.maps.event.Event} event
     */
    /**
     * keypress 이벤트. 키보드를 개체 위에서 눌렀다 놓았을 때 발생한다.
     * @event olleh.maps.event.EventDelegator#event:keypress
     * @param {olleh.maps.event.Event} event
     */
    /**
     * keyup 이벤트. 키보드를 개체 위에서 놓았을 때 발생한다.
     * @event olleh.maps.event.EventDelegator#event:keyup
     * @param {olleh.maps.event.Event} event
     */
    this._addEventsListener(doc, ['keyup','keydown','keypress'], this, false);

    event = new olleh.maps.event.Event(name || domEvent.type, hit.target, {
      originEvent: domEvent, targetDOM: hit.targetDOM
    });
    
    this.handleMapEvent(event);
  },
  
  /**
   * @param {UIEvent} domEvent DOM event
   * @param {String} name 이벤트 명
   * @private
   */
  domMouseupEvent: function (domEvent, name) {
    var doc = document;
    var hit = this.hitTarget(domEvent.target);
    if (!hit) {
      this._removeEventsListener(doc, ['keyup','keydown','keypress'], this, false);
      hit = this.hitTarget(this._root);
    }
    var event = new olleh.maps.event.Event(name || domEvent.type, hit.target, {
      originEvent: domEvent, targetDOM: hit.targetDOM
    });
    this.handleMapEvent(event);
  },
  
  /**
   * @param {UIEvent} domEvent DOM event
   * @param {String} name 이벤트 명
   * @private
   */
  domMousemoveEvent: function (domEvent, name) {
    if (this._desktopIE && this._hackDOM) { // desktop ie browser bug fix
      this._root.removeChild(this._hackDOM);
      this._hackDOM = null;
      delete this._hackDOM;
   }
    var hit = this.hitTarget(domEvent.target) || this.hitTarget(this._root);
    var event = new olleh.maps.event.Event(name || domEvent.type, hit.target, {
      originEvent: domEvent, targetDOM: hit.targetDOM
    });
    this.handleMapEvent(event);
    
    if (this._desktopIE) { // IE 브라우저에 대해서 mouseout, mouseover 이벤트 직접 처리함.
      var prevEvent = this._prevEvent;
      this._prevEvent = event;
      if (prevEvent && prevEvent.getSource() !== hit.target) {
        event = new olleh.maps.event.Event('mouseout', prevEvent.getSource(), {
          originEvent: prevEvent.originEvent, targetDOM: prevEvent.targetDOM, relatedTarget: prevEvent.getSource()
        });
        this.handleMapEvent(event);
      } 
      if (!prevEvent || prevEvent.getSource() !== hit.target) {
        domEvent.relatedTarget = prevEvent ? prevEvent.targetDOM : null;
        event = new olleh.maps.event.Event('mouseover', hit.target, {
          originEvent: domEvent, targetDOM: hit.targetDOM, relatedTarget: prevEvent ? prevEvent.getSource() : null
        });
        this.handleMapEvent(event);
      }
    }
  },
  
  /**
   * 일반 DOM 이벤트를 처리한다. 
   * <p/>
   * 일반 DOM 이벤트를 받아 {@link olleh.maps.event.EventDelegator}객체가 처리할 수 있는
   * {@link olleh.maps.event.Event}객체를 생성한다음 이벤트를 발생시킨다.
   * @param {UIEvent} domEvent 브라우저 이벤트 객체
   * @returns {Boolean} 이벤트가 성공적으로 발생되었다면 true를 반환
   * @private
   */
  domKeyboardEvent: function (domEvent) {
    var hit = {target: this._layerMgr, targetDOM: document};
    var event = new olleh.maps.event.Event(domEvent.type, hit.target, {
      originEvent: domEvent, targetDOM: hit.targetDOM});
   
    this.handleMapEvent(event);
  },
  
  /**
   * 일반 DOM 이벤트를 처리한다. 
   * <p/>
   * 일반 DOM 이벤트를 받아 {@link olleh.maps.event.EventDelegator}객체가 처리할 수 있는
   * {@link olleh.maps.event.Event}객체를 생성한다음 이벤트를 발생시킨다.
   * @param {UIEvent} domEvent 브라우저 이벤트 객체
   * @returns {Boolean} 이벤트가 성공적으로 발생되었다면 true를 반환
   * @private
   */
  domGenericEvent: function (domEvent, name) {
    var hit = this.hitTarget(domEvent.target);
    if (!hit) {
      return;
    }
    var event = new olleh.maps.event.Event(name || domEvent.type, hit.target, {
      originEvent: domEvent, targetDOM: hit.targetDOM
    });
    this.handleMapEvent(event);
  },
  
  /**
   * @param {UIEvent} domEvent 브라우저 event
   * @param {String} name 이벤트 이름
   * @private
   */
  handleTouchEvent: function (domEvent, name) {
    var type = domEvent.type;
    var target = domEvent.target;
    var touch = domEvent.changedTouches[0];
    var prevDomEvent = this._prevDomEvent;
    var browser = olleh.maps.browser;
    var hit = this.hitTarget(target);

    if (type === 'touchstart') {
      this._mousedown = !!hit;
      if (!this._mousedown) {
        return; 
      }
      // 이전 input, selectbox, textarea 요소가 focus된 상태에서 맵을 touchstart했을 때 blur 되도록 처리한다.(#1286) 
      if (this._prevActiveElement && 
          this._prevActiveElement !== domEvent.target && 
          !olleh.maps.event.EventManager.checkEnabledKeyevent(this._prevActiveElement)) {
        this._prevActiveElement.blur();
      }
    } else if (!this._mousedown){
      return;
    }

    // android 기본 브라우저인 경우 예외 처리 - os bug fix
    if (browser.hotfixAndroid) {
      // android longpress bug fix(touch-callout)
      if (type === 'touchstart' && domEvent.touches.length == 1) {
        olleh.maps.event.EventManager.preventDefault(domEvent);
      } else if (prevDomEvent.type === 'touchstart' && type === 'touchend' && 
          prevDomEvent.touches.length == 1 && !domEvent.touches.length && 
          domEvent.timeStamp - prevDomEvent.timeStamp < 750) { // touchstart 시점에 preventDefault로 인해 click이벤트가 발생하지 않아  직접 생성
          olleh.maps.util.defer(this.handleMapEvent, this, new olleh.maps.event.Event('click', hit.target, {
            targetDOM: hit.targetDOM,
            pageXY: new olleh.maps.Point(touch.pageX, touch.pageY),
            originEvent: domEvent 
          }));
      }
    } else if (browser.osName === browser.OS_NAME.ios &&
        prevDomEvent && prevDomEvent.type === 'touchend' && type === 'touchstart' && 
        !prevDomEvent.touches.length && prevDomEvent.changedTouches[0].identifier === touch.identifier) {
      // ios browser alert & confirm touchstart bug fix
      olleh.maps.event.EventManager.preventDefault(domEvent);
      this.handleMapEvent(new olleh.maps.event.Event('touchcancel', hit.target));
      return;
    }
    
    this.handleMapEvent(new olleh.maps.event.Event(name || type, hit.target, {
      targetDOM: hit.targetDOM,
      pageXY: new olleh.maps.Point(touch.pageX, touch.pageY),
      originEvent: domEvent, 
      touch: touch, 
      touches: domEvent.touches, 
      targetTouches: domEvent.targetTouches,
      changedTouches: domEvent.changedTouches
    }));
  },
  
  /**
   * 이벤트 시스템을 enable/disable시킨다. <p/>
   * 애니메이션 작업이 진행중에 사용자 이벤트를 처리하지 못도하독 하기 위해서는
   * 현재 동작중인 이벤트 시스템을 잠시 중지시킬 필요가 있다. 이때 이 메소드를
   * 활용한다.
   * @param {Boolean} value <code>false</code>일경우 event handling작업을 중지한다.
   */
  setEnable: function (value) {
    this._opts.enabled = !!value;
  },
  
  /**
   * DOM Tree 내에서 {@link olleh.maps.event.EventDelegator} 객체를 찾아내는 작업을 수행한다.
   * <p/>
   * 만약 존재하지 않으면 <code>null</code>을 반환한다.
   * ie 및 pointer-events를 지원하지 않는 브라우저에서도 사용할 수 있음.
   * 단 <code>document.elementFromPoint</code>를 지원해야함.
   * @param {HTMLElement} elem hit 테스트하기 위한 DOM Element 객체
   * @returns {{target: olleh.maps.event.EventDelegator, targetDOM: HTMLElement}}
   */
  hitTarget: function (elem) {
    var body = document.body;
    var domEvent = this._domEvent;
    var noPointerEvents = !olleh.maps.browser.hasPointerEvents;
    var hasClass = olleh.maps.util.dom.hasClass;
    var dom, parent, id, noevent, noevents = [], x, y, target, returnVal;
    var layerMgrElem = this._layerMgr._root_pane;
    
    if (!domEvent.target) return null;

    while (elem && elem !== window && elem !== body) {
      if (olleh.maps.isElement(elem)) {
        // pointer-events를 지원하지 않는 브라우저에 대한 처리
        if (noPointerEvents && hasClass(elem, 'ollehmap-noevent')) {
          elem = this._findAncestorNoEventDom(elem);
          parent = elem.parentElement || elem.parentNode;

          if (parent === layerMgrElem) {
            returnVal = {target: this._layerMgr, targetDOM: layerMgrElem};
            break;
          }
          
          if (noevents.length == 0) {
            x = domEvent.clientX; 
            y = domEvent.clientY;
          }
          noevents.push(elem);
          elem.style.visibility = 'hidden';
          elem = document.elementFromPoint(x, y);
          
          if (elem && (elem.nodeType === 3 || elem.tagName === 'svg')) { // Opera
            elem = elem.parentNode;
          }
          if (!elem) {
            returnVal = {target: this._layerMgr, targetDOM: layerMgrElem};
            break;
          }
        }
        
        id = elem.getAttribute('data-id');
        if (id) {
          dom = elem;
          break;
        }
      } 
      elem = elem.parentElement || elem.parentNode;
    }
    if (noPointerEvents) {
      while(noevent = noevents.pop()) {
        noevent.style.visibility = '';
      }
    }
    
    if (returnVal) {
      return returnVal;
    } else if (dom && id && (target = this._hitTargets[id])) {
      !('textContent' in dom) && dom.innerText && (dom.textContent = dom.innerText); // ie7,8 innerText
      return {target: target, targetDOM: dom}; 
    }
    return null;
  },
  
  /**
   * 지정된 <code>elem</code>의 ollehmap-noevent css class를 가지는 DOM Element를 찾는다.
   * @private
   */
  _findAncestorNoEventDom: function (elem) {
    var hasClass = olleh.maps.util.dom.hasClass;
    var noevent = elem;

    while((elem = elem.parentElement || elem.parentNode) && hasClass(elem, 'ollehmap-noevent')) {
      noevent = elem;
    }
    return noevent;
  },
  
  /**
   * 브라우저 이벤트를 받아 생성된 {@link olleh.maps.event.Event} 객체정보를 바탕으로
   * 등록되어 있는 {@link olleh.maps.event.Recognizer}에서 이벤트를 추적해서 반환된 정보를 통해
   * 추가적인 이벤트를 생성해서 hit target 객체에 전달한다. 
   * @param {olleh.maps.event.Event} event
   * @param {Object} [payload]
   * @param {Number} [delay]
   * @private
   */
  handleMapEvent: function (event, payload) {
    var resultSrc, recognizeredEvent, resultEvent; 
    var hit = event.getSource();
    var targetDOM = event.targetDOM;
    
    if (!hit) return;
    
    var mixin = olleh.maps.mixin;
    for(var key in this._recognizers){
      resultEvent = this._recognizers[key].handle(event);
      if (resultEvent) {
        resultSrc = resultEvent.src || hit;
        recognizeredEvent = new olleh.maps.event.Event(resultEvent.name, resultSrc, 
            mixin({targetDOM: targetDOM}, resultEvent.opts, true));
        resultSrc.fireEvent(recognizeredEvent, resultEvent.payload);
      }
    }
    
    if (!event._stopPropagation) {
      hit.fireEvent(event, payload);
    }
  },
  
  /**
   * 지도에 클릭되어 있는지 여부를 반환한다.
   * <p/>
   * 지도 밖을 클릭하게 되면 <code>false</code>를 반환한다.
   * 
   * @returns {Boolean}
   */
  isMapClicked: function () {
    return this._clicked;
  }
});
/**
 * 브라우저 이벤트가 발생했을 때 이벤트를 인지하기 위해 제공되는 기본 클래스이다.
 * <p/>
 * 해당 클래스는 직접 사용하지 않고 mixin을 한 클래스에서 이벤트 처리함수를 정의해서 사용한다.

 * <h3>KT맵에서 제공되는 기본 recognizer</h3>
 * <h5>공통적으로 제공되는 recognizer</h5>
 * <ul>
 *   <li>{@link olleh.maps.event.Drag}</li>
 * </ul>
 * <h5>데스크탑인 경우 제공되는 recognizer</h5>
 * <ul>
 *   <li>{@link olleh.maps.event.DoubleClickZoom}</li>
 *   <li>{@link olleh.maps.event.ScrollWheelZoom}</li>
 *   <li>{@link olleh.maps.event.KeyboardZoom}</li>
 * </ul>
 * <h5>모바일인 경우 제공되는 recognizer</h5>
 * <ul>
 *   <li>{@link olleh.maps.event.Pinch}</li>
 *   <li>{@link olleh.maps.event.DoubleTapZoom}</li>
 * </ul>
 * 
 * <h3>custom recognizer 구현하기</h3>
 * 브라우저 이벤트를 {@link olleh.maps.event.EventManager}가 {@link olleh.maps.event.Event} 객체로 생성한 것을
 * 받아 조건을 체크해서 만족했다면 추가적으로 새로운 {@link olleh.maps.event.Event} 객체를 생성할 수 있는 정보를 {@link olleh.maps.event.EventManager}에 반환한다.
 * <p/>
 * Recognizer는 브라우저 이벤트명에 해당하는 <code>function</code>을 정의해 해당 이벤트가 발생했을 때 처리한다.
 * 이 때 조건을 만족하면 추가적인 이벤트를 생성할 수 있는 정보 객체를 반환한다.
 * <p/>
 * 반환하는 정보는 다음과 같다.
 * <dl>
 *   <dt>name</dt><dd>생성할 이벤트명</dd>
 *   <dt>src</dt><dd>이벤트 발생한 타켓 객체</dd>
 *   <dt>payload</dt><dd>olleh.maps.Event 생성자 옵션</dd>
 * </dl>
 * @example
 * // custom recognizer
 * $class('foo').mixin(olleh.maps.event.Recognizer).define({
 *   mousedown: function (event) {
 *     olleh.maps.log(event.timStamp);
 *   }),
 *   
 *   click: function (event) {
 *     if (true) {
 *       return {
           name: 'fooClick' // 이벤트명
           payload: { // olleh.maps.event.Event 옵션
             originEvent: event.originEvent, 
             pageXY: event.pageXY
           }
        }
 *     }
 *   }
 *   ...
 * };
 * @summary 브라우저 이벤트가 발생했을 때 추가적인(drag, pinch 등) 이벤트를 인지하기 위해 제공되는 기본 클래스이다.
 */
$class('olleh.maps.event.Recognizer').define({
  /**
   * event를 처리하는 핸들러가 있는 경우 처리한다.
   * @param {olleh.maps.event.Event} event ollehmap event 객체
   * @private
   */
  handle: function (event) {
    if (!!this._disabled || event._stopPropagation) return;
    var func = this[event.getName()];
    return func && func.call(this, event);
  },

  /**
   * Recognizer 활성화를 설정한다.
   * <p/>
   * <code>false</code>이면 이벤트가 왔을 때 처리하지 않는다.
   * @param {Boolean} enabled Recognizer 활성화 여부
   */
  setEnabled: function (enabled) {
    this._disabled = !enabled;
  },

  /**
   * Recognizer 활성화 여부를 반환한다.
   * @returns {Boolean}
   */
  isEnabled: function () {
    return !this._disabled;
  }
});/**
 * 이벤트 처리를 구현한 클래스를 클래스 혹은 객체에 mixin 형태로 추가, 삭제하는 유틸성 메소드를 정의한다.
 * <p/>
 * 해당 모듈의 제공으로 이벤트 처리를 구현한 클래스를 mixin하는 클래스는 디바이스(데스크탑, 모바일)에 따라 혹은 옵션에 따라 이벤트 처리 구현체를
 * 쉽게 교체가 가능하다. 
 * <h3>event handler 구현</h3>
 * 구현 클래스는 {@link olleh.maps.event.Event}에 정의된 단계에 처리되는 함수를 다음과 같은 이름으로 정의한다.
 * <p/>
 * <dl>
 *   <dt>$capture_이벤트명</dt><dd>{@link olleh.maps.event.Event.CAPTURING_PHASE} 단계에서 제일 먼저 호출</dd>
 *   <dt>$current_이벤트명</dt><dd>{@link olleh.maps.event.Event.AT_TARGET}, {@link olleh.maps.event.Event.BUBBLING_PHASE} 단계에서 제일 먼저 호출</dd>
 *   <dt>$default_이벤트명</dt><dd></dd>{@link olleh.maps.event.EventDelegator#onEvent} <code>capture</code>값은 <code>false</code>로 등록한 리스너들이 다 수행한 후 맨 마지막에 호출</dd>
 * </dl>
 * @example
 * $class('olleh.maps.handler.Desktop').define({
 * 
 *   $capture_mousedown: function (event, payload) {
 *     olleh.maps.log.info(event.getName()); // mousedown
 *   },
 *
 *   $current_click: function (event, payload) {
 *     olleh.maps.log.info(event.getName()); // click
 *   },
 *
 *   $default_mousewheel: function (event, payload) {
 *     olleh.maps.log.info(event.timeStamp);
 *   }
 * });
 */
olleh.maps.namespace('olleh.maps.event.handler', {
  
  // TODO FIXME Handler Class 에서 직접 정의하지 않은 member 는 delegator 에 copy 하지 않도록 하기 위한 filter 역할
  _EXCLUDES: {$constructor: true, constructor: true, getClass: true, isMixinOf: true, currentStack : true, $classname: true},  

  /**
   * 이벤트에 대한 <code>$capture_</code>, <code>$current_</code>, <code>$default_</code>를 
   * {@link olleh.maps.event.EventDelegator} instance에 attach하거나, class에 attach한다.
   * <p/>
   * <code>instance</code>로 attach한 경우 반드시 <code>instance</code>로 {@link olleh.maps.event.handler.detach}해야한다.
   * 마찬가지로
   * <code>class</code>로 attach한 경우 반드시 <code>class</code>로 {@link olleh.maps.event.handler.detach}해야한다. 
   * @example
   * olleh.maps.event.handler.attach(olleh.maps.Map, olleh.maps.event.handler.Drag);
   * @example
   * var map = new olleh.maps.Map(div, opts);
   * olleh.maps.event.handler.attach(map, olleh.maps.event.handler.Drag);
   * @param {olleh.maps.event.EventDelegator | class} delegator  혹은 delegator class
   * @param {class} handlerClass
   * 이벤트가 발생하고 capture phase에서 {@link olleh.maps.event.EventDeleagtor#onEvent}로 등록한 리스너를 수행하기 전에 
   * 시스템 내부에서 처리하는 함수인 <code>$capture_</code>를 정의한다.
   * 이벤트가 발생하고 target, bubbling phase에서 {@link olleh.maps.event.EventDeleagtor#onEvent}로 등록한 리스너들이 수행하기 전에 
   * 시스템 내부에서 처리하는 함수인 <code>$current_</code>를 정의한다.
   * 이벤트가 발생하고 target, bubbling phase에서 {@link olleh.maps.event.EventDeleagtor#onEvent}로 등록한 리스너들이 수행하고 나서 마지막에
   * 시스템 내부에서 처리하는 함수인 <code>$default_</code>를 정의한다.
   * @see olleh.maps.event.handler.detach
   */
  attach: function (delegator, handlerClass) {
    if ( !delegator.isMixinOf || !delegator.isMixinOf(olleh.maps.event.EventDelegator)) {
      delegator = delegator.prototype;
    }
    handlerClass = handlerClass.prototype;
    
    var backup = delegator['$eventHandler'] || {};
    var fnName, originHandleFn;
    var Event = olleh.maps.event.Event;
    var events = delegator.$EVENTS;

    for(fnName in handlerClass) {
      if(this._EXCLUDES[fnName])
        continue;
      if(originHandleFn = delegator[fnName])
        backup[fnName] = originHandleFn;
      delegator[fnName] =  handlerClass[fnName];
      
      if (fnName.indexOf('$') != 0) {
        continue;
      }
      var eventName = null;
      if (fnName.indexOf('capture_') == 1) {
        eventName = fnName.substring(9);
        events[eventName] = events[eventName] | Event.CAPTURING_PHASE;
      } else if (fnName.indexOf('current_') == 1) {
        eventName = fnName.substring(9);
        events[eventName] = events[eventName] | Event.AT_TARGET;
      } else if (fnName.indexOf('default_') == 1) {
        eventName = fnName.substring(9);
        events[eventName] = events[eventName] | Event.DEFAULT_PHASE;
      }
    }
    delegator['$eventHandler'] = backup;
  },
  
  /**
   * 이벤트에 대한 <code>$capture_</code>, <code>$current_</code>, <code>$default_</code>를 
   * {@link olleh.maps.event.EventDelegator} instance에 detach하거나, class에 detach한다.
   * <p/>
   * <code>instance</code>로 attach한 경우 반드시 <code>instance</code>로 {@link olleh.maps.event.handler.detach}해야한다.
   * 마찬가지로
   * <code>class</code>로 attach한 경우 반드시 <code>class</code>로 {@link olleh.maps.event.handler.detach}해야한다. 
   * @example
   * olleh.maps.event.handler.detach(olleh.maps.Map, olleh.maps.event.handler.Drag);
   * @param {olleh.maps.event.EventDelegator | class} delegator  혹은 delegator class
   * @param {class} handlerClass
   * @see olleh.maps.event.handler.attach
   */
  detach: function (delegator, handlerClass) {
    if ( !delegator.isMixinOf || !delegator.isMixinOf(olleh.maps.event.EventDelegator)) {
      delegator = delegator.prototype;
    }
    handlerClass = handlerClass.prototype;
    
    var backup = delegator['$eventHandler'];
    
    for(var fnName in handlerClass) {
      if(this._EXCLUDES[fnName])
        continue;
      if(backup && backup[fnName]) {
        delegator[fnName] = backup[fnName];
        delete backup[fnName];
      } else {
        delete delegator[fnName];
      }
    }
  }
});
/**
 * Map의 각 corner DOM을 정의하는 클래스
 */
$class('olleh.maps.control.Corner').define({
  
  /**
   * 생성자, 새로운 Corner 객체를 생성한다.
   * @param {String} position <p/> 허용하는 값:
   *        <ul>
   *        <li>{@link olleh.maps.control.Control.BOTTOM_LEFT}</li>
   *        <li>{@link olleh.maps.control.Control.TOP_LEFT}</li>
   *        <li>{@link olleh.maps.control.Control.BOTTOM_RIGHT}</li>
   *        <li>{@link olleh.maps.control.Control.TOP_RIGHT}</li>
   *        </ul>
   */
  Corner: function (position) {
    var elem = olleh.maps.Element.create('div');

    this.elem = elem;
    this.ctrls = [];
    this.vAlign = position.indexOf('top') !== -1 ? 'top' : 'bottom';

    if (position.indexOf('left') !== -1) {
      this.hAlign = 'left';
      this.horizontalArea = this._createInnerDom();
      this.verticalArea = this._createInnerDom();
    } else {
      this.hAlign = 'right';
      this.verticalArea = this._createInnerDom();
      this.horizontalArea = this._createInnerDom();
      elem.elem.setAttribute('align', this.hAlign);
    }
    elem.addClass('ollehmap-corner');
    elem.addClass('ollehmap-noevent');
    elem.setStyle(this.vAlign, '0px');
    elem.setStyle(this.hAlign, '0px');
  },

  /**
   * 각 corner마다 방향에 따른 inner dom을 생성한다.
   * @private
   */
  _createInnerDom: function () {
    var elem = olleh.maps.Element.create('div');

    elem.addClass('ollehmap-corner-area');
    elem.setStyle('verticalAlign', this.vAlign);
    this.elem.pushElement(elem);
    return elem;
  }
});
/**
 * control의 position과 direction을 이용하여 자동으로 위치를 지정하는 역할을 담당한다.
 */
$class('olleh.maps.control.ControlManager').define({

  /**
   * 생성자, 새로운 ControlManager 객체를 생성한다.
   * @param {olleh.maps.Map} map
   */
  ControlManager: function (map) {
    this._ctrls = [];
    this._corners = [];
    this.map = map;
    this._defaultMargin = 5;

    var corners = this._corners;
    var cornerClass = olleh.maps.control.Corner;
    var ctrlClass = olleh.maps.control.Control;
    var positions = [ ctrlClass.TOP_LEFT, ctrlClass.TOP_RIGHT, ctrlClass.BOTTOM_LEFT, ctrlClass.BOTTOM_RIGHT ];
    var key, corner;
    var i = positions.length;
    var fragment = document.createDocumentFragment();

    while (i--) {
      key = positions[i];
      corner = new cornerClass(key);
      corners[key] = corner;
      fragment.appendChild(corner.elem.elem);
    }
    map.elem.appendChild(fragment);
  },

  /**
   * ControlManager가 관리하는 모든 control의 draw()를 호출 한다.
   */
  start: function () {
    this._started = true;
    var len = this._ctrls.length;
    this._opts = olleh.maps.util.clone(this.map.getOptions());
    for ( var i = 0; i < len; i++) {
      this.draw(this._ctrls[i]);
    }
  },

  /**
   * @private
   * @param {olleh.maps.control.Control} ctrl
   * @returns {String} className
   */
  _getCtrlClassName: function (ctrl) {
    var cn = ctrl.$classname;
    cn = cn.substring(cn.lastIndexOf('.') + 1);
    cn = cn.charAt(0).toLowerCase() + cn.substr(1);

    return cn;
  },

  /**
   * @returns {Boolean}
   */
  isStarted: function () {
    return !!this._started;
  },

  /**
   * 컨트롤 매니저에 해당 컨트롤을 추가한다.
   * @param {olleh.maps.control.Control} ctrl 추가할 컨트롤
   */
  add: function (ctrl) {
    this._ctrls.push(ctrl);
    ctrl.mgr = this;
    if (this.isStarted()) {
      this.draw(ctrl);
    }
  },

  /**
   * 해당 컨트롤을 구성한다.
   * @param {olleh.maps.control.Control} ctrl
   */
  draw: function (ctrl) {
    // map option 에 해당 컨트롤을 false 로 지정하면 그리지 않아야 한다.
    var opts = this._opts;
    var cn = this._getCtrlClassName(ctrl);
    var option = opts[cn + 'Options'];
    ctrl.start();
    option && olleh.maps.mixin(ctrl, option, true);

    ctrl.elem = ctrl.draw();
    ctrl.setDrawn(true);
    this._updatePosition(ctrl);
  },

  /**
   * 컨트롤의 위치를 업데이트한다.
   * @param {olleh.maps.control.Control} ctrl
   * @private
   */
  _updatePosition: function (ctrl) {
    var corner = this._corners[ctrl.position];
    var direction = ctrl.direction;
    var cornerDOM = corner[direction + 'Area'].elem;
    var container = olleh.maps.Element.create('div');
    var containerDOM = container.elem;

    corner.ctrls.push(ctrl);
    container.addClass('ollehmap-corner-container');
    container.pushElement(ctrl.elem.elem);
    if (direction === 'vertical') {
      if (corner.vAlign === 'bottom')
        cornerDOM.insertBefore(containerDOM, cornerDOM.firstChild);
      else
        cornerDOM.appendChild(containerDOM);
    } else {
      container.setStyle('verticalAlign', corner.vAlign);
      container.addClass('olleh-maps-inline');

      if (corner.hAlign === 'left')
        cornerDOM.appendChild(containerDOM);
      else
        cornerDOM.insertBefore(containerDOM, cornerDOM.firstChild);
    }
    if (corner.hAlign === 'right') {
      container.addClass('ollehmap-control-rightAlign');
      ctrl.elem.elem.setAttribute('align', 'left');
    }
    ctrl.left && container.setStyle('paddingLeft', ctrl.left + 'px');
    ctrl.right && container.setStyle('paddingRight', ctrl.right + 'px');
    ctrl.top && container.setStyle('paddingTop', ctrl.top + 'px');
    ctrl.bottom && container.setStyle('paddingBottom', ctrl.bottom + 'px');
    ctrl._containerDOM = container;
  },

  /**
   * 지정된 컨트롤을 삭제한다.
   * @param {olleh.maps.control.Control} ctrl 삭제할 컨트롤
   */
  remove: function (ctrl) {
    var ctrls = this._ctrls;
    olleh.maps.util.removeFromArray(ctrls, ctrl);
    ctrls = this._corners[ctrl.position].ctrls;
    olleh.maps.util.removeFromArray(ctrls, ctrl);

    if (this.isStarted()) {
      ctrl.destroy();
      ctrl._containerDOM && olleh.maps.util.dom.removeElements(ctrl._containerDOM.elem);
    }
    ctrl = null;
  },

  /**
   * 특정 class 에 해당되는 컨트롤을 모두 삭제한다.
   * @param {String} cls class명
   */
  removeByClass: function (cls) {
    var ctrls = this._ctrls;
    var i = ctrls.length;
    while (i--) {
      var ctrl = ctrls[i];
      if (ctrl instanceof cls) {
        ctrl.setMap(null);
      }
    }
  },

  /**
   * 특정 class 에 해당하는 첫번째 컨트롤을 반환한다. TODO service id 기반으로 참조할 수 있도록 변경
   * @param {String} cls class명
   * @returns {olleh.maps.control.Control}
   */
  findByClass: function (cls) {
    var ctrls = this._ctrls;
    var i = ctrls.length;
    while (i--) {
      var ctrl = ctrls[i];
      if (ctrl instanceof cls) {
        return ctrl;
      }
    }
  },

  stop: function () {
    var i = this._ctrls.length;
    while (i--) {
      this._ctrls[i].stop();
    }
    this._started = false;
  },

  /**
   * 모든 컨트롤을 삭제한다.
   */
  removeAll: function () {
    var ctrl, ctrls = this._ctrls;

    while (ctrl = ctrls.pop()) {
      ctrl.setMap(null);
    }
  }
});/**
 * ControlOptions Object Specification
 * @typedef olleh.maps.control.ControlOptions
 * @property {String} [direction] 컨트롤의 정렬 방향. <p/>허용하는 값:
 *           <ul>
 *           <li>{@link olleh.maps.control.Control.HORIZONTAL}</li>
 *           <li>{@link olleh.maps.control.Control.VERTICAL}</li>
 *           </ul>
 * @property {String} [position] 컨트롤의 위치. <p/>허용하는 값:
 *           <ul>
 *           <li>{@link olleh.maps.control.Control.BOTTOM_LEFT}</li>
 *           <li>{@link olleh.maps.control.Control.TOP_LEFT}</li>
 *           <li>{@link olleh.maps.control.Control.BOTTOM_RIGHT}</li>
 *           <li>{@link olleh.maps.control.Control.TOP_RIGHT}</li>
 *           </ul>
 * @property {Number} [right] control 기본 위치와의 오른쪽 거리 px
 * @property {Number} [left] control 기본 위치와의 왼쪽 거리 px
 * @property {Number} [top] control 기본 위치와의 위쪽 거리 px
 * @property {Number} [bottom] control 기본 위치와의 아래쪽 거리 px
 */

/**
 * 지도의 최상단에 지도를 컨트롤 하거나 정보를 나타낼 수 있는 객체이다.
 * TODO: olleh.maps.Initializable 상속
 */
$class('olleh.maps.control.Control').mixin(olleh.maps.event.EventDelegator, olleh.maps.Adaptable).define({

  $static: {
    /**
     * 좌측 하단을 나타내는 컨트롤의 position 값
     * @type String
     */
    BOTTOM_LEFT: 'bottom_left',

    /**
     * 우측 하단을 나타내는 컨트롤의 position 값
     * @type String
     */
    BOTTOM_RIGHT: 'bottom_right',

    /**
     * 좌측 상단을 나타내는 컨트롤의 position 값
     * @type String
     */
    TOP_LEFT: 'top_left',

    /**
     * 우측 상단을 나타내는 컨트롤의 position 값
     * @type String
     */
    TOP_RIGHT: 'top_right',

    /**
     * 가로방향을 나타내는 컨트롤의 direction 값
     * @type String
     */
    HORIZONTAL: 'horizontal',

    /**
     * 세로방향을 나타내는 컨트롤의 direction 값
     * @type String
     */
    VERTICAL: 'vertical',

    /**
     * @constant
     * @type String
     */
    //IMG_URL: '../../resources/img/controls.png'
    IMG_URL: olleh.maps.env.RESOURCE_URL + 'img/controls.png'
  },

  /**
   * 생성자, 새로운 Control 객체를 생성한다.
   * @param {Object} [opts] 생성자 옵션
   */
  Control: function (opts) {
    this.mgr;
    this.elem = null;
    this.padding = 5;
    this._isDrawn = false;
    this._opts = opts;
  },

  /**
   * 컨트롤을 start 시킨다.
   */
  start: function () {
    this._started = true;
    this.initOptions();
  },

  /**
   * 생성자 option 을 적용한다.
   * @private
   */
  initOptions: function () {
    olleh.maps.mixin(this, this._opts, true);
  },

  /**
   * 컨트롤을 stop 시킨다.
   */
  stop: function () {
    this._started = false;
  },

  /**
   * 컨트롤의 start 여부를 확인할 수 있다.
   * @returns {Boolean}
   */
  isStarted: function () {
    return !!this._started;
  },

  /**
   * 컨트롤의 위치를 지정한다. 컨트롤의 배치 우선순위는 최하위로 지정된다.
   * @param {String} position 위치 타입
   */
  setPosition: function (position) {
    this.position = position;
    if (this.isStarted()) {// isStarted로 변경??
      this.mgr.remove(this);
      this.mgr.add(this);
    }
  },

  /**
   * 컨트롤의 배치 방향을 지정한다. 컨트롤의 배치 우선순위는 최하위로 지정된다.
   * @param {String} direction 방향 타입
   */
  setDirection: function (direction) {
    this.direction = direction;
    if (this.isStarted()) {// isStarted로 변경??
      this.mgr.remove(this);
      this.mgr.add(this);
    }
  },

  attach: function () {
    this.mgr = this.map.controlMgr;
    this.mgr.add(this);
  },

  detach: function () {
    this.mgr.remove(this);
  },

  /**
   * Control이 지도에 그려진 상태인지 여부를 확인할 수 있다. 그려진 상태, 즉 {@link #draw}가 호출 된 다음 부터는
   * true를 반환하며 그려지지 않은 상태, 즉 {@link #draw} 호출 이전이나 {@link #destroy}가 호출 된 이후에는
   * false를 반환한다.
   * @returns {Boolean} isDrawn
   */
  isDrawn: function () {
    return this._isDrawn;
  },

  setDrawn: function (isDrawn) {
    this._isDrawn = isDrawn;
  },

  /**
   * 컨트롤을 그린다. 하위 클래스에서는 element를 생성해서 반환해야한다. 추가적으로
   * {@link olleh.maps.event.EventDelegator#registerEventDom} 을 사용해서 이벤트를 받을
   * element 를 등록하도록 한다.
   * @returns {olleh.maps.Element} 최상위 element
   */
  draw: function () {
    // Subclass should override this
  },

  /**
   * {@link olleh.maps.control.Control#draw} 에서 그려진 내용을 삭제한다. 하위 클래스에서는 생성된
   * element 를 pane 에서 제거하는 작업을 수행해야 한다. 추가적으로
   * {@link olleh.maps.event.EventDelegator#unregisterEvent}을 사용해서 이벤트 시스템에서 등록해지 한다.
   *
   * TODO: destroy -> erase: 다른 클래스와 동일한 구조로 하기 위해 erase로 이름 변경 필요
   * @private
   */
  destroy: function () {
    this.unregisterEvent();
    this.mgr = null;
    if (this.elem) {
      olleh.maps.util.dom.removeElements(this.elem.elem);
      this.elem = null;
    }
    this._isDrawn = false;
  },

  /**
   * Control 의 bubble target 은 Map이다.
   * @returns {olleh.maps.Map}
   * @see olleh.maps.event.EventDelegator#getBubble
   */
  getBubble: function () {
    return this.mgr.map;
  }
});
/**
 * @typedef olleh.maps.layer.LayerOptions
 * @property {String} [name] Layer 이름
 * @property {olleh.maps.Map} [map] Layer 가 추가될 지도 객체
 * @property {String} [layerType=base] Layer 유형.
 *        <p>허용값:
 *        <ul><li>"base" 지도에 base layer 로 추가된다. </li><li>"ground" 지도에 ground layer 로 추가된다.</li></ul>
 * @property {Number} [zIndex=0] ground layer 로 지도에 추가될 때 index. 
 *  명시하지 않을 경우 0 이며 같은 zIndex 로 지정된 layer 간의 순서는 보장되지 않는다.
 * @property {String} [label] 사용자에게 표시되는 라벨
 * @property {String} [group] PluginControl 에서 사용되는 group 이름
 * @property {Boolean} [autoActivate] ground layer 의 경우 true 값을 가지면 자동으로 activate 되어 지도에 나타난다.
 * @property {string} [copyright] CopyrightControl 에 출력될 문구를 지정한다. Layer 유형이 base 인 경우에만 사용된다.
 */

/**
 * Layer 는 지도 평면을 구성하는 계층 요소이다. <p/>
 * 다음과 같이 생성자 option 으로 layer 속성을 정의할 수 있다.
 * @example
 * new MyLayer({
 *  map: map,
 *  layerType: 'base' | 'ground',
 *  zIndex: 0,
 *  name: 'OllehMap',
 *  label: '일반지도',
 *  group: 'PluginGroup1'
 * });
 * <p/>
 * 다음과 같이 Layer 를 상속받는 클래스에서 layer 속성들을 정의할 수 있다.
 * @example
 *  $class('MyLayer').extend(olleh.maps.layer.Layer).define({
 *    MyLayer: function() {
 *     this.layerType = 'base';
 *     this.zIndex = 0;
 *     this.name = 'OllehMap';
 *     this.label = '일반지도';
 *     this.group = 'PluginGroup1';
 *    }
 *  
 */
$class('olleh.maps.layer.Layer').extend(olleh.maps.Initializable).mixin(olleh.maps.event.EventDelegator, olleh.maps.Plugin)
    .define({
      
      /**
       * Layer 가 지도에 추가되었을 때 발생하는 이벤트
       * @name event:added
       * @event
       * @memberOf olleh.maps.layer.Layer.prototype
       * @param {olleh.maps.event.Event} event
       */
      /**
       * Layer 가 지도에서 삭제되었을 때 발생하는 이벤트
       * @name event:removed
       * @event
       * @memberOf olleh.maps.layer.Layer.prototype
       * @param {olleh.maps.event.Event} event
       */
      
      /**
       * Layer 이름. LayerManager#getLayer() 를 통해 layer 를 찾을 때 사용된다.
       * @type String
       */
      name: 'Layer',
      
      /**
       * Layer 유형. base 또는 ground 이다.
       * @type String
       */
      layerType: 'ground',
      
      /**
       * Ground Layer 로 추가될 때 layer 계층에서 zIndex
       * @type Number
       */
      zIndex: 0,
      
      /**
       * 사용자에게 표시되는 라벨
       * @name olleh.maps.layer.Layer#label
       * @type String
       */
      /**
       * PluginControl 에서 사용되는 group 이름
       * @name olleh.maps.layer.Layer#group
       * @type String
       */
      /**
       * layer 에 대한 copyright 문구. Layer 유형이 base 인 경우에만 사용된다.  
       * @name olleh.maps.layer.Layer#copyright
       * @type String
       */
      /**
       * true 이면 지도에 추가될 때 자동으로 activate 된다.
       * true 가 아니면 Layer 생성시 setVisible(false) 가 호출된다. 
       * @name olleh.maps.layer.Layer#autoActivate
       * @type Boolean
       */
            
      /**
       * Layer 생성자
       * @param {olleh.maps.layer.LayerOptions} opts 생성 옵션
       */
      Layer: function (opts) {
        /**
         * Layer 가 추가된 LayerManager
         * @type olleh.maps.layer.LayerManager
         */
        this.layerMgr = null;
        
        this._constructorOpts = opts || {};
      },
      
      /**
       * 생성자 호출이 완료된 직후 자동으로 호출된다. 생성자 option 을 layer 속성에 적용한다.
       */
      init: function() {
        olleh.maps.mixin(this, this._constructorOpts, true, ['name','layerType','zIndex','label','group','autoActivate','copyright']);
        // layer 속성들을 pluginInfo 에 반영한다.
        var pluginInfo = {};
        this.label && (pluginInfo.label = this.label);
        if(this.layerType === 'base') {
          pluginInfo.group = '$baseLayer';
        } else if (this.group) {
          pluginInfo.group = this.group;
        }
        pluginInfo.autoActivate = this.autoActivate;
        !this.autoActivate && this.setVisible(false);
        this.setPluginInfo(pluginInfo);
        this._constructorOpts.map && this.setMap(this._constructorOpts.map);
        
        delete this._constructorOpts;
      },

      /**
       * Layer 의 bubble target 은 LayerManager 다.
       * @returns {olleh.maps.layer.LayerManager} 
       */
      getBubble: function () {
        return this.layerMgr;
      },

      /**
       * Layer 가 생성한 pane 을 return 한다. 하위 class 는 이 함수를 구현해야 한다.
       * @returns {HTMLElement}
       */
      getPane: function () {
        return null;
      },
            
      /**
       * Animation 효과없이 지도 중심점이 이동할때 호출된다.
       * @private 
       */
      move: function () {
        this.moveStart();
        this.moveEnd();
      },

      /**
       * Animation 효과와 함께 지도 중심점이 이동하는 경우 animation 시작전에 호출된다.
       * Animation 이 효과가 끝나면 moveEnd() 가 호출된다.
       * 만일 Animation 효과가 끝나기전에 다른 중심점으로 이동하게 되면
       * 새로운 animation 에 대한 moveStart() 는 호출되지만 이전 animation 에 대한
       * moveEnd() 는 호출되지 않는다.
       * @private   
       */
      moveStart: function () {

      },

      /**
       * Animation 효과와 함께 지도 중심점이 이동는 경우 animation 후에 호출된다.
       * @private
       */
      moveEnd: function () {

      },

      /**
       * Layer 를 그린다.
       * @param {Boolean} mapStart 지도가 처음 생성될 때 draw 호출이 발생하면 true 이고 그외의 경우는 false 이다.
       * @private  
       */
      draw: function (mapStart) {

      },

      /**
       * 줌 애니메이션이 시작될 때 LayerManager 가 호출해준다. Layer 를 구현하는 클래스는 origin을 중심으로 삼으며
       * scale배 만큼 크기가 변경되는 애니메이션을 구현해야 한다.
       * @param {Number} scale 배율
       * @param {olleh.maps.Point} origin 줌 애니메이션 중심점의 layer offset 기준 좌표
       * @param {Number} duration 줌 애니메이션이 수행되는 시간
       * @param {olleh.maps.fx.Pulse} [pulse] 펄스. 지정될 경우 줌 애니메이션이 펄스에 동기화된다.
       * @private
       */
      zoomStart: function (scale, origin, duration, pulse) {

      },

      /**
       * zoom 애니메이션이 끝나는 시점에 LayerManager 에서 일괄적으로 호출해준다.
       * @private
       */
      zoomEnd: function (oldZoom, newZoom) {

      },

      /**
       * layer 를 지도에 나타내거나 숨기기 위해 사용된다. <br>
       *  <br>
       * NOTE: Base Layer 는 LayerManager#setActiveBaseLayer(layer) 를 사용해서 숨기거나 보여진다.
       *  Base layer 에 대해 이 함수를 직접 호출하는 것은 의미가 없다. 
       * @param {Boolean} visible
       * @private
       */
      setVisible: function (visible) {

      },
      
      /**
       * layer 가 현재 화면에 보여지는지 여부
       * @returns {Boolean}
       * @private
       */
      isVisible: function () {

      },

      isVisibleForZoom: function () {
        return true;
      },
      
      /**
       * Layer 를 start 시킨다.
       * @private
       */
      start: function () {
        this._started = true;
      },

      /**
       * Layer 를 stop 시킨다.
       * @private
       */
      stop: function () {
        this._started = false;
      },

      /**
       * Layer 의 start 여부를 확인할 수 있다.
       * @returns {Boolean}
       * @private
       */
      isStarted: function () {
        return !!this._started;
      },
      
      /**
       * base layer 이면 LayerManager 를 통해 active base layer 를 변경하고, ground layer 인 경우는 draw() 호출후 setVisible(false) 를 호출한다. 
       * @private
       */
      doActivate: function() {
        this.setVisible(true);
        if(this.layerType === 'base') {
          this.layerMgr.setActiveBaseLayer(this);
        } else if(this.layerMgr.isStarted()){
          this.draw();
        }
      },

      /**
       * active 상태가 바뀌면 visible 상태도 같이 바꿔준다.
       * @param active
       * @private
       */
      setActive: function(active) {
        this.setVisible(active);
        olleh.maps.Plugin.prototype.setActive.call(this, active);        
      },
      
      /**
       * Layer 활성화 여부를 반환한다.  
       * @returns {Boolean}
       */
      isActive: function() {
        if(!this.layerMgr)
          return false;
        if(this.layerType === 'base') {
          return this.layerMgr.getActiveBaseLayer() === this;
        }
        return this.isVisible();
      },
      
      attach: function() {
        this.map.layerMgr.addLayer(this);
      },
      
      detach: function() {
        this.map.layerMgr.removeLayer(this);
      }

    });
/**
 * LayerManager 는 Layer 들을 관리할 뿐만 아니라 지도의 핵심 기능을 처리한다. 
 */
$class('olleh.maps.layer.LayerManager').mixin(olleh.maps.event.EventDelegator).define({

  $static: {
    /**
     * 줌 값에 대한 resoultion 을 반환한다.
     * @param zoom
     * @private
     */
    getResolutionForZoom: function (zoom) {
      return 2048 / Math.pow(2, zoom);
    }
  },

  defaultOpts: {
    zoom: 7,
    minZoom: 0,
    maxZoom: 13,
    maxExtent: null,
    panAnimDuration: 1.0, // panTo() 호출시 적용. 드래그/터치를 사용한 패닝에는 적용되지 않음
    zoomAnimDuration: 0.2, // zoomIn()/zoomOut()/zoomTo() 호출시 적용
    useCSSTransform: true
  },

  /**
   * 줌 변경 애니메이션이 시작될 때 발생하는 이벤트.
   * 줌 애니메이션이 일어나지 않고 바로 새로운 줌으로 draw 되는 경우에는 zoom_change 이벤트는 발생하지 않는다. 
   * @name event:zoom_change
   * @event
   * @memberOf olleh.maps.layer.LayerManager.prototype
   * @param {olleh.maps.event.Event} event
   * @param {Object} payload
   * @param {Number} payload.oldZoom 변경 전 줌
   * @param {Number} payload.newZoom 변경 후 줌
   * @param {olleh.maps.Point} payload.origin 줌 애니메이션 원점
   * @param {Number} payload.duration 줌 애니메이션 지속 시간
   * @param {Number} payload.scale 변경전 대비 비율
   * @see olleh.maps.layer.Layer#event:zoom_changed
   */
  /**
   * 최대/최소줌이 변경되었을때 발생하는 이벤트
   * @name event:zoomrange_changed
   * @event
   * @memberOf olleh.maps.layer.LayerManager.prototype
   * @param {olleh.maps.event.Event} event
   */
  /**
   * 지도의 중심 좌표가 변경되었을때 발생하는 이벤트
   * @name event:center_changed
   * @event
   * @memberOf olleh.maps.layer.LayerManager.prototype
   * @param {olleh.maps.event.Event} event
   * @param {Object} payload
   * @param {olleh.maps.UTMK} payload.oldCenter 변경전 중심점
   * @param {olleh.maps.UTMK} payload.newCenter 변경후 중심점
   */
  /**
   * 줌 변경이 완료된 후 발생하는 이벤트
   * @name event:zoom_changed
   * @event
   * @memberOf olleh.maps.layer.LayerManager.prototype
   * @param {olleh.maps.event.Event} event
   * @param {Object} payload
   * @param {olleh.maps.UTMK} payload.oldZoom 변경전 줌
   * @param {olleh.maps.UTMK} payload.newZoom 변경후 줌
   * @see olleh.maps.layer.Layer#event:zoom_change
   */
  /**
   * 화면에 보여지는 영역이 변경되었을 때 발생하는 이벤트
   * center_changed 또는 zoom_changed 이벤트 발생 직후 발생 된다.
   * @name event:bounds_changed
   * @event
   * @memberOf olleh.maps.layer.LayerManager.prototype
   * @param {olleh.maps.event.Event} event
   */
  /**
   * {@link olleh.maps.layer.Layer#start} 를 호출해 LayerManager 가 시작될때 발생하는 이벤트
   * @name event:started
   * @event
   * @memberOf olleh.maps.layer.LayerManager.prototype
   * @param {olleh.maps.event.Event} event
   */
  /**
   * 최초 맵 로드 후, 바운즈 변경 후, 줌/팬 완료 후 등 지도가 대기 상태로 접어들었을 때 발생하는 이벤트
   * 연속적으로 동작이 이루어질 경우 완료 시점에 한 번만 발생한다.
   * @name event:idle
   * @event
   * @memberOf olleh.maps.layer.LayerManager.prototype
   * @param {olleh.maps.event.Event} event
   */
  /**
   * 생성자 
   * @param {olleh.maps.Map} map Map 객체
   * @param {Element} elem Map 이그려질 HTML element
   */
  LayerManager: function (map, elem) {
    if (map === null)
      throw new Error('map is null');

    this._center = null;
    this._zoom = null;
    this._minZoom = null;
    this._maxZoom = null;

    this._map = map;
    this._mapElem = elem;
    this._viewportSize = null;
    this._viewportOffset = null; // 지도 viewport 위치 (브라우저 좌표)

    this._layerOffset = new olleh.maps.Point(0, 0); // root_pane offset. move 오퍼레이션을 수행하면 layerOffset 이 변경된다.
    this._pendingZoom = null; // 줌애니메이션 수행되는동안 유효하며 애니메이션 완료 후 zoom 값
    this._pendingCenter = null; // 줌애니메이션 수행되는동안 유효하며 애니메이션 완료 후 center
    this._isZooming = false; // 줌애니메이션 수행중인지 여부

    this._baseLayers = [];
    this._groundLayers = [];
    this._activeBaseLayer = null;
    this._overlayLayer = null;

    this._root_pane = null;
    this._transparent_pane = null;
    this._layer_container = null;

    this._panAnimTiming = null;
  },

  /**
   * LayerManager 의 bubble 은 Map 이다.
   * @returns {olleh.maps.Map}
   * @private
   */
  getBubble: function () {
    return this._map;
  },

  /**
   * Map 객체를 반환한다.
   * @returns {olleh.maps.Map}
   */
  getMap: function () {
    return this._map;
  },

  // ////////////////////
  // Pane Managements //
  // ////////////////////
  _initPanes: function () {
    var layer_container = this._createPane('layer_container', 0);

    this._layer_container = layer_container;
    olleh.maps.util.dom.setStyles(layer_container, {
      width: '100%',
      height: '100%'
    });
    this._mapElem.appendChild(layer_container);
    this._root_pane = this._createPane('root_pane', 0);
    layer_container.appendChild(this._root_pane);

    var transparent_pane = this._createPane('transparent_pane', 99999);
    this._transparent_pane = transparent_pane;
    layer_container.appendChild(transparent_pane);
    olleh.maps.util.dom.setStyles(transparent_pane, {
      width: '100%',
      height: '100%',
      display: 'none'
    });
    olleh.maps.util.dom.addClass(this._transparent_pane, 'ollehmap-transparent');
  },

  _createPane: function (id, zIndex) {
    var pane = document.createElement('div');
    pane.id = id;
    pane.style.position = 'absolute';
    if (olleh.maps.isNumber(zIndex)) {
      pane.style.zIndex = zIndex;
    }
    return pane;
  },

  // /////////////////////
  // Layer Managements //
  // /////////////////////

  /**
   * Layer 를 추가한다. <p/>
   * NOTE: Layer 를 지도에 추가할때에는{@link olleh.maps.layer.Layer#setMap(map)} 을 사용하도록 한다.
   * @private  
   */
  addLayer: function (layer) {
    if (layer.layerType === 'base') {
      this.addBaseLayer(layer);
    } else {
      this.addGroundLayer(layer, layer.zIndex);
    }
  },

  /**
   * base layer 를 추가한다.
   * @param {olleh.maps.layer.Layer} layer 추가할 Layer
   * @private
   */
  addBaseLayer: function (layer) {
    layer.layerMgr = this;
    layer.setVisible(false);
    layer.getPane().style.zIndex = '-2';
    this._baseLayers.push(layer);

    var addBaseLayer = function () {
      !layer.isStarted() && layer.start();
      var pane = layer.getPane();
      this._root_pane.insertBefore(pane, this._root_pane.firstChild);
      this.unsubscribeEvent('started', addBaseLayer);
      layer.fireEvent('added');
    };
    if (this.isStarted()) {
      addBaseLayer.call(this);
      if (!this._activeBaseLayer) {
        this.setActiveBaseLayer(layer);
      }
    } else {
      this.onEvent('started', addBaseLayer, this);
    }
  },

  /**
   * ground layer 를 zIndex 위치에 추가한다. zIndex 의 크기가 z-index 값에 반영된다.
   * 즉, zIndex 가 클수록 지도 계층의 위쪽에 올라가게 된다.
   * @param {olleh.maps.layer.Layer} layer
   * @param {Number} zIndex
   * @private
   */
  addGroundLayer: function (layer, zIndex) {
    layer.layerMgr = this;
    layer.getPane().style.zIndex = zIndex;
    this._groundLayers.push(layer);

    var addGroundLayer = function () {
      !layer.isStarted() && layer.start();
      var pane = layer.getPane();
      pane.style.position = 'absolute';
      this._root_pane.appendChild(pane);
      if (layer.isVisible()) {
        layer.draw();
      }
      this.unsubscribeEvent('started', addGroundLayer);
      layer.fireEvent('added');
    };
    if (this.isStarted()) {
      addGroundLayer.call(this);
    } else {
      this.onEvent('started', addGroundLayer, this);
    }
  },

  /**
   * layer 를 삭제한다.
   * @param {olleh.maps.layer.Layer | String} layer 삭제할 layer 객체 또는 name
   * @private
   */
  removeLayer: function (layer) {
    if (olleh.maps.isString(layer)) {
      layer = this.getLayer(layer);
    }
    layer.layerMgr = null;
    if (this.isStarted()) {
      var pane = layer.getPane();
      if (pane && pane.parentNode)
        pane.parentNode.removeChild(pane);
      layer.fireEvent('removed');
    }
    var idx = olleh.maps.util.removeFromArray(this._groundLayers, layer);
    idx === -1 && olleh.maps.util.removeFromArray(this._baseLayers, layer);
  },

  /**
   * 지정된 name 해당하는 layer 객체를 반환한다.
   * @param {String} layerName Layer name
   * @private
   */
  getLayer: function (layerName) {
    var i, len, layer;

    for (i = 0, len = this._baseLayers.length; i < len; i++) {
      layer = this._baseLayers[i];
      if (layer.name === layerName)
        return layer;
    }
    for (i = 0, len = this._groundLayers.length; i < len; i++) {
      layer = this._groundLayers[i];
      if (layer.name === layerName)
        return layer;
    }
    if (layerName === 'olleh.maps.overlay.OverlayLayer') {
      return this._overlayLayer;
    }
  },

  /**
   * LayerManager 에 등록된 base layer 들을 반환한다.
   * @returns {Array.<olleh.maps.layer.Layer>} Base Layer 배열
   * @private
   */
  getBaseLayers: function () {
    return this._baseLayers;
  },

  /**
   * LayerManager 에 등록된 ground layer 배열을 반환한다.
   * @returns {Array.<olleh.maps.layer.Layer>} Ground Layer 배열
   * @private
   */
  getGroundLayers: function () {
    return this._groundLayers;
  },

  /**
   * OverlayLayer 를 반환한다.
   * @returns {olleh.maps.overlay.OverlayLayer}
   * @private
   */
  getOverlayLayer: function () {
    return this._overlayLayer;
  },

  /**
   * active base layer 를 변경한다.
   * @param {olleh.maps.layer.Layer | String} layer
   * @private
   */
  setActiveBaseLayer: function (layer) {
    if (olleh.maps.isString(layer)) {
      layer = this.getLayer(layer);
    }

    if (this._activeBaseLayer !== layer) {
      var oldLayer = this._activeBaseLayer;
      this._activeBaseLayer = layer;
      layer.getPane().style.zIndex = '-1';
      layer.setActive(true);
      if (this.isStarted()) {
        if (oldLayer) {
          if (layer instanceof olleh.maps.layer.TileLayer) {
            oldLayer.getPane().style.zIndex = '-2';
            this._hideLayerFn = function () {

              // 지도 레이어의 모든 작업이 완료되는 'loaded'의 이벤트가 발생하고 아래의 함수가 호출 된다.
              // 함수는 클로저 형태의 함수로 처음 함수 선언 시 oldLayer의 값을 함수안에 가지고 있다.
              // 지도 레이어의 모든 작업이 완료도 되기 전에 지도 레이어의 타입이 변경되면,
              // 기존의 oldlLayer가 현재의 Layer가 된다.
              // 그러면서 현재 활성화가 되어야 할 Layer를 비활성화 하면서 문제가 발생
              // 아래와 같이 비교문을 사용하여 oldLayer.setActive(false)가 실행 되도록 변경
              if(oldLayer.getPane().style.zIndex == '-2') oldLayer.setActive(false);
              
              layer.unsubscribeEvent('loaded', this._hideLayerFn, this);
              this._hideLayerFn = null;
            };
            layer.onEvent('loaded', this._hideLayerFn, this);
          } else {
            oldLayer.setActive(false);
          }
        }
        var minMaxZoomChanged = this._updateMinMaxZoom();
        var zoom = Math.min(Math.max(this._zoom, this._minZoom),
          this._maxZoom);
        if (zoom !== this._zoom) {
          this.moveTo(null, zoom, 'redraw');
        } else {
          this._activeBaseLayer.draw();
        }
        if (minMaxZoomChanged)
          this.fireEvent('zoomrange_changed');
      } else /* if(!this.isStarted()) */ {
        if (oldLayer) {
          oldLayer.setActive(false);
        }
      }
    }
    this.fireEvent('set_base_layer');
  },

  /**
   * 지도의 minZoom을 변경한다.
   * @param {number} minZoom 최소줌
   */
  setMinZoom: function (minZoom) {
    if (this.isStarted()) {
      this._opts.minZoom = minZoom;
      this._updateZoomRange();
    }
  },

  /**
   * 지도의 maxZoom을 변경한다.
   * @param {number} maxZoom 최대줌
   */
  setMaxZoom: function (maxZoom) {
    if (this.isStarted()) {
      this._opts.maxZoom = maxZoom;
      this._updateZoomRange();
    }
  },

  /**
   * Active base layer 로부터 minZoom/maxZoom을 업데이트한다. 필 
   * @private
   */
  _updateZoomRange: function () {
    var minMaxZoomChanged = this._updateMinMaxZoom();
    var zoom = Math.min(Math.max(this._zoom, this._minZoom),
      this._maxZoom);
    if (zoom !== this._zoom) {
      this.moveTo(null, zoom, 'redraw');
    }
    if (minMaxZoomChanged)
      this.fireEvent('zoomrange_changed');

  },

  /** 
   * active base layer 로 부터 minZoom/maxZoom 값을 업데이트 한다.
   * @returns {Boolean} minZoom/maxZoom 변경 여부
   * @private 
   */
  _updateMinMaxZoom: function () {
    var layer = this._activeBaseLayer;
    // Map에서 지정한 maxZoom 변수에 입력 (add code r2fresh)
    var mapMaxZoom = this._map.getOptions().maxZoom;
    var newMinZoom = this._opts.minZoom;
    // mapMaxZoom의 유무에 따라 newMaxZoom의 값 변경 (modify code r2fresh)
    var newMaxZoom = (mapMaxZoom && mapMaxZoom <= 15) ? mapMaxZoom : this._opts.maxZoom;

    if (olleh.maps.isNumber(layer.minZoom)) {
      newMinZoom = Math.max(layer.minZoom, newMinZoom);
    }

    // mapMaxZoom의 유무에 따라 newMaxZoom에 min값을 입력하는 것을 실행을 결정 (modify code r2fresh)
    if (olleh.maps.isNumber(layer.maxZoom) && !(mapMaxZoom && mapMaxZoom <= 15)) {
      newMaxZoom = Math.min(layer.maxZoom, newMaxZoom);
    }

    var minMaxZoomChanged = false;
    if (newMinZoom !== this._minZoom || newMaxZoom !== this._maxZoom) {
      this._minZoom = newMinZoom;
      this._maxZoom = newMaxZoom;
      minMaxZoomChanged = true;
    }
    return minMaxZoomChanged;
  },


  /**
   * active base layer 를 반환한다.
   * @returns {olleh.maps.layer.Layer}
   * @private
   */
  getActiveBaseLayer: function () {
    return this._activeBaseLayer;
  },

  // //////////////////
  // Map Operations //
  // //////////////////

  /**
   * 지정된 영역에 가장 근접한 줌 레벨을 반환한다.
   * @param {olleh.maps.Bounds} bounds 사각형 지도 영역
   * @returns {Number}
   * @private
   */
  getZoomForBounds: function (bounds) {
    bounds = bounds.transform(olleh.maps.UTMK);
    var zoom = this._minZoom;
    var width = bounds.getWidth();
    var height = bounds.getHeight();
    for (; zoom <= this._maxZoom; zoom++) {
      var coordSize = this._getCoordSizeForZoom(zoom);
      if (coordSize.width < width || coordSize.height < height)
        return zoom === this._minZoom ? this._minZoom : zoom - 1;
    }
    return zoom;
  },

  /**
   * coord 가 현재 지도 영역(bounds) 에 포함되는지를 확인한다.
   * @param {olleh.maps.Coord} coord
   * @returns {Boolean}
   * @private
   */
  isValidCoord: function (coord) {
    var bounds = this.getBounds();
    return bounds.contains(coord);
  },

  /**
   * 추가된 모든 layer 를 start 하고 초기 center 와 zoom 값으로 draw 를 한다.
   * 'started' 이벤트를 발생시킨다.
   * @private
   */
  start: function () {
    var opts = olleh.maps.util.clone(this.defaultOpts);
    var i, len;

    opts = olleh.maps.mixin(opts, this._map.getOptions(), true);
    this._opts = opts;

    this._minZoom = opts.minZoom;
    this._maxZoom = opts.maxZoom;
    this._viewportSize = new olleh.maps.Size(this._mapElem.clientWidth, this._mapElem.clientHeight);
    this._viewportOffset = olleh.maps.util.dom.getXY(this._mapElem);
    this._disableLoadingWhilePanning = this._map.getOption('disableLoadingWhilePanning', false);

    if (!this._center && this._initialBounds) {
      var bounds = this._initialBounds;
      this._center = bounds.getCenter();
      this._zoom = this.getZoomForBounds(bounds);
      delete this._initialBounds;
    }

    // start 되기 전에 setCenter() 와 setZoom() 으로 값이 지정될 수 있다.
    !this._center && (this._center = opts.center.asDefault());
    !olleh.maps.isNumber(this._zoom) && (this._zoom = +opts.zoom);

    this._panAnimTiming = new olleh.maps.fx.timing.CubicBezier(0, opts.panAnimEaseLinearity1, opts.panAnimEaseLinearity2, 1);
    this._zoomPulse = olleh.maps.browser.usePulseForZoom ? new olleh.maps.fx.Pulse(opts.zoomAnimDuration) : false;

    this._initPanes();

    this._updateMinMaxZoom();
    if (opts.overlayLayer) {
      this._overlayLayer = opts.overlayLayer;
      this._overlayLayer.map = this._map; // OverlayLayer 가 Adaptable type 이므로 map 을 지정해주어야 함
      this._overlayLayer.layerMgr = this;
      var panes = this._overlayLayer.panes;
      for (var k in panes) {
        this._root_pane.appendChild(panes[k]);
      }
    }
    this.registerEventDom(this._layer_container);

    for (i = 0, len = this._baseLayers.length; i < len; i++) {
      this._baseLayers[i].start();
    }
    for (i = 0, len = this._groundLayers.length; i < len; i++) {
      this._groundLayers[i].start();
    }
    this._overlayLayer && this._overlayLayer.start();

    if (this._disableLoadingWhilePanning) {
      var backgroundLayer = new olleh.maps.layer.BackgroundLayer();
      backgroundLayer.layerMgr = this;
      backgroundLayer.start();
      var pane = backgroundLayer.getPane();
      this._root_pane.appendChild(pane);
      this._backgroundLayer = backgroundLayer;
    }

    this._started = true;
    if (this._center)
      this.moveTo(this._center, this._zoom, 'redraw');
    this.fireEvent('started');
  },

  /**
   * 모든 layer 들을 stop 시킨다.
   * @private
   */
  stop: function () {
    var i, len;
    for (i = 0, len = this._baseLayers.length; i < len; i++) {
      this._baseLayers[i].stop();
    }
    for (i = 0, len = this._groundLayers.length; i < len; i++) {
      this._groundLayers[i].stop();
    }
    this._overlayLayer && this._overlayLayer.stop();
    this.unregisterEvent();
    this._started = false;
  },

  /**
   * 시작 여부를 반환한다.
   * @returns {Boolean}
   * @private
   */
  isStarted: function () {
    return !!this._started;
  },

  /**
   * 현재 지정된 줌에 대한 resolution 을 반환한다.
   * TODO resolution 계산 공식은 tile spec 에 따라 달라질 수 있음을 고려해야 한다. 
   * TODO coord <-> point 변환 클래스를 따로 만들어서 교체할 수 있도록 지원
   * @returns {Number}
   * @private
   */
  getResolution: function () {
    return 2048 / Math.pow(2, this._zoom);
  },

  /**
   * Viewport size 를 반환한다.
   * @returns {olleh.maps.Size}
   * @private
   */
  getViewportSize: function () {
    return this._viewportSize;
  },

  /**
   * viewport 기준 중심점을 반환한다.
   * @returns {olleh.maps.Point}
   * @private
   */
  getViewportCenter: function () {
    return new olleh.maps.Point(Math.floor(this._viewportSize.width / 2), Math.floor(this._viewportSize.height / 2));
  },

  /**
   * Viewport pixel 을 반환한다.
   * @returns {olleh.maps.Point} x 프로퍼티는 left, y 프로퍼티는 top 에 해당
   * @private
   */
  getViewportOffset: function () {
    return this._viewportOffset;
  },

  /**
   * 특정 줌에 대한 viewport size 를 UTMK 좌표 영역으로 반환한다.
   * @param {Number} zoom
   * @private 
   */
  _getCoordSizeForZoom: function (zoom) {
    var resolution = olleh.maps.layer.LayerManager.getResolutionForZoom(zoom);
    return this._viewportSize.multiplyBy(resolution);
  },

  /**
   * Layer offset 를 반환한다.
   * @returns {olleh.maps.Point}
   * @private
   */
  getLayerOffset: function () {
    return this._layerOffset;
  },

  /**
   * Viewport top-left 지점 UTMK 좌표를 계산한다.
   * @param {boolean} [afterZoom] true 로 지정하면 줌 애니메이션 동안에는 줌이 끝난 다음 기준으로 계산
   * @returns {olleh.maps.UTMK}
   * @private
   */
  _getCoordOrigin: function (afterZoom) {
    if (!this._center)
      throw new Error('Center must be specified.');
    var zoom = afterZoom ? this.getPendingZoom() : this._zoom;
    var center = afterZoom ? this.getPendingCenter() : this._center;
    var coordSize = this._getCoordSizeForZoom(zoom);
    var x = center.x - coordSize.width / 2;
    var y = center.y + coordSize.height / 2;
    return new olleh.maps.UTMK(x, y);
  },

  /**
   * 지도 좌표를 viewport pixel 좌표로 변환한다.
   * @param {olleh.maps.Coord} coord 변환할 지도 좌표
   * @param {boolean} [afterZoom=true] true 로 지정하면 줌 애니메이션 동안에는 줌이 끝난 다음 기준으로 계산
   * @returns {olleh.maps.Point} 변환된 viewport pixel 좌표
   */
  getViewportPxFromCoord: function (coord, afterZoom) {
    afterZoom = afterZoom !== false;
    coord = coord.asDefault();
    var coordOrigin = this._getCoordOrigin(!!afterZoom);
    var dx = coord.x - coordOrigin.x;
    var dy = coordOrigin.y - coord.y;
    var zoom = afterZoom ? this.getPendingZoom() : this._zoom;
    var resolution = olleh.maps.layer.LayerManager.getResolutionForZoom(zoom);
    return new olleh.maps.Point(dx / resolution, dy / resolution)._round();
  },

  /**
   * 지도 좌표를 layer pixel 좌표로 변환한다.
   * @param {olleh.maps.Coord} coord 변환할 지도 좌표
   * @param {boolean} [afterZoom=true] true 로 지정하면 줌 애니메이션 동안에는 줌이 끝난 다음 기준으로 계산
   * @returns {olleh.maps.Point} 변환된 layer pixel 좌표
   */
  getLayerPxFromCoord: function (coord, afterZoom) {
    afterZoom = afterZoom !== false;
    var viewportPx = this.getViewportPxFromCoord(coord, !!afterZoom);
    return new olleh.maps.Point(viewportPx.x - this._layerOffset.x,
      viewportPx.y - this._layerOffset.y)._round();
  },

  /**
   * Viewport pixel 좌표를 UTMK 지도 좌표로 변환한다.
   * @param {olleh.maps.Point} viewportPx viewport pixel 좌표
   * @param {boolean} [afterZoom=true] true 로 지정하면 줌 애니메이션 동안에는 줌이 끝난 다음 기준으로 계산
   * @returns {olleh.maps.UTMK} 변환된 지도 좌표
   */
  getCoordFromViewportPx: function (viewportPx, afterZoom) {
    afterZoom = afterZoom !== false;
    var zoom = afterZoom ? this.getPendingZoom() : this._zoom;
    var resolution = olleh.maps.layer.LayerManager.getResolutionForZoom(zoom);
    var coordOrigin = this._getCoordOrigin(!!afterZoom);
    var dx = viewportPx.x * resolution;
    var dy = viewportPx.y * resolution;
    return new olleh.maps.UTMK(coordOrigin.x + dx, coordOrigin.y - dy);
  },

  /**
   * Layer pixel 좌표를 UTMK 지도 좌표로 변환한다.
   * @param {olleh.maps.Point} layerPx layer pixel 좌표
   * @param {boolean} [afterZoom=true] true 로 지정하면 줌 애니메이션 동안에는 줌이 끝난 다음 기준으로 계산
   * @returns {olleh.maps.UTMK} 변환된 지도 좌표
   */
  getCoordFromLayerPx: function (layerPx, afterZoom) {
    afterZoom = afterZoom !== false;
    var viewportPx = new olleh.maps.Point(layerPx.x
      + this._layerOffset.x, layerPx.y + this._layerOffset.y);
    return this.getCoordFromViewportPx(viewportPx, afterZoom);
  },

  /**
   * Viewport pixel 좌표를 layer pixel 좌표로 변환한다.
   * @param {olleh.maps.Point} viewportPx viewport pixel 좌표
   * @returns {olleh.maps.Point} 변환된 layer pxiel 좌표
   */
  getLayerPxFromViewportPx: function (viewportPx) {
    return new olleh.maps.Point(viewportPx.x - this._layerOffset.x,
      viewportPx.y - this._layerOffset.y);
  },

  /**
   * Layer pixel 좌표를 viewport pixel 좌표로 변환한다.
   * @param {olleh.maps.Point} layerPx layer pixel 좌표
   * @returns {olleh.maps.Point} 변환된 viewport pixel 좌표
   */
  getViewportPxFromLayerPx: function (layerPx) {
    return new olleh.maps.Point(layerPx.x + this._layerOffset.x,
      layerPx.y + this._layerOffset.y);
  },

  /**
   * 현재 지도의 중심점을 반환한다.
   * @returns {olleh.maps.UTMK} 지도 중심점
   * @private
   */
  getCenter: function () {
    return this._center;
  },

  /**
   * viewport 에 해당하는 지도 영역을 UTMK 좌표로 반환한다.
   * @returns {olleh.maps.Bounds} 지도 영역
   * @private
   */
  getBounds: function () {
    var coordSize = this._getCoordSizeForZoom(this._zoom);
    // left bottom
    var x1 = this._center.x - coordSize.width / 2;
    var y1 = this._center.y - coordSize.height / 2;
    // right top
    var x2 = this._center.x + coordSize.width / 2;
    var y2 = this._center.y + coordSize.height / 2;

    return new olleh.maps.Bounds(new olleh.maps.UTMK(x1, y1),
      new olleh.maps.UTMK(x2, y2));
  },

  /**
   * 현재 줌레벨을 반환한다.
   * @returns {Number} 줌 레벨
   * @private
   */
  getZoom: function () {
    return this._zoom;
  },

  /**
   * 최소 줌 레벨을 반환한다.
   * @returns {Number} 최소 줌 레벨
   * @private
   */
  getMinZoom: function () {
    return this._minZoom;
  },

  /**
   * 최대 줌 레벨을 반환한다.
   * @returns {Number} 최대 줌 레벨
   * @private
   */
  getMaxZoom: function () {
    return this._maxZoom;
  },

  /**
   * 새로운 줌레벨을 적용할 때 현재 줌 대비 배율을 계산한다.
   * @param {Number} newZoom  새로운 줌레벨
   * @private 
   */
  _getScaleForZoom: function (newZoom) {
    return Math.pow(2, newZoom - this._zoom);
  },

  /**
   * 줌 레벨 변경값 대비 배율을 계산한다.
   * @param changeAmount 줌 변경값
   * @private
   */
  _getScaleForChanges: function (changeAmount) {
    return Math.pow(2, changeAmount);
  },

  /**
   * 배율에 해당하는 줌 레벨을 계산한다.
   * @param scale 배율값
   * @private
   */
  _getZoomForScale: function (scale) {
    return this._zoom + (Math.log(scale) / Math.LN2);
  },

  /**
   * 줌레벨을 변경한다.
   * @param {Number} zoom 줌 레벨
   * @private
   */
  setZoom: function (zoom) {
    this.moveTo(null, zoom, 'on');
  },

  /**
   * 줌레벨을 1만큼 확대한다.
   * @private
   */
  zoomIn: function () {
    this.setZoom(this.getPendingZoom() + 1);
  },

  /**
   * 줌레벨을 1만큼 축소한다.
   * @private
   */
  zoomOut: function () {
    this.setZoom(this.getPendingZoom() - 1);
  },

  /**
   * fitBounds() 와 동일하며 새로 그려질 영역과 현재 영역이 겹치면 animation 효과 추가
   * @param {olleh.maps.Bounds} bounds 지도 영역
   * @private
   */
  panToBounds: function (bounds) {
    var center = bounds.getCenter();
    var zoom = this.getZoomForBounds(bounds);
    this.panTo(center, zoom);
  },

  /**
   * 지도영역을 bounds 를 포함할 수 있도록 조정한다.
   * @param {olleh.maps.Bounds} bounds
   * @private
   */
  fitBounds: function (bounds) {
    if (!this.isStarted()) {
      this._initialBounds = bounds;
    } else {
      var center = bounds.getCenter();
      var zoom = this.getZoomForBounds(bounds);
      this.moveTo(center, zoom, 'redraw');
    }
  },

  /**
   * 지도를 x축 방향으로 dx 픽셀 만큼, y축 방향으로 dy 픽셀 만큼 애니메이션과 함께 이동한다. 
   * 기존 영역과 새로운 영역이 겹치지 않으면 animation 효과 없이 이동된다.
   * @param {Number} dx x축 방향 이동 거리. 화면 픽셀 단윈.
   * @param {Number} dy y축 방향 이동 거리. 화면 픽셀 단윈.
   * @private
   */
  panBy: function (dx, dy) {
    var newCenter = this.calcNewCenter(dx, dy);
    this.panTo(newCenter, this._zoom);
  },

  /**
   * 현재 center 좌표를 화면상에서 dx, dy 만큼 이동시켰을때의 좌표를 계산한다. 
   * @param dx x 축 방향 픽셀 단위 거리
   * @param dy y 축 방향 픽셀 단위 거리
   * @returns {olleh.maps.UTMK} 지도상의 좌표
   * @private
   */
  calcNewCenter: function (dx, dy) {
    var resolution = this.getResolution();
    var _dx = dx * resolution;
    var _dy = dy * resolution;
    return new olleh.maps.UTMK(this._center.x + _dx, this._center.y - _dy);
  },

  /**
   * 지도 중심을 center 위치로 이동한다. 이동할 영역이 현재 영역과 겹치면 
   * animation 효과와 함께 이동된다.
   * @param {olleh.maps.Coord} center 이동할 지도 중심점 좌표
   * @param {number} [zoom] 변경할 zoom
   * @param {string} [animation=auto] 'off' 인 경우 애니메이션을 적용하지 않는다.
   *                             'auto' 인 경우 이동할 영역과 겹치는 부분이 있으면 애니메이션을 적용하고 그외에는 적용하지 않는다. 
   * @private
   */
  panTo: function (center, zoom, animation) {
    center = center.asDefault();
    this.moveTo(center, zoom, animation || 'auto');
  },

  /**
   * dx, dy 만큼 layer offset 을 변경한다. argument 가 없으면 layer offset 을 
   * 0,0 으로 reset 한다.
   * @param {Number} dx  
   * @param {Number} dy 
   * @private
   */
  _moveRootPane: function (dx, dy) {
    if (arguments.length >= 2) {
      this._layerOffset._add(dx, dy);
    } else {
      this._layerOffset.x = 0;
      this._layerOffset.y = 0;
    }
    var styles = this._getPositionStyles();

    olleh.maps.util.dom.setStyles(this._root_pane, styles);
  },

  _getPositionStyles: function () {
    return olleh.maps.util.dom.getPositionStyles(this._layerOffset.x,
      this._layerOffset.y, this._opts.useCSSTransform, olleh.maps.browser.use3DRootPane);
  },

  /**
   * dx, dy 만큼 layer offset 을 애니메이션 효과와 함께 옮긴다. 
   * @param {Number} dx  
   * @param {Number} dy 
   * @param {Number} animationDuration animation 지속 시간 
   * @param {Function} animationCallback animation 이 끝나고 호출할 callback function 
   * @private
   */
  _panRootPane: function (dx, dy, animationDuration, animationCallback) {
    var currentStyles = this._getPositionStyles();
    this._layerOffset._add(dx, dy);
    var styles = this._getPositionStyles();
    this._rootPaneAnimator = new olleh.maps.fx.Animation({
      from: currentStyles,
      to: styles,
      duration: animationDuration,
      timing: this._panAnimTiming,
      callback: animationCallback ? animationCallback.bind(this) : null,
      pulse: true
    }).animate(this._root_pane);
  },

  /**
   * 현재 pan animation 수행중 이라면 취소하고 center 를 update 한다. 
   * @private
   */
  _abortPanAnimationAndUpdateCenter: function () {
    if (!this._isZooming && this._rootPaneAnimator && this._rootPaneAnimator.status === 'started') {
      var currentStyles = this._rootPaneAnimator.abort();
      var currentPosition = olleh.maps.util.dom.getPointFromStyle(currentStyles);
      var diff = this._layerOffset.subtract(currentPosition);
      this._layerOffset = currentPosition;
      var newCenter = this.calcNewCenter(diff.x, diff.y);
      this._center = newCenter;
      if (!this._disableLoadingWhilePanning)
        this._moveLayers();
      this._resetIdleTimer();
    }
  },

  /**
   * 지도 중심을 coord 위치로 설정합니다.
   * @param {olleh.maps.Coord} center
   * @private
   */
  setCenter: function (center) {
    center = center.asDefault();
    this.moveTo(center, null, 'redraw');
  },

  /**
   * viewport size 를 재계산 하고 지도 전체를 다시 그린다.
   * window resize 이벤트 핸들러에서 호출하거나 map element 의 
   * 크기를 변경하는쪽에서 호출하도록 한다.  
   * @param {String} [horizontalRef=left] left,right,center 중 하나의 값을 가질 수 있다. left 인 경우 왼쪽을 고정점으로 right 인 경우 오른쪽을 고정점으로 새로운 center 가 계산된다.
   *  center 로 지정하면 center 가 변경되지 않는다. center 로 지정할 경우 verticalRef 값은 적용되지 않는다.
   * @param {String} [verticalRef=top] top 또는 bottom 값을 가질 수 있다. top 인 경우 상단을 기준으로 bottom 인 경우 하단을 기준으로 새로운 center 가 계산된다. 
   * @private
   */
  resize: function (horizontalRef, verticalRef) {
    if (!this.isStarted())
      return;
    var newCenter;
    var viewportSize = new olleh.maps.Size(this._mapElem.clientWidth,
      this._mapElem.clientHeight);
    if (horizontalRef === 'center') {
      newCenter = this._center;
    } else {
      var point = viewportSize.divideBy(2).asPoint();
      newCenter = this.getCoordFromViewportPx(point);
      if (horizontalRef === 'right' || verticalRef === 'bottom') {
        var point2 = this._viewportSize.divideBy(2).asPoint();
        this._viewportSize = viewportSize;
        var coord2 = this.getCoordFromViewportPx(point2);
        var x = horizontalRef === 'right' ? coord2.x : newCenter.x;
        var y = verticalRef === 'bottom' ? coord2.y : newCenter.y;
        newCenter = new olleh.maps.UTMK(x, y);
      }
    }
    this._viewportSize = viewportSize;
    this._viewportOffset = olleh.maps.util.dom.getXY(this._mapElem);
    this._viewportSizeChanged = true;
    this.moveTo(newCenter, null, 'redraw');
  },

  /**
   * maxExtent 가 지정된 경우 moveTo() 로 이동되는 범위를 제한한다. 
   * @param center 새로운 중심 좌표
   * @param zoom 새로운 줌
   * @returns {olleh.maps.UTMK} 변경된 중심 좌표
   * @private
   */
  _adjustCenter: function (center, zoom) {
    var restrictedExtent = this._opts.restrictedExtent;
    if (!restrictedExtent)
      return center;
    var coordSize = this._getCoordSizeForZoom(zoom);
    var left, right, bottom, top;
    if (coordSize.width > restrictedExtent.getWidth()) {
      left = restrictedExtent.getRight() - coordSize.width / 2;
      right = restrictedExtent.getLeft() + coordSize.width / 2;
    } else {
      left = restrictedExtent.getLeft() + coordSize.width / 2;
      right = restrictedExtent.getRight() - coordSize.width / 2;
    }
    if (coordSize.height > restrictedExtent.getHeight()) {
      bottom = restrictedExtent.getTop() - coordSize.height / 2;
      top = restrictedExtent.getBottom() + coordSize.height / 2;
    } else {
      bottom = restrictedExtent.getBottom() + coordSize.height / 2;
      top = restrictedExtent.getTop() - coordSize.height / 2;
    }
    var centerBounds = new olleh.maps.Bounds(
      new olleh.maps.UTMK(left, bottom),
      new olleh.maps.UTMK(right, top)
    );
    if (centerBounds.contains(center)) {
      return center;
    }
    var x = Math.max(centerBounds.getLeft(), Math.min(centerBounds.getRight(), center.x));
    var y = Math.max(centerBounds.getBottom(), Math.min(centerBounds.getTop(), center.y));
    return new olleh.maps.UTMK(x, y);
  },

  /**
   * 지도 중심을 center 로 줌레벨을 zoom 으로 설정한다.
   * @param {olleh.maps.UTMK} center 이동할 좌표. 무조건 UTMK. null 일 경우 현재 center 를 유지하고 zoom 만 변경한다.
   * @param {number} zoom 줌레벨. null 일 경우 현재 zoom 을 유지하고 center 만 변경한다.
   * @param {string} [animation=redraw] redraw: 무조건 redraw, 기본값. 지도가 처음 시작되거나 viewport 가 변경이 될때 사용
   *                             on: 무조건 animation. 사용자가 마우스나 터치를 통해 드래그해서 handler 에서 호출할때 사용.
   *                             auto: 겹치는 영역이 있으면 animation, 없으면 draw, Map#panTo() 의 기본  동작
   *                             off: 비교적 작은 거리를 animation 없이 이동할때 효율적으로 동작하는 옵션. 
   *                                  키보드나 pan control 사용해서 이동할때 사용. 겹치는 영역이 없으면 draw 호출  
   * @param {number} [animationDuration] animation 수행 지속 시간
   * @private
   */
  moveTo: function (center, zoom, animation, animationDuration) {
    // zoom 이 문자열인 경우 허용
    if (zoom)
      zoom = +zoom;
    if (!this.isStarted()) {
      center && (this._center = center);
      olleh.maps.isNumber(zoom) && (this._zoom = zoom);
      return;
    }
    if (this._pinch_started) { // PinchZoom.js 에서 설정. pinch 하는 동안에는 zoom 이 되지 않도록 한다.
      return;
    }
    // center 가 지정되지 않은 경우 현재 center 를 그대로 사용
    // 줌애니메이션이 진행중인 경우에는 pendingCenter(애니메이션완료시 center) 사용 
    if (!center) {
      center = this._isZooming ? this._pendingCenter : this._center;
    }
    // zoom 이 지정되지 않은 경우 현재 zoom 을 그대로 사용
    // 만일 줌애니메이션이 진행중인 경우에는 pendingZoom(애니메이션완료시 zoom) 사용
    if (!olleh.maps.isNumber(zoom)) {
      zoom = this._isZooming ? this._pendingZoom : this._zoom;
    }
    // minZoom, maxZoom 을 적용한다.
    zoom = Math.max(this._minZoom, zoom);
    zoom = Math.min(this._maxZoom, zoom);
    // maxExtent 를 적용한다.
    center = this._adjustCenter(center, zoom);
    var oldZoom = this._zoom;
    var oldCenter = this._center;
    var zoomChanged = this._isZooming ? zoom !== this._pendingZoom : zoom !== oldZoom;
    var centerChanged = this._isZooming ? !center.equals(this._pendingCenter) : !center.equals(oldCenter);
    // forceDraw 가 true 이면 무조건 redraw 
    var forceDraw = false;
    // 애니메이션 적용 여부
    var useAnimation = false;
    // 팬애니메이션이 진행중이라면 중단하고 center 를 업데이트한다.
    this._abortPanAnimationAndUpdateCenter();
    var panDuration = olleh.maps.isNumber(animationDuration) ? animationDuration
      : this._opts.panAnimDuration;
    var zoomDuration = olleh.maps.isNumber(animationDuration) ?
      animationDuration : this._opts.zoomAnimDuration;
    // 무조건 draw
    if (animation === 'redraw' || olleh.maps.isUndefined(animation) || (zoomChanged && zoomDuration === 0) || (centerChanged && panDuration === 0)) {
      forceDraw = true;
    } else if (animation === 'on') { // 무조건 animation
      useAnimation = true;
    } else /* if (animation === 'auto' || animation === 'off') */ { // 겹치는 영역이 있으면 move, 없으면 draw
      // 현재 영역과 겹치는 영역이 없으면 redraw 된다.
      var coordSize = this._getCoordSizeForZoom(Math.min(zoom, this._zoom));
      // left bottom
      var x1 = this._center.x - coordSize.width * 3 / 2;
      var y1 = this._center.y - coordSize.height * 3 / 2;
      // right top
      var x2 = this._center.x + coordSize.width * 3 / 2;
      var y2 = this._center.y + coordSize.height * 3 / 2;
      if (center.x < x1 || center.y < y1 || center.x > x2 || center.y > y2) {
        forceDraw = true;
      } else {
        useAnimation = animation === 'auto'; // move 할때 animation 효과 적용 여부
      }
    }
    // 애니메이션없이 zoom 변경되는경우 forceDraw 를 수행한다. 
    if (!useAnimation && zoomChanged)
      forceDraw = true;
    if (!forceDraw && !centerChanged && !zoomChanged) {
      return;
    }
    // draw: layer offset 을 초기화하고 layer.draw() 호출
    if (!this._center || forceDraw) {
      if (this._isZooming) {
        if (this._zoomEndReq) {
          window.cancelAnimationFrame(this._zoomEndReq);
          this._zoomEndReq = null;
        }
        this._isZooming = false;
        this._pendingZoom = null;
        this._pendingCenter = null;
      }
      this._setBounds(center, zoom);
      this._moveRootPane(); // reset layer offset
      this._drawLayers();
      this._fireBoundsChangedEvent();
    } else if (zoomChanged) {
      var layerPx;
      // 현재 줌애니메이션이 진행중인동안에 추가로 줌애니메이션 수행시
      if (this._isZooming) {
        // zoom 상태인 경우 이전에 계산한 origin 좌표를 그대로 사용한다.
        layerPx = this._initialOriginLayerPx;
        // 변경된 zoom 에 맞추어 center 를 다시 계산해야 한다.
        if (this._initialCenterLayerPx) { // 이전에 계산된 center layer px
          var initialCenterLayerPx = this._initialCenterLayerPx;
          var scale = this._getScaleForZoom(zoom);
          var offsetPx = layerPx.subtract(initialCenterLayerPx);
          offsetPx._multiplyBy(1 - 1 / scale);
          var tempCoord = initialCenterLayerPx.add(offsetPx);
          tempCoord = this.getCoordFromLayerPx(tempCoord, false);
          center = tempCoord;
        }
      } else {
        layerPx = this.getLayerPxFromCoord(center, false);
        if (centerChanged) {
          // zoom animation 원점을 구한다.
          // leaflet 의 공식을 그대로 가져옴. 왜이렇게 되는지는 모르겠음;;
          // animation 원점은 = 현재 중심점 + (이동할 중심점 - 현재 중심점)/(1 - 1 / 확대 배율) 
          var centerLayerPx = this.getLayerPxFromCoord(this._center, false);
          var offsetPx = layerPx.subtract(centerLayerPx);
          var scale = this._getScaleForZoom(zoom);
          offsetPx._divideBy(1 - 1 / scale);
          layerPx = centerLayerPx.add(offsetPx);
          // 최초 계산된 center layer px
          this._initialCenterLayerPx = centerLayerPx;
        }
        // 최초 계산된 zoom origin layer px 
        this._initialOriginLayerPx = layerPx;
      }
      this._pendingZoom = zoom;
      this._pendingCenter = center;
      var scale = this._getScaleForChanges(zoom - oldZoom);
      this.fireEvent('zoom_change', {
        origin: layerPx, scale: scale,
        duration: zoomDuration, newZoom: zoom, oldZoom: oldZoom
      });
      if (this._hideLayerFn) { // base layer 변경되는 도중에 줌애니메이션을 호출한 경우
        this._hideLayerFn.call(this);
      }
      this._zoomStartLayers(scale, layerPx, zoomDuration);
      this._triggerZoomEnd(center, zoom, oldZoom, zoomDuration);
    }
    // move 처리
    // 현재 줌애니메이션 수행중인 경우에는 move 하지 않는다.
    else if (!this._isZooming) {
      var resolution = this.getResolution();
      var dx = Math.floor((center.x - this._center.x) / resolution);
      var dy = Math.floor((center.y - this._center.y) / resolution);
      // 패닝 애니메이션 처리
      if (useAnimation) {
        this._panRootPane(-dx, dy, panDuration, this._moveEndLayers);
        this._setBounds(center, this._zoom);
        this._moveStartLayers();
      } else { // 애니메이션 없는 move
        this._moveRootPane(-dx, dy);
        this._setBounds(center, this._zoom);
        if (!this._disableLoadingWhilePanning)
          this._moveLayers();
        this._resetIdleTimer();
        this._fireBoundsChangedEvent();
      }
    }
  },

  /**
   * 개별 layer 들의 zoom animation 완료 시점과 zoomEnd() 호출시점을 맞추기 위해서 
   * requestAnimationFrame 을 사용해 _triggerZoomEnd2 를 호출한다.
   * @private
   */
  _triggerZoomEnd: function (center, zoom, oldZoom, zoomDuration) {
    this._isZooming = true;
    if (this._zoomEndReq) {
      window.cancelAnimationFrame(this._zoomEndReq);
    }
    this._zoomEndReq = olleh.maps.util.deferAF(this._triggerZoomEnd2, this, center, zoom, oldZoom, zoomDuration);
  },

  /**
   * zoomDuration 시간후 _triggerZoomEnd3 를 호출한다.
   * @param {Number} t requsetAnimationFrame 의 첫번째 파라미터
   * @param {olleh.maps.coord} center
   * @param {Number} zoom
   * @param {Number} oldZoom
   * @param {Nuber} zoomDuration
   * @private
   */
  _triggerZoomEnd2: function (t, center, zoom, oldZoom, zoomDuration) {
    if (this._zoomTimer !== null) {
      window.clearTimeout(this._zoomTimer);
    }
    this._zoomEndReq = null;
    this._zoomTimer = olleh.maps.util.delay(this._triggerZoomEnd3, 1000 * zoomDuration + 100, this, center, oldZoom, zoom);
  },

  /**
   * center,zoom 을 변경하고 zoomEnd layer 를 호출한다.
   * @private
   */
  _triggerZoomEnd3: function (center, oldZoom, zoom) {
    this._isZooming = false;
    this._setBounds(center, zoom);
    this._pendingZoom = null;
    this._pendingCenter = null;
    this._zoomEndLayers(oldZoom, zoom);
    this._initialCenterLayerPx = null;
    this._zoomTimer = null;
    this._fireBoundsChangedEvent();
  },

  _setBounds: function (center, zoom) {
    var centerChanged = this._center !== center;
    var zoomChanged = this._zoom !== zoom;
    if (!centerChanged && !zoomChanged)
      return;
    if (centerChanged) {
      var oldCenter = this._center;
      this._center = center;
      this._centerChanged = { newCenter: center, oldCenter: oldCenter };
    }
    if (zoomChanged) {
      var oldZoom = this._zoom;
      this._zoom = zoom;
      this._zoomChanged = { newZoom: zoom, oldZoom: oldZoom };
    }
  },

  _fireBoundsChangedEvent: function () {
    if (this._centerChanged) {
      this.fireEvent('center_changed', this._centerChanged);
    }
    if (this._zoomChanged) {
      this.fireEvent('zoom_changed', this._zoomChanged);
    }
    if (this._zoomChanged || this._centerChanged || this._viewportSizeChanged) {
      this.fireEvent('bounds_changed');
    }
    this._centerChanged = null;
    this._zoomChanged = null;
    this._viewportSizeChanged = null;
  },

  /**
   * 줌 애니메이션 수행 중인 경우 true 를 반환한다.
   * @returns {Boolean}
   * @private
   */
  isZooming: function () {
    return this._isZooming;
  },

  /**
   * zoom animation 이 수행하는 도중에 getZoom() 을 호출하면 변경될 zoom 값이 
   * 아닌 이전 zoom 값이 반환된다.
   * zoom animation 수행도중에 변경될 zoom 값을 얻기 위해서는
   * getPendingZoom() 을 사용해야 한다.
   * @returns {Number} 변경될 줌 레벨 값
   * @private
   */
  getPendingZoom: function () {
    return olleh.maps.isNumber(this._pendingZoom) ? this._pendingZoom : this._zoom;
  },

  /**
   * {@link #getPendingZoom()} 과 마찬가지로 줌 애니메이션이 끝나고 나서 변경될
   * center 를 반환한다.
   * @returns {olleh.maps.Coord} 변경될 중심섬
   * @private
   */
  getPendingCenter: function () {
    return this._pendingCenter ? this._pendingCenter : this._center;
  },

  /**
   * 모든 layer 의 draw 함수를 호출한다.
   * @private
   */
  _drawLayers: function () {
    this._forEachLayers('draw', [!this.isStarted()]);
    if (!this.isStarted()) {
      this._idle();
    } else {
      this._resetIdleTimer();
    }
  },

  /**
   * 모든 layer 의 moveEnd 함수를 호출한다.
   * @private
   */
  _moveEndLayers: function () {
    this._forEachLayers('moveEnd');
    this._fireBoundsChangedEvent();
    this._idle();
  },

  /**
   * 모든 layer 의 moveStart 함수를 호출한다.
   * @private
   */
  _moveStartLayers: function () {
    this._forEachLayers('moveStart');
  },

  /**
   * 모든 layer 의 move 함수를 호출한다.
   * @private
   */
  _moveLayers: function () {
    this._forEachLayers('move');
  },

  /**
   * 모든 layer 의 zoomStart 함수를 호출한다.
   * @param {Number} scale 현재 대비 배율
   * @param {olleh.maps.Point} origin 줌 중심점
   * @param {Number} duration 줌 애니메이션 지속 시간
   * @private
   */
  _zoomStartLayers: function (scale, origin, duration) {
    this._forEachLayers('zoomStart', [scale, origin,
      duration, this._zoomPulse]);
  },

  /**
   * 모든 layer 의 zoomEnd 함수를 호출한다.
   * @param {Number} oldZoom 변경 전 줌 레벨
   * @param {Number} newZoom 변경 후 줌 레벨
   * @private
   */
  _zoomEndLayers: function (oldZoom, newZoom) {
    this._forEachLayers('zoomEnd', [oldZoom, newZoom]);
    if (this._zoomPulse) {
      this._zoomPulse.stop();
    }
    this._idle();
  },

  /**
   * 모든 layer 에 동일한 함수를 호출한다.
   * @param {String} fnString 호출할 함수 이름 
   * @param {Array} args function arguments array
   * @private 
   */
  _forEachLayers: function (fnString, args) {
    args || (args = []);

    if (this._backgroundLayer) {
      this._backgroundLayer[fnString].apply(this._backgroundLayer, args);
    }

    if (this._activeBaseLayer) {
      this._activeBaseLayer[fnString].apply(this._activeBaseLayer, args);
    }

    for (var i = 0, len = this._groundLayers.length; i < len; i++) {
      var l = this._groundLayers[i];
      if ((l.isVisible() && l.isVisibleForZoom()) || fnString.indexOf('End') != -1) { // TODO 임시 수정
        l[fnString].apply(l, args);
      }
    }

    if (this._overlayLayer) {
      this._overlayLayer[fnString].apply(this._overlayLayer, args);
    }
  },

  /**
   * edit mode 에서는 viewport 크기의 transparent_pane 이 활성화 되어 개별 overlay 의 cursor style 등이 적용 안된다. 
   * @param {Boolean} editable true 일경우 edit mode 를 활성화 한다.
   * @private
   */
  setEditMode: function (editable) {
    var display = editable ? 'block' : 'none';
    this._transparent_pane.style.display = display;
  },

  /**
   * 현재 설정된 max extent (지도 최대 영역) 을 반환한다.
   * @returns {olleh.maps.Bounds} max extetnt
   * @private
   */
  getMaxExtent: function () {
    return this._opts.maxExtent;
  },

  /**
   * 현재 설정된 restricted extent (지도 panning 제한 영역) 을 반환한다.
   * @returns {olleh.maps.Bounds} restricted extent
   * @private
   */
  getRestrictedExtent: function () {
    return this._opts.restrictedExtent;
  },

  _resetIdleTimer: function () {
    if (this._idleTimer) {
      window.clearTimeout(this._idleTimer);
    }
    this._idleTimer = olleh.maps.util.delay(this.__resetIdleTimer, 200, this);
  },

  /**
   * @private
   */
  __resetIdleTimer: function () {
    // 줌이나 패닝이 일어나고 있는 경우 줌/패닝 완료시에 이벤트가 발생한다. 
    if (!this._isZooming && (!this._rootPaneAnimator || this._rootPaneAnimator.status != 'started')) {
      if (this._disableLoadingWhilePanning)
        this._moveLayers();
      this.fireEvent('idle');
    }
    this._idleTimer = null;
  },

  _idle: function () {
    // 타이머가 걸려있는 경우 타이머 실행시에 이벤트가 발생한다.
    if (!this._idleTimer) {
      this.fireEvent('idle');
    }
  }

});
/**
 * @private
 */
$class('olleh.maps.layer.BackgroundLayer').extend(olleh.maps.layer.Layer).define({
            
  start: function() {
    var browser = olleh.maps.browser;
    var viewportSize = this.layerMgr.getViewportSize();
    this._pane = document.createElement('div');
    this._buffer = 3000; // buffer 를 10000 이상 지정하면 iOS 에서 문제가 있다.
    var styles = {
        position: 'absolute',
        zIndex: '-1000',
        width: viewportSize.width + this._buffer * 2 + 'px',
        height: viewportSize.height + this._buffer * 2 + 'px',
        backgroundImage: 'url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAALUlEQVR4Xu3SMQEAMAgDwVD/2mDDDnXAb0w5Ab8k2nTlCDyBg4ADwVMx/8CBDz7/CnKqkouSAAAAAElFTkSuQmCC)',
        backgroundRepeat: 'repeat'  
    };
    if (browser.has3D) {
      styles.transform  = 'translate3d(0,0,0)';
    }
    olleh.maps.util.dom.setStyles(this._pane, styles);
    this._updatePosition();
    this.layerMgr.onEvent('idle', this._onIdle, this);
  },
  
  getPane: function() {
    return this._pane;
  },
  
  _onIdle: function() {
    if (this._idleTimer) {
      window.clearTimeout(this._idleTimer);
    }
    this._idleTimer = olleh.maps.util.delay(this._resetIdleTimer, 500, this);
  },
  
  _resetIdleTimer: function() {
    this._updatePosition();
    this._idleTimer = null;
  },
    
  _updatePosition: function() {
    var layerOffset = this.layerMgr.getLayerOffset();
    olleh.maps.util.dom.setStyles(this._pane, {
      left: -layerOffset.x - this._buffer + 'px',
      top:  -layerOffset.y - this._buffer + 'px'
    });
  }
      
});/**
 * Overlay 들을 관리하는 Layer
 */
$class('olleh.maps.overlay.OverlayLayer').extend(olleh.maps.layer.Layer).define({
  
  /**
   * OverlayLayer name: olleh.maps.overlay.OverlayLayer 
   * @type String
   * @private
   */
  name: 'olleh.maps.overlay.OverlayLayer',
  
  label: '오버레이',
  
  autoActivate: true,

  /**
   * overlay draw 여부 계산시 buffer 영역의 크기를 viewport 크기 대비 비율로 지정한다. 
   * 1 인 경우 viewport 와 동일한 크기의 buffer 를 추가하며 0 인 경우 buffer 를 추가하지 않는다.
   * 자연스러운 zoom in animation 과 move 호출시 draw 여부 계산의 빈도를 줄이기 위해서는 큰 값을 지정할 필요가 있다. 
   * 지도가 이동될때(moveStart()가 호출될때) buffer 단위로 overlay 의 draw/erase 여부를 계산하게 된다. 
   * @type Number
   * @private
   */
  buffeSize: 0.2,
  
  /**
   * lower overlay pane 의 기본 z-index. 나머지 pane 은 1 씩 증가함.
   * @type Number
   * @private
   */
  baseIndex: 1000,
  
  /**
   * true 일 경우 Overlay 그림자를 그리지 않는다. default: false 
   * @type Boolean
   * @private
   */
  disableShadow: false,
  
  /**
   * Overlay Pane id:
   * <ul>
   *  <li>lower_overlay_pane</li>
   *  <li>overlay_shadow_pane</li>
   *  <li>upper_overlay_pane</li>
   *  <li>infowindow_shadow_pane</li>
   *  <li>infowindow_pane</li>
   * </ul>
   * @private
   */
  paneIds: ['lower_overlay_pane', 'overlay_shadow_pane', 'upper_overlay_pane',
             'infowindow_shadow_pane', 'infowindow_pane'],
  /**
   * 생성자, 새로운 객체를 생성한다.
   */
  OverlayLayer: function () {
    this._visible = true;
    this._overlays = [];
    this._displayedOverlays = {};
    /**
     *  Overlay Panes
     *  @type Object
     *  @private 
     */
    this.panes = {};
    var pane, paneId;
    for (var i = 0; i < this.paneIds.length; i++) {
      paneId = this.paneIds[i];
      pane = this.panes[paneId] = document.createElement('div');
      pane.style.position = 'absolute';
      pane.style.zIndex = 1000 + i;
    }
    this._gridIndex = new olleh.maps.overlay.GridIndex(10000);
  },
  
  start: function() {
    olleh.maps.overlay.OverlayLayer.$super.start.call(this);
    this.disableShadow = this.map.getOption('disableShadow', false);
  },
  
  /**
   * @param {olleh.maps.event.Event}
   * @param {Object} payload
   * @private
   */
  $current_bounds_changed: function (event, payload) {
    var o = event.getSource();

    this._gridIndex.remove(o, payload.from);
    this._gridIndex.add(o);
    this._updateSingleOverlayDisplayHint(o);
  },
  
  /**
   * @param {olleh.maps.event.Event}
   * @param {Object} payload
   * @private
   */
  $current_position_changed: function (event, payload) {
    var o = event.getSource();
    if(!o.getBounds()) {
      this._gridIndex.remove(o, payload.from);
      this._gridIndex.add(o);
      this._updateSingleOverlayDisplayHint(o);
    }
  },

  /**
   * <code>paneId</code> 에 해당되는 pane 을 반환 한다.
   * @returns {Element}
   */
  getPane: function (paneId) {
    return this.panes[paneId];
  },

  /**
   * OverlayLayer 에 추가된 전체 Overlay 들을 반환한다.
   * @returns {Array.<olleh.maps.overlay.Overlay>} Overay 배열
   */
  getOverlays: function () {
    return this._overlays;
  },

  /**
   * OverlayLayer 를 숨기거나 보여준다.
   * @param {boolean} visible false 로 지정하면 OverlayLayer 를 지도에서 숨긴다.
   */
  setVisible: function (visible) {
    if (this._visible != visible) {
      this._visible = visible;
      visible && this.draw();
      var overlayPanes = this.panes;
      var visibility = visible ? 'block' : 'none';
      for (var i in overlayPanes) {
        overlayPanes[i].style.display = visibility;
      }
    }
  },

  /**
   * OverlayLayer 의 visible 속성값을 반환 한다.
   * @returns {boolean} visilbe 속성값
   */
  isVisible: function () {
    return this._visible;
  },

  /**
   * OverlayLayer 에 Overlay 객체를 추가 한다.
   * @param {olleh.maps.overlay.Overlay} overlay Overlay 개체
   * @private
   */
  add: function (overlay) {
   // layer 를 지정해주어야 attach 되기 전에 remove 될때에도 문제가 없다.
    overlay.layer = this; 
   // zoom animation 수행중이라면 animation 이 끝나고 추가 한다.
    if (this.layerMgr.isZooming()) {
      if(!this._toAddOverlaysAtZoomEnd)
        this._toAddOverlaysAtZoomEnd = [];
      this._toAddOverlaysAtZoomEnd.push(overlay);
      return;
    }
    this._overlays.push(overlay);
    if(overlay.getPosition() || overlay.getBounds())
      this._gridIndex.add(overlay);
    if (this.isStarted()) {
      overlay.fireEvent('attached');
      this._updateSingleOverlayDisplayHint(overlay);
      overlay.draw(true);
    }
  },

  /**
   * OverlayLayer 에서 Overlay 객체를 삭제 한다.
   * @param {olleh.maps.overlay.Overlay} overlay
   * @private
   */
  remove: function (overlay) {
    this._gridIndex.remove(overlay);
    if(!this._toAddOverlaysAtZoomEnd
        || olleh.maps.util.removeFromArray(this._toAddOverlaysAtZoomEnd, overlay) === -1) {
      if (this.isStarted()) {
        overlay.erase(true);
      }
      overlay.fireEvent('detached');
      olleh.maps.util.removeFromArray(this._overlays, overlay);
    }
    var id = overlay.getId();
    if(this._displayedOverlays[id]) {
      delete this._displayedOverlays[id];
    }
    overlay.layer = null;
  },

  /**
   * Pan Animation 시작시에 호출된다.
   * @private
   */
  moveStart: function () {
  },

  /**
   * Pan Animation 이 완료되면 호출된다.
   * @private
   */
  moveEnd: function () {
    var layerBoundsChanged;
    var center = this._center;
    var currentCenter = this.layerMgr.getCenter();
    if (center) {
      var bufferBounds = this._getBufferBounds(new olleh.maps.Bounds(center, center));
      layerBoundsChanged = !bufferBounds.contains(currentCenter);
    } else {
      layerBoundsChanged = true;
    }
    if (layerBoundsChanged) {
      this._center = currentCenter;
      this._onBoundsChanged();
    }
  },

  /**
   * Zoom Animation 시작시에 호출된다.
   * @param {Number} scale
   * @param {olleh.maps.Point} origin
   * @param {Number} duration
   * @param {olleh.maps.fx.Pulse} [pulse]
   * @private
   */
  zoomStart: function (scale, origin, duration, pulse) {
    var i, overlay, overlays = this._overlays;
    for ( i = overlays.length - 1; i >= 0; i--) {
      overlay = this._overlays[i];
      overlay.zoomStart(scale, origin, duration, pulse);
    }
  },

  /**
   * Zoom Animation 이 끝나면 호출된다.
   * @private
   */
  zoomEnd: function () {
    var i, overlay, overlays = this._overlays;
    for ( i = overlays.length - 1; i >= 0; i--) {
      overlay = this._overlays[i];
      overlay.zoomEnd();
    }
    this._onBoundsChanged();
    // zoom animation 동안에 추가된 overlay 들을 다시 추가한다.
    if(this._toAddOverlaysAtZoomEnd) {
      var toAddOverlaysAtZoomEnd = this._toAddOverlaysAtZoomEnd;
      delete this._toAddOverlaysAtZoomEnd;
      for(i = 0, len = toAddOverlaysAtZoomEnd.length; i < len; i++) {
        this.add(toAddOverlaysAtZoomEnd[i]);
      }
    }
  },

  /**
   * Overlay Layer 를 그린다.
   * @param {Boolean} isMapStart 지도가 처음 시작할 때 draw 가 호출되면 true 이다.
   * @private
   */
  draw: function (isMapStart) {
    var i, o, overlays = this._overlays;
    for ( i = overlays.length - 1; i >= 0; i--) {
      o = overlays[i];
      o.draw(isMapStart);
    }
    this._onBoundsChanged();
  },
  
  /**
   * Overlay 들에게 bounds 가 변경되었음을 호출한다.
   */
  _onBoundsChanged: function() {
    var from = this._bounds;
    this._bounds = null;
    var to = this.getBounds();
    this._updateAllOverlayDisplayHint();
    /**
     * OverlayLayer 의 buffer bounds 가 변경될 때 발생한다.
     * @name event:overlay_layer_bounds_changed
     * @event
     * @memberOf olleh.maps.overlay.OverlayLayer.prototype
     * @param {olleh.maps.event.Event} event
     */
    this.fireEvent('overlay_layer_bounds_changed', {from: from, to: to});
  },
  

  /**
   * Buffer 크기를 반환한다.
   * @returns {olleh.maps.Size} Buffer 크기
   * @private
   */
  _getBufferSize: function () {
    var viewportSize = this.layerMgr.getViewportSize();
    return viewportSize.multiplyBy(this.buffeSize);
  },
  
  /**
   * OverlayLayer bounds 를 반환한다. OverlayLayer bounds 는 buffer 를 가지기 때문에 viewport bounds 보다 클 수 있다.
   * @returns {olleh.maps.Bounds}
   */
  getBounds: function() {
    // _getBufferBounds 호출이 성능에 영향을 미치기 때문에 어쩔 수 없이 캐싱해야 한다.
    // bounds 가 변경될 때 (onBoundsChanged() 에서 this._bounds 를 null 로 리셋해야 한다.
    if(!this._bounds) {
      this._bounds = this._getBufferBounds();
    }
    return this._bounds; 
  },

  /**
   * Overlay draw 여부를 판별하는 Buffer Bounds 를 반환한다.
   * @param {olleh.maps.Bounds} [bounds]
   * @returns {olleh.maps.Bounds}
   * @private
   */
  _getBufferBounds: function (bounds) {
    var lm = this.layerMgr;
    var resolution = lm.getResolution();
    var buffer = this._getBufferSize();
    return (bounds || lm.getBounds()).expand(buffer.width * resolution, buffer.height * resolution);
  },
  
  /**
   * 전체 overlay 들의 display hint 를 업데이트 한다.
   * @private
   */
  _updateAllOverlayDisplayHint: function() {
    var i, id, overlay, overlays = {};
    var overlaysAsArray = this._gridIndex.getOverlays(this.getBounds());
    for (i = 0; i < overlaysAsArray.length; i++) {
      overlay = overlaysAsArray[i];
      overlays[overlay.getId()] = overlay;
    }
    for(id in this._displayedOverlays) {
      if (!overlays[id]) {
        this._displayedOverlays[id].setDisplayHint(false);
        delete this._displayedOverlays[id]; 
      }
    }
    for(id in overlays) {
      if(!this._displayedOverlays[id]) {
        overlays[id].setDisplayHint(true);
        this._displayedOverlays[id] = overlays[id];
      }
    }
  },
  
  /**
   * 개별 overlay 의 display hint 를 업데이트 한다.
   * @param {olleh.maps.Overlay} overlay Overlay
   * @private
   */
  _updateSingleOverlayDisplayHint: function(overlay) {
    var displayHint = this.getBounds().intersects(overlay.getBounds() || overlay.getPosition());
    overlay.setDisplayHint(displayHint);
    if(displayHint) {
      this._displayedOverlays[overlay.getId()] = overlay;
    } else if(this._displayedOverlays[overlay.getId()]) {
      delete this._displayedOverlays[overlay.getId()];
    }
  }
  
});
/**
 * 그리드 형태의 간단한 공간 인덱스.
 */
$class('olleh.maps.overlay.GridIndex').define({
  
  /**
   * 
   * @param {number} cellSize
   */
  GridIndex: function (cellSize) {
    this._cellSize = cellSize;
    this._grid = [];
  },

  /**
   * 
   * @param {olleh.maps.overlay.Overlay} overlay
   * @param {olleh.maps.Coord|olleh.maps.Bounds} [arg]
   */
  add: function (overlay, arg) {
    var x, y, col, cell;
    var range = this._getCellRange(arg || overlay.getIndexObject());

    for (x = range.minX; x <= range.maxX; x++) {
      col = this._grid[x];
      if (!col) {
        col = this._grid[x] = [];
      }
      for (y = range.minY; y <= range.maxY; y++) {
        cell = col[y];
        if (!cell) {
          col[y] = [overlay];
        } else {
          cell.push(overlay);
        }
      }
    }
  },

  /**
   * 
   * @param {olleh.maps.overlay.Overlay} overlay
   * @param {olleh.maps.Coord|olleh.maps.Bounds} [arg]
   */
  remove: function (overlay, arg) {
    var i, x, y, col, cell;
    var range = this._getCellRange(arg || overlay.getIndexObject());

    for (x = range.minX; x <= range.maxX; x++) {
      col = this._grid[x];
      if (!col) {
        continue;
      }
      for (y = range.minY; y <= range.maxY; y++) {
        cell = col[y];
        if (cell) {
          i = olleh.maps.util.indexOf(cell, overlay);
          if (i != -1) {
            cell.splice(i, 1);
          }
        }
      }
    }
  },

  clear: function () {
    var x, y, o, xMax, yMax, oMax, overlays;
    var gridX, gridY;

    for(x = 0, gridX = this._grid, xMax = gridX ? gridX.length : 0; x < xMax; x++) {
      for(y = 0, gridY = this._grid[x], yMax = gridY ? gridY.length : 0; y < yMax; y++) {
        for(o = 0, overlays = this._grid[x][y], oMax = overlays ? overlays.length : 0; o < oMax; o++) {
          overlays[o].setMap(null);
        }
      }
    }
  },
  
  /**
   * 
   * @param {olleh.maps.overlay.Overlay} overlay
   * @returns {boolean}
   */
  contains: function (overlay) {
    var x, y, col, cell;
    var range = this._getCellRange(overlay.getIndexObject());

    for (x = range.minX; x <= range.maxX; x++) {
      col = this._grid[x];
      if (!col) {
        continue;
      }
      for (y = range.minY; y <= range.maxY; y++) {
        cell = col[y];
        if (cell && olleh.maps.util.indexOf(cell, overlay) != -1) {
          return true;
        }
      }
    }
    
    return false;
  },
  
  /**
   * 
   * @param {olleh.maps.Bounds} bounds
   * @returns {object}
   */
  getOverlays: function (bounds) {
    var x, y, col, cell, overlay, result = [];
    var range = this._getCellRange(bounds);

    for (x = range.minX; x <= range.maxX; x++) {
      col = this._grid[x];
      if (!col) {
        continue;
      }
      for (y = range.minY; y <= range.maxY; y++) {
        cell = col[y];
        if (!cell) {
          continue;
        }
        for (var i = 0; i < cell.length; i++) {
          overlay = cell[i];
          if (bounds.intersects(overlay.getIndexObject())) {
            result.push(overlay);
          }
        }
      }
    }
    
    return result;
  },
  
  /**
   * 
   * @private
   * @param {olleh.maps.Coord|olleh.maps.Bounds} arg
   * @returns {Object}
   */
  _getCellRange: function (arg) {
    var minX, minY, maxX, maxY;
    var cellSize = this._cellSize;

    arg = arg.asDefault();
    if (arg.x !== undefined && arg.y !== undefined) {
      minX = maxX = Math.floor(arg.x / cellSize);
      minY = maxY = Math.floor(arg.y / cellSize);
    } else {
      minX = Math.floor(arg.leftBottom.x / cellSize);
      minY = Math.floor(arg.leftBottom.y / cellSize);
      maxX = Math.floor(arg.rightTop.x / cellSize);
      maxY = Math.floor(arg.rightTop.y / cellSize);
    }

    return {
      minX: minX,
      minY: minY,
      maxX: maxX,
      maxY: maxY
    };
  }
  
});/**
 * 지도에 추가된 Plugin 들을 한곳에서 참조하기 위한 레지스트리
 */
$class('olleh.maps.PluginRegistry').mixin(olleh.maps.event.EventDelegator)
    .define({
      
      /**
       * 플러그인이 지도에 추가된 경우 발생하는 이벤트
       * @name plugin_added
       * @event
       * @memberOf olleh.maps.PluginRegistry.prototype
       * @param {olleh.maps.event.Event} event
       */
      /**
       * 플러그인이 지도에서 제거된 경우 발생하는 이벤트
       * @name plugin_removed
       * @event
       * @memberOf olleh.maps.PluginRegistry.prototype
       * @param {olleh.maps.event.Event} event
       */

      /**
       * 생성자, 새로운 객체를 생성한다.
       */
      PluginRegistry: function () {
        this._plugins = [];
        this._drawingTools = [];
      },

      /**
       * Plugin 을 추가한다.
       * @param {olleh.maps.Plugin} plugin
       */
      add: function (plugin) {
        plugin.pluginRegistry = this;
        this._plugins.push(plugin);
        this.fireEvent('plugin_added', {
          plugin: plugin
        });
        if(plugin.pluginInfo && plugin.pluginInfo.drawingTool) {
          this._drawingTools.push(plugin);
        }
      },

      /**
       * Plugin 을 제거한다.
       * @param {olleh.maps.Plugin} plugin
       */
      remove: function (plugin) {
        if (plugin.active)
          plugin.deactivate();
        olleh.maps.util.removeFromArray(this._plugins, plugin);
        olleh.maps.util.removeFromArray(this._drawingTools, plugin);
        this.fireEvent('plugin_removed', {
          plugin: plugin
        });
        plugin.pluginRegistry = null;
      },
      
      /**
       * 추가된 plugin 배열을 반환한다.
       * @returns {Array.<olleh.maps.Plugin>} 
       */
      getPlugins: function() {
        return this._plugins;
      },

      /**
       * label 이 지정된 plugin 들을 group 별로 반환한다.
       * group 이 지정되지 않은 plugin 은 $nogroup 그룹에 지정된다.
       * @returns {Object} property: {String} group 이름, value: {olleh.maps.Plugin[]} plugin 배열
       */
      getLabeledPluginsByGroup: function () {
        var plugins = this._plugins;
        var pluginsByGroup = {};
        for ( var i = 0 , len = plugins.length ; i < len ; i++) {
          var p = plugins[i];
          var pluginInfo = p.pluginInfo;
          if(!pluginInfo || !pluginInfo.label)
            continue;
          var groupId = pluginInfo.group ? pluginInfo.group : '$nogroup';
          var arrs = pluginsByGroup[groupId];
          if (!arrs) {
            arrs = [];
            pluginsByGroup[groupId] = arrs;
          }
          arrs.push(p);
        }
        return pluginsByGroup;
      },

      /**
       * drawingTool 이 active 되는 경우 해당 plugin 이 호출한다.
       * @param {olleh.maps.Plugin} plugin active 될 plugin 
       * @private
       */
      drawingToolActivate: function(plugin) {
        for(var i = this._drawingTools.length - 1 ; i >= 0 ; i-- ) {
          if(this._drawingTools[i] !== plugin) {
            this._drawingTools[i].deactivate();
          }
        }
      }
      
    });////////////////
//  Map 옵션 //
////////////////
/**
 * Map 옵션
 * @typedef olleh.maps.MapOptions
 * @property {olleh.maps.Bounds} [maxExtent] 기본 지도 영역의 크기. 기본 지도를 교체하는 경우를 제외하고 maxExtent 값을 변경하지 않도록 한다.
 *                               화면에 보여지는 지도 영역을 제한하기 위해서는 restrictedExtent 를 사용하도록 한다. <br/>
 *                               기본값은 다음과 같다. <pre> Left: 171162, Bottom: 1214781, Right: 1744026, Top: 2787645 </pre>
 * @property {olleh.maps.Bounds} [restrictedExtent] 화면에 보여질 수 있는 지도 영역의 크기. restrictedExtent 바깥 영역은 panning 이 제한되며 
 *                               maxExtent 와는 독립적으로 동작하기 때문에 maxExtent 보다 큰 영역을 지정하는 것이 가능한다. <br/>  
 *                               기본값은 다음과 같다. <pre> Left: 171162, Bottom: 1214781, Right: 1744026, Top: 2787645 </pre>
 * @property {Boolean} [trackWindowSize=true] true 로 지정하면 window resize 이벤트 발생시 지도를 다시 그린다. 
 * @property {Number} [panAnimEaseLinearity1=0.5] pan animation 수행시 사용되는 cubic bezier timing function 의 y1 값. 클수록 초기 속도가 빨라진다.
 * @property {Number} [panAnimEaseLinearity2=0.25] pan animation 수행시 사용되는 cubic bezier timing function 의 x2 값. 작을수록 초기 속도가 빨라진다. 
 * @property {olleh.maps.Coord} center 초기 지도 중심 좌표 
 * @property {Number} [zoom=7] 지도 시작시 줌 레벨. 
 * @property {Number} [minZoom=0] 최소 줌 레벨. 
 * @property {Number} [maxZoom=13] 최대 줌 레벨=>15. 
 * @property {Number} [panAnimDuration=1.0] panTo()/panBy() 호출시 animation 지속 시간. 단위는 초.
 * @property {Number} [zoomAnimDuration=0.3] zoomIn()/zoomOut()/zoomTo() 호출시 animation 지속 시간. 단위는 초.
 * @property {Boolean} [useCSSTransform=true] panning 수행시 CSS3 transform 을 사용할지 여부. 
 * @property {Boolean} [disableDefaultUI=false] 기본 컨트롤 생성 여부.
 * @property {Boolean} [copyrightControl=true] CopyrightControl 생성 여부. 
 * @property {olleh.maps.control.CopyrightControlOptions} [copyrightControlOptions] CopyrightControl 옵션
 * @property {Boolean} [logoControl=true] LogoControl 생성 여부.
 * @property {olleh.maps.control.LogoControlOptions} [logoControlOptions] LogoControl 옵션
 * @property {Boolean} [mapTypeControl=true] MapTypeControl 생성 여부. 
 * @property {olleh.maps.control.ControlOptions} [mapTypeControlOptions] MapTypeControl 옵션 
 * @property {Boolean} [panControl=true] PanControl 생성 여부. 
 * @property {olleh.maps.control.ControlOptions} [panControlOptions] PanControl 옵션  
 * @property {Boolean} [scaleControl=true] ScaleControl 생성 여부.
 * @property {olleh.maps.control.ControlOptions} [scaleControlOptions] ScaleControl 옵션
 * @property {Boolean} [zoomControl=true] ZoomControl 생성 여부.
 * @property {olleh.maps.control.ZoomControlOptions} [zoomControlOptions] ZoomControl 옵션
 * @property {Number} [tileLayerBufferNum=0] 타일레이어에서 버퍼로 둘 타일의 갯수.
 * @property {Number} [tileLayerUpdateInterval=.1] 지도를 드래그할 때 타일의 업데이트 주기. 단위는 초.
 * @property {Boolean} [tileFadeInDuration=.3] 타일 로딩시 페이드인 효과의 지속시간. 단위는 초. 0일 경우 페이드인 효과가 비활성화된다.
 * @property {Boolean} [measureControl=true] MeasureControl 생성 여부.
 * @property {olleh.maps.control.MeasureControlOptions} [measureControlOptions] MeasureControl 옵션
 * @property {Boolean} [dragInertia=true] 드래그할 때 가속 여부.
 * @property {Number} [dragInertiaThreshold] 드래그할 때 가속 판단을 위한 이벤트 간의 최소 delay 값. 값이 높을 수록 천천히 드래그해도 가속이 된다.
 * @property {Number} [dragInertiaDeceleration] 드래그할 때 거리를 계산하기 위한 마찰 계수
 * @property {Boolean} [disableDoubleClickZoom=false] true 로 지정하면 더블클릭 줌을 비활성화 한다.
 * @property {Boolean} [disableMultiTapZoom=false] true 로 지정하면 두손가락 탭 줌을 비활성화 한다.
 * @property {Boolean} [disablePinchZoom=false] true 로 지정하면 핀치줌을 비활성화 한다. 
 * @property {Boolean} [disableScrollWheelZoom=false] true 로 지정하면 스크롤휠 줌을 비활성화 한다.
 * @property {Boolean} [disableShadow=false] true 로 지정하면 마커와 인포윈도우의 그림자를 비활성화 한다.
 * @property {String} [mapTypeId] 초기 MapType id
 * @property {Boolean} [useEngMap=false] 영문지도 사용 유무, true로 지정하면 영문지도 보는 것이 가능, false로 지정하면 영문지도 숨김
 * @property {boolean} [disableDraggingCursor=true] true 로 지정하면 맵을 드래그할때 커서를 변경하는 기능을 비활성화 한다.
 * @property {Number} [longpressThreshold=750] 모바일에서 터치를 지정된 옵션값(ms) 동안 유지되면 <code>longpress</code> 이벤트가 발생한다.
 * @property {string} [disableLoadingWhilePanning=false] true 로 지정하면 패닝되는 동안에 타일과 오버레이를 로딩하지 않고 패닝이 완료된 후 로딩한다. 
                                           안드로이드에서는 기본값이 true 이며 다른 디바이스의 기본값은 false 이다.
 * @group Map
 */

//  HD 타일이 사용시 추가 되어야 할 옵션
// * @property {Boolean} [hd=false] HD 타일 사용 여부. 

// JsDoc 에서 제외되어야 할 map option. 향후 사용될 가능성은 남아 있음
// * @property {String} [draggingCursor] 맵이 드래그 될때 보여질 커서의 CSS 이름 또는 URL. <p/> see: {@link olleh.maps.Map#setCursor}
// * @property {String} [draggableCursor] 기본 커서의 CSS 이름 또는 URL
// * @property {olleh.maps.overlay.OverlayLayer} overlayLayer OverlayLayer instance. internal use only


/**
 * Map 클래스
 */
$class('olleh.maps.Map').mixin(olleh.maps.event.EventDelegator).define({
  
  $static: {
    /**
     * KT맵 기본 최대 영역의 서쪽 좌표
     * @type Number
     */
    DEFAULT_MAX_EXTENT_LEFT:171162,
    /**
     * KT맵 기본 최대 영역의 남쪽 좌표
     * @type Number
     */
    DEFAULT_MAX_EXTENT_BOTTOM:1214781,
    /**
     * KT맵 기본 최대 영역의 동쪽 좌표
     * @type Number
     */
    DEFAULT_MAX_EXTENT_RIGHT: 1744026,
    /**
     * KT맵 기본 최대 영역의 북쪽 좌표
     * @type Number
     */
    DEFAULT_MAX_EXTENT_TOP: 2787645,
    /**
     * 일반지도 MapType id. ROADMAP
     * @type String
     */
    ROADMAP: 'ROADMAP',
    /**
     * 위성지도 MapType id. SATELLITE
     * @type String
     */
    SATELLITE: 'SATELLITE',
    /**
     * 하이브리드 MapType id. HYBRID
     * @type String
     */
    HYBRID: 'HYBRID',
    /**
     * 영문지도 MapType id. ENGMAP
     * @type String
     */
    ENGMAP: 'ENGMAP',
    /**
     * 강제줌을 하기 전의 최대 줌 레벨
     * @type Number
     */
    DEFAULT_NORMAL_MAX_ZOOM: 13
  },
  
  defaultOpts: {
    mapTypeId: 'ROADMAP',
    maxExtent: new olleh.maps.Bounds(
        new olleh.maps.UTMK(171162, 1214781), // leftBottom
        new olleh.maps.UTMK(1744026, 2787645) // rightTop
    ),
    restrictedExtent: new olleh.maps.Bounds(
        new olleh.maps.UTMK(171162, 1214781), // leftBottom
        new olleh.maps.UTMK(1744026, 2787645) // rightTop  
    ),
    trackWindowSize: true,
    panAnimEaseLinearity1: 0.5,
    panAnimEaseLinearity2: olleh.maps.browser.isMobile ? 0.7 : 0.25,
    disableDraggingCursor: true,
    draggingCursor: 'url(' + olleh.maps.env.RESOURCE_URL + 'cursor/closedhand_8_8.cur), move',
    draggableCursor: 'url(' + olleh.maps.env.RESOURCE_URL + 'cursor/openhand_8_8.cur), default',
    disableLoadingWhilePanning: olleh.maps.browser.osName === 'Android',
    useEngMap: false,
  },
  
  /**
   * 생성자, 명시된 HTML elem, opts를 사용해서 새로운 객체를 생성한다.
   * @param {HTMLElement|String} elem Map 이 그려질 HTML element 또는 해당 element 의 id
   * @param {olleh.maps.MapOptions} opts Map 옵션
   */
  Map: function (elem, opts) {
    if(!elem) {
      throw Error('Map element must be specified.');
    }
    if(olleh.maps.isString(elem)) {
      elem = document.getElementById(elem);
    }
    var skeleton = olleh.maps.$skeleton;
    this._defaultOpts = olleh.maps.util.clone(this.defaultOpts);
    this._opts = opts;
    this._cursor = 'ollehmap-default';
    olleh.maps.util.dom.addClass(elem, 'ollehmap');
    this.elem = elem;
    this._cursors = [];

    // setting whether English Map 
    this._setUseEngMap(this._opts.useEngMap);
    
    /**
     * hasMobileStylesheet는 지도가 모바일용 CSS를 포함하는지 여부를 나타낸다.
     * @type Boolean
     */
    this.hasMobileStylesheet =  false;
    /**
     * Service registry. 지도에 추가된 service 들을 참조할 수 있다.
     * {@link olleh.maps.Adaptable} 을 mixin 하거나 상속 받은 경우 {@link olleh.maps.Adaptable#serviceId} field 를 지정하면
     * 해당 객체가 지도에 추가될 때 serviceId 를 키로 자동으로 services 에 추가된다.   
     * @type Object
     */
    this.services = {};
    /**
     * MapType 들이 등록되는 Registry.
     * 기본적으로 일반지도, 위성지도, 하이브리드에 대한 Layer 들이 각각 MapType 으로 등록된다.
     * @type Object
     */
    this._mapTypeRegistry = {};
    
    /**
     * Plugin Registry. 지도에 등록된 Plugin 들을 참조할 수 있다.
     * @type olleh.maps.PluginRegistry
     */
    this.pluginRegistry = new olleh.maps.PluginRegistry();
    /**
     * EventManager 는 이벤트를 관리한다.
     * @type olleh.maps.event.EventManager
     */
    this.eventMgr = new olleh.maps.event.EventManager(this, elem);
    /**
     * LayerManager 는 레이어를 관리하고 지도의 핵심 기능을 처리한다.
     * @type olleh.maps.layer.LayerManager
     */
    this.layerMgr = new olleh.maps.layer.LayerManager(this, elem);
    /**
     * ControlManager 는 컨트롤들을 관리한다.
     * @type olleh.maps.control.ControlManager
     */
    this.controlMgr = new olleh.maps.control.ControlManager(this);
    
    for (var i = 0, len = skeleton.length; i < len; i++) {
      new skeleton[i]().setMap(this);
    }
    
    if(this._opts.center)
      this.start();
  },
  
  /**
   * user option 에 default option 을 merge 하고 개별 manager 들을 start 시킨다.  
   * @private
   */
  start: function () {
    // merge default opts
    this._opts = olleh.maps.mixin(this._opts, this._defaultOpts);

    if(this._opts.mapTypeId) {
      this.setMapTypeId(this._opts.mapTypeId);
    }
    this._started = true;
    this.eventMgr.start();
    this.layerMgr.start();
    this.controlMgr.start();
    this.fireEvent('started');
    this.setCursor(null);
    if(olleh.maps.browser.hasOrientationChange) {
      this._orientation = window.orientation;
    }
  },

  /**
   * 영문지도 사용여부를 설정한다.
   * @param {Boolean} 영문지도 사용여부 
   */
  _setUseEngMap:function(useEngMap){
    this._useEngMap = useEngMap;
  },

  /**
   * 영문지도 사용여부를 반환합니다.
   * @returns {Boolean} 영문지도 사용 여부
   */
  getUseEngMap:function(){
    return this._useEngMap;
  },

  /**
   * Map 을 stop 시킨다.
   * @private
   */
  stop: function () {
    this._started = false;
    this.fireEvent('stopped');
  },

  /**
   * Map 의 start 여부를 확인할 수 있다.
   * @returns {Boolean}
   * @private
   */
  isStarted: function () {
    return !!this._started;
  },

  /**
   * MapType 을 정의하는 Plugin 을 등록한다.
   * 
   * @param {String} id map type id
   * @param {olleh.maps.Plugin|String} mapTypePlugin map type 을 정의하는 Plugin,Layer 또는 layer name 이다.
   */
  registerMapType: function(id, mapTypePlugin) {
    if(id === olleh.maps.Map.ENGMAP && !this.getUseEngMap()) return;

    if(olleh.maps.isString(mapTypePlugin)) {
      mapTypePlugin = this.layerMgr.getLayer(mapTypePlugin);
    }
    this._mapTypeRegistry[id] = mapTypePlugin;
    mapTypePlugin.setMap(this);
    if(this._mapTypeId === id) {
      this._mapTypeId = null;
      this.setMapTypeId(id);
    }
  },
  
  /**
   * MapType id 에 해당하는 plugin 을 등록 해제한다. 
   * @param id MapType Id
   */
  unregisterMapType: function(id) {
    delete this._mapTypeRegistry[id];
  },
  
  /**
   * MapType registry 를 반환한다.
   * @returns {Object} key: MapType id, value: MapType plugin
   */
  getMapTypeRegistry: function() {
    return this._mapTypeRegistry;
  },
  
  /**
   * {@link olleh.maps.Map#setMapTypeId(id)} 를 호출해 MapType 이 변경될 때 발생하는 이벤트
   * @name event:maptypeid_changed
   * @event
   * @memberOf olleh.maps.Map.prototype
   * @param {olleh.maps.event.Event} event
   * @param {Object} payload
   * @param {String} payload.mapTypeId
   */
  /**
   * 현재 MapType id 를 변경한다.
   * @param id MapType Id
   */
  setMapTypeId: function(id) {
    var log = olleh.maps.log;
    if(log.isLevel(log.INFO))
      log.info('Map#setMapTypeId: ' + id);
    
    // 타일 타입이 영문이고, 영문지도 기능 활성화가 아니면 id는 olleh.maps.Map.ROADMAP 으로 설정
    if(id === olleh.maps.Map.ENGMAP && !this.getUseEngMap()) id = olleh.maps.Map.ROADMAP;

    if(this._mapTypeId !== id) {
      var oldMapTypePlugin = this._mapTypeRegistry[this._mapTypeId];
      oldMapTypePlugin && oldMapTypePlugin.deactivate();
      this._mapTypeId = id;
      var mapTypePlugin = this._mapTypeRegistry[id];
      mapTypePlugin.activate();
      this.fireEvent('maptypeid_changed', {
        mapTypeId: id
      });
    }
  },
  
  /**
   * 현재 MapType id 를 반환한다.
   * @returns {String}
   */
  getMapTypeId: function() {
    return this._mapTypeId;
  },
  
  /**
   * 지정된 layer name 을 가지는 Layer 를 찾아서 반환한다.
   * @param {String} layerName
   */
  getLayer: function(layerName) {
    return this.layerMgr.getLayer(layerName);
  },
  
  /**
   * 지도에 추가된 base layer 들을 반환한다.
   * @returns {Array.<olleh.maps.layer.Layer>} Base Layer 배열
   */
  getBaseLayers: function() {
    return this.layerMgr.getBaseLayers();
  },
  
  /**
   * 지도에 추가된 ground layer 배열을 반환한다.
   * @returns {Array.<olleh.maps.layer.Layer>} Ground Layer 배열
   */
  getGroundLayers: function() {
    return this.layerMgr.getGroundLayers();
  },

  /**
   * 지정된 영역을 포함하는 최대 줌 레벨을 반환한다.
   * @param {olleh.maps.Bounds} bounds 사각형 지도 영역
   * @returns {Number} 줌 레벨
   */
  getZoomForBounds: function(bounds) {
    return this.layerMgr.getZoomForBounds(bounds);
  },
  
  /**
   * 좌표 coord 가 현재 지도 영역(bounds) 에 포함되는지를 확인한다.
   * @param {olleh.maps.Coord} coord 좌표
   * @returns {Boolean} 지도 영역 
   * @see olleh.maps.Map#getBounds
   */
  isValidCoord: function(coord) {
    return this.layerMgr.isValidCoord(coord);
  },
  
  /**
   * OverlayLayer 를 반환한다.
   * @returns {olleh.maps.overlay.OverlayLayer} OverlayLayer
   */
  getOverlayLayer: function () {
    return this.layerMgr.getOverlayLayer();
  },

  /**
   * 지도 중심좌표를 지정한다.
   * @param {olleh.maps.Coord} coord 지도 중심좌표
   */
  setCenter: function (coord) {
    var log = olleh.maps.log;
    if(log.isLevel(log.INFO))
      log.info('Map#setCenter: ' + coord);
    this.layerMgr.isZooming() && this._warnZooming('setCenter');
    this.layerMgr.setCenter(coord);
    this._checkStart();
  },

  /**
   * 현재 설정된 지도 중심좌표를 반환한다.
   * @returns {olleh.maps.UTMK} 지도 중심좌표
   */
  getCenter: function () {
    this.layerMgr.isZooming() && this._warnZooming('getCenter');
    return this.layerMgr.getCenter();
  },

  /**
   * 현재 설정된 지도 줌레벨을 반환한다.<br/>
   * 만일 현재 줌 애니메이션이 이루어지고 있는 상황이라면 줌 애니메이션이 끝나기전까지
   * 이 함수가 반환되는 줌 값은 변경되지 않으며 줌 애니메이션이 끝나야 값이 변경된다.  
   * @returns {Number} 지도 줌레벨
   */
  getZoom: function () {
    this.layerMgr.isZooming() && this._warnZooming('getZoom');
    return this.layerMgr.getZoom();
  },

  /**
   * 현재 화면에 보여지는 지도 영역을 UTMK 좌표로 반환한다.
   * @returns {olleh.maps.Bounds} 지도 영역
   */
  getBounds: function() {
    this.layerMgr.isZooming() && this._warnZooming('getBounds');
    return this.layerMgr.getBounds();
  },
  
  /**
   * 현재 지도의 최소 줌레벨을 반환한다.
   * @returns {Number} 최소 줌 레벨
   */
  getMinZoom: function() {
    return this.layerMgr.getMinZoom();
  },
  
  /**
   * 현재 지도의 최대 줌레벨을 반환한다.
   * @returns {Number} 최대 줌 레벨
   */
  getMaxZoom: function() {
    return this.layerMgr.getMaxZoom();
  },

  /**
   * 애니메이션 효과와 함께 줌 레벨을 변경한다. <br/>
   * 주의: 애니메이션 효과가 적용되는 함수(panTo,panToBounds,setZoom 등) 를 호출한 후 애니메이션이
   *  끝나기전에 center 나 zoom 을 변경하는 함수를 호출하면 그 결과를 보장할 수 없다.
   *  애니메이션 적용 함수의 연속적인 호출은 애니메이션이 끝났을때 발생하는 이벤트를 사용하도록 한다. <br/>
   * 주의: 애니메이션 효과와 함께 zoom 을 변경할 경우 {@link #getCenter()} 와 {@link #getZoom()} 을 통해 반환되는 center,zoom 값은
   * 애니메이션이 끝나기 전까지 변경되지 않는다.
   * @param {Number} zoom 줌 레벨
   */
  setZoom: function (zoom) {
    var log = olleh.maps.log;
    if(log.isLevel(log.INFO))
      log.info('Map#setZoom: ' + zoom);
    this.layerMgr.isZooming() && this._warnZooming('setZoom');
    this.layerMgr.setZoom(zoom);
  },

  /**
   * 애니메이션 효과와 함께 줌 레벨을 한단계 확대한다. <br/>
   * 주의: 애니메이션 효과가 적용되는 함수(panTo,panToBounds,setZoom 등) 를 호출한 후 애니메이션이
   *  끝나기전에 center 나 zoom 을 변경하는 함수를 호출하면 그 결과를 보장할 수 없다.
   *  애니메이션 적용 함수의 연속적인 호출은 애니메이션이 끝났을때 발생하는 이벤트를 사용하도록 한다.
   */
  zoomIn: function () {
    var log = olleh.maps.log;
    if(log.isLevel(log.INFO))
      log.info('Map#zoomIn');
    this.layerMgr.isZooming() && this._warnZooming('zoomIn');
    this.layerMgr.zoomIn();
  },

  /**
   * 애니메이션 효과와 함께 줌 레벨을 한단계 축소한다. <br/>
   * 주의: 애니메이션 효과가 적용되는 함수(panTo,panToBounds,setZoom 등) 를 호출한 후 애니메이션이
   *  끝나기전에 center 나 zoom 을 변경하는 함수를 호출하면 그 결과를 보장할 수 없다.
   *  애니메이션 적용 함수의 연속적인 호출은 애니메이션이 끝났을때 발생하는 이벤트를 사용하도록 한다.
   */
  zoomOut: function () {
    var log = olleh.maps.log;
    if(log.isLevel(log.INFO))
      log.info('Map#zoomOut');
    this.layerMgr.isZooming() && this._warnZooming('zoomOut');
    this.layerMgr.zoomOut();
  },

  /**
   * 지정된 영역을 완전히 포함할 수 있는 최대 줌 레벨과 좌표로 지도를 이동 및 확대/축소 한다.
   * panToBounds() 와 결과적으로 동일하지만 애니메이션 효과는 적용하지 않는다.
   * @param {olleh.maps.Bounds} bounds 사각형 지도 영역
   */
  fitBounds: function (bounds) {
    var log = olleh.maps.log;
    if(log.isLevel(log.INFO))
      log.info('Map#fitBounds: ' + bounds);
    this.layerMgr.isZooming() && this._warnZooming('fitBounds');
    this.layerMgr.fitBounds(bounds);
    this._checkStart();
  },

  /**
   * 지정된 영역을 완전히 포함할 수 있는 최대 줌 레벨과 좌표로 지도를 이동 및 확대/축소 한다.
   * fitBounds() 와 결과적으로 동일하지만 애니메이션 효과가 적용 된다. <br/>
   * 주의: 애니메이션 효과가 적용되는 함수(panTo,panToBounds,setZoom 등) 를 호출한 후 애니메이션이
   *  끝나기전에 center 나 zoom 을 변경하는 함수를 호출하면 그 결과를 보장할 수 없다.
   *  애니메이션 적용 함수의 연속적인 호출은 애니메이션이 끝났을때 발생하는 이벤트를 사용하도록 한다. 
   * @param {olleh.maps.Bounds} bounds 사각형 지도 영역
   */
  panToBounds: function (bounds) {
    var log = olleh.maps.log;
    if(log.isLevel(log.INFO))
      log.info('Map#panToBounds: ' + bounds.leftBottom.x + ', '+ bounds.leftBottom.y + ', '+ bounds.rightTop.x + ', '+ bounds.rightTop.x + ', ');
    this.layerMgr.isZooming() && this._warnZooming('panToBounds');
    this.layerMgr.panToBounds(bounds);
    this._checkStart();
  },

  /**
   * 지도 중심점을 지정된 좌표로 애니메이션 효과와 함께 이동하며 동시에 지정된 줌레벨로 확대/축소 한다. <br/>
   * 주의: 애니메이션 효과가 적용되는 함수(panTo,panToBounds,setZoom 등) 를 호출한 후 애니메이션이
   *  끝나기전에 center 나 zoom 을 변경하는 함수를 호출하면 그 결과를 보장할 수 없다.
   *  애니메이션 적용 함수의 연속적인 호출은 애니메이션이 끝났을때 발생하는 이벤트를 사용하도록 한다. <br/>
   * 주의: 애니메이션 효과와 함께 zoom 을 변경할 경우 {@link #getCenter()} 와 {@link #getZoom()} 을 통해 반환되는 center,zoom 값은
   * 애니메이션이 끝나기 전까지 변경되지 않는다. 
   * @param {olleh.maps.Coord} coord 이동할 좌표
   * @param {Number} [zoom] 변경될 줌
   * @param {String} [animation=auto] 'off' 인 경우 애니메이션을 적용하지 않는다.
   *                             'auto' 인 경우 이동할 영역과 겹치는 부분이 있으면 애니메이션을 적용하고 그외에는 적용하지 않는다. 
   */
  panTo: function (coord, zoom, animation) {
    var log = olleh.maps.log;
    if(log.isLevel(log.INFO))
      log.info('Map#panTo: coord: ' + coord + ', zoom: ' + zoom);
    this.layerMgr.isZooming() && this._warnZooming('panTo');
    this.layerMgr.panTo(coord, zoom, animation);
    this._checkStart();
  },

  /**
   * 지도를 지정된 화면 픽셀 만큼 애니메이션 효과와 함께 이동한다.
   * @param {Number} dx 가로로 이동할 픽셀
   * @param {Number} dy 세로로 이동할 픽셀
   */
  panBy: function (dx, dy) {
    var log = olleh.maps.log;
    if(log.isLevel(log.INFO))
      log.info('Map#panBy: dx: ' + dx + ' ,dy:' + dy);
    this.layerMgr.isZooming() && this._warnZooming('panBy');
    this.layerMgr.panBy(dx, dy);
  },
  
  _warnZooming: function(fnName) {
    var log = olleh.maps.log;
    if(log.isLevel(log.INFO))
      log.info('경고: 줌애니메이션 수행되는 중간에 ' +  fnName +  ' 함수를 호출하면 그 결과가 보장되지 않습니다. 애니메이션이 끝난 후에 호출하세요.');
  },
  
  
  /**
   * Viewport size 를 반환한다.
   * @returns {olleh.maps.Size} Viewport size
   */
  getViewportSize: function () {
    return this.layerMgr.getViewportSize();
  },
  
  /**
   * 현재 설정된 max extent (지도 최대 영역) 을 반환한다.
   * @returns {olleh.maps.Bounds} max extetnt
   */
  getMaxExtent: function () {
    return this._opts.maxExtent;
  },
  
  /**
   * 지도 커서를 변경한다.
   * @example 
   * map.setCursor('url(...)');
   * map.setCursor('default');
   * map.setCursor('draggable');
   * map.setCursor('dragging');
   * @param {String} cursor 커서 이름 'default', 'draggable', 'dragging', CSS 커서 속성. null 일 경우 기본 커서('default' 또는 'draggable') 로 변경한다.
   * @see http://www.w3.org/TR/CSS21/ui.html#propdef-cursor|CSS 커서 속성
   */
  setCursor: function (cursor) {
    if(olleh.maps.browser.isMobile)
      return;
    var elem = this.elem;
    if (!elem) return;
    
    if(this._cursors[this._cursors.length - 1] === cursor) return;
    
    var opts = this._opts;
    if(!cursor) {
      cursor = opts.disableDraggingCursor ? 'default' : 'draggable';
    }
    switch (cursor) {
    case 'draggable':
      cursor = opts.draggableCursor;
      break;
    case 'dragging':
      cursor = opts.draggingCursor;
      break;
    }
    this._cursors.push(cursor);
    elem.style.cursor = cursor;
  },
  
  /**
   * {@link #setCursor(cursor)} 를 호출해 cursor 를 변경하기전의 cursor 로 돌아간다. 
   */
  resetCursor: function() {
    if (this._cursors.length <= 1) return;
    this._cursors.pop();
    this.elem.style.cursor = this._cursors[this._cursors.length - 1];
  },
  
  /**
   * 지도가 시작되지 않은 경우 시작한다.
   * @private
   */
  _checkStart: function() {
    if(!this.isStarted()) {
      this.start();
    }
  }, 
  
  /**
   * Map 옵션 객체를 반환한다.
   * @returns {olleh.maps.MapOptions}
   * @private
   */
  getOptions: function() {
    return this._opts;
  },
  
  /**
   * Control 생성 옵션을 반환한다.
   * @param {String} ctrlName
   * @returns {Boolean} control 생성 여부
   * @private
   */
  checkDefaultControl: function(ctrlName){
    var ctrlOpt = this.getOption(ctrlName);
    var disableDefaultUI = this.getOption('disableDefaultUI', false);
    return (ctrlOpt === true || !disableDefaultUI && ctrlOpt !== false);
  },

  /**
   * Map 옵션 값을 반환한다. 
   * @param {String} name Map 옵션 이름
   * @param {object} defaultValue 지정된 값이 없을때 반환될 기본값
   * @private
   */
  getOption: function(name, defaultValue) {
    var value = this._opts[name];
    return value !== undefined ? value : defaultValue;
  },

  /**
   * Map 클래스 외부에서 default 옵션을 지정할 수 있다. 
   * default 옵션은 사용자가 옵션을 지정하지 않았을 경우에 사용된다. 
   * @param {Object} opts
   * @private
   */
  mergeDefaultOptions: function(opts) {
    olleh.maps.mixin(this._defaultOpts, opts, true);
  },

  /**
   * [event:resize]
   * trackWindowSize 옵션이 true 이면 resize 이벤트를 받아서 지도를 다시 그린다.
   * @private
   */
  $default_resize: function (event, payload) {
    if(this._opts.trackWindowSize) {
      var ref = 'left';
      // 모바일에서 orientation 이 변경되는 경우에는 center 를 유지한다.
      if(payload.orientation !== undefined && payload.orientation !== this._orientation) {
        ref = 'center';
        this._orientation = payload.orientation;
      }
      this.layerMgr.resize(ref);
    }
  },
  
  /**
   * viewport size 를 재계산 하고 지도 전체를 다시 그린다. 
   * Map element 의 크기가 변경되는 경우 element 의 크기를 변경하는 쪽에서 호출해야 한다.
   * @param {String} [horizontalRef=left] left,right,center 중 하나의 값을 가질 수 있다. left 인 경우 왼쪽을 고정점으로 right 인 경우 오른쪽을 고정점으로 새로운 center 가 계산된다.
   *  center 로 지정하면 center 가 변경되지 않는다. center 로 지정할 경우 verticalRef 값은 적용되지 않는다.
   * @param {String} [verticalRef=top] top 또는 bottom 값을 가질 수 있다. top 인 경우 상단을 기준으로 bottom 인 경우 하단을 기준으로 새로운 center 가 계산된다. 
   */
  resize: function(horizontalRef, verticalRef) {
    this.layerMgr.resize(horizontalRef, verticalRef);
  },
  
  /**
   * Map 에 대한 tooltip 객체를 반환한다.
   * @returns {olleh.maps.overlay.Tooltip} Tooltip 객체 
   * @private
   */
  getTooltip: function() {
    if(!this._tooltip && olleh.maps.overlay.Tooltip) {
      this._tooltip = new olleh.maps.overlay.Tooltip();
    }
    return this._tooltip;
  }

});
/**
 * 타일을 나타내는 클래스
 */
$class('olleh.maps.layer.Tile').mixin(olleh.maps.event.EventDelegator).define({

  /**
   * 생성자, 명시된 layer를 이용하여 새로운 객체를 생성한다.
   * @param {olleh.maps.layer.TileLayer} layer
   */
  Tile: function (layer) {
    this.setLayer(layer);
    this._animationPolicy = 'none';
    this._loading = false;
  },
  
  /**
   * @private
   * @return {olleh.maps.layer.TileLayer} 레이어
   */
  getLayer: function () {
    return this._layer;
  },

  /**
   * @private
   * @param {olleh.maps.layer.TileLayer} layer 레이어
   */
  setLayer: function (layer) {
    this._layer = layer;
  },

  /**
   * @private
   * @return {olleh.maps.layer.TileLayer} 레이어
   */
  getBubble: function () {
    return this._layer;
  },

  /**
   * @private
   */
  setEffectPolicy: function (animationPolicy) {
    this._animationPolicy = animationPolicy;
  },
  
  /**
   * @private
   * @return {boolean}
   */
  isLoading: function () {
    return this._loading;
  },

  /**
   * @private
   */
  getPosition: function () {
    return this._position;
  },

  /**
   * @private
   */
  setPosition: function (position) {
    this._position = position;
    this._root && this._updatePosition();
  },

  /**
   * modify r2fresh
   * @private
   */
  _getTileSize: function(){
    var normalMaxZoom = olleh.maps.Map.DEFAULT_NORMAL_MAX_ZOOM;
    var tileSize = this._layer.tileSize;
    var zoom = this._layer.layerMgr.getZoom();
    var tileSizeW = (zoom > normalMaxZoom) ? tileSize.width * ( (zoom - normalMaxZoom) * 2 ) : tileSize.width;
    var tileSizeH = (zoom > normalMaxZoom) ? tileSize.height * ( (zoom - normalMaxZoom) * 2 ) : tileSize.height;
    return {'width':tileSizeW,'height':tileSizeH}
  },

  /**
   * @private
   */
  _updatePosition: function () {
    // add r2fresh
    var tileSize = this._getTileSize();

    this._root.setStyles({
      left: this._position.x + 'px',
      top: this._position.y + 'px',
      // add r2fresh
      'width': tileSize.width + 'px',
      'height': tileSize.height + 'px'
    });
  },

  

  /**
   * @private
   */
  getURL: function () {
    return this._url;
  },

  /**
   * @private
   */
  setPositionAndUrl: function (position, url, animationPolicy) {
    this._position = position;
    this._url = url;
    animationPolicy && (this._animationPolicy = animationPolicy);
    this._root && this._update();
  },
  
  /**
   * @private
   */
  _update: function () {
    // tileSize add r2fresh
    var tileSize = this._getTileSize(), root = this._root, img = this._img, animation = this._layer.tileAnimation;
    
    this.stopAnimator();
    this._updatePosition();
    
    if (img.getProperty('src') != this._url) {
      img.setStyle({
        'visibility': 'hidden',
        //add r2fresh
        'width': tileSize.width + 'px',
        'height': tileSize.height + 'px'
      });
      this._loading = true;

      if (animation && (this._animationPolicy == 'always' ||
          (this._animationPolicy == 'once' && !this._layer.cachedTileURLs[this._url]))) {
        root.setStyles(animation.from);
        this._animator = animation.newAnimator(root, {
          callback: this._fadedin.bind(this)
        });
      }

      img.setStyle('visibility', '').setProperty('src', this._url);
    } else if (!this._loading) {
      this.fireEvent('loaded');
    }
  },

  /**
   * @private
   * @returns {HTMLElement}
   */
  getElement: function () {
    var browser = olleh.maps.browser;
    // modify tileSize r2fresh
    var tileSize = this._getTileSize(), root = this._root, img = this._img;
    
    if (!root) {
      if (browser.has3D && !browser.use3DRootPane) {
        root = this._root = olleh.maps.Element.create('div').setStyles({
          position: 'absolute',
          width: tileSize.width + 'px',
          height: tileSize.height + 'px',
          transform: 'translateZ(0)'
        });
        
        img = this._img = olleh.maps.Element.create('img').setStyles({
          width: tileSize.width + 'px',
          height: tileSize.height + 'px'
        });

        root.appendChild(img);
      } else {
        root = img = this._root = this._img = olleh.maps.Element.create('img').setStyles({
          position: 'absolute',
          width: tileSize.width + 'px',
          height: tileSize.height + 'px'
        });
        
        if (browser.has3D && browser.osName == 'iOS') {
          img.setStyle('transform', 'translate3d(0,0,0)');
        }
      }

      this._bound_onload = this._onload.bind(this);
      this._bound_onerror = this._onerror.bind(this);
      
      img.addEventListener('load', this._bound_onload);
      img.addEventListener('error', this._bound_onerror);
      
      this._update();
    }
    
    return root.elem;
  },
  
  /**
   * @private
   */
  stopAnimator: function () {
    if (this._animator) {
      this._animator.stop();
      this._animator = null;
    }
  },
  
  /**
   * @private
   */
  destroy: function () {
    this.stopAnimator();
    if (this._root) {
      this._img.removeEventListener('load', this._bound_onload);
      this._img.removeEventListener('error', this._bound_onerror);
      this._root = this._img = null;
    }
  },

  /**
   * @private
   */
  _onerror: function () {
    if (this._loading) {
      this.stopAnimator();
      this._loading = false;
      this._img.setProperty('src', this._layer.errorTileURL);
    }
  },
  
  /**
   * @private
   */
  _onload: function () {
    if (this._loading) {
      this._layer.cachedTileURLs[this._url] = true;

      if (this._animator) {
        this._animator.start();
      } else {
        this._loading = false;
        this.fireEvent('loaded');
      }
    }
  },

  /**
   * @private
   */
  _fadedin: function (isFinished) {
    if (isFinished) {
      this._loading = false;
      this.fireEvent('loaded');
    }
  }

});
/**
 * @typedef olleh.maps.layer.TileLayerOptions 
 * @extends olleh.maps.layer.LayerOptions
 * @property {number} [tileSize=new olleh.maps.Size(256, 256)] 타일의 크기. 픽셀 단위.
 * @property {number} [minZoom=0] 레이어가 표현할 수 있는 최소 줌레벨.
 * @property {number} [maxZoom=13] 레이어가 표현할 수 있는 최대 줌레벨=>15.
 * @property {string} [errorTileURL] 타일이 존재하지 않을 경우 나타나는 대체 타일의 URL.
 * @property {number} [maxWaitTime=3] 줌인/아웃시 최대 페이드아웃 대기시간. -1일 경우 무제한. 초 단위.
 */
//<-             L             ->
//<- -D -><-      V      ->
//<-B->                     <-B->
//+---+---------------------+---+
//|   |                     |   |
//+---+                     +---+
//|                             |
//|       +---------------+     |
//|       |               |     |
//|       |               |     |
//|       |   viewport    |     |
//|       |               |     |
//|       |               |     |
//|       +---------------+     |
//|                             |
//|         tile layer          |
//+-----------------------------+
//L = TileLayer#_getLayerSize()
//D = -TileLayer#_getDisplayOffset()
//B = TileLayer#bufferNum * TileLayer#tileSize
//V = LayerManager#getVierportSize()
//L / B = TileLayer#getGridNum()

/**
 * 특정한 크기의 정사각형 타일(이미지)로 이루어진 지도 레이어를 나타내는 클래스.
 */
$class('olleh.maps.layer.TileLayer').extend(olleh.maps.layer.Layer).define({

  $static: {
    /**
     * @constant
     * @type string
     */
    ERROR_TILE_URL: olleh.maps.env.RESOURCE_URL + 'img/tile_transparent.png',

    /**
     * @private
     * @constant
     * @type olleh.maps.Size
     */
    DEFAULT_TILE_SIZE: new olleh.maps.Size(256, 256),

    /**
     * @private
     * @constant
     * @type number
     */
    DEFAULT_MAX_WAIT_TIME: 3,
    
    /**
     * @private
     * @constant
     * @type number
     */
    DEFAULT_UPDATE_INTERVAL: .1,

    /**
     * @private
     * @constant
     * @type number
     */
    DEFAULT_BUFFER_NUM: 0,
    
    /**
     * @private
     * @constant
     * @type number
     */
    DEFAULT_TILE_FADE_IN_DURATION: .2
  },
  
  /**
   * 생성자, 새로운 객체를 생성한다.
   * @param {olleh.maps.layer.TileLayerOptions} opts 옵션.
   */
  TileLayer: function (opts) {
    var TileLayer = olleh.maps.layer.TileLayer;

    this.Tile = olleh.maps.layer.Tile;
    this.tileSize = TileLayer.DEFAULT_TILE_SIZE;
    this.minZoom = 0;
    // modify r2fresh
    // 강제 줌 가능한 줌 레벨까지 maxZoom 수정
    // 13(기존) => 15(변경)
    this.maxZoom = 15;
    this.errorTileURL = TileLayer.ERROR_TILE_URL;
    this.maxWaitTime = TileLayer.DEFAULT_MAX_WAIT_TIME;
    
    this._tileQueue = new olleh.maps.fx.AnimationFrameQueue();
    this._tileQueue.setEnabled(false);
    this._tiles = [];
    this._movingBuffer = [];
    this._visible = true;

    this._pane = olleh.maps.Element.create('div').addClass('ollehmap-noevent').setStyle('position', 'absolute');
    
    this._createGridDiv();
  },
  
  init: function () {
    olleh.maps.mixin(this, this._constructorOpts, true, [ 'tileSize', 'getTileSize', 'minZoom', 'maxZoom', 'errorTileURL', 'maxWaitTime' ]);
    olleh.maps.layer.TileLayer.$super.init.apply(this, arguments);
  },
  
  start: function () {
    var TileLayer = olleh.maps.layer.TileLayer;
    var tileFadeInDuration = this.map.getOption('tileFadeInDuration', TileLayer.DEFAULT_TILE_FADE_IN_DURATION);
    if (olleh.maps.browser.style.opacity && tileFadeInDuration !== 0) {
      this.tileAnimation = new olleh.maps.fx.Animation({
        from: {
          opacity: '0'
        },
        to: {
          opacity: '1'
        },
        duration: tileFadeInDuration,
        timing: olleh.maps.fx.timing.easeOut
      });
    }
    this.bufferNum = this.map.getOption('tileLayerBufferNum', TileLayer.DEFAULT_BUFFER_NUM);
    this._updateInterval = this.map.getOption('tileLayerUpdateInterval', TileLayer.DEFAULT_UPDATE_INTERVAL);
    this._disableLoadingWhilePanning = this.map.getOption('disableLoadingWhilePanning', false);
    
    // 타일의 최대 줌까지 가지고 오도록 하는 코드 (add code r2fresh)
    var mapMaxZoom = this.map.getOptions().maxZoom;
    this.maxZoom = (mapMaxZoom && mapMaxZoom <= 15) ? mapMaxZoom : this.maxZoom;
  },

  /**
   * pane을 반환한다.
   * @returns {HTMLElement} pane 엘리먼트.
   */
  getPane: function () {
    return this._pane.elem;
  },
  
  /**
   * 현재 줌레벨에서 타일의 크기를 반환한다.
   * @returns {number} 타일의 크기.
   */
  getTileSize: function () {
    // modify r2fresh
    // 강제줌을 위해 소스코드 추가
    var normalMaxZoom = olleh.maps.Map.DEFAULT_NORMAL_MAX_ZOOM;
    var zoom = this.layerMgr.getZoom();
    var tileSize = ( zoom > normalMaxZoom ) ? this.tileSize.multiplyBy((zoom - normalMaxZoom) * 2) : this.tileSize;
    return tileSize;
   // return this.tileSize;
  },
  
  /**
   * 가시성을 설정한다.
   * @returns {boolean} 표시될 경우 <code>true</code>, 그렇지 않을 경우 <code>false</code>.
   */
  setVisible: function (visible) {
    if (this._visible != visible) {
      this._visible = visible;
      this._updateVisibility();
    }
  },

  /**
   * 가시성을 반환한다.
   * @return {boolean} <code>true</code>일 경우 표시, 그렇지 않을 경우 숨김.
   */
  isVisible: function () {
    return this._visible;
  },
  
  /**
   * @private
   */
  _updateVisibility: function () {
    this._pane.setStyle('display', this._visible && this.isVisibleForZoom() ? 'block' : 'none');
  },

  /**
   * @private
   * @return {boolean}
   */
  isVisibleForZoom: function () {
    var zoom;
    if (!this.map) {
      return false;
    }
    zoom = this.map.getZoom();
    return this.minZoom <= zoom && zoom <= this.maxZoom;
  },

  
  ////////////////////////////////////////
  // Internal
  ////////////////////////////////////////
  
  /**
   * 레이어가 출력하는 화면 영역의 크기를 리턴한다. 버퍼가 차지하는 영역도 포함된다.
   * @private
   * @returns {olleh.maps.Size} 레이어가 출력하는 화면 영역의 크기.
   */
  _getLayerSize: function () {
    var gridNum = this._gridNum;

    // FIXME- android chrome에서 에러 발생(#30257)
    if (!gridNum) {
      return;
    }
    var tileSize = this.getTileSize();

    return new olleh.maps.Size(tileSize.width * gridNum.x,
        tileSize.height * gridNum.y);
  },

  /**
   * 뷰포트를 기준으로 한 현재 레이어의 위치를 리턴한다.
   * @private
   * @returns {olleh.maps.Point} 뷰포트를 기준으로 한 현재 레이어의 위치.
   */
  _getDisplayOffset: function () {
    var offset = this._offset;
    var layerOffset = this.layerMgr.getLayerOffset();
    return new olleh.maps.Point(offset.x + layerOffset.x,
        offset.y + layerOffset.y);
  },

  /**
   * @private
   * @returns {olleh.maps.Point}
   */
  _getTilePosition: function (x, y) {
    var offset = this._offset;
    var tileSize = this.getTileSize();
    return new olleh.maps.Point(offset.x + x * tileSize.width,
        offset.y + (this._gridNum.y - 1 - y) * tileSize.height);
  },
  
  /**
   * @private
   */
  _createGridDiv: function () {
    this._div = olleh.maps.Element.create('div')
        .setStyle('position', 'absolute')
        .addClass('ollehmap-noevent');
    this._pane.appendChild(this._div);
  },

  /**
   * @private
   * @param {string} url
   * @returns {olleh.maps.layer.Tile}
   */
  _removeTileFromArray: function (url, arr) {
    var i, l;
    for (i = 0, l = arr.length; i < l; i++) {
      if (arr[i].getURL() == url) {
        return arr.splice(i, 1)[0];
      }
    }
    return null;
  },


  /**
   * @private
   */
  _getGridNum: function () {
    var viewportSize = this.layerMgr.getViewportSize()
    var tileSize = this.getTileSize();
    var bufferNum = this.bufferNum;
    return {
      x: Math.ceil(viewportSize.width / tileSize.height) + 1 + bufferNum * 2,
      y: Math.ceil(viewportSize.height / tileSize.width) + 1 + bufferNum * 2
    };
  },
  
  ////////////////////////////////////////
  // Drawing
  ////////////////////////////////////////
  
  /**
   * @private
   */
  _cleanup: function (dontCleanZoomingBuffer) {
    this.cachedTileURLs = {};
    this._loadedTileNum = 0;
    this._unloadedTileNum = 0;
    
    this._updateVisibility();
    
    this._stopUpdateTimer();
    this._stopZoomAnimation();
    
    if (!dontCleanZoomingBuffer) {
      this._cleanZoomingBufferDiv();
    }

    // 이동 중이었을 경우 타일이 더 이상 필요 없으므로 버린다.
    this._tileQueue.clear();
  },

  /**
   * @private
   */
  _calculate: function () {
    var tileSize = this.getTileSize();
    var tileOrigin = this.tileOrigin;
    var resolution = this.layerMgr.getResolution();
    var origin = this.layerMgr.getBounds().leftBottom;

    var tileCoordSize = {
      width: tileSize.width * resolution,
      height: tileSize.height * resolution
    };

    // 좌측 하단 기준
    var coordOffset = {
      x: origin.x - tileOrigin.x,
      y: origin.y - tileOrigin.y
    };
    
    // 좌측 하단 타일의 인덱스
    var index = {
      x: Math.floor(coordOffset.x / tileCoordSize.width),
      y: Math.floor(coordOffset.y / tileCoordSize.height)
    };
    
    // 좌측 하단 타일의 lb
    var tileLeftBottom = new olleh.maps.UTMK(
        index.x * tileCoordSize.width + tileOrigin.x,
        index.y * tileCoordSize.height + tileOrigin.y);
    
    this._gridNum = this._getGridNum();
    
    this.index = index;
    
    // 좌측 상단 타일의 point
    this._offset = this.layerMgr.getLayerPxFromCoord(tileLeftBottom)
        ._subtract(0, tileSize.height * this._gridNum.y);
  },
  
  
  /**
   * @param {boolean} dontCleanZoomingBuffer
   * @private
   */
  draw: function (dontCleanZoomingBuffer) {
    var Tile = this.Tile;
    var x, y, tile, tileInfo, tilePosition, tileUrl, gridNum;
    var oldTiles = this._tiles;
    var tiles = [];
    var later = [];
    var unloadedTileNum = 0;
    
    this._cleanup(dontCleanZoomingBuffer);

    // 현재 줌레벨에서 보여지지 않는다면 여기서 중단한다.
    if (!this.isVisible() || !this.isVisibleForZoom()) {
      return;
    }
    
    this._calculate();
    
    // 타일을 만들고 그리드에 배치한다.
    this._grid = [];
    gridNum = this._gridNum;
    for (x = 0; x < gridNum.x; x++) {
      this._grid[x] = [];

      for (y = 0; y < gridNum.y; y++) {
        tileUrl = this.getTileURL(x, y);
        if (!tileUrl) {
          continue;
        }
        
        tilePosition = this._getTilePosition(x, y);
        
        // 필요로 하는 URL의 타일이 이미 존재할 경우 위치만 이동하여 그대로 재사용한다.
        // 이미지 경로가 바뀌지 않으므로 unloadedTileNum이 증가하지 않는다.
        // 타일이 없을 경우에는 일단 later 배열에 정보만을 저장한다.
        tile = this._removeTileFromArray(tileUrl, oldTiles);
        if (tile) {
          tile.setPosition(tilePosition);
          tiles.push(tile);
          this._grid[x][y] = tile;
        } else {
          later.push({
            x: x,
            y: y,
            position: tilePosition,
            url: tileUrl
          });
        }
      }
    }
    
    // later 배열에 저장된 정보에 대해 타일을 생성한다.
    // 우선적으로 기존에 존재하는 타일의 URL과 위치를 변경하여 재사용하며,
    // 더 이상 재사용할 타일이 없을 경우에만 새로 생성한다.
    while (tileInfo = later.pop()) {
      tile = oldTiles.length ? oldTiles.pop() : new Tile(this);

      tile.setPositionAndUrl(tileInfo.position, tileInfo.url, 'always');
      unloadedTileNum++;
      this._grid[tileInfo.x][tileInfo.y] = tile;
      tiles.push(tile);
      
      // 새로 생성된 타일일 경우에만 이 코드가 실행된다.
      if (!tile.getElement().parentNode) {
        this._div.appendChild(tile.getElement());
      }
    }
    
    this._tiles = tiles;
    
    // 재사용이 완료된 후 남은 찌꺼기 타일들을 처리한다.
    while (tile = oldTiles.pop()) {
      if (tile.getElement().parentNode) {
        this._div.removeChild(tile.getElement());
      }
      tile.destroy();
    }
    
    // IE 등 일부 브라우저는 캐시에 이미지가 존재할 경우 src 프로퍼티를 설정하자 마자
    // 해당 콜스택에서 바로 load 이벤트가 발생한다. 이로 인해 this._loadedTileNum이
    // 증가한 상태일 경우 여기서 타일레이어의 load 이벤트를 발생시킨다.
    if (this._loadedTileNum == unloadedTileNum) {
      olleh.maps.util.defer(this._onload, this);
    } else {
      this._unloadedTileNum = unloadedTileNum;
    }
  },
  
  
  ////////////////////////////////////////
  // Moving
  ////////////////////////////////////////

  /**
   * 레이어가 이동중인지 여부를 리턴한다.
   * @returns {boolean} 레이어가 이동중일 경우 <code>true</code>, 그렇지 않을 경우 <code>false</code>
   */
  isMoving: function () {
    return this._tileQueue.isEnabled();
  },
  
  /**
   * @private
   */
  move: function () {
    if (!this._updateTimer) {
      this._updateTimer = olleh.maps.util.delay(this._update, this._updateInterval * 1000, this);
    }
  },
  
  _stopUpdateTimer: function () {
    if (this._updateTimer) {
      window.clearTimeout(this._updateTimer);
      this._updateTimer = null;
    }
  },
  
  _update: function () {
    this._updateTimer = null;
    this._tileQueue.setEnabled(false);
    this._shiftGrid(false);
  },

  /**
   * @private
   */
  moveStart: function () {
    this._stopUpdateTimer();
    if(!this._disableLoadingWhilePanning) {
      this._tileQueue.setEnabled(true);
      this._shiftGrid(true);
    }
  },

  /**
   * @private
   */
  moveEnd: function () {
    if(this._disableLoadingWhilePanning) {
      this._shiftGrid(false);
    } else {
      this._tileQueue.setEnabled(false);
    }
    this._cleanMovingBuffer();
  },

  /**
   * @private
   * @param {boolean} useBuffer
   */
  _shiftGrid: function (useBuffer) {
    var isUpdated, viewportSize, layerSize, bufferSize, displayOffset;

    // 줌이 일어나고 있으면 추가 타일 로딩은 하지 않음
    if (this.layerMgr.isZooming()) {
      return;
    }

    // 루프 내에서 절대 변경되지 않음
    viewportSize = this.layerMgr.getViewportSize(); // V
    layerSize = this._getLayerSize(); // L
    bufferSize = this.getTileSize().multiplyBy(this.bufferNum); // B

    // FIXME- android chrome에서 에러 발생(#30257)
    if (!layerSize) {
      return;
    }

    // this._offset: 루프를 돌면서 변경될 수 있음
    do {
      isUpdated = false;

      // 뷰포트와의 상대 좌표
      displayOffset = this._getDisplayOffset(); // D

      // (case 1) -D < B : 타일을 왼쪽(-방향)으로 시프트
      //
      // <-> -D
      // <-B->                     shift
      // +---*---------------------+---+
      // |  +---------------+      |###|
      // |  |               |      |###|
      //
      // (case 2) L + D - V < B : 타일을 오른쪽(+방향)으로 시프트
      // <-             L             ->
      // <-   -D   -><-      V      ->
      //                           <-B->
      // +---+---------------------*---+
      // |###|       +---------------+ |
      // |###|       |               | |
      // shift
      
      if (-displayOffset.x < bufferSize.width) {
        this._shiftCol(-1, useBuffer);
        isUpdated = true;
      } else if (layerSize.width - (-displayOffset.x) - viewportSize.width < bufferSize.width) {
        this._shiftCol(1, useBuffer);
        isUpdated = true;
      }

      // 세로 방향에 대해서도 동일
      if (-displayOffset.y < bufferSize.height) {
        this._shiftRow(1, useBuffer);
        isUpdated = true;
      } else if (layerSize.height - (-displayOffset.y) - viewportSize.height < bufferSize.height) {
        this._shiftRow(-1, useBuffer);
        isUpdated = true;
      }
    } while (isUpdated);
    
    if (this._loadedTileNum == this._unloadedTileNum) {
      olleh.maps.util.defer(this._onload, this);
    }
  },

  /**
   * 타일을 가로 방향으로 offset만큼 시프트한다.
   * 그러나 불필요한 타일을 바로 없앨 경우 애니메이션 적용시 빈 공간이 보이게 되므로
   * 실제로는 시프트하는 대신 새로운 타일을 추가하고 기존 타일은 삭제 대상으로 표시한다.
   * 삭제 대상으로 표시된 타일은 _cleanMovingBuffer()가 호출될 때 최종적으로 지워지며,
   * 이는 보통 애니메이션 종료시 불리는 moveEnd()에서 호출된다.
   * @private
   * @param {number} offset 시프트할 가로 칸수
   */
  _shiftCol: function (offset, useBuffer) {
    var x, y, remove, add, tileCol;
    var gridNum = this._gridNum;

    if (offset < 0) {
      x = 0;
      remove = Array.prototype.pop;
      add = Array.prototype.unshift;
    } else {
      x = gridNum.x - 1;
      remove = Array.prototype.shift;
      add = Array.prototype.push;
    }

    this.index.x = this.index.x + offset;
    this._offset.x += offset * this.getTileSize().width;

    tileCol = remove.call(this._grid);

    for (y = 0; y < gridNum.y; y++) {
      tileCol[y] = this._shiftTile(tileCol[y], x, y, useBuffer);
    }

    add.call(this._grid, tileCol);
  },

  /**
   * 타일을 세로 방향으로 offset만큼 시프트한다. 방향을 제외하면 _shiftCol()과 동일하다.
   * @private
   * @param {number} offset 시프트할 세로 칸수
   */
  _shiftRow: function (offset, useBuffer) {
    var x, y, remove, add, oldTile, newTile;
    var gridNum = this._gridNum;

    if (offset < 0) {
      y = 0;
      remove = Array.prototype.pop;
      add = Array.prototype.unshift;
    } else {
      y = gridNum.y - 1;
      remove = Array.prototype.shift;
      add = Array.prototype.push;
    }

    this.index.y = this.index.y + offset;
    this._offset.y -= offset * this.getTileSize().height;

    for (x = 0; x < gridNum.x; x++) {
      oldTile = remove.call(this._grid[x]);
      newTile = this._shiftTile(oldTile, x, y, useBuffer);
      add.call(this._grid[x], newTile);
    }
  },

  /**
   * @private
   * @param {olleh.maps.layer.Tile} oldTile
   * @param {number} x
   * @param {number} y
   * @param {boolean} useBuffer
   * @return {olleh.maps.layer.Tile}
   */
  _shiftTile: function (oldTile, x, y, useBuffer) {
    var tilePosition = this._getTilePosition(x, y);
    var tileUrl = this.getTileURL(x, y);
    var tile;
    
    if (useBuffer) {
      this._movingBuffer.push(oldTile);
      tile = this._removeTileFromArray(tileUrl, this._movingBuffer);
      if (!tile) {
        tile = new this.Tile(this);
        this._appendTileLater(tile);
      }
    } else {
      tile = oldTile;
    }
    
    tile.setPositionAndUrl(tilePosition, tileUrl, 'once');
    this._unloadedTileNum++;
    
    return tile;
  },
  
  /**
   * 타일 엘리먼트를 pane에 추가한다. {@link olleh.maps.fx.AnimationFrameQueue}를 이용하므로
   * 활성화된 경우 한 프레임에 하나의 타일만 추가된다.
   * @private
   * @param {olleh.maps.layer.Tile} tile pane에 추가될 타일
   */
  _appendTileLater: function (tile) {
    this._tileQueue.push(function () {
      if (tile && !tile.getElement().parentNode) {
        this._div.appendChild(tile.getElement());
        this._tiles.push(tile);
      }
    }, this);
  },

  /**
   * 임시 타일을 pane에서 모두 제거한다.
   * @private
   */
  _cleanMovingBuffer: function () {
    var tile;
    while (tile = this._movingBuffer.pop()) {
      if (tile.getElement().parentNode) {
        if (tile.isLoading() && this._unloadedTileNum > 0) {
          this._unloadedTileNum--;
        }
        this._div.removeChild(tile.getElement());
        olleh.maps.util.removeFromArray(this._tiles, tile);
      }
      tile.destroy();
    }
  },
  
  
  ////////////////////////////////////////
  // Zooming
  ////////////////////////////////////////

  /**
   * 레이어의 줌이 변경중인지 여부를 리턴한다.
   * @returns {boolean} 레이어의 줌이 변경중일 경우 <code>true</code>, 그렇지 않을 경우 <code>false</code>
   */
  isZooming: function () {
    return !!this._zoomingScale;
  },
  
  /**
   * @private
   * @param {number} scale
   * @param {olleh.maps.Point} origin
   * @param {number} duration
   * @param {olleh.maps.fx.Pulse} [pulse]
   */
  zoomStart: function (scale, origin, duration, pulse) {
    var i, l, tile, zoomingTiles;

    if (this._zoomingScale == scale) {
      return;
    }

    this._stopCleanTimer();
    this._stopUpdateTimer();
    this._tileQueue.clear();
    
    if (!this.isZooming()) {
      // 줌이 종료된 상태이나 타일 로딩이 끝나지 않아 버퍼 div가 존재할 경우 삭제한다.
      this._cleanZoomingBufferDiv();

      zoomingTiles = this._zoomingTiles = this._tiles;
      for (i = 0, l = zoomingTiles.length; i < l; i++) {
        tile = zoomingTiles[i];
        tile.setEffectPolicy('none');
        if (tile.status == 'animating') {
          tile.stopAnimator();
        }
      }
      
      this._tiles = [];
      this._unloadedTileNum = 0;

      this._zoomingBufferDiv = this._div.setStyle('zIndex', '-1');
      this._createGridDiv();

      // 이동 중인 상태에서 줌이 일어날 경우 줌 완료시 zoomingBufferDiv 전체가 제거되므로
      // movingBuffer 내의 타일을 개별적으로 제거할 필요가 없음
      this._movingBuffer = [];
    }

    if (olleh.maps.browser.style.transform) {
      this._zoomWithTransform(scale, origin, duration, pulse);
    } else {
      this._zoomWithoutTransform(scale, origin, duration, pulse);
    }
    
    this._zoomingScale = scale;
  },

  /**
   * @private
   * @param {number} scale
   * @param {olleh.maps.Point} origin
   * @param {number} duration
   * @param {olleh.maps.fx.Pulse} [pulse]
   */
  _zoomWithTransform: function (scale, origin, duration, pulse) {
    var zoomingBufferDiv, from;
    
    if (this.isZooming()) {
      zoomingBufferDiv = this._zoomingBufferDiv;
      from = this._zoomAnimator.ignore();
    } else {
      zoomingBufferDiv = this._zoomingBufferDiv.setStyle('transformOrigin',
          origin.x + 'px ' + origin.y + 'px');
      from = {
        transform: olleh.maps.util.dom.getScaleString(1)
      };
    }
    
    this._zoomAnimator = new olleh.maps.fx.Animation({
      from: from,
      to: {
        transform: olleh.maps.util.dom.getScaleString(scale)
      },
      duration: duration,
      pulse: pulse,
      timing: olleh.maps.fx.timing.easeOut
    }).animate(zoomingBufferDiv);
  },

  /**
   * @private
   * @param {number} scale
   * @param {olleh.maps.Point} origin
   * @param {number} duration
   * @param {olleh.maps.fx.Pulse} [pulse]
   */
  _zoomWithoutTransform: function (scale, origin, duration, pulse) {
    var x, y;
    var tileSize = this.getTileSize();
    var gridNum = this._gridNum;
    var layerPx = origin.add(this._offset.subtract(origin).multiplyBy(scale));
    
    if (!this._zoomAnimators) {
      this._zoomAnimators = [];
    }
    for (x = 0; x < gridNum.x; x++) {
      if (!this._zoomAnimators[x]) {
        this._zoomAnimators[x] = [];
      }
      for (y = 0; y < gridNum.y; y++) {
        this._zoomAnimators[x][y] = new olleh.maps.fx.Animation({
          from: this._zoomAnimators[x][y] ? this._zoomAnimators[x][y].ignore() : {
            width: tileSize.width + 'px',
            height: tileSize.height + 'px',
            left: this._grid[x][y].getPosition().x + 'px',
            top: this._grid[x][y].getPosition().y + 'px'
          },
          to: {
            width: (tileSize.width * scale) + 'px',
            height: (tileSize.height * scale) + 'px',
            left: (layerPx.x + x * tileSize.width * scale) + 'px',
            top: (layerPx.y + (gridNum.y - y - 1) * tileSize.height * scale) + 'px'
          },
          duration: duration,
          timing: olleh.maps.fx.timing.easeOut,
          pulse: pulse
        }).animate(this._grid[x][y].getElement());
      }
    }
  },
  
  
  /**
   * @private
   */
  zoomEnd: function () {
      if (this.maxWaitTime >= 0 && this.isVisibleForZoom()) {
        this._cleanTimer = olleh.maps.util.delay(this._cleanZoomingBufferDiv, this.maxWaitTime * 1000, this);
      } else {
        this._cleanZoomingBufferDiv();
      }
      this.draw(true);
  },
  
  /**
   * @private
   */
  _stopCleanTimer: function() {
    if (this._cleanTimer) {
      window.clearTimeout(this._cleanTimer);
      this._cleanTimer = null;
    }
  },
  
  /**
   * @private
   */
  _stopZoomAnimation: function () {
    var x, y;
    
    this._zoomingScale = null;
    
    if (this._zoomAnimator) {
      this._zoomAnimator.stop();
      this._zoomAnimator = null;
    } else if (this._zoomAnimators) {
      for (x = 0; x < this._zoomAnimators.length; x++) {
        for (y = 0; y < this._zoomAnimators[x].length; y++) {
          this._zoomAnimators[x][y].stop();
        }
      }
      this._zoomAnimators = null;
    }
    
    this._stopCleanTimer();
  },
  
  /**
   * @private
   */
  _cleanZoomingBufferDiv: function () {
    var i, l;
    if (this._zoomingBufferDiv) {
      this._pane.removeChild(this._zoomingBufferDiv);
      this._zoomingBufferDiv = null;
      
      for (i = 0, l = this._zoomingTiles.length; i < l; i++) {
        this._zoomingTiles[i].destroy();
      }
      this._zoomingTiles = null;
    }

    this._stopCleanTimer();
  },
  
  ////////////////////////////////////////
  // Event
  ////////////////////////////////////////

  /**
   * @private
   * @param {olleh.maps.event.Event} event
   */
  $capture_loaded: function (event) {
    if (event.getSource() !== this) { // assume src === tile
      event.stopPropagation();
      this._loadedTileNum++;
      if (this._loadedTileNum == this._unloadedTileNum) {
        this._onload();
      }
    }
  },

  /**
   * @private
   */
  _onload: function () {
    if (!this._zoomAnimator && !this._zoomAnimators) {
      this._cleanZoomingBufferDiv();
    }

    this._loadedTileNum = 0;
    this._unloadedTileNum = 0;
    this.fireEvent('loaded');
  }

});
/**
 * @typedef olleh.maps.layer.OllehTileLayerOptions 
 * @extends olleh.maps.layer.TileLayerOptions
 * @property {string} tileURLTmpl 타일 URL 템플릿.
 */

/**
 * 기본 KT맵 타일레이어 구현체.
 */
$class('olleh.maps.layer.OllehTileLayer').extend(olleh.maps.layer.TileLayer).define({

  /**
   * Logo 색상 유형. black 또는 white 이다.
   * @type String
   */
  logoType: 'black',

  /**
   * @private
   * @constant
   * @type string
   */
  _OUT_OF_BOUND_TILE_URL: olleh.maps.env.RESOURCE_URL + 'img/tile_transparent.png',

  /**
   * @private
   * @constant
   * @type olleh.maps.UTMK
   */
  tileOrigin: new olleh.maps.UTMK(171162, 1214781),

  /**
   * @private
   * @constant
   * @type olleh.maps.Bounds
   */
  tileMaxBounds: new olleh.maps.Bounds(new olleh.maps.UTMK(171162, 1214781), new olleh.maps.UTMK(1744026, 2787645)),
  
  /**
   * 생성자
   * @param {olleh.maps.layer.OllehTileLayerOptions} opts 옵션.
   */
  OllehTileLayer: function (opts) {
    this.errorTileURL = olleh.maps.layer.OllehTileLayer.OUT_OF_BOUND_TILE_URL;
    this._maxTileIndex = [];
  },

  /**
   * @private
   */
  init: function () {
    olleh.maps.mixin(this, this._constructorOpts, true, [ 'tileURLTmpl', 'logoType']);
    olleh.maps.layer.OllehTileLayer.$super.init.apply(this, arguments);

    // logoType에 다른 색상을 경우 기본값 black으로 설정
    if(this.logoType !== 'black') {
      this.logoType = 'white'
    }

  },

  /**
   * @private
   * @returns {Object}
   */
  getMaxTileIndex: function () {
    var zoom = this.layerMgr.getZoom();
    var tileSize = this.getTileSize();
    var maxTileIndex = this._maxTileIndex[zoom];
    if (!maxTileIndex) {
      var tileMaxBounds = this.tileMaxBounds;
      var resolution = this.layerMgr.getResolution();
      var tileCoordSize = {
        width: tileSize.width * resolution,
        height: tileSize.height * resolution
      };
      maxTileIndex = this._maxTileIndex[zoom] = {
        x: Math.floor((tileMaxBounds.getRight() - tileMaxBounds.getLeft()) / tileCoordSize.width) - 1,
        y: Math.floor((tileMaxBounds.getTop() - tileMaxBounds.getBottom()) / tileCoordSize.height) - 1
      };
    }
    return maxTileIndex;
  },
  
  /**
   * @private
   * @param {Number} x
   * @param {Number} y
   * @returns {String} 현재 좌측 하단 타일 기준으로 (x, y) 칸 떨어진 타일의 이미지 URL
   */
  getTileURL: function (x, y) {
    // modify r2fresh
    // 강제 줌을 적용하기 위해 비교문 추가 
    // (이전) var zoom = this.layerMgr.getZoom();
    var nomalMaxZoom = olleh.maps.Map.DEFAULT_NORMAL_MAX_ZOOM;
    var zoom = ( this.layerMgr.getZoom() > nomalMaxZoom ) ? nomalMaxZoom : this.layerMgr.getZoom();
    var maxIndex = this.getMaxTileIndex();
    var tileX = this.index.x + x;
    var tileY = maxIndex.y - (this.index.y + y);
    if (tileX < 0 || tileX > maxIndex.x || tileY < 0 || tileY > maxIndex.y) {
      return this._OUT_OF_BOUND_TILE_URL;
    }

    // modify r2fresh
    // ktgis.com 도메인 => 16진수
    // gis.kt.com 도메인 => 10진수
    var tileOpt = (this.tileURLTmpl.indexOf('gis.kt.com') >= 0)?{
      x: tileX,
      y: tileY,
      z: zoom
    } : {
      x: this._fillZero(tileX.toString(16), 8),
      y: this._fillZero(tileY.toString(16), 8),
      z: this._fillZero(zoom, 2)
    }
    
    return olleh.maps.util.applyTemplate(this.tileURLTmpl, tileOpt);
  },

  /**
   * @private
   * @param {String} str
   * @param {Number} len
   * @returns {String}
   */
  _fillZero: function (str, len) {
    return '00000000'.substr(0, len - (str + '').length) + str;
  }

});
/**
 * @private
 */
$class('olleh.maps.plugin.DefaultComponents').extend(olleh.maps.Adaptable).define({
  
  attach: function () {
    var useHD = this.map.getOption('hd', olleh.maps.browser.isHDTile) && olleh.maps.browser.isHDTile;
    var env = olleh.maps.env;
    var oBase = new olleh.maps.layer.OllehTileLayer({
      name: 'OllehBase',
      label: olleh.maps.msg('일반지도'),
      layerType: 'base',
      logoType: 'black',
      tileSize: useHD ? new olleh.maps.Size(128, 128) : new olleh.maps.Size(256, 256),
      tileURLTmpl: useHD ? env.TILE_URL.HD_BASE : env.TILE_URL.BASE,
      errorTileURL: olleh.maps.env.RESOURCE_URL + 'img/tile_nodata.jpg',
      copyright: useHD ? env.TILE_COPYRIGHT.HD_BASE : env.TILE_COPYRIGHT.BASE,

      // 1차에서 삭제한 maxZoom 다시 정의 (modify r2fresh)
      maxZoom:13
    });
    this.map.registerMapType('ROADMAP',oBase);
  },
  
  detach: function () {
    // ???
  }
  
});

olleh.maps.$skeleton.push(olleh.maps.plugin.DefaultComponents);/**
 * @private
 */
$class('olleh.maps.layer.OllehAirMapType').extend(olleh.maps.Plugin).define({

  doActivate: function() {
    this.map.getLayer('OllehAir').activate();

    // 1차에서 삭제한 maxZoom 다시 정의 (modify r2fresh)
    this.map.layerMgr.setMaxZoom(14);
  }

});

/**
 * @private
 */
$class('olleh.maps.layer.OllehEngMapType').extend(olleh.maps.Plugin).define({

    doActivate: function() {
      this.map.getLayer('OllehEng').activate();
  
      // 1차에서 삭제한 maxZoom 다시 정의 (modify r2fresh)
      this.map.layerMgr.setMaxZoom(13);
    }
  
  });

/**
 * @private
 */
$class('olleh.maps.layer.OllehHybridMapType').extend(olleh.maps.Plugin).define({
  
  doActivate: function() {
    
    // 1차에서 삭제한 maxZoom 다시 정의 (modify r2fresh)
    this.map.layerMgr.setMaxZoom(13);
    this.map.getLayer('OllehAir').activate();
    this.map.getLayer('OllehAirLabel').activate();
  },
  
  doDeactivate: function() {
    this.map.getLayer('OllehAirLabel').deactivate();
  }
  
});

/**
 * @private
 */
$class('olleh.maps.layer.OllehTilesPlugin').extend(olleh.maps.Adaptable).define({
  
  attach: function () {
    this.env = olleh.maps.env;
    this.useHD = this.map.getOption('hd', olleh.maps.browser.isHDTile) && olleh.maps.browser.isHDTile;

    this.setAirMap();
    this.setEngMap();
    this.setHybridMap();
  },

  /**
   * 하이브리드 레이어 추가 함수
   */
  setHybridMap: function(){
    var oHybrid = new olleh.maps.layer.OllehTileLayer({
      name: 'OllehAirLabel',
      label: olleh.maps.msg('하이브리드 라벨'),
      layerType: 'ground',
      zIndex: 0,
      tileSize: this.useHD ? new olleh.maps.Size(128, 128) : new olleh.maps.Size(256, 256),
      tileURLTmpl: this.useHD ? this.env.TILE_URL.HD_HYBRID : this.env.TILE_URL.HYBRID,
      maxWaitTime: 0.7,

      // 1차에서 삭제한 maxZoom 다시 정의 (modify r2fresh)
      maxZoom : 13
    });
    oHybrid.setMap(this.map);
    this.ollehHybridMapType = new olleh.maps.layer.OllehHybridMapType();
    this.map.registerMapType('HYBRID', this.ollehHybridMapType);
  },

  /**
   * 항공영상 레이어 추가 함수
   */
  setAirMap: function(){
    var oAir = new olleh.maps.layer.OllehTileLayer({
      name: 'OllehAir',
      label: olleh.maps.msg('위성지도'),
      layerType: 'base',
      logoType: 'white',
      tileURLTmpl: this.env.TILE_URL.AIR,
      errorTileURL: this.env.RESOURCE_URL + 'img/tile_nodata.jpg',
      copyright: this.env.TILE_COPYRIGHT.AIR,

      // 1차에서 삭제한 maxZoom 다시 정의 (modify r2fresh)
      maxZoom : 14
    });
    oAir.setMap(this.map);
    this.ollehAirMapType = new olleh.maps.layer.OllehAirMapType();
    this.map.registerMapType('SATELLITE', this.ollehAirMapType);
  }, 

  /**
   * 영문지도 레이어 추가 함수 
   */
  setEngMap: function() {
    var oEng = new olleh.maps.layer.OllehTileLayer({
      name: 'OllehEng',
      label: olleh.maps.msg('영문지도'),
      layerType: 'base',
      logoType: 'black',
      tileURLTmpl: this.env.TILE_URL.ENG,
      errorTileURL: this.env.RESOURCE_URL + 'img/tile_nodata.jpg',
      copyright: this.env.TILE_COPYRIGHT.ENG,

      // 1차에서 삭제한 maxZoom 다시 정의 (modify r2fresh)
      maxZoom : 13
    });
    oEng.setMap(this.map);
    this.ollehEngMapType = new olleh.maps.layer.OllehEngMapType();
    this.map.registerMapType('ENGMAP', this.ollehEngMapType);
  },
  
  detach: function () {
    // ????
  }
  
});

olleh.maps.$skeleton.push(olleh.maps.layer.OllehTilesPlugin);
/**
 * 4차 Ease-in 효과에 대한 타이밍 클래스.
 */
$class('olleh.maps.fx.timing.EaseInQuad').extend(olleh.maps.fx.timing.Timing).define({
  
  /**
   * @private
   * @returns {Function}
   */
  genFn: function () {
    return function (t) {
      return t * t;
    };
  }

});
/**
 * 4차 Ease-out 효과에 대한 타이밍 클래스.
 */
$class('olleh.maps.fx.timing.EaseOutQuad').extend(olleh.maps.fx.timing.Timing).define({
  
  /**
   * @private
   * @returns {Function}
   */
  genFn: function () {
    return function (t) {
      return t * (2 - t);
    };
  }

});
/**
 * 4차 Ease-in-out 효과에 대한 타이밍 클래스.
 */
$class('olleh.maps.fx.timing.EaseInOutQuad').extend(olleh.maps.fx.timing.Timing).define({
  
  /**
   * @private
   * @returns {Function}
   */
  genFn: function () {
    return function (t) {
      return (t < .5) ? (2 * t * t) : (-1 + (4 - 2 * t) * t);
    };
  }

});
/**
 * TrafficInfoControl은 실시간 교통정보 Layer가 활성화 될 때 함께 지도에 나타나며 지도의 범례와 색상 별 위치 정보를 나타낸다. 
 * 기본 위치는 우측 상단이다.
 */
$class('olleh.maps.control.TrafficInfoControl').extend(olleh.maps.control.Control).define({
  $static: {
    /**
     * @constant
     * @type Object
     */
    SPEED_INFO: {
      '원활': {
        color: 'green',
        loadSpeed: {
          '국도,일반': '30㎞/h↑',
          '도시고속': '60㎞/h↑',
          '고속도로': '70㎞/h↑'
        }
      },
      '서행': {
        color: 'yellow',
        loadSpeed: {
          '국도,일반': '20~30㎞/h',
          '도시고속': '40~60㎞/h',
          '고속도로': '50~70㎞/h'
        }
      },
      '지체': {
        color: 'orange',
        loadSpeed: {
          '국도,일반': '10~20㎞/h',
          '도시고속': '20~40㎞/h',
          '고속도로': '30~50㎞/h'
        }
      },
      '정체': {
        color: 'red',
        loadSpeed: {
          '국도,일반': '10㎞/h↓',
          '도시고속': '20㎞/h↓',
          '고속도로': '30㎞/h↓'
        }
      }
    }
  },

  /**
   * 생성자, 새로운 TrafficInfoControl 객체를 생성한다.
   * @param {olleh.maps.control.ControlOptions} [opts] TrafficInfoControl 생성 옵션 <br>
   * opts.position 기본값 : {@link olleh.maps.control.Control.BOTTOM_LEFT}<br>
   * opts.direction 기본값 : {@link olleh.maps.control.Control.VERTICAL}
   */
  TrafficInfoControl: function (opts) {
    var _opts = olleh.maps.mixin({
      position: olleh.maps.control.Control.BOTTOM_LEFT,
      direction: olleh.maps.control.Control.VERTICAL
    }, opts, true);

    this.position = _opts.position;
    this.direction = _opts.direction;
  },

  /**
   * 컨트롤을 그린다.
   * @returns {olleh.maps.Element} 최상위 element
   * @see olleh.maps.control.Control#draw
   */
  draw: function () {
    this.tooltips = {};
    this.rdoms = [];
    var left = 0;
    var speedInfos = olleh.maps.control.TrafficInfoControl.SPEED_INFO;
    var elem = olleh.maps.Element.create('div');
    var title = document.createElement('h1');
    var imgDiv = document.createElement('div');
    var _closeTrafficInfo = function (domEvent, elem) {
      olleh.maps.util.dom.addClass(elem, 'ollehmap-hidden');
    };
    var _openTrafficInfo = function (domEvent, elem) {
      olleh.maps.util.dom.removeClass(elem, 'ollehmap-hidden');
    };

    title.innerHTML = olleh.maps.msg('실시간교통 범례');
    this.registerEventDom(elem.elem);
    elem.addClass('ollehmap-traffic-control');
    elem.setStyles({
      padding: this.padding + 'px',
      position: 'relative'
    });
    elem.appendChild(title);
    elem.appendChild(imgDiv);
    imgDiv.appendChild(document.createTextNode(' ' + olleh.maps.msg("원활") + ' '));
    olleh.maps.util.dom.addClass(imgDiv, 'imgDiv');
    for ( var i in speedInfos) {
      var speedInfo = speedInfos[i];
      var trafficBar = olleh.maps.Element.create('div');
      var loadInfos = speedInfo.loadSpeed;
      trafficBar.addClass('trafficbar');
      trafficBar.setStyles({
        backgroundColor : speedInfo.color,
        pointerEvents: 'auto'
      });
      imgDiv.appendChild(trafficBar.elem);

      if (loadInfos) {
        var tooltip = document.createElement('div');

        var ul = document.createElement('ul');
        for ( var j in loadInfos) {
          var loadInfo = loadInfos[j];
          var li = document.createElement('li');
          li.innerHTML = '<span class="a1">' + olleh.maps.msg(j) + '</span><span class="a2">: ' + loadInfo
              + '</span>';
          ul.appendChild(li);
        }
        tooltip.appendChild(ul);
        olleh.maps.util.dom.setStyle(tooltip, 'backgroundImage', 'url(' + olleh.maps.env.RESOURCE_URL + 'img/controls.png)');
        olleh.maps.util.dom.setStyle(tooltip, 'left', left + 'px');
        left += 55;
        olleh.maps.util.dom.addClass(tooltip, 'control-traffic-info');
        olleh.maps.util.dom.addClass(tooltip, 'tooltip');
        olleh.maps.util.dom.addClass(tooltip, 'ollehmap-hidden');
        elem.appendChild(tooltip);
        this.tooltips[i] = tooltip;

        trafficBar.addEventListener('mouseout', olleh.maps.curry(_closeTrafficInfo, null, tooltip));
        trafficBar.addEventListener('mouseover', olleh.maps.curry(_openTrafficInfo, null, tooltip));
      }
      this.rdoms.push(trafficBar);
    }
    imgDiv.appendChild(document.createTextNode(' ' + olleh.maps.msg('정체') + ' '));
    var infoElem = document.createElement('ul');
    infoElem.innerHTML = '<li>' + olleh.maps.msg('속도 정보 라인 위를 클릭하면, 상세 정보 확인 가능') + '</li><li>' + 
      olleh.maps.msg('시내 도로는 신호 정차 등으로 실제 속도와 다를 수 있음') + '</li>';
    elem.appendChild(infoElem);
    return elem;
  }
});
/**
 * MobileTrafficInfoControl은 실시간 교통정보 Layer가 활성화 될 때 함께 지도에 나타나며 지도의 범례와 색상 별 위치
 * 정보를 나타낸다. 기본 위치는 우측 상단이다.
 */
$class('olleh.maps.control.MobileTrafficInfoControl').extend(olleh.maps.control.Control).define({

  /**
   * MobileTrafficInfoControl 생성자
   * @param {olleh.maps.control.ControlOptions} [opts] MobileMapTypeControl 생성 옵션<br>
   * opts.position 기본값 : {@link olleh.maps.control.Control.TOP_RIGHT}<br>
   * opts.direction 기본값 : {@link olleh.maps.control.Control.HORIZONTAL}
   */
  MobileTrafficInfoControl: function (opts) {
    var Control = olleh.maps.control.Control;
    this.position = Control.TOP_RIGHT;
    this.direction = Control.HORIZONTAL;
  },

  /**
   * 컨트롤을 그린다.
   * @returns {olleh.maps.Element} 최상위 element
   * @see olleh.maps.control.Control#draw
   */
  draw: function () {
    var elem = olleh.maps.Element.create('div').setStyles({
      padding: this.padding + 'px'
    });
    var trafficImg = this._trafficImg = olleh.maps.Element.create('div').addClass('mobile-traffic-info');

    if(olleh.maps.browser.isHD)
      trafficImg.addClass('retina').setStyle('backgroundImage', 'url(' + olleh.maps.env.RESOURCE_URL + 'img/retinas.png)');
    else
      trafficImg.setStyle('backgroundImage', 'url(' + olleh.maps.env.RESOURCE_URL + 'img/mobiles.png)');
    elem.appendChild(trafficImg);
    return elem;
  }

});
/**
 * @private
 */
$class('olleh.maps.plugin.TrafficInfoPlugin').mixin(olleh.maps.Plugin).define({

  serviceId: 'trafficInfo',

  pluginInfo: {
    label: olleh.maps.msg('실시간 교통'),
    autoActivate: false,
    group: 'ground'
  },
  /**
   * TODO:
   *  생성자에서 MobileTrafficInfoControl로 생성할 것인지 일반 TrafficInfoControl로 생성할 것인지를 옵션으로 처리 예정
   */
  attach: function () {
    this.trafficLayer = new olleh.maps.layer.OllehTileLayer({
      name: 'OllehTraffic',
      layerType: 'ground',
      zIndex: 1,
      tileURLTmpl: olleh.maps.env.TILE_URL.TRAFFIC,
      maxWaitTime: 0.7,
      map: this.map
    });

    if(!this.trafficInfoControl){
      if (olleh.maps.browser.isMobile)
        this.trafficInfoControl = new olleh.maps.control.MobileTrafficInfoControl();
      else {
        this.trafficInfoControl = new olleh.maps.control.TrafficInfoControl();
      }
    }
  },

  detach: function () {
    this.trafficLayer.setMap(null);
    this.trafficLayer = null;
    this.trafficInfoControl.setMap(null);
    this.trafficInfoControl = null;
  },

  doActivate: function () {
    this.trafficLayer.activate();
    this.trafficInfoControl.setMap(this.map);
  },

  doDeactivate: function () {
    this.trafficLayer.deactivate();
    this.trafficInfoControl.setMap(null);
  }
});

olleh.maps.$skeleton.push(olleh.maps.plugin.TrafficInfoPlugin);
/**
 * OverlayOptions Object Specification
 * @typedef olleh.maps.overlay.OverlayOptions
 * @property {olleh.maps.Map} [map] 오버레이 를 표시할 지도. null 일 경우 현재 표시중인 지도에서 삭제된다.
 */

/**
 * 오버레이를 정의하는 interface
 */
$class('olleh.maps.overlay.Overlay').extend(olleh.maps.Initializable).mixin(olleh.maps.event.EventDelegator, olleh.maps.Adaptable).define({
  
  /**
   * position_changed 이벤트. 
   * 크기가 없는 Overlay 의 지도상 위치가 변경된 경우 발생 된다.
   * @event olleh.maps.overlay.Overlay#event:position_changed
   * @param {olleh.maps.event.Event} event
   * @param {Object} payload
   * @param {olleh.maps.Coord} payload.from 이전 좌표
   * @param {olleh.maps.Coord} payload.to 이후 좌표
   */
  /**
   * bounds_changed 이벤트.
   * 크기를 가지는 Overlay 의 지도상 위치 또는 크기가 변경된 경우 발생 된다.
   * @event olleh.maps.overlay.Overlay#event:bounds_changed
   * @param {olleh.maps.event.Event} event
   * @param {olleh.maps.Bounds} payload.from 이전 Bounds
   * @param {olleh.maps.Bounds} payload.to 이후 Bounds
   */

  /**
   * 생성자, 명시된 opts를 사용해서 새로운 객체를 생성한다.
   * @param {olleh.maps.overlay.OverlayOptions} opts
   */
  Overlay: function (opts) {
    this._constructorOpts = opts || {};
    this._bubble = null;
  },

  /**
   * 생성자 호출이 완료된 직후 자동으로 호출된다.
   * @private
   */
  init: function () {
    this.setOptions(this._constructorOpts);
    this._constructorOpts = null;
  },

  /**
   * 옵션을 지정한다.
   * @param {olleh.maps.overlay.OverlayOptions} opts 옵션.
   */
  setOptions: function (opts) {
    opts.visible !== undefined && this.setVisible(opts.visible);
    opts.map !== undefined && this.setMap(opts.map);
  },
  
  /**
   * 오버레이가 지도에 추가된 상태인 경우 true 를 반환한다.
   * @returns {Boolean}
   * @private
   */
  isAdded: function () {
    return !!this.layer;
  },

  /**
   * 오버레이를 화면에 그린다.
   * 하위 클래스에서는 element 들을 pane 에 붙이는 작업을 수행해야 한다.
   * 추가적으로 {@link olleh.maps.event.EventDelegator#registerEventDom} 을 사용해서
   * 이벤트를 받을 element 를 등록하도록 한다.
   * 만일 이전에 생성해놓은 element 가 이미 존재한다면 재사용할 수 있다.
   * @param {Boolean} onAdd 오버레이가 지도에 새롭게 추가된 직후 draw() 가 호출되는 경우 true
   * @private  
   */
  draw: function (onAdd) {
    // Subclass should override this
  },

  /**
   * draw() 로 그려진 내용을 지운다.
   * 하위 클래스에서는 생성된 element 를 pane 에서 제거하는 작업을 수행해야 한다.
   * 추가적으로 {@link olleh.maps.event.EventDelegator#unregisterEvent}을 사용해서
   * Overlay 를 이벤트 시스템에서 등록해지 한다.
   * 오버레이가 화면 밖으로 나가는 경우에 erase() 가 호출될 수 있으며 다시 draw() 가 호출될것에 대비해
   * element 에 대한 reference 를 계속 유지할 필요가 있다. 
   * @param {Boolean} onRemove 오버레이가 지도에 새롭게 추가되어 draw() 가 호출되는 경우 true
   * @private 
   */
  erase: function (onRemove) {
    // Subclass should override this
  },

  /**
   * 가시성을 설정한다.
   * @param {Boolean} visible true 이면 화면에 보이고 false 이면 화면에서 숨긴다. 
   */
  setVisible: function (visible) {
    // Subclass should override this
  },

  /**
   * 가시성을 반환한다.
   * @returns {Boolean}
   */
  isVisible: function () {
    // Subclass should override this
  },

  /**
   * zoom animation 이 시작되기 직전에 호출된다. 줌이 완료되는 시점에 zoomEnd() 가 호출된다.
   * @param {Number} scale 확대/축소 비율. zoomEnd() 호출 없이 여러번 zoomStart() 만 호출되는 경우
   *  최초 zoomStart() 호출 대비 비율이 된다.
   * @param {olleh.maps.Point} origin zoom animation 수행 중심점
   * @param {Number} duration zoom animation 이 수행되는 시간
   * @param {olleh.maps.fx.Pulse} [pulse] 펄스. 지정될 경우 줌 애니메이션이 펄스에 동기화된다.
   * @private
   */
  zoomStart: function (scale, origin, duration, pulse) {
    // Subclass should override this
  },

  /**
   * zoom animation 이 완료된 직후에 호출된다.
   * @private
   */
  zoomEnd: function () {
    // Subclass should override this
  },

  /**
   * 오버레이가 지도 영역을 차지한다면 해당 영역을 나타내는 bounds 를 반환한다.
   * 특정한 위치를 가리키는 Marker 와 같은 종류의 오버레이는 이 함수를 구현할 필요는 없다.
   * @returns {olleh.maps.Bounds}
   * @private
   */
  getBounds: function () {
    // Sublcass may override this
    return null;
  },

  /**
   * 오버레이가 특정 지점을 나타내는 경우 해당되는 지점의 coord 좌표를 반환한다.
   * 영역을 나타내는 GroundOverlay 와 같은 오버레이는 이 함수를 구현할 필요가 없다.
   * @returns {olleh.maps.Coord}
   * @private
   */
  getPosition: function () {
    // Sublcass may override this
    return null;
  },

  /**
   * 오버레이의 bubble target 을 명시적으로 설정한다.
   * 설정하지 않는 경우 {@link olleh.maps.layer.Layer} 가 bubble target 이 된다.
   * @param bubble
   * @private
   */
  setBubble: function (bubble) {
    this._bubble = bubble;
  },

  /**
   * 오버레이의 bubble target 을 반환한다.
   * @private
   */
  getBubble: function () {
    return this._bubble || this.layer;
  },

  /**
   * 오버레이가 속한 layer 를 반환한다.
   * @returns {olleh.maps.layer.Layer} layer 개체
   */
  getLayer: function () {
    return this.layer;
  },
  
  attach: function() {
    this.map.getOverlayLayer().add(this);
  },

  detach: function() {
    this.layer && this.layer.remove(this);
  },
  
  /**
   * OverlayLayer 에서 Overlay 가 화면 안에 존재하는지 여부를 설정해 준다. 
   * @param {boolean} displayHint true 이면 화면 안에 존재
   * @private
   */
  setDisplayHint: function(displayHint) {
    // Subclass should override this
  }
  
});
/**
 * @typedef olleh.maps.overlay.BaseOverlayOptions
 * BaseOverlayOptions Object Specification
 * @property {Boolean} [visible=true] 가시성. <code>true</code>일 경우 표시된다.
 * @property {Number|String} [zIndex=auto] z-index. 값이 높을 수록 앞에 표시된다. <code>'auto'</code>일 경우 자동으로 관리된다.
 * @extends olleh.maps.overlay.OverlayOptions
 */

/**
 * HTML 기반의 오버레이 클래스이다.
 */
$class('olleh.maps.overlay.BaseOverlay').extend(olleh.maps.overlay.Overlay).define({
  
  $static: {
    /** 
     * 오버레이의 최대 z-index
     * @constant
     * @type Number 
     */
    MAX_ZINDEX: 357913940
  },

  /**
   * 생성자, 새로운 객체를 생성한다.
   */
  BaseOverlay: function () {
    this._drawn = false;
    this._visible = true;
    this._zIndex = 'auto';
    this._displayHint = true;
    
    this.elements = {};
    this._moveAnimators = [];
  },

  /**
   * 옵션을 지정한다.
   * @param {olleh.maps.overlay.BaseOverlayOptions} opts 옵션.
   */
  setOptions: function (opts) {
    opts.zIndex !== undefined && this.setZIndex(opts.zIndex);
    olleh.maps.overlay.BaseOverlay.$super.setOptions.apply(this, arguments);
  },

  /**
   * HTML element 를 생성하고 속성값들을 생성된 HTML element 에 반영한다.
   * {@link olleh.maps.overlay.BaseOverlay#draw} 에서 이 함수를 호출한다. 
   * @private
   */
  update: function () {
    this._updateVisibility();
    this._updateZIndex();
  },
  
  /**
   * @name getIndexObject
   * @memberOf olleh.maps.overlay.BaseOverlay.prototype
   * @returns {olleh.maps.Coord|olleh.maps.Bounds}
   *         오버레이가 인덱스 기준으로 삼는 {@link olleh.maps.Coord} 또는
   *         {@link olleh.maps.Bounds} 객체를 리턴한다.
   */

  /**
   * 가시성을 반환한다.
   * @returns {Boolean} 표시될 경우 <code>true</code>, 그렇지 않을 경우 <code>false</code>.
   */
  isVisible: function () {
    return this._visible;
  },

  /**
   * 가시성을 설정한다.
   * @fires olleh.maps.overlay.BaseOverlay#event:visible_changed
   * @param {Boolean} visible <code>true</code>일 경우 표시, 그렇지 않을 경우 숨김.
   */
  setVisible: function (visible) {
    if (this._visible === visible) {
      return;
    }
    this._visible = visible;
    this._drawn && this._updateVisibility();
    
    /**
     * 가시성이 변경되었을 경우 발생한다.
     * @event olleh.maps.overlay.BaseOverlay#event:visible_changed
     * @param {olleh.maps.event.Event} event
     */
    
    this.fireEvent('visible_changed');
  },

  /**
   * @private
   */
  setDisplayHint: function(displayHint) {
    if(this._displayHint !== displayHint) {
      this._displayHint = displayHint;
      this.isDrawn() && this._updateVisibility();
    }
  },

  /**
   * @private
   */
  _updateVisibility: function () {
    var visible = this._visible && this._displayHint;
    var display = visible ? 'block' : 'none';
    if(this._display !== display) {
      this._display = display;
      this.forEachElement(function (paneId, elem) {
        olleh.maps.util.dom.setStyle(elem, 'display', this._display);
      });
    }
  },
  
  /**
   * 현재 반영된 z-index를 반환한다. {@link #bringToFront}로 지정되거나
   * z-index가 <code>'auto'</code>로 설정되어 자동으로 관리될 경우에도 최종 반영된 z-index가 반환된다.
   * @returns {Number} 현재 반영된 z-index.
   */
  getCurrentZIndex: function () {
    return this._currentZIndex;
  },
  
  /**
   * 설정된 z-index를 반환한다.
   * @returns {Number|String} z-index.
   */
  getZIndex: function () {
    return this._zIndex;
  },

  /**
   * z-index를 설정한다. z-index 는 오버레이가 표시되는 순서를 정의하며 높을수록 화면의 앞에 나타난다.
   * @param {Number|String} zIndex z-index. <code>'auto'</code>일 경우 자동으로 관리된다. 
   */
  setZIndex: function (zIndex) {
    this._zIndex = zIndex == 'auto' ? 'auto' : Math.min(olleh.maps.overlay.BaseOverlay.MAX_ZINDEX, zIndex);
    this._drawn && this._updateZIndex();
  },

  /**
   * @private
   */
  _updateZIndex: function () {
    var zIndex;
    
    if (this._isFront) {
      zIndex = olleh.maps.overlay.BaseOverlay.MAX_ZINDEX;
    } else if (this._zIndex == 'auto') {
      zIndex = this.getAutoZIndex();
    } else {
      zIndex = this._zIndex;
    }
    //TODO : ContentOverlay setContnet를 root pane를 남기고 삭제하는 구조로 변경요망 
    //if(this._currentZIndex !== zIndex) {
    this._currentZIndex = zIndex;
    this.forEachElement(function (paneId, elem) {
      olleh.maps.util.dom.setStyle(elem, 'zIndex', zIndex);
    });
    //}
  },

  /**
   * 오버레이가 가장 앞에 나타나도록 한다.
   */
  bringToFront: function () {
    if (!this._isFront) {
      this._isFront = true;
      this._drawn && this._updateZIndex();
    }
  },

  /**
   * {@link olleh.maps.overlay.BaseOverlay#bringToFront()}를 호출하기 전의 z-index 값으로 설정 한다.
   */
  resetZIndex: function () {
    if (this._isFront) {
      this._isFront = false;
      this._drawn && this._updateZIndex();
    }
  },

  /**
   * 엘리먼트가 pane에 등록되었는지 여부를 리턴한다.
   * @param {String} paneId pane ID.
   * @param {HTMLElement} elem HTML 엘리먼트.
   * @returns {Boolean} 엘리먼트가 pane에 등록되어 있을 경우 <code>true</code>, 그렇지 않을 경우 <code>false</code>.
   * @private
   */
  isRegistered: function (paneId, elem) {
    return this.elements[paneId] && olleh.maps.util.indexOf(this.elements[paneId], elem) > -1;
  },

  /**
   * 엘리먼트를 pane에 등록한다. 등록된 엘리먼트의 위치 관련 스타일은 자동으로 관리되며,
   * 지도의 이동 및 줌 변경시에 오버레이의 좌표/영역에 알맞은 위치에 나타남이 보장된다.
   * 또한 등록된 엘리먼트는 {@link olleh.maps.overlay.Overlay#setMap()}이 호출될 때 지도상에 모두 나타난다.
   * @param {String} paneId pane ID.
   * @param {HTMLElement} elem HTML 엘리먼트.
   * @private
   */
  registerElement: function (paneId, elem) {
    if (!this.isRegistered(paneId, elem)) {
      if (!this.elements[paneId]) {
        this.elements[paneId] = [elem];
      } else {
        this.elements[paneId].push(elem);
      }
      this.appendElement(paneId, elem);
    }
  },

  /**
   * 엘리먼트를 pane에서 등록 해제한다.
   * @param {String} paneId pane ID.
   * @param {HTMLElement} elem HTML 엘리먼트.
   * @private
   */
  unregisterElement: function (paneId, elem) {
    if (this.isRegistered(paneId, elem)) {
      olleh.maps.util.removeFromArray(this.elements[paneId], elem);
      this.removeElement(paneId, elem);
    }
  },
  
  /**
   * 엘리먼트를 실제 지도의 pane에 추가한다.
   * @param {String} paneId pane ID.
   * @param {HTMLElement} elem HTML 엘리먼트.
   * @private
   */
  appendElement: function (paneId, elem) {
    if (this._drawn) {
      var pane = this.getLayer().getPane(paneId);
      if (!elem.parentNode || elem.parentNode != pane) {
        olleh.maps.util.dom.setStyles(elem, this._currentStyles);
        pane.appendChild(elem);
      }
    }
  },

  /**
   * 엘리먼트를 실제 지도의 pane에서 제거한다.
   * @param {String} paneId pane ID.
   * @param {HTMLElement} elem HTML 엘리먼트.
   * @private
   */
  removeElement: function (paneId, elem) {
    elem.parentNode && elem.parentNode.removeChild(elem);
  },
  
  /**
   * {@link #registerElement()}로 등록된 모든 엘리먼트들을 실제 지도의 pane에 추가한다.
   * @private
   */
  appendElements: function () {
    this.forEachElement(this.appendElement);
  },

  /**
   * {@link #registerElement()}로 등록된 모든 엘리먼트들을 실제 지도의 pane에서 제거한다.
   * @private
   */
  removeElements: function () {
    this.forEachElement(this.removeElement);
  },

  /**
   * 오버레이가 실제로 화면에 그려진 상태인지 여부를 반환한다.
   * @returns {Boolean} 그려진 상태일 경우 <code>true</code>, 그렇지 않을 경우 <code>false</code>
   * @private
   */
  isDrawn: function () {
    return this._drawn;
  },
  
  /**
   * 오버레이를 지도에 그린다.
   * {@link olleh.maps.overlay.OverlayLayer}만이 이 메소드를 호출해야 한다.
   * @param {Boolean} onAdd 페이드인 효과 적용여부.
   * @private
   */
  draw: function (onAdd) {
    if (this.layer) {
      this.update();
      this._drawn = true;
      this.appendElements();
      if (onAdd) {
        this.onAdd();
      } else {
        this.ready();
      }
      this.registerEvent();
    }
  },

  /**
   * 오버레이를 지도에서 삭제한다.
   * {@link olleh.maps.overlay.OverlayLayer}만이 이 메소드를 호출해야 한다.
   * @param {Boolean} onRemove 페이드아웃 효과 적용여부.
   * @private
   */
  erase: function (onRemove) {
    if (this._drawn) {
      this._drawn = false;
      if (onRemove) {
        this.onRemove();
      } else {
        this.cleanup();
      }
      this.unregisterEvent();
    }
  },
  
  /**
   * @private
   * @fires olleh.maps.overlay.BaseOverlay#event:ready
   */
  ready: function () {
    /**
     * Overlay가 사용자가 조작할 수 있는 상태로 되었음을 의미하는 이벤트.
     * DOM 엘리먼트가 추가되고 페이드인 효과까지 완전히 종료되면 발생한다.
     * @name event:ready
     * @event
     * @memberof olleh.maps.overlay.BaseOverlay.prototype
     * @param {olleh.maps.event.Event} event
     */
    this.fireEvent('ready');
  },

  /**
   * @private
   * @fires olleh.maps.overlay.BaseOverlay#event:erased
   */
  erased: function () {
    /**
     * Overlay가 완전히 사라졌음을 의미하는 이벤트.
     * 페이드아웃 효과가 종료되고 DOM 엘리먼트가 제거되면 발생한다.
     * @name event:erased
     * @event
     * @memberof olleh.maps.overlay.BaseOverlay.prototype
     * @param {olleh.maps.event.Event} event
     */
    this.fireEvent('erased');
  },
  
  /**
   * @private
   */
  cleanup: function () {
    this.removeElements();
    this.erased();
  },
  
  /**
   * @private
   */
  onAdd: function () {
    this._fadeInAnimation = this.getFadeInAnimation();
    if (this._fadeInAnimation) {
      this._fadeInRequested = 0;
      this._fadeInFinished = 0;
      this.forEachElement(this._fadeInElement);
    } else {
      this.ready();
    }
  },

  /**
   * @private
   */
  onRemove: function () {
    this._fadeOutAnimation = this.getFadeOutAnimation();
    if (this._fadeOutAnimation) {
      this._removeRequested = 0;
      this._removeFinished = 0;
      this.forEachElement(this._fadeOutElement);
    } else {
      this.cleanup();
    }
  },

  /**
   * @private
   */
  getFadeInAnimation: function () {
    return null;
  },

  /**
   * @private
   */
  getFadeOutAnimation: function () {
    return null;
  },

  /**
   * @private
   */
  _fadeInElement: function (paneId, elem) {
    olleh.maps.util.dom.setStyles(elem, this._fadeInAnimation.from);
    this._fadeInRequested++;
    this._fadeInAnimation.animate(elem, {
      callback: this._onFadeInFinished,
      ctx: this
    });
  },

  /**
   * @private
   */
  _fadeOutElement: function (paneId, elem) {
    var overlay = this;
    this._removeRequested++;
    this._fadeOutAnimation.animate(elem, {
      callback: function () {
        this.parentNode && this.parentNode.removeChild(this);
        overlay._onElementRemoved();
      }
    });
  },

  /**
   * @private
   */
  _onFadeInFinished: function () {
    this._fadeInFinished++;
    if (this._fadeInFinished == this._fadeInRequested) {
      this.ready();
    }
  },

  /**
   * @private
   */
  _onElementRemoved: function () {
    this._removeFinished++;
    if (this._removeFinished == this._removeRequested) {
      this.erased();
    }
  },
  
  /**
   * 오버레이가 움직이고 있는지 여부를 반환한다.
   * @return {Boolean} 움직이고 있을 경우 <code>true</code>, 그렇지 않을 경우 <code>false</code>
   * @private
   */
  isMoving: function () {
    return !!this._moveAnimators.length && this._moveAnimators[0].status != 'finished';
  },
  
  /**
   * 오버레이의 모든 애니메이터를 중지한다.
   * @see olleh.maps.fx.Animator#stop()
   * @private
   */
  stopAnimators: function () {
    var i, l, moveAnimators = this._moveAnimators;
    for (i = 0, l = moveAnimators.length; i < l; i++) {
      if (moveAnimators[i].status != 'finished') {
        moveAnimators[i].stop();
      }
    }
    this._moveAnimators = [];
  },

  /**
   * 오버레이의 위치와 관련된 스타일을 수정한다.
   * 오버레이에 등록된 모든 엘리먼트에 일괄적으로 스타일이 적용된다.
   * @param {Object} styles key-value 쌍으로 정의된 스타일 값.
   * @private
   */
  updatePositioningStyles: function (styles) {
    this._currentStyles = styles;
    this.forEachElement(function (paneId, elem) {
      olleh.maps.util.dom.setStyles(elem, this._currentStyles);
    });
  },

  /**
   * 오버레이에 위치와 관련된 애니메이션을 적용한다.
   * 오버레이에 등록된 모든 엘리먼트에 일괄적으로 애니메이션이 적용된다.
   * @param {Object} to key-value 쌍으로 정의된 스타일 값.
   * @param {Number} [duration=0] 애니메이션의 지속시간. 생략시 즉시 적용된다. 
   * @param {olleh.maps.fx.Pulse} [pulse] 애니메이션의 펄스. 지정시 애니메이션이 펄스에 동기화된다.
   * @param {Function} [callback] 애니메이션 종료시 호출될 콜백 함수.
   * @param {Object} [ctx=this] 콜백 함수의 컨텍스트. 생략시 오버레이 객체가 된다.
   * @private
   */
  animateTo: function (to, duration, pulse, callback, ctx) {
    var from = this._currentStyles;
    
    this.stopAnimators();
    
    if (duration > 0) {

      this._finishedAnimation = 0;
      this._animationCallback = callback;
      this._animationCallbackCtx = ctx;

      this.forEachElement(function (paneId, elem) {
        this._moveAnimators.push(new olleh.maps.fx.Animation({
          from: from,
          to: to,
          duration: duration,
          pulse: pulse,
          timing: olleh.maps.fx.timing.easeOut,
          callback: this._animationFinished,
          ctx: this
        }).animate(elem));
      });

      this._currentStyles = to;
      
    } else {
    
      this.updatePositioningStyles(to);
      if (callback) {
        callback.call(ctx || this);
      }
      
    }
    
  },
  
  /**
   * @private
   */
  _animationFinished: function () {
    this._finishedAnimation++;
    if (this._finishedAnimation == this._moveAnimators.length) {
      this._moveAnimators = [];
      if (this._animationCallback) {
        this._animationCallback.call(this._animationCallbackCtx || this);
      }
    }
  },

  /**
   * 오버레이의 모든 엘리먼트에 대해 <code>fn</code> 함수를 적용한다.
   * fn의 첫 번째 파라메터로는 엘리먼트의 pane ID가, 두 번째 파라메터로는 해당 엘리먼트가 전달된다.  
   * @param {Function} fn 각의 엘리먼트에 대해 적용할 함수.
   * @private
   */
  forEachElement: function (fn) {
    var paneId, i, l, elems;
    for (paneId in this.elements) {
      elems = this.elements[paneId];
      if (elems) {
        for (i = 0, l = elems.length; i < l; i++) {
          fn.apply(this, [paneId, elems[i]]);
        }  
      }
    }
  },
  
  detach: function() {
    this.stopAnimators();
    olleh.maps.overlay.BaseOverlay.$super.detach.apply(this, arguments);
  }
  
});
/**
 * 여러개의 overlay 들을 동시에 조작하기위해서 제공되는 클래스
 */
$class('olleh.maps.overlay.OverlayGroup').mixin(olleh.maps.event.EventDelegator, olleh.maps.Adaptable).define({

  /**
   * 생성자, 명시된 opts를 사용해서 새로운 객체를 생성한다.
   * @param {Object} opts 생성자 옵션
   * @param {olleh.maps.Map} opts.map OverlayGroup 이 추가된 map 클래스
   * @param {boolean} opts.visible 초기 visibility 설정
   */
  OverlayGroup: function (opts) {
    this._overlays = [];
    this.layer = null;
    this._visible = true;
    opts && opts.visible === false && (this._visible = false); 
    if(opts && opts.map) {
      this.setMap(opts.map);
    }
  },
  
  attach: function() {
    var i, len, o;
    for(i = 0 , len = this._overlays.length ; i < len ; i++ ) {
      o = this._overlays[i];
      o.setMap(this.map);
    }
  },
  
  detach: function() {
    var i, len, o;
    for(i = 0 , len = this._overlays.length ; i < len ; i++ ) {
      o = this._overlays[i];
      o.setMap(null);
    }
  },
    
  /**
   * @see olleh.maps.event.EventDelegator#getBubble()
   */
  getBubble: function() {
    return this.map.getOverlayLayer();
  },

  /**
   * Overlay 를 OverlayGroup 에서 추가한다. 
   * <code>setMap(map)</code> 을 통해 OverlayGroup 이 지도에 추가된 상황이면
   * 해당 overlay 를 지도에도 추가한다. 
   * @param overlay
   */
  add: function (overlay) {
    this._overlays.push(overlay);
    overlay.setVisible(this._visible);
    this.map && overlay.setMap(this.map);
    overlay.setBubble(this);
  },

  /**
   * Overlay 를 OverlayGroup 에서 제거한다. 
   * <code>setMap(map)</code> 을 통해 OverlayGroup 이 지도에 추가된 상황이면
   * 해당 overlay 를 지도에서도 제거한다. 
   * @param overlay
   */
  remove: function (overlay) {
    olleh.maps.util.removeFromArray(this._overlays, overlay);
    this.map && overlay.setMap(null);
    overlay.setBubble(null);
  },

  /**
   * 모든 overlay 의 visiblity 를 변경한다.
   * @param {Boolean} visible
   */
  setVisible: function (visible) {
    if (this._visible !== visible) {
      var o, i = this._overlays.length;
      this._visible = visible;
      while(i--) {
        o = this._overlays[i];
        o.setVisible(visible);
      }
    }
  },

  /**
   * <code>setVisible(visible)</code> 로 지정한 visible 값을 반환한다.
   * @returns {Boolean}
   */
  isVisible: function () {
    return this._visible;
  }
});
/**
 * @private
 */
$class('olleh.maps.plugin.Overlay').extend(olleh.maps.Adaptable).define({
  
  attach: function () {
    this.map._opts = olleh.maps.mixin(this.map._opts, {
      overlayLayer: new olleh.maps.overlay.OverlayLayer()}, true);
  },

  detach: function () {
  }

});

olleh.maps.$skeleton.push(olleh.maps.plugin.Overlay);/**
 * PointedOverlayOptions Object Specification
 * @typedef olleh.maps.overlay.PointedOverlayOptions
 * @extends olleh.maps.overlay.BaseOverlayOptions 
 * @property {olleh.maps.Coord} position 지도상 좌표.
 */

/**
 * 지도상의 특정 지점에 존재하는 오버레이를 나타내는 클래스.
 */
$class('olleh.maps.overlay.PointedOverlay').extend(olleh.maps.overlay.BaseOverlay).define({

  /**
   * 생성자, 명시된 opts를 사용해서 새로운 객체를 생성한다.
   * @param {olleh.maps.overlay.PointedOverlayOptions} opts 옵션.
   */
  PointedOverlay: function () {
  },

  /**
   * 옵션을 지정한다.
   * @param {olleh.maps.overlay.PointedOverlayOptions} opts 옵션.
   */
  setOptions: function (opts) {
    opts.position && this.setPosition(opts.position);
    olleh.maps.overlay.PointedOverlay.$super.setOptions.apply(this, arguments);
  },

  /**
   * @private
   * @see olleh.maps.overlay.BaseOverlay#update
   */
  update: function () {
    this._updatePosition();
    olleh.maps.overlay.PointedOverlay.$super.update.apply(this, arguments);
  },
  
  /**
   * @private
   * @returns {olleh.maps.Coord}
   */
  getIndexObject: function () {
    return this.getPosition();
  },
  
  /**
   * @private
   * @returns {number}
   */
  getAutoZIndex: function () {
    var coord = this._position.asDefault();
      // Chrome Bug : zIndex 값이 음수일 경우 오동작 양수로 변환
    var maxTopCoord = this.layer.layerMgr.getMaxExtent().getTop();
    return Math.round(maxTopCoord - coord.y);
  },

  /**
   * 지도상 좌표를 반환한다.
   * @returns {olleh.maps.Coord} 지도상 좌표.
   */
  getPosition: function () {
    return this._position;
  },
  
  /**
   * 지도상 좌표를 설정한다.
   * @fires olleh.maps.overlay.PointedOverlay#event:position_changed
   * @param {olleh.maps.Coord} position 지도상 좌표.
   */
  setPosition: function (position) {
    var before = this._position;
    position = olleh.maps.UTMK.valueOf(position);
    this._position = position;
    if(this.isDrawn()) {
      this._updatePosition();
    }
    this.fireEvent('position_changed',{from: before, to: position});
  },

  /**
   * @private
   */
  _updatePosition: function () {
    if (!this._position) {
      throw new Error("Position is not set.");
    }
    this._currentLayerPx = this.getOriginalLayerPx();
    this.updatePositioningStyles(olleh.maps.util.dom.getPositionStyles(this._currentLayerPx.x, this._currentLayerPx.y));
  },

  /**
   * @param {Number} scale
   * @param {olleh.maps.Point} origin
   * @param {Number} duration
   * @param {olleh.maps.fx.Pulse} [pulse]
   * @private
   */
  zoomStart: function (scale, origin, duration, pulse) {
    //var originalLayerPx = this.getOriginalLayerPx();
    //var newPx = origin.add(originalLayerPx.subtract(origin).multiplyBy(scale)).round();
    var layerMgr = this.layer.layerMgr;
    var newPx = layerMgr.getLayerPxFromCoord(this._position, true);
    this.moveTo(newPx, duration, pulse);
  },

  /**
   * @private
   */
  zoomEnd: function () {
    this.stopAnimators();
  },

  /**
   * 지정된 화면상의 좌표로 이동시킨다.
   * 지도상 좌표(position)는 변경되지 않기 때문에 줌이 변경되거나 draw() 를 호출하면 원 위치에 그려지게 된다. 
   * @param {olleh.maps.Point} px 이동할 화면상 좌표.
   * @param {Number} [duration=0] 이동 시간, 초 단위. 0 이상의 값을 지정하면 애니메이션 효과가 적용된다.
   * @param {olleh.maps.fx.Pulse} [pulse] 펄스. 지정시 이동 애니메이션이 펄스에 동기화된다.
   * @param {Function} [callback] 이동이 완료된 후 호출되는 콜백 함수.
   * @private
   */
  moveTo: function (px, duration, pulse, callback) {
    this.animateTo(olleh.maps.util.dom.getPositionStyles(px.x, px.y), duration, pulse, callback);
    this._currentLayerPx = px;
  },

  /**
   * 현재 화면상 좌표를 지정된 좌표만큼 이동시킨다.
   * 지도상 좌표는 변경되지 않기 때문에 줌이 변경되거나 draw() 를 다시 호출하면 원 위치에 그려지게 된다. 
   * @param {olleh.maps.Point} px 더해질 화면상 좌표.
   * @param {Number} [duration=0] 이동 시간, 초 단위. 0 이상의 값을 지정하면 애니메이션 효과가 적용된다.
   * @param {olleh.maps.fx.Pulse} [pulse] 펄스. 지정시 이동 애니메이션이 펄스에 동기화된다.
   * @param {Function} [callback] 이동이 완료된 후 호출되는 콜백 함수.
   * @private
   */
  move: function (px, duration, pulse, callback) {
    this.moveTo(this._currentLayerPx.add(px), duration, pulse, callback);
  },

  /**
   * 지도상 좌표에 따른 초기 화면상 좌표를 리턴한다.
   * @returns {olleh.maps.Point} 초기 화면상 좌표
   * @private
   */
  getOriginalLayerPx: function () {
    return this.layer.layerMgr.getLayerPxFromCoord(this._position);
  },

  /**
   * 현재 화면상 좌표를 반환한다.
   * 초기 값은 {@link olleh.maps.overlay.PointedOverlay#getOriginalLayerPx()} 와 동일하나
   * {@link olleh.maps.overlay.PointedOverlay#moveTo()} 나
   * {@link olleh.maps.overlay.PointedOverlay#move()} 를 호출하면 변경될 수 있다.
   * @returns {olleh.maps.Point} 현재 화면상 좌표.
   * @private
   */
  getCurrentLayerPx: function () {
    return this._currentLayerPx;
  },

  /**
   * @param {olleh.maps.event.Event}
   * @param {Object} payload
   * @private
   */
  $default_mouseover: function (event, payload) {
    event.preventDefault();
    this.bringToFront();
  },

  /**
   * @param {olleh.maps.event.Event}
   * @param {Object} payload
   * @private
   */
  $default_mouseout: function (event, payload) {
    event.preventDefault();
    this.resetZIndex();
  },

  /**
   * @param {olleh.maps.event.Event}
   * @param {Object} payload
   * @private
   */
  $current_position_changed: function (event, payload) {
    this.isAdded() && this._updateZIndex();
  }
});
/**
 * 마커의 드롭 효과에 대한 타이밍 클래스.
 */
$class('olleh.maps.overlay.DropTiming').extend(olleh.maps.fx.timing.Timing).define({

  /**
   * @private
   * @returns {Function}
   */
  genFn: function () {
    return function (t) {
      return (t < .5) ? 2 * t * t : t * (t - 1.5) + 1.5;
    };
  }
});
///////////////////////////
//  Marker 생성 옵션   //
///////////////////////////
/**
 * MarkerOptions Object Specification
 * @typedef olleh.maps.overlay.MarkerOptions
 * @property {String|Object} [icon=olleh.maps.overlay.Marker.DEFAULT_ICON] 마커 전경 아이콘. <code>String</code>타입으로 입력 시 해당
 *           url 이미지의 마커아이콘 생성
 * @property {String|Object} [shadow=olleh.maps.overlay.Marker.DEFAULT_SHADOW] 마커 그림자. <code>String</code>타입으로 입력 시 해당
 *           url 이미지의 마커그림자 생성
 * @property {String|Object} [caption] 마커 캡션. <code>String</code>타입으로 입력 시 해당
 *           텍스트를 기본 스타일로 출력
 * @property {Number} [angle] 마커 회전 각도
 * @property {String} [cursor] 마커 위에 나타날 커서의 모양
 * @property {String} [title] 롤오버 텍스트
 * @property {Boolean} [draggable=false] 드래그 이벤트 수신 여부. <code>true</code>이면 마커의 drag 이벤트를 수신할 수 있음
 * @property {Boolean} [flat=false] 그림자 표시여부. <code>true</code>이면 마커의 그림자가 표시되지 앖음
 * @extends olleh.maps.overlay.PointedOverlayOptions
 */

///////////////////////////
//  MarkerIconOptions    //
///////////////////////////
/**
 * MarkerIconOptions Object Specification
 * @typedef olleh.maps.overlay.MarkerIconOptions
 * @property {String} url icon 아이콘 이미지 URL
 * @property {olleh.maps.Size} [size] icon 사이즈
 * @property {olleh.maps.Point} [anchor] icon anchor 값이 없을 경우 <code>olleh.maps.Point(icon.size.width / 2, icon.size.height)</code>로 지정
 * @property {olleh.maps.Point} [origin] 이미지 스프라이트 사용시 스프라이트될 기준점
 * @property {olleh.maps.Size} [scaledSize] 스케일된 이미지 스프라이트 사용시 변경할 크기
 */

///////////////////////////
//  MarkerCaptionOptions //
///////////////////////////
/**
 * MarkerCaptionOptions Object Specification
 * @typedef olleh.maps.overlay.MarkerCaptionOptions
 * @property {String} title 캡션 텍스트
 * @property {String} [color='#000000'] 텍스트 색상
 * @property {String} [backgroundColor='transparent'] caption 배경색상
 * @property {Number} [size=9] 텍스트 사이즈(pt 단위)
 */

/**
 * Marker는 지도 위의 특정 위치를 나타내고, 사용자와 상호작용 할 수 있는 객체이다. 
 * <p/>
 * <h5>대표적인 이벤트</h5>
 * <ul>
 * <li>{@link olleh.maps.overlay.BaseOverlay#event:visible_changed|visible_changed}</li>
 * <li>{@link olleh.maps.overlay.PointedOverlay#event:position_changed|position_changed}</li>
 * <li>{@link olleh.maps.overlay.Marker#event:animation_changed|animation_changed}</li>
 * <li>{@link olleh.maps.overlay.Marker#event:cursor_changed|cursor_changed}</li>
 * <li>{@link olleh.maps.overlay.Marker#event:draggable_changed|draggable_changed}</li>
 * <li>{@link olleh.maps.overlay.Marker#event:flat_changed|flat_changed}</li>
 * <li>{@link olleh.maps.overlay.Marker#event:icon_changed|icon_changed}</li>
 * <li>{@link olleh.maps.overlay.Marker#event:shadow_changed|shadow_changed}</li>
 * <li>{@link olleh.maps.overlay.Marker#event:title_changed|title_changed}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:click|click}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:dblclick|dblclick}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:drag|drag}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:dragend|dragend}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:dragstart|dragstart}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:mousedown|mousedown}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:mouseover|mouseover}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:mouseout|mouseout}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:mouseup|mouseup}</li>
 * </ul>
 * <p/>  
 * 
 * @example
 * marker = new olleh.maps.overlay.Marker({
 *   position: new olleh.maps.UTMK(958094, 1942790),
 *   title: "서초IC",
 *   caption: "Center(bounce)",
 *   animation: olleh.maps.overlay.Marker.BOUNCE,
 *   draggable: true
 * });
 * marker.setMap(map);
 * marker.onEvent('position_changed', function () {alert("위치변경")});
 */
$class('olleh.maps.overlay.Marker').extend(olleh.maps.overlay.PointedOverlay).define({

  $static: {

    /**
     * 사용자가 별도로 아이콘을 지정하지 않았을 경우 사용 될 기본 아이콘 Object
     * @type Object
     */
    DEFAULT_ICON: {
      url: olleh.maps.env.RESOURCE_URL + 'img/markers.png',
      size: new olleh.maps.Size(28, 40),
      origin: new olleh.maps.Point(0, 1107)
    },

    /**
     * 사용자가 별도로 아이콘을 지정하지 않았을 경우 사용 될 모바일용 기본 아이콘 Object
     * @type Object
     */
    DEFAULT_MOBILE_ICON: {
      url: olleh.maps.env.RESOURCE_URL + 'img/mobiles.png',
      size: new olleh.maps.Size(25, 37),
      origin: new olleh.maps.Point(78, 80)
    },

    // /**
    //  * 사용자가 별도로 아이콘을 지정하지 않았을 경우 사용 될 HD용 기본 아이콘 Object
    //  * @type Object
    //  */
    DEFAULT_HD_ICON: {
      url: olleh.maps.env.RESOURCE_URL + 'img/retinas.png',
      size: new olleh.maps.Size(26, 35),
      origin: new olleh.maps.Point(78, 81),
      scaledSize: new olleh.maps.Size(170, 155)
    },

    /**
     * 사용자가 별도로 그림자를 지정하지 않았을 경우 사용 될 기본 그림자 Object
     * @type Object
     */
    DEFAULT_SHADOW: {
      url: olleh.maps.env.RESOURCE_URL + 'img/markers.png',
      size: new olleh.maps.Size(34, 27),
      anchor: new olleh.maps.Point(6, 27),
      origin: new olleh.maps.Point(0, 1147)
    },

    /**
    * 사용자가 별도로 그림자를 지정하지 않았을 경우 사용 될 모바일용 기본 그림자 Object
    * @type Object
    */
    DEFAULT_MOBILE_SHADOW: {
      url: olleh.maps.env.RESOURCE_URL + 'img/mobiles.png',
      size: new olleh.maps.Size(27, 20),
      origin: new olleh.maps.Point(128, 80),
      anchor: new olleh.maps.Point(4, 20)
    },

    ///**
    // * 사용자가 별도로 그림자를 지정하지 않았을 경우 사용 될 HD용 기본 그림자 Object
    // * @type Object
    // */
    DEFAULT_HD_SHADOW: {
      url: olleh.maps.env.RESOURCE_URL + 'img/retinas.png',
      size: new olleh.maps.Size(27, 20),
      origin: new olleh.maps.Point(126, 80),
      anchor: new olleh.maps.Point(5, 20),
      scaledSize: new olleh.maps.Size(170, 155)
    },

    DRAG_POINT: {
      url: olleh.maps.env.RESOURCE_URL + 'img/markers.png',
      size: new olleh.maps.Size(20, 13),
      anchor: new olleh.maps.Point(10, 5),
      origin: new olleh.maps.Point(0, 1092)
    },

    DRAG_FLOATING_PX: 10,

    /**
     * 타겟 좌표위에서 통통 튀는 animation type
     * @type String
     */
    BOUNCE: 'bounce',

    /**
     * 타겟 좌표위로 떨어지는 animation type
     * @type String
     */
    DROP: 'drop',

    bouncePulse: new olleh.maps.fx.Pulse(1),

    dropTiming: new olleh.maps.overlay.DropTiming(),

    getBounceAnimator: function (anchor, isShadow) {
      var dx, dy, distance = 10;

      if (isShadow) {
        dy = distance * Math.SQRT1_2;
        dx = -dy;
      } else {
        dy = distance;
        dx = 0;
      }
      return new olleh.maps.fx.Animation({
        from: {
          marginLeft: -anchor.x + 'px',
          marginTop: -anchor.y + 'px'
        },
        to: {
          marginLeft: -(anchor.x + dx)+ 'px',
          marginTop: -(anchor.y + dy) + 'px'
        },
        timing: olleh.maps.fx.timing.easeOut,
        comeback: true,
        repeat: -1,
        duration: 1,
        pulse: olleh.maps.overlay.Marker.bouncePulse
      });
    },
    
    getDropAnimator: function (anchor, isShadow) {
      var dx, dy, distance = 200;

      if (isShadow) {
        dy = distance * Math.SQRT1_2;
        dx = -dy;
      } else {
        dy = distance;
        dx = 0;
      }
      return new olleh.maps.fx.Animation({
        from: {
          marginLeft: -(anchor.x + dx)+ 'px',
          marginTop: -(anchor.y + dy) + 'px'
        },
        to: {
          marginLeft: -anchor.x + 'px',
          marginTop: -anchor.y + 'px'
        },
        timing: olleh.maps.overlay.Marker.dropTiming,
        duration: 0.5
      });
    }
  },

  /**
   * 생성자, 명시된 opts를 사용해서 새로운 객체를 생성한다.
   * @param {olleh.maps.overlay.MarkerOptions} opts MarkerOptions
   */
  Marker: function (opts) {
    this._cursor = 'pointer';
    this._title = '';
    this._flat = false;
    this._draggable = false;
    this._angle = 0;
  },

  /**
   * 옵션값을 지정한다.
   * 
   * @example 
   * marker.setOptions({
   *   icon: {
   *     url: 'marker.png',
   *     size: new olleh.maps.Size(20, 20)
   *   },
   *   position: new olleh.maps.UTMK(958094, 1942790),
   *   title: '서초IC',
   *   draggable: true
   * });
   * @param {olleh.maps.overlay.MarkerOptions} opts 마커 옵션
   * @see olleh.maps.overlay.PointedOverlay#setOptions
   */
  setOptions: function (opts) {
    opts.icon && this.setIcon(opts.icon);
    opts.angle && this.setAngle(opts.angle);
    opts.shadow && this.setShadow(opts.shadow);
    opts.caption && this.setCaption(opts.caption);
    opts.cursor && this.setCursor(opts.cursor);
    opts.title && this.setTitle(opts.title);
    opts.draggable && this.setDraggable(opts.draggable);
    opts.flat && this.setFlat(opts.flat);
    opts.animation && this.setAnimation(opts.animation);
    olleh.maps.overlay.Marker.$super.setOptions.apply(this, arguments);
  },

  /**
   * @see olleh.maps.overlay.PointedOverlay#update
   */
  update: function () {
    this._updateIcon();
    this._updateAngle();
    this._updateCursor();
    this._updateShadow();
    this._updateCaption();
    this._updateAnimation();
    olleh.maps.overlay.Marker.$super.update.apply(this, arguments);
  },

  /**
   * draw시 생성된 내용들을 모두 지운다.
   * @see olleh.maps.overlay.BaseOverlay#erase
   */
  erase: function () {
    olleh.maps.overlay.Marker.$super.erase.apply(this, arguments);
    this._infoWin && this._infoWin.erase();
    if (this._tooltip) {
      this._tooltip.close();
      delete this._tooltip;
    }
  },
  
  /**
   * 마커 아이콘을 반환한다.
   * @returns {Object} icon 마커 아이콘 Object
   */
  getIcon: function () {
    return this._icon;
  },
  
  /**
   * 마커 아이콘을 설정한다.
   * @example 
   * var icon = {
   *   url:'mark.png', 
   *   size: new olleh.maps.Size(21, 30), 
   *   anchor: new olleh.maps.Point(10, 30)};
   * marker.setIcon(icon);
   * marker2.setIcon('marker.png');
   * @fires olleh.maps.overlay.Marker#event:icon_changed
   * @param {String|olleh.maps.overlay.MarkerIconOptions} icon 아이콘 이미지 URL 혹은 MarkerImage를 만들기 위한 Obect
   */
  setIcon: function (icon) {
    if (olleh.maps.isString(icon)) {
      icon = {
        url: icon
      };
    } else if (!olleh.maps.isObject(icon)) {
      throw new TypeError('Icon must be String or Object');
    }

    if (!icon.url) {
      throw new TypeError('Icon url is undefined');
    }

    icon.size || (icon.size = olleh.maps.overlay.Marker.DEFAULT_ICON.size);
    icon.anchor || (icon.anchor = new olleh.maps.Point(icon.size.width / 2, icon.size.height));

    if (this._icon != icon) {
      this._icon = icon;
      if (this.isDrawn()) {
        this._updateIcon();
        /**
         * icon_changed 이벤트. 아이콘이 변경되었을 경우 발생한다.
         * <p/>
         * @name event:icon_changed
         * @event
         * @memberOf olleh.maps.overlay.Marker.prototype
         * @param {olleh.maps.event.Event} event
         */
        this.fireEvent('icon_changed');
      }
    }
  },

  _updateIcon: function () {
    var icon = this._icon; // iconOption
    var img = this._iconImg; // iconImgDom

    if (!icon) { // 생성될 때만 해당 로직을 수행한다.
      var Marker = olleh.maps.overlay.Marker;
 
      icon = olleh.maps.browser.isHD ? Marker.DEFAULT_HD_ICON : 
        olleh.maps.browser.isMobile ? Marker.DEFAULT_MOBILE_ICON : Marker.DEFAULT_ICON;

      this._icon = icon; // _icon에 설정해야 다음 setIcon에서 event가 발생하지 않는다.
      this.setIcon(icon);
    }

    if (!img) {
      var iconDiv = olleh.maps.Element.create('div').setStyle('position', 'absolute');
      img = this._iconImg = new olleh.maps.SpritedImage();
      iconDiv.appendChild(img);
      this._updateCursor();
      this.registerElement('upper_overlay_pane', iconDiv.elem);
      this.registerEventDom(this._iconImg.elem);
    }

    if (this._currentIcon != icon) {
      img.setStyles({
        width: icon.size.width + 'px',
        height: icon.size.height + 'px',
        marginLeft: -icon.anchor.x + 'px',
        marginTop: -icon.anchor.y + 'px'
      }).setImage(icon.url, icon.origin, icon.scaledSize);
      this._currentIcon = icon;
    }
    // 회전을 위한 중심점 계산
    var origin = (100 - 100 * (icon.size.width - icon.anchor.x)
        / icon.size.width) + "% "
        + (100 - 100 * (icon.size.height - icon.anchor.y)/ icon.size.height) + "%";
    img.setStyle('transformOrigin', origin);
  },

  /**
   * 마커에 회전 각도를 지정한다.
   * @example marker.setAngle(45);
   * @fires olleh.maps.overlay.Marker#event:angle_changed
   * @param {Number} angle 마커 회전 각도
   */
  setAngle: function(angle){
    this._angle = angle;
      if (this.isDrawn()) {
        this._updateAngle();
        /**
         * angle_changed 이벤트. 마커의 각도가 변경되었을 경우 발생한다.
         * <p/>
         * @name event:angle_changed
         * @event
         * @memberOf olleh.maps.overlay.Marker.prototype
         * @param {olleh.maps.event.Event} event
         */
        this.fireEvent('angle_changed');
      }
  },

  _updateAngle: function () {
    var img = this._iconImg;
    img.setStyles({
      transform: "rotate(" + this._angle + "deg)"
    });
  },

  /**
   * 마커의 회전 각도를 반환한다.
   * @returns {Number} angle
   */
  getAngle: function(){
    return this._angle;
  },
  
  /**
   * 마커의 롤오버 텍스트를 반환한다.
   * @returns {String} title
   */
  getTitle: function () {
    return this._title;
  },
  
  /**
   * 마커에 롤오버 텍스트를 지정한다.
   * @example marker.setTitle('경복궁');
   * @fires olleh.maps.overlay.Marker#event:title_changed
   * @param {String} title 마커 롤오버 텍스트
   */
  setTitle: function (title) {
    this._title = title;
    /**
     * title_changed 이벤트. marker의 롤오버텍스트가 변경되었을 경우 발생한다.
     * <p/>
     * @name event:title_changed
     * @event
     * @memberOf olleh.maps.overlay.Marker.prototype
     * @param {olleh.maps.event.Event} event
     */
      this.isAdded() && this.fireEvent('title_changed');
  },

  /**
   * 마커 커서를 반환한다.
   * @returns {String} cursor 마커 커서
   */
  getCursor: function () {
    return this._cursor;
  },

  /**
   * 마커 위에 나타날 커서의 모양을 지정한다.
   * @example marker.setCursor('point');
   * @fires olleh.maps.overlay.Marker#event:cursor_changed
   * @param {String} cursor
   */
  setCursor: function (cursor) {
    this._cursor = cursor;
    if (this.isDrawn()) {
      this._updateCursor();
      /**
       * cursor_changed 이벤트. marker의 커서가 변경되었을 경우 발생한다.
       * @name event:cursor_changed
       * @event
       * @memberOf olleh.maps.overlay.Marker.prototype
       * @param {olleh.maps.event.Event} event
       */
      this.fireEvent('cursor_changed');
    }
  },

  _updateCursor: function () {
    this._iconImg.setStyle('cursor', this._cursor);
  },
  
  /**
   * 마커의 그림자 Object를 반환한다.
   * @returns {Object} 마커 그림자 Object
   */
  getShadow: function () {
    // TODO 이상함
    return this._shadowImg ? this._shadow : null;
  },

  /**
   * 마커의 그림자 이미지를 설정한다.
   * @example 
   * var shadow = {
   *   url:'shadow.png', 
   *   size: new olleh.maps.Size(21, 30), 
   *   anchor: new olleh.maps.Point(10, 30)};
   * marker.setShadow(shadow);
   * marker2.setShadow('shadow.png');
   * @fires olleh.maps.overlay.Marker#event:shadow_changed
   * @param {String|olleh.maps.overlay.MarkerIconOptions} shadow 그림자 이미지 URL 혹은 그림자를 만들기 위한 Obect
   */
  setShadow: function (shadow) {
    if (olleh.maps.isString(shadow)) {
      shadow = {
        url: shadow
      };
    } else if (!olleh.maps.isObject(shadow)) {
      throw new TypeError('Shadow must be String or Object');
    }

    if (!shadow.url) {
      throw new TypeError('Shadow url is undefined');
    }

    shadow.size || (shadow.size = olleh.maps.overlay.Marker.DEFAULT_SHADOW.size);
    shadow.anchor || (shadow.anchor = new olleh.maps.Point(0, shadow.size.height));

    if (this._shadow != shadow) {
      this._shadow = shadow;
      if (this.isDrawn()) {
        this._updateShadow();
        /**
         * shadow_changed 이벤트. marker의 그림자가 변경되었을 경우 발생한다.
         * <p/>
         * @name event:shadow_changed
         * @event
         * @memberOf olleh.maps.overlay.Marker.prototype
         * @param {olleh.maps.event.Event} event
         */
        this.fireEvent('shadow_changed');
      }
    }
  },

  _updateShadow: function () {
    var shadow = this._shadow, img = this._shadowImg;
    var disableShadow = this.getLayer().disableShadow;
    
    if (!shadow) {
      if(olleh.maps.browser.isHD) this._shadow = olleh.maps.overlay.Marker.DEFAULT_HD_SHADOW;
      else if(olleh.maps.browser.isMobile) this._shadow = olleh.maps.overlay.Marker.DEFAULT_MOBILE_SHADOW ;
      else this._shadow = olleh.maps.overlay.Marker.DEFAULT_SHADOW;
      this.setShadow(this._shadow);
      shadow = this._shadow;
    }

    if (!disableShadow && !this._flat) {
      if (!img) {
        img = this._shadowImg = new olleh.maps.SpritedImage();
        this.registerElement('overlay_shadow_pane', img.elem);
      }
      if (this._currentShadow != shadow) {
        img.setStyles({
          width: shadow.size.width + 'px',
          height: shadow.size.height + 'px',
          marginLeft: -shadow.anchor.x + 'px',
          marginTop: -shadow.anchor.y + 'px'
        }).setImage(shadow.url, shadow.origin, shadow.scaledSize);
        this._currentShadow = shadow;
      }
    } else {
      if (img) {
        this.unregisterElement('overlay_shadow_pane', img.elem);
        this._shadowAnimator && this._shadowAnimator.stop();
        this._shadowAnimator = null;
        this._currentShadow = null;
        this._shadowImg = null;
      }
    }
  },

  /**
   * Marker caption을 반환한다.
   * @returns {olleh.maps.overlay.MarkerCaptionOptions} captionOptions
   */
  getCaption: function () {
    return this._caption;
  },

  /**
   * marker Caption 내용을 설정한다.
   * @example
   * marker.setCaption('강남역');
   * marker.setCaption({
   *   title: '강남역',
   *   backgroundColor: '#ffffff'
   * });
   * @fires olleh.maps.overlay.Marker#event:caption_changed
   * @param {String|olleh.maps.overlay.MarkerCaptionOptions} captionOptions 혹은 caption 내용
   */
  setCaption: function (caption) {
    if (olleh.maps.isString(caption)) {
      caption = {
        title: caption
      };
    } else if (!olleh.maps.isObject(caption)) {
      throw new TypeError('Caption must be String or Object');
    }

    // caption.title은 0 또는 empty string이 될 수 있으므로
    // icon.url이나 shadow.url처럼 !caption.title로 체크하면 안 된다.
    if (caption.title === null || caption.title === undefined) {
      throw new TypeError('Caption title is undefined');
    }

    this._caption = caption;

    if (this.isDrawn()) {
      this._updateCaption();
      /**
       * caption_changed 이벤트. marker의 캡션이 변경되었을 경우 발생한다.
       * <p/>
       * @name event:caption_changed
       * @event
       * @memberOf olleh.maps.overlay.Marker.prototype
       * @param {olleh.maps.event.Event} event
       */
      this.fireEvent('caption_changed');
    }
  },
  
  _updateCaption: function() {
    var span, div = this._captionDiv;
    var caption = this._caption;

    if (caption) {
      caption.size = caption.size || 9;
      caption.backgroundColor = caption.backgroundColor || "";
      caption.color = caption.color || '#000000';
      
      if (!div) {
        div = this._captionDiv = olleh.maps.Element.create('div').setStyles({
          position: 'absolute',
          marginLeft: '-100px',
          width: '200px',
          textAlign: 'center'
        });
        span = olleh.maps.Element.create('span');
        div.appendChild(span);
        this.registerElement('lower_overlay_pane', div.elem);
      } else{
        span = new olleh.maps.Element(div.elem.firstChild);
      }
      span.setStyles({
        backgroundColor: caption.backgroundColor,
        color: caption.color,
        fontSize: caption.size + 'pt',
        fontWeight: 'bold',
        padding: '2px'
      });
      span.elem.innerHTML = '' + caption.title;
    } else {
      if (div) {
        this.unregisterElement('lower_overlay_pane', div.elem);
        this._captionDiv = null;
      }
    }
  },

  /**
   * 마커의 flat정보를 반환한다
   * @returns {Boolean} flat
   */
  isFlat: function () {
    return this._flat;
  },

  /**
   * 마커의 flat 정보를 설정한다.
   * @example marker.setFlat(true);
   * @fires olleh.maps.overlay.Marker#event:flat_changed
   * @param {boolean} flat <code>true</code>인 경우 shadow가 출력되지 않는다.
   */
  setFlat: function (flat) {
    this._flat = flat;
    if (this.isDrawn()) {
      this._updateShadow();
      /**
       * flat_changed 이벤트. marker의 flat 정보가 변경되었을 경우 발생한다.
       * <p/>
       * @name event:flat_changed
       * @event
       * @memberOf olleh.maps.overlay.Marker.prototype
       * @param {olleh.maps.event.Event} event
       */
      this.fireEvent('flat_changed');
    }
  },

  /**
   * 마커의 drag 가능 여부를 반환한다.
   * @returns {boolean} draggable
   */
  isDraggable: function () {
    return this._draggable;
  },

  isDragging: function () {
    return this._isDragging && this._draggable;
  },

  /**
   * 마커의 drag 가능 여부를 설정한다.
   * @fires olleh.maps.overlay.Marker#event:draggable_changed
   * @param {boolean} draggable <code>true</code>인 경우 marker를 drag 가능하다.
   */
  setDraggable: function (draggable) {

    if (this._draggable != draggable) {
      this._draggable = draggable;
      /**
       * draggable_changed 이벤트. marker의 drag 가능 여부가 변경되었을 경우 발생한다.
       * <p/>
       * @name event:draggable_changed
       * @event
       * @memberOf olleh.maps.overlay.Marker.prototype
       * @param {olleh.maps.event.Event} event
       */
      this.fireEvent('draggable_changed');
    }
  },

  /**
   * @private
   * @param event
   * @param payload
   */
  $capture_dragstart: function (event, payload) {
    if(!this._draggable) return;

    var dragImg = this._dragImg;
    var DRAG_FLOATING_PX = olleh.maps.overlay.Marker.DRAG_FLOATING_PX;

    event.preventDefault();
    this._isDragging = true;

    if (!dragImg) {
      // drag Pointer Image 생성
      var DRAG_POINT = olleh.maps.overlay.Marker.DRAG_POINT;
      var size = DRAG_POINT.size;
      var anchor = DRAG_POINT.anchor || new olleh.maps.Point(size.width / 2, size.height);
      dragImg = this._dragImg = new olleh.maps.SpritedImage().setStyles({
        width: size.width + 'px',
        height: size.height + 'px',
        marginLeft: -anchor.x + 'px',
        marginTop: -anchor.y + 'px',
        zIndex: olleh.maps.overlay.BaseOverlay.MAX_ZINDEX
      }).setImage(DRAG_POINT.url, DRAG_POINT.origin);
    }
    if (this._tooltip) {
      this._tooltip.close();
      delete this._tooltip;
    }
    this._iconImg.addClass('ollehmap-dragging');
    this.registerElement('upper_overlay_pane', dragImg.elem);
    this._float(DRAG_FLOATING_PX);
    this._infoWin && this._infoWin._dragStart(new olleh.maps.Point(0, -DRAG_FLOATING_PX), new olleh.maps.Point(DRAG_FLOATING_PX, -DRAG_FLOATING_PX));
  },

  /**
   * @private
   * @param event
   * @param payload
   */
  $capture_drag: function (event, payload) {
    if (this.isDragging()) {
      event.preventDefault();
      this.move(payload.movementXY);
      this._infoWin && this._infoWin._drag(payload.movementXY);
    }
  },

  /**
   * @private
   * @param event
   * @param payload
   */
  $capture_dragend : function (event, payload) {
    if (this.isDragging()) {
      var coord;
      event.preventDefault();

      this.unregisterElement('upper_overlay_pane', this._dragImg.elem);
      this._sink(olleh.maps.overlay.Marker.DRAG_FLOATING_PX);

      coord = this.getLayer().layerMgr.getCoordFromLayerPx(this._currentLayerPx);
      this.setPosition(coord);
      this._infoWin && this._infoWin._dragEnd(coord);
      this._iconImg.removeClass('ollehmap-dragging');
      this._isDragging = false;
    }
  },

  /**
   * 일정 px만큼 marker를 공중으로 띄운다.
   * @param {Number} distance 거리값
   * @private
   */
  _float: function (distance) {
    var o, anchor, shadowD;

    if (this._animation != olleh.maps.overlay.Marker.BOUNCE) {
      o = this._icon;
      anchor = o.anchor || new olleh.maps.Point(o.size.width / 2, o.size.height);
      this._iconImg.setStyles({
        marginTop: -(anchor.y + distance) + 'px'
      });
      if (this._shadowImg) {
        o = this._shadow;
        anchor = o.anchor || new olleh.maps.Point(0, o.size.height);
        shadowD = distance * Math.SQRT1_2;
        this._shadowImg.setStyles({
          marginTop: -(anchor.y + shadowD) + 'px',
          marginLeft: -(anchor.x - shadowD) + 'px'
        });
      } 
    }
  },

  /**
   * 일정 px만큼 marker를 가라앉힌다.
   * @param distance 거리값
   * @private
   */
  _sink: function (distance) {
    var o, anchor;

    if (this._animation != olleh.maps.overlay.Marker.BOUNCE) {
      o = this._icon;
      anchor = o.anchor || new olleh.maps.Point(o.size.width / 2, o.size.height);
      this._iconImg.setStyles({
        marginTop: -anchor.y + 'px'
      });
      if (this._shadowImg) {
        o = this._shadow;
        anchor = o.anchor || new olleh.maps.Point(0, o.size.height);
        this._shadowImg.setStyles({
          marginTop: -anchor.y + 'px',
          marginLeft: -anchor.x + 'px'
        });
      }
    }
  },

  /**
   * 마커에 설정 된 animation을 반환한다.
   * @returns {String} 애니메이션 타입.
   * 반환하는 값: {@link olleh.maps.overlay.Marker.BOUNCE} | {@link olleh.maps.overlay.Marker.DROP}
   */
  getAnimation: function () {
    return this._animation;
  },

  /**
   * 마커에 animation을 설정한다.
   * @example marker.setAnimation(olleh.maps.overlay.Marker.BOUNCE);
   * @fires olleh.maps.overlay.Marker#event:animation_changed
   * @param {String} animation 타입. <p/>
   * 허용하는 값:
   * <ul>
   * <li>{@link olleh.maps.overlay.Marker.BOUNCE}</li>
   * <li>{@link olleh.maps.overlay.Marker.DROP}</li>
   * </ul>
   */
  setAnimation: function (animation) {
    if (this._animation != animation) {
      this._animation = animation;
      if (this.isDrawn()) {
        this._updateAnimation();
        /**
         * animation_changed 이벤트. marker의 애니메이션이 변경되었을 경우 발생한다.
         * <p/>
         * @name event:animation_changed
         * @event
         * @memberOf olleh.maps.overlay.Marker.prototype
         * @param {olleh.maps.event.Event} event
         */
        this.fireEvent('animation_changed');
      }
    }
  },
  
  _updateAnimation: function () {
    var anchor;

    if (!this._animation) {
      this.stopAnimation();
    } else if (this._animation === olleh.maps.overlay.Marker.BOUNCE) {
      this.stopAnimationImmediately();
      
      anchor = this._icon.anchor || new olleh.maps.Point(this._icon.size.width / 2, this._icon.size.height);
      this._iconAnimator = olleh.maps.overlay.Marker.getBounceAnimator(anchor).animate(this._iconImg.elem);
      
      if (this._shadowImg) {
        anchor = this._shadow.anchor || new olleh.maps.Point(0, this._shadow.size.height);
        this._shadowAnimator = olleh.maps.overlay.Marker.getBounceAnimator(anchor, true).animate(this._shadowImg.elem);
      }
    }
  },

  /**
   * 마커에 설정된 모든 애니메이션을 정지한다.
   * @private
   */
  stopAnimation: function () {
    this._iconAnimator && this._iconAnimator.stopRepeat();
    this._shadowAnimator && this._shadowAnimator.stopRepeat();
  },

  stopAnimationImmediately: function () {
    this._iconAnimator && this._iconAnimator.stop();
    this._shadowAnimator && this._shadowAnimator.stop();
  },
  
  onAdd: function () {
    var anchor, animator;

    if (this._animation === olleh.maps.overlay.Marker.DROP) {
      anchor = this._icon.anchor || new olleh.maps.Point(this._icon.size.width / 2, this._icon.size.height);
      animator = olleh.maps.overlay.Marker.getDropAnimator(anchor);
      this._iconImg.setStyles(animator.from);
      animator.animate(this._iconImg.elem, {
        callback: this.ready,
        ctx: this
      });
      if (this._shadowImg) {
        anchor = this._shadow.anchor || new olleh.maps.Point(0, this._shadow.size.height);
        animator = olleh.maps.overlay.Marker.getDropAnimator(anchor, true);
        this._shadowImg.setStyles(animator.from);
        animator.animate(this._shadowImg.elem);
      }
    } else {
      this.ready();
    }
  },

  getBounds: function () {
    return this._infoWin ? this._infoWin.getBounds().union(this._position): null;
  },

  /**
   * 마커에 infowindow를 설정한다.
   * @param {olleh.maps.overlay.BaseInfoWindow} infowindow
   * @private
   */
  setInfoWindow: function (infoWin) {
    if(infoWin == null)
      this.resetZIndex();
    this._infoWin = infoWin;
  },

  /**
   * 마커에 좌표값을 지정한다.
   * @example 
   * var position = new olleh.maps.UTMK(958094.06, 1942790.82);
   * marker.setPosition(position);
   * @param {olleh.maps.Coord} pos Coord값
   */
  setPosition: function (pos) {
    olleh.maps.overlay.Marker.$super.setPosition.apply(this, arguments);
    this._infoWin && this._infoWin.setPosition(pos);
  },

  detach: function() {
    this.stopAnimationImmediately();
    if (this._infoWin) {
      this._infoWin.close();
      this._infoWin = null;
    }
    olleh.maps.overlay.Marker.$super.detach.apply(this, arguments);
  },

  $default_mouseover: function (event, payload) {
    if(!this.isDragging() && this._title) {
      var tooltip = this.map.getTooltip();
      if (tooltip) {
        tooltip.setContent(this._title);
        tooltip.setPixelOffset(new olleh.maps.Point(0, 0));
        tooltip.open(this.map, this);
        this._tooltip = tooltip;
      }
    }
    olleh.maps.overlay.Marker.$super.$default_mouseover.apply(this, arguments);
  },

  $default_mouseout: function (event, payload) {
    if(this._tooltip) {
      this._tooltip.close();
      delete this._tooltip;
    }
    if(!this._infoWin)
      olleh.maps.overlay.Marker.$super.$default_mouseout.apply(this, arguments);
  },

  zoomStart: function (scale, origin, duration) {
    if (!this.isDragging()) {
      olleh.maps.overlay.Marker.$super.zoomStart.apply(this, arguments);
    }
  },

  zoomEnd: function () {
    if (this.isDragging()) {
      this.moveTo(this.getCurrentLayerPx());
    } else {
      olleh.maps.overlay.Marker.$super.zoomEnd.apply(this, arguments);
    }
  }

});
/**
 * ContentOverlayOptions Object Specification
 * @typedef olleh.maps.overlay.ContentOverlayOptions
 * @extends olleh.maps.overlay.PointedOverlayOptions
 * @property {String|Node} content ContentOverlay안에 보여질 content값을 설정한다.
 * HTML element , plain-text string, HTML를 포함한 string을 설정할 수 있다. ContentOverlay의 content에 따라서 size가 결정된다.
 * @property {olleh.maps.Point} [pixelOffset] position에서의 offset 값
 * @property {Number} [padding] content의 padding값을 설정한다.
 */

/**
 * 지도상의 특정 지점에 컨텐츠를 포함한 오버레이를 나타내는 클래스
 */
$class('olleh.maps.overlay.ContentOverlay').extend(olleh.maps.overlay.PointedOverlay).define({
  /**
   * 생성자, 명시된 opts를 사용해서 새로운 객체를 생성한다.
   * @param {olleh.maps.overlay.ContentOverlayOptions} opts 옵션
   */
  ContentOverlay: function (opts) {
    this.name = 'olleh.maps.overlay.ContentOverlay';
    this._defaultCss = null;
    this._defaultPadding = 0;
    this._body = null;
    this._shadow = null;
    this._marginPx = null;
    this._topleftPx = null;
    this._bounds = null;
    this._opts = {};
    this._opts.pixelOffset = new olleh.maps.Point(0,0);
    this._contentAttacted = false;
    this.contentSize = {
        minWidth : 10,
        minHeight : 10,
        maxWidth : 800,
        maxHeight : 800
    };
  },
  
  /**
   * 맵에서 해체될 때 호출됨
   * @param event
   * @param payload
   * @private
   */
  $default_detached: function (event, payload) {
    this._eliminateElements();
    event.preventDefault();
  },
  
  /**
   * 옵션을 지정한다.
   * @param {olleh.maps.overlay.ContentOverlayOptions} opts 옵션
   * @example 
   * info = new olleh.maps.overlay.InfoWindow({
   *   disableAutoPan: false,
   *   pixelOffset: new olleh.maps.Point(10, 20),
   *   position: new olleh.maps.UTMK(953855.70, 1959715.52),
   *   content: content
   * });
   * info.open(map);
   * 
   * marker.onEvent('click', function () { 
   *    info.setOptions({content: WlongCnt,maxWidth: 300});
   * });  
   */
  setOptions: function (opts) {
    if (opts.maxWidth) {
      var maxWidth = parseInt(opts.maxWidth);
      opts.maxWidth = Math.min(maxWidth, this.contentSize.maxWidth);
    } else if (this._opts.maxWidth) {
      opts.maxWidth = this._opts.maxWidth;
    } else {
      opts.maxWidth = this.contentSize.maxWidth;
    }
    this._setMaxWidth(opts.maxWidth);
    
    if (opts.padding) {
      opts.padding = parseInt(opts.padding);
      this._setPadding(opts.padding);
    }
    
    opts.pixelOffset && this.setPixelOffset(opts.pixelOffset);
    olleh.maps.mixin(this._opts, opts, true);
    if (opts.content){
      this.setContent(opts.content);
    } else if (opts.padding != undefined || opts.maxWidth != undefined) {
      //padding 값이 있거나, maxWidth가 있을 경우 content를 update한다.
      //현재 content를 그대로 넣어준다.
      if (this._body) {
        this._updateContent(this._body.contentElem.children[0]);
      }
      
    }
    olleh.maps.overlay.ContentOverlay.$super.setOptions.call(this, this._opts);
  },
  
  /**
   * @private
   * @see olleh.maps.overlay.PointedOverlay#update
   */
  update: function () {
    if (!this._body) this._updateElements();
    olleh.maps.overlay.ContentOverlay.$super.update.apply(this, arguments);
  },
  
  /**
   * @see olleh.maps.overlay.BaseOverlay#draw
   * @override
   * @param onAdd
   * @private
   */
  draw: function (onAdd) {
    olleh.maps.overlay.ContentOverlay.$super.draw.apply(this, arguments);
    if (!this._contentAttacted) {
      this._contentAttacted = true;
      this.fireEvent('domready');
    } 
  },
  
  /**
   * ContentOverlay의 Content를 설정한다.
   * @fires olleh.maps.overlay.ContentOverlay#event:content_changed
   * @param {String|Node} content ContentOverlay안에 보여질 content값을 설정한다. 
   * HTML element , plain-text string, HTML를 포함한 string을 설정할 수 있다. ContentOverlay는 content에 따라서 size가 결정된다.
   * 자신이 size를 정하고 싶으면 HTML의 style에 size를 설정해라. 
   * 하지만 ContentOverlay의 최소, 최대 width, height가 있음을 유의해라. 
   * @example 
   * info = new olleh.maps.overlay.InfoWindow({
   *   pixelOffset: new olleh.maps.Point(10, 20),
   *   position: new olleh.maps.UTMK(953855.70, 1959715.52),
   *   content: content
   * });
   * info.open(map);
   *  
   * marker.onEvent('click', function () { info.setContent('Hello World'); });  
   */
  setContent: function (content) {
    this._opts.content = content;
    this._contentAttacted = false;
    if (this.isAdded()) {
      this._updateContent();
      if (this.isDrawn()) {
        this._contentAttacted = true;
        this.fireEvent('domready');
      }
      this.fireEvent('content_changed');
    }
  },
  /**
   * 'domread'이벤트와 content_changed 이벤트 발생시키지 않고 content를 업뎃한다.
   * setMaxWidth, setPadding용도로 사용된다.
   * @private 
   */
  _updateContent: function (beforeContent) {
    if (this.isAdded()) {
      this._eliminateElements();
      this._updateElements(beforeContent);
      olleh.maps.overlay.ContentOverlay.$super.update.apply(this, arguments);
    }
  },
  /**
   * ContentOverlay의 content를 반환한다.
   * @returns {String|Node} content ContentOverlay에 설정된 Content 값
   */
  getContent: function (content) {
    return this._opts.content;
  },
  
  /**
   * ContentOverlay의 position을 설정한다.
   * @fires olleh.maps.overlay.ContentOverlay#event:position_changed
   * @param {olleh.maps.Coord} coord ContentOverlay를 위치하고자 하는 좌표값
   * @example 
   * info = new olleh.maps.overlay.InfoWindow({
   *   pixelOffset: new olleh.maps.Point(10, 20),
   *   position: new olleh.maps.UTMK(953855.70, 1959715.52),
   *   content: content
   * });
   * info.open(map);
   * 
   * marker.onEvent('click', function () { 
   *   info.setPosition(new olleh.maps.UTMK(953795.70, 1969715.52));
   * }); 
   */
  setPosition: function (coord) {
    var from = this._position;
    this._opts.position = coord;
    this._position = coord;
    if (this.isAdded()) {
      this._updateMargin();
      this._updateBounds();
      //position이 같아도 margin값이 달라질 수 있다.
      if (this.isDrawn()) {
        this._updatePosition();
      }
      this.fireEvent('position_changed',{from: from, to: coord});
    }
    
  },
  
  /**
   * ContentOverlay의 Position를 반환한다.
   * @returns {olleh.maps.Coord} coord ContentOverlay가 위치하는 좌표값
   */
  getPosition: function () {
    return this._opts.position;
  },
  
  /**
   * ContentOverlay의 pixelOffset를 설정한다.
   * @param {olleh.maps.Point} offset ContentOverlay의 pixelOffset값 
   */
  setPixelOffset: function (offset) {
    this._opts.pixelOffset = offset;
    if (this.isAdded()) {
      this._updateMargin();
      this._updateBounds();
      if (this.isDrawn()) {
        this._updatePosition();
      }
    }
  },
  
  /**
   * ContentOverlay의 pixelOffset값을 반환한다.
   * @returns {olleh.maps.Point} pixelOffset값
   */
  getPixelOffset: function () {
    return this._opts.pixelOffset;
  },
  
  /**
   * ContentOverlay의 body를 생성한다.
   *
   * @param {olleh.maps.Size} contentSize 컨텐츠 사이즈 
   * @param {olleh.maps.Point} point ContentOverlay가 나타나야할 위치, layerPixel 값
   * @return {Element}          [rootElem] ContentOverlay의 body의 root element
   *         {Element}          [contentElem] ContentOverlay의 body안에 content element
   *         {Element}          [closeElem] ContentOverlay의 body안에 close element
   *         {olleh.maps.Size}  [size] ContentOverlay의 size
   *         {olleh.maps.Point} [topLeftPoint] ContentOverlay의 top left Point. 
   *                                 파라미터의 point 값 기준으로 top, left 값을 계산해야 된다.
   *@private
   */
  createBodyElem: function (contentSize, point) {},
  
  /**
   * ContentOverlay의 shadow를 생성한다. 
   * 
   * @param {olleh.maps.Size} contentSize 컨텐츠 사이즈 
   * @param  {olleh.maps.Point} point ContentOverlay의 그림자가 나타나야할 위치, layerPixel 값
   * @return {Element}          [rootElem] ContentOverlay의 그림자의 root element
   *         {olleh.maps.Size}  [size] ContentOverlay의 size
   *         {olleh.maps.Point} [topLeftPoint] ContentOverlay의 top left Point. 
   *                                 파라미터의 point 값 기준으로 top, left 값을 계산해야 된다.
   *@private
   */
  createShadowElem: function (contentSize, point) {},
  
  _setMaxWidth: function (width) {
    this._opts.maxWidth = width;
  },
  
  _setPadding: function (padding) {
    if (padding*2 >= this.contentSize.maxWidth) {
      throw new RangeError('padding 값이 너무 큽니다.' 
          +this.contentSize.maxWidth/2+'보다 작아야 합니다.');
    }
    this._opts.padding = padding;
  },
  /**
   * ContentOverlay의 elements(body, shadow)을 생성하고, 이벤트를 등록한다.
   * @private
   */
  _updateElements: function (beforeContent) {
    var domutil = olleh.maps.util.dom;
    var opts = this._opts;
    var size = this._checkContentSize(beforeContent);
    var pos = opts.position;
    var layerMgr = this.layer.layerMgr;
    
    var layerPx = layerMgr.getLayerPxFromCoord(pos);
    layerPx = new olleh.maps.Point(Math.round(layerPx.x), Math.round(layerPx.y));    
    
    this._body = this.createBodyElem(size, layerPx);
    this._topLeftPx = { body: this._body.topLeftPoint.subtract(layerPx)};
    
    if (beforeContent == undefined) {
      var optsContent = opts.content;
      var div = document.createElement('div');
     
      if (olleh.maps.isString(optsContent)) {
        div.innerHTML = optsContent;
      } else {
        domutil.pushElement(div, optsContent);
      }
      domutil.addClass(div,this._defaultCss);
      domutil.pushElement(this._body.contentElem, div);
    } else {
      //이전에 있던 content를 그대로 사용함.
      domutil.pushElement(this._body.contentElem, beforeContent);
    }
    this.registerElement('infowindow_pane', this._body.rootElem);
    
    if (!this.layer.disableShadow) {
      this._shadow = this.createShadowElem(size, layerPx);
      if (this._shadow) {
        this.registerElement('infowindow_shadow_pane', this._shadow.rootElem);
        this._topLeftPx.shadow = this._shadow.topLeftPoint.subtract(layerPx);
      }
    }
    //Event를 등록한다.
    this._appendEvent();
    //margin값을 설정한다.
    this._updateMargin();
    //bound값을 설정한다.
    this._updateBounds();
  },
  
  /**
   * margin값에 offset 값을 설정한다. ContentOverlay의 top, left는 Margin값으로 설정되어있다.
   * 이 margin값에 option으로 설정된 pixelOffset값을 더한다.
   * @private
   */
  _updateMargin: function () {
    var offset = this._opts.pixelOffset;
    this._marginPx = { body : this._topLeftPx.body.add(offset)};
    if (this._shadow) {
        this._marginPx.shadow = this._topLeftPx.shadow.add(offset);
    }
  },
  
  /**
   * ContentOverlay의 bounds 값을 갱신한다.
   * @private
   */
  _updateBounds: function () {
    var oldBounds = this._bounds;
    var layerMgr = this.layer.layerMgr;
    var pos = this._opts.position;
    var layerPx = layerMgr.getLayerPxFromCoord(pos);
    var topleft = this._marginPx.body.add(layerPx);
    var leftBottom = 
      layerMgr.getCoordFromLayerPx(new olleh.maps.Point(topleft.x, topleft.y + this._body.size.height));
    var rightTop = 
      layerMgr.getCoordFromLayerPx(new olleh.maps.Point(topleft.x + this._body.size.width, topleft.y));
    this._bounds = new olleh.maps.Bounds(leftBottom, rightTop);
    if (this._shadow) {
      var s_topleft = this._marginPx.shadow.add(layerPx);
      var s_leftBottom = 
        layerMgr.getCoordFromLayerPx(new olleh.maps.Point(s_topleft.x, s_topleft.y + this._shadow.size.height));
      var s_rightTop = 
        layerMgr.getCoordFromLayerPx(new olleh.maps.Point(s_topleft.x + this._shadow.size.width, s_topleft.y));
      var shadowBounds = new olleh.maps.Bounds(s_leftBottom, s_rightTop);
      this._bounds = this._bounds.union(shadowBounds);
    }
    this.fireEvent('bounds_changed', {from: oldBounds, to: this._bounds});
  },
  
  /**
   * ContentOverlay의 위치를 계산하여 설정한다.
   * @override
   * @see olleh.maps.overlay.PointedOverlay#_updatePosition}
   * @private
   */
  _updatePosition: function () {
    var body = this._body;
    var bm = this._marginPx.body;
    body.rootElem.style.marginTop = bm.y + 'px';
    body.rootElem.style.marginLeft = bm.x + 'px';
    
    if (this._shadow) {
      var shadow = this._shadow;
      var sm = this._marginPx.shadow;
      shadow.rootElem.style.marginTop = sm.y + 'px';
      shadow.rootElem.style.marginLeft = sm.x + 'px';
    } 
    olleh.maps.overlay.ContentOverlay.$super._updatePosition.apply(this);
  },
  
  /**
   * ContentOverlay의 영역을 반환한다.
   *  @returns {olleh.maps.Bounds} bounds ContentOverlay의 영역
   */
  getBounds: function () {
    if (!this._body) { //element가 생성이 안 되어있으면 생성한다.
      this._updateElements();
    }
    return this._bounds;
  },
  
  /**
   * @override
   * @private
   */
  zoomEnd: function () {
    this._updateBounds();
    olleh.maps.overlay.ContentOverlay.$super.zoomEnd.apply(this);
  },
  
  /**
   * content size를 계산하여 반환한다.
   * @returns {olleh.maps.Size} size
   * @private 
   */
  _checkContentSize: function (beforeContent) {
    var pDiv = document.createElement('div');
    var iDiv = document.createElement('div');
    var domutil = olleh.maps.util.dom;
    var maxWidth = (this._opts.maxWidth? this._opts.maxWidth : this.contentSize.maxWidth);
    var contentPadding = this._opts.padding == undefined ? this._defaultPadding : this._opts.padding;
    var dbContentPadding = contentPadding*2;
    domutil.setStyles(pDiv, {
      position: 'absolute',
      left: '10000px',
      top: '0px',
      width : maxWidth - dbContentPadding +'px',
      height :this.contentSize.maxHeight - dbContentPadding + 'px',
      margin: '0px',
      padding: '0px',
      opacity: 0
    });
    domutil.setStyles(iDiv, {
      position: 'absolute',
      overflow: 'auto',
      minWidth: Math.max(0,this.contentSize.minWidth - dbContentPadding)+ 'px',
      minHeight: Math.max(0,this.contentSize.minHeight - dbContentPadding)+ 'px',
      maxWidth: maxWidth - dbContentPadding+'px',
      maxHeight: this.contentSize.maxHeight - dbContentPadding+ 'px'
    });
    domutil.addClass(iDiv,this._defaultCss);
    pDiv.appendChild(iDiv);
    if (beforeContent == undefined) {
      var content = this._opts.content;
      if (olleh.maps.isString(content)) {
        iDiv.innerHTML = content;
      } else {
        domutil.pushElement(iDiv,content);
      }
    } else {
      domutil.pushElement(iDiv,beforeContent);
    }
    
    
    var infopane = this.layer.getPane('infowindow_pane');
    
    domutil.pushElement(infopane, pDiv);
    var size = new olleh.maps.Size(
        iDiv.offsetWidth, 
        iDiv.offsetHeight
    );
    domutil.popElement(infopane, pDiv);
    return size;
  },
  
  /**
   * ContentOverlay 이벤트를 등록한다.
   * @private
   */
  _appendEvent: function () {
    var body = this._body;
    this.registerEventDom(body.contentElem);
    if (!this._opts.disableCloseButton && body.closeElem) {
      this.registerEventDom(body.closeElem);
    } 
  },
  

  /**
   * 각 pane에 등록된 element를 지운다.
   * @private
   */
  _eliminateElements: function () {
    this.unregisterElement('infowindow_pane',this._body.rootElem);
    this._shadow && this.unregisterElement('infowindow_shadow_pane',this._shadow.rootElem);
    this._topleftPx = null;
    this._body = null;
    this._shadow = null;
    this._marginPx = null;
    this._contentAttacted = false;
  }
});
/////////////////////////
//  InfoWindowOptions  //
/////////////////////////
/**
 * InfoWindowOptions Object Specification
 * @typedef olleh.maps.overlay.InfoWindowOptions
 * @extends olleh.maps.overlay.ContentOverlayOptions
 * @property {olleh.maps.Point} [pixelOffset=(0,0)] InfoWindow의 position에서의 offset 값
 * @property {Number} [zIndex] InfoWindow의 zIndex값
 * @property {Number} [maxWidth=600] infowindow의 최대 width값
 * @property {Boolean} [disableAutoPan=false] map의 위치를 InfoWindow의 위치로 자동 변경
 * @property {Boolean} [disableCloseButton=false] InfoWindow의 closeButton을 나타낼 것인지를 설정한다.
 * @property {Number} [padding=18] content의 padding값을 설정한다.
 * @property {String|Node} content InfoWindow안에 보여질 content값을 설정한다. 
 * HTML element , plain-text string, HTML를 포함한 string을 설정할 수 있다. InfoWindow는 content에 따라서 size가 결정된다.
 * 자신이 size 정하고 싶으면 HTML의 style에 size를 설정해라. 하지만 InfoWindow의 size가 최소, 최대 width, height가 있음을 유의해라.
 */

/**
 *  BaseInfoWindow는 InfoWindow을 구현하기 위한 기본 클래스이다. 실제적으로 InfoWindow를 사용하기 위해서는
 *  {@link olleh.maps.overlay.InfoWindow}를 사용한다.
 *  BaseInfoWindow는 기본적인 InfoWindow의 기능들을 구현하고 있으며 하위 클래스들은 createBodyElem,
 *  createShadowElem들을 구현하여 InfoWindow의 기본 골격을 생성한다.
 *  createBodyElem함수는 Tip과 Body을 구성하는 DOM을 생성하는 함수이고 createShadowElem
 *  함수는 shadow을 구성하는 DOM을 생성하는 함수이다.<p/>
 *  BaseInfoWindow를 상속받은 InfoWindow는 한 위치(좌표)에 추가적인 정보를 표현하기 위해서 사용하는 Overlay이다.
 *  InfoWindow의 UI 형태는 버블풍선 같이 생겼며, UI는 크게 body, shadow, tip으로 구성되어있다. 
 *  tip는 삼각형(tip 이라고 명명함) 형태이며 tip의 한 꼭지점이 한 위치를 가리키고 있다. 
 *  body는 tip 위에 위치한 사각형 형태이며 그 안에 추가적인 정보를 보여준다.
 *  shadow는 InfoWindow의 tip과 body의 그림자이며 입체효과를 나타내기 위해서 존재한다.
 *  InfoWindow는 Marker 또는 Overlay객체 위에도 위치할 수 있다. 
 *  기본적인 사용법은 InfoWindow객체를 option과 함께 생성하고 {@link olleh.maps.overlay.BaseInfoWindow#open}함수를 이용해서 InfoWindow 화면에 보여준다.
 *  그리고 close 버튼을 이용하여 닫거나 , {@link olleh.maps.overlay.BaseInfoWindow#close} 함수를 이용하여 닫을 수 있다.
 *  지도의 중심 위치가 InfoWindow를 그릴 필요가 없을 때에는 DOM 트리에서 제거 될 수 있으므로 주의해야 한다.  
 * <h5>대표적인 이벤트</h5>
 * <ul>
 * <li>{@link olleh.maps.overlay.BaseInfoWindow#event:close_click|close_click}</li>
 * <li>{@link olleh.maps.overlay.BaseInfoWindow#event:content_changed|content_changed}</li>
 * <li>{@link olleh.maps.overlay.BaseInfoWindow#event:domready|domready}</li>
 * <li>{@link olleh.maps.overlay.BaseInfoWindow#event:position_changed|position_changed}</li>
 * <li>{@link olleh.maps.overlay.BaseInfoWindow#event:zIndex_changed|zIndex_changed}</li>
 * </ul>
 * 
 * @summary InfoWindow는 특정 위치(좌표)에 추가적인 정보를 표현하기 위해서 사용하는 Overlay.
 */
$class('olleh.maps.overlay.BaseInfoWindow').extend(olleh.maps.overlay.ContentOverlay).define({
  
  $static: { 
    AUTO_PAN_MARGIN : 10
  },
  /**
   * close_click 이벤트<p/>
   * 닫기 버튼을 클릭 했을 때 호출 되는 이벤트이다.
   * @example 
   * info = new olleh.maps.overlay.InfoWindow({
   *   pixelOffset: new olleh.maps.Point(10, 20),
   *   position: new olleh.maps.UTMK(953855.70, 1959715.52),
   *   content: content
   * });
   * info.onEvent('close_click', 
   *   function (event) { console.log('close_click');}
   * );
   * info.open(map, marker);
   * @name event:close_click
   * @event
   * @memberOf olleh.maps.overlay.BaseInfoWindow.prototype
   * @param {olleh.maps.event.Event} event
   * 
   **/
  /**
  * content_changed 이벤트<p/>
  * InfoWindow의 Content가 변경될 때 호출 되는 이벤트이다.
  * @example
  * info = new olleh.maps.overlay.InfoWindow({
  *   pixelOffset: new olleh.maps.Point(10, 20),
  *   position: new olleh.maps.UTMK(953855.70, 1959715.52),
  *   content: content
  * });
  * info.onEvent('content_changed', 
  *   function (event) { console.log('content_changed');}
  * );
  * info.open(map, marker); 
  * @name event:content_changed
  * @event
  * @memberOf olleh.maps.overlay.BaseInfoWindow.prototype
  * @param {olleh.maps.event.Event} event
  **/
 /**
  * domready 이벤트<p/>
  * InfoWindow가 DOM Tree에 처음 append 될 때 호출 되는 이벤트이다. 
  * InfoWindow가 DOM Tree에 append 된 상태에서 추가적인 작업을 할 때 사용된다. 
  * 주의할 점은 InfoWindow가 DOM Tree에 append되었다고 영구적으로 append 되어 있지 않음을 주의해야 한다.
  * 또한 InfoWindow가 DOM Tree에 append 된 상태에서InfoWindow가 보이지 않은 곳으로 지도가 이동할 경우에는 
  * InfoWindow는 DOM Tree에 잠시 제거된다. 다시 InfoWindow가 보이는 곳으로 지도가 이동할 경우에는 InfoWindow는 DOM Tree에 추가된다. 
  * 하지만 domready이벤트는 호출되지 않는다. 왜냐하면 DOM Tree에 처음 append 될 때만 domready이벤트가 호출되기 때문이다.
  * @example
  * info = new olleh.maps.overlay.InfoWindow({
  *   pixelOffset: new olleh.maps.Point(10, 20),
  *   position: new olleh.maps.UTMK(953855.70, 1959715.52),
  *   content: content
  * });
  * info.onEvent('domready', 
  *   function (event) { console.log('domready');}
  * );
  * info.open(map, marker); 
  * @name event:domready
  * @event
  * @memberOf olleh.maps.overlay.BaseInfoWindow.prototype
  * @param {olleh.maps.event.Event} event
  **/
  /**
  * position_changed 이벤트<p/>
  * InfoWindow의 position이 변경될 때 호출 되는 이벤트이다.
  * @example
  * info = new olleh.maps.overlay.InfoWindow({
  *   pixelOffset: new olleh.maps.Point(10, 20),
  *   position: new olleh.maps.UTMK(953855.70, 1959715.52),
  *   content: content
  * });
  * info.onEvent('position_changed', 
  *   function (event) { console.log('position_changed');}
  * );
  * info.open(map, marker);
  * @name event:position_changed
  * @event
  * @memberOf olleh.maps.overlay.BaseInfoWindow.prototype
  * @param {olleh.maps.event.Event} event
  **/
  /**
  * zIndex_changed 이벤트<p/>
  * InfoWindow의 zIndex값이 변경될 때 호출 되는 이벤트이다.
  * @example
  * info = new olleh.maps.overlay.InfoWindow({
  *   pixelOffset: new olleh.maps.Point(10, 20),
  *   position: new olleh.maps.UTMK(953855.70, 1959715.52),
  *   content: content
  * });
  * info.onEvent('zIndex_changed', 
  *   function (event) { console.log('zIndex_changed');}
  * );
  * info.open(map, marker);
  * @name event:zIndex_changed
  * @event
  * @memberOf olleh.maps.overlay.BaseInfoWindow.prototype
  * @param {olleh.maps.event.Event} event
  **/
  
  /**
   * 생성자, 명시된 opts를 사용하여 새로운 객체를 생성한다.
   * @param {olleh.maps.overlay.InfoWindowOptions} opts InfoWindowOptions
   */
  BaseInfoWindow: function (opts) {
    this.name = 'olleh.maps.overlay.BaseInfoWindow';
    //content에 대한 기본 css
    this._defaultCss = 'ollehmap-info-defaultStyle';
    //content에 대한 기본 padding
    this._defaultPadding = 18;
    this._anchor = null;
    this._body =  null;
    this._shadow =  null;
    this._anchorOffset =  null;
    
    this.contentSize = {
    //minWidth = maxHeight/2 - topShadowImageHeight + bottomShadowImageHeight + SHADOW_LEFT_HYPOTENUSE_HEIGHT_WIDTH_GAP
    //이 값을 수정시 css ollehmap-info-content 값도 수정해야 한다.
    //minHeight = 60(그림자의 빗변에 대한 높이:SHADOW_IMG_TOP_HEIGHT : 10 + SHADOW_IMG_BOTTOM_HEIGHT : 30) / cos45
        minWidth : 300,
        minHeight : 60,
        maxWidth : 600,
        maxHeight : 500 
    };
  },
 
  /**
   * auto-pan 이 설정되어있을 경우 InfoWindow elements을 생성하고 auto-pan을 호출한다.
   * @private
   */
  $default_attached: function (event, payload) {
    event.preventDefault();
    if (!this._opts.disableAutoPan) {
      if (!this._body) this._updateElements();
      this._autoPan();
    }
  },
  
  /**
   * InfoWindow의 content 영역에서는 
   * close의 버튼 이벤트와 포지션 변경 이벤트만 통과 시키고
   * 나머지는 전달하지 않는다.
   * @override
   * @param event
   * @param payload
   * @private
   */
  propagateEvent: function (event, payload) {
    try {
      switch (event.getName()) {
      case 'attached':
      case 'detached':
      case 'position_changed':
      case 'bounds_changed':
      case 'click':
        break;
      default:
        event.preventDefault();
        event.stopPropagation();
      }
    } finally {
      olleh.maps.overlay.BaseInfoWindow.$super.propagateEvent.apply(this, arguments);
    }
  },
  
  /**
   * @private
   */
  $capture_click: function (event, payload) {
    event.stopPropagation();
    if (this._opts.disableCloseButton || this._body.closeElem !== event.targetDOM) {
      event.preventDefault();
    }
  },

  /**
   * 기본 동작: close 버튼을 클릭했을 때 인포윈도우를 닫게 한다.
   * @private
   */
  $default_click: function (event, payload) {
    event.preventDefault();
    if (!this._opts.disableCloseButton && this._body.closeElem === event.targetDOM) {
      this.fireEvent('close_click');
      this.close();
    }
  },
  
  /**
   * InfoWindow을 open 한다. anchor를 설정하면 anchor의 position값을 기준으로 
   * InfoWindow를 위치시킨다. anchor 가 {@link olleh.maps.overlay.Marker}일 경우는 marker의 anchor기준점과 marker의 크기를 
   * 기준으로 marker 상단에 나타나게 된다. anchor가 marker가 아닐 경우에는 getPosition함수의 리턴값을 
   * 기준으로 InfoWindow의 위치를 설정한다. marker처럼 상단에 위치를 원할 경우 
   * {@link olleh.maps.overlay.InfoWindowOptions.pixelOffset} 옵션 사용을 고려해봐라. 
   * 
   * @example 
   * info = new olleh.maps.overlay.InfoWindow({
   *   pixelOffset: new olleh.maps.Point(10, 20),
   *   position: new olleh.maps.UTMK(953855.70, 1959715.52),
   *   content: content
   * });
   * info.open(map, marker);
   * @see olleh.maps.overlay.BaseInfoWindow#close
   * @param {olleh.maps.Map} map Overlay를 추가할 Map 객체 
   * @param anchor {olleh.maps.Coord | olleh.maps.Point | olleh.maps.overlay.Overlay} anchor {@link olleh.maps.Coord}값 또는 {@link olleh.maps.Point}값 또는 
   * {@link olleh.maps.overlay.Overlay} 객체(Marker 등). Point 는 viewport 기준 좌표이다.
   */
  open: function (map, anchor) {
    if (this._anchor instanceof olleh.maps.overlay.Marker) {
      //이전 anchor가 marker일 경우 연결을 끝낸다.
      this._anchor.setInfoWindow(null);
    }
    
    if (anchor) {
      //anchor없이 open했을 때 사용하기 위해서 opts에 Position 값을 저장한다.
      if (!this._anchor) {
        this._optsPosition = this._opts.position;
      }
      
      var coord = null;
      if(anchor instanceof olleh.maps.Coord) {
        coord = anchor;
      } else if (anchor instanceof olleh.maps.Point) {
        coord = map.layerMgr.getCoordFromViewportPx(anchor);
      } else if (anchor instanceof olleh.maps.overlay.Marker) {
        anchor.setInfoWindow(this);
        var markerIcon = anchor.getIcon();
        var markerShadow = anchor.getShadow();
        this._anchorOffset = {};
        this._anchorOffset.body =
            new olleh.maps.Point(
                Math.round(markerIcon.size.width/2 - markerIcon.anchor.x),
                -markerIcon.size.height
            );
        if (markerShadow) {
          this._anchorOffset.shadow = 
            new olleh.maps.Point(
                Math.round(markerShadow.size.width - markerShadow.anchor.x),
                -markerShadow.size.height
            );
        } else {
          this._anchorOffset.shadow = 
            new olleh.maps.Point(
                Math.round(markerIcon.size.width/2 - markerIcon.anchor.x),
                -markerIcon.size.height
            );
        }
        coord = anchor.getPosition();
      } else if (anchor instanceof olleh.maps.overlay.Overlay) {
        if (anchor.getPosition()) {
          coord = anchor.getPosition();
        } else if (anchor.getBounds()) {
          coord = anchor.getBounds().getCenter();
        } else {
          throw new TypeError("anchor parameter must have a position");
        }
      } else {
        throw new TypeError("anchor parameter is incorrect");
      }
      this._anchor = anchor;
      this._setPosition(coord);
    } else if (this._anchor  && this.isAdded()) {
      //이전에 anchor가 있었고 이번엔 anchor 없이 다시 open했을 경우.
      this._anchor = null;
      this._anchorOffset = null;
      if (this._optsPosition) {//option에 있는 값으로 설정함.
        this._setPosition(this._optsPosition);
        this._optsPosition = null;
      } else {
        throw new Error("Option's Position value is not exist");
      }
    }
    if (!this.isAdded()) {
      
      this.setMap(map);
      
    } else if (!this._opts.disableAutoPan) {
      //infowindow가 추가되어있고 다시 open했을 때 autopan함
      this._autoPan();
    }
  },
  
  /**
   * DOM Tree에서 InfoWindow의 elements을 삭제하여 InfoWindow을 닫는다.
   * @fires olleh.maps.overlay.BaseInfoWindow#event:close_click
   * @example 
   * info = new olleh.maps.overlay.InfoWindow({
   *   disableAutoPan: true,
   *   pixelOffset: new olleh.maps.Point(10, 20),
   *   position: new olleh.maps.UTMK(953855.70, 1959715.52),
   *   content: content
   * });
   * info.open(map);
   *
   * marker.onEvent('click', function () { info.close(); });
   */
  close: function () {
    if (this.isAdded()) {
      if (this._anchor instanceof olleh.maps.overlay.Marker) {
        this._anchor.setInfoWindow(null);
      }
      this.setMap(null);
    } 
  },
  
  /**
   * InfoWindow의 삭제한다. 
   * @private
   */
  $default_detached: function(event, payload) {
    olleh.maps.overlay.BaseInfoWindow.$super.$default_detached.apply(this, arguments);
    this._anchor = null;
    this._anchorOffset = null;
    this._optsPosition = null;
  },
  
  /**
   * InfoWindow의 zIndex를 변경한다.
   * @param {Number} zIndex InfoWindow의 zIndex값을 변경할 수, default값은 위도값이다. 
   * zIndex를 높이고 싶으면 위도값보다 더 큰값을 설정하면 된다.
   * @fires olleh.maps.overlay.BaseInfoWindow#event:zIndex_changed
   * @example 
   * info = new olleh.maps.overlay.InfoWindow({
   *   disableAutoPan: true,
   *   pixelOffset: new olleh.maps.Point(10, 20),
   *   position: new olleh.maps.UTMK(953855.70, 1959715.52),
   *   content: content
   * });
   * info.open(map);
   *          
   * marker.onEvent('click', function () { 
   *   info.setZIndex(olleh.maps.overlay.BaseOverlay.MAX_ZINDEX); 
   * }); 
   */
  setZIndex: function (zIndex) {
    this._opts.zIndex = zIndex;
    olleh.maps.overlay.BaseInfoWindow.$super.setZIndex.call(this, zIndex);
    this.fireEvent('zIndex_changed');
  },
  
  /**
   * InfoWindow의 option을 설정한다.
   * @param {olleh.maps.overlay.InfoWindowOptions} opts 변경할 InfoWindowOptions 객체
   * @example 
   * info = new olleh.maps.overlay.InfoWindow({
   *   disableAutoPan: false,
   *   pixelOffset: new olleh.maps.Point(10, 20),
   *   position: new olleh.maps.UTMK(953855.70, 1959715.52),
   *   content: content
   * });
   * info.open(map);
   * 
   * marker.onEvent('click', function () { 
   *    info.setOptions({content: WlongCnt,maxWidth: 300});
   * });  
   */
  
  /**
   * @private
   */
  _setPosition: function (position) {
    olleh.maps.overlay.BaseInfoWindow.$super.setPosition.apply(this, arguments);
  },
  
  /**
   * InfoWindow의 position을 설정한다.
   * @fires olleh.maps.overlay.ContentOverlay#event:position_changed
   * @param {olleh.maps.Coord} coord InfoWindow를 위치하고자 하는 좌표값
   * @example 
   * info = new olleh.maps.overlay.InfoWindow({
   *   pixelOffset: new olleh.maps.Point(10, 20),
   *   position: new olleh.maps.UTMK(953855.70, 1959715.52),
   *   content: content
   * });
   * info.open(map);
   * 
   * marker.onEvent('click', function () { 
   *   info.setPosition(new olleh.maps.UTMK(953795.70, 1969715.52));
   * }); 
   */
  setPosition: function (position) {
    if (this._optsPosition) {
      this._optsPosition = position;
    }
    olleh.maps.overlay.BaseInfoWindow.$super.setPosition.apply(this, arguments);
  },
  
  
  /**
   * drag가 시작할 때 호출되는 콜백 함수이다. Marker에서 호출함. 
   * @param {olleh.maps.Point} bodyUpPoint 드레그 시작시 body가 움직여야 하는 point
   * @param {olleh.maps.Point} shadoWUpPoint 드레그 시작시 shadow가 움직여야 하는 point
   * @private
   */
  _dragStart: function (bodyUpPoint, shadowUpPoint) {
    this.bringToFront();
    this._dragUpPoint =  {
        body : bodyUpPoint,
        shadow : shadowUpPoint
    };
    this._marginPx.body = this._marginPx.body.add(this._dragUpPoint.body);
    this._shadow && (this._marginPx.shadow = this._marginPx.shadow.add(this._dragUpPoint.shadow));
    this._updatePosition();
  },
  
  /**
   * drag 되는 중에 호출되는 콜백 함수이다. 
   * @param dragDelta
   * @private
   */
  _drag: function (deltaPoint) {
    this.move(deltaPoint);
  },
  
  /**
   * drag가 끝났을 경우에 호출되는 콜백 함수이다. 
   * @param {olleh.maps.Coord} coord 변경되어야 할 Coord값
   * @private
   */
  _dragEnd: function (coord) {
    this.resetZIndex();
    this._marginPx.body = this._marginPx.body.subtract(this._dragUpPoint.body);
    this._shadow && (this._marginPx.shadow = this._marginPx.shadow.subtract(this._dragUpPoint.shadow));
    this._updatePosition();
    this.setPosition(coord);
  },
 
  /**
   * margin값에 offset 값을 설정한다. InfoWindow의 top, left는 Margin값으로 설정되어있다.
   * 이 margin값에 option으로 설정된 offset값과 open값으로 넘어온 marker의 offset값을 더한다.
   * @private
   * @override
   */
  _updateMargin: function () {
    var offset = this._opts.pixelOffset;
    if (this._anchor instanceof olleh.maps.overlay.Marker) {
      this._marginPx = { body: this._topLeftPx.body.add(offset.add(this._anchorOffset.body)) };
      if (this._shadow) {
        this._marginPx.shadow = this._topLeftPx.shadow.add(offset.add(this._anchorOffset.shadow));
      }
    } else {
      olleh.maps.overlay.BaseInfoWindow.$super._updateMargin.apply(this, arguments);
    }
  },
  
  /**
   * 현재 지도의 위치를 InfoWindow의 위치로 이동한다.
   * @private
   */
  _autoPan: function () {
    var layerMgr = this.getMap().getOverlayLayer().layerMgr;
    var BaseInfo = olleh.maps.overlay.BaseInfoWindow;
    var tPoint = layerMgr.getLayerPxFromCoord(layerMgr.getCenter());
    var centerPoint = new olleh.maps.Point(Math.round(tPoint.x), Math.round(tPoint.y));
    var viewSize = layerMgr.getViewportSize();
    var viewHalfOfWidth = Math.round(viewSize.width/2);
    var viewHalfOfHeight = Math.round(viewSize.height/2);
    var viewTopLeft = layerMgr.getLayerPxFromViewportPx(new olleh.maps.Point(0,0));
    var viewBottomRight = layerMgr.getLayerPxFromViewportPx(layerMgr.getViewportSize().asPoint());
    
    var infoData = this._calInfoData();
    var infoPos = this.getOriginalLayerPx();
    var infoSize = infoData.size;
    var infoTopLeft = infoData.topLeft;
    var infoBottomRight = infoData.bottomRight;
    
    var moveX = infoPos.x , moveY =  infoPos.y;
    
    //내부에 있는 INFOWINDOW 체크 
    var infoTopTypePoint = infoTopLeft.subtract(viewTopLeft);
    var infoBottomTypePoint = viewBottomRight.subtract(infoBottomRight);
    var isMoveX = true, isMoveY = true;
    if (infoTopTypePoint.x > 0 && infoBottomTypePoint.x > 0) {
      //infowindow의 X좌표값들은 내부에 있다.
      isMoveX = false;
      moveX = centerPoint.x;
    }
    
    if (infoTopTypePoint.y > 0 && infoBottomTypePoint.y > 0) {
      //infowindow의 Y좌표값들은 내부에 있다.
      isMoveY = false;
      moveY = centerPoint.y;
    }
    
    if (!isMoveX && !isMoveY) { //infowindow가 내부에 있다.
      return; 
    }
     
    
    var checkInfoSize = viewSize.subtract(infoSize);
    var isLongerThanView = checkInfoSize.width < 0;
    var isHigherThanView = checkInfoSize.height < 0;
    var checkInfoPos = centerPoint.subtract(infoPos);
    var isLeftOfCenter = checkInfoPos.x > 0;
    var isTopOfCenter = checkInfoPos.y > 0;
    
    //move X값 계산    
    if (isMoveX) {
      if (isLongerThanView) {
        //더 길면 왼쪽 모서리에 위치함
        moveX = infoTopLeft.x - BaseInfo.AUTO_PAN_MARGIN + viewHalfOfWidth;        
      } else if (isLeftOfCenter) {
        //왼쪽에 있을 경우
        moveX = infoTopLeft.x - BaseInfo.AUTO_PAN_MARGIN + viewHalfOfWidth;
      } else {
        //오늘쪽에 잇을 경우
        moveX = infoTopLeft.x + infoSize.width + BaseInfo.AUTO_PAN_MARGIN - viewHalfOfWidth;
      }
    }
    
    //move Y값 계산
    //높이가 view 보다 길면 가운데 위치
    if (isMoveY) {
      if(isHigherThanView) {
        //더 높으면 왼쪽 모서리에 위치함
        moveY = infoTopLeft.y - BaseInfo.AUTO_PAN_MARGIN + viewHalfOfHeight;
      } else if (isTopOfCenter) {
        //위쪽에 있을 경우
        moveY = infoTopLeft.y - BaseInfo.AUTO_PAN_MARGIN + viewHalfOfHeight;
      } else {
        //아래쪽에 있을 경우
        if (viewHalfOfHeight < infoSize.height && infoBottomTypePoint.y > 0) {
          //point가 화면 하단쪽 안에 있고, 길이가 View의 절반 보다 클때
          moveY = infoTopLeft.y - BaseInfo.AUTO_PAN_MARGIN + viewHalfOfHeight;
        } else {
          moveY = infoBottomRight.y + BaseInfo.AUTO_PAN_MARGIN - viewHalfOfHeight;
        }
      }
    }   
      
    var coord = layerMgr.getCoordFromLayerPx(new olleh.maps.Point(moveX, moveY));
    layerMgr.panTo(coord);
  },

  /**
   * offset값들을 포함하여 autopan할 때 InfoWindow size 계산.
   * @private
   */
  _calInfoData: function () {
    var layerPx = this.getOriginalLayerPx();
    var infoSize = this._body.size;
    var infoTopLeft = layerPx.add(this._marginPx.body);
    var infoBottomRight = infoTopLeft.add(new olleh.maps.Point(infoSize.width, infoSize.height));
    var topleft = infoTopLeft.clone();
    var bottomRight = infoBottomRight.clone();

    if (layerPx.x < infoTopLeft.x) {
      //pos.x 가 topleft.x 보다 작을때  pos.x topleft.x 가 되는것.
      topleft.x = layerPx.x;
    } else if (layerPx.x > infoBottomRight.x) {
      //pos.x 가 bottomRight.x 보다 클때
      bottomRight.x = layerPx.x;
    }
    
    if (layerPx.y < infoTopLeft.y) {
      //pos.y 가 topleft.y 보다 작을때
      topleft.y = layerPx.y;
    } else if (layerPx.y > infoBottomRight.y) {
      //pos.y 가 bottomRight.y 보다 클때
      bottomRight.y = layerPx.y;
    }
    var size = bottomRight.subtract(topleft);
    
    return {
      topLeft: topleft,
      bottomRight: bottomRight,
      size: new olleh.maps.Size(size.x, size.y) 
    };
  }
});
/**
 *  InfoWindow의 UI 형태는 버블풍선 같이 생겼며, UI는 크게 body, shadow, tip으로 구성되어있다. 
 *  tip는 삼각형(tip 이라고 명명함) 형태이며 tip의 한 꼭지점이 한 위치를 가리키고 있다. 
 *  body는 tip 위에 위치한 사각형 형태이며 그 안에 추가적인 정보를 보여준다.
 *  shadow는 InfoWindow의 tip과 body의 그림자이며 입체효과를 나타내기 위해서 존재한다.
 *  InfoWindow는 Marker 또는 Overlay객체 위에도 위치할 수 있다. 
 *  기본적인 사용법은 InfoWindow객체를 option과 함께 생성하고 {@link olleh.maps.overlay.BaseInfoWindow#open}함수를 이용해서 InfoWindow 화면에 보여준다.
 *  그리고 close 버튼을 이용하여 닫거나 , {@link olleh.maps.overlay.BaseInfoWindow#close} 함수를 이용하여 닫을 수 있다.
 *  InfoWindow의 최소 최대 크기가 있다. 최소 최대 크기는 다음과 같다. minWidth : 300, minHeight : 60, maxWidth : 600, maxHeight : 500
 * <h5>대표적인 이벤트</h5>  
 * <ul>
 * <li>{@link olleh.maps.overlay.BaseInfoWindow#event:close_click|close_click}</li>
 * <li>{@link olleh.maps.overlay.BaseInfoWindow#event:content_changed|content_changed}</li>
 * <li>{@link olleh.maps.overlay.BaseInfoWindow#event:domready|domready}</li>
 * <li>{@link olleh.maps.overlay.BaseInfoWindow#event:position_changed|position_changed}</li>
 * <li>{@link olleh.maps.overlay.BaseInfoWindow#event:zIndex_changed|zIndex_changed}</li>
 * </ul>
 * 
 * @summary InfoWindow는 한 위치(좌표)에 추가적인 정보를 표현하기 위해서 사용하는 Overlay.
 */
$class('olleh.maps.overlay.InfoWindow').extend(olleh.maps.overlay.BaseInfoWindow).define({
  
  $static: {
    URL: olleh.maps.env.RESOURCE_URL,
    SHADOW_URL : 'img/infowins.png',
    INFO_URL : 'img/infowins.png',
    CLOSE_URL : 'img/infowins.png',
    //body의 border
    BORDER : 2,
    //content길이에 따른 Tip(infowindow의 뽀죡한 부분)의 위치  비례값
    TIP_POS_RATE : 0,
    //TIP의 위치가 left로 최대로 갈 수 있는 값
    TIP_POS_MAXLEFT : 45,
    TIP_HEIGHT : 26,
    TIP_NOVIEW_HEIGHT : 2,
    /*그림자의 포함된 특수 상수 */
    //그림자 왼쪽 빗변 시작 포인트
    SHADOW_LEFT_HYPOTENUSE : -366, 
    //그림자 오른쪽 빗변 시작 포인트
    SHADOW_RIGHT_HYPOTENUSE : -1106, 
    //shadowCenterImage width와 height 길이의 차이(px), 즉 centerLeft width 시작길이가 된다.
    //shadow_img_top_width 길이와 같다, 
    SHADOW_LEFT_HYPOTENUSE_HEIGHT_WIDTH_GAP : 70, 
    //Shadow의 Tip 블럭에서 tip의 시작 px까지 의 길이
    SHADOW_IMG_TIP_GAP : 18, //tip의 높이 * tan45, body 왼쪽 하단과 shadow 왼쪽 하단 시작점과의 차이 
    /*이미지의 길이 (여백도 포함된 길이) */
    SHADOW_IMG_TIP_WIDTH : 40,
    SHADOW_IMG_TOP_HEIGHT : 10,
    SHADOW_IMG_TOP_WIDTH : 70,
    SHADOW_IMG_BOTTOM_HEIGHT : 30,
    SHADOW_IMG_BOTTOM_WIDTH : 70,
    /*각 모서리 이미지의 실제 그림자 길이 (단위 px) */
    SHADOW_IMG_LEFTTOP_WIDTH : 40,
    SHADOW_IMG_RIGHTTOP_WIDTH : 30,
    SHADOW_IMG_LEFTBOTTOM_WIDTH : 52,//tip의 높이 * cos45 
    SHADOW_IMG_RIGHTBOTTOM_WIDTH : 30,
    //top, center shadow와 bottom shadow의 그림자가 만나는 차이값
    SHADOW_IMG_LEFTBOTTOM_W_PADDING : 3,

    /*
     * infoWindow template
     * <pre>
     * template property : 
     *  infoBodyWidth: Number,
     *  infoBodyHeight: Number,
     *  closeUrl: String,
     *  contentMaxWidth: Number,
     *  contentWidth: Number,
     *  contentHeight: Number,
     *  content: String,
     *  infoTipTop: Number,
     *  infoleftofTip: Number,
     *  infoUrl: String,
     *  infoBottomWidth: Number,
     *  infoBottomHeight: Number
     * </pre>
     * @type String
     */
    INFO_TMPL: [
      '<div class="ollehmap-info-area" style="width:#{infoBodyWidth}px;height:#{infoBodyHeight}px;">',
        '<div class="ollehmap-info-content" style="max-width:#{contentMaxWidth}px;">',
          '<div class="ollehmap-info-content-overflow" style="padding:#{contentPadding}px;width:#{contentWidth}px;height:#{contentHeight}px;"></div>',
        '</div>',
        '<div class="ollehmap-info-close">',
          '<img class="ollehmap-info-close-img" src="#{closeUrl}" draggable="false"></img>',
        '</div>',
      '</div>',
      '<div class="ollehmap-info-tip" style="top:#{infoTopofTip}px;left:#{infoleftofTip}px;">',
        '<img class="ollehmap-info-tip-img" src="#{infoUrl}"></img>',
      '</div>'].join(''),
      /*'<div class="ollehmap-info-bottom" style="width:#{infoBottomWidth}px;height:#{infoBottomHeight}px;"></div>'].join(''),*/
    
    /*
     * infoWindow shadow template
     * TODO : 최신 브라우저인 경우 background-position, background-size로 img tag를 대체할 수 있음.
     * <pre>
     * template property :
     *  topLeftPoint: Number,
     *  topRightPoint: Number,
     *  bottomLeftPointX: String,
     *  bottomLeftPointY: Number,
     *  bottomRightPointX: Number,
     *  bottomRightPointY: Number,
     *  bottomTipPointX: String,
     *  bottomTipPointY: Number,
     *  topCenterPointX: Number,
     *  topCenterPointY: String,
     *  topCenterWidth: Number,
     *  middleLeftPointX: Number,
     *  middleLeftWidth: Number,
     *  middleLeftHeight: Number,
     *  middleLeftImgLeftPx: Number,
     *  middleRightPointX: Number,
     *  middleRightPointY: Number,
     *  middleRightWidth: Number,
     *  middleRightHeight: Number,
     *  middleRightImgLeftPx: Number,
     *  bottomLeftOfTipPointX: Number,
     *  bottomLeftOfTipPointY: Number,
     *  bottomLeftOfTipWidth: Number,
     *  bottomRightOfTipPointX: Number,
     *  bottomRightOfTipPointY: Number,
     *  bottomRightOfTipRightWidth: Number,
     *  middlePointX: Number,
     *  middlePointY: Number,
     *  middleWidth: Number,
     *  middleHeight: Number,
     *  url: String
     * </pre>
     * @type String
     */
    INFO_SHADOW_TMPL: [
      '<div class="ollehmap-info-shadow-topleft" style="left:#{topLeftPoint}px;">',
        '<img src="#{url}" draggable="false">',
      '</div>',
      '<div class="ollehmap-info-shadow-topright" style="left:#{topRightPoint}px;">',
        '<img src="#{url}" draggable="false">',
      '</div>',
      '<div class="ollehmap-info-shadow-bottomleft" style="left:#{bottomLeftPointX}px; top:#{bottomLeftPointY}px; ">',
        '<img src="#{url}" draggable="false">',
      '</div>',
      '<div class="ollehmap-info-shadow-bottomright" style="left:#{bottomRightPointX}px; top:#{bottomRightPointY}px;">',
        '<img src="#{url}" draggable="false">',
      '</div>',
      '<div class="ollehmap-info-shadow-bottomtip" style="left:#{bottomTipPointX}px; top:#{bottomTipPointY}px;">',
        '<img src="#{url}" draggable="false">', 
      '</div>', //centerTop TopCenter
      '<div class="ollehmap-info-shadow-topcenter" style="left:#{topCenterPointX}px; top:#{topCenterPointY}px; width:#{topCenterWidth}px; ">',
        '<img src="#{url}" draggable="false">',
      '</div>', //centerLeft img
      '<div class="ollehmap-info-shadow-centerleft" style="left:#{middleLeftPointX}px; top:#{middleLeftPointY}px; width:#{middleLeftWidth}px; height:#{middleLeftHeight}px;">',
        '<img style="left:#{middleLeftImgLeftPx}px;" src="#{url}" draggable="false">',
      '</div>', //centerRight img
      '<div class="ollehmap-info-shadow-centerright" style="left:#{middleRightPointX}px; top:#{middleRightPointY}px; width:#{middleRightWidth}px; height:#{middleRightHeight}px;">',
        '<img style="left:#{middleRightImgLeftPx}px;" src="#{url}" draggable="false">',
      '</div>', //leftTip
      '<div class="ollehmap-info-shadow-bottomleftoftip" style="left:#{bottomLeftOfTipPointX}px; top:#{bottomLeftOfTipPointY}px; width:#{bottomLeftOfTipWidth}px;">',
        '<img src="#{url}" draggable="false">',
      '</div>', //rightTip
      '<div class="ollehmap-info-shadow-bottomrightoftip" style="left:#{bottomRightOfTipPointX}px; top:#{bottomRightOfTipPointY}px; width:#{bottomRightOfTipRightWidth}px;">',
        '<img src="#{url}" draggable="false">',
      '</div>', //center
      '<div class="ollehmap-info-shadow-center" style="left:#{middlePointX}px; top:#{middlePointY}px; width:#{middleWidth}px; height:#{middleHeight}px;">',
        '<img src="#{url}" draggable="false">',
      '</div>'].join('')
  },
  
  /**
   * @name olleh.maps.overlay.InfoWindow#InfoWindow
   * @param {olleh.maps.overlay.InfoWindowOptions} opts InfoWindowOptions
   * @see olleh.maps.overlay.PointedOverlay#PointedOverlay
   * @see olleh.maps.overlay.BaseInfoWindow
   * @see olleh.maps.overlay.BaseInfoWindow#open
   * @constructs
   */
  
  /**
   * InfoWindow의 body를 생성한다.
   * @override {@link olleh.maps.overlay.BaseInfoWindow#createBodyElem}
   * @param {olleh.maps.Size} contentSize 컨텐츠 사이즈 
   * @param {olleh.maps.Point} point InfoWindow가 나타나야할 위치, layerPixel 값
   * @return {Element}          [rootElem] InfoWindow의 body의 root element
   *         {Element}          [contentElem] InfoWindow의 body안에 content element
   *         {Element}          [closeElem] InfoWindow의 body안에 close element
   *         {olleh.maps.Size}  [size] InfoWindow의 size
   *         {olleh.maps.Point} [topLeftPoint] InfoWindow의 top left Point. 
   *                                 파라미터의 point 값 기준으로 top, left 값을 계산해야 된다.
   *@private
   */
  createBodyElem: function (contentSize, point) {
    var InfoWindow = olleh.maps.overlay.InfoWindow;
    var domutil = olleh.maps.util.dom;
    var contentPadding = this._opts.padding == undefined ? this._defaultPadding : this._opts.padding;
    var infoBodyWidth = contentSize.width  + 2*contentPadding; //컨텐츠 사이즈와 padding값 더한 body의 넓이를 구함
    var infoBodyHeight = contentSize.height  + 2*contentPadding;
    //infowindow area의 width는 양 옆의 border의 두께도 포함한 값
    var infoWidth = infoBodyWidth + 2*InfoWindow.BORDER;
    //infowindow area의 top는 위 아래 border의 두께도 포함한 값
    var infoHeight = infoBodyHeight + InfoWindow.TIP_HEIGHT + 2*InfoWindow.BORDER;
    var infoPosY = point.y - infoHeight;
    
    var tipleftPos = InfoWindow.TIP_POS_RATE * contentSize.width;
    if (tipleftPos > InfoWindow.TIP_POS_MAXLEFT) {
      tipleftPos = 0;
    }     
    var infoleftofTip = contentPadding + InfoWindow.BORDER
            + Math.ceil(contentSize.width/2 - tipleftPos);
    var infoPosX = point.x - infoleftofTip - InfoWindow.BORDER; //infowindow area의 left는 왼쪽 border의 두께도 포함한 left값임
    
    //tip의 높이는 border를 포함한 infoBodyHeight값(infowindow area의 위치)과 tip의 위쪽이 content안에 들어가는 높이를 뺀값이 높이다.  
    var infoTopofTip = infoBodyHeight + 2*InfoWindow.BORDER - InfoWindow.TIP_NOVIEW_HEIGHT;
    
    var infoDiv = document.createElement('div');
    var data = {
        infoBodyWidth: infoBodyWidth, //border는 미포함
        infoBodyHeight: infoBodyHeight,//border는 미포함
        contentPadding: contentPadding,
        closeUrl: InfoWindow.URL + InfoWindow.CLOSE_URL,
        infoUrl: InfoWindow.URL+ InfoWindow.INFO_URL,
        contentMaxWidth: this._opts.maxWidth,
        contentWidth: contentSize.width,
        contentHeight: contentSize.height,
        infoTopofTip: infoTopofTip,
        infoleftofTip: infoleftofTip
      };
    
    domutil.addClass(infoDiv, 'ollehmap-info');
    infoDiv.innerHTML = olleh.maps.util.applyTemplate(InfoWindow.INFO_TMPL, data);
    var closeElem = infoDiv.childNodes[0].childNodes[1];
    if (this._opts.disableCloseButton) {
      domutil.removeElements(closeElem);
      closeElem = null;
    }
    return {
      rootElem : infoDiv,
      contentElem : infoDiv.childNodes[0].childNodes[0].children[0],
      closeElem : closeElem,
      size : new olleh.maps.Size(infoWidth, infoHeight),
      topLeftPoint : new olleh.maps.Point(infoPosX, infoPosY)
    };
    
  },
  
  /**
   * InfoWindow의 shadow를 생성한다. 
   * @override {@link olleh.maps.overlay.BaseInfoWindow#createBodyElem}
   * @param {olleh.maps.Size} contentSize 컨텐츠 사이즈 
   * @param  {olleh.maps.Point} point InfoWindow의 그림자가 나타나야할 위치, layerPixel 값
   * @return {Element}          [rootElem] InfoWindow의 그림자의 root element
   *         {olleh.maps.Size}  [size] InfoWindow의 size
   *         {olleh.maps.Point} [topLeftPoint] InfoWindow의 top left Point. 
   *                                 파라미터의 point 값 기준으로 top, left 값을 계산해야 된다.
   *@private
   */
  createShadowElem: function (contentSize, point) {
    var domutil = olleh.maps.util.dom;
    var InfoWindow = olleh.maps.overlay.InfoWindow;
    var contentPadding = this._opts.padding == undefined ?  this._defaultPadding : this._opts.padding;
    var bodyWidth = contentSize.width + 2*InfoWindow.BORDER + 2*contentPadding;
    var bodyHeight = contentSize.height + 2*InfoWindow.BORDER + 2*contentPadding;
    var infoHeight = bodyHeight + InfoWindow.TIP_HEIGHT;
    
    var tipleftPos = InfoWindow.TIP_POS_RATE * contentSize.width;
    if (tipleftPos > InfoWindow.TIP_POS_MAXLEFT) {//??
      tipleftPos = 0;
    }
    var infoleftofTip = contentPadding 
            + Math.ceil(contentSize.width/2 - tipleftPos);
    
    var shadowHeight =  Math.round(
        (infoHeight)/2);
    var shadowWidth = bodyWidth;
    
    
    var shadowInfoLeftofTip = infoleftofTip
    - InfoWindow.SHADOW_IMG_TIP_GAP;
    
    var shadowPosY = point.y - shadowHeight;
    var shadowPosX = point.x - infoleftofTip;
    
    
    var infoShadowDiv = document.createElement('div');
    domutil.addClass(infoShadowDiv, 'ollehmap-info-shadow');
    domutil.addClass(infoShadowDiv, 'ollehmap-noevent');
    
    var middleLeftHSize = shadowHeight 
    - InfoWindow.SHADOW_IMG_TOP_HEIGHT - InfoWindow.SHADOW_IMG_BOTTOM_HEIGHT;
    var topCenterWSize = shadowWidth
    - InfoWindow.SHADOW_IMG_LEFTTOP_WIDTH - InfoWindow.SHADOW_IMG_RIGHTTOP_WIDTH;
    var bottomLeftTipWSize = shadowInfoLeftofTip - InfoWindow.SHADOW_IMG_LEFTBOTTOM_WIDTH;
    var bottomRightTipWSize = shadowWidth - shadowInfoLeftofTip 
    - InfoWindow.SHADOW_IMG_TIP_WIDTH - InfoWindow.SHADOW_IMG_RIGHTBOTTOM_WIDTH;
    
    var left =  InfoWindow.SHADOW_IMG_BOTTOM_WIDTH;
    var top = InfoWindow.SHADOW_IMG_TOP_HEIGHT + middleLeftHSize;
    var bottomLeftPoint = new olleh.maps.Point(0, top);
    //cal position and size of Tip'left  shadow
    var bottomLeftOfTipPoint = new olleh.maps.Point(left, top);
    var bottomLeftOfTipWidth = bottomLeftTipWSize;
    //cal position of Tip shadow
    left += bottomLeftTipWSize;
    var bottomTipPoint = new olleh.maps.Point(left, top);
    //cal position of Tip'right  shadow
    left += InfoWindow.SHADOW_IMG_TIP_WIDTH;
    var bottomRightOfTipPoint = new olleh.maps.Point(left, top); 
    var bottomRightOfTipRightWidth = bottomRightTipWSize;
    //cal position of rightBottom shadow
    left += bottomRightTipWSize;    
    var bottomRightPoint = new olleh.maps.Point(left, top);
    
    //cal position and size of middle left shadow
    var middleLeftWidth = middleLeftHSize + InfoWindow.SHADOW_LEFT_HYPOTENUSE_HEIGHT_WIDTH_GAP;
    left = InfoWindow.SHADOW_IMG_LEFTBOTTOM_W_PADDING;
    top = InfoWindow.SHADOW_IMG_TOP_HEIGHT;
    var middleLeftPoint = new olleh.maps.Point(left, top);
    var middleLeftSize = new olleh.maps.Size(middleLeftWidth, middleLeftHSize);
    var middleLeftImgLeftPx = InfoWindow.SHADOW_LEFT_HYPOTENUSE + middleLeftWidth;
    //cal position and size of middle shadow
    left += middleLeftWidth;
    var middlePoint = new olleh.maps.Point(left, top);
    var middleSize = new olleh.maps.Size(Math.max(shadowWidth - middleLeftWidth,0), middleLeftHSize);
    //cal position of middleRight shadow
    left += parseFloat(middleSize.width);
    var middleRightPoint = new olleh.maps.Point(left, top);
    var middleRightSize = new olleh.maps.Size(middleLeftWidth, middleLeftHSize);
    var middleRightImgLeftPx = InfoWindow.SHADOW_RIGHT_HYPOTENUSE + middleLeftWidth;
    
    //cal position of Top's left shadow
    left = InfoWindow.SHADOW_IMG_LEFTBOTTOM_W_PADDING + middleLeftWidth - InfoWindow.SHADOW_IMG_TOP_WIDTH;
    var topLeftPoint = new olleh.maps.Point(left, 0);
    //cal position of Top's center shadow
    left += InfoWindow.SHADOW_IMG_TOP_WIDTH;
    var topCenterPoint = new olleh.maps.Point(left, 0);
    var topCenterWidth = topCenterWSize;
    //cal position of Top's right shadow
    left += topCenterWSize;
    var topRightPoint = new olleh.maps.Point(left, 0);
    var data = {
        topLeftPoint: topLeftPoint.x,
        topRightPoint: topRightPoint.x,
        bottomLeftPointX: bottomLeftPoint.x,
        bottomLeftPointY: bottomLeftPoint.y,
        bottomRightPointX: bottomRightPoint.x,
        bottomRightPointY: bottomRightPoint.y,
        bottomTipPointX: bottomTipPoint.x,
        bottomTipPointY: bottomTipPoint.y,
        topCenterPointX: topCenterPoint.x,
        topCenterPointY: topCenterPoint.y,
        topCenterWidth: topCenterWidth,
        middleLeftPointX: middleLeftPoint.x,
        middleLeftPointY: middleLeftPoint.y,
        middleLeftWidth: middleLeftSize.width,
        middleLeftHeight: middleLeftSize.height,
        middleRightPointX: middleRightPoint.x,
        middleRightPointY: middleRightPoint.y,
        middleRightWidth: middleRightSize.width,
        middleRightHeight: middleRightSize.height,
        bottomLeftOfTipPointX: bottomLeftOfTipPoint.x,
        bottomLeftOfTipPointY: bottomLeftOfTipPoint.y,
        bottomLeftOfTipWidth: bottomLeftOfTipWidth,
        bottomRightOfTipPointX: bottomRightOfTipPoint.x,
        bottomRightOfTipPointY: bottomRightOfTipPoint.y,
        bottomRightOfTipRightWidth: bottomRightOfTipRightWidth,
        middlePointX: middlePoint.x,
        middlePointY: middlePoint.y,
        middleWidth: middleSize.width,
        middleHeight: middleSize.height,
        middleLeftImgLeftPx: middleLeftImgLeftPx,
        middleRightImgLeftPx: middleRightImgLeftPx,
        url: InfoWindow.URL + InfoWindow.SHADOW_URL
      };

    infoShadowDiv.innerHTML = olleh.maps.util.applyTemplate(InfoWindow.INFO_SHADOW_TMPL, data);
        
    return {
      rootElem : infoShadowDiv,
      size : new olleh.maps.Size(shadowWidth + shadowHeight*Math.tan(Math.PI/4), shadowHeight),
      topLeftPoint : new olleh.maps.Point(shadowPosX, shadowPosY)
    };
  }
  
});
/////////////////////////
//   TooltipOptions    //
/////////////////////////
/**
 * TooltipOptions Object Specification
 * @typedef olleh.maps.overlay.TooltipOptions
 * @extends olleh.maps.overlay.ContentOverlayOptions
 * @property {olleh.maps.Point} [pixelOffset=(0,0)] Tooltip의 position에서의 offset값, tooltip의 방향에 맞게 반경으로 설정된다.
 * @property {Number} [zIndex] Tooltip의 zIndex값
 * @property {Number} [maxWidth=800] Tooltip의 최대 width값
 * @property {Number} [padding=4] content의 padding값을 설정한다.
 * @property {String|Node} content Tooltip안에 보여질 content값을 설정한다.
 * HTML element , plain-text string, HTML를 포함한 string을 설정할 수 있다. Tooltip의 content에 따라서 size가 결정된다.
 */

/**
 * Tooltip는 특정 overlay에 간단한 정보를 나타내기 위해서 사용하는 Overlay이다. UI는 간단한 박스모양으로 구성되어 있다.
 * Tooltip는 나타나는 위치는 오른쪽 하단, 왼쪽 하단, 오른쪽 상단, 왼쪽 상단 4가지이다 
 * Tooltip이 나타날때 위의 4가지 방향 순서대로 화면에 가려지지 않고 위치할 수 있는 곳에 위치한다.
 * <h5>대표적인 이벤트</h5>
 * <ul>
 * <li>{@link olleh.maps.overlay.Tooltip#event:close|close}</li>
 * <li>{@link olleh.maps.overlay.Tooltip#event:content_changed|content_changed}</li>
 * <li>{@link olleh.maps.overlay.Tooltip#event:domready|domready}</li>
 * <li>{@link olleh.maps.overlay.Tooltip#event:position_changed|position_changed}</li>
 * <li>{@link olleh.maps.overlay.Tooltip#event:zIndex_changed|zIndex_changed}</li>
 * <ul>
 * 
 * @summary Tooltip는 특정 위치(좌표)에 간단한 정보를 표현하기 위해서 사용하는 Overlay
 */
$class('olleh.maps.overlay.Tooltip').extend(olleh.maps.overlay.ContentOverlay).define({
  
  $static: {
    BORDER : 1,
    TOOLTIP_TMPL: [
      '<div class="ollehmap-info-tooltip-area" style="width:#{bodyWidth}px;height: #{bodyHeight}px;">',
        '<div class="ollehmap-info-tooltip-content" style="max-width:#{contentMaxWidth}px;max-height:#{contentMaxHeight}px">',
          '<div class="ollehmap-info-content-overflow" style="padding:#{contentPadding}px;width:#{contentWidth}px;height:#{contentHeight}px;"></div>',
        '</div>',
      '</div>'].join('')
  },
  /**
   * close 이벤트<p/>
   * Tooltip가 닫힐 때 호출 되는 이벤트이다.
   * @example 
   * tooltip = new olleh.maps.overlay.Tooltip({
   *   pixelOffset: new olleh.maps.Point(10, 20),
   *   position: new olleh.maps.UTMK(953855.70, 1959715.52),
   *   content: content
   * });
   * tooltip.onEvent('close', 
   *   function (event) { console.log('close');}
   * );
   * tooltip.open(map, marker);
   * @name event:close
   * @event
   * @memberOf olleh.maps.overlay.Tooltip.prototype
   * @param {olleh.maps.event.Event} event
   * 
   **/
   /**
   * content_changed 이벤트<p/>
   * Tooltip의 Content가 변경될 때 호출 되는 이벤트이다.
   * @example
   * tooltip = new olleh.maps.overlay.Tooltip({
   *   pixelOffset: new olleh.maps.Point(10, 20),
   *   position: new olleh.maps.UTMK(953855.70, 1959715.52),
   *   content: content
   * });
   * tooltip.onEvent('content_changed', 
   *   function (event) { console.log('content_changed');}
   * );
   * tooltip.open(map, marker); 
   * @name event:content_changed
   * @event
   * @memberOf olleh.maps.overlay.Tooltip.prototype
   * @param {olleh.maps.event.Event} event
   **/
  /**
   * domready 이벤트<p/>
   * Tooltip가 DOM Tree에 처음 append 될 때 호출 되는 이벤트이다. 
   * Tooltip가 DOM Tree에 append 된 상태에서 추가적인 작업을 할 때 사용된다. 
   * 주의할 점은 Tooltip가 DOM Tree에 append되었다고 영구적으로 append 되어 있지 않음을 주의해야 한다.
   * 또한 Tooltip가 DOM Tree에 append 된 상태에서Tooltip가 보이지 않은 곳으로 지도가 이동할 경우에는 
   * Tooltip는 DOM Tree에 잠시 제거된다. 다시 Tooltip가 보이는 곳으로 지도가 이동할 경우에는 Tooltip는 DOM Tree에 추가된다. 
   * 하지만 domready이벤트는 호출되지 않는다. 왜냐하면 DOM Tree에 처음 append 될 때만 domready이벤트가 호출되기 때문이다.
   * @example
   * tooltip = new olleh.maps.overlay.Tooltip({
   *   pixelOffset: new olleh.maps.Point(10, 20),
   *   position: new olleh.maps.UTMK(953855.70, 1959715.52),
   *   content: content
   * });
   * tooltip.onEvent('domready', 
   *   function (event) { console.log('domready');}
   * );
   * tooltip.open(map, marker); 
   * @name event:domready
   * @event
   * @memberOf olleh.maps.overlay.Tooltip.prototype
   * @param {olleh.maps.event.Event} event
   **/
   /**
   * position_changed 이벤트<p/>
   * Tooltip의 position이 변경될 때 호출 되는 이벤트이다.
   * @example
   * tooltip = new olleh.maps.overlay.Tooltip({
   *   pixelOffset: new olleh.maps.Point(10, 20),
   *   position: new olleh.maps.UTMK(953855.70, 1959715.52),
   *   content: content
   * });
   * tooltip.onEvent('position_changed', 
   *   function (event) { console.log('position_changed');}
   * );
   * tooltip.open(map, marker);
   * @name event:position_changed
   * @event
   * @memberOf olleh.maps.overlay.Tooltip.prototype
   * @param {olleh.maps.event.Event} event
   **/
   /**
   * zIndex_changed 이벤트<p/>
   * Tooltip의 zIndex값이 변경될 때 호출 되는 이벤트이다.
   * @example
   * tooltip = new olleh.maps.overlay.Tooltip({
   *   pixelOffset: new olleh.maps.Point(10, 20),
   *   position: new olleh.maps.UTMK(953855.70, 1959715.52),
   *   content: content
   * });
   * tooltip.onEvent('zIndex_changed', 
   *   function (event) { console.log('zIndex_changed');}
   * );
   * tooltip.open(map, marker);
   * @name event:zIndex_changed
   * @event
   * @memberOf olleh.maps.overlay.Tooltip.prototype
   * @param {olleh.maps.event.Event} event
   **/
   
   /**
    * 생성자, 명시된 opts를 사용하여 새로운 객체를 생성한다.
    * @param {olleh.maps.overlay.TooltipOptions} opts TooltipOptions
    */
  Tooltip: function (opts) {
    //content에 대한 기본 css
    this._defaultCss = 'ollehmap-info-tooltip-data';
    //content에 대한 기본 padding
    this._defaultPadding = 4;
  },
  
  /**
   * 옵션을 지정한다
   * @param {olleh.maps.overlay.TooltipOptions} opts 옵션
   */
  setOptions: function (opts) {
    if (opts.zIndex == undefined) {
      opts.zIndex = olleh.maps.overlay.BaseOverlay.MAX_ZINDEX;
    }
    olleh.maps.overlay.Tooltip.$super.setOptions.call(this, opts);
  },
  
  /**
   * Tooltip용 Infowindow의 body를 생성한다.
   * @override
   * @param contentSize
   * @param point
   * @private
   */
  createBodyElem: function (contentSize, point) {
    var tooltip = olleh.maps.overlay.Tooltip;
    //TODO: chrome브라우저 bug fix 후 제거 필요
    contentSize.width +=1;
    var contentPadding = this._opts.padding == undefined ? this._defaultPadding : this._opts.padding;
    var bodyWidth = contentSize.width + 2*contentPadding;
    var bodyHeight = contentSize.height + 2*contentPadding;
    var infoHeight = bodyHeight + 2*tooltip.BORDER;
    var infoWidth = bodyWidth + 2*tooltip.BORDER;
    var domutil = olleh.maps.util.dom;
    var infoDiv = document.createElement('div');
    domutil.addClass(infoDiv, 'ollehmap-info');
    var data = {
        bodyWidth : bodyWidth,
        bodyHeight : bodyHeight,
        contentPadding : contentPadding,
        contentMaxWidth: this._opts.maxWidth,
        contentMaxHeight: this.contentSize.maxHeight,
        contentWidth : contentSize.width,
        contentHeight : contentSize.height
    };
     
    infoDiv.innerHTML = olleh.maps.util.applyTemplate(tooltip.TOOLTIP_TMPL, data);
    
    return {
      rootElem : infoDiv,
      contentElem : infoDiv.childNodes[0].childNodes[0].childNodes[0],
      closeElem : null,
      size : new olleh.maps.Size(infoWidth, infoHeight),
      topLeftPoint : point
    };
    
  },
  
  /**
   * tooltip의 사이즈와 point를 감안하여 4가지의 방향성중 어느 곳에 위치해야 하는지
   * 계산하여 margin 값을 계산한다. 4가지 방향성의 우선순위는 bottomRight
   * , bottomLeft, topRight, topLeft 순이다.
   * @return {olleh.maps.Point} point margin값
   * @private
   */
  _calTooltipPosition: function () {
    var layerMgr = this.getMap().getOverlayLayer().layerMgr;
    var size = this._body.size;
    var offset = this._opts.pixelOffset;
    var viewBounds = layerMgr.getBounds();
    var layerPx = this.getOriginalLayerPx();
    var radius = this._calRadiusOfAnchor();
    
    //bottomRight
    var point = new olleh.maps.Point(
        layerPx.x + offset.x + radius.right, 
        layerPx.y + offset.y + radius.bottom);
    
    var coord = layerMgr.getCoordFromLayerPx(new olleh.maps.Point(
        point.x + size.width, point.y + size.height));
    if (viewBounds.contains(coord)) {
      return  point.subtract(layerPx);
    }
    
    //bottomLeft
    point = new olleh.maps.Point(
        layerPx.x - size.width - offset.x - radius.left, 
        layerPx.y + offset.y + radius.bottom);
    coord = layerMgr.getCoordFromLayerPx(new olleh.maps.Point(
        point.x, point.y + size.height));
    if (viewBounds.contains(coord)) {
      return  point.subtract(layerPx);
    }
    
    //topRight
    point = new olleh.maps.Point(
        layerPx.x + offset.x + radius.right,
        layerPx.y - size.height - offset.y - radius.top);
    coord = layerMgr.getCoordFromLayerPx(new olleh.maps.Point(
        point.x + size.width, point.y));
    if (viewBounds.contains(coord)) {
      return  point.subtract(layerPx);
    }
    
    //topLeft
    point = new olleh.maps.Point(
        layerPx.x - size.width - offset.x - radius.left, 
        layerPx.y - size.height - offset.y - radius.top);
    coord = layerMgr.getCoordFromLayerPx(new olleh.maps.Point(
        point.x, point.y));
    return  point.subtract(layerPx);
  },
  
  /**
   * @override
   * @private
   */
  _updateMargin: function () {
    //방향에 따라 margin값을 계산한다.
    this._marginPx = {body : this._calTooltipPosition()};
  },
  /**
   * Marker 이미지 사이즈안에서 Marker anchor의 기준으로  상 하 좌 우 반경을 계산한다.
   * @private
   */
  _calRadiusOfAnchor: function () {
    var radius = {
        top : 0,
        bottom : 0,
        left : 0,
        right : 0
    };
    if (olleh.maps.overlay.Marker && this._anchor instanceof olleh.maps.overlay.Marker) {
      var mIcon = this._anchor.getIcon();
      var size = mIcon.size;
      var point = mIcon.anchor;
      radius.left = point.x;
      radius.right = size.width - point.x;
      radius.top = point.y;
      radius.bottom = size.height - point.y;
    }    
    return radius;
  },
  
  _setPosition: function (position) {
    olleh.maps.overlay.Tooltip.$super.setPosition.apply(this, arguments);
  },
  
  setPosition: function (position) {
    if (this._optsPosition) {
      this._optsPosition = position;
    }
    if (this._isOpenOptions) {
      this._openOptions.position = position;
    } else {
      olleh.maps.overlay.Tooltip.$super.setPosition.apply(this, arguments);
    }
    
  },
  
  setPixelOffset: function (offset) {
    if (this._isOpenOptions) {
      this._openOptions.pixelOffset = offset;
    } else {
      olleh.maps.overlay.Tooltip.$super.setPixelOffset.apply(this, arguments);
    }
  },
  
  setContent: function (content) {
    if (this._isOpenOptions) {
      this._openOptions.content = content;
    } else {
      olleh.maps.overlay.Tooltip.$super.setContent.apply(this, arguments);
    }
  },
  
  setZIndex: function (zIndex) {
    if (this._isOpenOptions) {
      this._openOptions.zIndex = zIndex;
    } else {
      olleh.maps.overlay.Tooltip.$super.setZIndex.apply(this, arguments);
    }
  },
  
  _setMaxWidth: function (width) {
    if (this._isOpenOptions) {
      this._openOptions.maxWidth = width;
    } else {
      olleh.maps.overlay.Tooltip.$super._setMaxWidth.apply(this, arguments);
    }
  },
  
  /**
   * Tooltip을 open한다.
   * anchor를 {@link olleh.maps.overlay.Marker}로 설정하면 marker의 position값과 marker의 사이즈를 
   * 기준으로 Tooltip를 위치시킨다. 특정 반경을 으로 위치하고 싶을 경우는 
   * {@link olleh.maps.overlay.TooltipOptions.pixelOffset} 옵션 사용을 고려해봐라. 
   * @param map {olleh.maps.Map} map Overlay를 추가할 Map 객체 
   * @param anchor {olleh.maps.Coord | olleh.maps.overlay.Overlay} anchor {@link olleh.maps.Coord}값 또는 
   * {@link olleh.maps.overlay.Overlay} 객체 (Marker 등), getPosition값을 가지고 있어야 한다.
   * @param options {olleh.maps.overlay.TooltipOptions} options open할 때 options,open함수에서 options파라미터가 설정되면 기존에 설정된 options값들은 저장된다. 
   * 다시 open할 때 options값을 설정하지 않으면 기존의 저장된 options값들로 세팅되어 open 된다.
   * <p>
   * (주의사항)
   * 1. open시 options에 사용가능한 옵션은 position, pixelOffset, zIndex, content, maxWidth 5개로 한정한다.
   * 2. options를 파라미터로 넘겨서 open하면 setPosition, setPixelOffset, setPixelOffset, setZIndex, setOptions 함수는 기존에 설정된 값을 설정하는 용도로 적용된다.
   * 그래서 options를 파라미터로 넘겨서 open된 tooltip에는 option이 설정되지 않는다. options를 파라미터로 넘겨서 open된 tooltip의 설정 변경을 원할 때에는 options값을 변경해서
   *  open함수를 호출해야 한다. 
   * </p> 
   */
  open: function (map, anchor, options) {
    if (options) {
      //option값이 없을 때의 값을 저장한다.
      if (!this._isOpenOptions) {
        var opts = this._opts;
        var o = {};
        if (opts.position) {
          o.position = this._optsPosition? this._optsPosition:opts.position;
        }
        if (opts.pixelOffset) {
          o.pixelOffset = opts.pixelOffset;
        } else {
          o.pixelOffset = new olleh.maps.Point(0,0);
        }
        if (opts.content) {
          o.content = opts.content;
        }
        if (opts.zIndex) {
          o.zIndex = opts.zIndex;
        } else {
          o.zIndex = 'auto';
        }
        if (opts.maxWidth) {
          o.maxWidth = opts.maxWidth;
        } else {
          o.maxWidth = this.contentSize.maxWidth;
        }
        
        this._openOptions = o;
      }
      this.setOptions(options);
      this._isOpenOptions = true;
    } else if (this._isOpenOptions){
      //option 값이 없으므로 이전 option 으로 되돌린다.
      this._isOpenOptions = false;
      this.setOptions(this._openOptions);
    }
    
    if (anchor) {
      //anchor없이 open했을 때 사용하기 위해서 opts Position 값을 저장한다.
      if (!this._anchor) {
        //이전에 anchor 없을 때 position 값을 저장한다.
        this._optsPosition = this._opts.position;
      }
      
      var coord = null;
      if(anchor instanceof olleh.maps.Coord) {
        coord = anchor;
      } else if (anchor instanceof olleh.maps.Point) {
        coord = map.layerMgr.getCoordFromViewportPx(anchor);
      } else if (olleh.maps.overlay.Marker && anchor instanceof olleh.maps.overlay.Marker) {
        coord = anchor.getPosition();
      } else if (anchor instanceof olleh.maps.overlay.Overlay) {
        
        if (anchor.getPosition()) {
          coord = anchor.getPosition();
        } else if (anchor.getBounds()) {
          coord = anchor.getBounds().getCenter();
        } else {
          throw new TypeError("anchor parameter must have a position");
        }
      } else {
        throw new TypeError("anchor parameter must have a position");
      }
      this._anchor = anchor;
      this._setPosition(coord);
    } else if (this._anchor && this.isAdded()){
      //이전에 anchor가 있었고 이번엔 anchor 없이 다시 open했을 경우.
      this._anchor = null;
      if (this._optsPosition) {//option에 있는 값으로 설정함.
        this._setPosition(this._optsPosition);
        this._optsPosition = null;
      } else {
        throw new Error("Option's Position value is not exist");
      }
    } else if (this.isAdded()){
      //option값으로 위치수정한다.
      this.setPosition(this._opts.position);
    }
    if (!this.isAdded()) {
      this.setMap(map);
    } 
  },
  
  /**
   * DOM Tree에서 Tooltip의 elements을 삭제하여 Tooltip을 닫는다.
   * @fires olleh.maps.overlay.Tooltip#event:close
   */
  close: function () {
    if (this._isOpenOptions) {
      this.setOptions(this._openOptions);
    }
    this._anchor = null;
    this._isOpenOptions = null;
    this._optsPosition = null;
    this._openOptions = null;
    this.setMap(null);
    if (this.isAdded()) {
      this.fireEvent('close');
    }
  }
});/**
 * ProjectedOverlayOptions Object Specification
 * @typedef olleh.maps.overlay.ProjectedOverlayOptions
 * @extends olleh.maps.overlay.BaseOverlayOptions
 * @property {olleh.maps.Bounds} bounds 지도상 영역.
 * @property {Number} [opacity=1] 불투명도. <code>0</code>일 경우 0%, <code>1</code>일 경우 100%이다.
 * @property {Boolean} [fadeIn=false] 페이드인 효과 사용여부. <code>true</code>일 경우 페이드인 효과를 사용한다.
 * @property {Boolean} [fadeOut=false] 페이드아웃 효과 사용여부. <code>true</code>일 경우 페이드아웃 효과를 사용한다.
 */


/**
 * 지도상의 특정 영역에 존재하는 오버레이를 나타내는 클래스.
 */
$class('olleh.maps.overlay.ProjectedOverlay').extend(olleh.maps.overlay.BaseOverlay).define({

  /**
   * 생성자, 명시된 opts를 사용해서 새로운 객체를 생성한다.
   * @param {olleh.maps.overlay.ProjectedOverlayOptions} opts 옵션.
   */
  ProjectedOverlay: function (opts) {
    this._opacity = 1;
    this._fadeIn = true;
    this._fadeOut = true;
  },

  /**
   * 옵션을 지정한다.
   * @param {olleh.maps.overlay.ProjectedOverlayOptions} opts 옵션.
   */
  setOptions: function (opts) {
    opts.bounds && this.setBounds(opts.bounds);
    opts.opacity && this.setOpacity(opts.opacity);
    opts.fadeIn !== undefined && this.setFadeIn(opts.fadeIn);
    opts.fadeOut !== undefined && this.setFadeOut(opts.fadeOut);
    olleh.maps.overlay.ProjectedOverlay.$super.setOptions.apply(this, arguments);
  },

  update: function () {
    this._updateBounds();
    this._updateOpacity();
    olleh.maps.overlay.ProjectedOverlay.$super.update.apply(this, arguments);
  },
  
  /**
   * @private
   * @returns {olleh.maps.Bounds}
   */
  getIndexObject: function () {
    return this.getBounds();
  },
  
  /**
   * @private
   * @returns {number}
   */
  getAutoZIndex: function () {
    return 0;
  },

  /**
   * 지도상 영역을 반환한다.
   * @returns {olleh.maps.Bounds} 지도상 영역.
   */
  getBounds: function () {
    return this._bounds;
  },

  /**
   * 지도상 영역를 설정한다.
   * @param {olleh.maps.Bounds} bounds 지도상 영역.
   */
  setBounds: function (bounds) {
    var from = this._bounds;
    this._bounds = bounds;
    if(this.isDrawn()) {
      this._updateBounds();
    }
    this.fireEvent('bounds_changed', {from: from, to: bounds});
  },

  /**
   * @private
   */
  _updateBounds: function () {
    var size, styles;
    if (!this._bounds) {
      throw new Error('Bounds is not set.');
    }
    this._currentLayerPx = this.getOriginalLayerPx();
    this._currentScale = 1;
    size = this.getOriginalSize();
    styles = olleh.maps.util.dom.getPositionStyles(this._currentLayerPx.x, this._currentLayerPx.y);
    if (styles.transform) {
      styles.transform += ' ' + olleh.maps.util.dom.getScaleString(1);
    }
    styles.width = size.width + 'px';
    styles.height = size.height + 'px';
    this.updatePositioningStyles(styles);
  },

  /**
   * 불투명도를 반환한다.
   * @returns {Number} 불투명도. 0일 경우 0%, 1일 경우 100%이다.
   */
  getOpacity: function () {
    return this._opacity;
  },

  /**
   * 불투명도를 설정한다.
   * @param {Number} opacity 불투명도. <code>0</code>일 경우 0%, <code>1</code>일 경우 100%이다.
   */
  setOpacity: function (opacity) {
    this._opacity = opacity;
    this._drawn && this._updateOpacity();
  },

  /**
   * 페이드인 효과 사용여부를 반환한다.
   * @returns {Boolean} 페이드인 효과를 사용하는 경우 <code>true</code>, 그렇지 않을 경우 <code>false</code>.
   */
  isFadeIn: function () {
    return this._fadeIn;
  },

  /**
   * 페이드인 효과 사용여부를 설정한다.
   * @param {Boolean} fadeIn 페이드인 효과 사용여부. <code>true</code>일 경우 페이드인 효과를 사용한다.
   */
  setFadeIn: function (fadeIn) {
    this._fadeIn = fadeIn;
  },

  /**
   * 페이드아웃 효과 사용여부를 반환한다.
   * @returns {Boolean} 페이드아웃 효과를 사용하는 경우 <code>true</code>, 그렇지 않을 경우 <code>false</code>.
   */
  isFadeOut: function () {
    return this._fadeOut;
  },

  /**
   * 페이드아웃 효과 사용여부를 설정한다.
   * @param {Boolean} fadeOut 페이드아웃 효과 사용여부. <code>true</code>일 경우 페이드아웃 효과를 사용한다.
   */
  setFadeOut: function (fadeOut) {
    this._fadeOut = fadeOut;
  },

  /**
   * @private
   */
  _updateOpacity: function () {
    this.forEachElement(function (paneId, elem) {
      olleh.maps.util.dom.setStyle(elem, 'opacity', this._opacity);
    });
  },

  /**
   * @param {Number} scale
   * @param {olleh.maps.Point} origin
   * @param {Number} duration
   * @param {olleh.maps.fx.Pulse} [pulse]
   * @private
   */
  zoomStart: function (scale, origin, duration, pulse) {
    var originalSize, center, newCenter, newPx;
    var originalLayerPx = this.getOriginalLayerPx();

    if (olleh.maps.browser.style.transform) {
      originalSize = this.getOriginalSize();
      center = originalLayerPx.clone()._add(originalSize.width / 2, originalSize.height / 2);
      newCenter = origin.add(center.subtract(origin).multiplyBy(scale));
      newPx = newCenter.clone()._subtract(originalSize.width / 2, originalSize.height / 2).round();
    } else {
      newPx = origin.add(originalLayerPx.subtract(origin).multiplyBy(scale)).round();
    }
    
    this.moveTo(newPx, scale, duration, pulse);
  },

  /**
   * @private
   */
  zoomEnd: function () {
    this.stopAnimators();
    this._updateBounds();
  },

  /**
   * 현재 화면상 좌표를 지정된 좌표로 이동시키며 동시에 크기를 특정 배율로 변경한다. 
   * 지도상 영역(bounds)은 변경되지 않기 때문에 draw() 를 다시 호출하면 원 영역에 그려지게 된다. 
   * @param {olleh.maps.Point} px 이동할 화면상 좌표.
   * @param {Number} [scale] 변경할 배율.
   * @param {Number} [duration=0] 이동 시간, 초 단위. 0 이상의 값을 지정하면 애니메이션 효과가 적용된다.
   * @param {olleh.maps.fx.Pulse} [pulse] 펄스. 지정시 이동 애니메이션이 펄스에 동기화된다.
   * @param {Function} [callback] 이동이 완료된 후 호출되는 콜백 함수.
   */
  moveTo: function (px, scale, duration, pulse, callback) {
    var styles, originalSize;
    
    scale || (scale = this._currentScale);

    styles = olleh.maps.util.dom.getPositionStyles(px.x, px.y);
    if (styles.transform) {
      styles.transform += ' ' + olleh.maps.util.dom.getScaleString(scale);
    } else {
      originalSize = this.getOriginalSize();
      styles.width = Math.round(originalSize.width * scale) + 'px';
      styles.height = Math.round(originalSize.height * scale) + 'px';
    }
    
    this.animateTo(styles, duration, pulse, callback);

    this._currentLayerPx = px;
    this._currentScale = scale;
  },

  /**
   * 현재 화면상 좌표를 지정된 좌표만큼 이동시키며 동시에 크기를 특정 배율로 변경한다. 
   * 지도상 영역(bounds)은 변경되지 않기 때문에 draw() 를 다시 호출하면 원 영역에 그려지게 된다. 
   * @param {olleh.maps.Point} px 더해질 화면상 좌표.
   * @param {Number} [scale] 변경할 배율.
   * @param {Number} [duration=0] 이동 시간, 초 단위. 0 이상의 값을 지정하면 애니메이션 효과가 적용된다.
   * @param {olleh.maps.fx.Pulse} [pulse] 펄스. 지정시 이동 애니메이션이 펄스에 동기화된다.
   * @param {Function} [callback] 이동이 완료된 후 호출되는 콜백 함수.
   */
  move: function (px, scale, duration, pulse, callback) {
    this.moveTo(this._currentLayerPx.add(px), this._currentScale, duration, pulse, callback);
  },

  /**
   * 지도상 영역의 좌측 상단 지점을 기준으로 한 초기 화면상 좌표를 리턴한다.
   * @returns {olleh.maps.Point} 초기 화면상 좌표
   */
  getOriginalLayerPx: function () {
    var layerMgr = this.layer.layerMgr;
    var leftBottomPx = layerMgr.getLayerPxFromCoord(this._bounds.leftBottom, false);
    var rightTopPx = layerMgr.getLayerPxFromCoord(this._bounds.rightTop, false);
    return new olleh.maps.Point(leftBottomPx.x, rightTopPx.y);
  },

  /**
   * 지도상 영역에 따른 초기 화면상 크기를 리턴한다.
   * @returns {olleh.maps.Size} 초기 화면상 크기
   */
  getOriginalSize: function () {
    var layerMgr = this.layer.layerMgr;
    var leftBottomPx = layerMgr.getLayerPxFromCoord(this._bounds.leftBottom, false);
    var rightTopPx = layerMgr.getLayerPxFromCoord(this._bounds.rightTop, false);
    return new olleh.maps.Size(rightTopPx.x - leftBottomPx.x, leftBottomPx.y - rightTopPx.y);
  },

  /**
   * 현재 화면상 좌표를 반환한다.
   * 초기 값은 {@link olleh.maps.overlay.ProjectedOverlay#getOriginalLayerPx()} 와 동일하나
   * {@link olleh.maps.overlay.ProjectedOverlay#moveTo()} 나
   * {@link olleh.maps.overlay.ProjectedOverlay#move()} 를 호출하면 변경될 수 있다.
   * @returns {olleh.maps.Point} 현재 화면상 좌표.
   */
  getCurrentLayerPx: function () {
    return this._currentLayerPx;
  },

  /**
   * 현재 화면상 배율을 반환한다. 초기 값은 1이나
   * {@link olleh.maps.overlay.ProjectedOverlay#moveTo()} 나
   * {@link olleh.maps.overlay.ProjectedOverlay#move()} 를 호출하면 변경될 수 있다.
   * @returns {olleh.maps.Point} 현재 화면상 배율.
   */
  getCurrentScale: function () {
    return this._currentScale;
  },
  
  getFadeInAnimation: function () {
    return this._fadeIn ? new olleh.maps.fx.Animation({
      from: {
        opacity: '0'
      },
      to: {
        opacity: this._opacity
      },
      duration: .5,
      timing: olleh.maps.fx.timing.easeOut
    }) : null;
  },

  getFadeOutAnimation: function () {
    return this._fadeOut ? new olleh.maps.fx.Animation({
      from: {
        opacity: this._opacity
      },
      to: {
        opacity: '0'
      },
      duration: .5,
      timing: olleh.maps.fx.timing.easeOut
    }) : null;
  }

});
/**
 * GroundOverlayOptions Object Specification
 * @typedef olleh.maps.overlay.GroundOverlayOptions 
 * @property {String} url 이미지 URL.
 * @extends olleh.maps.overlay.ProjectedOverlayOptions
 */

/**
 * 지도상의 특정 영역에 이미지를 나타내는 오버레이.
 */
$class('olleh.maps.overlay.GroundOverlay').extend(olleh.maps.overlay.ProjectedOverlay).define({

  /**
   * 생성자, 명시된 opts를 사용하여 새로운 객체를 생성한다.
   * @name GroundOverlay
   * @param {olleh.maps.overlay.GroundOverlayOptions} opts 옵션.
   * @constructor
   * @memberof olleh.maps.overlay.GroundOverlay.prototype
   */

  /**
   * 옵션을 지정한다.
   * @param {olleh.maps.overlay.GroundOverlayOptions} opts 옵션.
   */
  setOptions: function (opts) {
    opts.url && this.setURL(opts.url);
    opts.title && this.setTitle(opts.title);
    olleh.maps.overlay.GroundOverlay.$super.setOptions.apply(this, arguments);
  },

  update: function () {
    this._updateURL();
    olleh.maps.overlay.GroundOverlay.$super.update.apply(this, arguments);
  },
  
  /**
   * 이미지 URL을 반환한다.
   * @returns {String} 이미지 URL.
   */
  getURL: function () {
    return this._url;
  },
  
  /**
   * 이미지 URL을 설정한다.
   * @param {String} url 이미지 URL.
   */
  setURL: function (url) {
    this._url = url;
    this._drawn && this._updateURL();
  },
  
  /**
   * GroundOverlay의 롤오버 텍스트를 반환한다.
   * @returns {String} title
   */
  getTitle: function () {
    return this._title;
  },
  
  /**
   * GroundOverlay에 롤오버 텍스트를 지정한다.
   * @example groundOverlay.setTitle('경복궁');
   * @fires olleh.maps.overlay.GroundOverlay#event:title_changed
   * @param {String} title GroundOverlay 롤오버 텍스트
   */
  setTitle: function (title) {
    if(this._title !== title) {
      this._title = title;
      /**
       * title_changed 이벤트. GroundOverlay의 롤오버텍스트가 변경되었을 경우 발생한다.
       * <p/>
       * @name event:title_changed
       * @event
       * @memberOf olleh.maps.overlay.GroundOverlay.prototype
       * @param {olleh.maps.event.Event} event
       */
       this.isAdded() && this.fireEvent('title_changed');
    }
  },
  
  $default_mouseover: function (event, payload) {
    if(this._title) {
      var tooltip = this.map.getTooltip();
      if (tooltip) {
        tooltip.setContent(this._title);
        tooltip.setPixelOffset(new olleh.maps.Point(20, 0));
        tooltip.open(this.map, event.getCoord());
        this._tooltip = tooltip;
      }
    }
    var $default_mouseover= olleh.maps.overlay.GroundOverlay.$super.$default_mouseover;
    $default_mouseover && $default_mouseover.apply(this, arguments);
  },
  
  $default_mousemove: function (event, payload) {
    if(this._tooltip) {
      this._tooltip.setPosition(event.getCoord());
    }
    var  $default_mousemove= olleh.maps.overlay.GroundOverlay.$super.$default_mousemove;
    $default_mousemove && $default_mousemove.apply(this, arguments);
  },

  $default_mouseout: function (event, payload) {
    if(this._tooltip) {
      this._tooltip.setPixelOffset(new olleh.maps.Point(0, 0));
      this._tooltip.close();
      this._tooltip = null;
    }
    var $default_mouseout = olleh.maps.overlay.GroundOverlay.$super.$default_mouseout;
    $default_mouseout && $default_mouseout.apply(this, arguments);
  },
  
  _updateURL: function () {
    var img = this._img;
    if (!this._url) {
      throw new Error('URL is not set.');
    }

    if (!img) {
      img = this._img = new olleh.maps.SpritedImage();
      this.registerElement('lower_overlay_pane', img.elem);
      this.registerEventDom(img.elem);
    }
    
    img.setImage(this._url, olleh.maps.Point.zero(), olleh.maps.Size.full());
  }

});/**
 * @private
 * @typedef olleh.maps.vector.VectorOptions
 * @property {Boolean} [editable=false] 편집 모드 활성화 여부.
 * @property {Boolean} [visible=true] 화면에 보여줄지 여부.
 * @extends olleh.maps.overlay.OverlayOptions
 */

/**
 * Vector 구현체들을 위한 base class. 이 class 는 추상 class 역할을 하기 때문에 바로 생성할 수 없다.
 * @private
 */
$class('olleh.maps.vector.Vector').extend(olleh.maps.overlay.Overlay).define({
  /**
   * Vector 를 위한 Renderer 이름
   * @private
   */
  rendererName: null,
  
  /**
   * Vector 클래스에 대한 {@link olleh.maps.vector.EditHandler} 를 정의하는 registry 이다. 확장 plugin 에서 <br>
   * <code>
   *  olleh.maps.vector.Vector.prototype.editHandlerRegistry['olleh.maps.vector.Polyline'] = example.PolylineEditHandler 
   * </code> 
   * 와 같이 EditHandler class 를 등록하도록 한다.
   * @private
   */
  editHandlerRegistry: {},

  /**
   * 생성자, 명시된 opts를 사용해서 새로운 객체를 생성한다.
   */
  Vector: function (opts) {
    if (this.$classname === 'olleh.maps.vector.Vector') {
      throw new TypeError('Cannot instantiate olleh.maps.vector.Vector directly.');
    }
    this._drawn = false;
    this._visible = true;
    this._editable = false;
    this._element = null; // olleh.maps.Element
    this._eventDom = null; // DOM Element
    this.layer = null;
    this._renderer = null; // olleh.maps.vector.BaseRenderer
    this._opts = this._getDefaultOptions();
  },

  /**
   * 가시성을 반환한다.
   * @returns {Boolean} 표시될 경우 <code>true</code>, 그렇지 않을 경우
   *          <code>false</code>.
   */
  isVisible: function () {
    return this._visible;
  },

  /**
   * 가시성을 설정한다.
   * @fires olleh.maps.vector.Vector#event:visible_changed
   * @param {Boolean} visible <code>true</code>일 경우 표시, 그렇지 않을 경우 숨김.
   */
  setVisible: function (visible) {
    if (this._visible === visible) {
      return;
    }
    this._visible = visible;
    if(this._drawn) {
      this._updateVisiblity();
    }
    if(this.isAdded() && visible){
      this.draw();
    }
    /**
     * 가시성이 변경되었을 경우 발생한다.
     * @event olleh.maps.vector.Vector#event:visible_changed
     * @param {olleh.maps.event.Event} event
     */
    this.fireEvent('visible_changed');
  },

  /**
   * z-index 를 가장 큰값으로 변경해서 화면 맨 앞에 나타나도록 한다.
   */
  bringToFront: function () {
    if (!this._isFront) {
      this._isFront = true;
      if (this._drawn) {
        var vector = olleh.maps.browser.vector;
        if (vector === 'VML') {
          this._updateZIndex();
        } else if (vector === 'SVG') {
          var elem = this._element.elem;
          elem.parentNode && elem.parentNode.appendChild(elem);
        }
      }
    }
  },

  _updateVisiblity: function () {
    olleh.maps.util.dom.setStyle(this._element.elem, 'display', this._visible ? 'block' : 'none');
  },

  _updateZIndex: function () {
    var zIndex = this._isFront ? olleh.maps.overlay.BaseOverlay.MAX_ZINDEX : this._zIndex;
    if (olleh.maps.isNumber(zIndex)) {
      olleh.maps.util.dom.setStyle(this._element.elem, 'zIndex', zIndex);
    }
  },

  /**
   * {@link #bringToFront} 호출하기전 z-index 값으로 되돌아 간다.
   */
  resetZIndex: function () {
    if (this._isFront) {
      this._isFront = false;
      if (this._drawn && olleh.maps.browser.vector === 'VML') {
        this._updateZIndex();
      }
    }
  },

  /**
   * Vector 가 layer 에 추가될 때 호출된다.
   * @private
   */
  onAdd: function (layer) {
    this.isVisible() && this.draw();
  },

  /**
   * Vector 를 위한 Renderer 를 생성한다. rendererName 으로 지정된 renderer 를 {@link olleh.maps.vector.RendererFactory}
   * 를 사용해서 생성한다.
   * @private
   * @returns {olleh.maps.vector.BaseRenderer}
   */
  createRenderer: function () {
    return this.layer.getRendererFactory()['create' + this.rendererName](this._opts);
  },

  /**
   * Vector 를 그린다. Vector 가 지도에 추가되면 자동으로 호출 된다.
   */
  draw: function () {
    if(!this.isAdded())
      return;
    if(!this._renderer)
      this._renderer = this.createRenderer();
    if(!this._renderer)
      return;
    this._drawn = true;
    this._doDraw();
    if (!this._element) {
      this._element = this._renderer.getRootElement();
      var elem = this._element.elem;
      this.layer.getContainer().appendChild(elem);
      var eventDom = this._eventDom = this._renderer.getEventDom();
      this.registerEventDom(eventDom);
    }
    this.registerEvent();
    if(this._editable) {
      this._attachEditHandler(); 
    }
  },
  
  /**
   * Vector 가 VectorLayer 에서 제거될 때 VectorLayer 에서 호출해준다.
   * @private
   */
  onRemove: function() {
    this.erase();
  },

  /**
   * draw() 로 그린 내용을 지운다. Vector 가 지도에서 제거될 때 자동으로 호출 된다.
   */
  erase: function () {
    olleh.maps.vector.Vector.$super.erase.apply(this, arguments);
    if (this._element) {
      this.unregisterEvent();
      this.layer.getContainer().removeChild(this._element.elem);
      this._element = null;
      this._eventDom = null;
      this._drawn = false;
      if(this._editable) {
        this._detachEditHandler();
      }
    }
  },

  /**
   * 오버레이가 실제로 화면에 그려진 상태인지 여부를 반환한다.
   * @returns {Boolean} 그려진 상태일 경우 <code>true</code>, 그렇지 않을 경우
   *          <code>false</code>
   * @private
   */
  isDrawn: function () {
    return this._drawn;
  },

  /**
   * Vector 하위 클래스에서 이 함수를 오버라이드해서 renderer 를 사용해 실제로 그리는 작업을 수행해야 한다. subclass
   * should override this
   * @private
   * @returns {Element}
   */
  _doDraw: function () {
  },

  attach: function () {
    var layer = this.map.getLayer('Vector');
    if (layer)
      layer.add(this);
    else
      throw new Error('VectorLayer does not exists.');
  },

  detach: function () {
    this.layer && this.layer.remove(this);
  },

  /**
   * 생성자 option 의 기본값을 정의한다. subclass should override this
   * @private
   * @returns {Object}
   */
  _getDefaultOptions: function () {
    return {};
  },

  /**
   * 옵션을 변경한다.
   * @param {Object} options
   */
  setOptions: function (options) {
    olleh.maps.mixin(this._opts, options, true);
    if (this.isAdded() && this._renderer) {
      this._renderer.setOptions(this._opts);
      this.isVisible() && this._doDraw();
    }
    options.editable !== undefined && this.setEditable(options.editable);
    olleh.maps.vector.Vector.$super.setOptions.apply(this, arguments);
  },
  
  /**
   * 벡터의 중심점을 반환한다.
   * @returns {olleh.maps.Coord} 중심점
   */
  getCenter: function() {
    
  },
  
  /**
   * 벡터의 bounds 를 반환한다.
   * @returns {olleh.maps.Bounds} bounds
   */
  getBounds: function() {
    
  },

  /**
   * 벡터 편집모드를 활성화/비활성화 한다.
   * @param {Boolean} editable true 인 경우 편집 모드를 활성화 시킨다.
   */
  setEditable: function(editable) {
    if(this._editable !== editable) {
      this._editable = editable;
      if(!editable) {
        this._detachEditHandler();
      } else {
        if(this._drawn) {
          this._attachEditHandler();
        }
      }
    }
  },
  
  /**
   * 벡터 편집모드 활성화 여부를 반환한다.
   * @returns {Boolean} true 인 경우 편집모드가 활성화된 상태이다.
   */
  isEditable: function() {
    return this._editable;
  },
  
  _attachEditHandler: function() {
    if(this._editHandler) {
      this._editHandler.refresh();
    } else {
      var editHandlerClass = olleh.maps.vector.Vector.prototype.editHandlerRegistry[this.$classname];
      if(editHandlerClass) {
        var editHandler = new editHandlerClass(this);
        editHandler.activate();
        this._editHandler = editHandler;
      }
    }
  },
  
  _detachEditHandler: function() {
    this._editHandler && this._editHandler.deactivate();
    this._editHandler = null;
  }

});
/**
 * geometry 값으로 {@link olleh.maps.Path} 를 사용하는 Polyline, Polygon 을 위한 base class
 * @private
 */
$class('olleh.maps.vector.Path').extend(olleh.maps.vector.Vector).define({

  /**
   * Path 를 Layer Pixel Array 로 변환한다.
   * @param {olleh.maps.Path} path
   * @returns {Array.<olleh.maps.Point>}
   * @private
   */
  _convertPathToPoints: function (path) {
    var points = [];
    var lm = this.layer.layerMgr;
    for ( var i = 0, len = path.getLength(); i < len; i++) {
      var coord = path.getAt(i);
      var layerPx = lm.getLayerPxFromCoord(coord);
      points.push(layerPx);
    }
    return points;
  }

});/**
 * {@link olleh.maps.vector.Polygon} 옵션
 * @typedef olleh.maps.vector.PolygonOptions
 * @property {olleh.maps.Path|Array.<olleh.maps.Path>} paths Polygon 을 정의하는 Path 객체 또는 배열
 * @property {String} [fillColor='transpraent'] Polygon 내부를 채울 색상, CSS 색상값을 사용할 수 있다.
 *        'transparent' 로 지정하면 색상을 채우지 않는다.
 * @property {Number} [fillOpacity=1.0] Polygon 내부 투명도, 0.0 과 1.0 사이의 숫자를 사용할 수
 *        있다.
 * @property {String} [strokeColor='black'] 외곽선 색상, CSS 색상값을 사용할 수 있다.
 * @property {Number} [strokeOpacity=1.0] 외곽선 투명도, 0.0 과 1.0 사이의 숫자를 사용할 수 있다.
 * @property {Number} [strokeWeight=5] 픽셀 단위 외곽선 두께.
 * @property {String} [strokeStyle] 점선 패턴을 지정한다.
 * 'solid', 'shortdashdotdot','shortdash','shortdot','shortdashdot','dot','dash',
 * 'longdash','dashdot','longdashdot','longdashdotdot' 값중 하나의 값을 지정한다.
 * @property {String} [strokeLinecap='round'] 선의 끝점 형태를 지정한다. 'butt', 'round', 'square' 중 하나의 값을 지정한다.
 * @property {String} [strokeLinejoin='round'] 선들 간의 연결 형태를 지정한다. 'miter', 'round', 'bevel' 중 하나의 값을 지정한다.
 * @property {Boolean} [visible=true] 화면에 보여줄지 여부.
 * @extends olleh.maps.vector.VectorOptions
 */

/**
 * Polygon 을 나타내기 위한 vector class. {@link olleh.maps.Path} 객체 또는 {@link olleh.maps.Path} 의 배열을 geometry 값으로 사용한다.
 * 
 * <p/>
 * <h5>대표적인 이벤트</h5>
 * <ul>
 * <li>{@link olleh.maps.vector.Vector#event:visible_changed|visible_changed}</li>
 * <li>{@link olleh.maps.vector.Polygon#event:paths_changed|paths_changed}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:click|click}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:rightclick|rightclick}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:dblclick|dblclick}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:drag|drag}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:dragend|dragend}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:dragstart|dragstart}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:mousedown|mousedown}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:mouseover|mouseover}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:mouseout|mouseout}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:mouseup|mouseup}</li>
 * </ul>
 * <p/>
 */
$class('olleh.maps.vector.Polygon').extend(olleh.maps.vector.Path).define({
  rendererName: 'PolygonRenderer',

  /**
   * 생성자, 명시된 opts를 사용해서 새로운 객체를 생성한다.
   * @param {olleh.maps.vector.PolygonOptions} opts Polygon 생성 옵션
   */
  Polygon: function (opts) {
  },
  
  init: function() {
    olleh.maps.vector.Polygon.$super.init.call(this);
    var paths = this.getPaths();
    for(var i=0; i<paths.length; i++) {
      paths[i].onChange(this.draw, this);
    }
  },
  
  /**
   * 옵션을 변경한다.
   * @method olleh.maps.vector.Polygon#setOptions
   * @param {olleh.maps.vector.PolygonOptions} options Polygon 옵션
   */

  /**
   * Polygon 을 정의하는 path 객체 또는 배열을 지정한다.
   * @param {olleh.maps.Path | Array} paths
   */
  setPaths: function (paths) {
    var existingPaths = this.getPaths();
    for(var i=0; i<existingPaths.length; i++) {
      existingPaths[i].unsubscribeChange(this.draw, this);
    }
    this.erase();
    paths = paths || [];
    if (!olleh.maps.isArray(paths))
      paths = [ paths ];
    this._opts.paths = paths;
    if (paths.length > 0) {
      for(var i=0; i<paths.length; i++) {
        paths[i].onChange(this.draw, this);
      }
      this.draw();
    }
    /**
     * paths 변경 이벤트. 
     * 만일 이미 설정된 path 객체의 coord 가 변경되는 경우를 처리하기 위해서는
     * {@link olleh.maps.Path#onChange(callbackFn,ctx)} 를 사용한다.    
     * @event olleh.maps.vector.Polygon#event:paths_changed
     * @param {olleh.maps.event.Event} event
     */
    this.fireEvent('paths_changed');
  },

  _doDraw: function () {
    var paths = this.getPaths();
    var pointsArray = [];
    for(var i=0; i<paths.length; i++) {
      var points = this._convertPathToPoints(paths[i]);
      pointsArray.push(points);
      this._renderer.draw(pointsArray);
    }
  },

  /**
   * Path 배열을 반환한다.
   * @returns {Array.<olleh.maps.Path>} Polygon 을 정의하는 Path 배열. 
   *  Path 가 지정되지 않은 경우 empty array
   */
  getPaths: function () {
    if(olleh.maps.isArray(this._opts.paths))
      return this._opts.paths;
    return this._opts.paths ? [this._opts.paths] : [];
  },

  _getDefaultOptions: function () {
    return {
      fillColor: 'transparent',
      fillOpacity: 1.0,
      fillRule: 'evenodd',
      strokeColor: 'black',
      strokeOpacity: 1.0,
      strokeWeight: 5,
      visible: true
    };
  },

  getCenter: function() {
    return this.getBounds().getCenter();
  },
  
  getBounds: function() {
    return this.getPaths()[0].getBounds();
  }

});
/**
 * {@link olleh.maps.vector.Polyline} 옵션
 * @typedef olleh.maps.vector.PolylineOptions
 * @property {olleh.maps.Path} path Polyline 을 정의하는 Path 객체
 * @property {String} [strokeColor='black'] 외곽선 색상, CSS 색상값을 사용할 수 있다.
 * @property {Number} [strokeOpacity=1.0] 외곽선 투명도, 0.0 과 1.0 사이의 숫자를 사용할 수 있다.
 * @property {Number} [strokeWeight=5] 픽셀 단위 외곽선 두께.
 * @property {String} [strokeStyle] 점선 패턴을 지정한다.
 * 'solid', 'shortdashdotdot','shortdash','shortdot','shortdashdot','dot','dash',
 * 'longdash','dashdot','longdashdot','longdashdotdot' 값중 하나의 값을 지정한다.
 * @property {String} [strokeLinecap='round'] 선의 끝점 형태를 지정한다. 'butt', 'round', 'square' 중 하나의 값을 지정한다.
 * @property {String} [strokeLinejoin='round'] 선들 간의 연결 형태를 지정한다. 'miter', 'round', 'bevel' 중 하나의 값을 지정한다.
 * @extends olleh.maps.vector.VectorOptions
 */

/**
 * Polyline 을 나타내기 위한 Vector class. {@link olleh.maps.Path} 를 geometry 값으로 사용한다.
 * <p/>
 * <h5>대표적인 이벤트</h5>
 * <ul>
 * <li>{@link olleh.maps.vector.Vector#event:visible_changed|visible_changed}</li>
 * <li>{@link olleh.maps.vector.Polyline#event:path_changed|path_changed}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:click|click}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:rightclick|rightclick}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:dblclick|dblclick}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:drag|drag}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:dragend|dragend}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:dragstart|dragstart}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:mousedown|mousedown}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:mouseover|mouseover}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:mouseout|mouseout}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:mouseup|mouseup}</li>
 * </ul>
 * <p/>
 */
$class('olleh.maps.vector.Polyline').extend(olleh.maps.vector.Path).define({
  rendererName: 'PolylineRenderer',

  /**
   * 생성자, 명시된 opts를 사용해서 새로운 객체를 생성한다.
   * @param {olleh.maps.vector.PolylineOptions} opts Polyline 생성 옵션
   */
  Polyline: function (opts) {
  },
  
  init: function() {
    olleh.maps.vector.Polyline.$super.init.call(this);
    if(this._opts.path) {
      this._opts.path.onChange(this.draw, this);
    }
  },
  
  /**
   * 옵션을 변경한다.
   * @method olleh.maps.vector.Polyline#setOptions
   * @param {olleh.maps.vector.PolylineOptions} options Polyline 옵션
   */

  _doDraw: function () {
    if (this._opts.path) {
      var points = this._convertPathToPoints(this._opts.path);
      this._renderer.draw(points);
    }
  },

  /**
   * Path 를 설정한다.
   * @param {olleh.maps.Path} path
   */
  setPath: function (path) {
    if (this._opts.path) {
      this._opts.path.unsubscribeChange(this.draw, this);
    }
    this._opts.path = path;
    if (path) {
      path.onChange(this.draw, this);
      this.draw();
    } else {
      this.erase();
    }
    /**
     * path 변경 이벤트. 
     * 만일 이미 설정된 path 객체의 coord 가 변경되는 경우를 처리하기 위해서는
     * {@link olleh.maps.Path#onChange(callbackFn,ctx)} 를 사용한다.    
     * @event olleh.maps.vector.Polyline#event:path_changed
     * @param {olleh.maps.event.Event} event
     */
    this.fireEvent('path_changed');
  },

  /**
   * Path 객체를 반환한다.
   * @returns {olleh.maps.Path} Path 객체
   */
  getPath: function () {
    return this._opts.path;
  },

  _getDefaultOptions: function () {
    return {
      icons: [],
      strokeColor: 'black',
      strokeOpacity: 1.0,
      strokeWeight: 5,
      visible: true
    };
  },
  
  getCenter: function() {
    return this.getBounds().getCenter();
  },
  
  getBounds: function() {
    return this.getPath().getBounds();
  }

});
/**
 * {@link olleh.maps.vector.Rectangle} 옵션
 * @typedef olleh.maps.vector.RectangleOptions
 * @property {olleh.maps.Bounds} bounds 사각형을 정의하는 Bounds
 * @property {String} [fillColor='transpraent'] Rectangle 내부를 채울 색상. CSS 색상값을 사용할 수 있다.
 *        'transparent' 로 지정하면 색상을 채우지 않는다.
 * @property {Number} [fillOpacity=1.0] Rectangle 내부 색상 투명도. 0.0 과 1.0 사이의 숫자를 사용할 수 있다.
 * @property {String} [strokeColor='black'] 외곽선 색상, CSS 색상값을 사용할 수 있다.
 * @property {Number} [strokeOpacity=1.0] 외곽선 투명도, 0.0 과 1.0 사이의 숫자를 사용할 수 있다.
 * @property {Number} [strokeWeight=5] 픽셀 단위 외곽선 두께.
 * @property {String} [strokePosition=center] 외곽선의 위치. center, inside, outside 중
 *        하나의 값을 선택할 수 있다.
 * @property {String} [strokeStyle] 점선 패턴을 지정한다. 
 * 'solid', 'shortdashdotdot','shortdash','shortdot','shortdashdot','dot','dash',
 * 'longdash','dashdot','longdashdot','longdashdotdot' 값중 하나의 값을 지정한다.
 * @property {String} [strokeLinecap='round'] 선의 끝점 형태를 지정한다. 'butt', 'round', 'square' 중 하나의 값을 지정한다.
 * @property {String} [strokeLinejoin='round'] 선들 간의 연결 형태를 지정한다. 'miter', 'round', 'bevel' 중 하나의 값을 지정한다.
 * @extends olleh.maps.vector.VectorOptions
 */

/**
 * 사각형을 나타내기 위한 vector class. {@link olleh.maps.Bounds} 를 geometry 값으로 사용한다.
 * <p/>
 * <h5>대표적인 이벤트</h5>
 * <ul>
 * <li>{@link olleh.maps.vector.Vector#event:visible_changed|visible_changed}</li>
 * <li>{@link olleh.maps.vector.Rectangle#event:bounds_changed|bounds_changed}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:click|click}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:rightclick|rightclick}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:dblclick|dblclick}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:drag|drag}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:dragend|dragend}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:dragstart|dragstart}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:mousedown|mousedown}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:mouseover|mouseover}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:mouseout|mouseout}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:mouseup|mouseup}</li>
 * </ul>
 * <p/>
 */
$class('olleh.maps.vector.Rectangle').extend(olleh.maps.vector.Vector).define({
  rendererName: 'RectangleRenderer',

  /**
   * 생성자, 명시된 opts를 사용해서 새로운 객체를 생성한다.
   * @param {olleh.maps.vector.RectangleOptions} opts Rectangle 생성 옵션
   */
  Rectangle: function (opts) {
  },
  
  /**
   * 옵션을 변경한다.
   * @method olleh.maps.vector.Rectangle#setOptions
   * @param {olleh.maps.vector.RectangleOptions} options Rectangle 옵션
   */

  _doDraw: function () {
    var lm = this.layer.layerMgr;
    var resolution = lm.getResolution();
    var bounds = this._opts.bounds;
    var leftTopPx = lm.getLayerPxFromCoord(bounds.getLeftTopCoord());
    var widthPx = bounds.getWidth() / resolution;
    var heightPx = bounds.getHeight() / resolution;
    this._renderer.draw(leftTopPx, widthPx, heightPx);
  },

  /**
   * bounds 를 지정한다.
   * @param {olleh.maps.Bounds} bounds Rectangle 의 위치와 크기를 정의한다.
   */
  setBounds: function (bounds) {
    this._opts.bounds = bounds;
    this.draw();
    /**
     * bounds 변경 이벤트. 
     * @event olleh.maps.vector.Rectangle#event:bounds_changed
     * @param {olleh.maps.event.Event} event
     */
    this.fireEvent('bounds_changed');
  },

  /**
   * 지정된 bounds 를 반환한다.
   * @returns {olleh.maps.Bounds}
   */
  getBounds: function () {
    return this._opts.bounds;
  },

  _getDefaultOptions: function () {
    return {
      fillColor: 'transparent',
      fillOpacity: 1.0,
      strokeColor: 'black',
      strokeOpacity: 1.0,
      strokePosition: 'center', // center, insdie, outside
      strokeWeight: 5,
      visible: true
    };
  },
  
  getCenter: function() {
    var bounds = this.getBounds();
    var center = bounds.getCenter();
    return center.transform(bounds.getType());
  }
  
});
/**
 * {@link olleh.maps.vector.Circle} 옵션
 * @typedef olleh.maps.vector.CircleOptions
 * @property {olleh.maps.Coord} center Circle 중심점
 * @property {Number} radius Circle 반지름
 * @property {String} [fillColor='transpraent'] Circle 내부를 채울 색상. CSS 색상값을 사용할 수 있다.
 *        'transparent' 로 지정하면 색상을 채우지 않는다.
 * @property {Number} [fillOpacity=1.0] Circle 내부 색상 투명도. 0.0 과 1.0 사이의 숫자를 사용할
 *        수 있다.
 * @property {String} [strokeColor='black'] 외곽선 색상. CSS 색상값을 사용할 수 있다.
 * @property {Number} [strokeOpacity=1.0] 외곽선 투명도. 0.0 과 1.0 사이의 숫자를 사용할 수 있다.
 * @property {Number} [strokeWeight=5] 픽셀 단위 외곽선 두께.
 * @property {String} [strokePosition=center] 외곽선의 위치. center, inside, outside 중
 *        하나의 값을 선택할 수 있다.
 * @property {String} [strokeStyle] 점선 패턴을 지정한다.
 * 'solid', 'shortdashdotdot','shortdash','shortdot','shortdashdot','dot','dash',
 * 'longdash','dashdot','longdashdot','longdashdotdot' 값중 하나의 값을 지정한다.
 * @property {String} [strokeLinecap='round'] 선의 끝점 형태를 지정한다. 'butt', 'round', 'square' 중 하나의 값을 지정한다.
 * @property {String} [strokeLinejoin='round'] 선들 간의 연결 형태를 지정한다. 'miter', 'round', 'bevel' 중 하나의 값을 지정한다.
 * @property {Boolean} [visible=true] 화면에 보여줄지 여부.
 * @extends olleh.maps.vector.VectorOptions
 */

/**
 * 원을 나타내는 vector class. 중심점(center) 와 반지름(radius)으로 정의된다.
 * 
 * <p/>
 * <h5>대표적인 이벤트</h5>
 * <ul>
 * <li>{@link olleh.maps.vector.Vector#event:visible_changed|visible_changed}</li>
 * <li>{@link olleh.maps.vector.Circle#event:center_changed|center_changed}</li>
 * <li>{@link olleh.maps.vector.Circle#event:radius_changed|radius_changed}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:click|click}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:rightclick|rightclick}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:dblclick|dblclick}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:drag|drag}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:dragend|dragend}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:dragstart|dragstart}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:mousedown|mousedown}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:mouseover|mouseover}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:mouseout|mouseout}</li>
 * <li>{@link olleh.maps.event.EventDelegator#event:mouseup|mouseup}</li>
 * </ul>
 * <p/>  
 */
$class('olleh.maps.vector.Circle').extend(olleh.maps.vector.Vector).define({
  rendererName: 'CircleRenderer',

  /**
   * 생성자, 명시된 opts를 사용해서 새로운 객체를 생성한다.
   * @param {olleh.maps.vector.CircleOptions} opts Circle 옵션
   * 
   */
  Circle: function (opts) {
  },
  
  /**
   * 옵션을 변경한다.
   * @method olleh.maps.vector.Circle#setOptions
   * @param {olleh.maps.vector.CircleOptions} options Circle 옵션
   */

  /**
   * 지정된 중심점을 반환한다.
   * @returns {olleh.maps.Coord}
   */
  getCenter: function () {
    return this._opts.center;
  },

  /**
   * 지정된 반지름을 반환한다.
   * @returns {Number}
   */
  getRadius: function () {
    return this._opts.radius;
  },

  _doDraw: function () {
    var centerPx = this.layer.layerMgr.getLayerPxFromCoord(this._opts.center);
    var resolution = this.layer.layerMgr.getResolution();
    var radiusPx = this._opts.radius / resolution;
    this._renderer.draw(centerPx, radiusPx);
  },

  /**
   * 원의 중심점과 반지름을 변경한다.
   * @param {olleh.maps.Coord} center
   * @param {Number} radius
   */
  setCenterAndRadius: function (center, radius) {
    this._opts.center = center;
    this._opts.radius = radius;
    this.draw();
    this.fireEvent('center_changed');
    this.fireEvent('radius_changed');
  },
  
  /**
   * 원의 중심점을 변경한다.
   * @param {olleh.maps.Coord} center
   */
  setCenter: function(center) {
    this._opts.center = center;
    this.draw();
    /**
     * center 변경 이벤트. 
     * @event olleh.maps.vector.Circle#event:center_changed
     * @param {olleh.maps.event.Event} event
     */
    this.fireEvent('center_changed');
  },
  
  /**
   * 원의 반지름을 변경한다.
   * @param {Number} radius
   */
  setRadius: function(radius) {
    this._opts.radius = radius;
    this.draw();
    /**
     * radius 변경 이벤트. 
     * @event olleh.maps.vector.Circle#event:radius_changed
     * @param {olleh.maps.event.Event} event
     */
    this.fireEvent('radius_changed');
  },

  _getDefaultOptions: function () {
    return {
      fillColor: 'transparent',
      fillOpacity: 1.0,
      strokeColor: 'black',
      strokeOpacity: 1.0,
      strokePosition: 'center', // center, insdie, outside
      strokeWeight: 5,
      visible: true
    };
  },
  
  getBounds: function() {
    var r = this.getRadius();
    var center = this.getCenter();
    var center_ =  center.asDefault();
    var leftBottom = center_.clone();
    leftBottom.x -= r;
    leftBottom.y -= r;
    var rightTop = center_.clone();
    rightTop.x += r;
    rightTop.y += r;
    var bounds = new olleh.maps.Bounds(leftBottom, rightTop);
    return bounds.transform(center.getClass());
  }
  
});
/**
 * vector({@link olleh.maps.vector.Vector})를 랜더링하기 위한 기본 인터페이스를 제공한다.
 * @private
 */
$class('olleh.maps.vector.BaseRenderer').define({

  /**
   * 최상위 DOM을 가지는 {@link olleh.maps.Element}를 반환한다.
   * @returns {olleh.maps.Element}
   */
  getRootElement: function () { return null; },
  
  /**
   * hit test 위한 DOM Element를 반환한다.
   * @returns {HTMLElement}
   */
  getEventDom: function () { return null; },

  /**
   * 옵션을 설정한다.
   * @param {Object} opts 옵션값
   */
  setOptions: function (opts) {},

  /**
   * Vector가 그려졌는지 여부를 반환한다.
   * @returns {Boolean}
   */
  isDrawn: function () {},
  
  /**
   * Vector를 그리기 전에 준비해야할 작업을 수행한다.
   */
  prepareToDraw: function () {}
});/**
 * vector {@link olleh.maps.vector.Vector}를 그리기 위해서 container element 가 필요한 경우
 * 사용된다. 예를 들어 svg 벡터 요소 (path, circle 등) 는 svg element 하위에 존재해야 한다. 
 * @private
 */
$class('olleh.maps.vector.ContainerRenderer').define({
  
  /**
   * ContainerRenderer 생성자
   * @param {Object} opts 옵션
   * @param {VectorLayer} opts.layer VectorLayer 개체
   * @returns {olleh.maps.vector.ContainerRenderer}
   */
  ContainerRenderer: function(opts) {
    /**
     * Layer 객체. ContainerRenderer 가 생성될때 값이 지정된다.
     */
    opts && (this.layer = opts.layer);
  },
  
  /**
   * Container element 를 생성한다.
   * <p/>
   * 상속받는 클래스에서는 해당 API를 override 해야한다.
   * @returns {HTMLElement}
   */
  createContainer: function () {},
  
  /**
   * Container element 의 위치와 크기를 설정한다. VectorLayer 가 draw 될때와 layer offset 이 변경될 때 호출된다. 
   */
  setBounds: function() {}
  
});/**
 * {@link olleh.maps.vector.PathRenderer} 옵션
 * @private
 * @typedef olleh.maps.vector.PathRendererOptions
 * @property {String} [fillColor='transpraent'] Polygon 내부를 채울 색상, CSS 색상값을 사용할 수 있다.
 *        'transparent' 로 지정하면 색상을 채우지 않는다.
 * @property {Number} [fillOpacity=1.0] Polygon 내부 투명도, 0.0 과 1.0 사이의 숫자를 사용할 수
 *        있다.
 * @property {String} [strokeColor='black'] 외곽선 색상, CSS 색상값을 사용할 수 있다.
 * @property {Number} [strokeOpacity=1.0] 외곽선 투명도, 0.0 과 1.0 사이의 숫자를 사용할 수 있다.
 * @property {Number} [strokeWeight=5] 픽셀 단위 외곽선 두께.
 * @property {String} [strokeLinecap='round'] 선의 끝점 형태를 지정한다. 'butt', 'round', 'square' 중 하나의 값을 지정한다.
 * @property {String} [strokeLinejoin='round'] 선들 간의 연결 형태를 지정한다. 'miter', 'round', 'bevel' 중 하나의 값을 지정한다.
 * @property {String} [strokeStyle] 선이 그려지는 패턴을 정의한다.
 * 'solid', 'shortdashdotdot','shortdash','shortdot','shortdashdot','dot','dash',
 * 'longdash','dashdot','longdashdot','longdashdotdot' 값중 하나의 값을 지정한다.
 */

/**
 * VML shape 또는 SVG path 를 사용하여 다양한 형태의 vector 를 그릴 수 있는 renderer
 * @private  
 */
$class('olleh.maps.vector.PathRenderer').define({
  /**
   * 생성자
   * @param {olleh.maps.vector.PathRendererOptions} opts
   */
  PathRenderer: function (opts) {
    this.opts = opts;
  },
  
  /**
   * {@link #lineTo} 로 그려질 직선의 시작점을 지정한다.
   * @param {Number} x 시작점 x 좌표
   * @param {Number} y 시작점 y 좌표
   */
  moveTo: function(x, y) {
    
  },
  
  /**
   * 지정된 좌표까지 직선을 그린다.
   * @param {Number} x x 좌표
   * @param {Number} y y 좌표
   */
  lineTo: function(px) {
    
  },
  
  /**
   * 원을 그린다.
   * @param {Number} cx 원의 중심 x좌표
   * @param {Number} cy 원의 중심 y좌표
   * @param {Number} r 원의 반지름
   */
  circle: function(cx, cy, r) {
    
  },
  
  /**
   * 주어진 지점을 연결하는 polyline 을 그린다.
   * @param {array.<olleh.maps.Point>} points
   */
  path: function(points) {
    
  },
  
  /**
   * {@link #path} 를 사용하여 그린 polyline 의 내부를 색상을 채운다.
   */
  closePath: function() {
    
  },
  
  /**
   * 그려진 내용을 svg element (또는 vml element) 에 반영한다.
   */
  commit: function() {
    
  }

});
/**
 * vector {@link olleh.maps.vector.Polyline}를 그리기 위한 {@link #draw} API를 제공한다.
 * @private
 */
$class('olleh.maps.vector.PolylineRenderer').define({
  
  /**
   * vector {@link olleh.maps.vector.Polyline}를 그리기 위한 랜더러를 생성한다.
   * <p/>
   * 직접 생성하지 않는다. {@link olleh.maps.vector.RendererFactory}를 
   * 현재 브라우저 최적화된 SVG, Canvas, VML Renderer를 생성한다.
   * @param {olleh.maps.vector.PolylineOptions} opts
   */
  PolylineRenderer: function (opts) {
    this.opts = opts;
  },
  
  /**
   * 좌표값을 가지는 배열을 통해 polyline을 그려준다.
   * <p/>
   * 상속받는 클래스에서는 해당 API를 override 해야한다.
   * @param {Array.<olleh.maps.Point>} points 좌표값을 가지는 배열
   */
  draw: function (points) {
  }
});/**
 * vector {@link olleh.maps.vector.Rectangle}를 그리기 위한 {@link #draw} API를 제공한다.
 * @private
 */
$class('olleh.maps.vector.RectangleRenderer').define({
  /**
   * vector {@link olleh.maps.vector.Rectangle}를 그리기 위한 랜더러를 생성한다.
   * <p/>
   * 직접 생성하지 않는다. {@link olleh.maps.vector.RendererFactory}를 
   * 현재 브라우저 최적화된 SVG, Canvas, VML Renderer를 생성한다.
   * @param {olleh.maps.vector.RectangleOptions} opts
   */
  RectangleRenderer: function (opts) {
    this.opts = opts;
  },
  
  /**
   * 좌상단 좌표와 크기를 이용해 사각형을 그려준다.
   * <p/>
   * 상속받는 클래스에서는 해당 API를 override 해야한다.
   * @param {olleh.maps.Point} leftTop 좌상단 좌표
   * @param {Number} width 너비
   * @param {Number} height 높이
   */
  draw: function (leftTop, width, height) {
  }
});/**
 * vector {@link olleh.maps.vector.Circle}를 그리기 위한 {@link #draw} API를 제공한다.
 * @private
 */
$class('olleh.maps.vector.CircleRenderer').define({
  
  /**
   * vector {@link olleh.maps.vector.Circle}를 그리기 위한 랜더러를 생성한다.
   * <p/>
   * 직접 생성하지 않는다. {@link olleh.maps.vector.RendererFactory}를 
   * 현재 브라우저 최적화된 SVG, Canvas, VML Renderer를 생성한다.
   * @param {olleh.maps.vector.CircleOptions} opts
   */
  CircleRenderer: function (opts) {
    this.opts = opts;
  },
  
  /**
   * 중심좌표와 반지름을 가지고 원을 그려준다. 
   * <p/>
   * 상속받는 클래스에서는 해당 API를 override 해야한다.
   * @param {olleh.maps.Point} center 중심좌표
   * @param {Number} radius 반지름
   */
  draw: function (center, radius) {}
});/**
 * vector {@link olleh.maps.vector.Polygon}를 그리기 위한 {@link #draw} API를 제공한다.
 * @private
 */
$class('olleh.maps.vector.PolygonRenderer').define({
  
  /**
   * vector {@link olleh.maps.vector.Polygon}를 그리기 위한 랜더러를 생성한다.
   * @param {olleh.maps.vector.PolygonOptions} opts
   */
  PolygonRenderer: function (opts) {
    this.opts = opts;
  },
  
  /**
   * 좌표값을 가지는 배열을 통해 polygon을 그려준다.
   * @param {Array.<Array.<olleh.maps.Point>>} pointsArray Polygon 을 정의하는 좌표의 2차원 배열
   *        첫번째 좌표배열은 polygon 의 외곽을 정의하며 나머지 배열은 polygon 의 hole 들을 정의한다. 
   */
  draw: function (pointsArray) {
    
  }

});/**
 * SVG vector({@link olleh.maps.vector.Vector})를 랜더링을 수행한다.
 * @private
 */
olleh.maps.browser.hasSVG &&
$class('olleh.maps.vector.svg.Renderer').extend(olleh.maps.vector.BaseRenderer).define({
  
  $static: { 
    /**
     * 태그명에 해당하는 SVG Element를 생성해서 반환한다.
     * @param {String} name 태그명
     * @returns {SVGElement}
     */
    createElement: function (name) {
      var elem = document.createElementNS('http://www.w3.org/2000/svg', name);
      olleh.maps.util.dom.setStyle(elem, 'userSelect', 'none');
      elem.setAttribute('fill', 'none');
      if (olleh.maps.browser.browserName === olleh.maps.browser.BROWSER_NAME.ie) {
        // ie9인 경우 class를 추가할 수 없음.
        olleh.maps.util.dom.setStyle(elem, 'pointer-events', 'visiblePainted');
      }
      return elem;
    }
  },
  
  /**
   * 기본 태그명
   * @type String
   */
  tag: 'path',
  
  /**
   * hit test 위한 DOM Element를 반환한다.
   * @returns {SVGElement}
   * @see olleh.maps.vector.BaseRenderer#getEventDom
   */
  getEventDom: function () {
    return this.elem;
  },
  
  /**
   * Vector를 그리기 전에 준비해야할 작업을 수행한다.
   * @see olleh.maps.vector.BaseRenderer#prepareToDraw
   */
  prepareToDraw: function () {
    this.getRootElement();
    this._drawn = true;
    this.setOptions();
  },
  
  /**
   * Vector가 그려졌는지 여부를 반환한다.
   * @returns {Boolean}
   * @see olleh.maps.vector.BaseRenderer#isDrawn
   */
  isDrawn: function () {
    return !!this._drawn;
  },
  
  /**
   * 최상위 DOM을 가지는 {@link olleh.maps.Element}를 반환한다.
   * @returns {olleh.maps.Element}
   * @see olleh.maps.vector.BaseRenderer#getRootElement
   */
  getRootElement: function () {
    if (!this.rootElem) {
      var rootElem = olleh.maps.vector.svg.Renderer.createElement(this.tag);
      this.rootElem = new olleh.maps.Element(rootElem); 
      this.elem = rootElem;
    }
    return this.rootElem;
  },
  
  /**
   * 옵션을 설정한다.
   * @param {Object} opts 옵션값
   * @see olleh.maps.vector.BaseRenderer#setOptions
   */
  setOptions: function (opts) {
    this.opts = olleh.maps.mixin(this.opts, opts, true);
    
    if (!this.isDrawn())return;
    
    var opts = this.opts;
    var weight = opts.strokeWeight;
    var elem = this.elem;
    
    opts.strokeColor ? elem.setAttribute('stroke', opts.strokeColor) : 
      elem.removeAttribute('stroke');
    opts.strokeOpacity ? elem.setAttribute('stroke-opacity', opts.strokeOpacity) : 
      elem.removeAttribute('stroke-opacity');
    opts.fillColor ? elem.setAttribute('fill', opts.fillColor) : 
      elem.setAttribute('fill', 'none');
    opts.fillOpacity ? elem.setAttribute('fill-opacity', opts.fillOpacity) : 
      elem.removeAttribute('fill-opacity');

    elem.setAttribute('stroke-linecap',opts.strokeLinecap || 'round');  // butt | round | square
    elem.setAttribute('stroke-linejoin',opts.strokeLinejoin || 'round'); // miter | round | bevel
    
    opts.fillRule? elem.setAttribute('fill-rule',opts.fillRule) :
      elem.removeAttribute('fill-rule') ;

    if(opts.strokeStyle) {
      var strokeDasharray;
      if(olleh.maps.isArray(opts.strokeStyle))
        strokeDasharray = opts.strokeStyle.join(' ');
      else
        strokeDasharray = this._strokeDashArray(opts.strokeStyle, weight);
      elem.setAttribute('stroke-dasharray', strokeDasharray);
    } else {
      elem.removeAttribute('stroke-dasharray');
    }
    elem.setAttribute('stroke-width', weight || 0);
  },
  
  // VML 형식의 strokeStyle 을 SVG 형식으로 변환  
  _strokeDashArray: function(strokeStyle, weight) {
    if(!weight)
      weight = 1;
    strokeStyle = strokeStyle.toLowerCase();
    if(strokeStyle == 'solid') {
      return '0';
    } else if(strokeStyle == 'dot') {
      return weight+ ',' +weight*3;
    } else if(strokeStyle == 'dash') {
      return weight*4+','+weight*3;
    } else if(strokeStyle == 'shortdot') {
      return weight+','+weight;
    } else if(strokeStyle == 'shortdash') {
      return weight*3+','+weight;
    } else if(strokeStyle == 'longdash') {
      return weight*8+','+weight*3;
    } else if(strokeStyle == 'dashdot') {
      return weight*4+','+weight*3+','+weight+','+weight*3;
    } else if(strokeStyle == 'shortdashdot') {
      return weight*3+','+weight+','+weight+','+weight;
    } else if(strokeStyle == 'longdashdot') {
      return weight*8+','+weight*3+','+weight+','+weight*3;
    } else if(strokeStyle == 'shortdashdotdot') {
      return weight*3+','+weight+','+weight+','+weight+','+weight+','+weight;
    } else if(strokeStyle == 'longdashdotdot') {
      return weight*8+','+weight*3+','+weight+','+weight*3+','+weight+','+weight*3;
    }
    return strokeStyle;
  }
  
});/**
 * SVG 를 사용하여 구현된 {@link olleh.maps.vector.PathRenderer} 의 구현체 
 * @private
 */
olleh.maps.vector.svg &&
$class('olleh.maps.vector.svg.PathRenderer').extend(olleh.maps.vector.PathRenderer).mixin(olleh.maps.vector.svg.Renderer).define({
  
  moveTo: function(x, y) {
    this._initCommand();
    this._command += 'M ' + x + ' ' + y;
  },
  
  lineTo: function(x, y) {
    this._initCommand();
    this._command += 'L ' + x + ' ' + y;
  },
  
  circle: function(cx, cy, r) {
    this._initCommand();
    this._command +='M '+cx+' '+cy+' '
                  + 'm -'+r+',0 '
                  + 'a ' +r+','+r+' 0 1,0 ' + r*2 +',0 '
                  + 'a ' +r+','+r+' 0 1,0 -'+ r*2 +',0';
  },
  
  path: function(points) {
    this._initCommand();
    for(var i=0;i<points.length;i++) {
      var p = points[i];
      if(i==0) {
        this.moveTo(p.x, p.y);
      } else {
        this.lineTo(p.x, p.y);
      }
    }
  },
  
  closePath: function() {
    this._initCommand();
    this._command += 'Z';
  },
  
  _initCommand: function() {
    if(!this._command)
      this._command = '';
    else
      this._command += ' ';
  },
  
  commit: function() {
    this.elem.setAttribute('d',this._command);
    this._command = null;
  }

});/**
 * SVG container 를 생성한다.
 * @private
 */
olleh.maps.vector.svg &&
$class('olleh.maps.vector.svg.ContainerRenderer').extend(olleh.maps.vector.ContainerRenderer).define({

  buffer: 1,
  
  /**
   * SVG 를 생성한다. 이미 생성된 경우 다시 생성하지 않고 그대로 반환한다.
   * @returns {SVGElement}
   */
  createContainer: function () {
    if (!this._svgElem) {
      var svg = document.createElementNS('http://www.w3.org/2000/svg', 'svg');
      this._svgElem = svg;
      svg.style.position = 'absolute';
      olleh.maps.util.dom.setStyle(svg, 'userSelect', 'none');
      if (olleh.maps.browser.browserName === olleh.maps.browser.BROWSER_NAME.ie) {
        // ie9인 경우 class를 추가할 수 없음.
        olleh.maps.util.dom.setStyle(svg, 'pointer-events', 'none');
      }
      olleh.maps.util.dom.addClass(svg, 'ollehmap-noevent');
    }
    return this._svgElem;
  },
  
  
  /**
   * SVG 위치, 크기를 설정한다.
   */ 
  setBounds: function() {
    var svg = this.createContainer();
    var layerMgr = this.layer.layerMgr;
    var viewportSize = layerMgr.getViewportSize();
    var layerOffset = layerMgr.getLayerOffset().multiplyBy(-1);
    // 현재 viewport 가 buffer 영역을 벗어나지 않으면 아무것도 할 필요없이 return 하면 된다.
    var bounds;
    if(this._bounds) {
      bounds = this._bounds;
      if(bounds.left <= layerOffset.x && layerOffset.x <= bounds.right &&
         bounds.top <= layerOffset.y && layerOffset.y <= bounds.bottom) {
        return;
      }
    }
    bounds = {
      left: layerOffset.x - viewportSize.width * this.buffer,
      right: layerOffset.x + viewportSize.width * this.buffer,
      top: layerOffset.y - viewportSize.height * this.buffer,
      bottom: layerOffset.y + viewportSize.height * this.buffer
    };
    this._bounds = bounds;
    svg.setAttribute('viewBox', bounds.left + ' ' + bounds.top + ' ' + viewportSize.width * (1 + 2 * this.buffer) + ' ' + viewportSize.height * (1 + 2 * this.buffer));
    var use3d = olleh.maps.browser.osName !== olleh.maps.browser.OS_NAME.ios; // iOS 에서 translate3d 를 사용하면 줌 애니메이션할 때 깜박거리는 문제 발생
    var styles = olleh.maps.util.dom.getPositionStyles(bounds.left, bounds.top, use3d); // buffer 크기를 고려해 왼쪽위로 위치
    styles.width = viewportSize.width * (1 + 2 * this.buffer) + 'px'; 
    styles.height = viewportSize.height * (1 + 2 * this.buffer) + 'px'; 
    olleh.maps.util.dom.setStyles(svg, styles);
  }

});
/**
 * vector({@link olleh.maps.vector.Polyline})를 랜더링을 수행한다.
 * @private
 */
olleh.maps.vector.svg && 
$class('olleh.maps.vector.svg.PolylineRenderer').extend(
    olleh.maps.vector.PolylineRenderer).mixin(olleh.maps.vector.svg.Renderer).define({
      
  /**
   * 기본 태그명
   * @type String
   */
  tag: 'polyline',
  
  /**
   * 좌표값을 가지는 배열을 통해 polyline을 그려준다.
   * @param {Array.<olleh.maps.Point>} points 좌표값을 가지는 배열
   * @see olleh.maps.vector.PolylineRenderer#draw
   */
  draw: function (points) {
    if (!points || !points.length) return;
    
    this.prepareToDraw();
    
    var len = points.length;
    var polyline = this.elem;
    var value = [];
    var i, preX = 0, preY = 0, curX, curY;
    
    for(i = 0; i < len; i++) {
      
      curX = points[i].x;
      curY = points[i].y;

      if (curX != preX || curY != preY) {
        value.push(curX + ',' + curY);
      }
      preX = curX;
      preY = curY;
    }
    if (value.length == 1) {
      value.push(curX + ',' + curY);
    }
    polyline.setAttribute('points', value.join(' '));
  }
});/**
 * vector({@link olleh.maps.vector.Polygon})를 랜더링을 수행한다.
 * @private
 */
olleh.maps.vector.svg &&
$class('olleh.maps.vector.svg.PolygonRenderer').extend(olleh.maps.vector.PolygonRenderer)
  .mixin(olleh.maps.vector.svg.PathRenderer).define({
    
    draw: function(pointsArray) {
      if(!olleh.maps.isArray(pointsArray))
        throw TypeError('Type of pointsArray must be array.');
      this.prepareToDraw();
      if(pointsArray[0] instanceof olleh.maps.Point)
        pointsArray = [pointsArray];
      for(var i=0; i<pointsArray.length;i++ ) {
        var points = pointsArray[i];
        this.path(points);
        this.closePath();
      }
      this.commit();
    }
    
  
});/**
 * vector({@link olleh.maps.vector.Circle})를 랜더링을 수행한다.
 * @private
 */
olleh.maps.vector.svg && 
$class('olleh.maps.vector.svg.CircleRenderer').extend(
    olleh.maps.vector.CircleRenderer).mixin(olleh.maps.vector.svg.Renderer).define({
      
  /**
   * 기본 태그명
   * @type String
   */
  tag: 'circle',
  
  /**
   * 중심좌표와 반지름을 가지고 원을 그려준다. 
   * @param {olleh.maps.Point} center 중심좌표
   * @param {Number} radius 반지름
   * @see olleh.maps.vector.CircleRenderer#draw
   */
  draw: function (center, radius) {
    if (!(center instanceof olleh.maps.Point)) return;
    if (!(olleh.maps.isNumber(radius))) return;
    
    this.prepareToDraw();
    var elem = this.elem;
    
    elem.setAttribute('cx', center.x); 
    elem.setAttribute('cy', center.y); 
    elem.setAttribute('r', radius);
  }
});/**
 * vector({@link olleh.maps.vector.Rectangle})를 랜더링을 수행한다.
 * @private
 */
olleh.maps.vector.svg && 
$class('olleh.maps.vector.svg.RectangleRenderer').extend(
    olleh.maps.vector.RectangleRenderer).mixin(olleh.maps.vector.svg.Renderer).define({
      
  /**
   * 기본 태그명
   * @type String
   */
  tag: 'rect',
  
  /**
   * 좌상단 좌표와 크기를 이용해 사각형을 그려준다.
   * @param {olleh.maps.Point} leftTop 좌상단 좌표
   * @param {Number} width 너비
   * @param {Number} height 높이
   * @see olleh.maps.vector.RectangleRenderer#draw
   */
  draw: function (leftTop, width, height) {
    if (!(leftTop instanceof olleh.maps.Point)) return;
    if (!(olleh.maps.isNumber(width))) return;
    if (!(olleh.maps.isNumber(height))) return;
    
    this.prepareToDraw();
    
    var rootElem = this.rootElem.elem;
    
    rootElem.setAttribute('x', leftTop.x);
    rootElem.setAttribute('y', leftTop.y);
    
    if (olleh.maps.isNumber(width)) {
      rootElem.setAttribute('width', width);
    }
    if (olleh.maps.isNumber(height)) {
      rootElem.setAttribute('height', height);
    }
  }
});if (olleh.maps.browser.hasVML) {

  document.namespaces.add('ollehmap-vml', 'urn:schemas-microsoft-com:vml');
  

  /**
   * VML vector({@link olleh.maps.vector.Vector})를 랜더링을 수행한다.
   * @private
   */
  $class('olleh.maps.vector.vml.Renderer').extend(olleh.maps.vector.BaseRenderer).define({
    
    $static: {
      /**
       * 태그명에 해당하는 VML Element를 생성해서 반환한다.
       * @param {String} name 태그명
       * @returns {VMLElement}
       */
      createElement: function (name) {
        var elem = document.createElement('<ollehmap-vml:' + name + '>');
        elem.className = 'ollehmap-vml';
        elem.unselectable = 'on';
        return elem;
      }
    },
    
    /**
     * 기본 태그명
     * @type String
     */
    tag: 'shape',
    
    /**
     * hit test 위한 DOM Element를 반환한다.
     * @returns {HTMLElement}
     * @see olleh.maps.vector.BaseRenderer#getEventDom
     */
    getEventDom: function () {
      return this.rootElem.elem;
    },
    
    /**
     * Vector를 그리기 전에 준비해야할 작업을 수행한다.
     * @see olleh.maps.vector.BaseRenderer#prepareToDraw
     */
    prepareToDraw: function () {
      this.getRootElement();
      this._drawn = true;
      this.setOptions();
    },
    
    /**
     * Vector가 그려졌는지 여부를 반환한다.
     * @returns {Boolean}
     * @see olleh.maps.vector.BaseRenderer#isDrawn
     */
    isDrawn: function () {
      return !!this._drawn;
    },
    
    /**
     * 최상위 DOM을 가지는 {@link olleh.maps.Element}를 반환한다.
     * @returns {olleh.maps.Element}
     * @see olleh.maps.vector.BaseRenderer#getRootElement
     */
    getRootElement: function () {
      if (!this.rootElem) {
        var rootElem = olleh.maps.vector.vml.Renderer.createElement(this.tag);
        this.rootElem = new olleh.maps.Element(rootElem);
        this._containerElem = this.rootElem.elem; 
      }
      return this.rootElem;
    },
    
    /**
     * 옵션을 설정한다.
     * @param {Object} opts 옵션값
     * @see olleh.maps.vector.BaseRenderer#setOptions
     */
    setOptions: function (opts) {
      this.opts = olleh.maps.mixin(this.opts, opts, true);
      
      if (!this.isDrawn())return;
      
      var opts = this.opts;
      var container = this._containerElem;
      var clazz = olleh.maps.vector.vml.Renderer;
      container.stroked = !!(opts.strokeWeight || olleh.maps.isUndefined(opts.strokeWeight));
      
      if (opts.strokeLinecap === 'butt') {
        opts.strokeLinecap = 'flat';
      }
      if (container.stroked) {
        !this._stroke && (this._stroke = clazz.createElement('stroke'));
        this._stroke.color = opts.strokeColor;
        this._stroke.weight = opts.strokeWeight;
        this._stroke.opacity = opts.strokeOpacity || 1;
        this._stroke.endcap = opts.strokeLinecap || 'round'; // butt | round | square
        this._stroke.joinstyle = opts.strokeLinejoin || 'round'; // miter | round | bevel
        
        // http://msdn.microsoft.com/en-us/library/bb264085(v=vs.85).aspx
        if (opts.strokeStyle) { 
          this._stroke.dashStyle = olleh.maps.isArray(opts.strokeStyle) ?
              opts.strokeStyle.join(' ') :
                (opts.strokeStyle + "").replace(/ *, */g, ' ');
        } else {
          this._stroke.dashStyle = '';
        }
        
        container.appendChild(this._stroke);
      } else {
        if (this._stroke) {
          container.removeChild(this._stroke);
          delete this._stroke;
        } 
      }
      
      container.filled = !(opts.fillColor === 'none' || opts.fillColor === 'transparent' || olleh.maps.isUndefined(opts.fillColor));
      if (container.filled) {
        !this._fill && (this._fill = clazz.createElement('fill'));
        this._fill.color = opts.fillColor;
        this._fill.opacity = opts.fillOpacity || 1;
        container.appendChild(this._fill);
      } else {
        if (this._fill) {
          container.removeChild(this._fill);
          delete this._fill;
        }
      }
      
      
    },
    
    /**
     * VML의 위치를 변경한다.
     * @param {olleh.maps.Point} leftTop
     * @private
     */
    _updatePosition: function (leftTop) {
      if (!leftTop) return;
      
      if (this.isDrawn()) {
        this.rootElem.setStyle('left', leftTop.x + 'px');
        this.rootElem.setStyle('top', leftTop.y + 'px');
      }
    },
    
    /**
     * VML의 크기를 변경한다.
     * @param {Number} width
     * @param {Number} height
     * @private
     */
    _updateSize: function (width, height) {
      this._width = width;
      this._height = height;
      
      if (this.isDrawn()) {
        var rootElem = this.rootElem;
        rootElem.setStyle('width', width +'px');
        rootElem.setStyle('height', height + 'px');
        if(this.tag == 'shape') {
          rootElem.elem.coordsize = width + ' ' + height;
        }
      }
    }
  });
}  /**
 * VML 을 사용하여 구현된 {@link olleh.maps.vector.PathRenderer} 의 구현체 
 * @private
 */
olleh.maps.vector.vml &&
$class('olleh.maps.vector.vml.PathRenderer').extend(olleh.maps.vector.PathRenderer).mixin(olleh.maps.vector.vml.Renderer).define({
  
  PathRenderer: function() {
    this._translateX = 0;
    this._translateY = 0;
  },

  prepareToDraw: function () {
    this._command = [];
    olleh.maps.vector.vml.Renderer.prototype.prepareToDraw.call(this);
  },
  
  moveTo: function(x, y) {
    this._command.push(['M', x, y]);
    if(!this._bounds) {
      this._bounds = {left:x, top:y, right:x, bottom:y};
    } else {
      this._union(x, y);
    }
  },
  
  lineTo: function(x, y) {
    this._command.push(['L', x, y]);
    if(!this._bounds) {
      this._bounds = {left: x, top:y, right:x, bottom:y};
    } else {
      this._union(x, y);
    }
  },
  
  circle: function(cx, cy, r) {
    var left = cx-r;
    var top = cy-r;
    var right = cx+r;
    var bottom = cy+r;
    this._command.push(['AT',cx,cy,r]);
    if(!this._bounds) {
      this._bounds = {left: left, top:top, right:right, bottom:bottom};
    } else {
      this._union(left, top);
      this._union(right, bottom);
    }
  },
  
  /**
   * @param {array.<olleh.maps.Point>} points
   */
  path: function(points) {
    for(var i=0;i<points.length;i++) {
      var p = points[i];
      if(i==0) {
        this.moveTo(p.x, p.y);
      } else {
        this.lineTo(p.x, p.y);
      }
    }
  },
  
  closePath: function() {
    this._command.push(['X']);
  },
  
  commit: function() {
    var bounds = this._bounds;
    var str='';
    for(var i=0; i<this._command.length;i++) {
      var command = this._command[i];
      if(str.length > 0) str += ' ';
      str += this._toCommandStr(command, -bounds.left, -bounds.top);
    }
    this.rootElem.elem.path = str;
    this._updatePosition({x: bounds.left, y: bounds.top});
    this._updateSize(bounds.right-bounds.left, bounds.bottom-bounds.top);
  },
  
  _toCommandStr: function(command, dx, dy) {
    if(command[0] == 'M' || command[0] == 'L') {
      return command[0] + ' '+ (command[1]+dx) + ' ' + (command[2]+dy);  
    }
    if(command[0] == 'AT') {
      var cx = command[1] + dx;
      var cy = command[2] + dy;
      var r = command[3];
      var left = cx-r;
      var top = cy-r;
      var right = cx+r;
      var bottom = cy+r;
      var startX = cx;
      var startY = cy-r;
      return 'AT '+left+' '+top+' '+right+' '+bottom+' '+ startX+' '+startY+' '+startX+' '+startY + ' X E';
    }
    return command.join(' ');
  },
  
  
  _union: function(x, y) {
    var bounds = this._bounds;
    bounds.left = Math.min(bounds.left, x);
    bounds.top = Math.min(bounds.top, y);
    bounds.right = Math.max(bounds.right, x);
    bounds.bottom = Math.max(bounds.bottom, y);
  }

});/**
 * vector({@link olleh.maps.vector.Polyline})를 랜더링을 수행한다.
 * @private
 */
olleh.maps.vector.vml &&
$class('olleh.maps.vector.vml.PolylineRenderer').extend(
    olleh.maps.vector.PolylineRenderer).mixin(olleh.maps.vector.vml.Renderer).define({
      
  /**
   * 기본 태그명
   * @String
   */
  tag: 'polyline',
  
  /**
   * point 들의 bounds 를 구하고 bounds 에 대한 상대 좌표로 좌표를 변환한다.
   * @param {Array.<olleh.maps.Point>} points
   * @returns {Object} {points: Array.<olleh.maps.Point>, leftTop: new olleh.maps.Point(x1, y1), rightBottom: new olleh.maps.Point(x2, y2)}
   * @private
   */
  _getPoints: function (points) {
    if (!points || !points.length) return null;
    
    var x1 = x2 = points[0].x;
    var y1 = y2 = points[0].y;
    var len = points.length;
    var x, y, point, i, preX, preY, curX, curY;
    var value = [];
    
    for(i = 0; i < len; i++) {
      point = points[i];
      x = point.x;
      y = point.y;
      x1=Math.min(x1,x);
      y1=Math.min(y1,y);
      x2=Math.max(x2,x);
      y2=Math.max(y2,y);
    }
    for(i = 0; i < len; i++) {
      point = points[i];
      curX = point.x;
      curY = point.y;
      
      if (curX != preX || curY != preY) {
        value.push((curX - x1)+ ',' + (curY - y1));
      }
      preX = curX;
      preY = curY;
    }
    return {points: value, leftTop: new olleh.maps.Point(x1, y1), rightBottom: new olleh.maps.Point(x2, y2)};
  },
  
    
  /**
   * 좌표값을 가지는 배열을 통해 polyline을 그려준다.
   * @param {Array.<olleh.maps.Point>} points 좌표값을 가지는 배열
   * @see olleh.maps.vector.PolylineRenderer#draw
   */
  draw: function (points) {
    if (!points || !points.length) return;
    
    this.prepareToDraw();
    var data = this._getPoints(points);
    
    if (!data) return;
    
    var polyline = this.getRootElement().elem;
    var size = data.rightBottom.subtract(data.leftTop);
    var value = data.points.join(' ');
    
    if (!polyline.points) {
      polyline.points = value;
    } else {
      polyline.points.value = value;
    }
    
    this._updatePosition(data.leftTop);
    this._updateSize(size.x, size.y);
  }
  
});/**
 * vector({@link olleh.maps.vector.Polygon})를 랜더링을 수행한다.
 * @private
 */
olleh.maps.vector.vml && 
$class('olleh.maps.vector.vml.PolygonRenderer').extend(olleh.maps.vector.PolygonRenderer).
  mixin(olleh.maps.vector.vml.PathRenderer).define({

  /**
   * @param {array.<array.<olleh.maps.Point>>} pointsArray
   */  
  draw: function(pointsArray) {
    if(!olleh.maps.isArray(pointsArray))
      throw TypeError('Type of pointsArray must be array.');
    this.prepareToDraw();
    if(pointsArray[0] instanceof olleh.maps.Point)
      pointsArray = [pointsArray];
    for(var i=0; i<pointsArray.length;i++ ) {
      var points = pointsArray[i];
      this.path(points);
      this.closePath();
    }
    this.commit();
  }

});/**
 * vector({@link olleh.maps.vector.Circle})를 랜더링을 수행한다.
 * @private
 */
olleh.maps.vector.vml && 
$class('olleh.maps.vector.vml.CircleRenderer').extend(
    olleh.maps.vector.CircleRenderer).mixin(olleh.maps.vector.vml.Renderer).define({
      
  /**
   * 기본 태그명
   * @type String
   */
  tag: 'oval',
  
  /**
   * 중심좌표와 반지름을 가지고 원을 그려준다. 
   * @param {olleh.maps.Point} center 중심좌표
   * @param {Number} radius 반지름
   * @see olleh.maps.vector.CircleRenderer#draw
   */
  draw: function (center, radius) {
    if (!(center instanceof olleh.maps.Point)) return;
    if (!(olleh.maps.isNumber(radius))) return;
    
    this.prepareToDraw();
    var size = radius * 2;
    
    this._updatePosition(center.subtract(new olleh.maps.Point(radius, radius)));
    this._updateSize(size, size);
  }
});/**
 * vector({@link olleh.maps.vector.Rectangle})를 랜더링을 수행한다.
 * @private
 */
olleh.maps.vector.vml && 
$class('olleh.maps.vector.vml.RectangleRenderer').extend(
    olleh.maps.vector.RectangleRenderer).mixin(olleh.maps.vector.vml.Renderer).define({
      
  /**
   * 기본 태그명
   * @type String
   */
  tag: 'rect',
  
  /**
   * 좌상단 좌표와 크기를 이용해 사각형을 그려준다.
   * @param {olleh.maps.Point} leftTop 좌상단 좌표
   * @param {Number} width 너비
   * @param {Number} height 높이
   * @see olleh.maps.vector.RectangleRenderer#draw
   */
  draw: function (leftTop, width, height) {
    if (!(leftTop instanceof olleh.maps.Point)) return;
    if (!(olleh.maps.isNumber(width))) return;
    if (!(olleh.maps.isNumber(height))) return;
    
    this.prepareToDraw();
    this._updatePosition(leftTop);
    this._updateSize(width, height);
  }
});/**
 * Canvas 를 사용해 vector 를 렌더링하는 Renderer 들에 대한 base class
 * @private
 */
olleh.maps.browser.hasCanvas &&
$class('olleh.maps.vector.canvas.Renderer').extend(
    olleh.maps.vector.BaseRenderer).define({
  /**
   * 선두께에 따라 canvas 크기를 조정하기 위한 상수값 
   * @type Number
   */
  weightFactor: Math.sqrt(2),
  
  /**
   * hit test 위한 DOM Element를 반환한다. 
   * @returns {HTMLElement}
   * @see olleh.maps.vector.BaseRenderer#getEventDom
   */
  getEventDom: function () {
    return this.getRootElement().elem;
  },
  
  /**
   * Vector를 그리기 전에 준비해야할 작업을 수행한다.
   * @see olleh.maps.vector.BaseRenderer#prepareToDraw
   */
  prepareToDraw: function () {
    this.getRootElement();
  },
  
  /**
   * Vector가 그려졌는지 여부를 반환한다.
   * @returns {Boolean}
   * @see olleh.maps.vector.BaseRenderer#isDrawn
   */
  isDrawn: function () {
    return !!this.canvas;
  },
  
  /**
   * 최상위 DOM 에 대한 {@link olleh.maps.Element}를 반환한다.
   * @returns {olleh.maps.Element}
   * @see olleh.maps.vector.BaseRenderer#getRootElement
   */
  getRootElement: function () {
    if (!this.canvas) {
      var canvasElem = document.createElement('canvas');
      var setStyle = function(key, value) {
        switch (key) {
        case 'left':
        case 'top':
          value = parseFloat(value) - (this._padding || 0) + 'px';
          break;
        }
        olleh.maps.Element.prototype.setStyle.call(this, key, value);
      };
      this.canvas = olleh.maps.mixin(new olleh.maps.Element(canvasElem), {setStyle: setStyle}, true);
      this.canvas.setStyle('position', 'absolute');
      var ctx = canvasElem.getContext('2d');
      ctx.lineCap = 'round';
      ctx.lineJoin = 'round';
      this.ctx = ctx;
    }
    return this.canvas;
  },
  
  
  /**
   * Option 을 설정한다.
   * @param {Object} opts
   * @see olleh.maps.vector.BaseRenderer#setOptions
   */
  setOptions: function (opts) {
    this.opts = olleh.maps.mixin(this.opts, opts, true);
  },
  
  /**
   * 현재 설정된 option 에 따라 Canvas Context 의 속성을 업데이트 한다.
   * @private
   */
  _updateStyle: function () {
    var opts = this.opts;
    var ctx = this.ctx;
    ctx.save();
    
    if (opts.fillColor) {
      ctx.fillStyle = opts.fillColor;
      if (opts.fillOpacity < 1) {
        ctx.globalAlpha = opts.fillOpacity;
      }
      ctx.fill();
    }
    
    if (opts.strokeColor && opts.strokeWeight) {
      ctx.strokeStyle = opts.strokeColor;
      ctx.lineWidth = opts.strokeWeight;
      ctx.lineCap = opts.strokeLinecap || 'round';
      ctx.lineJoin = opts.strokeLinejoin || 'round';
      if (opts.strokeOpacity < 1) {
        ctx.globalAlpha = opts.strokeOpacity;
      }
      ctx.stroke();
    }
    
    ctx.restore();
  },
  
  /**
   * Canvas 의 위치와 크기를 변경한다.
   * @param {olleh.maps.Point} leftTop canvas 위치
   * @param {Number} width canvas width
   * @param {Number} height canvas height
   */
  _updateCanvas: function(leftTop, width, height) {
    if (this.canvas) {
      var canvasElem = this.canvas.elem;
      // update size
      var weight = this.opts.strokeWeight;
      var padding = weight ? this.weightFactor * weight : 0;
      this.canvas._padding = padding;
      var padding2 = 2 * padding;
      var rootWidth = width + padding2;
      var rootHeight = height + padding2;
      if (olleh.maps.isNumber(width)) {
        canvasElem.setAttribute('width', rootWidth + 'px');
      }
      if (olleh.maps.isNumber(height)) {
        canvasElem.setAttribute('height', rootHeight + 'px');
      }
      // update position
      this.canvas.setStyle('left', leftTop.x + 'px');
      this.canvas.setStyle('top', leftTop.y + 'px');
    }
  }
});/**
 * Polyline({@link olleh.maps.vector.Polyline}) 렌더링을 수행한다.
 * @private
 */
olleh.maps.vector.canvas && 
$class('olleh.maps.vector.canvas.PolylineRenderer').extend(
olleh.maps.vector.PolylineRenderer).mixin(olleh.maps.vector.canvas.Renderer).define({
  /**
   * path 의 시작과 끝을 연결해서 polygon 으로 만들지 여부를 결정한다.
   * @type Boolean
   */
  closePath: false,
  /**
   * 좌표값을 가지는 배열을 통해 polyline 또는 Polygon 을 그려준다.
   * @param {Array.<olleh.maps.Point>} points 좌표값을 가지는 배열
   * @see olleh.maps.vector.PolylineRenderer#draw
   */
  draw: function (points) {
    if (!points || !points.length)
      return;

    this.prepareToDraw();
    var ctx = this.ctx;
    var x1 = x2 = points[0].x;
    var y1 = y2 = points[0].y;
    for ( var i = 0, len = points.length; i < len; i++) {
      var p = points[i];
      x1 = Math.min(p.x, x1);
      y1 = Math.min(p.y, y1);
      x2 = Math.max(p.x, x2);
      y2 = Math.max(p.y, y2);
    }
    this._updateCanvas(new olleh.maps.Point(x1, y1), x2 - x1, y2 - y1);
    
    ctx.translate(this.canvas._padding, this.canvas._padding);
    ctx.beginPath();
    ctx.moveTo(points[0].x - x1, points[0].y - y1);
    for ( var i = 1, len = points.length; i < len; i++) {
      var p = points[i];
      ctx.lineTo(p.x - x1, p.y - y1);
    }
    if (this.closePath) {
      ctx.closePath();
    }
    this._updateStyle();
  }
});/**
 * Polygon({@link olleh.maps.vector.Polygon}) 렌더링을 수행한다.
 * @private
 */
olleh.maps.vector.canvas &&
$class('olleh.maps.vector.canvas.PolygonRenderer').extend(
    olleh.maps.vector.canvas.PolylineRenderer).define({
  /**
   * @type Boolean
   */
  closePath: true
});/**
 * Circle({@link olleh.maps.vector.Circle}) 렌더링을 수행한다.
 * @private
 */
olleh.maps.vector.canvas &&
$class('olleh.maps.vector.canvas.CircleRenderer').extend(
    olleh.maps.vector.CircleRenderer).mixin(olleh.maps.vector.canvas.Renderer).define({
  /**
   * @type Number
   */
  weightFactor: .5,
  
  /**
   * 중심좌표와 반지름을 가지고 원을 그려준다. 
   * @param {olleh.maps.Point} center 중심좌표
   * @param {Number} radius 반지름
   * @see olleh.maps.vector.CircleRenderer#draw
   */
  draw: function (center, radius) {
    this.prepareToDraw();
    var size = radius * 2;
    var leftTop = center.subtract(new olleh.maps.Point(radius,
        radius));
    this._updateCanvas(leftTop, size, size);
    
    var ctx = this.ctx;
    ctx.translate(this.canvas._padding, this.canvas._padding);
    ctx.beginPath();
    ctx.arc(radius, radius, radius, 0, Math.PI * 2, false);
    
    this._updateStyle();
  }
});/**
 * Rectangle({@link olleh.maps.vector.Rectangle }) 렌더링을 수행한다.
 * @private 
 */
olleh.maps.vector.canvas && 
$class('olleh.maps.vector.canvas.RectangleRenderer').extend(
    olleh.maps.vector.RectangleRenderer).mixin(olleh.maps.vector.canvas.Renderer).define({

  /**
   * @type Number
   */
  weightFactor: .5,
 /**
  * 좌상단 좌표와 크기를 이용해 사각형을 그려준다.
  * @param {olleh.maps.Point} leftTop 좌상단 좌표
  * @param {Number} width 너비
  * @param {Number} height 높이
  * @see olleh.maps.vector.RectangleRenderer#draw
  */
  draw: function (leftTop, width, height) {
    this.prepareToDraw();
    this._updateCanvas(leftTop, width, height);
    
    var ctx = this.ctx;
    ctx.translate(this.canvas._padding, this.canvas._padding);
    ctx.beginPath();
    ctx.rect(0, 0, width, height);
    
    this._updateStyle();
  }
});!function (ns) {
  /**
   * vector {@link olleh.maps.vector.Vector}를 그리기 위한 랜더러를 생성하는 API를 제공한다.
   * <p/>
   * 현재 브라우저 최적화된 SVG, Canvas, VML Renderer를 생성한다.
   * @private
   */
  ns && $class('olleh.maps.vector.RendererFactory').define({
    
    /**
     * PolylineRenderer를 생성해서 반환한다.
     * @param {olleh.maps.vector.PolylineRendererOptions} opts
     * @returns {olleh.maps.vector.PolylineRenderer}
     */
    createPolylineRenderer: function (opts) {
      var clazz = ns.PolylineRenderer;
      return clazz ? new clazz(opts) : null;
    },
    /**
     * PolygonRenderer를 생성해서 반환한다.
     * @param {olleh.maps.vector.PolygonRendererOptions} opts
     * @returns {olleh.maps.vector.PolygonRenderer}
     */
    createPolygonRenderer: function (opts) {
      var clazz = ns.PolygonRenderer;
      return clazz ? new clazz(opts) : null;
    },
    /**
     * RectangleRenderer를 생성해서 반환한다.
     * @param {olleh.maps.vector.RectangleRendererOptions} opts
     * @returns {olleh.maps.vector.RectangleRenderer}
     */
    createRectangleRenderer: function (opts) {
      var clazz = ns.RectangleRenderer;
      return clazz ? new clazz(opts) : null;
    },
    /**
     * CircleRenderer를 생성해서 반환한다.
     * @param {olleh.maps.vector.CircleRendererOptions} opts
     * @returns {olleh.maps.vector.CircleRenderer}
     */
    createCircleRenderer: function (opts) {
      var clazz = ns.CircleRenderer;
      return clazz ? new clazz(opts) : null;
    },
    /**
     * ContainerRenderer를 생성해서 반환한다.
     * @param {Object} opts
     * @returns {olleh.maps.vector.ContainerRenderer}
     */
    createContainerRenderer: function (opts) {
      if (!this._containerRenderer) {
        var clazz = ns.ContainerRenderer;
        this._containerRenderer = clazz ? new clazz(opts) : null;
      }
      return this._containerRenderer;
    },
    
    /**
     * SVG path 또는 vml shape 를 사용하여 다양한 도형을 그릴수 있는 PathRenderer 를 생성한다.
     */
    createPathRenderer: function(opts) {
      var clazz = ns.PathRenderer;
      return clazz ? new clazz(opts) : null;
    }
    
  });
} (olleh.maps.vector[olleh.maps.browser.vector.toLowerCase()]);/**
 * Vector 들을 관리하는 Layer 
 */
$class('olleh.maps.vector.VectorLayer').extend(olleh.maps.layer.Layer).define({

  name: 'Vector',

  label: olleh.maps.msg('벡터'),

  autoActivate: true,
  
  zIndex: 999,

  /**
   * VectorLayer 를 생성한다.
   */
  VectorLayer: function () {
    this._vectors = [];
    this._rendererFactory = new olleh.maps.vector.RendererFactory();
    this._containerRenderer = this._rendererFactory.createContainerRenderer({
      layer: this
    });
    this._zoomAnim = false; // zoom animation 사용 여부. transform 지원하는 브라우저는 zoom animation 사용한다.
  },

  start: function () {
    var style = olleh.maps.browser.style;
    if (style.transform) {
      this._zoomAnim = true;
    }
    olleh.maps.vector.VectorLayer.$super.start.call(this);
  },

  /**
   * VectorLayer 를 화면에서 숨기거나 보여준다.
   * @param {Boolean} visible false 이면 VectorLayer 를 화면에서 숨긴다. 
   */
  setVisible: function (visible) {
    if (this._isVisible != visible) {
      this._isVisible = visible;
      visible && this.draw();
      var pane = this.getPane();
      var visibility = visible ? 'visible' : 'hidden';
      pane.style.visibility = visibility;
    }
  },

  /**
   * 현재 VectorLayer 가 화면에 보여지고 있는지를 반환한다.
   * @returns {Boolean}
   */
  isVisible: function () {
    return this._isVisible;
  },

  /**
   * VectorLayer 내의 모든 Vector 를 그린다.
   */
  draw: function () {
    if (this._zoomAnim) {
      this._ensureStopAnimation();
    }
    this._containerRenderer && this._containerRenderer.setBounds();
    this.drawAll();
  },

  /**
   * 모든 Vector 의 draw() 를 호출한다.
   * @private
   */
  drawAll: function () {
    var i, len = this._vectors.length;
    for (i = 0; i < len; i++) {
      this._vectors[i].isVisible() && this._vectors[i].draw();
    }
  },

  /**
   * Zoom 애니메이션이 시작될 때 호출된다.
   * @param {Number} scale
   * @param {olleh.maps.Point} origin
   * @param {Number} duration
   * @param {olleh.maps.fx.Pulse} [pulse]
   * @private
   */
  zoomStart: function (scale, origin, duration, pulse) {
    if (this._vectors.length === 0)
      return;
    var pane = this.getPane();
    if (this._zoomAnim) {
      var from;
      
      if (this._isZooming) {
        from = this._animator.ignore();
      } else {
        olleh.maps.util.dom.setStyle(pane, 'transformOrigin', origin.x + 'px '
            + origin.y + 'px');
        from = {
          transform: olleh.maps.util.dom.getScaleString(1)
        };
      }
      
      this._animator = new olleh.maps.fx.Animation({
        from: from,
        to: {
          transform: olleh.maps.util.dom.getScaleString(scale)
        },
        defaultType: '=',
        duration: duration,
        pulse: pulse,
        timing: olleh.maps.fx.timing.easeOut
      }).animate(pane);
    } else {
      pane.style.visibility = 'hidden';
    }
    this._isZooming = true;
  },
  
  

  /**
   * Zoom 애니메이션이 완료된 직후 호출된다.
   * @private
   */
  zoomEnd: function () {
    if (this._isZooming) {
      if (this._zoomAnim) {
        this._ensureStopAnimation();
      } else {
        var pane = this.getPane();
        pane.style.visibility = 'visible';
      }
      this._isZooming = false;
    }
    // workaround for chrome bug: zoom in / out 할때 잔상? 이 남는 문제
    if (olleh.maps.browser.browserName === olleh.maps.browser.BROWSER_NAME.chrome) {
      this._eraseAll();
    }
    this.drawAll();
  },
  
  _eraseAll: function() {
    var i, len = this._vectors.length;
    for (i = 0; i < len; i++) {
      this._vectors[i].isVisible() && this._vectors[i].erase();
    }
  },
  
  _ensureStopAnimation: function() {
    var pane = this.getPane();
    var animator = this._animator;
    if (animator && this._animator.status === 'started') {
      this._animator.cancel();
    }
    pane && olleh.maps.util.dom.setStyle(pane, 'transform','');
  },

  /**
   * Pan 애니메이션이 완료된 직후 호출된다.
   * @private
   */
  moveEnd: function () {
    this._containerRenderer && this._containerRenderer.setBounds();
  },

  /**
   * VectorLayer 가 가지고 있는 Vector 배열을 반환한다.
   * @returns {Array} consists of olleh.maps.vector.Vector
   */
  getVectors: function () {
    return this._vectors;
  },

  /**
   * VectorLayer 에 대한 Pane 을 반환한다. Pane 이 없을 경우 생성된다.
   * @returns {HTMLElement}
   */
  getPane: function () {
    if (!this._pane) {
      var pane = document.createElement('div');
      pane.style.position = 'absolute';
      this._pane = pane;
    }
    return this._pane;
  },
  
  /**
   * Vector 가 그려질 container element 를 반환한다. Vector 는 pane 이 아닌 container 에 element 를 추가해야 한다.
   * SVG 의 경우 ContainerRenderer 를 통해 생성된 svg element 를 반환하며 VML,Canvas 의 경우 div pane 이 반환된다.  
   * @returns {HTMLElement}
   */
  getContainer: function() {
    if (!this._container) {
      var pane = this.getPane();
      if (this._containerRenderer) {
        this._container = this._containerRenderer.createContainer();
        pane.appendChild(this._container);
      } else {
        this._container = pane;
      }
    }
    return this._container;
  },

  /**
   * RendererFactory 를 반환한다.
   * @returns {olleh.maps.vector.RendererFactory}
   * @private
   */
  getRendererFactory: function () {
    return this._rendererFactory;
  },

  /**
   * Vector 를 추가한다.
   * @param {olleh.maps.vector.Vector} vector
   */
  add: function (vector) {
    this._vectors.push(vector);
    vector.layer = this;
    if (this.isStarted())
      vector.onAdd(this);
  },

  /**
   * Vector 를 삭제한다.
   * @param {olleh.maps.vector.Vector} vector
   */
  remove: function (vector) {
    olleh.maps.util.removeFromArray(this._vectors, vector);
    if (this.isStarted()) {
      vector.onRemove();
    }
    vector.layer = null;
  }
});/**
 * EditHandler interface
 * @private
 */
$class('olleh.maps.vector.EditHandler').define({
  
  EditHandler: function(target) {
    this.target = target;
  },
  
  activate: function() {
    
  },
  
  deactivate: function() {
    
  },
  
  getTarget: function() {
    return this.target;
  },
  
  refresh: function() {
    
  }

});/**
 * @private
 */
$class('olleh.maps.plugin.VectorPlugin').extend(olleh.maps.Adaptable).define({
  
  attach: function () {
    this.vector = new olleh.maps.vector.VectorLayer({
      map: this.map
    });
  },
  
  detach: function () {
    // ????
  }
  
});

olleh.maps.$skeleton.push(olleh.maps.plugin.VectorPlugin);/* Copyright (c) 2012 the authors listed at the following URL, and/or
the authors of referenced articles or incorporated external code:
http://en.literateprograms.org/Quickhull_(Javascript)?action=history&offset=20120410175256

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Retrieved from: http://en.literateprograms.org/Quickhull_(Javascript)?oldid=18434
*/
var Quickhull = {
  getDistant: function (cpt, bl) {
    return (bl[0].y - bl[1].y) * (cpt.x - bl[0].x) + (bl[1].x - bl[0].x) * (cpt.y - bl[0].y);
  },
  findMostDistantPointFromBaseLine: function (baseLine, points) {
    var i, l, maxD = 0, maxPt = null, newPoints = [];
    for (i = 0, l = points.length; i < l; i++) {
      var pt = points[i];
      var d = this.getDistant(pt, baseLine);
      if (d > 0) {
        newPoints.push(pt);
        if (d > maxD) {
          maxD = d;
          maxPt = pt;
        }
      }
    }
    return {
      'maxPoint': maxPt,
      'newPoints': newPoints
    };
  },
  buildConvexHull: function (baseLine, points) {
    var convexHullBaseLines = [], t = this.findMostDistantPointFromBaseLine(baseLine, points);
    if (t.maxPoint) { // if there is still a point "outside" the base line
      convexHullBaseLines = convexHullBaseLines.concat(this.buildConvexHull([ baseLine[0], t.maxPoint ], t.newPoints));
      convexHullBaseLines = convexHullBaseLines.concat(this.buildConvexHull([ t.maxPoint, baseLine[1] ], t.newPoints));
      return convexHullBaseLines;
    }
    // if there is no more point "outside" the base line, the current base line is part of the convex hull
    return [ baseLine ];
  },
  getConvexHull: function (points) {
    var i, l, maxPt, minPt, maxX = Number.MIN_VALUE, minX = Number.MAX_VALUE;
    for (i = 0, l = points.length; i < l; i++) {
      var pt = points[i];
      if (pt.x > maxX) {
        maxPt = pt;
        maxX = pt.x;
      }
      if (pt.x < minX) {
        minPt = pt;
        minX = pt.x;
      }
    }
    return [].concat(this.buildConvexHull([ minPt, maxPt ], points), this.buildConvexHull([ maxPt, minPt ], points));
  }
};/**
 * MarkerClusterOptions Object Specification
 * @typedef olleh.maps.overlay.MarkerClusterOptions
 * @property {boolean} [resetPosition=false] 클러스터에 마커가 추가될 경우 클러스터의 좌표를 마커들의 평균 좌표로 변경할지 여부.
 * @property {boolean} [clickToZoom=false] 클러스터를 클릭할 때 지도를 클러스터의 <code>maxZoom + 1</code>레벨로 확대할지 여부.
 * @property {boolean} [clickToExpand=true] 클러스터를 클릭할 때 클러스터가 펼쳐지게 할 지 여부. <code>clickToZoom</code>이 설정되어 있을 경우 무시된다.
 * @property {boolean} [displaySize=true] 클러스터에 클러스터에 포함된 마커의 갯수를 표시할지 여부.
 * @property {number} [fontSize] 마커 갯수의 폰트 크기. 픽셀 단위.
 * @property {boolean} [displayArea=true] 클러스터에 마우스오버를 할 경우 클러스터의 영역을 표시할지 여부.
 * @property {olleh.maps.vector.PolygonOptions} [areaStyle] 마오스오버시 나타나는 영역의 스타일.
 * @property {function} [iconFn] 마커 클러스터의 아이콘을 지정하는 함수. 클러스터가 포함하고 있는 마커의 갯수를 파라메터로 받아 {@link olleh.maps.overlay.MarkerOptions}를 리턴한다.
 * @extends olleh.maps.overlay.PointedOverlayOptions
 */

/**
 * 여러 마커를 하나의 마커로 표현하는 마커 클러스터 클래스.
 */
$class('olleh.maps.overlay.MarkerCluster').extend(olleh.maps.overlay.PointedOverlay).define({

  $static: {
    /**
     * @private
     * @constants
     * @type number
     */
    DEFAULT_FONT_SIZE: 10,

    /**
     * @private
     * @constants
     * @type String
     */
    DEFAULT_FONT_COLOR: '#000',

    /**
     * @private
     * @constants
     * @type olleh.maps.vector.PolygonOptions
     */
    DEFAULT_AREA_STYLE: {
      strokeColor: '#69F',
      strokeWeight: 5,
      strokeOpacity: .8,
      fillColor: '#69F',
      fillOpacity: .4
    },

    /**
     * @private
     * @param {number} size
     * @returns {olleh.maps.overlay.MarkerIconOptions}
     */
    DEFAULT_ICON_FN: function (size) {
      return {
        url: olleh.maps.env.RESOURCE_URL + 'img/clusters.png',
        size: new olleh.maps.Size(50, 50),
        anchor: new olleh.maps.Point(25, 25),
        origin: new olleh.maps.Point((4 - Math.min(Math.floor(size / 20), 4)) * 51, 0)
      };
    }
  },

  /**
   * @private
   * @constants
   * @type number
   */
  MARKER_ANIMATE_DURATION: .2,

  /**
   * 새로운 클러스터를 생성한다.
   * @param {olleh.maps.overlay.MarkerClusterOptions} opts 옵션.
   */
  MarkerCluster: function (opts) {
    var MarkerCluster = olleh.maps.overlay.MarkerCluster;
    this._clickToExpand = true;
    this._clickToZoom = false;
    this._displaySize = true;
    this._fontSize = MarkerCluster.DEFAULT_FONT_SIZE;
    this._fontColor = MarkerCluster.DEFAULT_FONT_COLOR;
    this._displayArea = true;
    this._areaStyle = MarkerCluster.DEFAULT_AREA_STYLE;
    this._iconFn = MarkerCluster.DEFAULT_ICON_FN;

    this._areaPath = null;
    this._originMap = null;
    this._area = null;

    this._children = [];
    this._size = -1; // -1 indicates invalidate; should be recalculated before draw
  },

  /**
   * 클러스터가 펼쳐진 상태인지 여부를 리턴한다.
   * @returns {boolean} 클러스터가 펼쳐진 상태일 경우 <code>true</code>, 그렇지 않을 경우 <code>false</code>
   */
  isExpanded: function () {
    var i, l, children = this._children;
    for (i = 0, l = children.length; i < l; i++) {
      if (children[i].isAdded()) {
        return true;
      }
    }
    return false;
  },

  /**
   * 옵션을 설정한다.
   * @param {olleh.maps.overlay.MarkerClusterOptions} opts
   */
  setOptions: function (opts) {
    opts.resetPosition !== undefined && this.setResetPosition(opts.resetPosition);
    opts.clickToZoom !== undefined && this.setClickToZoom(opts.clickToZoom);
    opts.clickToExpand !== undefined && this.setClickToExpand(opts.clickToExpand);
    opts.displaySize !== undefined && this.setDisplaySize(opts.displaySize);
    opts.fontSize && this.setFontSize(opts.fontSize);
    opts.fontColor && this.setFontColor(opts.fontColor);
    opts.displayArea !== undefined && this.setDisplayArea(opts.displayArea);
    opts.areaStyle && this.setAreaStyle(opts.areaStyle);
    opts.iconFn && this.setIconFn(opts.iconFn);
    olleh.maps.overlay.MarkerCluster.$super.setOptions.apply(this, arguments);
  },

  update: function () {
    this._updateIcon();
    this._updateSize();
    olleh.maps.overlay.MarkerCluster.$super.update.apply(this, arguments);
  },

  /**
   * @param zoom
   * @returns {boolean}
   */
  isVisibleAtZoom: function (zoom) {
    return this.minZoom <= zoom && zoom <= this.maxZoom;
  },

  /**
   * {@link olleh.maps.overlay.MarkerClusterOptions#resetPosition} 옵션이 설정되었는지 여부를 리턴한다.
   * @returns {boolean} 설정된 경우 <code>true</code>, 그렇지 않을 경우 <code>false</code>
   */
  isResetPosition: function () {
    return this._resetPosition;
  },

  /**
   * {@link olleh.maps.overlay.MarkerClusterOptions#resetPosition} 옵션을 설정한다.
   * @param {boolean} resetPosition 옵션의 값.
   */
  setResetPosition: function (resetPosition) {
    this._resetPosition = resetPosition;
  },

  /**
   * {@link olleh.maps.overlay.MarkerClusterOptions#clickToZoom} 옵션이 설정되었는지 여부를 리턴한다.
   * @returns {boolean} 설정된 경우 <code>true</code>, 그렇지 않을 경우 <code>false</code>
   */
  isClickToZoom: function () {
    return this._clickToZoom;
  },

  /**
   * {@link olleh.maps.overlay.MarkerClusterOptions#clickToZoom} 옵션을 설정한다.
   * @param {boolean} clickToZoom 옵션의 값.
   */
  setClickToZoom: function (clickToZoom) {
    this._clickToZoom = clickToZoom;
  },

  /**
   * {@link olleh.maps.overlay.MarkerClusterOptions#clickToExpand} 옵션이 설정되었는지 여부를 리턴한다.
   * @returns {boolean} 설정된 경우 <code>true</code>, 그렇지 않을 경우 <code>false</code>
   */
  isClickToExpand: function () {
    return this._clickToExpand;
  },

  /**
   * {@link olleh.maps.overlay.MarkerClusterOptions#clickToExpand} 옵션을 설정한다.
   * @param {boolean} clickToExpand 옵션의 값.
   */
  setClickToExpand: function (clickToExpand) {
    this._clickToExpand = clickToExpand;
  },

  /**
   * {@link olleh.maps.overlay.MarkerClusterOptions#displaySize} 옵션이 설정되었는지 여부를 리턴한다.
   * @returns {boolean} 설정된 경우 <code>true</code>, 그렇지 않을 경우 <code>false</code>
   */
  isDisplaySize: function () {
    return this._displaySize;
  },

  /**
   * {@link olleh.maps.overlay.MarkerClusterOptions#displaySize} 옵션을 설정한다.
   * @param {boolean} displaySize 옵션의 값.
   */
  setDisplaySize: function (displaySize) {
    this._displaySize = displaySize;
    this.isDrawn() && this._updateSize();
  },

  /**
   * @private
   */
  _updateSize: function () {
    this._sizeDiv.setProperty('innerHTML', this._displaySize ? this.getSize() : '');
  },

  /**
   * {@link olleh.maps.overlay.MarkerClusterOptions#fontSize} 옵션의 값을 리턴한다.
   * @returns {number} 옵션의 값.
   */
  getFontSize: function () {
    return this._fontSize;
  },

  /**
   * {@link olleh.maps.overlay.MarkerClusterOptions#fontSize} 옵션을 설정한다.
   * @param {boolean} fontSize 옵션의 값.
   */
  setFontSize: function (fontSize) {
    this._fontSize = fontSize;
    this.isDrawn() && this._updateIcon();
  },

  /**
   * {@link olleh.maps.overlay.MarkerClusterOptions#fontColor} 옵션의 값을 리턴한다.
   * @returns {string} 옵션의 값.
   */
  getFontColor: function () {
    return this._fontColor;
  },

  /**
   * {@link olleh.maps.overlay.MarkerClusterOptions#fontColor} 옵션을 설정한다.
   * @param {string} fontColor 옵션의 값.
   */
  setFontColor: function (fontColor) {
    this._fontColor = fontColor;
    this.isDrawn() && this._updateIcon();
  },

  /**
   * {@link olleh.maps.overlay.MarkerClusterOptions#displayArea} 옵션이 설정되었는지 여부를 리턴한다.
   * @returns {boolean} 설정된 경우 <code>true</code>, 그렇지 않을 경우 <code>false</code>
   */
  isDisplayArea: function () {
    return this._displayArea;
  },

  /**
   * {@link olleh.maps.overlay.MarkerClusterOptions#displayArea} 옵션을 설정한다.
   * @param {boolean} displayArea 옵션의 값.
   */
  setDisplayArea: function (displayArea) {
    this._displayArea = displayArea;
    if (this.isDrawn() && !displayArea) {
      this.hideArea();
    }
  },

  /**
   * {@link olleh.maps.overlay.MarkerClusterOptions#areaStyle} 옵션의 값을 리턴한다.
   * @returns {olleh.maps.vector.PolygonOptions} 옵션의 값.
   */
  getAreaStyle: function () {
    return this._areaStyle;
  },

  /**
   * {@link olleh.maps.overlay.MarkerClusterOptions#areaStyle} 옵션을 설정한다.
   * @param {olleh.maps.vector.PolygonOptions} areaStyle 옵션의 값.
   */
  setAreaStyle: function (areaStyle) {
    this._areaStyle = areaStyle;
  },

  /**
   * {@link olleh.maps.overlay.MarkerClusterOptions#iconFn} 옵션의 값을 리턴한다.
   * @returns {function} 옵션의 값.
   */
  getIconFn: function () {
    return this._iconFn;
  },

  /**
   * {@link olleh.maps.overlay.MarkerClusterOptions#iconFn} 옵션을 설정한다.
   * @param {function} iconFn 옵션의 값.
   */
  setIconFn: function (iconFn) {
    this._iconFn = iconFn;
  },

  /**
   * @private
   */
  _updateIcon: function () {
    var icon = this._iconFn(this.getSize());
    var fontSize = this._fontSize;
    var fontColor = this._fontColor;
    var img = this._img;

    if (!this._img) {
      img = this._img = new olleh.maps.SpritedImage();

      this._sizeDiv = olleh.maps.Element.create('div').setStyles({
        position: 'absolute',
        width: '100%',
        textAlign: 'center',
        fontWeight: 'bold',
        zIndex: 1
      });
      this._sizeDiv.setStyle('userSelect', 'none');
      img.appendChild(this._sizeDiv);
      this.registerElement('upper_overlay_pane', img.elem);
      this.registerEventDom(img.elem);
    }

    img.setStyles({
      width: icon.size.width + 'px',
      height: icon.size.height + 'px',
      marginLeft: -icon.anchor.x + 'px',
      marginTop: -icon.anchor.y + 'px'
    }).setImage(icon.url, icon.origin, icon.scaledSize);

    this._sizeDiv.setStyles({
      paddingTop: (icon.size.height / 2 - fontSize / 2) + 'px',
      fontSize: fontSize + 'px',
      color: fontColor
    });
  },

  /**
   * 클러스터가 포함하고 있는 마커의 갯수를 리턴한다.
   * @returns {number} 포함하고 있는 마커의 갯수.
   */
  getSize: function () {
    var i, l, child, children, size = this._size;
    if (size == -1) {
      size = 0;
      children = this._children;
      for (i = 0, l = children.length; i < l; i++) {
        child = children[i];
        size += child.getSize ? child.getSize() : 1;
      }
      this._size = size;
    }
    return size;
  },

  /**
   * 클러스터 및 부모 클러스터의 마커 갯수를 무효화한다.
   * @private
   */
  _invalidate: function (depth) {
    var parent = this.parent;
    var areaAdded = this._area && this._area.isAdded();

    if (areaAdded) {
      this.hideArea();
    }

    this._size = -1;
    this._bounds = null;
    this._area = null;

    if (parent && parent._size != -1) {
      parent._invalidate();
    }

    if (this.isDrawn()) {
      this._updateIcon();
      this._updateSize();
      if (areaAdded) {
        this.showArea();
      }
    }
  },

  /**
   * 클러스터가 포함하고 있는 모든 마커가 차지하는 영역을 리턴한다.
   * @returns {olleh.maps.Bounds} 영역
   */
  getBounds: function () {
    var markers, i, coord, bounds = this._bounds;
    var minX = Infinity, minY = Infinity, maxX = -Infinity, maxY = -Infinity;

    if (!bounds) {
      if (!this._children.length) {
        return null;
      }

      markers = this.getAllMarkers();
      for (i = 0; i < markers.length; i++) {
        coord = markers[i].getPosition().asDefault();
        if (minX > coord.x) {
          minX = coord.x;
        }
        if (minY > coord.y) {
          minY = coord.y;
        }
        if (maxX < coord.x) {
          maxX = coord.x;
        }
        if (maxY < coord.y) {
          maxY = coord.y;
        }
      }

      bounds = this._bounds = new olleh.maps.Bounds(new olleh.maps.UTMK(minX, minY), new olleh.maps.UTMK(maxX, maxY));
    }

    return bounds;
  },

  /**
   * 클러스터의 자식 클러스터 또는 마커의 배열을 리턴한다.
   * @returns {Array.<olleh.maps.overlay.PointedOverlay>} 자식 마커 또는 클러스터의 배열
   */
  getChildren: function () {
    return this._children;
  },

  /**
   * {#getChildren}을 사용하라.
   * @deprecated
   * @returns {Array.<olleh.maps.overlay.PointedOverlay>} 자식 마커 또는 클러스터의 배열
   */
  getMarkers: function () {
    return this._children;
  },

  /**
   * 클러스터가 포함하고 있는 모든 마커의 배열을 리턴한다.
   * 즉, <code>getAllMarkers().length == getSize()</code>가 된다.
   * @returns {Array.<olleh.maps.overlay.Marker>} 모든 마커의 목록
   */
  getAllMarkers: function () {
    var i, l, children = this._children, result = [];
    for (i = 0, l = children.length; i < l; i++) {
      child = children[i];
      if (child.getAllMarkers) {
        result = result.concat(child.getAllMarkers());
      } else {
        result.push(child);
      }
    }
    return result;
  },

  /**
   * 클러스터의 중심 좌표를 리턴한다.
   * @returns {olleh.maps.Coord} 중심 좌표
   */
  getCenter: function () {
    var i, coord, x = 0, y = 0;
    var children = this._children, length = children.length;
    for (i = 0; i < length; i++) {
      coord = children[i].getPosition().asDefault();
      x += coord.x;
      y += coord.y;
    }
    return new olleh.maps.UTMK(x / length, y / length);
  },

  /**
   * 클러스터에 마커를 추가한다.
   * @param {olleh.maps.overlay.PointedOverlay} child 추가할 마커
   */
  add: function (child) {
    if (child.parent == this) {
      return;
    }

    if (child.parent) {
      child.parent.remove(child);
    }

    child.parent = this;
    this._children.push(child);

    if (this._resetPosition || this._children.length <= 2) {
      this.setPosition(this.getCenter());
    }

    this._invalidate();
  },

  /**
   * 클러스터에서 마커를 삭제한다.
   * @param {olleh.maps.overlay.PointedOverlay} child 삭제할 마커
   */
  remove: function (child) {
    if (child.parent != this) {
      return;
    }

    child.parent = null;
    child.setMap(null);
    olleh.maps.util.removeFromArray(this._children, child);

    if (this._resetPosition && this._children.length) {
      this.setPosition(this.getCenter());
    }

    this._invalidate();
  },

  expand: function () {
    if (this.maxZoom !== undefined) {
      this.getMap().panTo(this.getPosition(), this.maxZoom + 1);
    } else {
      this.expandToDepth();
    }
  },

  /**
   * 클러스터를 펼친다. 현재 클러스터는 지도에서 사라지고 클러스터가 가지고 있는 마커들이 지도에 나타난다.
   * @param {Number} [depth=1] 펼칠 단계. 클러스터가 다른 클러스터를 포함하고 있는 경우 몇 단계까지 펼칠 것인지를 지정한다.
   * @param {olleh.maps.overlay.MarkerCluster} [root] 루트 클러스터. 내부적으로 사용되므로 사용자가 지정해서는 안 된다.
   */
  expandToDepth: function (depth, root) {
    var i, l, children, map, rootPx, child;
    var MARKER_ANIMATE_DURATION = this.MARKER_ANIMATE_DURATION;

    if (this.isMoving()) {
      this.stopAnimators();
    }

    depth || (depth = 1);
    root || (root = this);

    map = root.getMap();
    rootPx = root.getOriginalLayerPx();

    depth--;

    children = this._children;
    for (i = 0, l = children.length; i < l; i++) {
      child = children[i];
      if (child.isAdded()) {
        continue;
      }

      if (child.expandToDepth && depth > 0) {
        child.expandToDepth(depth, root);
      } else {
        if (!child.isAdded()) {
          child.onAdd = this._markerOnAdd.bind(child, rootPx, MARKER_ANIMATE_DURATION);
          child.setMap(map);
        }
      }
    }

    if (this.isAdded()) {
      this.hideArea();
      if (this.isDrawn()) {
        this.onRemove = this._clusterOnRemove;
      }
      this.setMap(null);
    }

    if (this._clickToExpand && !this._clickToZoom && !this.parent) {
      this._originMap = map; // 축소할 때 맵 객체가 없기 때문에 유지
      map.onEvent('click', this._onMapClick, this);
    }
  },

  /**
   * 클러스터를 특정 줌레벨에 알맞게 펼친다.
   * 클러스터와 클러스터가 포함하고 있는 마커들의 <code>maxZoom</code> 속성이 잘 지정되었을 경우에만 사용해야 한다.
   * @param {Number} zoom 확대할 줌레벨.
   * @param {olleh.maps.Bounds} [bounds] 대상 영역.
   * @param {olleh.maps.overlay.MarkerCluster} [root] 루트 클러스터. 내부적으로 사용되므로 사용자가 지정해서는 안 된다.
   * @return expand할때 화면에 추가되는 클러스터들
   */
  expandToZoom: function (zoom, bounds, root) {
    var i, l, children, map, rootPx, child, result;
    var MARKER_ANIMATE_DURATION = this.MARKER_ANIMATE_DURATION;

    if (this.isMoving()) {
      this.stopAnimators();
    }

    root || (root = this);

    map = root.getMap();
    rootPx = root.getOriginalLayerPx();

    if (this == root && this.maxZoom >= zoom) {
      return [this];
    }

    children = this._children;
    result = [];
    for (i = 0, l = children.length; i < l; i++) {
      child = children[i];
      if (!bounds || bounds.intersects(child.getBounds() || child.getPosition())) {
        if (child.expandToZoom && child.maxZoom < zoom) {
          result = result.concat(child.expandToZoom(zoom, bounds, root));
        } else {
          if (!child.isAdded()) {
            child.onAdd = this._markerOnAdd.bind(child, rootPx, MARKER_ANIMATE_DURATION);
            child.setMap(map);
          }
          result.push(child);
        }
      }
    }

    if (this.isAdded()) {
      this.hideArea();
      if (this.isDrawn()) {
        this.onRemove = this._clusterOnRemove;
      }
      this.setMap(null);
    }

    return result;
  },

  /**
   * 펼쳐진 클러스터를 다시 하나의 클러스터로 나타낸다. 클러스터가 가지고 있는 마커들이 지도에서 사라지고 클러스터가 지도에 나타난다.
   * @param {olleh.maps.Map} map 지도 객체.
   * @param {olleh.maps.overlay.MarkerCluster} [root] 루트 클러스터. 내부적으로 사용되므로 사용자가 지정해서는 안 된다.
   */
  collapse: function (map, root) {
    var i, l, children = this._children, rootPx, child;
    var MARKER_ANIMATE_DURATION = this.MARKER_ANIMATE_DURATION;

    if (this.isMoving()) {
      this.stopAnimators();
    }

    root || (root = this);

    rootPx = map.layerMgr.getLayerPxFromCoord(root.getPosition()); // root는 setMap되어있지 않으므로 getOriginalLayerPx 사용 불가

    for (i = 0, l = children.length; i < l; i++) {
      child = children[i];

      if (child.isAdded()) {
        if (child.isDrawn()) {
          child.onRemove = this._markerOnRemove.bind(child, rootPx, MARKER_ANIMATE_DURATION);
        }
        child.setMap(null);
      } else if (child.collapse) {
        child.collapse(map, root);
      }
    }

    if (this == root) {
      this.onAdd = this._clusterOnAdd;
      this.setMap(map);
    }

    if (this._originMap) {
      map.unsubscribeEvent('click', this._onMapClick, this);
      this._originMap = null;
    }
  },

  /**
   * 클러스터가 포함하고 있는 모든 마커를 감싸는 폴리곤을 리턴한다.
   * @returns {olleh.maps.vector.Polygon} 폴리곤
   */
  getArea: function () {
    var area = this._area;

    if (!area) {
      var i, l;
      var markerCoords = [], pathCoords = [];
      var markers = this.getAllMarkers();

      for (i = 0, l = markers.length; i < l; i++) {
        markerCoords.push(markers[i].getPosition().asDefault());
      }

      var convexHull = Quickhull.getConvexHull(markerCoords);

      for (i = 0, l = convexHull.length; i < l; i++) {
        pathCoords.push(convexHull[i][0]);
      }

      area = new olleh.maps.vector.Polygon(this._areaStyle);
      area.setPaths(new olleh.maps.Path(pathCoords));
      this._area = area;
    }

    return area;
  },

  /**
   * 클러스터의 영역을 나타낸다.
   */
  showArea: function () {
    var area = this.getArea();
    if (!area.isAdded()) {
      area.setMap(this.map);
    }
  },

  /**
   * 클러스터의 영역을 숨긴다.
   */
  hideArea: function () {
    if (this._area) {
      this._area.setMap(null);
    }
  },

  /**
   * @private
   */
  $default_click: function () {
    this.expand();
  },

  /**
   * @private
   */
  $default_mouseover: function () {
    if (this._displayArea) {
      this.showArea();
    }
  },

  /**
   * @private
   */
  $default_mouseout: function () {
    this.hideArea();
  },

  /**
   * 지도를 클릭했을 때 처리되는 콜백함수
   * @private
   */
  _onMapClick: function (event) {
    if (event.getSource() instanceof olleh.maps.layer.LayerManager) {
      this.collapse(this._originMap);
    }
  },

  _clusterReady: function () {
    this.setVisible(true);
    this.ready();
  },

  _clusterOnAdd: function () {
    this.setVisible(false);
    olleh.maps.util.delay(this._clusterReady, this.MARKER_ANIMATE_DURATION * 1000, this);
    delete this.onAdd;
  },

  _clusterOnRemove: function () {
    olleh.maps.util.defer(this.cleanup, this);
    delete this.onRemove;
  },

  _markerOnRemove: function (rootPx, duration) {
    this.moveTo(rootPx, duration, false, this.cleanup);
    delete this.onRemove;
  },

  _markerOnAdd: function (rootPx, duration) {
    this.moveTo(rootPx);
    this.moveTo(this.getOriginalLayerPx(), duration, false, this.ready);
    delete this.onAdd;
  },

  attach: function () {
    this.hideArea();
    olleh.maps.overlay.MarkerCluster.$super.attach.apply(this, arguments);
  },

  detach: function () {
    this.hideArea();
    olleh.maps.overlay.MarkerCluster.$super.detach.apply(this, arguments);
  }

});
/**
 * MarkerClustererOptions Object Specification
 * @typedef olleh.maps.overlay.MarkerClustererOptions
 * @property {number} [minZoom=0] 클러스터링이 이루어질 최소 줌레벨.
 * @property {number} [maxZoom=12] 클러스터링이 이루어질 최대 줌레벨.
 * @property {number} [gap=200] 클러스터링 기준 거리. 이 거리 미만의 마커들은 클러스터링되어 표현된다.
 * @property {olleh.maps.overlay.MarkerClusterOptions} [clusterOpts] 각각의 클러스터에 대한 옵션을 설정한다. 단, <code>clickToZoom</code> 및 <code>resetPosition</code>은 무조건 <code>true</code>로 설정된다.
 * @property {function} [afterCluster] 클러스터가 생성된 후에 불리는 콜백.
 * @property {function} [getDistance] 두 마커의 거리를 계산하는 함수.
 * @property {function} [getThreshold] 클러스터링 기준 거리를 계산하는 함수.
 */

/**
 * 마커 클러스터러 클래스.<br/>
 * 마커 클러스터러는 인접한 마커를 자동으로 클러스링해 표현하는 클래스이다.
 * 지도에 다수의 오버레이가 존재할 경우 성능 및 시인성에 악영향을 미치게 되는데,
 * 마커 클러스터러를 사용하면 이러한 문제를 해결할 수 있다.
 * @example
 * var map = new olleh.maps.Map(document.getElementById('map'), {
 *   center: new olleh.maps.UTMK(953755.70, 1949715.52),
 *   zoom: 8
 * });
 * var clusterer = new olleh.maps.overlay.MarkerClusterer();
 * clusterer.add(marker1); // marker.setMap()은 사용하지 않는다.
 * clusterer.add(marker2);
 * clusterer.add(marker3);
 * clusterer.setMap(map); // marker1~3이 클러스터링되어 지도에 추가된다.
 * clusterer.add(marker4); // 클러스터러가 setMap()된 이후에도 마커를 동적으로 추가할 수 있다. 
 * clusterer.add(marker5);
 * clusterer.setMap(null); // marker1~5가 모두 사라진다.
 */
$class('olleh.maps.overlay.MarkerClusterer').mixin(olleh.maps.Plugin).define({

  /**
   * 마커 클러스터러 생성자.
   * @param {olleh.maps.overlay.MarkerClustererOptions} opts 생성 옵션.
   */
  MarkerClusterer: function (opts) {
    opts || (opts = {});

    this.pluginInfo = olleh.maps.mixin({
      autoActivate: true
    }, opts.pluginInfo, true);

    this._clusterOpts = olleh.maps.util.clone(opts.clusterOpts) || {};
    if (!opts.clusterOpts || opts.clusterOpts.clickToZoom === undefined) {
      this._clusterOpts.clickToZoom = true;
    }
    this._clusterOpts.clickToExpand = false;
    this._clusterOpts.resetPosition = true;
    this._minZoom = opts.minZoom || 0;
    this._maxZoom = opts.maxZoom || 12;
    this._gap = opts.gap || 100;
    this._getDistance = opts.getDistance || this.defaultGetDistance;
    this._getThreshold = opts.getThreshold || this.defaultGetThreshold;
    this._afterCluster = opts.afterCluster || null;

    this._displayed = [];
    this._zoom = -2;

    this._bound_onClusterPositionChanged = this._onClusterPositionChanged.bind(this);
    this.clear();
  },

  /**
   * 클러스터러의 모든 마커를 삭제하고 초기화한다.
   */
  clear: function () {
    var i, l, markers = this._displayed;
    var LayerManager = olleh.maps.layer.LayerManager;

    for (i = 0, l = markers.length; i < l; i++) {
      markers[i].setMap(null);
    }
    this._displayed = [];

    this._rootCluster = new olleh.maps.overlay.MarkerCluster();
    this._rootCluster.minZoom = -1;
    this._rootCluster.maxZoom = -1;

    for (i = 0, l = this._index ? this._index.length : 0; i < l; i++) {
        this._index[i] && this._index[i].clear();
    }
    this._index = [];

    for (i = this._minZoom, l = this._maxZoom + 2; i < l; i++) {
      this._index[i] = new olleh.maps.overlay.GridIndex(256 * LayerManager.getResolutionForZoom(i));
    }
  },

  /**
   * @private
   * @param {olleh.maps.overlay.Marker} marker
   * @param {olleh.maps.overlay.Marker} otherMarker
   * @param {number} zoom
   * @returns {number}
   */
  defaultGetDistance: function (marker, otherMarker, zoom) {
    return marker.getPosition().distanceTo(otherMarker.getPosition());
  },
  
  /**
   * @private
   * @param {number} zoom
   * @returns {number}
   */
  defaultGetThreshold: function (zoom) {
    return this._gap * olleh.maps.layer.LayerManager.getResolutionForZoom(zoom);
  },

  /**
   * 마커를 클러스터러에서 삭제한다.
   * @param {olleh.maps.overlay.Marker} marker
   */
  remove: function (marker) {
    var parent, grandparent, sibling, children;

    if (!marker || !this._index[this._maxZoom + 1].contains(marker)) {
      return;
    }

    this._removeFromIndex(marker, marker.minZoom, marker.maxZoom);

    parent = marker.parent;
    parent.remove(marker);
    children = parent.getChildren();

    // 마커의 삭제로 인해 형제 마커가 유일한 자식이 될 경우
    // 부모 클러스터를 삭제하고 형제 마커를 부모 클러스터의 위치로 올림
    if (parent != this._rootCluster && children.length == 1) {
      grandparent = parent.parent;
      sibling = children[0];

      sibling.minZoom = parent.minZoom;

      this._removeFromIndex(parent, parent.minZoom, parent.maxZoom);
      this._addToIndex(sibling, parent.minZoom, parent.maxZoom);

      grandparent.remove(parent);
      grandparent.add(sibling);
      parent.unsubscribeEvent('position_changed', this._bound_onClusterPositionChanged);

      parent = grandparent;
    }
  },

  /**
   * 마커를 클러스터러에 추가한다.
   * @param {olleh.maps.overlay.Marker} marker
   */
  add: function (marker) {
    var cluster, minZoom, parent;
    var closest = null, zoom = this._maxZoom;

    if (!marker || this._index[this._maxZoom + 1].contains(marker)) {
      return;
    }

    if (marker.isAdded()) {
      marker.setMap(null);
    }

    while (zoom >= this._minZoom) {
      closest = this._getClosest(marker, zoom);
      if (closest) {
        break;
      }
      zoom--;
    }

    if (!closest) { // 인접 없음
      this._rootCluster.add(marker);
    } else {
      if (closest.add && closest.maxZoom == zoom) { // 인접이 클러스터이고 최대 줌에서 일치, 단순 추가
        closest.add(marker);
      } else { // 인접이 마커이거나 최대 줌이 다른 클러스터
        minZoom = closest.minZoom;
        parent = closest.parent;

        this._removeFromIndex(closest, closest.minZoom, zoom);
        closest.minZoom = zoom + 1;

        cluster = new olleh.maps.overlay.MarkerCluster(this._clusterOpts);
        cluster.minZoom = minZoom;
        cluster.maxZoom = zoom;

        cluster.add(closest);
        cluster.add(marker);
        if (this._afterCluster) {
          this._afterCluster(cluster);
        }

        this._addToIndex(cluster, cluster.minZoom, cluster.maxZoom);

        cluster.onEvent('position_changed', this._bound_onClusterPositionChanged);

        parent.add(cluster);
      }
    }

    marker.minZoom = zoom + 1;
    marker.maxZoom = this._maxZoom + 1;
    this._addToIndex(marker, marker.minZoom, marker.maxZoom);
  },
  
  _getClosest: function (marker, zoom) {
    var position = marker.getPosition();
    var meter = this.defaultGetThreshold(zoom) * 2;
    var bounds = new olleh.maps.Bounds(position, position).expand(meter, meter);
    var overlays = this._index[zoom].getOverlays(bounds);
    var threshold = this._getThreshold(zoom);
    var i, l, distance, minDistance = Infinity, closest = null, overlay;

    for (i = 0, l = overlays.length; i < l; i++) {
      overlay = overlays[i];
      distance = this._getDistance(marker, overlay, zoom);
      if (distance < minDistance && distance < threshold) {
        minDistance = distance;
        closest = overlay;
      }
    }

    return closest;
  },

  /**
   * @private
   * @param {olleh.maps.overlay.Marker} marker
   */
  _addToIndex: function (marker, minZoom, maxZoom) {
    var i, zoom = this._zoom;
    for (i = minZoom; i <= maxZoom; i++) {
      if (this.map && i == zoom && !marker.isAdded()) {
        marker.setMap(this.map);
        this._displayed.push(marker);
      }
      this._index[i].add(marker, marker.getPosition());
    }
  },

  /**
   * @private
   * @param {olleh.maps.overlay.Marker} marker
   */
  _removeFromIndex: function (marker, minZoom, maxZoom) {
    var i, zoom = this._zoom;

    for (i = minZoom; i <= maxZoom; i++) {
      if (this.map && i == zoom && marker.isAdded()) {
        marker.setMap(null);
        this._displayed.splice(olleh.maps.util.indexOf(this._displayed, marker), 1);
      }
      this._index[i].remove(marker, marker.getPosition());
    }
  },

  /**
   * 현재 맵의 줌레벨을 <code>minZoom</code>과 <code>maxZoom</code> 사이의 값으로 반환한다.
   * @private
   */
  _getAdjustedZoom: function () {
    if (!this.map) {
      return -2;
    }

    var zoom = this.map.getZoom();
    if (zoom < this._minZoom) {
      zoom = this._minZoom;
    } else if (zoom > this._maxZoom + 1) {
      zoom = this._maxZoom + 1;
    }

    return zoom;
  },

  doActivate: function () {
    var i, l, markers, marker, map = this.map;
    var zoom = this._getAdjustedZoom();
    var bounds = map.layerMgr.getOverlayLayer().getBounds();

    this._zoom = zoom;
    this._bounds = bounds;

    this._displayed = this._index[zoom].getOverlays(bounds);
    for (i = 0, l = this._displayed.length; i < l; i++) {
      this._displayed[i].setMap(map);
    }

    map.onEvent('overlay_layer_bounds_changed', this._onboundschanged, this);
  },

  doDeactivate: function () {
    var i, l, markers, map = this.map;

    this._zoom = -2;
    this._bounds = null;

    for (i = 0, l = this._displayed.length; i < l; i++) {
      this._displayed[i].setMap(null);
    }
    this._displayed = [];

    map.unsubscribeEvent('overlay_layer_bounds_changed', this._onboundschanged, this);
  },

  _onClusterPositionChanged: function (e, payload) {
    var i, marker = e.getSource();
    for (i = marker.minZoom; i <= marker.maxZoom; i++) {
      this._index[i].remove(marker, payload.from);
      this._index[i].add(marker, payload.to);
    }
  },

  _onboundschanged: function (event, payload) {
    var oldZoom = this._zoom, zoom = this._getAdjustedZoom();
    this._bounds = payload.to;
    if (oldZoom == zoom) {
      this._updateBounds();
    } else {
      this._zoom = zoom;
      this._updateZoom(oldZoom < zoom ? this._expand : this._collapse);
    }
  },

  _updateBounds: function () {
    var marker, map = this.map, oldMarkers = this._displayed;
    var newMarkers = this._index[this._zoom].getOverlays(this._bounds);

    for (var i = 0; i < newMarkers.length; i++) {
      marker = newMarkers[i];
      if (marker.isAdded()) {
        oldMarkers[olleh.maps.util.indexOf(oldMarkers, marker)] = null;
      } else {
        marker.setMap(map);
      }
    }

    for (var i = 0; i < oldMarkers.length; i++) {
      marker = oldMarkers[i];
      if (marker) {
        marker.setMap(null);
      }
    }

    this._displayed = newMarkers;
  },

  _updateZoom: function (fn) {
    this._displayed = this._recursevely(this._rootCluster, fn);
    // zoom이 끝나면 마커 정리를 진행한다.
    this._hideNonDisplayedMarkers(this._rootCluster);
  },

  /**
   * @private
   * @param {olleh.maps.overlay.MarkerCluster} markCluster
   */
  _hideNonDisplayedMarkers: function(cluster){
    // 그려지지지만 _displayed에 없으면 더이상 그려지지 않게 변경한다.
    if (cluster.isDrawn() && (olleh.maps.util.indexOf(this._displayed, cluster) === -1)){
      cluster.setMap(null);
    }
    // children들도 검사한다
    if (!cluster.getChildren) return;
    
    var children = cluster.getChildren();
    for (var i = 0, childCnt = children.length ; i < childCnt; i++){
      this._hideNonDisplayedMarkers(children[i]);
    }
  },

  _recursevely: function (cluster, fn) {
    var map = this.map, zoom = this._zoom, bounds = this._bounds;
    var i, child, result = [], children = cluster.getChildren();
    for (i = 0; i < children.length; i++) {
      child = children[i];
      if (bounds.intersects(child.getBounds() || child.getPosition())) {
        if (child.getChildren) {
          // 클러스터인 경우 재귀적으로 expand/collapse한다.
          result = result.concat(fn.call(this, child, zoom, bounds));
        } else {
          // 일반 마커인 경우 무조건 setMap()한다. 부모 클러스터가 모두
          // !isVisibleAtZoom인 경우에만 여기에 도달하므로 min/max zoom을
          // 체크할 필요가 없다.
          if (!child.isAdded()) {
            child.setMap(map);
          }
          result.push(child);
        }
      }
    }
    return result;
  },

  _expand: function (cluster, zoom, bounds) {
    if (cluster.isAdded()) {
      return cluster.expandToZoom(zoom, bounds);
    }
    if (cluster.isVisibleAtZoom(zoom)) {
      cluster.setMap(this.map);
      return cluster;
    }
    return this._recursevely(cluster, this._expand);
  },

  _collapse: function (cluster, zoom, bounds) {
    if (cluster.isVisibleAtZoom(zoom)) {
      cluster.collapse(this.map);
      return cluster;
    }
    if (cluster.maxZoom == -1 || cluster.maxZoom < zoom) {
      return this._recursevely(cluster, this._collapse);
    }
    return [];
  }

});
/**
 * 데스크탑인 경우 마우스, 모바일인 경우 터치 이벤트를 추적해서
 * <ul>
 *   <li>{@link olleh.maps.event.EventDelegator#event:dragstart|dragstart}</li>
 *   <li>{@link olleh.maps.event.EventDelegator#event:drag|drag}</li>
 *   <li>{@link olleh.maps.event.EventDelegator#event:dragend|dragend}</li>
 * </ul>
 * 이벤트 생성할 수 있는 정보를 반환한다.
 * @summary <code>dragstart</code>, <code>drag</code>, <code>dragend</code> 이벤트를 생성하기 위해 마우스, 터치 이벤트를 추적한다.
 */
$class('olleh.maps.event.Drag').mixin(olleh.maps.event.Recognizer).define({

  /**
   * 생성자, 새로운 Drag 객체를 생성한다.
   */
  Drag: function () {
    this._mousedown = false;
    this._startEvent = null;
    this._isDragStart = false;
    this._isDragging = false;
    this._xy = null;

    this.setEnabled(true);
  },
  
  /**
   * @param {olleh.maps.event.Event} event
   * @private
   */
  mousedown: function (event) {
    if (this._isDragStart && this._isDragging) {
      return this.mouseup(event);
    }
    if (olleh.maps.event.EventManager.isRightClick(event.originEvent)) {
       this._reset();
       return;
    }
    this._mousedown = true;
    this._startEvent = event;
    this._isDragStart = false;
    this._isDragging = false;
    
    // movementXY를 계산하기 위해 현재 pageXY를 유지한다.
    // http://dvcs.w3.org/hg/pointerlock/raw-file/default/index.html#idl-def-MouseEvent
    this._xy = event.pageXY;
  },

  /**
   * @param {olleh.maps.event.Event} event
   * @private
   */
  mousemove: function (event) {
    if (!this._mousedown) return;
    
    var domEvent = event.originEvent;
    var startEvent = this._startEvent;
    var prevXY = this._xy;
    
    this._xy = event.pageXY;
    
    var movementXY = this._xy.subtract(prevXY);
    
    if (movementXY.x === 0 && movementXY.y === 0) {
      event.stopPropagation();
      return;
    } else if (!this._isDragStart) {

      if (startEvent.getSource() !== event.getSource()) return this._reset();
      
      this._isDragStart = true;
      /**
       * dragstart 이벤트
       * <p/>
       * 데스크탑인 경우 mousedown & mousemove 이벤트가 발생하면 dragstart 이벤트가 발생한다.
       * 모바일인 경우 touchstart & touchmove 이벤트가 발생하면 dragstart 이벤트가 발생한다.
       * @event olleh.maps.event.EventDelegator#event:dragstart
       * @param {olleh.maps.event.Event} event
       */
      return {
        name: 'dragstart', 
        opts: {
          originEvent: domEvent, 
          targetDOM: startEvent.targetDOM, 
          pageXY: event.pageXY
        }
      };
    }
    this._isDragging = true;
    /**
     * drag 이벤트
     * <p/>
     * dragstart 이벤트가 발생한 이후
     * 데스크탑인 경우 mousemove 이벤트가 발생하면 drag 이벤트가 발생한다.
     * 모바일인 경우 touchmove가 이벤트가 발생하면 drag 이벤트가 발생한다.
     * @event olleh.maps.event.EventDelegator#event:drag
     * @param {olleh.maps.event.Event} event
     * @param {Object} payload
     * @param {Number} payload.movementXY 이동 거리값<p/>이전 drag의 {@link olleh.maps.event.Event#pageXY}과 현재 {@link olleh.maps.event.Event#pageXY}를 비교한다. 
     * @see http://dvcs.w3.org/hg/pointerlock/raw-file/default/index.html#idl-def-MouseEvent|w3c mouse event
     */
    return {
      name: 'drag', 
      src: startEvent.getSource(), 
      opts: {
        originEvent: domEvent, 
        pageXY: event.pageXY,
        targetDOM: startEvent.targetDOM
      },
      payload: {movementXY: movementXY}
    };
  },

  /**
   * @param {olleh.maps.event.Event} event
   * @private
   */
  mouseup: function (event) {
    if (!this._mousedown || !this._isDragStart) {
      return this._reset();
    }
    var domEvent = event.originEvent;
    var startEvent = this._startEvent;
    var prevXY = this._xy;
    var movementXY = event.pageXY.subtract(prevXY);
    
    olleh.maps.event.EventManager.preventDefault(domEvent);
    this._reset();
    this._isDragging = true;
    /**
     * drag 이벤트
     * <p/>
     * drag 이벤트가 발생한 이후
     * 데스크탑인 경우 mouseup 이벤트가 발생하면 dragend 이벤트가 발생한다.
     * 모바일인 경우 touchend 이벤트가 발생하면 dragend 이벤트가 발생한다.
     * @event olleh.maps.event.EventDelegator#event:dragend
     * @param {olleh.maps.event.Event} event
     * @param {Object} payload
     * @param {Number} payload.movementXY 이동 거리값<p/>이전 drag의 {@link olleh.maps.event.Event#pageXY}과 현재 {@link olleh.maps.event.Event#pageXY}를 비교한다. 
     * @see http://dvcs.w3.org/hg/pointerlock/raw-file/default/index.html#idl-def-MouseEvent|w3c mouse event
     */
    return {
      name: 'dragend', 
      src: startEvent.getSource(),
      opts: {
        originEvent: domEvent, pageXY: event.pageXY,
        targetDOM: startEvent.targetDOM
      },
      payload: {movementXY: movementXY}
    };
  },

  /**
   * @param {olleh.maps.event.Event} event
   * @private
   */
  click: function (event) {
    if (this._isDragging) {
      var domEvent = event.originEvent;
      event.stopPropagation();
      olleh.maps.event.EventManager.preventDefault(domEvent);
    }
    this._reset(); // reset 하지 않으면 마우스버튼을 누르지 않은 상태인데 드래그 처리되는 경우가 있음
  },

  /**
   * @param {olleh.maps.event.Event} event
   * @private
   */
  touchstart: function (event) {
    var touches = event.touches;
    if (!touches || touches.length !== 1) return this._reset();
    return this.mousedown(event);
  },

  /**
   * @param {olleh.maps.event.Event} event
   * @private
   */
  touchmove: function (event) {
    var touches = event.touches;
    var result;
    
    if (!touches || touches.length !== 1) return this._reset();
    if (result = this.mousemove(event)) {
      olleh.maps.event.EventManager.preventDefault(event.originEvent);
    }
    return result;
  },

  /**
   * @param {olleh.maps.event.Event} event
   * @private
   */
  touchend: function (event) {
    return this.mouseup(event);
  },
  
  /**
   * 이벤트 trackking정보를 초기화한다.
   * @private
   */
  _reset: function () {
    this._mousedown = false;
    this._startEvent = null;
    this._isDragStart = false;
    this._isDragging = false;
    this._xy = null;
  }
});/**
 * drag 이벤트가  {@link olleh.maps.Map} 에서 발생했을 때 처리를 담당한다.
 * 
 * {@link olleh.maps.Map} 클래스에 <code>olleh.maps.handler.Drag.prototype</code>을 mixin해서 사용한다.
 * @example
 * 등록해서 사용할 때
 * olleh.maps.mixin(map, olleh.maps.handler.Drag.prototype, true);
 * 해제해서 사용할 때
 * for(var key in olleh.maps.handler.Drag.prototype) {
 *   delete map[key];
 * }
 * @private
 */
$class('olleh.maps.handler.Drag').define({
  
  $static: {
    // Drag 에서 사용하는 map option 의 default 값을 map options 에 mixin 한다.
    attach: function(map) {
      map.mergeDefaultOptions({
        dragInertia: true,
        dragInertiaThreshold: olleh.maps.browser.isMobile ? 45 : 65,
        dragInertiaDeceleration: olleh.maps.browser.isMobile ? 4000 : 4500
      });
    }
  },
  
  _zeroPoint: new olleh.maps.Point(0,0),
  
  $default_dragstart: function (event, payload) {
    var point = event.getPoint();

    if (!point) return;
    
    olleh.maps.util.dom.addClass(this._root_pane, 'ollehmap-drag');
    if(!this._map.getOption('disableDraggingCursor'))
      this._map.setCursor('dragging');
    if(this._opts.dragInertia) {
      this._times = [];
      this._points = [];
    }
  },
  
  $default_drag: function (event, payload) {
    var point = event.getPoint();
    
    if (!point) return;
    var movementXY = payload.movementXY;
    var newCenter = this.calcNewCenter(-movementXY.x, -movementXY.y);
    this.moveTo(newCenter, null, 'off');
    
    if(this._opts.dragInertia) {
      var time = event.timeStamp;
      this._times.push(time);
      this._points.push(point);
    }
  },
  
  $default_dragend: function (event, payload) {
    var opts = this._opts;
    var time = event.timeStamp;
    var lastIndex = this._times.length - 1;
    var i = Math.max(0, Math.min(lastIndex, 3)); // i 는 delay 를 측정하기 위해 사용될 event 의 뒤로부터 index
    var prevTime = this._times[lastIndex - i] || time;
    var delay = time - prevTime; // 뒤에서 i번째 event 와 마지막 event 간의 delay
    
    if(opts.dragInertia && delay / (i + 1) < opts.dragInertiaThreshold) {
      var direction = delay === 0 ? payload.movementXY : event.getPoint().subtract(this._points[lastIndex - i]);
      var momentum = this._momentum(delay, direction);
      var newCenter = this.calcNewCenter(momentum.x, momentum.y);
      this.moveTo(newCenter, null, 'on', momentum.duration);
    }
    olleh.maps.util.dom.removeClass(this._root_pane, 'ollehmap-drag');
    if(!this._map.getOption('disableDraggingCursor'))
      this._map.resetCursor();
  },
  
  
  _momentum: function (delay, direction) {
    var opts = this._opts;
    var easeLinearity = opts.panAnimEaseLinearity2 || 0.25;
    var inertiaDeceleration = opts.dragInertiaDeceleration;
    var duration = delay / 1000 || 0.1; // 0.1은 임시 테스트 값임 추후 변경해야함.
    var speedVector = direction.multiplyBy(easeLinearity / duration);
    var speed = speedVector.distanceTo(this._zeroPoint);
    speed = Math.min(speed, 2500); // 너무 멀리 이동하는것을 방지하기 위해 최대 speed 제한
    var deccelerationDuration = speed / (inertiaDeceleration * easeLinearity);
    var offset = speedVector.multiplyBy(-deccelerationDuration / 2)._round();
    return {x: offset.x, y: offset.y, duration: deccelerationDuration};
  }
  
});
/**
 * {@link olleh.maps.event.EventDelegator#event:req_zoomin}, {@link olleh.maps.event.EventDelegator#event:req_zoomout}
 * 이벤트를 처리하기 위한 핸들러이다.
 * @private
 */
$class('olleh.maps.handler.Zoom').define({
  
  /**
   * @param {Number}
   * @param {olleh.maps.Point}
   * @private
   */
  _calcZoomCenter: function (zoom, mousePx) {
    var viewportCenter = this.getViewportCenter();
    var scale = this._getScaleForZoom(zoom);
    // mouse cursor 의 화면 중심점과의 거리를 1-1/scale 로 나눈값, 1-1/scale 의 의미는?
    var centerOffsetPx = mousePx.subtract(viewportCenter)._multiplyBy(
        1 - 1 / scale);
    var newCenterPx = viewportCenter._add(centerOffsetPx);
    var coord = this.getCoordFromViewportPx(newCenterPx, false);
    return coord;
  },

  /**
   * @param {Number} zoom
   * @returns {Boolean}
   * @private
   */
  _checkZoomLevel: function (zoom) {
    var minZoom = this.getMinZoom();
    var maxZoom = this.getMaxZoom();
    return minZoom <= zoom && zoom <= maxZoom;
  },

  $default_req_zoomin: function (event, payload) {
    var zoom = this.getPendingZoom() + 1;

    event.stopPropagation();

    if (!this._checkZoomLevel(zoom))
      return;

    var mousePx = event.getPoint();
    if (!mousePx)
      return this.zoomIn(); // keyboardZoom 사용옵션 비교 추가해야함.
    var coord = this._calcZoomCenter(zoom, mousePx);
    this.panTo(coord, zoom);
  },

  $default_req_zoomout: function (event, payload) {
    var zoom = this.getPendingZoom() - 1;

    event.stopPropagation();
    if (!this._checkZoomLevel(zoom))
      return;
    var mousePx = event.getPoint();
    if (!mousePx)
      return this.zoomOut(); // keyboardZoom 사용옵션 비교 추가해야함.
    var coord = this._calcZoomCenter(zoom, mousePx);
    this.panTo(coord, zoom);
  }

});
/**
 * dblclick 이벤트가  {@link olleh.maps.Map} 에서 발생했을 때 처리를 담당한다.
 * 
 * {@link olleh.maps.Map} 클래스에 <code>olleh.maps.handler.DoubleClickZoom.prototype</code>을 mixin해서 사용한다.
 * @example
 * 등록해서 사용할 때
 * olleh.maps.mixin(map, olleh.maps.handler.DoubleClickZoom.prototype, true);
 * 해제해서 사용할 때
 * for(var key in olleh.maps.handler.DoubleClickZoom.prototype) {
 *   delete map[key];
 * }
 * @private
 */
$class('olleh.maps.handler.DoubleClickZoom').define({
  $default_dblclick: function (event) {
    return !this._opts.disableDoubleClickZoom && olleh.maps.handler.Zoom.
      prototype['$default_req_zoomin'].apply(this, arguments);
  },
  
  $default_dblrightclick: function (event) {
    return !this._opts.disableDoubleClickZoom && olleh.maps.handler.Zoom.
      prototype['$default_req_zoomout'].apply(this, arguments);
  }
});/**
 * @private
 */
$class('olleh.maps.plugin.DefautlHandlers').extend(olleh.maps.Adaptable).define({
  
  $static: {
    HANDLERS: [
      olleh.maps.handler.Drag, 
      olleh.maps.handler.Zoom
    ]
  },
  
  attach: function () {
    var map = this.map;
    var eventMgr = map.eventMgr;
    var layerMgr = map.layerMgr;
    var handlers = olleh.maps.plugin.DefautlHandlers.HANDLERS;
    var i = handlers.length;
    
    eventMgr.addRecognizer(new olleh.maps.event.Drag());

    if(!map.getOption('disableDoubleClickZoom')) 
      olleh.maps.event.handler.attach(layerMgr, 
          olleh.maps.handler.DoubleClickZoom);
    
    while(i--) {
      olleh.maps.event.handler.attach(layerMgr, handlers[i]);
    }
    olleh.maps.handler.Drag.attach(map);
  },
  
  detach: function () {
    var map = this.map;
    var eventMgr = map.eventMgr;
    var layerMgr = map.layerMgr;
    var handlers = olleh.maps.plugin.DefautlHandlers.HANDLERS;
    var i = handlers.length;
    
    eventMgr.removeRecognizer('olleh.maps.event.Drag');

    if(!map.getOption('disableDoubleClickZoom'))
      olleh.maps.event.handler.detach(layerMgr, 
          olleh.maps.handler.DoubleClickZoom);

    while(i--) {
      olleh.maps.event.handler.detach(layerMgr, handlers[i]);
    }
  }
  
});

olleh.maps.$skeleton.push(olleh.maps.plugin.DefautlHandlers);
/**
 * 더블클릭이 발생했는지 체크해서 발생하면 <code>dblclick</code> 이벤트를 생성할 수 있는 정보를 반환한다.
 * 데스크탑 브라우저에서만 해당 recognizer가 동작한다.
 * @summary <code>dblclick</code> 이벤트를 생성하기 위해 마우스 이벤트를 추적한다.
 */
$class('olleh.maps.event.DoubleClick').mixin(olleh.maps.event.Recognizer).define({

  /**
   * 생성자, 새로운 DoubleClick 객체를 생성한다.
   * @param {Object} [opts] zoom 옵션
   * @param {Boolean} [opts.dblrightclick=true] 우클릭여부
   * @param {Number} [opts.clickThreshold=4] 이전 클릭과의 유효 거리(px)
   * @param {Number} [opts.clickDuration=400] 이전 클릭과의 유효 timestamp(ms) 
   */
  DoubleClick: function (opts) {
    this.isDblclicked = false;
    this._history = {};
    this.opts = olleh.maps.mixin({
      clickThreshold: 4,
      dblrightclick: true,
      clickDuration: 400
    }, opts, true);
    this.setEnabled(true);
  },
  
  /**
   * 옵션을 설정한다.
   * @param {Object} [opts] 옵션
   * @param {Boolean} [opts.dblrightclick=true] 우클릭더블탭여부
   * @param {Number} [opts.clickThreshold=4] 이전 클릭과의 유효 거리(px).
   * @param {Number} [opts.clickDuration=400] 이전 클릭과의 유효 timestamp(ms). 
   */
  setOptions: function (opts) {
    opts && olleh.maps.mixin(this.opts, opts, true, 
        ['dblrightclick', 'clickThreshold', 'clickDuration']);
  },
  
  /**
   * @param {olleh.maps.event.Event} event
   * @private
   */
  mousedown: function (event) {
    var prevClick = this._history['click'];
    
    this.isDblclicked = false;
    
    if (!prevClick) return;
    if (event.timeStamp - prevClick.timeStamp > this.opts.clickDuration) {
      this._history['click'] = null;
      return;
    }

    this._history['mouse'] = {
      timeStamp: event.timeStamp,
      pageXY: event.pageXY,
      button: event.originEvent.button
    };
  },
  
  /**
   * @param {olleh.maps.event.Event} event
   * @private
   */
  mouseup: function (event) {
    var prevClick = this._history['click'];
    var domEvent = event.originEvent;

    if (!this.isDblclicked && this.opts.dblrightclick && !prevClick && 
        olleh.maps.event.EventManager.isRightClick(event.originEvent)) {
      return this.click(event);
    } else if (!prevClick) {
      return;
    }
    var click = this._history['mouse'] || {pageXY: event.pageXY, 
      button: domEvent.button === 1 ? 0 : 2};

    this._history['click'] = null;
    this._history['mouse'] = null;
    
    if (prevClick && prevClick.button === click.button &&
        prevClick.pageXY.distanceTo(click.pageXY) < this.opts.clickThreshold) {
      this.isDblclicked = true;
      return {name: click.button === 2 ? 'dblrightclick' : 'dblclick', opts: {originEvent: domEvent}};
    }
    return;
  },
  
  /**
   * @param {olleh.maps.event.Event} event
   * @private
   */
  click: function (event) {
    if (this.isDblclicked) {
      this.isDblclicked = false;
      return;
    }
    this._history['click'] = {
      timeStamp: event.timeStamp,
      pageXY: event.pageXY,
      button: event.originEvent.button
    };
  }
});/**
 * 오른쪽 클릭이 발생했는지 체크해서 발생하면 <code>rightclick</code> 이벤트를 생성할 수 있는 정보를 반환한다.
 * <p/>
 * 데스크탑 브라우저에서만 해당 recognizer가 동작한다. 
 * @summary <code>rightclick</code> 이벤트를 생성하기 위해 마우스 이벤트를 추적한다.
 */
$class('olleh.maps.event.RightClick').mixin(olleh.maps.event.Recognizer).define({
  
  /**
   * 생성자, 새로운 RightClick 객체를 생성한다.
   */
  RightClick: function () {
    this.setEnabled(true);
  },
  
  /**
   * @param {olleh.maps.event.Event} event
   * @private
   */
  mouseup: function (event) {
    var domEvent = event.originEvent;
    return olleh.maps.event.EventManager.isRightClick(domEvent) ? 
        {name: 'rightclick', opts: {originEvent: domEvent}} : null; 
  }
});/**
 * 마우스휠을 체크해서 <code>req_zoomin</code>, <code>req_zoomout</code> 이벤트를 생성할 수 있는 정보를 반환한다.
 * <p/>
 * 데스크탑 브라우저에서만 해당 recognizer가 동작한다.
 * @summary <code>req_zoomin</code>, <code>req_zoomout</code> 이벤트를 생성하기 위해 마우스휠 이벤트에 대한 추적을 수행한다.
 */
$class('olleh.maps.event.ScrollWheelZoom').mixin(olleh.maps.event.Recognizer).define({
  
  /**
   * 생성자, 새로운 ScrollWheelZoom 객체를 생성한다.
   */
  ScrollWheelZoom: function () {
    this._timeStamp = null;
    this.setEnabled(true);
  },
  
  /**
   * @param {olleh.maps.event.Event} event
   * @private
   */
  mousewheel: function (event) { // mousewheel, DOMMouseScroll
    var domEvent = event.originEvent;
    var delta = domEvent.wheelDelta || -domEvent.detail;  // FF:detail
    var timeStamp = this._timeStamp;

    this._timeStamp = event.timeStamp;
    
    if (timeStamp && event.timeStamp - timeStamp < 100) {
      return null;
    }
    return {name: delta > 0 ? 'req_zoomin' : 'req_zoomout', opts: {originEvent: domEvent}};
  }
});/**
 * 키보드 +, -가 눌러졌는지 체크해서 <code>req_zoomin</code>, <code>req_zoomout</code> 이벤트를 생성할 수 있는 정보를 반환한다.
 * <p/>
 * 데스크탑 브라우저에서만 해당 recognizer가 동작한다.
 * @summary <code>req_zoomin</code>, <code>req_zoomout</code> 이벤트를 생성하기 위해 키보드 이벤트를 추적한다.
 */
$class('olleh.maps.event.KeyboardZoom').mixin(olleh.maps.event.Recognizer).define({

  /**
   * 생성자, 새로운 KeyboardZoom 객체를 생성한다.
   */
  KeyboardZoom: function () {
    this.setEnabled(true);
  },
  
  /**
   * @param {olleh.maps.event.Event} event
   * @private
   */
  keydown : function (event) { // keypress
    
    if (!olleh.maps.event.EventManager.checkEnabledKeyevent()) return;
    
    var domEvent = event.originEvent;
    var keyCode = domEvent.which || domEvent.keyCode;

    switch(keyCode) {
      case 107: // +
      case 187: // =+
      case 61: // =+
        return {name: 'req_zoomin'};
      case 109: // -
      case 189: // -_
      case 173: // FF -_
        return {name: 'req_zoomout'};
    }
  }
});/**
 * 브라우저가 데스크탑인 경우 {@link olleh.maps.Map}에 이벤트가 발생했을 때 처리를 담당한다.
 * {@link olleh.maps.Map} 클래스에 <code>olleh.maps.handler.Desktop.prototype</code>을 mixin해서 사용한다.
 * @example
 * 등록해서 사용할 때
 * olleh.maps.mixin(map, olleh.maps.handler.Desktop.prototype, true);
 * 해제해서 사용할 때
 * for(var key in olleh.maps.handler.Drag.prototype) {
 *   delete map[key];
 * }
 * @private
 */
$class('olleh.maps.handler.Desktop').define({

  $capture_mousedown: function (event, payload) {
    this._abortPanAnimationAndUpdateCenter();
  },
  
  $default_mousewheel: function (event, payload) {
    olleh.maps.event.EventManager.preventDefault(event.originEvent);
  }
 
});
/**
 * key 이벤트를 받아 방향키인 경우 지도를 이동시키기 위한 핸들러
 * @private
 */
$class('olleh.maps.handler.Keyboard').define({
  
  $default_keydown: function (event, payload) {
    var EventManager = olleh.maps.event.EventManager;

    if (!EventManager.checkEnabledKeyevent()) return;
    
    var domEvent = event.originEvent;
    var keyCode = domEvent.which || domEvent.keyCode;
    var moveSize = 2; // map 옵션으로 빼는 것이 좋을 거 같음.
    

    switch(keyCode) { // 37 38 39 40 < ^ > v
      case 33: // page up
        this._keymoveX = moveSize;
        this._keymoveY = -moveSize;
        break;
      case 34: // page down
        this._keymoveX = moveSize;
        this._keymoveY = moveSize;
        break;
      case 35: // end
        this._keymoveX = -moveSize;
        this._keymoveY = moveSize;
        break;
      case 36: // home
        this._keymoveX = -moveSize;
        this._keymoveY = -moveSize;
        break;
      case 37: // left
        this._keymoveX = -moveSize;
       break;
      case 38: // up
        this._keymoveY = -moveSize;
        break;
      case 39: // right
        this._keymoveX = moveSize;
        break;
      case 40: // down
        this._keymoveY = moveSize;
        break;
      default:
        if (this._moveTimeout) {
          window.clearTimeout(this._moveTimeout); 
          delete this._moveTimeout;
        }
        return true;
    }
    this._keyboardMoveStart = true;
    
    EventManager.preventDefault(domEvent);
    EventManager.stopPropagation(domEvent);
    olleh.maps.util.deferAF(this._keyboardMove, this, event);
  },
  
  $default_keyup: function (event, payload) {
    var EventManager = olleh.maps.event.EventManager;

    if (!EventManager.checkEnabledKeyevent()) return;
    
    if (this._moveTimeout) {
      window.cancelAnimationFrame(this._moveTimeout);
      delete this._moveTimeout;
    }
    var domEvent = event.originEvent;
    var keyCode = domEvent.which || domEvent.keyCode;

    switch(keyCode) { // 37 38 39 40 < ^ > v
      case 33: // page up
      case 34: // page down
      case 35: // end
      case 36: // home
        this._keymoveX = 0;
        this._keymoveY = 0;
        break;
      case 37: // left
      case 39: // right
        this._keymoveX = 0;
       break;
      case 38: // up
      case 40: // down
        this._keymoveY = 0;
        break;
      default:
        return true;
    }
    EventManager.preventDefault(domEvent);
    EventManager.stopPropagation(domEvent);
    return false;
  },
  
  /**
   * @param {DOMTimeStamp} time
   * @param {olleh.maps.event.Event} event
   * @private
   */
  _keyboardMove: function (time, event) {
    
    if (!this._eventMgr.isMapClicked()) {
      window.cancelAnimationFrame(this._moveTimeout); 
      delete this._moveTimeout;
      return;
    }

    if (this._keyboardMoveStart && this._keymoveX || this._keymoveY) {
      var newCenter = this.calcNewCenter(this._keymoveX || 0, this._keymoveY || 0);
      this.moveTo(newCenter, null, 'off');
      this._moveTimeout = olleh.maps.util.deferAF(this._keyboardMove, this, event);
    } else {
      if (this._moveTimeout || !this._eventMgr._ok) {
        window.cancelAnimationFrame(this._moveTimeout); 
        delete this._moveTimeout;
      }
    }
  }

});
/**
 * shift 키를 누르고 마우스 drag할 때 해당 영역이 표시되고 해당영역으로 zoom 되는 핸들러
 * @private
 */
$class('olleh.maps.handler.BoxZoom').define({

  $current_dragstart: function (event, payload) {
    // boxZoom 사용여부 체크 추가해야함
    var domEvent = event.originEvent;
    var keyCode = domEvent.which || domEvent.keyCode;
    var shiftKey = domEvent.shiftKey;
    var button = domEvent.button !== 1;
    var dom = this._boxZoomElem;
    
    if (!shiftKey || (keyCode !== 1 && button)) return;

    event.preventDefault();
    
    this._dragStartPosition = event.getPoint();
    this._boxZoomStart = true;
    
    if (!dom) {
      dom = this._boxZoomElem = document.createElement('div');
      olleh.maps.util.dom.addClass(dom, 'ollehmap-boxzoom');
    }
    var divStyle = dom.style;
    var px = this._dragStartPosition;
    
    divStyle.width = 0;
    divStyle.height = 0;
    divStyle.top = px.y + 'px';
    divStyle.left = px.x + 'px';
    
    this._layer_container.appendChild(dom);
  },
  
  $current_drag: function (event, payload) {
    if (!this._boxZoomStart) return; // boxZoom 사용여부 체크 추가해야함
    
    var px = event.getPoint();
    var dragStartPx = this._dragStartPosition;
    var x = Math.abs(px.x - dragStartPx.x);
    var y = Math.abs(px.y - dragStartPx.y);
    var divStyle = this._boxZoomElem.style; 
    
    event.preventDefault();
    divStyle.width =  x + 'px';
    divStyle.height = y + 'px';
    
    px.y < dragStartPx.y && (divStyle.top = px.y + 'px');
    px.x < dragStartPx.x && (divStyle.left = px.x + 'px');
  },
  
  $current_dragend: function (event, payload) {
    if (!this._boxZoomStart) return; // boxZoom 사용여부 체크 추가해야함

    var px = event.getPoint();
    var left, right, top, bottom, leftBottom, rightTop;
    var dragStartPx = this._dragStartPosition;

    event.preventDefault();
    this._boxZoomStart = false;
    this._layer_container.removeChild(this._boxZoomElem);

    if (px.x > dragStartPx.x) {
      left = dragStartPx.x;
      right = px.x;
    } else {
      left = px.x;
      right = dragStartPx.x;
    }
    if (px.y > dragStartPx.y) {
      top = dragStartPx.y;
      bottom = px.y;
    } else {
      top = px.y;
      bottom = dragStartPx.y;
    }
    leftBottom = this.getCoordFromViewportPx(new olleh.maps.Point(left, bottom), false);
    rightTop = this.getCoordFromViewportPx(new olleh.maps.Point(right, top), false);
    
    leftBottom && rightTop && this.fitBounds(new olleh.maps.Bounds(leftBottom, rightTop));
  }

});/**
 * @private
 */
$class('olleh.maps.plugin.Desktop').extend(olleh.maps.Adaptable).define({
  
  $static: {
    HANDLERS: [
      olleh.maps.handler.Desktop, 
      olleh.maps.handler.BoxZoom,
      olleh.maps.handler.Keyboard
    ]
  },
  
  attach: function () {
    var map = this.map;
    var eventMgr = map.eventMgr;
    var layerMgr = map.layerMgr;
    var handlers = olleh.maps.plugin.Desktop.HANDLERS;
    var i = handlers.length;

    eventMgr.addRecognizer(new olleh.maps.event.RightClick());
    eventMgr.addRecognizer(new olleh.maps.event.DoubleClick());
    if(!map.getOption('disableScrollWheelZoom'))
      eventMgr.addRecognizer(new olleh.maps.event.ScrollWheelZoom());
    eventMgr.addRecognizer(new olleh.maps.event.KeyboardZoom());
    
    while(i--) {
      olleh.maps.event.handler.attach(layerMgr, handlers[i]);
    }
  },
  
  detach: function () {
    var map = this.map;
    var eventMgr = map.eventMgr;
    var layerMgr = map.layerMgr;
    var handlers = olleh.maps.plugin.Desktop.HANDLERS;
    var i = handlers.length;
    
    eventMgr.removeRecognizer('olleh.maps.event.RightClick');
    eventMgr.removeRecognizer('olleh.maps.event.DoubleClick');
    eventMgr.removeRecognizer('olleh.maps.event.ScrollWheelZoom');
    eventMgr.removeRecognizer('olleh.maps.event.KeyboardZoom');

    while(i--) {
      olleh.maps.event.handler.detach(layerMgr, handlers[i]);
    }
  }
  
});

olleh.maps.$skeleton.push(olleh.maps.plugin.Desktop);
/**
 * CopyrightControl은 지도 제공업체의 권한을 표시하기 위한 컨트롤로 기본 위치는 우측 하단이다.
 */
$class('olleh.maps.control.CopyrightControl').extend(olleh.maps.control.Control).define({
    $static: {
        /**
         * @private
         * @constant
         * @type string
         */
        CONTENT: olleh.maps.env.TILE_COPYRIGHT.BASE
    },

    /**
     * 생성자, 새로운 CopyrightControl 객체를 생성한다.
     * @example
     * var map;
     * var copyrightControl = new olleh.maps.control.CopyrightControl({
     *     position: olleh.maps.control.Control.BOTTOM_RIGHT,
     *     direction: olleh.maps.control.Control.VERTICAL
     * });
     * copyrightControl.setMap(map);
     * @param {olleh.maps.control.ControlOptions} [opts] CopyrightControl 생성 옵션.<br>
     * opts.position 기본값 : {@link olleh.maps.control.Control.BOTTOM_LEFT}<br>
     * opts.direction 기본값 : {@link olleh.maps.control.Control.HORIZONTAL}
     */
    CopyrightControl: function (opts) {
        var Control = olleh.maps.control.Control;
        var _opts = olleh.maps.mixin({
            position: Control.BOTTOM_LEFT,
            direction: Control.HORIZONTAL
        }, opts, true);

        this.position = _opts.position;
        this.direction = _opts.direction;
    },

    /**
     * 컨트롤을 그린다.
     * @returns {olleh.maps.Element} 최상위 element
     * @see olleh.maps.control.Control#draw
     */
    draw: function () {
      var elem = olleh.maps.Element.create('div').addClass('ollehmap-copyright-control').setStyle('margin', '5px');

      if(!this.map.hasMobileStylesheet){
        this.contentElem = olleh.maps.Element.create('span');
        elem.appendChild(this.contentElem);
        this.map.onEvent('maptypeid_changed', this._updateContent, this);
        this._updateContent();
      }

      return elem;
    },

    /**
     * mapTypeId 변경 시 copyright 문구를 변경한다.
     * @private
     */
    _updateContent: function () {
        var content;
        var activeBaseLayer = this.map.layerMgr.getActiveBaseLayer();
        if (activeBaseLayer) content = activeBaseLayer.copyright;
        if (olleh.maps.isUndefined(content)) content = olleh.maps.control.CopyrightControl.CONTENT;
        if(this.contentElem.elem.innerHTML !== content) {
            this.contentElem.elem.innerHTML = content;
        }
    },

    detach: function () {
        var map = this.mgr.map;
        !olleh.maps.browser.isMobile && map.unsubscribeEvent('maptypeid_changed', this._updateContent, this);
        olleh.maps.control.CopyrightControl.$super.detach.apply(this, arguments);
    }
});

/**
 * LogoControl 지도 제공업체의 권한을 표시하기 위한 컨트롤로 기본 위치는 우측 하단이다.
 */
$class('olleh.maps.control.LogoControl').extend(olleh.maps.control.Control).define({
  $static: {
    /**
     * @private
     * @constant
     * @type string
     */
    CONTENT: olleh.maps.env.TILE_COPYRIGHT.BASE
  },

  /**
   * 생성자, 새로운 LogoControl 객체를 생성한다.
   * @example
   * var map;
   * var LogoControl = new olleh.maps.control.LogoControl({
   *     position: olleh.maps.control.Control.BOTTOM_RIGHT,
   *     direction: olleh.maps.control.Control.VERTICAL
   * });
   * @property {Boolean} [logoControl=true] LogoControl 생성 여부.
   * @property {olleh.maps.control.LogoControlOptions} [LogoControlOptions] LogoControl 옵션
   * LogoControl.setMap(map);
   * @param {olleh.maps.control.ControlOptions} [opts] LogoControl 생성 옵션.<br>
   * opts.position 기본값 : {@link olleh.maps.control.Control.BOTTOM_RIGHT}<br>
   * opts.direction 기본값 : {@link olleh.maps.control.Control.HORIZONTAL}
   */
  LogoControl: function (opts) {
    var Control = olleh.maps.control.Control;
    var _opts = olleh.maps.mixin({
      position: Control.BOTTOM_RIGHT,
      direction: Control.HORIZONTAL
    }, opts, true);

    this.position = _opts.position;
    this.direction = _opts.direction;
  },

  /**
   * 컨트롤을 그린다.
   * @returns {olleh.maps.Element} 최상위 element
   * @see olleh.maps.control.Control#draw
   */
  draw: function () {
    var elem = olleh.maps.Element.create('div')

    if(this.map.hasMobileStylesheet){
      elem.addClass('mobile-logo');
      if(olleh.maps.browser.isHD) {
        elem.addClass('retina').setStyle('backgroundImage', 'url(' + olleh.maps.env.RESOURCE_URL + 'img/retinas.png)');
        //elem.setStyle('backgroundImage', 'url(../../resources/img/mobiles.png)');
      } else{
        elem.setStyle('backgroundImage', 'url(' + olleh.maps.env.RESOURCE_URL + 'img/mobiles.png)');
        //elem.setStyle('backgroundImage', 'url(../../resources/img/mobiles.png)');
      }
    } else {
      elem.addClass('ollehmap-logo-control');
      elem.setStyle('backgroundImage', 'url(' + olleh.maps.control.Control.IMG_URL + ')');
    }
    
    //초기 mapType이 일반지도가 아닐경우
    if(this.mgr.map.getMapTypeId() !== olleh.maps.Map.ROADMAP){
      if(this.mgr.map.getMapTypeId() !== olleh.maps.Map.ENGMAP){
       elem.addClass('imagery')
      }
    }

    return elem;
  },

  detach: function () {
    olleh.maps.control.LogoControl.$super.detach.apply(this, arguments);
  },

  _updateActiveBaseLayer: function () {
    var layerMgr = this.mgr.map.layerMgr;
    var mode = layerMgr.getActiveBaseLayer();
    
    if(this.elem && mode) {
      if(mode.logoType === 'black') {
        this.elem.removeClass('imagery');
      } else {
        this.elem.addClass('imagery');
      }
    }
  },

  attach: function() {
    olleh.maps.control.LogoControl.$super.attach.apply(this, arguments);
    this.map.onEvent('set_base_layer', this._updateActiveBaseLayer, this);
  },

  detach: function() {
    this.map.unsubscribeEvent('set_base_layer', this._updateActiveBaseLayer, this);
    olleh.maps.control.LogoControl.$super.detach.apply(this, arguments);
  }

});

/**
 * 지도의 축적을 표시하기 위한 컨트롤로 기본 위치는 좌측 하단이다.
 */
$class('olleh.maps.control.ScaleControl').extend(olleh.maps.control.Control).define({
  /**
   * 생성자, 새로운 ScaleControl 객체를 생성한다.
   * @example var map; var ns = olleh.maps.control; var scaleControl = new
   *          olleh.maps.control.ScaleControl({ position:
   *          ns.Control.BOTTOM_LEFT, direction: ns.Control.HORIZONTAL });
   *          scaleControl.setMap(map);
   * @param {olleh.maps.control.ControlOptions} [opts] ScaleControl 생성 옵션<br>
   * opts.position 기본값 : {@link olleh.maps.control.Control.BOTTOM_LEFT}<br>
   * opts.direction 기본값 : {@link olleh.maps.control.Control.HORIZONTAL}
   */
   ScaleControl: function (opts) {
     var Control = olleh.maps.control.Control;
     var _opts = olleh.maps.mixin({
       position: Control.BOTTOM_RIGHT,
       direction: Control.HORIZONTAL
     }, opts, true);

     this.scaleImg = null;
     this.scaleStr = null;
     this.topOutUnits = 'km';
     this.topInUnits = 'm';
     this.position = _opts.position;
     this.direction = _opts.direction;
   },

   /**
   * 컨트롤을 그린다.
   * @returns {olleh.maps.Element} 최상위 element
   * @see olleh.maps.control.Control#draw
   */
   draw: function () {
     var elem = olleh.maps.Element.create('div').addClass('ollehmap-scale-control')
     this.scaleImg = olleh.maps.Element.create('div').addClass('ollehmap-scale-image')
     this.scaleStr = olleh.maps.Element.create('div');

     // 초기값이 일반지도가 아닐경우
     if(this.mgr.map.getMapTypeId() !== olleh.maps.Map.ROADMAP){
        if(this.mgr.map.getMapTypeId() !== olleh.maps.Map.ENGMAP){
         this.scaleImg.addClass('imagery')
        }
     }

     elem.pushElement(this.scaleImg);
     elem.pushElement(this.scaleStr);
     this._update();
     return elem;
  },

  _update: function () {
    var layerMgr = this.mgr.map.layerMgr;
    var res = layerMgr.getResolution();
    if (!res)
        return;

    var inches = olleh.maps.util.INCHES_PER_UNIT;
    var maxSizeData = 50 * res * inches['Meter'];
    var topUnits;

    if (maxSizeData > 100000) {
        topUnits = this.topOutUnits;
    } else {
        topUnits = this.topInUnits;
    }
    var numTopMax = (maxSizeData / inches[topUnits]).toFixed(0);
    this.scaleStr.elem.innerHTML = numTopMax + topUnits;
  },
  
  _updateActiveBaseLayer: function () {
    var layerMgr = this.mgr.map.layerMgr;
    var mode = layerMgr.getActiveBaseLayer();
    
    if(this.scaleImg && mode) {
      if(mode.logoType === 'black') {
        this.scaleImg.removeClass('imagery');
      } else {
        this.scaleImg.addClass('imagery');
      }
    }
  },

  attach: function() {
    olleh.maps.control.ScaleControl.$super.attach.apply(this, arguments);
    this.map.onEvent('zoom_changed', this._update, this);
    this.map.onEvent('set_base_layer', this._updateActiveBaseLayer, this);
  },

  detach: function() {
    this.map.unsubscribeEvent('zoom_changed', this._update, this);
    this.map.unsubscribeEvent('set_base_layer', this._updateActiveBaseLayer, this);
    olleh.maps.control.ScaleControl.$super.detach.apply(this, arguments);
  }
});

/**
 * PanControl은 지도를 이동하기 위한 버튼으로 구성된 컨트롤로 기본 위치는 좌측 상단이다.
 */
$class('olleh.maps.control.PanControl').extend(olleh.maps.control.Control).define(
{
  $static: {

    /**
     * @constant
     * @type Number
     */
    SLIDE_FACTOR: 200,

    /**
     * @constant
     * @type Object
     */
    PAN_INFO: {
      'panup': {
        desc: '위로 이동',
        origin: new olleh.maps.Point(25, 6)
      },
      'panleft': {
        desc: '왼쪽으로 이동',
        origin: new olleh.maps.Point(8, 23)
      },
      'panright': {
        desc: '오른쪽으로 이동',
        origin: new olleh.maps.Point(44, 23)
      },
      'pandown': {
        desc: '아래로 이동',
        origin: new olleh.maps.Point(24, 44)
      }
    }
  },

  /**
   * 생성자, 새로운 PanControl 객체를 생성한다.
   * @example var map; var ns = olleh.maps.control; var panControl = new
   *          olleh.maps.control.PanControl({ position: ns.Control.TOP_LEFT,
   *          direction: ns.Control.VERTICAL }); panControl.setMap(map);
   * @param {olleh.maps.control.ControlOptions} [opts] PanControl 생성 옵션<br>
   * opts.position 기본값 : {@link olleh.maps.control.Control.TOP_LEFT}<br>
   * opts.direction 기본값 : {@link olleh.maps.control.Control.VERTICAL}
   */
  PanControl: function (opts) {
    var Control = olleh.maps.control.Control;
    var _opts = olleh.maps.mixin({
      position: Control.TOP_LEFT,
      direction: Control.VERTICAL
    }, opts, true);

    this.position = _opts.position;
    this.direction = _opts.direction;
    this.panBtns = [];
  },

  /**
   * 컨트롤을 그린다.
   * @returns {olleh.maps.Element} 최상위 element
   * @see olleh.maps.control.Control#draw
   */
  draw: function () {
    var btn, info;
    var panInfos = olleh.maps.control.PanControl.PAN_INFO;
    var elem = olleh.maps.Element.create('div').setStyles({
      padding: this.padding + 'px',
      position: 'relative'
    });
    var pan = olleh.maps.Element.create('div').addClass('control-pan').setStyle(
        'backgroundImage', 'url(' + olleh.maps.env.RESOURCE_URL + 'img/controls.png)');

    elem.appendChild(pan);

    for ( var i in panInfos) {
      info = panInfos[i];
      btn = this[i + 'Btn'] = olleh.maps.Element.create('div').addClass('control-' + i).addClass(
          'ollehmap-control-clickable');
      btn.setStyles({
        backgroundImage: 'url(' + olleh.maps.env.RESOURCE_URL + 'img/controls.png)',
        left: info.origin.x + this.padding + 'px',
        top: info.origin.y + this.padding + 'px',
        position: 'absolute'
      });
      btn.setProperty('title', info.desc);
      elem.appendChild(btn);
      this.registerEventDom(btn.elem);
    }
    return elem;
  },

  propagateEvent: function (event, payload) {
    switch (event.getName()) {
    case 'mousedown':
    case 'touchstart':
      this.mousedown(event, payload);
      break;
    case 'mouseup':
    case 'touchend':
    case 'dragend':
    case 'mouseout':
      this.mouseup(event, payload);
      break;
    }
  },

  mousedown: function (event, payload) {
    var target = event.targetDOM;
    var moveSize = 2;
    this._pressTimeout = olleh.maps.util.delay(this.mousedown, 100, this, event);

    if (target === this.panupBtn.elem) {
      this._keymoveY = -moveSize;
    } else if (target === this.pandownBtn.elem) {
      this._keymoveY = moveSize;
    } else if (target === this.panleftBtn.elem) {
      this._keymoveX = -moveSize;
    } else if (target === this.panrightBtn.elem) {
      this._keymoveX = moveSize;
    }
    this._panMoveStart = true;
    olleh.maps.util.deferAF(this._panMove, this, event);
  },

  mouseup: function (event, payload) {
    var target = event.targetDOM;
    if (this._moveTimeout) {
      window.cancelAnimationFrame(this._moveTimeout);
      delete this._moveTimeout;
    }
    if (this._pressTimeout) {
      window.clearTimeout(this._pressTimeout);
      delete this._pressTimeout;
    }
    if (target === this.panupBtn.elem || target === this.pandownBtn.elem) {
      this._keymoveY = 0;
    } else if (target === this.panleftBtn.elem || target === this.panrightBtn.elem) {
      this._keymoveX = 0;
    } else {
      return;
    }
  },

  /**
   * @param {DOMTimeStamp} time
   * @param {olleh.maps.event.Event} event
   * @private
   */
  _panMove: function (time, event) {
    if (this._panMoveStart && this._keymoveX || this._keymoveY) {
      var lm = this.mgr.map.layerMgr;
      var newCenter = lm.calcNewCenter(this._keymoveX || 0, this._keymoveY || 0);
      lm.panTo(newCenter, lm.getZoom(), 'off');
      this._moveTimeout = olleh.maps.util.deferAF(this._panMove, this, event);
    } else {
      if (this._moveTimeout) {
        window.cancelAnimationFrame(this._moveTimeout);
        delete this._moveTimeout;
      }
    }
  }
});
/**
 * MapTypeControl 은 일반지도, 항공지도, 하이브리드, 영문지도 중 하나를 기본 맵 타입으로 선택하는 기능을 제공하는 컨트롤이다.
 */
$class('olleh.maps.control.MapTypeControl').extend(olleh.maps.control.Control).define({
  $static: {

    /**
     * 기본 맵 타입들
     * @constant
     * @type Array
     */
    DEFAULT_MAP_TYPE: [ 'roadmap', 'satellite', 'hybrid', 'engmap' ]
  },

  /**
   * MapTypeControl 생성자
   * @param {olleh.maps.control.ControlOptions} [opts] MapTypeControl 생성 옵션<br>
   * opts.position 기본값 : {@link olleh.maps.control.Control.TOP_RIGHT}<br>
   * opts.direction 기본값 : {@link olleh.maps.control.Control.VERTICAL}
   */
  MapTypeControl: function (opts) {
    var Control = olleh.maps.control.Control;
    this.position = Control.TOP_RIGHT;
    this.direction = Control.VERTICAL;
  },

  /**
   * 컨트롤을 그린다.
   * @returns {olleh.maps.Element} 최상위 element
   * @see olleh.maps.control.Control#draw
   */
  draw: function () {
    var elem = olleh.maps.Element.create('div');
    var names = olleh.maps.control.MapTypeControl.DEFAULT_MAP_TYPE;
    var backgroundImage = 'url('+ olleh.maps.control.Control.IMG_URL + ')';
    var len = names.length;
    var btn, name;

    this._btnList = {};
    elem.setStyles({
      padding: this.padding + 'px',
      position: 'relative'
    });

    for(var i = 0 ; i < len ; i++){
      name = names[i].toLowerCase();
      if(name == 'engmap' && !this.mgr.map.getUseEngMap()) continue;
      btn = olleh.maps.Element.create('div').addClass('control-'+name+'-out').addClass('olleh-maps-inline').addClass('ollehmap-control-clickable');
      btn.setStyle('backgroundImage', backgroundImage);
      btn.elem.name = name;
      elem.appendChild(btn);
      this.registerEventDom(btn.elem);
      this._btnList[name] = btn;
    }

    this._changeButtonState(this.map.getMapTypeId());
    return elem;
  },

  propagateEvent: function (event, payload) {
    switch (event.getName()) {
    case 'mouseup':
    case 'touchend':
      var target = event.targetDOM;
      this._click(target);
      break;
    }
  },

  /**
   * @private
   * @param {HTMLElement} target
   */
  _click: function (target) {
    var typeId = target.name;
    typeId && this._changeButtonState(typeId);
  },

  /**
   * @param key
   * TODO: 이전 선택된 타입을 저장한 후 처리하도록 수정하는 것이 좋을듯.
   */
  _changeButtonState: function (key) {
    if (!key) {
      olleh.maps.log.warn('_changeButtonState: key is null', this);
      return;
    }
    var list = this._btnList;
    var mapTypeId = key.toUpperCase();
    var classKey = key.toLowerCase();

    this.map.setMapTypeId(mapTypeId);
    for ( var k in list) {
      list[k].removeClass('control-' + k + (k === classKey ? '-out' : '-selected'));
      list[k].addClass('control-' + k + (k === classKey ? '-selected' : '-out'));
    }
  },

  _onMapTypeIdChanged: function() {
    if(this.isDrawn()) {
      var mapTypeId = this.map.getMapTypeId();
      this._changeButtonState(mapTypeId);
    }
  },

  attach: function() {
    olleh.maps.control.MapTypeControl.$super.attach.apply(this, arguments);
    this.map.onEvent('maptypeid_changed', this._onMapTypeIdChanged, this); 
  },

  detach: function() {
    this.map.unsubscribeEvent('maptypeid_changed', this._onMapTypeIdChanged, this);
    olleh.maps.control.MapTypeControl.$super.detach.apply(this, arguments);
  }

});
/**
 * ZoomControlOptions Object Specification
 * @typedef olleh.maps.control.ZoomControlOptions
 * @extends olleh.maps.control.ControlOptions
 * @property {String} [style] 컨트롤 스타일 정보. 모바일기기에서의 기본값은
 *           {@link olleh.maps.control.ZoomControl.LARGE}이다. <p/> 허용하는 값:
 *           <ul>
 *           <li>{@link olleh.maps.control.ZoomControl.LARGE}</li>
 *           <li>{@link olleh.maps.control.ZoomControl.SMALL}</li>
 *           </ul>
 */

/**
 * ZoomControl은 지도의 줌레벨을 조정하기 위한 컨트롤로 기본 위치는 우측 상단이다.
 */
$class('olleh.maps.control.ZoomControl').extend(olleh.maps.control.Control).define({
  $static: {

    /**
     * 기본타입. 현재는 <code>olleh.maps.control.ZoomControl.LARGE</code>와 동일하다.
     * @type String
     */
    DEFAULT: 'default',

    /**
     * zoomBar와 zoomButton으로 구성된 스타일
     * @type String
     */
    LARGE: 'large',

    /**
     * 줌인, 줌아웃버튼으로 구성된 스타일
     * @type String
     */
    SMALL: 'small',

    /**
     * @constant
     * @type Object
     */
    ZOOM_INFO: {
      // [1,3,5,8,11];
      1: '전국',
      3: '도',
      5: '시군구',
      8: '동리',
      11: '거리',
      13: '새주소'
    }
  },

  /**
   * 생성자, 새로운 ZoomControl 객체를 생성한다.
   * @example var map; var ns = olleh.maps.control; var zoomControl = new
   *          olleh.maps.control.ZoomControl({ position: ns.Control.TOP_RIGHT,
   *          direction: ns.Control.VERTICAL, style: ns.ZoomControl.LARGE });
   *          zoomControl.setMap(map);
   * @param {olleh.maps.control.ZoomControlOptions} [opts] ZoomControl 생성 옵션 <br>
   * opts.position 기본값 : opts.position={@link olleh.maps.control.Control.TOP_RIGHT}<br>
   * opts.direction 기본값 : {@link olleh.maps.control.Control.VERTICAL}<br>
   * opts.style 기본값 : {@link olleh.maps.control.ZoomControl.LARGE}
   */
  ZoomControl: function (opts) {
    var ns = olleh.maps.control;
    var _opts = olleh.maps.mixin({
      position: ns.Control.TOP_RIGHT,
      direction: ns.Control.VERTICAL,
      style: ns.ZoomControl.LARGE
    }, opts, true);

    this.position = _opts.position;
    this.direction = _opts.direction;
    this.style = _opts.style;

    this._gradation = 9;
    this._zoom = null;
  },

  /**
   * 컨트롤을 그린다.
   * @returns {olleh.maps.Element} 최상위 element
   * @see olleh.maps.control.Control#draw
   */
  draw: function () {
    var elem = olleh.maps.Element.create('div').addClass('ollehmap-zoom-control').setStyles({
      padding: this.padding + 'px'
    });

    this.elem = elem;
    if(this.style === olleh.maps.control.ZoomControl.SMALL) {
      this._drawSmallZoom(elem);
    } else {
      this._drawBigZoom(elem);
    }
    return elem;
  },

  /**
   * @private
   * @param parent {olleh.maps.Element}
   */
  _drawSmallZoom: function (parent) {
    this._addZoomBtn(parent, 'zoomin').setProperty('title', '확대');
    this._addZoomBtn(parent, 'zoomout').setProperty('title', '축소');
  },

  /**
   * @private
   * @param parent {olleh.maps.Element}
   */
  _drawBigZoom: function (parent) {
    var map = this.mgr.map;

    this._btnY = 26;
    this._resetMinMaxZoom();
    this._drawZoomInfo(parent);
    this._addAbsoluteImgBtn(parent, 'zoomslider', new olleh.maps.Point(8, 0));
    this._addZoomBtn(parent, 'zoomin').setProperty('title', '확대');
    this._drawZoomBar(parent);
    this._addZoomBtn(parent, 'zoomout').setProperty('title', '축소');
    this.zoomoutBtn.setStyle('margin-top', '-1px');
    this._updateSlider();
    this.zoomslider.addClass('ollehmap-control-clickable');
    this.registerEventDom(this.zoomslider.elem);
    map.onEvent('zoomrange_changed', this._updateZoomRange, this);
    map.onEvent('zoom_change', this._updateSlider, this);
    map.onEvent('zoom_changed', this._updateSlider, this);

    this._hideZoomInfo();
  },

  /**
   * @private
   * @param {olleh.maps.Element} parent
   */
  _drawZoomBar: function (parent) {
    var activeBar = this._activeBar = olleh.maps.Element.create('div').addClass('control-zoombar-active').addClass('ollehmap-control-clickable');
    var deactiveBar = this._deactiveBar = olleh.maps.Element.create('div').addClass('control-zoombar-deactive').addClass('ollehmap-control-clickable');
    deactiveBar.setStyle('backgroundImage', 'url('+ olleh.maps.env.RESOURCE_URL + 'img/controls.png)');
    activeBar.setStyle('backgroundImage', 'url('+ olleh.maps.env.RESOURCE_URL + 'img/controls.png)');
    parent.appendChild(deactiveBar.elem);
    parent.appendChild(activeBar.elem);
    this.registerEventDom(deactiveBar.elem);
    this.registerEventDom(activeBar.elem);
  },

  /**
   * @private
   * @param {olleh.maps.Element} parent
   */
  _drawZoomInfo: function (parent) {
    var point = new olleh.maps.Point(-35, 0);
    var info = olleh.maps.Element.create('div');
    var levels = olleh.maps.control.ZoomControl.ZOOM_INFO;
    for ( var level in levels) {
      this._addAbsoluteImgBtn(info, 'level' + level , point);
    }
    parent.elem.appendChild(info.elem);
    this._updateZoomInfo();
    this.zoomBarInfo = info;
  },


  /**
   * max/minZoom 변경 시 slider의 최대 최소 zoom level을 변경한다.
   * @private
   */
  _updateZoomRange: function () {
    this._resetMinMaxZoom();
    this._updateZoomInfo();
    this._updateSlider();
    this._setZoom(this.map.getZoom());
  },

  /**
   * slider 위치 변경
   * @private
   */
  _updateSlider: function (event, zoom) {
    if (!zoom) {
      this._setZoom(this.mgr.map.getZoom());
    } else if (zoom.newZoom !== this._zoom) {
      this._setZoom(zoom.newZoom);
    } 
  },

  _updateZoomInfo: function () {
    var levels = olleh.maps.control.ZoomControl.ZOOM_INFO;
    for ( var level in levels) {
      this._updateZoomLevelInfo(this['level' + level], level);
    }
  },

  _updateZoomLevelInfo: function (btn, zoom) {
    if (zoom >= this.minZoom && zoom <= this.maxZoom) {
      btn.setStyles({
        top: (this.maxZoom - zoom) * this._gradation + this.padding + this._btnY + 'px',
        display: 'block'
      });
    } else
      btn.setStyle('display', 'none');
  },

  _resetMinMaxZoom: function () {
    var map = this.mgr.map;
    this.maxZoom = map.getMaxZoom();
    this.minZoom = map.getMinZoom();
  },

  /**
   * @param {Number} zoom
   * @private
   */
  _setZoom: function (zoom) {
    this._zoom = zoom;
    var sliderOffset = 3;
    var sliderPosition = (this.maxZoom - zoom) * this._gradation + this.padding + this._btnY + sliderOffset;
    this.zoomslider.setStyle('top', sliderPosition + 'px');
    this._deactiveBar.setStyles({
      height: this._gradation * (this.maxZoom - zoom + 1) + 'px'
    });
    this._activeBar.setStyles({
      height: this._gradation * (zoom - this.minZoom + 1) + 'px'
    });
  },

  /**
   * @private
   * @param {olleh.maps.Element} parent
   * @param {String} id
   * @param {olleh.maps.Point} point
   * @returns {olleh.maps.Element} button
   */
  _addAbsoluteImgBtn: function (parent, id, size) {
    var btn = this[id] = olleh.maps.Element.create('div').addClass('control-' + id);
    btn.setStyles({
      backgroundImage: 'url(' + olleh.maps.env.RESOURCE_URL + 'img/controls.png)',
      left:size.x + 'px',
      top: size.y + 'px',
      position: 'absolute'
    });
    parent.appendChild(btn.elem);
    return btn;
  },

  /**
   * @private
   * @param {olleh.maps.Element} parent
   * @param {String} id
   * @returns {olleh.maps.Element} zoomButton
   */
  _addZoomBtn: function (parent, id) {
    var btn = olleh.maps.Element.create('div').addClass('control-' + id).addClass('ollehmap-control-clickable');
    btn.setStyles({
      backgroundImage: 'url(' + olleh.maps.env.RESOURCE_URL + 'img/controls.png)',
      display: 'block'
    });
    parent.appendChild(btn.elem);
    this.registerEventDom(btn.elem);
    this[id + 'Btn'] = btn;
    return btn;
  },

  /**
   * Zoomcontrol에 mouseover 시 zoomInfo가 보이도록 함
   * @private
   */
  _showZoomInfo: function () {
    this.zoomBarInfo && this.zoomBarInfo.setStyle('display', 'block');
  },

  /**
   * Zoomcontrol에 mouseout 시 zoomInfo가 보이지 않도록 함
   * @private
   */
  _hideZoomInfo: function () {
    this.zoomBarInfo && this.zoomBarInfo.setStyle('display', 'none');
  },

  propagateEvent: function (event, payload) {
    var target = event.targetDOM;
    switch (event.getName()) {
    case 'mouseover':
      this._showZoomInfo();
      break;
    case 'mouseout':
      this._hideZoomInfo();
      break;
    case 'dragstart':
      this.dragstart(target);
      break;
    case 'drag':
      this.drag(event, payload);
      break;
    case 'dragend':
      this.dragend(target);
      this.mouseup(target);
      break;
    case 'click':
    case 'rightclick':
      if (!this.isDraggable(target))
        return;
      this.dragFlag = true;
      this.drag(event, payload);
      this.dragFlag = false;
      break;
    case 'mousedown':
    case 'touchstart':
      this.mousedown(target);
      break;
    case 'mouseup':
    case 'touchend':
      this.mouseup(target);
      break;
    }
  },

  /**
   * @private
   * @param elem
   * @returns {boolean}
   */
  isDraggable: function (elem) {
    if (this.style === olleh.maps.control.ZoomControl.LARGE)
      return true;
    return false;
  },

  dragstart: function (target) {
    if (!this.isDraggable(target))
      return;
    this.zoomslider.addClass('ollehmap-dragging');
    this.dragFlag = true;
  },

  drag: function (event) {
    if (!this.dragFlag)
      return;
    var crTop = this.elem.elem.getBoundingClientRect().top;
    var initPt = event.originEvent.clientY - this._btnY - crTop - this.padding;
    var zoom = parseInt(this.maxZoom - (initPt / this._gradation) + 1);
    if (zoom <= this.maxZoom && zoom >= this.minZoom && zoom !== this._zoom) {
      this.mgr.map.setZoom(zoom);
    }
  },

  dragend: function (target) {
    if (this.zoomslider)
      this.zoomslider.removeClass('ollehmap-dragging');
    this.dragFlag = false;
  },

  mousedown: function (target) {
    var map = this.mgr.map;
    var action = null;
    if (target === this.zoominBtn.elem)
      action = map.zoomIn;
    else if (target === this.zoomoutBtn.elem)
      action = map.zoomOut;
    else
      return;
    action.apply(map);
    this._interval = window.setInterval(action.bind(map), 500);
  },

  mouseup: function (target) {
    if (this._interval) {
      window.clearTimeout(this._interval);
      delete this._interval;
    }
  },

  detach: function () {
    var map = this.mgr.map;
    map.unsubscribeEvent('zoomrange_changed', this._updateZoomRange, this);
    map.unsubscribeEvent('zoom_change', this._updateSlider, this);
    map.unsubscribeEvent('zoom_changed', this._updateSlider, this);
    olleh.maps.control.ZoomControl.$super.detach.apply(this, arguments);
  }
});
/**
 * PluginControl 은 Map 의 pluginRegstry 에 등록된 plugin 들을 사용자가 제어할 수 있도록 제공하는 Control 이다.
 */
$class('olleh.maps.control.PluginControl').extend(olleh.maps.control.Control).define({
  /**
   * PluginControl 을 생성한다.
   * @param {olleh.maps.control.ControlOptions} [opts] 생성 옵션<br>
   * opts.position 기본값 : {@link olleh.maps.control.Control.TOP_RIGHT}<br>
   * opts.direction 기본값 : {@link olleh.maps.control.Control.HORIZONTAL}
   */
  PluginControl: function (opts) {
    var Control = olleh.maps.control.Control;
    this.position = Control.TOP_RIGHT;
    this.direction = Control.HORIZONTAL;
    olleh.maps.mixin(this, opts, true);
  },
  
  attach: function() {
    olleh.maps.control.PluginControl.$super.attach.call(this);
    var pluginRegistry = this.mgr.map.pluginRegistry;
    pluginRegistry.onEvent('plugin_added', this._redrawItems, this);
    pluginRegistry.onEvent('plugin_state_changed', this._redrawItems, this);
  },
  
  detach: function() {
    var pluginRegistry = this.mgr.map.pluginRegistry;
    this.mgr.map.unsubscribeEvent('mouseover', this._hideExpand, this);
    pluginRegistry.unsubscribeEvent('plugin_added', this._redrawItems, this);
    pluginRegistry.unsubscribeEvent('plugin_state_changed', this._redrawItems, this);
    olleh.maps.control.PluginControl.$super.detach.call(this);
  },

  draw: function () {
    var elem = olleh.maps.Element.create('div').setStyles({
      padding: this.padding + 'px',
      position: 'relative'
    });

    this._drawExpandType(elem);
    this.registerEventDom(elem.elem);
    return elem;
  },

  _drawExpandType: function (parent) {
    var expandBtn = olleh.maps.Element.create('a');
    var form = this.form = olleh.maps.Element.create('form');

    parent.addClass('ollehmap-maptype-control-expandtype');
    expandBtn.addClass('ollehmap-maptype-control-toggle');
    form.addClass('ollehmap-maptype-control-list');
    expandBtn.setStyle('background', 'url('+ olleh.maps.env.RESOURCE_URL + 'img/layers.png)');
    this._drawItems(form);
    
    parent.pushElement(expandBtn.elem);
    parent.pushElement(form.elem);
  },
  
  /**
   * item 들을 지우고 다시 그린다.
   * @private
   */
  _redrawItems: function() {
    if(!this.form)
      return;
    var childs = this.form.elem.childNodes;
    var len = childs.length;
    while(len--) {
      this.form.removeChild(childs.item(len));
    }
    this._drawItems(this.form);
  },
  
  
  /**
   * item 들을 그린다.
   * @param {olleh.maps.Element} form
   * @private
   */
  _drawItems: function(form) {
    this.groups = this.mgr.map.pluginRegistry.getLabeledPluginsByGroup();
    this._drawList(form, this.groups['$baseLayer'], 'radio', '$baseLayer');
    for (var g in this.groups) {
      if(g !== '$baseLayer' && g !== '$nogroup') {
        this._drawSeparator(form);
        this._drawList(form, this.groups[g], 'checkbox');
      }
    }
    if(this.groups.$nogroup && this.groups.$nogroup.length) {
      this._drawSeparator(form);
      this._drawList(form, this.groups['$nogroup'], 'checkbox');
    }
  },
  

  /**
   * 구분자를 그린다.
   * @private
   * @param {olleh.maps.Element} parent
   */
  _drawSeparator: function (parent) {
    var separator = olleh.maps.Element.create('div').addClass(
        'ollehmap-maptype-control-separator');
    parent.appendChild(separator);
  },

  /**
   * 지정된 input type 으로 item 들을 그린다.
   * @private
   * @param {olleh.maps.Element} parent
   * @param {Object} list 출력될 baseLayer 혹은 group Object
   * @param {String} type input type
   * @param {String} name input name
   */
  _drawList: function (parent, list, type, name) {
    for (var i = 0, len = list.length ; i < len ; i++) {
      var plugin = list[i];
      if(plugin.name == 'OllehEng' && !this.mgr.map.getUseEngMap()) continue;
      this._drawChild(parent, plugin, type, name);
    }
  },

  /**
   * item 을 그린다.
   * @private
   * @param {olleh.maps.Element} parent
   * @param {String} label layer 혹은 group의 label
   * @param {String} plugin layer 혹은 group
   * @param {String} type input Type
   * @param {String} name input name
   */
  _drawChild: function (parent, plugin, type, name) {
    var div = olleh.maps.Element.create('div');
    var label = plugin.pluginInfo.label;
    
    var tmpl = '<input type="#{type}" name="#{name}" #{checked}>#{label}</input>';
    var html = olleh.maps.util.applyTemplate(tmpl,{
      type: type,
      name: name ? name : '',
      checked: plugin.isActive() ? 'checked="checked"' : '',
      label: label
    });
    div.elem.innerHTML = html;
    this.registerEventDom(div.elem);
    div.setProperty('data-value', plugin);
    div.setProperty('data-type', type);
    parent.appendChild(div);
  },

  _showExpand: function () {
    this.elem.addClass('ollehmap-maptype-control-expanded');
    if (!this._expanded) {
      this.mgr.map.onEvent('mouseover', this._hideExpand, this);
      this._expanded = true;
    }
  },

  _hideExpand: function (event, payload) {
    if (event.getSource() !== this) {
      this.elem && this.elem.removeClass('ollehmap-maptype-control-expanded');
      this.mgr.map.unsubscribeEvent('mouseover', this._hideExpand, this);
      this._expanded = false;
    }
  },

  propagateEvent: function (event, payload) {
    switch (event.getName()) {
    case 'click':
    case 'touchend':
      this._click(event, payload);
      break;
    case 'mouseover':
      this._showExpand();
      break;
    }
  },

  /**
   * 클릭 이벤트를 처리한다.
   * @private
   * @param event
   * @param payload
   */
  _click: function (event, payload) {
    var target = event.targetDOM;
    var plugin = target['data-value'];  
    if (plugin) {
      if(target['data-type'] === 'radio') {
        !plugin.isActive() && plugin.activate();
      } else {
        plugin.isActive() ? plugin.deactivate() : plugin.activate();
      }
    }
  },

  _changeButtonState: function (key) {
    var imgLoc = olleh.maps.control.Control.IMG_LOCATION;
    var imgURLS = olleh.maps.control.PluginControl.IMG_URLS;
    var list = this._dButtonList;
    for ( var akey in list) {
      list[akey].setProperty('src', imgLoc + imgURLS[akey + (akey === key ? '_ON' : '_OFF')]);
    }
  }
});
/**
 * @private
 */
$class('olleh.maps.plugin.DesktopControlsPlugin').extend(olleh.maps.Adaptable).define({

  attach: function () {
    var map = this.map;
    if (map.checkDefaultControl('panControl')) {
      this.panControl = new olleh.maps.control.PanControl();
      this.panControl.setMap(map);
    }
    if (map.checkDefaultControl('logoControl')) {
      this.logoControl = new olleh.maps.control.LogoControl();
      this.logoControl.setMap(map);
    }
    if (map.checkDefaultControl('scaleControl')) {
      this.scaleControl = new olleh.maps.control.ScaleControl();
      this.scaleControl.setMap(map);
    }
    /*if (map.checkDefaultControl('copyrightControl')) {
      this.copyrightControl = new olleh.maps.control.CopyrightControl();
      this.copyrightControl.setMap(map);
    }*/
    if (map.checkDefaultControl('mapTypeControl')) {
      this.mapTypeControl = new olleh.maps.control.MapTypeControl();
      this.mapTypeControl.setMap(map);
    }
    if (map.checkDefaultControl('zoomControl')) {
      this.zoomControl = new olleh.maps.control.ZoomControl();
      this.zoomControl.setMap(map);
    }
  },

  detach: function () {
    // ????
  }

});

olleh.maps.$skeleton.push(olleh.maps.plugin.DesktopControlsPlugin);/**
 * 거리/면적 측정 기능을 제공한다. measure 모듈에서 정의되어 있으며 해당 모듈을 추가하면
 * 자동으로 measureService 라는 service id 로 지도에 추가되게 된다.
 * 사용자가 거리/면적 측정 기능을 사용할 수 있도록 MeasureControl 을 지도에 추가해준다.
 * service Id 는 measureService 이고 화면에 그려진 거리/면적측정 vector 들을 모두 제거하는
 * clear() 함수가 제공되며 다음과 같이 호출할 수 있다.
 * <br/>
 * <pre>
 *  map.services.measureService.clear();
 * </pre>
 * <br>
 * 만일 면적 측정 기능을 api 를 통해 활성화 시키려면 다음과 같이 실행 한다.
 * <pre>
 *  map.services.measureArea.activate();
 * </pre>
 * 면적 측정 기능을 비활성화 시키려면 다음과 같이 실행 한다.
 * <pre>
 *  map.services.measureArea.deactivate();
 * </pre>
 * <br>
 * 만일 거리 측정 기능을 api 를 통해 활성화 시키려면 다음과 같이 실행 한다.
 * <pre>
 *  map.services.measureDistance.activate();
 * </pre>
 * 거리 측정 기능을 비활성화 시키려면 다음과 같이 실행 한다.
 * <pre>
 *  map.services.measureDustabce.deactivate();
 * </pre>
 */
$class('olleh.maps.plugin.measure.MeasureService').extend(olleh.maps.Adaptable).define({
  
  /**
   * Service ID: measureService
   * @type String
   */
  serviceId: 'measureService',

  attach: function () {
    if(this.map.checkDefaultControl('measureControl')){
      this.measureControl = new olleh.maps.control.MeasureControl();
      this.measureControl.setMap(this.map);
    }
    this.measureDistancePlugin = new olleh.maps.plugin.measure.MeasureDistancePlugin();
    this.measureDistancePlugin.setMap(this.map);
    this.measureAreaPlugin = new olleh.maps.plugin.measure.MeasureAreaPlugin();
    this.measureAreaPlugin.setMap(this.map);
  },

  detach: function () {
    this.measureControl && this.measureControl.setMap(null);
    this.measureDistancePlugin.setMap(null);
    this.measureAreaPlugin.setMap(null);
  },
  
  add: function(measureOverlay) {
    if(!this._measureOverlays)
      this._measureOverlays = [];
    this._measureOverlays.push(measureOverlay);
  },
  
  remove: function(measureOverlay) {
    measureOverlay.setMap(null);
    olleh.maps.util.removeFromArray(this._measureOverlays, measureOverlay);
  },
  
  /**
   * 화면에 그려진 거리/면적 측정 vector 와 overlay 들을 모두 제거한다.
   */
  clear: function() {
    this.map.services.measureDistance.deactivate();
    this.map.services.measureArea.deactivate();
    var measureOverlays = this._measureOverlays;
    if(measureOverlays) {
      for(var i = 0 ; i < measureOverlays.length; i++) {
        measureOverlays[i].setMap(null);
      }
      delete this._measureOverlays;
    }
  }
});

olleh.maps.$skeleton.push(olleh.maps.plugin.measure.MeasureService);
/**
 * 거리측정 기능을 제공한다. MeasureService 가 지도에 추가되면 자동으로 measureDistance 라는 service id 로 
 * 지도에 추가된다. 다음과 같이 measureDistance service 를 activate 할 수 있다.
 * <br/>
 * <pre>
 *  map.services.measureDistance.activate();
 * </pre>
 * @private
 */
$class('olleh.maps.plugin.measure.MeasureDistancePlugin').mixin(olleh.maps.Plugin).define({
  
  cursor: 'cursor/distance.cur',
  deleteOrigin: new olleh.maps.Point(107, 156),
  serviceId: 'measureDistance',
  pointOrigin: new olleh.maps.Point(127, 145),
  pluginInfo: {
    drawingTool: true
  },
  doActivate: function () {
    var map = this.map;
    var layerMgr = map.layerMgr;
    map.setCursor('url(' + olleh.maps.env.RESOURCE_URL + this.cursor + '), default');
    layerMgr.onEvent('click', this._onClick, this, true);
    layerMgr.onEvent('rightclick',this._onRightClick, this, true);
    layerMgr.setEditMode(true);
  },

  _onClick: function (event) {
    var map = this.map;
    // zoom animation 수행중에는 click 이벤트를 처리 하지 않는다.
    if(map.layerMgr.isZooming()) {
      event.stopPropagation();
      return;
    }
    var coord = event.getCoord();
    if (!this._measureOverlayGroup) {
      var vector = this._createVector(event.getCoord());
      var detailInfo = new olleh.maps.plugin.measure.MeasureOverlay({
        map: map,
        position: event.getCoord()
      });
      var inProgressVector = this._createInProgressVector(event.getCoord());
      this._measureOverlayGroup = new olleh.maps.plugin.measure.MeasureOverlayGroup(vector, inProgressVector, detailInfo);
      map.services.measureService.add(this._measureOverlayGroup);
      detailInfo.bringToFront();
      
      var pointIcon = this._createPointIcon(coord);
      this._measureOverlayGroup.addPointIcon(pointIcon);
      var pointInfo = new olleh.maps.plugin.measure.MeasureOverlay({
        map: map,
        position: coord,
        type: 'pointStart'
      });
      this._measureOverlayGroup.addPointInfo(pointInfo);
      map.layerMgr.onEvent('mousemove', this._onMove, this, true);
    } else {
      var inProgressPath = this._measureOverlayGroup.inProgressVector.getPath();
      var path = this._measureOverlayGroup.getPath();
      if(!path.getLast().equals(inProgressPath.getLast())) {
        var distance = inProgressPath.getDistance();
        var pointIcon = this._createPointIcon(coord);
        var pointInfo = new olleh.maps.plugin.measure.MeasureOverlay({
          map: map,
          position: coord,
          type: 'pointInfo',
          distance: distance
        });
        this._measureOverlayGroup.addPointIcon(pointIcon);
        this._measureOverlayGroup.addPointInfo(pointInfo);
        path.push(coord);
        inProgressPath.setAt(0, coord);
        inProgressPath.setAt(1, coord);
      }
    }
    event.stopPropagation();
  },
  
  _onMove: function (event) {
    if(!this._measureOverlayGroup)
      return;
    var inProgressPath = this._measureOverlayGroup.inProgressVector.getPath();
    inProgressPath.setAt(1, event.getCoord());
    var detailInfo = this._measureOverlayGroup.detailInfo;
    detailInfo.setPosition(event.getCoord());
    detailInfo.setDistance(this._measureOverlayGroup.getPath().getDistance() + inProgressPath.getDistance());
    event.stopPropagation();
  },

  _onRightClick: function(event) {
    if(this.map.layerMgr.isZooming()) {
      event.stopPropagation();
      return;
    }
    this.deactivate();
    event.stopPropagation();
  },
  
  _createPointIcon: function(coord) {
    var pointIcon = new olleh.maps.overlay.Marker({
      map: this.map,
      position: coord,
      flat: true,
      icon: {
        url: olleh.maps.env.RESOURCE_URL + 'img/controls.png',
        origin: this.pointOrigin,
        size: new olleh.maps.Size(11,11),
        anchor: new olleh.maps.Point(5,5)
      }
    });
    return pointIcon;
  },
  
  _createInProgressVector: function(coord) {
    var path = new olleh.maps.Path([ coord, coord ]);
    var polyline = new olleh.maps.vector.Polyline({
      map: this.map,
      path: path,
      strokeColor: '#df2428',
      strokeOpacity: .3,
      strokeWeight: 5
    });
    return polyline;
  },

  _createVector: function (coord) {
    var path = new olleh.maps.Path([ coord , coord]);
    var polyline = new olleh.maps.vector.Polyline({
      map: this.map,
      path: path,
      strokeColor: '#df2428',
      strokeOpacity: .7,
      strokeWeight: 5
    });
    return polyline;
  },
  
  _getDistance: function() {
    return this._measureOverlayGroup.getPath().getDistance();
  },

  doDeactivate: function () {
    var map = this.map;
    map.resetCursor();
    var layerMgr = map.layerMgr;
    layerMgr.unsubscribeEvent('mousemove', this._onMove, this);
    layerMgr.unsubscribeEvent('click', this._onClick, this);
    layerMgr.unsubscribeEvent('rightclick', this._onRightClick, this);
    layerMgr.setEditMode(false);
    if(this._measureOverlayGroup) {
      var point;
      if(this._measureOverlayGroup.inProgressVector) {
        point = this._measureOverlayGroup.inProgressVector.getPath().getLast();
        this._measureOverlayGroup.removeInProgressVector();
      } else {
        point = this._measureOverlayGroup.getPath().getLast();
      }
      this._measureOverlayGroup.getPath().push(point);
      var pointIcon = this._createPointIcon(point);
      this._measureOverlayGroup.addPointIcon(pointIcon);
      this._measureOverlayGroup.detailInfo.finish(this._getDistance());
      this._createDeleteMarker();
      this._measureOverlayGroup = null;
    }
  },
  
  _createDeleteMarker: function() {
    var measureOverlayGroup = this._measureOverlayGroup;
    var path = measureOverlayGroup.getPath();
    var lastPoint = path.getAt(path.getLength() - 1);
    var deleteMarker = new olleh.maps.overlay.Marker({map: this.map, position: lastPoint, flat: true,
      icon:{
        url: olleh.maps.env.RESOURCE_URL + 'img/controls.png',
        origin: this.deleteOrigin,
        size: new olleh.maps.Size(18,17),
        anchor: new olleh.maps.Point(-10,8)
    } });
    measureOverlayGroup.setDeleteMarker(deleteMarker);
    var map = this.map;
    deleteMarker.onEvent('click',function() {
      map.services.measureService.remove(measureOverlayGroup);
    });
  }
});
/**
 * 면적측정 기능을 제공한다. MeasureService 가 지도에 추가되면 자동으로 measureArea 라는 service id 로 
 * 지도에 추가된다. 다음과 같이 measureArea service 를 activate 할 수 있다.
 * <br/>
 * <pre>
 *  map.services.measureArea.activate();
 * </pre>
 * @private
 */
$class('olleh.maps.plugin.measure.MeasureAreaPlugin').extend(olleh.maps.plugin.measure.MeasureDistancePlugin).define({

  cursor: 'cursor/area.cur',
  deleteOrigin: new olleh.maps.Point(107, 112),
  serviceId: 'measureArea',
  pluginInfo: {
    drawingTool: true
  },
  pointOrigin: new olleh.maps.Point(127, 134),

  _createVector: function (coord) {
    var path = new olleh.maps.Path([ coord, coord ]);
    return new olleh.maps.vector.Polygon({
      map: this.map,
      paths: path,
      strokeColor: '#06b3f5',
      strokeOpacity: .7,
      strokeWeight: 5,
      fillColor: '#06b3f5',
      fillOpacity: .3
    });
  },
  
  _onClick: function (event) {
    var map = this.map;
    var coord = event.getCoord();
    if (!this._measureOverlayGroup) {
      var vector = this._createVector(event.getCoord());
      var detailInfo = new olleh.maps.plugin.measure.MeasureOverlay({
        map: map,
        position: event.getCoord(),
        type: 'areaInfo'
      });
      detailInfo.bringToFront();
      this._measureOverlayGroup = new olleh.maps.plugin.measure.MeasureOverlayGroup(vector, null, detailInfo);
      map.services.measureService.add(this._measureOverlayGroup);
      var pointIcon = this._createPointIcon(coord);
      this._measureOverlayGroup.addPointIcon(pointIcon);
      map.layerMgr.onEvent('mousemove', this._onMove, this, true);
    } else {
      var path = this._measureOverlayGroup.getPath();
      var p = path.getAt(path.getLength() -2);
      if(!path.getLast().equals(p)) {
        path.setAt(path.getLength() - 1, coord);
        path.push(coord);
        var pointIcon = this._createPointIcon(coord);
        this._measureOverlayGroup.addPointIcon(pointIcon);
      }
    }
    event.stopPropagation();
  },
  
  _onMove: function (event) {
    if(!this._measureOverlayGroup)
      return;
    var path = this._measureOverlayGroup.getPath();
    path.setAt(path.getLength() - 1, event.getCoord());
    this._measureOverlayGroup.detailInfo.setPosition(event.getCoord());
    event.stopPropagation();
  },
  
  _getDistance: function() {
    return this._measureOverlayGroup.getPath().getArea();
  }

});/**
 * 거리재기와 면적재기 기능을 제어하는 Control
 */
$class('olleh.maps.control.MeasureControl').extend(olleh.maps.control.Control).define({
  
  /**
   * 생성자, 명시된 opts를 사용해서 새로운 객체를 생성한다.
   * @param {olleh.maps.control.ControlOptions} [opts] MeasureControl 생성 옵션<br>
   * opts.position 기본값 : {@link olleh.maps.control.Control.TOP_RIGHT}<br>
   * opts.direction 기본값 : {@link olleh.maps.control.Control.VERTICAL}
   */
  MeasureControl: function (opts) {
    this.position = olleh.maps.control.Control.TOP_RIGHT;
    this.direction = olleh.maps.control.Control.VERTICAL;
    olleh.maps.mixin(this, opts, true);
  },
  
  attach: function() {
    olleh.maps.control.MeasureControl.$super.attach.apply(this, arguments);
    this.map.pluginRegistry.onEvent('plugin_state_changed', this._onStateChanged, this);
  },
  
  detach: function() {
    this.map.pluginRegistry.unsubscribeEvent('plugin_state_changed', this._onStateChanged, this);
    olleh.maps.control.MeasureControl.$super.detach.apply(this, arguments);
  },

  /**
   * 컨트롤을 그린다.
   * @returns {olleh.maps.Element} 최상위 element
   * @see olleh.maps.control.Control#draw
   */
  draw: function () {
    var div = olleh.maps.Element.create('div');
    var url = 'url(' + olleh.maps.env.RESOURCE_URL + 'img/controls.png)';
    div.setStyles({
      position: 'relative',
      height: '75px'
    });

    var distanceImg = this._distanceImg = olleh.maps.Element.create('div');
    distanceImg.addClass('control-distance-out').addClass('ollehmap-control-clickable');
    distanceImg.setProperty('title', '거리재기');
    distanceImg.setStyles({
      backgroundImage: url,
      position: 'absolute',
      top: '0px',
      right: '5px'
    });
    div.appendChild(distanceImg.elem);
    this.registerEventDom(distanceImg.elem);

    var areaImg = this._areaImg = olleh.maps.Element.create('div');
    areaImg.addClass('control-shape-out').addClass('ollehmap-control-clickable');
    areaImg.setProperty('title', '면적재기');
    areaImg.setStyles({
      backgroundImage: url,
      position: 'absolute',
      top: '25px',
      right: '5px'
    });
    div.appendChild(areaImg.elem);
    this.registerEventDom(areaImg.elem);

    var clearImg = this._clearImg = olleh.maps.Element.create('div');
    clearImg.addClass('control-change').addClass('ollehmap-control-clickable');
    clearImg.setProperty('title', '초기화');
    clearImg.setStyles({
      backgroundImage: url,
      position: 'absolute',
      top: '50px',
      right: '5px'
    });
    div.appendChild(clearImg.elem);
    this.registerEventDom(clearImg.elem);

    return div;
  },
  
  propagateEvent: function (event, payload) {
    switch (event.getName()) {
    case 'click':
    case 'touchend':
      this._click(event);
      break;
    }
    event.stopPropagation();
  },
  
  _click: function(event) {
    var target = event.targetDOM;
    var map = this.map;
    if(target === this._distanceImg.elem) {
      map.services.measureDistance.activate();
    } else if(target === this._areaImg.elem) {
      map.services.measureArea.activate();
    } else if(target === this._clearImg.elem) {
      map.services.measureService.clear();
    }
  },
  
  _onStateChanged: function(event, payload) {
    var isActive;
    var map = this.map;
    if(payload.plugin === map.services.measureDistance) {
      isActive =  map.services.measureDistance.isActive();
      this._distanceImg.addClass('control-distance' + (isActive ? '-selected' : '-out'));
      this._distanceImg.removeClass('control-distance' + (isActive ? '-out' : '-selected'));
    } else if(payload.plugin === map.services.measureArea) {
      isActive =  map.services.measureArea.isActive();
      this._areaImg.addClass('control-shape' + (isActive ? '-selected' : '-out'));
      this._areaImg.removeClass('control-shape' + (isActive ? '-out' : '-selected'));
    }
  }
  
});/**
 * 거리/면적 측정에서 필요로하는 vector 와 overlay 들을 관리한다.
 * @private
 */
$class('olleh.maps.plugin.measure.MeasureOverlayGroup').define({
  /**
   * 생성자, 명시된 vector, detailInfo를 사용해서 새로운 객체를 생성한다.
   * @param {olleh.maps.vector.Vector} vector
   * @param {olleh.maps.vector.Vector} inProgressVector
   * @param {olleh.maps.plugin.measure.MeasureOverlay} detailInfo
   */
  MeasureOverlayGroup: function (vector, inProgressVector, detailInfo) {
    this.vector = vector;
    this.inProgressVector = inProgressVector;
    this.detailInfo = detailInfo;
    this.pointInfos = [];
    this.pointIcons = [];
    this.deleteMarker;
  },
  
  removeInProgressVector: function() {
    if(this.inProgressVector) {
      this.inProgressVector.setMap(null);
      this.inProgressVector = null;
    }
  },
  
  /**
   * Overlay 를 삭제하는 마커를 지정한다.
   * @param {olleh.maps.overlay.Marker} deleteMarker
   * @private
   */
  setDeleteMarker: function(deleteMarker) {
    this.deleteMarker = deleteMarker;
  },
  
  /**
   * 중간 지점 정보를 표현하는 Overlay 를 추가한다.
   * @param {olleh.maps.plugin.measure.MeasureOverlay} pointInfo
   * @private
   */
  addPointInfo: function(pointInfo) {
    this.pointInfos.push(pointInfo);
  },
  
  /**
   * 중간 지점을 나타내는 Marker 를 추가한다. 
   * @param {olleh.maps.overlay.Marker} pointIcon
   * @private
   */
  addPointIcon: function(pointIcon) {
    this.pointIcons.push(pointIcon);
  },
  
  /**
   * 벡터를 정의하는 path 를 반환한다.
   * @returns {olleh.maps.Path}
   * @private
   */
  getPath: function() {
    if(this.vector.getPath)
      return this.vector.getPath();
    if(this.vector.getPaths) // vector is Polygon
      return this.vector.getPaths()[0];
  },
  
  /**
   * 추가된 모든 vector 와 overlay 의 setMap(map) 을 호출한다.
   * @param {olleh.maps.Map} map
   * @private
   */
  setMap: function(map) {
    this.vector.setMap(map);
    this.inProgressVector && this.inProgressVector.setMap(map);
    this.detailInfo.setMap(map);
    this.deleteMarker && this.deleteMarker.setMap(map);
    for(var i = 0 ; i < this.pointInfos.length ; i++) {
      this.pointInfos[i].setMap(map);
    }
    for(var j = 0 ; j < this.pointIcons.length ; j++) {
      this.pointIcons[j].setMap(map);
    }
  }

});/**
 * 화면에 거리/면적 정보를 출력하는 Overlay
 * @private 
 */
$class('olleh.maps.plugin.measure.MeasureOverlay').extend(olleh.maps.overlay.PointedOverlay).define({
  
  /**
   * 생성자, 명시된 opts를 사용해서 새로운 객체를 생성한다.
   * @param {Object} opts
   * @param {String} opts.type 
   *  pointStart:시작, areaInfo: 면적, distanceInfo: 거리, detailInfo: 상세 정보  
   * @param {Number} opts.distance 최초 측정 거리 
   * @param {Number} opts.anchroX position 과 measureInfo 간의 x 좌표 거리
   * @param {Number} opts.anchroY position 과 measureInfo 간의 y 좌표 거리
   */
  MeasureOverlay: function (opts) {
    this._opts = olleh.maps.mixin({
      type: 'distanceInfo'
    },opts, true);
  },
  
  update: function() {
    if(!this.div) {
      this.div = olleh.maps.Element.create('div');
      this.div.addClass('ollehmap-measure');
      this.div.setStyles({
        boxShadow: '0 0 1px rgba(0,0,0,0.5)',
        userSelect: 'none'
      });
      var opts = this._opts;
      if(opts.type === 'areaInfo') { // 면적 오버레이
        this._updateAreaInfo();
      } else if(opts.type === 'pointStart') { // 거리 오버레이: 시작
        this._updatePointStart();
      } else if(opts.type === 'pointInfo') { // 거리 오버레이: 중간점
        this._updatePointInfo();
      } else { // opts.type === 'pointDetail' 거리 오버레이: 상세
        this._updatePointDetail();
      }
      this.registerElement('upper_overlay_pane', this.div.elem);
    }
    olleh.maps.plugin.measure.MeasureOverlay.$super.update.apply(this, arguments);
  },
  
  // 면적
  _updateAreaInfo: function() {
    this.div.addClass('ollehmap-measure-areaInfo');
    var imgUrl = 'url('+ olleh.maps.env.RESOURCE_URL + 'img/controls.png)'; 
    this.div.elem.innerHTML = '마우스 오른쪽 버튼을<br>누르면 마침 <div class="control-measure-bluemouse olleh-maps-inline" style="background-image:'+ imgUrl +'"></div>';
  },
  
  // 최종 면적
  _updateFinalAreaInfo: function(area) {
    this.div.removeClass('ollehmap-measure-areaInfo');
    this.div.addClass('ollehmap-measure-finalAreaInfo');
    var areaHtml = olleh.maps.util.applyTemplate('총면적 <strong>#{value}</strong>#{unit}', this._getArea(area));
    this.div.elem.innerHTML = areaHtml;
  },
  
  // 거리 시작점
  _updatePointStart: function() {
    this.div.addClass('ollehmap-measure-pointStart');
    this.div.elem.innerHTML = '시작';
  },
  
  // 거리 중간점
  _updatePointInfo: function() {
    this.div.addClass('ollehmap-measure-pointInfo');
    var dist = this._getDistance(this._opts.distance);
    this.div.elem.innerHTML = dist.value + '' + dist.unit;
  },
  
  _updatePointDetail: function() {
    var div = this.div;
    div.addClass('ollehmap-measure-pointDetail');
    var distLabel = olleh.maps.Element.create('div');
    distLabel.addClass('ollehmap-measure-pointDetail1');
    distLabel.elem.innerHTML = '총거리';
    distLabel.setStyle('margin-bottom','5px');
    div.appendChild(distLabel);
    this._distValue = olleh.maps.Element.create('div');
    this._distValue.setStyle('margin-bottom','5px');
    this._distValue.addClass('ollehmap-measure-pointDetail2');
    div.appendChild(this._distValue);
    var walkLabel = olleh.maps.Element.create('div');
    walkLabel.addClass('ollehmap-measure-pointDetail1');
    walkLabel.setStyle('margin-bottom','5px');
    walkLabel.elem.innerHTML = '도보';
    div.appendChild(walkLabel);
    this._walkValue = olleh.maps.Element.create('div');
    this._walkValue.setStyle('margin-bottom','5px');
    this._walkValue.addClass('ollehmap-measure-pointDetail2');
    div.appendChild(this._walkValue);
    var bikeLabel = olleh.maps.Element.create('div');
    bikeLabel.elem.innerHTML = '자전거';
    bikeLabel.addClass('ollehmap-measure-pointDetail1');
    div.appendChild(bikeLabel);
    this._bikeValue = olleh.maps.Element.create('div');
    this._bikeValue.addClass('ollehmap-measure-pointDetail2');
    div.appendChild(this._bikeValue);
    
    this._rightButtonToFinish = olleh.maps.Element.create('div');
    this._rightButtonToFinish.addClass('ollehmap-measure-finish');
    var imgUrl = 'url('+ olleh.maps.env.RESOURCE_URL + 'img/controls.png)'; 
    this._rightButtonToFinish.elem.innerHTML = '마우스 오른쪽 버튼을<br>누르면 마침 <span class="control-measure-redmouse olleh-maps-inline" style="background-image:'+ imgUrl +'"></span>';
    div.appendChild(this._rightButtonToFinish);
  },
  
  _updateFinalDistanceInfo: function() {
    this.div.setStyles({
      paddingBottom:'8px',
      marginTop:'-88px',
      marginLeft:'30px'
     });
    this._rightButtonToFinish.setStyle('display','none');
  },
  
  setDistance: function(dist) {
    var valueHtml = olleh.maps.util.applyTemplate(
        '<strong>#{value}</strong>#{unit}',this._getDistance(dist));
    this._distValue.elem.innerHTML = valueHtml;
    this._walkValue.elem.innerHTML = this._getTimeHtml(dist, 66.6); // 속도 4km/h = 66.6m/m
    this._bikeValue.elem.innerHTML = this._getTimeHtml(dist, 266.6); // 속도 16km/h = 266.6m/m
  },
  
  finish: function(distOrArea) {
    if(this._opts.type === 'areaInfo')
      this._updateFinalAreaInfo(distOrArea);
    else 
      this._updateFinalDistanceInfo();
  },
  
  _getTimeHtml: function(dist, speed) {
    var time = this._getTime(dist, speed);
    var html = olleh.maps.util.applyTemplate(
      '<strong>#{m}</strong>분',time);
    if(time.h) {
      html = olleh.maps.util.applyTemplate(
          '<strong>#{h}</strong>시간 ',time) + html;
    }
    return html;
  },
  
  _getTime: function(dist, speed) {
    var time = dist / speed;
    var h = Math.floor(time / 60);
    var m = Math.floor(time % 60);
    var result  = {m: m};
    if(h > 0) {
      result.h = h;
    }
    return result;
  },
    
  _getDistance: function(dist) {
    var unit = 'm';
    if(dist > 1000) {
      unit = 'km';
      dist = dist / 1000;
    }
    return {value: dist.toFixed(3), unit: unit};
  },
  
  _getArea: function(area) {
    var unit;
    if(area > 1000000) {
      area = area / 1000000;
      unit = 'km²';
    } else {
      unit = 'm²';
    }
    return {value: area.toFixed(3), unit: unit};
  }
  
});/**
 * DrawCircle
 * @private
 */
$class('olleh.maps.plugin.drawing.DrawCircle').mixin(olleh.maps.Plugin).define({
  serviceId: 'drawCircle',
  pluginInfo: {
    drawingTool: true
  },

  /**
   * @private
   * @typedef olleh.maps.plugin.drawing.DrawCircleOptions
   * @property {olleh.maps.vector.CircleOptions} circleOpts Circle 생성 옵션
   */
  /**
   * Constructor
   * @param {olleh.maps.plugin.drawing.DrawCircleOptions} opts 옵션
   * @private 
   */
  DrawCircle: function (opts) {
    this._opts = olleh.maps.mixin({
    circleOpts: {
      fillColor: '#05A15C',
      fillOpacity: .3,
      strokeColor: '#05A15C',
      strokeOpacity: .7,
      strokePosition: 'center', // center, insdie, outside
      strokeWeight: 5}
    }, opts, 'remix');
  },
  
  setOptions: function (opts) {
    this._opts = olleh.maps.mixin(this._opts, opts, 'remix');
  },

  doActivate: function () {
    var map = this.map;
    var layerMgr = map.layerMgr;
    map.setCursor('crosshair');
    layerMgr.onEvent('click', this._onClick, this, true);
    layerMgr.onEvent('dragstart', this._onDragStart, this, true);
    layerMgr.onEvent('dragend', this._onDragEnd, this, true);
    layerMgr.setEditMode(true);
  },

  doDeactivate: function () {
    var map = this.map;
    var layerMgr = map.layerMgr;
    map.setCursor(null);
    layerMgr.unsubscribeEvent('click', this._onClick, this, true);
    layerMgr.unsubscribeEvent('dragstart', this._onDragStart, this, true);
    layerMgr.unsubscribeEvent('dragend', this._onDragEnd, this, true);
    layerMgr.setEditMode(false);
  },
  
  _complete: function() {
    if(this._circle) {
      var vectorLayer = this.map.getLayer(olleh.maps.vector.VectorLayer.prototype.name);
      vectorLayer.fireEvent('vector_created', this._circle);
      this._circle = null;
    }
  },
  
  _onClick: function(event, payload) {
    if(!this._circle) {
      this._circle = this._createCircle(event.getCoord());
      this.map.layerMgr.onEvent('mousemove',this._onDrag, this);
    } else {
      this.map.layerMgr.unsubscribeEvent('mousemove', this._onDrag, this);
      this._complete();
    }
  },
  
  _onDragStart: function(event, payload) {
    event.preventDefault();
    if(!this._circle) {
      this._circle = this._createCircle(event.getCoord());
      this.map.layerMgr.onEvent('drag',this._onDrag,this);
    }
  },
  
  _onDrag: function(event, payload) {
    event.preventDefault();
    var r = this._center.distanceTo(event.getCoord());
    this._circle.setRadius(r);
  },
  
  _onDragEnd: function(event, payload) {
    event.preventDefault();
    this.map.layerMgr.unsubscribeEvent('drag',this._onDrag,this);
    this._complete();
  },
  
  _createCircle: function(coord) {
    this._center = coord;
    var opts = olleh.maps.mixin({
      map: this.map,
      center: coord,
      radius: 1
    }, this._opts.circleOpts, true);
    var circle = new olleh.maps.vector.Circle(opts);
    return circle;
  }

});/**
 * DrawPolygon
 * @private
 */
$class('olleh.maps.plugin.drawing.DrawPolygon').mixin(olleh.maps.Plugin).define({
  serviceId: 'drawPolygon',
  pluginInfo: {
    drawingTool: true
  },

  /**
   * @private
   * @typedef olleh.maps.plugin.drawing.DrawPolygonOptions
   * @property {olleh.maps.vector.PolygonOptions} polygonOpts Polygon 생성 옵션
   */
  /**
   * Constructor
   * @param {olleh.maps.plugin.drawing.DrawPolygonOptions} opts 옵션
   * @private 
   */
  DrawPolygon: function (opts) {
    this._opts = olleh.maps.mixin({
      polygonOpts: {
        fillRule: 'evenodd',
        strokeColor: '#06b3f5',
        strokeOpacity: .7,
        strokeWeight: 5,
        fillColor: '#06b3f5',
        fillOpacity: .3
      }
    }, opts, 'remix');
  },
  
  
  setOptions: function(opts) {
    this._opts = olleh.maps.mixin(this._opts, opts, 'remix');
  },

  doActivate: function () {
    var map = this.map;
    var layerMgr = map.layerMgr;
    map.setCursor('crosshair');
    layerMgr.onEvent('dblclick', this._onDblClick, this, true);
    layerMgr.onEvent('click', this._onClick, this, true);
    layerMgr.setEditMode(true);
  },
  
  _onDblClick: function(event) {
    event.stopPropagation();
    event.preventDefault();
    this._complete();
    this._prevCoord = event.getCoord();
  },
  
  _onClick: function(event) {
    var map = this.map;
    // zoom animation 수행중에는 click 이벤트를 처리 하지 않는다.
    if(map.layerMgr.isZooming()) {
      event.stopPropagation();
      return;
    }
    var coord = event.getCoord();
    if(coord.equals(this._prevCoord))
      return;
    this._prevCoord = coord;
    if(!this._polygon) {
      var opts = olleh.maps.mixin({map: this.map, paths: new olleh.maps.Path([coord , coord])}, this._opts.polygonOpts);
      this._polygon = new olleh.maps.vector.Polygon(opts);
      map.layerMgr.onEvent('mousemove', this._onMouseMove, this);
    } else {
      this._completePoint(coord);
    }
  },
  
  _completePoint: function(coord) {
    var path = this._polygon.getPaths()[0];
    path.push(coord);
  },
  
  _onMouseMove: function(event, payload) {
    var path = this._polygon.getPaths()[0];
    path.setAt(path.getLength()-1, event.getCoord());
  },
  
  doDeactivate: function () {
    var map = this.map;
    var layerMgr = map.layerMgr;
    map.setCursor(null);
    layerMgr.unsubscribeEvent('click', this._onClick, this);
    layerMgr.unsubscribeEvent('dblclick',this._onDblClick, this);
    layerMgr.setEditMode(false);
    this._complete();
  },
  
  _complete: function() {
    if(this._polygon) {
      var path = this._polygon.getPaths()[0];
      var last = path.getLength()-1;
      if(path.getAt(last).equals(path.getAt(last-1))) {
        path.pop();
      }
      var map = this.map;
      var vectorLayer = map.getLayer(olleh.maps.vector.VectorLayer.prototype.name);
      vectorLayer.fireEvent('vector_created', this._polygon);
      this._polygon = null;
      map.layerMgr.unsubscribeEvent('mousemove',this._onMouseMove, this);
    }    
  }

});/**
 * DrawPolyline
 * @private
 */
$class('olleh.maps.plugin.drawing.DrawPolyline').mixin(olleh.maps.Plugin).define({
  serviceId: 'drawPolyline',
  pluginInfo: {
    drawingTool: true
  },

  /**
   * @private
   * @typedef olleh.maps.plugin.drawing.DrawPolylineOptions
   * @property {olleh.maps.vector.PolylineOptions} polylineOpts Polyline 생성 옵션
   */
  /**
   * Constructor
   * @param {olleh.maps.plugin.drawing.DrawPolylineOptions} opts 옵션
   * @private 
   */
  DrawPolyline: function (opts) {
    this._opts = olleh.maps.mixin({
      polylineOpts: {
        strokeColor: '#df2428',
        strokeOpacity: .7,
        strokeWeight: 5
      }
    }, opts, 'remix');
  },

  setOptions: function (opts) {
    this._opts = olleh.maps.mixin(this._opts, opts, 'remix');
  },

  doActivate: function () {
    var map = this.map;
    var layerMgr = map.layerMgr;
    map.setCursor('crosshair');
    layerMgr.onEvent('click', this._onClick, this, true);
    layerMgr.onEvent('dblclick', this._onDblClick, this, true);
    layerMgr.setEditMode(true);
  },

  _onDblClick: function (event) {
    event.stopPropagation();
    event.preventDefault();
    this._finishDrawing();
    this._dblClickCoord = event.getCoord();
  },

  _onClick: function (event) {
    var map = this.map;
    // zoom animation 수행중에는 click 이벤트를 처리 하지 않는다.
    if (map.layerMgr.isZooming()) {
      event.stopPropagation();
      return;
    }
    var coord = event.getCoord();
    if(coord.equals(this._dblClickCoord))
      return;
    this._dblClickCoord = null;
    if (!this._polyline) {
      var opts = olleh.maps.mixin({
        map: this.map,
        path: new olleh.maps.Path([ coord ])
      }, this._opts.polylineOpts);
      this._polyline = new olleh.maps.vector.Polyline(opts);
      opts = olleh.maps.mixin({
        map: this.map,
        path: new olleh.maps.Path([ coord, coord ])
      }, this._opts.polylineOpts);
      opts.strokeOpacity = .5;
      this._inprogressLine = new olleh.maps.vector.Polyline(opts);
      map.layerMgr.onEvent('mousemove', this._onMouseMove, this);
    } else {
      this._completePoint(coord);
    }
  },

  _completePoint: function (coord) {
    var path = this._polyline.getPath();
    path.push(coord);
    this._inprogressLine.setPath(new olleh.maps.Path([ coord, coord ]));
  },

  _onMouseMove: function (event, payload) {
    var path = this._inprogressLine.getPath();
    path.setAt(1, event.getCoord());
  },

  doDeactivate: function () {
    var map = this.map;
    var layerMgr = map.layerMgr;
    map.setCursor(null);
    layerMgr.unsubscribeEvent('click', this._onClick, this);
    layerMgr.unsubscribeEvent('dblclick', this._onDblClick, this);
    layerMgr.setEditMode(false);
    this._finishDrawing();
  },

  _finishDrawing: function () {
    if (this._polyline) {
      this.map.layerMgr.unsubscribeEvent('mousemove', this._onMouseMove, this);
      var vectorLayer = map.getLayer(olleh.maps.vector.VectorLayer.prototype.name);
      vectorLayer.fireEvent('vector_created', this._polyline);
      this._inprogressLine.setMap(null);
      this._inprogressLine = null;
      this._polyline = null;
    }
  }
});/**
 * DrawRectangle
 * @private
 */
$class('olleh.maps.plugin.drawing.DrawRectangle').mixin(olleh.maps.Plugin).define({
  serviceId: 'drawRectangle',
  pluginInfo: {
    drawingTool: true
  },

  /**
   * @private
   * @typedef olleh.maps.plugin.drawing.DrawRectangleOptions
   * @property {olleh.masps.vector.RectangleOptions} rectangleOpts Rectangle 생성 옵션
   */
  /**
   * Constructor
   * @param {olleh.maps.plugin.drawing.DrawRectangleOptions} opts 옵션
   * @private 
   */
  DrawRectangle: function (opts) {
    this._opts = olleh.maps.mixin({
      rectangleOpts: {
        fillColor: '#FFC408',
        fillOpacity: .3,
        strokeColor: '#FFC408',
        strokeOpacity: .7,
        strokePosition: 'center', // center, insdie, outside
        strokeWeight: 5
      }}, opts, 'remix');
  },

  setOptions: function (opts) {
    this._opts = olleh.maps.mixin(this._opts, opts, 'remix');
  },

  doActivate: function () {
    var map = this.map;
    var layerMgr = map.layerMgr;
    map.setCursor('crosshair');
    layerMgr.onEvent('click', this._onClick, this, true);
    layerMgr.onEvent('dragstart', this._onDragStart, this, true);
    layerMgr.onEvent('dragend', this._onDragEnd, this, true);
    layerMgr.setEditMode(true);
  },

  doDeactivate: function () {
    var map = this.map;
    var layerMgr = map.layerMgr;
    map.setCursor(null);
    layerMgr.unsubscribeEvent('click', this._onClick, this, true);
    layerMgr.unsubscribeEvent('dragstart', this._onDragStart, this, true);
    layerMgr.unsubscribeEvent('dragend', this._onDragEnd, this, true);
    layerMgr.setEditMode(false);
    this._complete();
  },
  
  _complete: function() {
    if(this._rectangle) {
      var vectorLayer = map.getLayer(olleh.maps.vector.VectorLayer.prototype.name);
      vectorLayer.fireEvent('vector_created', this._rectangle);
      this._rectangle = null;
    }
  },

  _onClick: function (event, payload) {
    if (!this._rectangle) {
      this._rectangle = this._createRectangle(event.getCoord());
      this.map.layerMgr.onEvent('mousemove', this._onDrag, this);
    } else {
      this.map.layerMgr.unsubscribeEvent('mousemove', this._onDrag, this);
      this.deactivate();
    }
  },

  _onDragStart: function (event, payload) {
    event.preventDefault();
    if (!this._rectangle) {
      this._rectangle = this._createRectangle(event.getCoord());
      this.map.layerMgr.onEvent('drag', this._onDrag, this);
    }
  },

  _onDrag: function (event, payload) {
    event.preventDefault();
    var coord = event.getCoord();
    var bounds = this._rectangle.getBounds();
    
    var left = Math.min(coord.x, this._startCoord.x);
    var bottom = Math.min(coord.y, this._startCoord.y);
    var right = Math.max(coord.x, this._startCoord.x);
    var top = Math.max(coord.y, this._startCoord.y);
    bounds = new olleh.maps.Bounds(new olleh.maps.UTMK(left,bottom), new olleh.maps.UTMK(right,top));
    this._rectangle.setBounds(bounds);
  },

  _onDragEnd: function (event, payload) {
    event.preventDefault();
    this.map.layerMgr.unsubscribeEvent('drag', this._onDrag, this);
    this._complete();
  },
  
  _createRectangle: function (coord) {
    this._startCoord = coord;
    var opts = olleh.maps.mixin({
      map: this.map,
      bounds: new olleh.maps.Bounds(coord, coord)
    }, this._opts.rectangleOpts, true);
    var rect = new olleh.maps.vector.Rectangle(opts);
    return rect;
  }

});
/**
 * DrawingControl
 * @private
 */
$class('olleh.maps.plugin.drawing.DrawingControl').extend(olleh.maps.control.Control).define({
  
  /**
   * @private
   * @typedef olleh.maps.plugin.drawing.DrawingControlOpts
   * @property {String} position 
   * @property {String} direction 
   */
  
  /**
   * Constructor
   */
  DrawingControl: function (opts) {
    this.position = olleh.maps.control.Control.TOP_RIGHT;
    this.direction = olleh.maps.control.Control.VERTICAL;
    olleh.maps.mixin(this, opts, true);
  },

  attach: function () {
    olleh.maps.plugin.drawing.DrawingControl.$super.attach.apply(this, arguments);
    this.map.pluginRegistry.onEvent('plugin_state_changed', this._onStateChanged, this);
  },

  detach: function () {
    this.map.pluginRegistry.unsubscribeEvent('plugin_state_changed', this._onStateChanged, this);
    olleh.maps.plugin.drawing.DrawingControl.$super.detach.apply(this, arguments);
  },

  draw: function () {
    var div = olleh.maps.Element.create('div');
    div.setStyles({
      position: 'relative',
      width: '25px',
      height: '125px',
      margin: '6px',
      backgroundColor: 'white'
    });

    // circle
    var circleImg = this._circleImg = olleh.maps.Element.create('div');
    circleImg.setStyles({
      backgroundImage: 'url(' + olleh.maps.env.RESOURCE_URL + 'img/draw_circle.png)',
      backgroundRepeat: 'no-repeat',
      backgroundPosition: 'center',
      borderWidth: '1px',
      borderStyle: 'solid',
      borderColor: 'black black #F6F6F6',
      width: '25px',
      height: '25px',
      position: 'absolute',
      top: '0px',
      left: '0px',
      'border-radius': '5px 5px 0px 0px',
      cursor: 'pointer'
    });
    div.appendChild(circleImg.elem);
    this.registerEventDom(circleImg.elem);

    // rectangle
    var rectangleImg = this._rectangleImg = olleh.maps.Element.create('div');
    rectangleImg.setStyles({
      backgroundImage: 'url(' + olleh.maps.env.RESOURCE_URL + 'img/draw_rectangle.png)',
      backgroundRepeat: 'no-repeat',
      backgroundPosition: 'center',
      borderWidth: '1px',
      borderStyle: 'solid',
      borderColor: 'transparent black #F6F6F6',
      width: '25px',
      height: '25px',
      position: 'absolute',
      top: '25px',
      left: '0px',
      cursor: 'pointer'
    });
    div.appendChild(rectangleImg.elem);
    this.registerEventDom(rectangleImg.elem);

    // polyline
    var polylineImg = this._polylineImg= olleh.maps.Element.create('div');
    polylineImg.setStyles({
      backgroundImage: 'url(' + olleh.maps.env.RESOURCE_URL + 'img/draw_polyline.png)',
      backgroundRepeat: 'no-repeat',
      backgroundPosition: 'center',
      borderWidth: '1px',
      borderStyle: 'solid',
      borderColor: 'transparent black #F6F6F6',
      width: '25px',
      height: '25px',
      position: 'absolute',
      top: '50px',
      left: '0px',
      cursor: 'pointer'
    });
    div.appendChild(polylineImg.elem);
    this.registerEventDom(polylineImg.elem);
    
    // polygon
    var polygonImg = this._polygonImg = olleh.maps.Element.create('div');
    polygonImg.setStyles({
      backgroundImage: 'url(' + olleh.maps.env.RESOURCE_URL + 'img/draw_polygon.png)',
      backgroundRepeat: 'no-repeat',
      backgroundPosition: 'center',
      borderWidth: '1px',
      borderStyle: 'solid',
      borderColor: 'transparent black #F6F6F6',
      width: '25px',
      height: '25px',
      position: 'absolute',
      top: '75px',
      left: '0px',
      cursor: 'pointer'
    });
    div.appendChild(polygonImg.elem);
    this.registerEventDom(polygonImg.elem);

    // hand
    var handImg = this._handImg = olleh.maps.Element.create('div');
    handImg.setStyles({
      backgroundImage: 'url(' + olleh.maps.env.RESOURCE_URL + 'img/draw_hand.png)',
      backgroundRepeat: 'no-repeat',
      backgroundPosition: 'center',
      borderWidth: '1px',
      borderStyle: 'solid',
      borderColor: 'transparent black black black',
      width: '25px',
      height: '25px',
      position: 'absolute',
      top: '100px',
      left: '0px',
      'border-radius': '0px 0px 5px 5px',
      cursor: 'pointer'
    });
    div.appendChild(handImg.elem);
    this.registerEventDom(handImg.elem);

    return div;
  },

  propagateEvent: function (event, payload) {
    switch (event.getName()) {
    case 'click':
    case 'touchend':
      this._click(event);
      break;
    }
    event.stopPropagation();
  },

  _click: function (event, payload) {
    var target = event.targetDOM;
    var map = this.map;
    if(target === this._polylineImg.elem) {
      map.services.drawPolyline.activate();
    } else if(target === this._polygonImg.elem) {
      map.services.drawPolygon.activate();
    } else if(target === this._rectangleImg.elem) {
      map.services.drawRectangle.activate();
    } else if(target === this._circleImg.elem) {
      map.services.drawCircle.activate();
    } else if(target === this._handImg.elem) {
      map.services.drawPolyline.deactivate();
      map.services.drawPolygon.deactivate();
      map.services.drawRectangle.deactivate();
      map.services.drawCircle.deactivate();
    }
  },

  _onStateChanged: function (event, payload) {

  }

});/**
 * DrawingService
 * @private
 */
$class('olleh.maps.plugin.drawing.DrawingService').extend(olleh.maps.Adaptable).define({
  
  serviceId: 'drawingService', 
  
  /**
   * DrawingService 에서 제공하는 plugin 들을 사용해 vector 를 그리면 발생하는 이벤트.  
   * @event olleh.maps.plugin.drawing.DrawingService#event:vector_created
   * @param {olleh.maps.event.Event} event 이벤트 객체
   * @param {olleh.maps.vector.Vector} payload 생성된 Vector 객체
   */
  
  /**
   * Drawing service 옵션
   * @private
   * @typedef olleh.maps.plugin.drawing.DrawingServiceOptions
   * @property {olleh.maps.vector.CircleOptions} circleOpts Circle 생성 옵션 
   * @property {olleh.maps.vector.RectangleOptions} rectangleOpts Rectangle 생성 옵션
   * @property {olleh.maps.vector.PolylineOptions} polylineOpts Polyline 생성 옵션
   * @property {olleh.maps.vector.PolygonOptions} polygonOpts Polygon 생성 옵션
   * @property {olleh.maps.plugin.drawing.EditingPluginOptions} editOpts 편집 옵션
   * @property {olleh.maps.plugin.drawing.DrawingControlOpts} controlOpts Control 생성 옵션
   */
  /**
   * Constructor
   * @param {olleh.maps.plugin.drawing.DrawingServiceOptions} opts 옵션
   */
  DrawingService: function (opts) {
    this._opts = opts || {};
  },

  attach: function() {
    this.drawCircle = new olleh.maps.plugin.drawing.DrawCircle(this._opts);
    this.drawCircle.setMap(this.map);
    this.drawPolyline = new olleh.maps.plugin.drawing.DrawPolyline(this._opts);
    this.drawPolyline.setMap(this.map);
    this.drawPolygon = new olleh.maps.plugin.drawing.DrawPolygon(this._opts);
    this.drawPolygon.setMap(this.map);
    this.drawRectangle = new olleh.maps.plugin.drawing.DrawRectangle(this._opts);
    this.drawRectangle.setMap(this.map);
    this.editingPlugin = new olleh.maps.plugin.drawing.EditingPlugin(this._opts);
    this.editingPlugin.setMap(this.map);
    if(this._opts.controlOpts) {
      this.control = new olleh.maps.plugin.drawing.DrawingControl(this._opts.controlOpts);
      this.control.setMap(this.map);
    }
  },
  
  detach: function() {
    this.drawCircle.setMap(null);
    this.drawPolyline.setMap(null);
    this.drawPolygon.setMap(null);
    this.drawRectangle.setMap(null);
    this.editingPlugin.setMap(null);
    this.control && this.control.setMap(null);
  }

});/**
 * EditingPlugin
 * @private
 */
$class('olleh.maps.plugin.drawing.EditingPlugin').extend(olleh.maps.Plugin).define({
  
  serviceId: 'editingPlugin',
  pluginInfo: {
    drawingTool: true
  },

  /**
   * 편집 옵션
   * @private
   * @typedef olleh.maps.plugin.drawing.EditingPluginOptions
   * @property {String} activation ['click'|'all'] 'click' 으로 지정할 경우 클릭된 벡터만 편집 모드로 들어가게 된다.
   *            'all' 로 지정할 경우 모든 벡터가 즉시 편집 모드로 들어간다.
   */
  /**
   * CONSTRUCTOR
   * @param {olleh.maps.plugin.drawing.DrawingServiceOptions} opts 옵션 
   */
  EditingPlugin: function (opts) {
    opts = opts || {};
    this._opts = opts.editOpts || {};
  },
  
  doActivate: function() {
    if(this._opts.activation === 'click') {
      this.map.onEvent('click',this._onclick,this);
    } else {
      this._activateAllVector();
    }
  },
  
  _activateAllVector: function() {
    var vectorLayer = this.map.getLayer(olleh.maps.vector.VectorLayer.prototype.name);
    var vectors = vectorLayer.getVectors();
    for(var i=0; i<vectors.length; i++) {
      vectors[i].setEditable(true);
    }
  },
  
  _deactivateAllVector: function() {
    var vectorLayer = this.map.getLayer(olleh.maps.vector.VectorLayer.prototype.name);
    var vectors = vectorLayer.getVectors();
    for(var i=0; i<vectors.length; i++) {
      vectors[i].setEditable(false);
    }
  },
  
  doDeactivate: function() {
    if(this._opts.activation === 'click') {
      if(this._activeEditTarget) {
        this._activeEditTarget.setEditable(false);
        this._activeEditTarget = null;
      }
      this.map.unsubscribeEvent('click',this._onclick,this);
    } else {
      this._deactivateAllVector();
    }
  },
  
  _onclick: function(event, payload) {
    var source = event.getSource();
    if(!(source instanceof olleh.maps.vector.Vector))
      return;
    if(this._activeEditTarget && this._activeEditTarget === source) {
      return;
    }
    source.setEditable(true);
    this._activeEditTarget = source;
  }

});/**
 * EditPolyline
 * @private
 */
$class('olleh.maps.plugin.drawing.EditPolyline').extend(olleh.maps.vector.EditHandler).define({

  activate: function () {
    if (!this.target)
      return;
    this._draggableVertices = [];
    this._draggableVertices2 = [];
    this.refresh();
  },

  refresh: function () {
    var paths = this._getPaths();
    var k = 0;
    for (var j = 0; j < paths.length; j++) {
      var path = paths[j];
      var coords = path.getCoords();
      for (var i = 0; i < coords.length; i++) {
        var existing = this._draggableVertices[k];
        if (existing) {
          existing.setOptions({
            path: path,
            index: i
          });
        } else {
          var vertex = new olleh.maps.plugin.drawing.PathEditingHandle({
            editHandler: this,
            path: path,
            index: i,
            map: this.target.map
          });
          this._draggableVertices.push(vertex);
        }
        if (!this._onChanging && (i > 0 || this.target instanceof olleh.maps.vector.Polygon)) {
          var existing2 = this._draggableVertices2[k];
          if (existing2) {
            existing2.setOptions({
              path: path,
              index: i
            });
          } else {
            var vertex = new olleh.maps.plugin.drawing.AddVertexHandle({
              editHandler: this,
              path: path,
              index: i,
              map: this.target.map
            });
            this._draggableVertices2.push(vertex);
          }
        }
        k++;
      }
    }
    var length = this._draggableVertices.length;
    while (k++ < length) {
      var toRemove = this._draggableVertices.pop();
      toRemove.setMap(null);
      toRemove = this._draggableVertices2.pop();
      toRemove && toRemove.setMap(null);
    }
    var center = this.target.getCenter();
    if (center) {
      if (this._centerHandle) {
        this._centerHandle.setPosition(center);
      } else {
        this._centerHandle = new olleh.maps.plugin.drawing.EditingHandle({
          map: this.target.map,
          position: center
        });
        this._centerHandle.onEvent('drag', this._onCenterDrag, this);
      }
    }
  },

  _getPaths: function () {
    var paths;
    if (this.target.getPath) {
      paths = [ this.target.getPath() ];
    } else {
      paths = this.target.getPaths();
    }
    return paths;
  },

  _onCenterDrag: function (event) {
    var oldCenter = this._centerHandle.getPosition();
    var coord = event.getCoord();
    var dx = coord.x - oldCenter.x;
    var dy = coord.y - oldCenter.y;
    this._centerHandle.setPosition(coord);
    var draggableVertices = this._draggableVertices;
    for (var i = 0; i < draggableVertices.length; i++) {
      var vertex = draggableVertices[i];
      var pos = vertex.getPosition().clone();
      pos.x += dx;
      pos.y += dy;
      vertex.setPosition(pos);
    }
    draggableVertices = this._draggableVertices2;
    for (var i = 0; i < draggableVertices.length; i++) {
      var vertex = draggableVertices[i];
      var pos = vertex.getPosition().clone();
      pos.x += dx;
      pos.y += dy;
      vertex.setPosition(pos);
    }
    var paths = this._getPaths();
    for (var i = 0; i < paths.length; i++) {
      var path = paths[i];
      var coords = path.getCoords();
      for (var j = 0; j < coords.length; j++) {
        var a = coords[j].clone();
        a.x += dx;
        a.y += dy;
        coords[j] = a;
      }
    }
    this.target.draw();
  },

  deactivate: function () {
    var draggableVertices = this._draggableVertices;
    this._draggableVertices = null;
    for (var i = 0; i < draggableVertices.length; i++) {
      draggableVertices[i].setMap(null);
    }
    draggableVertices = this._draggableVertices2;
    this._draggableVertices2 = null;
    for (var i = 0; i < draggableVertices.length; i++) {
      draggableVertices[i].setMap(null);
    }
    this._centerHandle.setMap(null);
    this._centerHandle = null;
  }

});

olleh.maps.vector.Vector.prototype.editHandlerRegistry['olleh.maps.vector.Polyline'] = olleh.maps.plugin.drawing.EditPolyline;/**
 * EditRectangle
 * @private
 */
$class('olleh.maps.plugin.drawing.EditRectangle').extend(olleh.maps.vector.EditHandler).define({

  activate: function () {
    var rectangle = this.target;
    if (!rectangle)
      return;
    var bounds = rectangle.getBounds();
    var handle = new olleh.maps.plugin.drawing.EditingHandle({
      map: rectangle.map,
      position: bounds.getLeftTopCoord()
    });
    this._leftTopHandle = handle;
    handle.onEvent('drag', this._onDrag, this);
    handle = new olleh.maps.plugin.drawing.EditingHandle({
      map: rectangle.map,
      position: bounds.rightTop
    });
    this._rightTopHandle = handle;
    handle.onEvent('drag', this._onDrag, this);
    handle = new olleh.maps.plugin.drawing.EditingHandle({
      map: rectangle.map,
      position: bounds.getRightBottomCoord()
    });
    this._rightBottomHandle = handle;
    handle.onEvent('drag', this._onDrag, this);
    handle = new olleh.maps.plugin.drawing.EditingHandle({
      map: rectangle.map,
      position: bounds.leftBottom
    });
    this._leftBottomHandle = handle;;
    handle.onEvent('drag', this._onDrag, this);
    
    handle = new olleh.maps.plugin.drawing.EditingHandle({
      map: rectangle.map,
      position: bounds.getCenter()
    });
    this._centerHandle = handle;
    handle.onEvent('drag', this._onDrag, this);
  },

  _onDrag: function (event, payload) {
    event.preventDefault();
    var coord = event.getCoord();
    var handle = event.getSource();
    var oppositePoint;
    var rightTop = this._rightTopHandle.getPosition().clone();
    var leftBottom = this._leftBottomHandle.getPosition().clone();
    var leftTop = this._leftTopHandle.getPosition().clone();
    var rightBottom = this._rightBottomHandle.getPosition().clone();
    if (handle === this._leftTopHandle) {
      oppositePoint = this._rightBottomHandle.getPosition();
      rightTop.y = coord.y;
      leftBottom.x = coord.x;
      leftTop = coord;
    } else if (handle === this._rightTopHandle) {
      oppositePoint = this._leftBottomHandle.getPosition();
      leftTop.y = coord.y;
      rightBottom.x = coord.x;
      rightTop = coord;
    } else if (handle === this._rightBottomHandle) {
      oppositePoint = this._leftTopHandle.getPosition();
      rightTop.x = coord.x;
      leftBottom.y = coord.y;
      rightBottom = coord;
    } else if (handle === this._leftBottomHandle) {
      oppositePoint = this._rightTopHandle.getPosition();
      leftTop.x = coord.x;
      rightBottom.y = coord.y;
      leftBottom = coord;
    } else if(handle === this._centerHandle) {
      var center = this._centerHandle.getPosition();
      var dx = event.getCoord().x - center.x;
      var dy = event.getCoord().y - center.y;
      rightTop.x += dx;
      rightTop.y += dy;
      leftBottom.x += dx;
      leftBottom.y += dy;
      leftTop.x += dx;
      leftTop.y += dy;
      rightBottom.x += dx;
      rightBottom.y += dy;
      coord = leftTop;
      oppositePoint = rightBottom;
    }
    var left = Math.min(coord.x, oppositePoint.x);
    var bottom = Math.min(coord.y, oppositePoint.y);
    var right = Math.max(coord.x, oppositePoint.x);
    var top = Math.max(coord.y, oppositePoint.y);
    bounds = new olleh.maps.Bounds(new olleh.maps.UTMK(left,bottom), new olleh.maps.UTMK(right,top));
    this.target.setBounds(bounds);
    
    this._rightTopHandle.setPosition(rightTop);
    this._leftBottomHandle.setPosition(leftBottom);
    this._leftTopHandle.setPosition(leftTop);
    this._rightBottomHandle.setPosition(rightBottom);
    this._centerHandle.setPosition(bounds.getCenter());
  },
  
  refresh: function() {
    var bounds = this.target.getBounds();
    this._rightTopHandle.setPosition(bounds.rightTop);
    this._leftBottomHandle.setPosition(bounds.leftBottom);
    this._leftTopHandle.setPosition(bounds.getLeftTopCoord());
    this._rightBottomHandle.setPosition(bounds.getRightBottomCoord());
    this._centerHandle.setPosition(bounds.getCenter());
  },

  deactivate: function () {
    this._rightTopHandle.setMap(null);
    this._leftBottomHandle.setMap(null);
    this._leftTopHandle.setMap(null);
    this._rightBottomHandle.setMap(null);
    this._centerHandle.setMap(null);
  }

});

olleh.maps.vector.Vector.prototype.editHandlerRegistry['olleh.maps.vector.Rectangle'] = olleh.maps.plugin.drawing.EditRectangle;/**
 * EditPolygon
 * @private
 */
$class('olleh.maps.plugin.drawing.EditPolygon').extend(olleh.maps.plugin.drawing.EditPolyline).define({

});

olleh.maps.vector.Vector.prototype.editHandlerRegistry['olleh.maps.vector.Polygon'] = olleh.maps.plugin.drawing.EditPolygon;/**
 * EditCircle
 * @private
 */
$class('olleh.maps.plugin.drawing.EditCircle').extend(olleh.maps.vector.EditHandler).define({

  activate: function() {
    var circle = this.target;
    if(!circle)
      return;
    var handle = new olleh.maps.plugin.drawing.EditingHandle({
      map: circle.map,
      position: circle.getCenter()
    });
    handle.onEvent('drag', this._onCenterDrag, this);
    this._centerHandle = handle;
    
    var threeClock = circle.getCenter().clone();
    threeClock.x += circle.getRadius();
    handle = new olleh.maps.plugin.drawing.EditingHandle({
      map: circle.map,
      position: threeClock
    });
    handle.onEvent('drag', this._onRadiusDrag, this);
    this._radiusHandle = handle;
  },
  
  refresh: function() {
    var circle = this.target;
    this._centerHandle.setPosition(circle.getCenter());
    var threeClock = circle.getCenter().clone();
    threeClock.x += circle.getRadius();
    this._radiusHandle.setPosition(threeClock);
  },
  
  _onCenterDrag: function(event, payload) {
    var coord = event.getCoord();
    var circle = this.target;
    var dx = coord.x - circle.getCenter().x;
    var dy = coord.y - circle.getCenter().y;
    circle.setCenter(coord);
    var threeClock = this._radiusHandle.getPosition();
    threeClock.x += dx;
    threeClock.y += dy;
    this._radiusHandle.setPosition(threeClock.clone());
  },
  
  _onRadiusDrag: function(event, payload) {
    var r = this.target.getCenter().distanceTo(event.getCoord());
    this.target.setRadius(r);
  },
  
  deactivate: function() {
    this._centerHandle.setMap(null);
    this._radiusHandle.setMap(null);
  }

});

olleh.maps.vector.Vector.prototype.editHandlerRegistry['olleh.maps.vector.Circle'] = olleh.maps.plugin.drawing.EditCircle;/**
 * EditingHandle
 * @private
 */
$class('olleh.maps.plugin.drawing.EditingHandle').extend(olleh.maps.overlay.PointedOverlay).define({
  
  defaultStyles: {
    width:  '11px',
    height: '11px',
    marginLeft: '-5px',
    marginTop: '-5px'
  },
  
  update: function() {
    if(!this.div) {
      this.div = new olleh.maps.SpritedImage();
      this.div.setImage(
          olleh.maps.env.RESOURCE_URL + 'img/controls.png',
          new olleh.maps.Point(127,145)
      );
      this.div.setStyles(this.defaultStyles);
      olleh.maps.util.dom.setStyle(this.div.elem, 'userSelect', 'none');
      this.registerElement('upper_overlay_pane', this.div.elem);
      this.registerEventDom(this.div.elem);
    }
    olleh.maps.plugin.drawing.EditingHandle.$super.update.apply(this, arguments);
  },
  
  $capture_dragstart: function(event, payload) {
    event.preventDefault();
  },
  
  $capture_dragend: function(event, payload) {
    event.preventDefault();
    var coord = this.getLayer().layerMgr.getCoordFromLayerPx(this._currentLayerPx);
    this.setPosition(coord);
  },

  $capture_drag: function (event, payload) {
    event.preventDefault();
    this.move(payload.movementXY);
  }
});/**
 * PathEditingHandle
 * @private
 */
$class('olleh.maps.plugin.drawing.PathEditingHandle').extend(olleh.maps.plugin.drawing.EditingHandle).define({
  /**
   * Constructor
   * @param {olleh.maps.plugin.drawing.EditHandler} opts.editHandler
   * @param {olleh.maps.Path} opts.path
   * @param {Number} opts.index
   */
  PathEditingHandle: function (opts) {
    this._editHandler = opts.editHandler;
    this._path = opts.path;
    this._index = opts.index;
    this.setPosition(this._path.getAt(this._index));
  },
  
  setOptions: function(opts) {
    if(opts.path && opts.index !== undefined) {
      this._path = opts.path;
      this._index = opts.index;
      this.setPosition(this._path.getAt(this._index));
    } 
    olleh.maps.plugin.drawing.PathEditingHandle.$super.setOptions.apply(this, arguments);
  },

  $capture_dragstart: function(event, payload) {
    event.preventDefault();
  },
  
  $capture_dragend: function(event, payload) {
    event.preventDefault();
    var coord = this.getLayer().layerMgr.getCoordFromLayerPx(this._currentLayerPx);
    this.setPosition(coord);
  },

  $capture_drag: function (event, payload) {
    event.preventDefault();
    this.move(payload.movementXY);
    var coord = this.getLayer().layerMgr.getCoordFromLayerPx(this._currentLayerPx);
    this._path.setAt(this._index, coord);
  }

});/**
 * AddVertexHandle
 * @private
 */
$class('olleh.maps.plugin.drawing.AddVertexHandle').extend(olleh.maps.plugin.drawing.EditingHandle).define({
  
  defaultStyles: {
    width:  '11px',
    height: '11px',
    marginLeft: '-5px',
    marginTop: '-5px',
    opacity: '.5'
  },
  
  /**
   * Constructor
   * @param {olleh.maps.Path} opts.path 
   * @param {Number} opts.index 
   */
  AddVertexHandle: function (opts) {
    this._editHandler = opts.editHandler;
    this._setOptions(opts);
  },
  
  _setOptions: function(opts) {
    this._path = opts.path;
    this._index = opts.index;
    var coords = opts.path.getCoords();
    var prevIndex = opts.index === 0 ? coords.length-1 : opts.index-1;
    var point1 = coords[prevIndex];
    var point2 = coords[opts.index];
    var point = point1.clone();
    point.x += (point2.x - point1.x) / 2;
    point.y += (point2.y - point1.y) / 2;
    this.setPosition(point);
  },

  setOptions: function (opts) {
    if (opts.path && opts.index !== undefined) {
      this._setOptions(opts);
    }
    olleh.maps.plugin.drawing.AddVertexHandle.$super.setOptions.apply(this, arguments);
  },

  $capture_dragstart: function (event, payload) {
    event.preventDefault();
    var newPoint = event.getCoord().clone();
    this._editHandler._onChanging = true;
    this._path.insertAt(this._index, newPoint);
  },

  $capture_dragend: function (event, payload) {
    event.preventDefault();
    var coord = this.getLayer().layerMgr.getCoordFromLayerPx(this._currentLayerPx);
    this.setPosition(coord);
    this._editHandler._onChanging = false;
    this._editHandler.target.draw();
  },

  $capture_drag: function (event, payload) {
    event.preventDefault();
    this.move(payload.movementXY);
    var coord = this.getLayer().layerMgr.getCoordFromLayerPx(this._currentLayerPx);
    this._path.setAt(this._index, coord);
  }

});