package kr.co.iousoft.lib.util.web;

import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * <code>AbstractUrlForward</code>
 */
public abstract class AbstractUrlForward implements UrlForward {
	protected Logger logger = LogManager.getLogger(getClass());

	protected String requestURL;
	protected String method;
	protected HttpURLConnection httpConn;
	protected String charset;
	protected OutputStream outputStream;
	protected PrintWriter writer;
	protected HttpServletRequest request;
	protected List<String> dontSendField;	

    StringBuffer postData;
    int status;


	public AbstractUrlForward(String requestURL) throws Exception {
		this(requestURL, METHOD_POST, null, DEFAULT_CHARSET);
	}

	public AbstractUrlForward(String requestURL, String method) throws Exception {
		this(requestURL, method, null, DEFAULT_CHARSET);
	}

	public AbstractUrlForward(String requestURL, HttpServletRequest request) throws Exception {
		this(requestURL, METHOD_POST, request, DEFAULT_CHARSET);
	}

	public AbstractUrlForward(String requestURL, String method, HttpServletRequest request) throws Exception {
		this(requestURL, method, request, DEFAULT_CHARSET);
	}

	public AbstractUrlForward(String requestURL, String method, HttpServletRequest request, String charset) throws Exception {
		this(requestURL, method, request, charset, null);
	}

	public AbstractUrlForward(String requestURL, String method, HttpServletRequest request, String charset, String[] dontSendField)
			throws Exception {
		this(requestURL, method, request, charset, null, null);
	}
	public AbstractUrlForward(String requestURL, String method, HttpServletRequest request, String charset, String[] dontSendField, Map headers)
			throws Exception {
		String tempCharset = charset;
		if (charset == null) {
			tempCharset = DEFAULT_CHARSET;
		}
		
		String url = requestURL;
		if (url.toLowerCase().startsWith("http://")) {
			if(url.indexOf("/v1/admin/login") > -1 || url.indexOf("/v1/admin/logout") > -1) {
				url = url.replace("/v1/admin", "/v1/openapi/admin");
			}else if(url.indexOf("/v1/admin") > -1) {
				url = url.replace("/v1/admin", "/v1/api/admin");
			}else if(url.indexOf("/v1/code") > -1) {
				url = url.replace("/v1/code", "/v1/api/code");
			}else if(url.indexOf("/v1/otp") > -1) {
				url = url.replace("/v1/otp", "/v1/openapi/otp");
			}
		}
		
		this.requestURL = url;
		this.method = method;
		this.request = request;
		this.charset = tempCharset;
		this.dontSendField = new ArrayList<String>();
		if (dontSendField != null) {
			for (int i = 0; i < dontSendField.length; i++) {
				this.dontSendField.add(dontSendField[i]);
			}
		}

		initMembers();
		initHeader(headers);
	}

	protected abstract void initMembers() throws Exception;

	protected void initHeader() throws Exception {
		initHeader(null);
	}
	protected void initHeader(Map headers) throws Exception {
		URL url = null;
		if (METHOD_GET.equals(method)) {
			String getRequestURL = requestURL +"?"+ postData.toString();
			url = new URL(getRequestURL);
		} else {
			url = new URL(requestURL);
		}
		
		httpConn = (HttpURLConnection) url.openConnection();
		if (requestURL.toLowerCase().startsWith("https://")) {
			setHttps();
		}		

		httpConn.setUseCaches(false);
		httpConn.setDoInput(true);
		if (METHOD_POST.equals(method)) {
			httpConn.setDoOutput(true); // indicates POST method
			httpConn.setRequestMethod("POST");
		}
		setContentType();
		httpConn.setRequestProperty("User-Agent", "Application Service Agent");
		setHeaders(headers);
		if (request != null) {
			httpConn.setRequestProperty("Cookie", request.getHeader("Cookie"));

			Enumeration<String> enumeration = request.getParameterNames();
			while (enumeration.hasMoreElements()) {
				String key = enumeration.nextElement();
				if (dontSendField.contains(key))
					continue;
				String values[] = request.getParameterValues(key);
				for (int i = 0; i < values.length; i++) {
					addFormField(key, values[i]);
				}
			}
		}
	}

	private void setHeaders(Map headers) {
		if (headers == null) return;
		
		Iterator iterator = headers.keySet().iterator();
		while (iterator.hasNext()) {
			String name = (String)iterator.next();
			String value = (String)headers.get(name);
			httpConn.setRequestProperty(name, value);
		}
	}
	/**
	 * @throws Exception 
	 * 
	 */
	private void setHttps() throws Exception {
		HttpsURLConnection httpsConn = (HttpsURLConnection) httpConn;
		// Set Hostname verification
		httpsConn.setHostnameVerifier(new HostnameVerifier() {
			@Override
			public boolean verify(String hostname, SSLSession session) {
				// Ignore host name verification. It always returns true.
				return true;
			}
		});
		TrustManager[] trustAllCerts = new TrustManager[] { new X509TrustManager() {
			public X509Certificate[] getAcceptedIssuers() {
				return null;
			}
			
			public void checkClientTrusted(X509Certificate[] certs, String authType) {
			}
			
			public void checkServerTrusted(X509Certificate[] certs, String authType) {
			}
		} };

		// SSL setting
		SSLContext context = SSLContext.getInstance("SSL");
		context.init(null, trustAllCerts, new java.security.SecureRandom());
		httpsConn.setSSLSocketFactory(context.getSocketFactory());
	}

	protected abstract void setContentType();

	public String getResponse() throws Exception {
		String responseString = finish();

		return responseString;
	}

	protected abstract String finish() throws Exception;
}
