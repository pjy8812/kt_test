
package kr.co.iousoft.lib.util.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public class UrlForwardFactory {

	public static UrlForward getInstance(String requestURL) throws Exception {
		return getInstance(requestURL, UrlForward.METHOD_POST);
	}

	public static UrlForward getInstance(String requestURL, String method) throws Exception {
		return getInstance(requestURL, method, null);
	}

	public static UrlForward getInstance(String requestURL, HttpServletRequest request) throws Exception {
		return getInstance(requestURL, UrlForward.METHOD_POST, request);
	}

	public static UrlForward getInstance(String requestURL, String method, HttpServletRequest request) throws Exception {
		return getInstance(requestURL, method, request, UrlForward.DEFAULT_CHARSET);
	}

	public static UrlForward getInstance(String requestURL, String method, HttpServletRequest request, String charset) throws Exception {
		return getInstance(requestURL, method, request, charset, null);
	}

	public static UrlForward getInstance(String requestURL, String method, HttpServletRequest request, String charset, String[] dontSendField) throws Exception {
		if (request instanceof MultipartHttpServletRequest) {
			return new HttpUrlMultipartForward(requestURL, UrlForward.METHOD_POST, request, charset, dontSendField, null);
		}
		
		return new HttpUrlForward(requestURL, method, request, charset, dontSendField);
	}
}
