package kr.co.iousoft.lib.util.web;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.UnknownHostException;
import java.security.cert.X509Certificate;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.JSONObject;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
*
* WebFunctions : 
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.01.19       Guiyoung Park     Initial creation
* </pre>
*
* @author IOUSOFT Guiyoung Park (gyp@iousoft.co.kr)
* @since 2022.01.19
* @version 1.0.0
* @see
*
*/

public class WebFunctions {
	private static Logger logger = LogManager.getLogger("WebFunctions");
	
	public static final String HEADER_AUTHORIZATION = "Authorization";
	public static final String HEADER_X_CONSUMER_CUSTOM_ID  = "x-consumer-custom-id";
	public static final String HEADER_X_AUTHENTICATED_SCOPE  = "X-Authenticated-Scope";
	public static final String HEADER_X_AUTHENTICATED_SCOPE_VALUE  = "ADMR";
	public static final String HEADER_ADMIN_IP = "adminIp";

	
	/**
	 * longtail api 통신
	 * @param strUrl: 호출할 url
	 * @param headers: 헤더 설정
	 * @param method: GET/POST
	 * @param params: 파라미터
	 * @return 서버에서 응답으로 넘겨준 데이터
	 */
	public static Map connectApi(String requestURL, Map headers, String method, Map params) {
		String strUrl = requestURL;
		Map<String, Object> result = new HashMap<>();
		InputStream in = null;
		BufferedReader reader = null;
		int responseCode = 0; //결과코드
		if(strUrl.indexOf("https") > -1) {
			logger.info("https");
			HttpsURLConnection httpsConn = null;
			
			try {
				httpsConn.setDefaultHostnameVerifier(new CustomVF()); 
				
				// Get HTTPS URL connection
				URL url = new URL(strUrl);

				// set parameters
				StringBuffer parameters = new StringBuffer();
				if(params != null) {
					int idx = 0;
					
			        Iterator<String> key = params.keySet().iterator();
			        while(key.hasNext()) {
			        	String k = key.next();
			        	String connect = "";
			        	
			        	if(idx >= 1) {
			        		connect = "&";
			        	}
			        	parameters.append(connect);
			        	parameters.append(k);
			        	parameters.append("=");
			        	parameters.append(params.get(k));
			        	idx++;
			        }
					url = new URL(strUrl+"?"+parameters);
				}
				httpsConn = (HttpsURLConnection) url.openConnection();
				logger.info("{}", url);
				
				// set header
				if(headers != null) {
					logger.info("{}", headers);
					Iterator<String> keys = headers.keySet().iterator();
					while(keys.hasNext()) {
						String key = keys.next();
						String value = headers.get(key).toString();
						httpsConn.setRequestProperty(key, value);
					}
				}
	
				TrustManager[] trustAllCerts = new TrustManager[] { new X509TrustManager() {
					public X509Certificate[] getAcceptedIssuers() {
						return null;
					}
					
					public void checkClientTrusted(X509Certificate[] certs, String authType) {
					}
					
					public void checkServerTrusted(X509Certificate[] certs, String authType) {
					}
				} };
				
				SSLContext sc = SSLContext.getInstance("SSL");
				sc.init(null, trustAllCerts, new java.security.SecureRandom());
				HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
		         
				// Input setting
				httpsConn.setDoInput(true);
				
				// Output setting
				//httpsConn.setDoOutput(true);
				
				// Caches setting
				httpsConn.setUseCaches(false);
				
				if(strUrl.indexOf("/recompute") > -1) {
					// 요금재계산 timeout 수정 (2022.04.13)
					// Read Timeout Setting
					httpsConn.setReadTimeout(10000);
					
					// Connection Timeout setting
					httpsConn.setConnectTimeout(10000);
				} else {
					// Read Timeout Setting
					httpsConn.setReadTimeout(30000);
					
					// Connection Timeout setting
					httpsConn.setConnectTimeout(30000);
				}
				
				// Method Setting(GET/POST)
				httpsConn.setRequestMethod(method);
				
				responseCode = httpsConn.getResponseCode();
				result.put("status", responseCode);
				
				// SSL setting
				SSLContext context = SSLContext.getInstance("TLS");
				context.init(null, null, null); // No validation for now
				httpsConn.setSSLSocketFactory(context.getSocketFactory());
				
				// Connect to host
				httpsConn.connect();
				httpsConn.setInstanceFollowRedirects(true);
				
				// Print response from host
				if (responseCode == HttpsURLConnection.HTTP_OK) { //정상호출: 200
					in = httpsConn.getInputStream();
				} else { //에러
					in = httpsConn.getErrorStream();
				}
				
				reader = new BufferedReader(new InputStreamReader(in, "utf-8"));
				
				// json to map
			    ObjectMapper mapper = new ObjectMapper();
			    String json = reader.readLine();
	
			    try{
			    	result = mapper.readValue(json, Map.class);
			    	
					if (responseCode == HttpsURLConnection.HTTP_OK) { //정상호출: 200
						result.put("status", responseCode);
					}
			    } catch (JsonParseException e) {
			    	if(responseCode != HttpsURLConnection.HTTP_OK) {
			    		result.put("error", "JsonParseException");
			    		logger.debug("ERROR: JsonParseException");
			    	}
			    	
			    	if(responseCode == HttpsURLConnection.HTTP_NOT_FOUND) { //404일 경우
						result.put("resultCode", "404");
						result.put("resultMsg", "API NOT FOUND");
						return result;
					} else if(responseCode == HttpsURLConnection.HTTP_OK) {
						result.put("coordinate", json); //좌표조회시 return String
						result.remove("error");
					}
				} catch (IOException e){
					logger.debug("ERROR: IOException");
			        result.put("error", e.toString());
			    }
				
				reader.close();
				
			} catch (UnknownHostException e) {
				result.put("error", "UnknownHostException");
			} catch (MalformedURLException e) {
				logger.debug(strUrl + " is invalid URL");
				result.put("error", strUrl + " is invalid URL");
			} catch (IOException e) {
				if(responseCode == HttpsURLConnection.HTTP_OK) { // 200일 경우 성공으로 return
					result.put("resultCode", "00000");
					result.put("resultMsg", "success");
					return result;
				}else {
					result.put("error", e.toString());
				}
			} catch (Exception e) {
				result.put("error", e.toString());
			} finally {
				if (reader != null) {
					try {
						reader.close();
					} catch (IOException e) {
						logger.debug("ERROR: IOException");
						result.put("error", e.toString());
					}
				}
				
				if (httpsConn != null) {
					httpsConn.disconnect();
				}
			}
		} else {
			logger.info("http");
			if(strUrl.indexOf("/v1/admin/login") > -1 || strUrl.indexOf("/v1/admin/reset_pw") > -1) {
				// "/v1/admin/logout" 제외 
				//2022.03.28 "/v1/api/admin/logout" 으로 변경된것으로 디시젼측 확인
				strUrl = strUrl.replace("/v1/admin", "/v1/openapi/admin");
			}else if(strUrl.indexOf("/v1/admin") > -1) {
				strUrl = strUrl.replace("/v1/admin", "/v1/api/admin");
			}else if(strUrl.indexOf("/v1/code") > -1) {
				strUrl = strUrl.replace("/v1/code", "/v1/api/code");
			}else if(strUrl.indexOf("/v1/otp") > -1) {
				strUrl = strUrl.replace("/v1/otp", "/v1/openapi/otp");
			}
			
			HttpURLConnection httpConn = null;
			try {
				// Get HTTPS URL connection
				URL url = new URL(strUrl);

				// set parameters
				StringBuffer parameters = new StringBuffer();
				if(params != null) {
					int idx = 0;
					
			        Iterator<String> key = params.keySet().iterator();
			        while(key.hasNext()) {
			        	String k = key.next();
			        	String connect = "";
			        	
			        	if(idx >= 1) {
			        		connect = "&";
			        	}
			        	parameters.append(connect);
			        	parameters.append(k);
			        	parameters.append("=");
			        	parameters.append(params.get(k));
			        	idx++;
			        }
					url = new URL(strUrl+"?"+parameters);
				}
				httpConn = (HttpURLConnection) url.openConnection();
				logger.info("{}", url);
				
				// set header
				if(headers != null) {
					logger.info("{}", headers);
					Iterator<String> keys = headers.keySet().iterator();
					while(keys.hasNext()) {
						String key = keys.next();
						String value = headers.get(key).toString();
						httpConn.setRequestProperty(key, value);
					}
				}
				
				// Input setting
				httpConn.setDoInput(true);
				
				// Output setting
				//httpConn.setDoOutput(true);
				
				// Caches setting
				httpConn.setUseCaches(false);
				
				if(strUrl.indexOf("/recompute") > -1) {
					// 요금재계산 timeout 수정 (2022.04.13)
					// Read Timeout Setting
					httpConn.setReadTimeout(10000);
					
					// Connection Timeout setting
					httpConn.setConnectTimeout(10000);
				} else {
					// Read Timeout Setting
					httpConn.setReadTimeout(30000);
					
					// Connection Timeout setting
					httpConn.setConnectTimeout(30000);
				}
				
				// Method Setting(GET/POST)
				httpConn.setRequestMethod(method);
				
				responseCode = httpConn.getResponseCode();
				result.put("status", responseCode);
				
				// Connect to host
				httpConn.connect();
				httpConn.setInstanceFollowRedirects(true);
				
				// Print response from host
				if (responseCode == HttpsURLConnection.HTTP_OK) { //정상호출: 200
					in = httpConn.getInputStream();
				} else { //에러
					in = httpConn.getErrorStream();
				}
				
				reader = new BufferedReader(new InputStreamReader(in, "utf-8"));
				
				// json to map
			    ObjectMapper mapper = new ObjectMapper();
			    String json = reader.readLine();
	
			    try{
			    	result = mapper.readValue(json, Map.class);
			    	
					if (responseCode == HttpsURLConnection.HTTP_OK) { //정상호출: 200
						result.put("status", responseCode);
					} 
			    } catch (JsonParseException e) {
			    	if(responseCode != HttpsURLConnection.HTTP_OK) {
			    		result.put("error", "JsonParseException");
			    		logger.debug("ERROR: JsonParseException");
			    	}
			    	 
			    	if(responseCode == HttpsURLConnection.HTTP_NOT_FOUND) { //404일 경우
						result.put("resultCode", "404");
						result.put("resultMsg", "API NOT FOUND");
						return result;
					} else if(responseCode == HttpsURLConnection.HTTP_OK) {
						result.put("coordinate", json); //좌표조회시 return String
					}
				} catch (IOException e){
					 logger.debug("ERROR: IOException");
			        result.put("error", e.toString());
			    }
				
				reader.close();
				
			} catch (UnknownHostException e) {
				result.put("error", e.toString());
			} catch (MalformedURLException e) {
				logger.debug(strUrl + " is invalid URL");
				result.put("error", strUrl + " is invalid URL");
			} catch (IOException e) {
				if(responseCode == HttpsURLConnection.HTTP_OK) { // 200일 경우 성공으로 return
					result.put("resultCode", "00000");
					result.put("resultMsg", "success");
					return result;
				}else {
					result.put("error", e.toString());
				}
			} catch (Exception e) {
				result.put("error", e.toString());
			} finally {
				if (reader != null) {
					try {
						reader.close();
					} catch (IOException e) {
						logger.debug("ERROR: IOException");
						result.put("error", e.toString());
					}
				}
				
				if (httpConn != null) {
					httpConn.disconnect();
				}
			}
			
		}
		
		return result;
	}
	
