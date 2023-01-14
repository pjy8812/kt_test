package com.kt.klp.adm.admin.help.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.kt.klp.adm.admin.common.service.CommonService;

import kr.co.iousoft.lib.core.service.impl.AbstractServiceImpl;
import kr.co.iousoft.lib.core.service.vo.session.SessionVO;

/**
*
* HelpAdminService : APP/WEB 공통 service
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.02.22       Mijin Kim     Initial creation
* </pre>
*
* @author IOUSOFT Mijin Kim (mijin.kim@iousoft.co.kr)
* @since 2022.02.22
* @version 1.0.0
* @see
*
*/

@Service("helpAdminService")
public class HelpAdminService extends AbstractServiceImpl {
	
	@Value("${api.ktapiAdmin}")
	private String ktapiAdmin;

	@Autowired
	protected CommonService commonService;
	
	/**
	 * FAQ카테고리 조회
	 * @return
	 * @throws Exception
	 */
	public List listFaqCategory(SessionVO sessionVO) throws Exception {
		List list = commonService.listCode(sessionVO, "faqCategory"); 
		//logger.debug("{}", list);
		return list;
	}
}
