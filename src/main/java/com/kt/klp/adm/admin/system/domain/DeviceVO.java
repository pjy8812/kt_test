package com.kt.klp.adm.admin.system.domain;

import kr.co.iousoft.lib.core.vo.CommonTableVO;

/**
*
* TerminalVO : 
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.03.04       Jungeun Cho     Initial creation
* </pre>
*
* @author IOUSOFT Jungeun Cho (josee@iousoft.co.kr)
* @since 2022.03.04
* @version 1.0.0
* @see
*
*/
public class DeviceVO extends CommonTableVO {

	public static final String OS_ALL_TYPE = "all";
	
	String carOwnerId; // 차주 아이디
	String carOwnerName; // 차주 명
	String carOwnerTerminalDevice; // 차주 단말기 명
	String carOwnerTerminalOs; // OS
	
	String carOwnerTerminalOSVersion; // OS 버전		
	String carOwnerTerminalAppVersion; // APP 버전		
	
	Long firstLoginStartDate; // 첫 로그인 검색 시작 일자
	Long firstLoginEndDate; // 첫 로그인 검색 종료 일자
	Long joinStartDate; // 첫 로그인 검색 시작 일자
	Long joinEndDate; // 첫 로그인 검색 종료 일자
	Long lastUseStartDate; // 최근 접속일 검색 시작 일자
	Long lastUseEndDate; // 최근 접속일 검색 종료 일자

	String maskingYn;
	
	public String getCarOwnerId() {
		return carOwnerId;
	}

	public void setCarOwnerId(String carOwnerId) {
		this.carOwnerId = carOwnerId;
	}

	public String getCarOwnerName() {
		return carOwnerName;
	}

	public void setCarOwnerName(String carOwnerName) {
		this.carOwnerName = carOwnerName;
	}

	public String getCarOwnerTerminalDevice() {
		return carOwnerTerminalDevice;
	}

	public void setCarOwnerTerminalDevice(String carOwnerTerminalDevice) {
		this.carOwnerTerminalDevice = carOwnerTerminalDevice;
	}

	public String getCarOwnerTerminalOs() {
		return carOwnerTerminalOs;
	}

	public void setCarOwnerTerminalOs(String carOwnerTerminalOs) {
		this.carOwnerTerminalOs = carOwnerTerminalOs;
	}

	public String getCarOwnerTerminalOSVersion() {
		return carOwnerTerminalOSVersion;
	}

	public void setCarOwnerTerminalOSVersion(String carOwnerTerminalOSVersion) {
		this.carOwnerTerminalOSVersion = carOwnerTerminalOSVersion;
	}

	public String getCarOwnerTerminalAppVersion() {
		return carOwnerTerminalAppVersion;
	}

	public void setCarOwnerTerminalAppVersion(String carOwnerTerminalAppVersion) {
		this.carOwnerTerminalAppVersion = carOwnerTerminalAppVersion;
	}

	public Long getFirstLoginStartDate() {
		return firstLoginStartDate;
	}

	public void setFirstLoginStartDate(Long firstLoginStartDate) {
		this.firstLoginStartDate = firstLoginStartDate;
	}

	public Long getFirstLoginEndDate() {
		return firstLoginEndDate;
	}

	public void setFirstLoginEndDate(Long firstLoginEndDate) {
		this.firstLoginEndDate = firstLoginEndDate;
	}

	public Long getJoinStartDate() {
		return joinStartDate;
	}

	public void setJoinStartDate(Long joinStartDate) {
		this.joinStartDate = joinStartDate;
	}

	public Long getJoinEndDate() {
		return joinEndDate;
	}

	public void setJoinEndDate(Long joinEndDate) {
		this.joinEndDate = joinEndDate;
	}

	public Long getLastUseStartDate() {
		return lastUseStartDate;
	}

	public void setLastUseStartDate(Long lastUseStartDate) {
		this.lastUseStartDate = lastUseStartDate;
	}

	public Long getLastUseEndDate() {
		return lastUseEndDate;
	}

	public void setLastUseEndDate(Long lastUseEndDate) {
		this.lastUseEndDate = lastUseEndDate;
	}
	
	public String getMaskingYn() {
		return maskingYn;
	}

	public void setMaskingYn(String maskingYn) {
		this.maskingYn = maskingYn;
	}

}