	/**
	 * longtail api 통신
	 * @param strUrl: 호출할 url
	 * @param headers: 헤더 설정
	 * @param method: GET/POST
	 * @param body: body(Map)
	 * @return 서버에서 응답으로 넘겨준 데이터
	 */
	public static Map connectApiJson(String requestURL, Map headers, String method, Map body) {
		String strUrl = requestURL;
		Map<String, Object> result = new HashMap<>();
		InputStream in = null;
		BufferedReader reader = null;
		int responseCode = 0;	//결과코드 
		
		if(strUrl.indexOf("https") > -1) {
			logger.info("https");
			HttpsURLConnection httpsConn = null;
			
			try {
				httpsConn.setDefaultHostnameVerifier(new CustomVF()); 
				
				// Get HTTPS URL connection
				URL url = new URL(strUrl);
				httpsConn = (HttpsURLConnection) url.openConnection();
				logger.info("{}", url);
				
				// set header
				if(headers != null) {
					logger.info("{}", headers);
					Iterator<String> keys = headers.keySet().iterator();
					while(keys.hasNext()) {
						String key = keys.next();
						String value = headers.get(key).toString();
						httpsConn.setRequestProperty(key, value);
					}
				}
				
				// Input setting
				httpsConn.setDoInput(true);
				
				// Caches setting
				httpsConn.setUseCaches(false);
				
				if(strUrl.indexOf("/recompute") > -1) {
					// 요금재계산 timeout 수정 (2022.04.13)
					// Read Timeout Setting
					httpsConn.setReadTimeout(10000);
					
					// Connection Timeout setting
					httpsConn.setConnectTimeout(10000);
				} else {
					// Read Timeout Setting
					httpsConn.setReadTimeout(30000);
					
					// Connection Timeout setting
					httpsConn.setConnectTimeout(30000);
				}
				
				// Method Setting(GET/POST)
				httpsConn.setRequestMethod(method);
				
				// set body
				if(body != null) {
					// Output setting
					httpsConn.setDoOutput(true);
					httpsConn.setRequestProperty("Content-Type", "application/json; utf-8");
					
					JSONObject jsonBody = new JSONObject(body);
					logger.info("{}", jsonBody);
					try (OutputStream os = httpsConn.getOutputStream()){
						byte[] data = jsonBody.toString().getBytes("utf-8");
						os.write(data);
						os.close();
					} catch(Exception e) {
						logger.debug("ERROR: Exception");
					}
				}
	
				TrustManager[] trustAllCerts = new TrustManager[] { new X509TrustManager() {
					public X509Certificate[] getAcceptedIssuers() {
						return null;
					}
					
					public void checkClientTrusted(X509Certificate[] certs, String authType) {
					}
					
					public void checkServerTrusted(X509Certificate[] certs, String authType) {
					}
				} };
				
				SSLContext sc = SSLContext.getInstance("SSL");
				sc.init(null, trustAllCerts, new java.security.SecureRandom());
				HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
				
				responseCode = httpsConn.getResponseCode();
				result.put("status", responseCode);
				
				// SSL setting
				SSLContext context = SSLContext.getInstance("TLS");
				context.init(null, null, null); // No validation for now
				httpsConn.setSSLSocketFactory(context.getSocketFactory());
				
				// Connect to host
				httpsConn.connect();
				httpsConn.setInstanceFollowRedirects(true);
				
				// Print response from host
				if (responseCode == HttpsURLConnection.HTTP_OK) { //정상호출: 200
					in = httpsConn.getInputStream();
				} else { //에러
					in = httpsConn.getErrorStream();
				}
				
				reader = new BufferedReader(new InputStreamReader(in, "utf-8"));
				
				// json to map
			    ObjectMapper mapper = new ObjectMapper();
			    String json = reader.readLine();
	
			    try{
			    	result = mapper.readValue(json, Map.class);
			    	
					if (responseCode == HttpsURLConnection.HTTP_OK) { //정상호출: 200
						result.put("status", responseCode);
					} 
			    } catch (JsonParseException e) {
			    	 result.put("error", "JsonParseException");
			    	 if(responseCode == HttpsURLConnection.HTTP_NOT_FOUND) { //404일 경우
						result.put("resultCode", "404");
						result.put("resultMsg", "API NOT FOUND");
						return result;
					}
				}catch (IOException e){
			        result.put("error", e.toString());
			    }
			    
				reader.close();
				
			} catch (UnknownHostException e) {
				result.put("error", e.toString());
			} catch (MalformedURLException e) {
				logger.debug(strUrl + " is invalid URL");
				result.put("error", e.toString());
			} catch (IOException e) {
				if(responseCode == HttpsURLConnection.HTTP_OK) { // 200일 경우 성공으로 return
					result.put("resultCode", "00000");
					result.put("resultMsg", "success");
					return result;
				}else {
					result.put("error", e.toString());
				}
			} catch (Exception e) {
				result.put("error", e.toString());
			} finally {
				if (reader != null) {
					try {
						reader.close();
					} catch (IOException e) {
						logger.debug("ERROR: IOException");
						result.put("error", e.toString());
					}
				}
				
				if (httpsConn != null) {
					httpsConn.disconnect();
				}
			}
		} else {
			logger.info("http");
			if(strUrl.indexOf("/v1/admin/login") > -1 || strUrl.indexOf("/v1/admin/reset_pw") > -1) {
				// "/v1/admin/logout" 제외 >> 2022.03.28 "/v1/api/admin/logout" 으로 변경된것으로 디시젼측 확인
				strUrl = strUrl.replace("/v1/admin", "/v1/openapi/admin");
			}else if(strUrl.indexOf("/v1/admin") > -1) {
				strUrl = strUrl.replace("/v1/admin", "/v1/api/admin");
			}else if(strUrl.indexOf("/v1/code") > -1) {
				strUrl = strUrl.replace("/v1/code", "/v1/api/code");
			}else if(strUrl.indexOf("/v1/otp") > -1) {
				strUrl = strUrl.replace("/v1/otp", "/v1/openapi/otp");
			}
			
			HttpURLConnection httpConn = null;
			
			try {
				// Get HTTP URL connection
				URL url = new URL(strUrl);
				httpConn = (HttpURLConnection) url.openConnection();
				logger.info("{}", url);
				
				// set header
				if(headers != null) {
					logger.info("{}", headers);
					Iterator<String> keys = headers.keySet().iterator();
					while(keys.hasNext()) {
						String key = keys.next();
						String value = headers.get(key).toString();
						httpConn.setRequestProperty(key, value);
					}
				}
				
				// Input setting
				httpConn.setDoInput(true);
				
				// Caches setting
				httpConn.setUseCaches(false);
				
				if(strUrl.indexOf("/recompute") > -1) {
					// 요금재계산 timeout 수정 (2022.04.13)
					// Read Timeout Setting
					httpConn.setReadTimeout(10000);
					
					// Connection Timeout setting
					httpConn.setConnectTimeout(10000);
				} else {
					// Read Timeout Setting
					httpConn.setReadTimeout(30000);
					
					// Connection Timeout setting
					httpConn.setConnectTimeout(30000);
				}
				
				// Method Setting(GET/POST)
				httpConn.setRequestMethod(method);
				
				// set body
				if(body != null) {
					// Output setting
					httpConn.setDoOutput(true);
					httpConn.setRequestProperty("Content-Type", "application/json; utf-8");
					
					JSONObject jsonBody = new JSONObject(body);
					logger.info("{}", jsonBody);
					try (OutputStream os = httpConn.getOutputStream()){
						byte[] data = jsonBody.toString().getBytes("utf-8");
						os.write(data);
						os.close();
					} catch(Exception e) {
						logger.debug("ERROR: Exception");
					}
				}
				
				responseCode = httpConn.getResponseCode();
				result.put("status", responseCode);
				
				// Connect to host
				httpConn.connect();
				httpConn.setInstanceFollowRedirects(true);
				
				// Print response from host
				if (responseCode == HttpsURLConnection.HTTP_OK) { //정상호출: 200
					in = httpConn.getInputStream();
				} else { //에러
					in = httpConn.getErrorStream();
				}
				
				reader = new BufferedReader(new InputStreamReader(in, "utf-8"));
				
				// json to map
			    ObjectMapper mapper = new ObjectMapper();
			    String json = reader.readLine();
	
			    try{
			    	result = mapper.readValue(json, Map.class);
			    	
					if (responseCode == HttpsURLConnection.HTTP_OK) { //정상호출: 200
						result.put("status", responseCode);
					} 
			    } catch (JsonParseException e) {
			    	 result.put("error", "JsonParseException");
			    	 logger.debug("ERROR: JsonParseException");
			    	 if(responseCode == HttpsURLConnection.HTTP_NOT_FOUND) { //404일 경우
						result.put("resultCode", "404");
						result.put("resultMsg", "API NOT FOUND");
						return result;
					}
			    }catch (IOException e){
			    	logger.debug("ERROR: IOException");
			        result.put("error", e.toString());
			    }
				
				reader.close();
				
			} catch (UnknownHostException e) {
				logger.debug("ERROR: UnknownHostException");
				result.put("error", e.toString());
			} catch (MalformedURLException e) {
				logger.debug(strUrl + " is invalid URL");
				result.put("error", e.toString());
			} catch (IOException e) {
				if(responseCode == HttpsURLConnection.HTTP_OK) { // 200일 경우 성공으로 return
					result.put("resultCode", "00000");
					result.put("resultMsg", "success");
					return result;
				}else {
					logger.debug("ERROR: IOException");
					result.put("error", e.toString());
				}
			} catch (Exception e) {
				logger.debug("ERROR: Exception");
				result.put("error", e.toString());
			} finally {
				if (reader != null) {
					try {
						reader.close();
					} catch (IOException e) {
						logger.debug("ERROR: IOException");
						result.put("error", e.toString());
					}
				}
				
				if (httpConn != null) {
					httpConn.disconnect();
				}
			}
			
		}
		
		return result;
	}
	
