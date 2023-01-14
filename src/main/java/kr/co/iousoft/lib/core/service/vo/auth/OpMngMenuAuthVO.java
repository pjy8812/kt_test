package kr.co.iousoft.lib.core.service.vo.auth;

import java.sql.Timestamp;

/**
*
* OpMngMenuAuthVO : 
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2021.04.15       Jungeun Cho     Initial creation
* </pre>
*
* @author IOUSOFT Jungeun Cho (josee@iousoft.co.kr)
* @since 2021.04.15
* @version 1.0.0
* @see
*
*/
public class OpMngMenuAuthVO {
	public static String AUTH_TYPE_CREATE = "C";
	public static String AUTH_TYPE_READ = "R";
	public static String AUTH_TYPE_UPDATE = "U";
	public static String AUTH_TYPE_DELETE = "D";
	public static String AUTH_TYPE_EXCEL = "E";
	public static String AUTH_TYPE_MASK = "M";

	public static String TYPE_STRING = "string";
	public static String TYPE_EMAIL = "email";
	public static String TYPE_MOBILE = "mobile";

	Integer menuSqn;
	String menuId;
	String authCode;

	Timestamp  createDt;
	Integer createUserSqn;
	Timestamp modifyDt;
	Integer modifyUserSqn;

	String authType;

	public OpMngMenuAuthVO() {
		super();
	}

	public Integer getMenuSqn() {
		return menuSqn;
	}

	public void setMenuSqn(Integer menuSqn) {
		this.menuSqn = menuSqn;
	}

	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	public String getAuthCode() {
		return authCode;
	}

	public void setAuthCode(String authCode) {
		this.authCode = authCode;
	}

	public Timestamp getCreateDt() {
		return createDt;
	}

	public void setCreateDt(Timestamp createDt) {
		this.createDt = createDt;
	}

	public Integer getCreateUserSqn() {
		return createUserSqn;
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

	public Integer getModifyUserSqn() {
		return modifyUserSqn;
	}

	public void setModifyUserSqn(Integer modifyUserSqn) {
		this.modifyUserSqn = modifyUserSqn;
	}

	public String getAuthType() {
		return authType;
	}

	public void setAuthType(String authType) {
		this.authType = authType;
	}

	@Override
	public String toString() {
		return "OpMngMenuAuthVO [menuSqn=" + menuSqn + ", menuId=" + menuId + ", authCode=" + authCode + ", createDt="
				+ createDt + ", createUserSqn=" + createUserSqn + ", modifyDt=" + modifyDt + ", modifyUserSqn="
				+ modifyUserSqn + ", authType=" + authType + "]";
	}
	
}
