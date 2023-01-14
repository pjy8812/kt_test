
package kr.co.iousoft.lib.core.service.vo.code;

import java.util.Map;

import kr.co.iousoft.lib.core.vo.CommonTableVO;

public class MessageSourceVO extends CommonTableVO {
	
	String msgSrcId;
	String codeId;
	String langCode;
	String codeValue;
	
	/**
	 * 
	 */
	public MessageSourceVO() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param map
	 */
	public MessageSourceVO(Map map) {
		super(map);
		// TODO Auto-generated constructor stub
	}

	public String getMsgSrcId() {
		return msgSrcId;
	}

	public void setMsgSrcId(String msgSrcId) {
		this.msgSrcId = msgSrcId;
	}


	public String getCodeId() {
		return codeId;
	}

	public void setCodeId(String codeId) {
		this.codeId = codeId;
	}

	public String getLangCode() {
		return langCode;
	}

	public void setLangCode(String langCode) {
		this.langCode = langCode;
	}

	public String getCodeValue() {
		return codeValue;
	}

	public void setCodeValue(String codeValue) {
		this.codeValue = codeValue;
	}

}