	/**
	 * longtail api 통신
	 * @param strUrl: 호출할 url
	 * @param headers: 헤더 설정
	 * @param method: GET/POST
	 * @param params: 파라미터
	 * @return 서버에서 응답으로 넘겨준 데이터
	 */
	public static Map connectApiGetFile(String strUrl, Map headers, String method, Map params) {
		Map<String, Object> result = new HashMap<>();
		InputStream in = null;
		int responseCode = 0; //결과코드
		if(strUrl.indexOf("https") > -1) {
			logger.info("https");
			HttpsURLConnection httpsConn = null;
			
			try {
				httpsConn.setDefaultHostnameVerifier(new CustomVF()); 
				
				// Get HTTPS URL connection
				URL url = new URL(strUrl);

				// set parameters
				StringBuffer parameters = new StringBuffer();
				if(params != null) {
					int idx = 0;
					
			        Iterator<String> key = params.keySet().iterator();
			        while(key.hasNext()) {
			        	String k = key.next();
			        	String connect = "";
			        	
			        	if(idx >= 1) {
			        		connect = "&";
			        	}
			        	parameters.append(connect);
			        	parameters.append(k);
			        	parameters.append("=");
			        	parameters.append(params.get(k));
			        	idx++;
			        }
					url = new URL(strUrl+"?"+parameters);
				}
				httpsConn = (HttpsURLConnection) url.openConnection();
				logger.info("{}", url);
				
				// set header
				if(headers != null) {
					logger.info("{}", headers);
					Iterator<String> keys = headers.keySet().iterator();
					while(keys.hasNext()) {
						String key = keys.next();
						String value = headers.get(key).toString();
						httpsConn.setRequestProperty(key, value);
					}
				}
	
				TrustManager[] trustAllCerts = new TrustManager[] { new X509TrustManager() {
					public X509Certificate[] getAcceptedIssuers() {
						return null;
					}
					
					public void checkClientTrusted(X509Certificate[] certs, String authType) {
					}
					
					public void checkServerTrusted(X509Certificate[] certs, String authType) {
					}
				} };
				
				SSLContext sc = SSLContext.getInstance("SSL");
				sc.init(null, trustAllCerts, new java.security.SecureRandom());
				HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
		         
				// Input setting
				httpsConn.setDoInput(true);
				
				// Output setting
				httpsConn.setDoOutput(true);
				
				// Caches setting
				httpsConn.setUseCaches(false);
			
				// Read Timeout Setting
				httpsConn.setReadTimeout(30000);
				
				// Connection Timeout setting
				httpsConn.setConnectTimeout(30000);
				
				// Method Setting(GET/POST)
				httpsConn.setRequestMethod(method);
				
				responseCode = httpsConn.getResponseCode();
				result.put("status", responseCode);
				
				// SSL setting
				SSLContext context = SSLContext.getInstance("TLS");
				context.init(null, null, null); // No validation for now
				httpsConn.setSSLSocketFactory(context.getSocketFactory());
				
				// Connect to host
				httpsConn.connect();
				httpsConn.setInstanceFollowRedirects(true);
				
				// Print response from host
				if (responseCode == HttpsURLConnection.HTTP_OK) { //정상호출: 200
					String fileName = "";
                    String disposition = httpsConn.getHeaderField("Content-Disposition");
                    String contentType = httpsConn.getContentType();
                    
                    if (disposition != null) {
                        String target = "filename=";
                        int index = disposition.indexOf(target);
                        if (index != -1) {
                            fileName = disposition.substring(index + target.length()).replaceAll("\"", "");
                        }
                    } else {
                        fileName = strUrl.substring(strUrl.lastIndexOf("/")).replaceAll("\"", "");
                    }

                    in = httpsConn.getInputStream();
                    
                    //fos = new FileOutputStream(new File(outputDir, "ORDER_" + System.currentTimeMillis() + "_" + fileName));
                    ByteArrayOutputStream bao = new ByteArrayOutputStream();
                    int bytesRead;
                    byte[] buffer = new byte[4096];
                    while ((bytesRead = in.read(buffer)) != -1) {
                        bao.write(buffer, 0, bytesRead);
                    }
                    byte[] fileArray = bao.toByteArray();
                    
                    result.put("fileName", fileName);
                    result.put("disposition", disposition);
                    result.put("contentType", contentType);
                    result.put("fileData", fileArray);
                    
                    bao.flush();
                    bao.close();
                    in.close();
	            } else {
					in = httpsConn.getErrorStream();
	            }
				
				httpsConn.disconnect();
				
			} catch (UnknownHostException e) {
				result.put("error", e.toString());
			} catch (MalformedURLException e) {
				logger.debug(strUrl + " is invalid URL");
				result.put("error", strUrl + " is invalid URL");
			} catch (IOException e) {
				if(responseCode == HttpsURLConnection.HTTP_OK) { // 200일 경우 성공으로 return
					result.put("resultCode", "00000");
					result.put("resultMsg", "success");
					return result;
				}else {
					result.put("error", e.toString());
				}
			} catch (Exception e) {
				result.put("error", e.toString());
			} finally {
				if (httpsConn != null) {
					httpsConn.disconnect();
				}
			}
		} else {
			logger.info("http");
			HttpURLConnection httpConn = null;
			try {
				// Get HTTPS URL connection
				URL url = new URL(strUrl);

				// set parameters
				StringBuffer parameters = new StringBuffer();
				if(params != null) {
					int idx = 0;
					
			        Iterator<String> key = params.keySet().iterator();
			        while(key.hasNext()) {
			        	String k = key.next();
			        	String connect = "";
			        	
			        	if(idx >= 1) {
			        		connect = "&";
			        	}
			        	parameters.append(connect);
			        	parameters.append(k);
			        	parameters.append("=");
			        	parameters.append(params.get(k));
			        	idx++;
			        }
					url = new URL(strUrl+"?"+parameters);
				}
				httpConn = (HttpURLConnection) url.openConnection();
				logger.info("{}", url);
				
				// set header
				if(headers != null) {
					logger.info("{}", headers);
					Iterator<String> keys = headers.keySet().iterator();
					while(keys.hasNext()) {
						String key = keys.next();
						String value = headers.get(key).toString();
						httpConn.setRequestProperty(key, value);
					}
				}
				
				// Input setting
				httpConn.setDoInput(true);
				
				// Output setting
				httpConn.setDoOutput(true);
				
				// Caches setting
				httpConn.setUseCaches(false);
				
				// Read Timeout Setting
				httpConn.setReadTimeout(30000);
				
				// Connection Timeout setting
				httpConn.setConnectTimeout(30000);
				
				// Method Setting(GET/POST)
				httpConn.setRequestMethod(method);
				
				responseCode = httpConn.getResponseCode();
				result.put("status", responseCode);
				
				// Connect to host
				httpConn.connect();
				httpConn.setInstanceFollowRedirects(true);
				
				// Print response from host
				if (responseCode == HttpsURLConnection.HTTP_OK) { //정상호출: 200
					String fileName = "";
                    String disposition = httpConn.getHeaderField("Content-Disposition");
                    String contentType = httpConn.getContentType();
                    
                    if (disposition != null) {
                        String target = "filename=";
                        int index = disposition.indexOf(target);
                        if (index != -1) {
                            fileName = disposition.substring(index + target.length()).replaceAll("\"", "");
                        }
                    } else {
                        fileName = strUrl.substring(strUrl.lastIndexOf("/")).replaceAll("\"", "");
                    }

                    in = httpConn.getInputStream();
                    
                    ByteArrayOutputStream bao = new ByteArrayOutputStream();
                    int bytesRead;
                    byte[] buffer = new byte[4096];
                    while ((bytesRead = in.read(buffer)) != -1) {
                        bao.write(buffer, 0, bytesRead);
                    }
                    byte[] fileArray = bao.toByteArray();
                    
                    result.put("fileName", fileName);
                    result.put("disposition", disposition);
                    result.put("contentType", contentType);
                    result.put("fileData", fileArray);
                    
                    bao.flush();
                    bao.close();
                    in.close();
	            } else {
					in = httpConn.getErrorStream();
	            }
				
				httpConn.disconnect();
				
			} catch (UnknownHostException e) {
				result.put("error", e.toString());
			} catch (MalformedURLException e) {
				logger.debug(strUrl + " is invalid URL");
				result.put("error", strUrl + " is invalid URL");
			} catch (IOException e) {
				if(responseCode == HttpsURLConnection.HTTP_OK) { // 200일 경우 성공으로 return
					result.put("resultCode", "00000");
					result.put("resultMsg", "success");
					return result;
				}else {
					result.put("error", e.toString());
				}
			} catch (Exception e) {
				result.put("error", e.toString());
			} finally {
				if (httpConn != null) {
					httpConn.disconnect();
				}
			}
			
		}
		
		return result;
	}
	
