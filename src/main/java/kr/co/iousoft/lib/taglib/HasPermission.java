/*
 * Copyright (c) 2015-2016, IOUSOFT, Corp. All rights reserved.
 * http://www.iousoft.co.kr
 * http://www.campusbetter.com
 * 
 * This software is the confidential and proprietary information of 
 * IOUSOFT, Corp. You shall not disclose such Confidential Information and
 * shall use it only in accordance with the terms of the license agreement
 * you entered into with IOUSOFT, Corp.
 */
package kr.co.iousoft.lib.taglib;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
*
* HasPermission : 
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
public class HasPermission extends AbstracServiceTag {
	
	protected Logger logger = LogManager.getLogger(getClass());

	String menuId;
	
	/**
	 * permission:
	 * create
	 * read
	 * update
	 * delete
	 * mask
	 * excel
	 */
	String permission;

	boolean not;
	
	String value; // for masking
	String type; // for masking
	
	public HasPermission() {
		super();
	}

	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	public String getPermission() {
		return permission;
	}

	public void setPermission(String permission) {
		this.permission = permission;
	}
	
	public boolean isNot() {
		return not;
	}

	public void setNot(boolean not) {
		this.not = not;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	// @Autowired
	// OpMngMenuAuthService opMngMenuAuthService;

	@Override
	protected int doServiceStartTagInternal() throws Exception {
		
		return super.SKIP_BODY;
		
//		opMngMenuAuthService = getBean("opMngMenuAuthService");
//		
//		SessionVO sessionVO = serviceGlobal.getSessionVO((HttpServletRequest) pageContext.getRequest(),
//				(HttpServletResponse) pageContext.getResponse());
//		
//		if (sessionVO == null)
//			return super.SKIP_BODY;
//		
//		OpMngMenuAuthVO vo = new OpMngMenuAuthVO();
//		vo.setMenuId(menuId);
//		vo.setAuthCode(sessionVO.getAuthCode());
//		
//		switch (permission) {
//		case "create":
//			vo.setAuthType("C");
//			break;
//		case "read":
//			vo.setAuthType("R");
//			break;
//		case "update":
//			vo.setAuthType("U");
//			break;
//		case "delete":
//			vo.setAuthType("D");
//			break;
//		case "mask":
//			vo.setAuthType("M");
//			break;
//		case "excel":
//			vo.setAuthType("E");
//			break;
//		default:
//			vo.setAuthType(null);
//			break;
//		}
//		
//		boolean result = opMngMenuAuthService.hasAuth(vo);
//		
//		if (not) result = !result;
//		
//		if(result) {
//			if (permission.equals("mask")) {
//				// mask
//				write(UtilFunctions.masking(value, type));
//			}
//			return super.EVAL_BODY_INCLUDE;
//		} else {
//			if (permission.equals("mask")) {
//				// mask
//				write(value);
//			}
//			return super.SKIP_BODY;
//		}
	}


}
