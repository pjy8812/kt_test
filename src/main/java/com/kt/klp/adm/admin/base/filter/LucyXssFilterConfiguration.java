package com.kt.klp.adm.admin.base.filter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.web.filter.CommonsRequestLoggingFilter;
import org.springframework.context.annotation.Configuration;

import com.navercorp.lucy.security.xss.servletfilter.XssEscapeServletFilter;

/**
*
* LucyXssFilterConfiguration :
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.01.12       Jungeun Cho     Initial creation
* </pre>
*
* @author IOUSOFT Jungeun Cho (josee@iousoft.co.kr)
* @since 2022.01.12
* @version 1.0.0
* @see
*
*/

@Configuration
public class LucyXssFilterConfiguration {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Bean
	public FilterRegistrationBean<XssEscapeServletFilter> xssEscapeServletFilter(){
		FilterRegistrationBean<XssEscapeServletFilter> registerationBean = new FilterRegistrationBean<XssEscapeServletFilter>();
		registerationBean.setFilter(new XssEscapeServletFilter());
		registerationBean.setOrder(1);
		registerationBean.addUrlPatterns("/*");
		return registerationBean;
	}

	@Bean
	public CommonsRequestLoggingFilter commonsRequestLoggingFilter() {
		CommonsRequestLoggingFilter filter = new CommonsRequestLoggingFilter();
		filter.setIncludeClientInfo(true);
		filter.setIncludeHeaders(true);
		filter.setIncludePayload(true);
		filter.setIncludeQueryString(true);
		filter.setMaxPayloadLength(1000);
		return filter;
	}
}
