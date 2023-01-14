
package kr.co.iousoft.lib.core.service.vo.code;

import java.math.BigDecimal;
import java.sql.Timestamp;

import kr.co.iousoft.lib.core.vo.CommonTableVO;

public class CommonCodeVO extends CommonTableVO {
	
	Integer codeSqn;
	String code;
	String codeName;
	BigDecimal seq;
	
	String upCode;
	String codeDesc;
	String codeValue;
	
	Timestamp createDt;
	Integer createUserSqn;
	Timestamp modifyDt;
	Integer modifyUserSqn;

	public Integer getCodeSqn() {
		return codeSqn;
	}

	public void setCodeSqn(Integer codeSqn) {
		this.codeSqn = codeSqn;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getCodeName() {
		return codeName;
	}

	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}

	public BigDecimal getSeq() {
		return seq;
	}

	public void setSeq(BigDecimal seq) {
		this.seq = seq;
	}

	public String getUpCode() {
		return upCode;
	}

	public void setUpCode(String upCode) {
		this.upCode = upCode;
	}

	public String getCodeDesc() {
		return codeDesc;
	}

	public void setCodeDesc(String codeDesc) {
		this.codeDesc = codeDesc;
	}

	public String getCodeValue() {
		return codeValue;
	}

	public void setCodeValue(String codeValue) {
		this.codeValue = codeValue;
	}

	public Timestamp getCreateDt() {
		return createDt;
	}

	public void setCreateDt(Timestamp createDt) {
		this.createDt = createDt;
	}

	public void setCreateUserSqn(Integer createUserSqn) {
		this.createUserSqn = createUserSqn;
	}

	public Timestamp getModifyDt() {
		return modifyDt;
	}

	public void setModifyDt(Timestamp modifyDt) {
		this.modifyDt = modifyDt;
	}

	public void setModifyUserSqn(Integer modifyUserSqn) {
		this.modifyUserSqn = modifyUserSqn;
	}


}
