package com.kt.klp.adm.admin.help.domain;

import java.util.Map;

import kr.co.iousoft.lib.core.vo.CommonTableVO;

/**
*
* SmsVO : APP/WEB> 문자 vo
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.03.07       Mijin Kim     Initial creation
* </pre>
*
* @author IOUSOFT Mijin Kim (mijin.kim@iousoft.co.kr)
* @since 2022.03.07
* @version 1.0.0
* @see
*
*/

public class SmsVO extends CommonTableVO{

	String ownerClassification;	//구분 (수신그룹)
	String sendMsg;				//발송문구
	String sendTitle;			//제목
	
	public SmsVO() {};
	public SmsVO(Map map) {
		super(map);
	}
	
	/**
	 * @return the ownerClassification
	 */
	public String getOwnerClassification() {
		return ownerClassification;
	}
	/**
	 * @param ownerClassification the ownerClassification to set
	 */
	public void setOwnerClassification(String ownerClassification) {
		this.ownerClassification = ownerClassification;
	}
	/**
	 * @return the sendMsg
	 */
	public String getSendMsg() {
		return sendMsg;
	}
	/**
	 * @param sendMsg the sendMsg to set
	 */
	public void setSendMsg(String sendMsg) {
		this.sendMsg = sendMsg;
	}
	/**
	 * @return the sendTitle
	 */
	public String getSendTitle() {
		return sendTitle;
	}
	/**
	 * @param sendTitle the sendTitle to set
	 */
	public void setSendTitle(String sendTitle) {
		this.sendTitle = sendTitle;
	}
}