	public static Map connectApiList(String requestURL, Map headers, String method, Map params) {
		String strUrl = requestURL; 
		Map<String, Object> result = new HashMap<>();
		InputStream in = null;
		BufferedReader reader = null;
		int responseCode = 0; //결과코드
		if(strUrl.indexOf("https") > -1) {
			logger.info("https");
			HttpsURLConnection httpsConn = null;
			
			try {
				httpsConn.setDefaultHostnameVerifier(new CustomVF()); 
				
				// Get HTTPS URL connection
				URL url = new URL(strUrl);

				// set parameters
				StringBuffer parameters = new StringBuffer();
				if(params != null) {
					int idx = 0;
					
			        Iterator<String> key = params.keySet().iterator();
			        while(key.hasNext()) {
			        	String k = key.next();
			        	String connect = "";
			        	
			        	if(idx >= 1) {
			        		connect = "&";
			        	}
			        	parameters.append(connect);
			        	parameters.append(k);
			        	parameters.append("=");
			        	parameters.append(params.get(k));
			        	idx++;
			        }
					url = new URL(strUrl+"?"+parameters);
				}
				httpsConn = (HttpsURLConnection) url.openConnection();
				logger.info("{}", url);
				// set header
				if(headers != null) {
					logger.info("{}", headers);
					Iterator<String> keys = headers.keySet().iterator();
					while(keys.hasNext()) {
						String key = keys.next();
						String value = headers.get(key).toString();
						httpsConn.setRequestProperty(key, value);
					}
				}
	
				TrustManager[] trustAllCerts = new TrustManager[] { new X509TrustManager() {
					public X509Certificate[] getAcceptedIssuers() {
						return null;
					}
					
					public void checkClientTrusted(X509Certificate[] certs, String authType) {
					}
					
					public void checkServerTrusted(X509Certificate[] certs, String authType) {
					}
				} };
				
				SSLContext sc = SSLContext.getInstance("SSL");
				sc.init(null, trustAllCerts, new java.security.SecureRandom());
				HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
		         
				// Input setting
				httpsConn.setDoInput(true);
				
				// Output setting
				//httpsConn.setDoOutput(true);
				
				// Caches setting
				httpsConn.setUseCaches(false);
				
				if(strUrl.indexOf("/recompute") > -1) {
					// 요금재계산 timeout 수정 (2022.04.13)
					// Read Timeout Setting
					httpsConn.setReadTimeout(10000);
					
					// Connection Timeout setting
					httpsConn.setConnectTimeout(10000);
				} else {
					// Read Timeout Setting
					httpsConn.setReadTimeout(30000);
					
					// Connection Timeout setting
					httpsConn.setConnectTimeout(30000);
				}
				
				// Method Setting(GET/POST)
				httpsConn.setRequestMethod(method);
				
				responseCode = httpsConn.getResponseCode();
				result.put("status", responseCode);
				
				// SSL setting
				SSLContext context = SSLContext.getInstance("TLS");
				context.init(null, null, null); // No validation for now
				httpsConn.setSSLSocketFactory(context.getSocketFactory());
				
				// Connect to host
				httpsConn.connect();
				httpsConn.setInstanceFollowRedirects(true);
				
				// Print response from host
				if (responseCode == HttpsURLConnection.HTTP_OK) { //정상호출: 200
					in = httpsConn.getInputStream();
				} else { //에러
					in = httpsConn.getErrorStream();
				}
				
				reader = new BufferedReader(new InputStreamReader(in, "utf-8"));
				
				// json to map
			    ObjectMapper mapper = new ObjectMapper();
			    String json = reader.readLine();
	
			    try{
			    	List list = mapper.readValue(json, List.class);
			    	result.put("list", list);
			    	
					if (responseCode == HttpsURLConnection.HTTP_OK) { //정상호출: 200
						result.put("status", responseCode);
					}
			    } catch (JsonParseException e) {
			    	if(responseCode != HttpsURLConnection.HTTP_OK) {
			    		result.put("error", "JsonParseException");
			    		logger.debug("ERROR: JsonParseException");
			    	}
			    	
			    	if(responseCode == HttpsURLConnection.HTTP_NOT_FOUND) { //404일 경우
						result.put("resultCode", "404");
						result.put("resultMsg", "API NOT FOUND");
						return result;
					} else if(responseCode == HttpsURLConnection.HTTP_OK) {
						result.put("coordinate", json); //좌표조회시 return String
						result.remove("error");
					}
				} catch (IOException e){
					logger.debug("ERROR: IOException");
			        result.put("error", e.toString());
			    }
				
				reader.close();
				
			} catch (UnknownHostException e) {
				result.put("error", e.toString());
			} catch (MalformedURLException e) {
				logger.debug(strUrl + " is invalid URL");
				result.put("error", strUrl + " is invalid URL");
			} catch (IOException e) {
				if(responseCode == HttpsURLConnection.HTTP_OK) { // 200일 경우 성공으로 return
					result.put("resultCode", "00000");
					result.put("resultMsg", "success");
					return result;
				}else {
					result.put("error", e.toString());
				}
			} catch (Exception e) {
				result.put("error", e.toString());
			} finally {
				if (reader != null) {
					try {
						reader.close();
					} catch (IOException e) {
						logger.debug("ERROR: IOException");
						result.put("error", e.toString());
					}
				}
				
				if (httpsConn != null) {
					httpsConn.disconnect();
				}
			}
		} else {
			logger.info("http");
			
			if(strUrl.indexOf("/v1/admin/login") > -1 || strUrl.indexOf("/v1/admin/reset_pw") > -1) {
				// "/v1/admin/logout" 제외 >> 2022.03.28 "/v1/api/admin/logout" 으로 변경된것으로 디시젼측 확인
				strUrl = strUrl.replace("/v1/admin", "/v1/openapi/admin");
			}else if(strUrl.indexOf("/v1/admin") > -1) {
				strUrl = strUrl.replace("/v1/admin", "/v1/api/admin");
			}else if(strUrl.indexOf("/v1/code") > -1) {
				strUrl = strUrl.replace("/v1/code", "/v1/api/code");
			}else if(strUrl.indexOf("/v1/otp") > -1) {
				strUrl = strUrl.replace("/v1/otp", "/v1/openapi/otp");
			} else if(strUrl.indexOf("/v1/penalty") > -1) {
				strUrl = strUrl.replace("/v1/penalty", "/v1/api/penalty");
			}
			
			HttpURLConnection httpConn = null;
			try {
				// Get HTTPS URL connection
				URL url = new URL(strUrl);

				// set parameters
				StringBuffer parameters = new StringBuffer();
				if(params != null) {
					int idx = 0;
					
			        Iterator<String> key = params.keySet().iterator();
			        while(key.hasNext()) {
			        	String k = key.next();
			        	String connect = "";
			        	
			        	if(idx >= 1) {
			        		connect = "&";
			        	}
			        	parameters.append(connect);
			        	parameters.append(k);
			        	parameters.append("=");
			        	parameters.append(params.get(k));
			        	idx++;
			        }
					url = new URL(strUrl+"?"+parameters);
				}
				httpConn = (HttpURLConnection) url.openConnection();
				logger.info("{}", url);
				// set header
				if(headers != null) {
					logger.info("{}", headers);
					Iterator<String> keys = headers.keySet().iterator();
					while(keys.hasNext()) {
						String key = keys.next();
						String value = headers.get(key).toString();
						httpConn.setRequestProperty(key, value);
					}
				}
				
				// Input setting
				httpConn.setDoInput(true);
				
				// Output setting
				//httpConn.setDoOutput(true);
				
				// Caches setting
				httpConn.setUseCaches(false);
				
				if(strUrl.indexOf("/recompute") > -1) {
					// 요금재계산 timeout 수정 (2022.04.13)
					// Read Timeout Setting
					httpConn.setReadTimeout(10000);
					
					// Connection Timeout setting
					httpConn.setConnectTimeout(10000);
				} else {
					// Read Timeout Setting
					httpConn.setReadTimeout(30000);
					
					// Connection Timeout setting
					httpConn.setConnectTimeout(30000);
				}
				
				// Method Setting(GET/POST)
				httpConn.setRequestMethod(method);
				
				responseCode = httpConn.getResponseCode();
				result.put("status", responseCode);
				
				// Connect to host
				httpConn.connect();
				httpConn.setInstanceFollowRedirects(true);
				
				// Print response from host
				if (responseCode == HttpsURLConnection.HTTP_OK) { //정상호출: 200
					in = httpConn.getInputStream();
				} else { //에러
					in = httpConn.getErrorStream();
				}
				
				reader = new BufferedReader(new InputStreamReader(in, "utf-8"));
				
				// json to map
			    ObjectMapper mapper = new ObjectMapper();
			    String json = reader.readLine();
	
			    try{
			    	List list = mapper.readValue(json, List.class);
			    	result.put("list", list);
			    	
					if (responseCode == HttpsURLConnection.HTTP_OK) { //정상호출: 200
						result.put("status", responseCode);
					} 
			    } catch (JsonParseException e) {
			    	if(responseCode != HttpsURLConnection.HTTP_OK) {
			    		result.put("error", "JsonParseException");
			    		logger.debug("ERROR: JsonParseException");
			    	}
			    	 
			    	if(responseCode == HttpsURLConnection.HTTP_NOT_FOUND) { //404일 경우
						result.put("resultCode", "404");
						result.put("resultMsg", "API NOT FOUND");
						return result;
					} else if(responseCode == HttpsURLConnection.HTTP_OK) {
						result.put("coordinate", json); //좌표조회시 return String
					}
				} catch (IOException e){
					logger.debug("ERROR: IOException");
			        result.put("error", e.toString());
			    }
				
				reader.close();
				
			} catch (UnknownHostException e) {
				result.put("error", e.toString());
			} catch (MalformedURLException e) {
				logger.debug(strUrl + " is invalid URL");
				result.put("error", strUrl + " is invalid URL");
			} catch (IOException e) {
				if(responseCode == HttpsURLConnection.HTTP_OK) { // 200일 경우 성공으로 return
					result.put("resultCode", "00000");
					result.put("resultMsg", "success");
					return result;
				}else {
					result.put("error", e.toString());
				}
			} catch (Exception e) {
				result.put("error", e.toString());
			} finally {
				if (reader != null) {
					try {
						reader.close();
					} catch (IOException e) {
						logger.debug("ERROR: IOException");
						result.put("error", e.toString());
					}
				}
				
				if (httpConn != null) {
					httpConn.disconnect();
				}
			}
			
		}
		
		return result;
	}
	
