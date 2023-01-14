package kr.co.iousoft.lib.core.service.impl;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import kr.co.iousoft.lib.core.global.ServiceGlobal;

public class AbstractServiceImpl {

	protected Logger logger = LogManager.getLogger(getClass());
	
	public static final String API_RESULT_CODE_SUCCESS = "00000"; 

	@Resource(name = "serviceGlobal")
	protected ServiceGlobal serviceGlobal;

}
