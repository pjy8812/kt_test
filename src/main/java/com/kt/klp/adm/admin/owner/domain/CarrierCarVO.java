package com.kt.klp.adm.admin.owner.domain;

import kr.co.iousoft.lib.core.vo.CommonTableVO;

/**
*
* CarOwnerVO : 회원관리> 운송대행사 vo
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2023.01.02       Seongrae Kim     Initial creation
* </pre>
*
* @author PARUCNC Seongrae Kim (akaikarus@parucnc.com)
* @since 2023.01.02
* @version 1.0.0
* @see
*
*/

public class CarrierCarVO extends CommonTableVO{

	private String carrierId;
	private String carrierCorporateRegistrationNumber;
	private String carrierCarNum;
	private String carrierCarType;
	private String carrierCarModel;
	private String carrierCarOption;
	private String carrierCarPackagingType;
	private String carrierCarModifyDateTime;
	private String carrierCarDeleteYn;
	private String carrierCarDeleteDate;
	private String carrierNum;
	
	public String getCarrierId() {
		return carrierId;
	}
	public void setCarrierId(String carrierId) {
		this.carrierId = carrierId;
	}
	public String getCarrierCorporateRegistrationNumber() {
		return carrierCorporateRegistrationNumber;
	}
	public void setCarrierCorporateRegistrationNumber(String carrierCorporateRegistrationNumber) {
		this.carrierCorporateRegistrationNumber = carrierCorporateRegistrationNumber;
	}
	public String getCarrierCarNum() {
		return carrierCarNum;
	}
	public void setCarrierCarNum(String carrierCarNum) {
		this.carrierCarNum = carrierCarNum;
	}
	public String getCarrierCarType() {
		return carrierCarType;
	}
	public void setCarrierCarType(String carrierCarType) {
		this.carrierCarType = carrierCarType;
	}
	public String getCarrierCarModel() {
		return carrierCarModel;
	}
	public void setCarrierCarModel(String carrierCarModel) {
		this.carrierCarModel = carrierCarModel;
	}
	public String getCarrierCarOption() {
		return carrierCarOption;
	}
	public void setCarrierCarOption(String carrierCarOption) {
		this.carrierCarOption = carrierCarOption;
	}
	public String getCarrierCarPackagingType() {
		return carrierCarPackagingType;
	}
	public void setCarrierCarPackagingType(String carrierCarPackagingType) {
		this.carrierCarPackagingType = carrierCarPackagingType;
	}
	public String getCarrierCarModifyDateTime() {
		return carrierCarModifyDateTime;
	}
	public void setCarrierCarModifyDateTime(String carrierCarModifyDateTime) {
		this.carrierCarModifyDateTime = carrierCarModifyDateTime;
	}
	public String getCarrierCarDeleteYn() {
		return carrierCarDeleteYn;
	}
	public void setCarrierCarDeleteYn(String carrierCarDeleteYn) {
		this.carrierCarDeleteYn = carrierCarDeleteYn;
	}
	public String getCarrierCarDeleteDate() {
		return carrierCarDeleteDate;
	}
	public void setCarrierCarDeleteDate(String carrierCarDeleteDate) {
		this.carrierCarDeleteDate = carrierCarDeleteDate;
	}
	public String getCarrierNum() {
		return carrierNum;
	}
	public void setCarrierNum(String carrierNum) {
		this.carrierNum = carrierNum;
	}
	
	
}
