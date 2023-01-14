package com.kt.klp.adm.admin.stats.domain;

import java.util.List;

import kr.co.iousoft.lib.core.vo.CommonTableVO;

/**
*
* StatisticsVO : 통계 vo
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.05.01       Jungeun Cho     Initial creation
* </pre>
*
* @author IOUSOFT Jungeun Cho (josee@iousoft.co.kr)
* @since 2022.05.01
* @version 1.0.0
* @see
*
*/
public class StatisticsVO extends CommonTableVO {

	public static final String DATA_TOTAL_STRING = "Total";
	public static final String DATA_TOTAL_FLAG_STRING = "totFlag";

	public static final String DATA_TOTAL_FLAG_FALSE_STRING = "1"; // 일반 
	public static final String DATA_TOTAL_FLAG_TRUE_STRING = "2"; // 합계 
	
	public static final String DATA_TYPE_COUNT = "count"; //건수
	public static final String DATA_TYPE_AMOUNT = "amount"; //금액
	
	public static final String DATA_BASIS_DATE_YEAR = "year";
	public static final String DATA_BASIS_DATE_MONTH = "month";
	public static final String DATA_BASIS_DATE_DAY = "day";
	
	String basisDate;
	String startDate;
	String endDate;
	
	String dataType;			//데이터 조회타입(건수/금액)
	String freightOwnerType;	//화주별 - 사업자유형
	String businessType;		//화주별 - 사업자구분
	List location;				//구간별 - 지역코드
	List carList;				//차량별 - 차종,톤수
	String statsType;			//배송조건별 - 통계기준(톤급별/제품별/온도별)

	public String getBasisDate() {
		return basisDate;
	}

	public void setBasisDate(String basisDate) {
		this.basisDate = basisDate;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getDataType() {
		return dataType;
	}

	public void setDataType(String dataType) {
		this.dataType = dataType;
	}

	public String getFreightOwnerType() {
		return freightOwnerType;
	}

	public void setFreightOwnerType(String freightOwnerType) {
		this.freightOwnerType = freightOwnerType;
	}

	public String getBusinessType() {
		return businessType;
	}

	public void setBusinessType(String businessType) {
		this.businessType = businessType;
	}

	public List getLocation() {
		return location;
	}

	public void setLocation(List location) {
		this.location = location;
	}

	public List getCarList() {
		return carList;
	}

	public void setCarList(List carList) {
		this.carList = carList;
	}

	public String getStatsType() {
		return statsType;
	}

	public void setStatsType(String statsType) {
		this.statsType = statsType;
	}
	
}
