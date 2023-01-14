
package kr.co.iousoft.lib.taglib;

import java.io.IOException;
import java.util.Locale;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

import kr.co.iousoft.lib.core.global.ServiceGlobal;

public abstract class AbstracServiceTag extends RequestContextAwareTag {
	
	protected Logger logger = LogManager.getLogger(getClass());

	ServiceGlobal serviceGlobal;
	
	private WebApplicationContext webApplicationContext;

	/* (non-Javadoc)
	 * @see org.springframework.web.servlet.tags.RequestContextAwareTag#doStartTagInternal()
	 */
	@Override
	protected int doStartTagInternal() throws Exception {
		webApplicationContext = super.getRequestContext().getWebApplicationContext();
		
 		serviceGlobal = getBean("serviceGlobal");
		
		return doServiceStartTagInternal();
	}
	
	protected <T extends Object> T getBean(String beanName) {
		return (T)webApplicationContext.getBean(beanName);
	}


	protected void write(Object msg) throws IOException {
		pageContext.getOut().write(String.valueOf(msg));
	}
	
	protected abstract int doServiceStartTagInternal() throws Exception;

	protected Locale getLocale() throws Exception {
		
		Locale locale = getRequestContext().getLocale();
		
		return locale;
	}
}