	public static Map connectApiJsonList(String requestURL, Map headers, String method, Map body) {
		String strUrl = requestURL; 
		Map<String, Object> result = new HashMap<>();
		InputStream in = null;
		BufferedReader reader = null;
		int responseCode = 0;	//결과코드 
		
		if(strUrl.indexOf("https") > -1) {
			logger.info("https");
			HttpsURLConnection httpsConn = null;
			
			try {
				httpsConn.setDefaultHostnameVerifier(new CustomVF()); 
				
				// Get HTTPS URL connection
				URL url = new URL(strUrl);
				httpsConn = (HttpsURLConnection) url.openConnection();
				logger.info("{}", url);
				// set header
				if(headers != null) {
					logger.info("{}", headers);
					Iterator<String> keys = headers.keySet().iterator();
					while(keys.hasNext()) {
						String key = keys.next();
						String value = headers.get(key).toString();
						httpsConn.setRequestProperty(key, value);
					}
				}
				
				// Input setting
				httpsConn.setDoInput(true);
				
				// Caches setting
				httpsConn.setUseCaches(false);
				
				if(strUrl.indexOf("/recompute") > -1) {
					// 요금재계산 timeout 수정 (2022.04.13)
					// Read Timeout Setting
					httpsConn.setReadTimeout(10000);
					
					// Connection Timeout setting
					httpsConn.setConnectTimeout(10000);
				} else {
					// Read Timeout Setting
					httpsConn.setReadTimeout(30000);
					
					// Connection Timeout setting
					httpsConn.setConnectTimeout(30000);
				}
				
				// Method Setting(GET/POST)
				httpsConn.setRequestMethod(method);
				
				// set body
				if(body != null) {
					// Output setting
					httpsConn.setDoOutput(true);
					httpsConn.setRequestProperty("Content-Type", "application/json; utf-8");
					
					JSONObject jsonBody = new JSONObject(body);
					logger.info("{}", jsonBody);
					
					try (OutputStream os = httpsConn.getOutputStream()){
						byte[] data = jsonBody.toString().getBytes("utf-8");
						os.write(data);
						os.close();
					} catch(Exception e) {
						logger.debug("ERROR: Exception");
					}
				}
	
				TrustManager[] trustAllCerts = new TrustManager[] { new X509TrustManager() {
					public X509Certificate[] getAcceptedIssuers() {
						return null;
					}
					
					public void checkClientTrusted(X509Certificate[] certs, String authType) {
					}
					
					public void checkServerTrusted(X509Certificate[] certs, String authType) {
					}
				} };
				
				SSLContext sc = SSLContext.getInstance("SSL");
				sc.init(null, trustAllCerts, new java.security.SecureRandom());
				HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
				
				responseCode = httpsConn.getResponseCode();
				result.put("status", responseCode);
				
				// SSL setting
				SSLContext context = SSLContext.getInstance("TLS");
				context.init(null, null, null); // No validation for now
				httpsConn.setSSLSocketFactory(context.getSocketFactory());
				
				// Connect to host
				httpsConn.connect();
				httpsConn.setInstanceFollowRedirects(true);
				
				// Print response from host
				if (responseCode == HttpsURLConnection.HTTP_OK) { //정상호출: 200
					in = httpsConn.getInputStream();
				} else { //에러
					in = httpsConn.getErrorStream();
				}
				
				reader = new BufferedReader(new InputStreamReader(in, "utf-8"));
				
				// json to map
			    ObjectMapper mapper = new ObjectMapper();
			    String json = reader.readLine();
	
			    try{
			    	List list = mapper.readValue(json, List.class);
			    	result.put("list", list);
			    	
					if (responseCode == HttpsURLConnection.HTTP_OK) { //정상호출: 200
						result.put("status", responseCode);
					} 
			    } catch (JsonParseException e) {
			    	 result.put("error", "JsonParseException");
			    	 if(responseCode == HttpsURLConnection.HTTP_NOT_FOUND) { //404일 경우
						result.put("resultCode", "404");
						result.put("resultMsg", "API NOT FOUND");
						return result;
					}
				}catch (IOException e){
			        result.put("error", e.toString());
			    }
			    
				reader.close();
				
			} catch (UnknownHostException e) {
				result.put("error", e.toString());
			} catch (MalformedURLException e) {
				logger.debug(strUrl + " is invalid URL");
				result.put("error", e.toString());
			} catch (IOException e) {
				if(responseCode == HttpsURLConnection.HTTP_OK) { // 200일 경우 성공으로 return
					result.put("resultCode", "00000");
					result.put("resultMsg", "success");
					return result;
				}else {
					result.put("error", e.toString());
				}
			} catch (Exception e) {
				result.put("error", e.toString());
			} finally {
				if (reader != null) {
					try {
						reader.close();
					} catch (IOException e) {
						logger.debug("ERROR: IOException");
						result.put("error", e.toString());
					}
				}
				
				if (httpsConn != null) {
					httpsConn.disconnect();
				}
			}
		} else {
			logger.info("http");
			if(strUrl.indexOf("/v1/admin/login") > -1 || strUrl.indexOf("/v1/admin/reset_pw") > -1) {
				// "/v1/admin/logout" 제외 >> 2022.03.28 "/v1/api/admin/logout" 으로 변경된것으로 디시젼측 확인
				strUrl = strUrl.replace("/v1/admin", "/v1/openapi/admin");
			}else if(strUrl.indexOf("/v1/admin") > -1) {
				strUrl = strUrl.replace("/v1/admin", "/v1/api/admin");
			}else if(strUrl.indexOf("/v1/code") > -1) {
				strUrl = strUrl.replace("/v1/code", "/v1/api/code");
			}else if(strUrl.indexOf("/v1/otp") > -1) {
				strUrl = strUrl.replace("/v1/otp", "/v1/openapi/otp");
			}
			
			HttpURLConnection httpConn = null;
			
			try {
				// Get HTTP URL connection
				URL url = new URL(strUrl);
				httpConn = (HttpURLConnection) url.openConnection();
				logger.info("{}", url);
				
				// set header
				if(headers != null) {
					logger.info("{}", headers);
					Iterator<String> keys = headers.keySet().iterator();
					while(keys.hasNext()) {
						String key = keys.next();
						String value = headers.get(key).toString();
						httpConn.setRequestProperty(key, value);
					}
				}
				
				// Input setting
				httpConn.setDoInput(true);
				
				// Caches setting
				httpConn.setUseCaches(false);
				
				if(strUrl.indexOf("/recompute") > -1) {
					// 요금재계산 timeout 수정 (2022.04.13)
					// Read Timeout Setting
					httpConn.setReadTimeout(10000);
					
					// Connection Timeout setting
					httpConn.setConnectTimeout(10000);
				} else {
					// Read Timeout Setting
					httpConn.setReadTimeout(30000);
					
					// Connection Timeout setting
					httpConn.setConnectTimeout(30000);
				}
				
				// Method Setting(GET/POST)
				httpConn.setRequestMethod(method);
				
				// set body
				if(body != null) {
					// Output setting
					httpConn.setDoOutput(true);
					httpConn.setRequestProperty("Content-Type", "application/json; utf-8");
					
					JSONObject jsonBody = new JSONObject(body);
					logger.info("{}", jsonBody);
					
					try (OutputStream os = httpConn.getOutputStream()){
						byte[] data = jsonBody.toString().getBytes("utf-8");
						os.write(data);
						os.close();
					} catch(Exception e) {
						logger.debug("ERROR: Exception");
					}
				}
				
				responseCode = httpConn.getResponseCode();
				result.put("status", responseCode);
				
				// Connect to host
				httpConn.connect();
				httpConn.setInstanceFollowRedirects(true);
				
				// Print response from host
				if (responseCode == HttpsURLConnection.HTTP_OK) { //정상호출: 200
					in = httpConn.getInputStream();
				} else { //에러
					in = httpConn.getErrorStream();
				}
				
				reader = new BufferedReader(new InputStreamReader(in, "utf-8"));
				
				// json to map
			    ObjectMapper mapper = new ObjectMapper();
			    String json = reader.readLine();
	
			    try{
			    	List list = mapper.readValue(json, List.class);
			    	result.put("list", list);
			    	
					if (responseCode == HttpsURLConnection.HTTP_OK) { //정상호출: 200
						result.put("status", responseCode);
					} 
			    } catch (JsonParseException e) {
			    	 result.put("error", "JsonParseException");
			    	 logger.debug("ERROR: JsonParseException");
			    	 if(responseCode == HttpsURLConnection.HTTP_NOT_FOUND) { //404일 경우
						result.put("resultCode", "404");
						result.put("resultMsg", "API NOT FOUND");
						return result;
					}
			    }catch (IOException e){
			    	logger.debug("ERROR: IOException");
			        result.put("error", e.toString());
			    }
				
				reader.close();
				
			} catch (UnknownHostException e) {
				logger.debug("ERROR: UnknownHostException");
				result.put("error", e.toString());
			} catch (MalformedURLException e) {
				logger.debug(strUrl + " is invalid URL");
				result.put("error", e.toString());
			} catch (IOException e) {
				if(responseCode == HttpsURLConnection.HTTP_OK) { // 200일 경우 성공으로 return
					result.put("resultCode", "00000");
					result.put("resultMsg", "success");
					return result;
				}else {
					logger.debug("ERROR: IOException");
					result.put("error", e.toString());
				}
			} catch (Exception e) {
				logger.debug("ERROR: Exception");
				result.put("error", e.toString());
			} finally {
				if (reader != null) {
					try {
						reader.close();
					} catch (IOException e) {
						logger.debug("ERROR: IOException");
						result.put("error", e.toString());
					}
				}
				
				if (httpConn != null) {
					httpConn.disconnect();
				}
			}
			
		}
		
		return result;
	}
	
	public static Map connectApiJsonString(String requestURL, Map headers, String method, String body) {
		String strUrl = requestURL; 
		Map<String, Object> result = new HashMap<>();
		InputStream in = null;
		BufferedReader reader = null;
		int responseCode = 0;	//결과코드 
		
		if(strUrl.indexOf("https") > -1) {
			logger.info("https");
			HttpsURLConnection httpsConn = null;
			
			try {
				httpsConn.setDefaultHostnameVerifier(new CustomVF()); 
				
				// Get HTTPS URL connection
				URL url = new URL(strUrl);
				httpsConn = (HttpsURLConnection) url.openConnection();
				logger.info("{}", url);
				
				// set header
				if(headers != null) {
					logger.info("{}", headers);
					Iterator<String> keys = headers.keySet().iterator();
					while(keys.hasNext()) {
						String key = keys.next();
						String value = headers.get(key).toString();
						httpsConn.setRequestProperty(key, value);
					}
				}
				
				// Input setting
				httpsConn.setDoInput(true);
				
				// Caches setting
				httpsConn.setUseCaches(false);
				
				if(strUrl.indexOf("/recompute") > -1) {
					// 요금재계산 timeout 수정 (2022.04.13)
					// Read Timeout Setting
					httpsConn.setReadTimeout(10000);
					
					// Connection Timeout setting
					httpsConn.setConnectTimeout(10000);
				} else {
					// Read Timeout Setting
					httpsConn.setReadTimeout(30000);
					
					// Connection Timeout setting
					httpsConn.setConnectTimeout(30000);
				}
				
				// Method Setting(GET/POST)
				httpsConn.setRequestMethod(method);
				
				// set body
				if(body != null) {
					// Output setting
					httpsConn.setDoOutput(true);
					httpsConn.setRequestProperty("Content-Type", "application/json; utf-8");
					logger.info("{}", body);
					
					try (OutputStream os = httpsConn.getOutputStream()){
						byte[] data = body.toString().getBytes("utf-8");
						os.write(data);
						os.close();
					} catch(Exception e) {
						logger.debug("ERROR: Exception");
					}
				}
	
				TrustManager[] trustAllCerts = new TrustManager[] { new X509TrustManager() {
					public X509Certificate[] getAcceptedIssuers() {
						return null;
					}
					
					public void checkClientTrusted(X509Certificate[] certs, String authType) {
					}
					
					public void checkServerTrusted(X509Certificate[] certs, String authType) {
					}
				} };
				
				SSLContext sc = SSLContext.getInstance("SSL");
				sc.init(null, trustAllCerts, new java.security.SecureRandom());
				HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
				
				responseCode = httpsConn.getResponseCode();
				result.put("status", responseCode);
				
				// SSL setting
				SSLContext context = SSLContext.getInstance("TLS");
				context.init(null, null, null); // No validation for now
				httpsConn.setSSLSocketFactory(context.getSocketFactory());
				
				// Connect to host
				httpsConn.connect();
				httpsConn.setInstanceFollowRedirects(true);
				
				// Print response from host
				if (responseCode == HttpsURLConnection.HTTP_OK) { //정상호출: 200
					in = httpsConn.getInputStream();
				} else { //에러
					in = httpsConn.getErrorStream();
				}
				
				reader = new BufferedReader(new InputStreamReader(in, "utf-8"));
				
				// json to map
			    ObjectMapper mapper = new ObjectMapper();
			    String json = reader.readLine();
	
			    try{
			    	result = mapper.readValue(json, Map.class);
			    	
					if (responseCode == HttpsURLConnection.HTTP_OK) { //정상호출: 200
						result.put("status", responseCode);
					} 
			    } catch (JsonParseException e) {
			    	 result.put("error", "JsonParseException");
			    	 if(responseCode == HttpsURLConnection.HTTP_NOT_FOUND) { //404일 경우
						result.put("resultCode", "404");
						result.put("resultMsg", "API NOT FOUND");
						return result;
					}
				}catch (IOException e){
			        result.put("error", e.toString());
			    }
			    
				reader.close();
				
			} catch (UnknownHostException e) {
				result.put("error", e.toString());
			} catch (MalformedURLException e) {
				logger.debug(strUrl + " is invalid URL");
				result.put("error", e.toString());
			} catch (IOException e) {
				if(responseCode == HttpsURLConnection.HTTP_OK) { // 200일 경우 성공으로 return
					result.put("resultCode", "00000");
					result.put("resultMsg", "success");
					return result;
				}else {
					result.put("error", e.toString());
				}
			} catch (Exception e) {
				result.put("error", e.toString());
			} finally {
				if (reader != null) {
					try {
						reader.close();
					} catch (IOException e) {
						logger.debug("ERROR: IOException");
						result.put("error", e.toString());
					}
				}
				
				if (httpsConn != null) {
					httpsConn.disconnect();
				}
			}
		} else {
			logger.info("http");
			if(strUrl.indexOf("/v1/admin/login") > -1 || strUrl.indexOf("/v1/admin/reset_pw") > -1) {
				// "/v1/admin/logout" 제외 >> 2022.03.28 "/v1/api/admin/logout" 으로 변경된것으로 디시젼측 확인
				strUrl = strUrl.replace("/v1/admin", "/v1/openapi/admin");
			}else if(strUrl.indexOf("/v1/admin") > -1) {
				strUrl = strUrl.replace("/v1/admin", "/v1/api/admin");
			}else if(strUrl.indexOf("/v1/code") > -1) {
				strUrl = strUrl.replace("/v1/code", "/v1/api/code");
			}else if(strUrl.indexOf("/v1/otp") > -1) {
				strUrl = strUrl.replace("/v1/otp", "/v1/openapi/otp");
			} else if(strUrl.indexOf("/v1/penalty") > -1) {
				strUrl = strUrl.replace("/v1/penalty", "/v1/api/penalty");
			}
			
			HttpURLConnection httpConn = null;
			
			try {
				// Get HTTP URL connection
				URL url = new URL(strUrl);
				httpConn = (HttpURLConnection) url.openConnection();
				logger.info("{}", url);
				// set header
				if(headers != null) {
					logger.info("{}", headers);
					Iterator<String> keys = headers.keySet().iterator();
					while(keys.hasNext()) {
						String key = keys.next();
						String value = headers.get(key).toString();
						httpConn.setRequestProperty(key, value);
					}
				}
				
				// Input setting
				httpConn.setDoInput(true);
				
				// Caches setting
				httpConn.setUseCaches(false);
				
				if(strUrl.indexOf("/recompute") > -1) {
					// 요금재계산 timeout 수정 (2022.04.13)
					// Read Timeout Setting
					httpConn.setReadTimeout(10000);
					
					// Connection Timeout setting
					httpConn.setConnectTimeout(10000);
				} else {
					// Read Timeout Setting
					httpConn.setReadTimeout(30000);
					
					// Connection Timeout setting
					httpConn.setConnectTimeout(30000);
				}
				
				// Method Setting(GET/POST)
				httpConn.setRequestMethod(method);
				
				// set body
				if(body != null) {
					// Output setting
					httpConn.setDoOutput(true);
					httpConn.setRequestProperty("Content-Type", "application/json; utf-8");
					
					logger.info("{}", body);
					
					try (OutputStream os = httpConn.getOutputStream()){
						byte[] data = body.toString().getBytes("utf-8");
						os.write(data);
						os.close();
					} catch(Exception e) {
						logger.debug("ERROR: Exception");
					}
				}
				
				responseCode = httpConn.getResponseCode();
				result.put("status", responseCode);
				
				// Connect to host
				httpConn.connect();
				httpConn.setInstanceFollowRedirects(true);
				
				// Print response from host
				if (responseCode == HttpsURLConnection.HTTP_OK) { //정상호출: 200
					in = httpConn.getInputStream();
				} else { //에러
					in = httpConn.getErrorStream();
				}
				
				reader = new BufferedReader(new InputStreamReader(in, "utf-8"));
				
				// json to map
			    ObjectMapper mapper = new ObjectMapper();
			    String json = reader.readLine();
	
			    try{
			    	result = mapper.readValue(json, Map.class);
			    	
					if (responseCode == HttpsURLConnection.HTTP_OK) { //정상호출: 200
						result.put("status", responseCode);
					} 
			    } catch (JsonParseException e) {
			    	 result.put("error", "JsonParseException");
			    	 logger.debug("ERROR: JsonParseException");
			    	 if(responseCode == HttpsURLConnection.HTTP_NOT_FOUND) { //404일 경우
						result.put("resultCode", "404");
						result.put("resultMsg", "API NOT FOUND");
						return result;
					}
			    }catch (IOException e){
			    	logger.debug("ERROR: IOException");
			        result.put("error", e.toString());
			    }
				
				reader.close();
				
			} catch (UnknownHostException e) {
				logger.debug("ERROR: UnknownHostException");
				result.put("error", e.toString());
			} catch (MalformedURLException e) {
				logger.debug(strUrl + " is invalid URL");
				result.put("error", e.toString());
			} catch (IOException e) {
				if(responseCode == HttpsURLConnection.HTTP_OK) { // 200일 경우 성공으로 return
					result.put("resultCode", "00000");
					result.put("resultMsg", "success");
					return result;
				}else {
					logger.debug("ERROR: IOException");
					result.put("error", e.toString());
				}
			} catch (Exception e) {
				logger.debug("ERROR: Exception");
				result.put("error", e.toString());
			} finally {
				if (reader != null) {
					try {
						reader.close();
					} catch (IOException e) {
						logger.debug("ERROR: IOException");
						result.put("error", e.toString());
					}
				}
				
				if (httpConn != null) {
					httpConn.disconnect();
				}
			}
			
		}
		
		return result;
	}
	
	private static class CustomVF implements HostnameVerifier {
		@Override
		public boolean verify(String hostname, SSLSession session) {
			return true;
		}
	}	
	
}
