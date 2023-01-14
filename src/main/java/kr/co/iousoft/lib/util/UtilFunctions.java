package kr.co.iousoft.lib.util;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.URLEncoder;
import java.net.UnknownHostException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.TimeZone;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.xssf.streaming.SXSSFCell;
import org.apache.poi.xssf.streaming.SXSSFRow;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.json.JSONArray;
import org.json.JSONObject;

import kr.co.iousoft.lib.exception.ServiceException;

public class UtilFunctions {

	private static Logger logger = LogManager.getLogger("UtilFunctions");

	public static final String NULL_OBJECT_ID = "-1";
	
	public static final String SDF_YYYYMMDDD_HHMM = "yyyy.MM.dd HH:mm";
	public static final String SDF_YYYYMMDDD_HHMMSS = "yyyy.MM.dd HH:mm:ss";
	public static final String SDF_YYYYMMDDD = "yyyy.MM.dd";

	public static boolean isNotEmptyObject(String value) {
		return !isEmptyObject(value);
	}
	public static boolean isEmptyObject(String value) {
		if (isEmpty(value)) return true;
		return NULL_OBJECT_ID.equals(value);
	}

	public static boolean isNotEmpty(String value) {
		return !isEmpty(value);
	}

	public static boolean isEmpty(String value) {
		if (value == null) return true;
		return (value.length() == 0);
	}


	public static boolean isNotEmpty(List value) {
		return !isEmpty(value);
	}
	public static boolean isEmpty(List value) {
		if (value == null) return true;
		return (value.size() == 0);
	}

	public static String sha1(Object object) {
		if (object == null)
			return null;

		String sha1 = "";
		try {

			MessageDigest md = MessageDigest.getInstance("SHA-1");
			md.update(object.toString().getBytes());
			byte byteData[] = md.digest();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}
			sha1 = sb.toString();
		} catch (NoSuchAlgorithmException e) {
			sha1 = null;
		}
		return sha1;
	}

	public static Date convertTimeZone(Date date, TimeZone fromTimeZone, TimeZone toTimeZone) {
	    long milliseconds = date.getTime();
	    milliseconds += (fromTimeZone.getRawOffset() * -1);
	    if (fromTimeZone.inDaylightTime(date)) {
	        milliseconds += (fromTimeZone.getDSTSavings() * -1);
	    }
	    milliseconds += toTimeZone.getRawOffset();
	    if (toTimeZone.inDaylightTime(date)) {
	        milliseconds += toTimeZone.getDSTSavings();
	    }
	    return new Date(milliseconds);
	}

	public static String toDateString(Date date, Locale locale) {
		if (date == null)
			return "";
		String datetimeFormat = "yyyy-MM-dd";
		SimpleDateFormat formatter = new SimpleDateFormat(datetimeFormat, locale);
		return formatter.format(date);
	}

	public static Calendar toStringDate(String tempDate){
		if(tempDate == null){
			return null;
		}

		Calendar cal = Calendar.getInstance();
		String temp= tempDate.replaceAll("\\.", "").replaceAll("-", "");

		int year = Integer.parseInt(temp.substring(0, 4));
		int month = Integer.parseInt(temp.substring(4,6));
		int date = Integer.parseInt(temp.substring(6,8));

		cal.set(year, month-1, date);
		return cal;
	}

	public static String toCamelCase(final String init) {
	    if (init==null)
	        return null;

	    final StringBuilder ret = new StringBuilder(init.length());
	    StringTokenizer tokens = new StringTokenizer(init, " ,\\._-");
	    while (tokens.hasMoreTokens()) {
	    	String token = tokens.nextToken();
	    	if (!token.isEmpty()) {
	    		ret.append(Character.toUpperCase(token.charAt(0)));
	    		if (token.length() > 1) ret.append(token.substring(1).toLowerCase());
	    	}
	    }

	    String camel = ret.toString();
	    if (camel.isEmpty()) return "";
	    if (camel.length() == 1) return camel.toLowerCase();
	    return Character.toLowerCase(camel.charAt(0))+camel.substring(1);
	}

	public static Map toCamelCase(final Map map) {
		Map newMap = new HashMap();
		if (map == null) return newMap;
		Iterator iterator = map.keySet().iterator();
		while (iterator.hasNext()) {
			String key = (String) iterator.next();
			newMap.put(toCamelCase(key), map.get(key));
		}
		return newMap;
	}

	public static String toUnderscore(final String init) {
	    if (init==null)
	        return null;
		return init.replaceAll("(.)(\\p{Upper})", "$1_$2").toLowerCase();
	}
	public static Object hideEmail(String email) {
		if (email.isEmpty()) return email;
		if (email.indexOf("@") == -1) {
			return setAsterisk(email);
		}
		StringBuffer buffer = new StringBuffer();
		buffer.append(setAsterisk(email.substring(0, email.indexOf("@"))));
		buffer.append(email.substring(email.indexOf("@")));
		return buffer.toString();
	}
	private static Object setAsterisk(String string) {
		if (string.length() <= 2) return string;
		StringBuffer buffer = new StringBuffer();
		buffer.append(string.charAt(0));
		buffer.append(StringUtils.leftPad("", string.length()-1, "*"));
		buffer.append(string.charAt(string.length() -1));
		return buffer.toString();
	}

	public static String encodeXss(String value) {
		if (value == null) return value;

		String temp = value;
		temp = temp.replaceAll("<", "&lt;").replaceAll(">", "&gt;");
		temp = temp.replaceAll("\\(", "&#40;").replaceAll("\\)", "&#41;");
		temp = temp.replaceAll("'", "&#39;");
		temp = temp.replaceAll("\"", "&#34;");
		temp = temp.replaceAll("=", "&#61;");
		temp = temp.replaceAll( "\"", "&quot;");

		return temp;
	}

	public static String decodeXss(String value) {
		if (value == null) return value;

		String temp = value;
		temp = temp.replaceAll("&lt;", "<").replaceAll("&gt;", ">");
		temp = temp.replaceAll("&#40;", "\\(").replaceAll("&#41;", "\\)");
		temp = temp.replaceAll("&#39;", "'");
		temp = temp.replaceAll("&#34;", "\"");
		temp = temp.replaceAll("&#61;", "=");
		temp = temp.replaceAll("&quot;", "\"");

		return temp;
	}	


	/**
	 * Base64 Encoding
	 * @param tmp
	 * @return
	 */
	public static String encodeBase64(String tmp){
		byte[]  encoded = Base64.encodeBase64(tmp.getBytes());
		return new String(encoded);
	}

	/**
	 * 나이계산
	 * @param detail
	 */
	public static void setAge(HashMap<String, Object> detail){
		Calendar date = Calendar.getInstance();
		if(detail.get("birth_date")!=null){
			int year = Integer.parseInt(detail.get("birth_date").toString().substring(0, 2));
			year += 1900;
			int age = (date.get(Calendar.YEAR)) - year + 1;
			detail.put("age", age);
		}
	}

	public static boolean checkMobile(String mobile){
		String mobilePhone = mobile.replaceAll("-", "");
		return Pattern.matches("^01(?:0|1|[6-9])(?:\\d{3}|\\d{4})\\d{4}$", mobilePhone);
	}

	public static boolean isImageFile(String url){
		File file = new File(url);
		return file.isFile();
	}

	/**
	 * ClientIP 조회
	 * @param request
	 * @return
	 */
	public static String getClientIP(HttpServletRequest request) {
		String ip = request.getHeader("X-FORWARDED-FOR");
	     //System.out.println("X-FORWARDED-FOR="+ip);
	     
	     if (ip == null || ip.length() == 0) {
	         ip = request.getHeader("Proxy-Client-IP");
	         //System.out.println("Proxy="+ip);
	     }

	     if (ip == null || ip.length() == 0) {
	         ip = request.getHeader("WL-Proxy-Client-IP");  // 웹로직
	         //System.out.println("WL-Proxy="+ip);
	     }
	     
	     if (ip == null) {
	         ip = request.getHeader("HTTP_CLIENT_IP");
	         // System.out.println("HTTP_CLIENT_IP="+ip);
	     }
	     
	     if (ip == null) {
	    	 ip = request.getHeader("HTTP_X_FORWARDED_FOR");
	    	 //System.out.println("HTTP_X_FORWARDED_FOR="+ip);
	     }

	     if (ip == null) {
	    	 ip = request.getHeader("HTTP_X_FORWARDED_FOR");
	    	 //System.out.println("HTTP_X_FORWARDED_FOR="+ip);
    	 }
	     
	     if (ip == null || ip.length() == 0) {
	         ip = request.getRemoteAddr();
	         // System.out.println("getRemoteAddr="+ip);
	     }

	     return ip;
	 }


	/**
	 * PDF다운로드
	 * @param request
	 * @param response
	 * @param file
	 * @param saveName
	 * @throws Exception
	 */
	public static void downloadPdf(HttpServletRequest request, HttpServletResponse response, String file, String saveName) throws Exception{

		if(!file.isEmpty()) {
			String filename = saveName+".pdf";
			FileInputStream is = null;
			BufferedOutputStream os = null;
			try {
				File pdfFile = new File(file);
				response.setHeader("Content-Type", "application/octet-stream;charset=euc-kr");
				String userAgent = request.getHeader("User-Agent");
				if(userAgent != null && userAgent.indexOf("MSIE 5.5") > -1) // MS IE 5.5 이하
					response.setHeader("Content-Disposition", "Filename=" + URLEncoder.encode(filename, "UTF-8") + ";");
				else if(userAgent != null && userAgent.indexOf("MSIE") > -1) // MS IE (보통은 6.x 이상 가정)
					response.setHeader("Content-Disposition", "ATTachment; Filename=" + URLEncoder.encode(filename, "UTF-8") + ";");
				else // 모질라나 오페라
					response.setHeader("Content-Disposition", "ATTachment; Filename=" + new String(filename.getBytes("euc-kr"), "latin1") + ";");

				is = new FileInputStream(pdfFile);
				int size = is.available();
				byte[] buf = new byte[size];
				int readCount = is.read(buf);
				response.flushBuffer();
				os = new BufferedOutputStream(response.getOutputStream());
				os.write(buf, 0, readCount);
				os.flush();
			}catch (NullPointerException e) {
				e.printStackTrace();
			}
			catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(is != null) is.close();
				if(os != null) os.close();
			}
		}
	}

	/**
	 * Excel 다운로드
	 * @param request
	 * @param response
	 * @param workbook
	 * @param fileName
	 * @throws Exception
	 */
	public static void downloadExcel(HttpServletRequest request, HttpServletResponse response, XSSFWorkbook workbook, String fileName) throws Exception{

		if(workbook != null) {
			String filename = fileName+".xlsx";
			response.setHeader("Content-Type", "application/octet-stream;charset=euc-kr");
			String userAgent = request.getHeader("User-Agent");
			if(userAgent != null && userAgent.indexOf("MSIE 5.5") > -1) // MS IE 5.5 이하
				response.setHeader("Content-Disposition", "Filename=" + URLEncoder.encode(filename, "UTF-8") + ";");
			else if(userAgent != null && userAgent.indexOf("MSIE") > -1) // MS IE (보통은 6.x 이상 가정)
				response.setHeader("Content-Disposition", "ATTachment; Filename=" + URLEncoder.encode(filename, "UTF-8") + ";");
			else // 모질라나 오페라
				response.setHeader("Content-Disposition", "ATTachment; Filename=" + new String(filename.getBytes("euc-kr"), "latin1") + ";");

			response.setHeader("Content-Transfer-Encoding", "binary");
			response.setHeader("Pragma", "no-cache;");
			response.setHeader("Expires", "-1;");

			OutputStream out = null;
			try
			{
				out = response.getOutputStream();
				workbook.write(out);
				out.flush();
				out.close();
			}
			catch(IOException e)
			{
				e.printStackTrace();
			}
		}
	}

	/**
	 * Excel 다운로드
	 * @param request
	 * @param response
	 * @param workbook
	 * @param fileName
	 * @throws Exception
	 */
	public static void downloadExcelXSSF(HttpServletRequest request, HttpServletResponse response, SXSSFWorkbook workbook, String fileName) throws Exception{

		if(workbook != null) {
			String filename = fileName+".xlsx";
			response.setHeader("Content-Type", "application/octet-stream;charset=euc-kr");
			String userAgent = request.getHeader("User-Agent");
			if(userAgent != null && userAgent.indexOf("MSIE 5.5") > -1) // MS IE 5.5 이하
				response.setHeader("Content-Disposition", "Filename=" + URLEncoder.encode(filename, "UTF-8") + ";");
			else if(userAgent != null && userAgent.indexOf("MSIE") > -1) // MS IE (보통은 6.x 이상 가정)
				response.setHeader("Content-Disposition", "ATTachment; Filename=" + URLEncoder.encode(filename, "UTF-8") + ";");
			else // 모질라나 오페라
				response.setHeader("Content-Disposition", "ATTachment; Filename=" + new String(filename.getBytes("euc-kr"), "latin1") + ";");

			response.setHeader("Content-Transfer-Encoding", "binary");
			response.setHeader("Pragma", "no-cache;");
			response.setHeader("Expires", "-1;");

			OutputStream fileOut = response.getOutputStream();
			try {
				workbook.write(fileOut);
				fileOut.close();

				response.getOutputStream().flush();
				response.getOutputStream().close();
				workbook.dispose();

			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 통계 날짜 목록
	 * @param startDate
	 * @param endDate
	 * @return
	 * @throws Exception
	 */
	public static List<String> setStatisticsDateList(String startDate, String endDate) throws Exception {
		List<String> hearder = new ArrayList();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

		Date to = df.parse(startDate);
		Date from = df.parse(endDate);

		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();

		//Calendar 타입으로 변경 add()메소드로 1일씩 추가해 주기위해 변경
		c1.setTime( to );
		c2.setTime( from );

		//시작날짜와 끝 날짜를 비교해, 시작날짜가 작거나 같은 경우 출력
		while( c1.compareTo( c2 ) !=1 ){
			hearder.add(df.format(c1.getTime()));
			c1.add(Calendar.DATE, 1); //시작날짜 + 1 일
		}
		hearder.add(df.format(c2.getTime()));

		return hearder;
	}

	/**
	 * 통계  목록에 표시될 날짜 목록
	 * @param startDate
	 * @param endDate
	 * @return
	 * @throws Exception
	 */
	public static List<String> setStatisticsHeader(String startDate, String endDate) throws Exception {
		List<String> hearder = new ArrayList();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat df2 = new SimpleDateFormat("MM/dd");

		Date to = df.parse(startDate);
		Date from = df.parse(endDate);

		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();

		//Calendar 타입으로 변경 add()메소드로 1일씩 추가해 주기위해 변경
		c1.setTime( to );
		c2.setTime( from );

		//시작날짜와 끝 날짜를 비교해, 시작날짜가 작거나 같은 경우 출력
		while( c1.compareTo( c2 ) !=1 ){
			hearder.add(df2.format(c1.getTime()));
			c1.add(Calendar.DATE, 1); //시작날짜 + 1 일
		}

		return hearder;
	}

	// masking
	public static String masking(String targetValue, String maskingType) {

		String result = "";
		if(targetValue == null || (targetValue != null && targetValue.equals(""))
				|| maskingType == null || (maskingType != null && maskingType.equals(""))) {

			return result;
		}

		switch (maskingType) {
		case "email":
			result = maskingEmail(targetValue);
			break;
		case "mobile":
			result = maskingMobile(targetValue);
			break;
		case "string":
			result = maskingName(targetValue);
			break;
		default:
			break;
		}

		return result;
	}

	public static String maskingName(String targetString) {
		String replaceString = targetString;
		
		String pattern = "";
		if (targetString.length() == 2) {
			pattern = "^(.)(.+)$";
		} else {
			pattern = "^(.)(.+)(.)$";
		}

		Matcher matcher = Pattern.compile(pattern).matcher(targetString);

		if (matcher.matches()) {
			replaceString = "";
			StringBuffer strbuff = new StringBuffer(replaceString);
			
			for (int i = 1; i <= matcher.groupCount(); i++) {
				String replaceTarget = matcher.group(i);
				if (i == 2) {
					char[] c = new char[replaceTarget.length()];
					Arrays.fill(c, '*');
					
					//replaceString = replaceString + String.valueOf(c);
					strbuff.append(replaceString);
					strbuff.append(String.valueOf(c));
				} else {
					//replaceString = replaceString + replaceTarget;
					strbuff.append(replaceString);
					strbuff.append(replaceTarget);
				}
			}
			
			replaceString = strbuff.toString();
		}
		
		
		return replaceString;
	}

	public static String maskingMobile(String targetString) {
		String temp  = targetString.replace("-", "");
		temp = temp.replaceAll("^(\\d{3})-?(\\d{1,2})\\d{2}-?\\d(\\d{3})$", "$1-$2**-*$3");
		return temp;
	}

	public static String maskingEmail(String targetString) {
		String emailReg = "([\\w.])(?:[\\w.]*)(@.*)";
		String replaceString = targetString;

		replaceString = replaceString.replaceAll(emailReg, "$1****$2");

		return replaceString;
	}

	public static String getUserBrower(HttpServletRequest request) {
		String userAgent = request.getHeader("user-agent");
		String browser = "";

		if(userAgent.indexOf("Trident") > -1 || userAgent.indexOf("MSIE") > -1) {
			if(userAgent.indexOf("Trident/7") > -1) {
				browser = "Explorer 11";
			}else if(userAgent.indexOf("Trident/6") > -1) {
				browser = "Explorer 10";
			}else if(userAgent.indexOf("Trident/5") > -1) {
				browser =  "Explorer 9";
			}else if(userAgent.indexOf("Trident/4") > -1) {
				browser =  "Explorer 8";
			}else if(userAgent.indexOf("edge") > -1) {
				browser =  "Explorer Edge";
			}
		}else if(userAgent.indexOf("Whale") > -1) {
			browser = "Whale";
		}else if(userAgent.indexOf("Opera") > -1 || userAgent.indexOf("OPR") > -1) {
			browser = "Opera";
		}else if(userAgent.indexOf("Firefox") > -1) {
			browser = "Firefox";
		}else if(userAgent.indexOf("Safari") > -1 && userAgent.indexOf("Chrome") == -1) {
			browser = "Safari";
		}else if(userAgent.indexOf("Chrome") > -1) {
			browser = "Chrome";
		}

		return browser;
	}

	public static String getHostIp() throws Exception {
		String hostIp = "";
		try {
			InetAddress addr = InetAddress.getLocalHost();
		 	hostIp = addr.getHostAddress();
		}catch (UnknownHostException e) {
			throw new ServiceException("호스트 ip 오류");
		}
		return hostIp;
	}


	/**
	 * 엑셀다운로드 시 헤더 스타일적용
	 * @param workbook
	 * @param sheet
	 * @param row
	 * @param idx
	 * @param value
	 * @return
	 */
	public static void setExcelHeader(SXSSFWorkbook workbook, SXSSFSheet sheet, SXSSFRow row, int idx, String value) {
		Font headerFont = workbook.createFont();
		headerFont.setBold(true);

		XSSFCellStyle style = (XSSFCellStyle) workbook.createCellStyle();
		style.setAlignment(HorizontalAlignment.CENTER);
		style.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
		style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		style.setFont(headerFont);

		SXSSFCell cell = row.createCell(idx);
		cell.setCellValue(value);
		cell.setCellStyle(style);
	}

	public static Map<String, Object> jsonObjectToMap(JSONObject obj) throws Exception{
		Map<String, Object> map = new HashMap<>();
		Iterator<String> keys = obj.keys();

		while(keys.hasNext()) {
			String key = keys.next();
			Object value = obj.get(key);

			if(value instanceof JSONArray) {
				value = jsonArraytoList((JSONArray) value);
			}else if(value instanceof JSONObject) {
				value = jsonObjectToMap((JSONObject) value);
			}

			map.put(key, value);
		}
		return map;
	}

	public static List jsonArraytoList(JSONArray array) throws Exception{
		List list = new ArrayList<>();

		for(int i=0; i<array.length(); i++) {
			Object value = array.get(i);

			if(value instanceof JSONArray) {
				value = jsonArraytoList((JSONArray) value);
			}else if(value instanceof JSONObject) {
				value = UtilFunctions.jsonObjectToMap((JSONObject) value);
			}

			list.add(value);
		}

		return list;
	}
	
	/**
	 * 밀리세컨드 날짜변환
	 * @param value
	 * @return
	 */
	public static Date millisecondToDate(Object value) throws Exception {
		Long temp =  (Long) value;
		
		Calendar cal = Calendar.getInstance();
		cal.setTimeInMillis(temp);
		
		return cal.getTime();
	}
	
	/**
	 * 밀리세컨드 날짜변환
	 * @param value
	 * @return
	 */
	public static String millisecondToDate(Object value, String sdfFormat) throws Exception {
		
		SimpleDateFormat sdf = new SimpleDateFormat(sdfFormat);
		
		String strMillisec = value.toString();
		
		Calendar cal = Calendar.getInstance();
		cal.setTimeInMillis(Long.parseLong(strMillisec));
		
		return sdf.format(cal.getTime());
	}
	
	/**
	 * 밀리세컨드 날짜변환
	 * @param obj(List/Map)
	 * @return
	 */
public static Map millisecondListToDate(Object obj) throws Exception {
		
		Map map = new HashMap<>();
		
		if(obj != null) {
			if(obj instanceof List) {
				List list = (List) obj;
				
				for(int i=0; i<list.size(); i++) {
					map = (Map) list.get(i);
					
					
					Iterator<String> keys = map.keySet().iterator();
					while(keys.hasNext()) {
						String key = keys.next();
						if((key.endsWith("DateTime") || key.endsWith("Date") || key.endsWith("DateByLongType")) || key.endsWith("updatedAt") && map.get(key) != null) {
							if (map.get(key) instanceof Long) {
								map.put(key, UtilFunctions.millisecondToDate(map.get(key)));
							}else if(map.get(key) instanceof Integer){
								map.put(key, null);
							}
						}
					}
				}
			} else if(obj instanceof Map) {
				map = (Map) obj;
				
				Iterator<String> keys = map.keySet().iterator();
				while(keys.hasNext()) {
					String key = keys.next();
					if((key.endsWith("DateTime") || key.endsWith("Date") || key.endsWith("DateByLongType")) || key.endsWith("updatedAt") && map.get(key) != null) {
						if (map.get(key) instanceof Long) {
							map.put(key, UtilFunctions.millisecondToDate(map.get(key)));
						}else if(map.get(key) instanceof Integer){
							map.put(key, null);
						}
					}
				}
			}
		}
		
		return map;
	}
	
	/**
	 * 목록의 시작 인덱스 계산 
	 * 
	 * @param nowPage
	 * @param endPage
	 * @param pageSize
	 * @return
	 */
	public static int genListMaxIndex(int nowPage, int endPage, int listCount, int pageSize) {
		return listCount % pageSize + (nowPage-1) * pageSize;
	}
	
	public static int genListMaxIndex(Object nowPage, Object endPage, Object listCount, Object pageSize) {
		
		if(nowPage == null || endPage == null || listCount == null || pageSize == null) {
			return 0;
		}
		
		if((int) pageSize == 0) {
			return 0;
		}
		
		try {
			return (int) listCount - ((int) nowPage - 1) * (int) pageSize;
		} catch (Exception e) {
			return 0;
		}
		
	}
	
	/**
	 * 일시정보 : long > 문자열로 변환  
	 * yyyy.MM.dd
	 * 
	 * @param item
	 * @param inputKey
	 * @throws Exception
	 */
	public static void makeDateToString(Map item, String inputKey) throws Exception {
		if(item.get(inputKey) != null && !item.get(inputKey).equals("") && StringUtils.isNumeric(item.get(inputKey).toString())) {
			item.put(inputKey + "String", UtilFunctions.millisecondToDate(item.get(inputKey), UtilFunctions.SDF_YYYYMMDDD));
		}
	}
	
	/**
	 * 일시정보 : long > 문자열로 변환  
	 * yyyy.MM.dd HH:mm
	 * 
	 * @param item
	 * @param inputKey
	 * @throws Exception
	 */
	public static void makeDateToStringMin(Map item, String inputKey) throws Exception {
		if(item.get(inputKey) != null && !item.get(inputKey).equals("") && StringUtils.isNumeric(item.get(inputKey).toString())) {
			item.put(inputKey + "String", UtilFunctions.millisecondToDate(item.get(inputKey), UtilFunctions.SDF_YYYYMMDDD_HHMM));
		}
	}
	
	/**
	 * 일시정보 : long > 문자열로 변환  
	 * yyyy.MM.dd HH:mm, 값 없을경우 - 값 처리  
	 * 
	 * @param item
	 * @param inputKey
	 * @throws Exception
	 */
	public static void makeDateToStringNoDataByDashMin(Map item, String inputKey) throws Exception {
		if(item.get(inputKey) != null && !item.get(inputKey).equals("") && StringUtils.isNumeric(item.get(inputKey).toString())) {
			item.put(inputKey + "String", UtilFunctions.millisecondToDate(item.get(inputKey), UtilFunctions.SDF_YYYYMMDDD_HHMM));
		} else {
			item.put(inputKey + "String", "-");
		}
	}
	
	/**
	 * 일시정보 : long > 문자열로 변환  
	 * yyyy.MM.dd
	 * 
	 * @param item
	 * @param inputKey
	 * @throws Exception
	 */
	public static void makeDateToStringSecond(Map item, String inputKey) throws Exception {
		if(item.get(inputKey) != null && !item.get(inputKey).equals("") && StringUtils.isNumeric(item.get(inputKey).toString())) {
			item.put(inputKey + "String", UtilFunctions.millisecondToDate(item.get(inputKey), UtilFunctions.SDF_YYYYMMDDD_HHMMSS));
		}
	}
	
	/**
	 * 관리자 로그인ID/사번/권한그룹코드 형식체크
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public static boolean checkFormatValue(String value) throws Exception {
		boolean flag = Pattern.matches("^[a-zA-Z0-9]+$", value);
		boolean engFlag = Pattern.matches("^[a-zA-Z]+$", value);
		boolean numFlag = Pattern.matches("^[0-9]+$", value);
		
		if(flag || engFlag || numFlag) {
			return true;
		}
		
		return false;
	}
	
	/**
	 * 이메일 형식체크
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public static boolean checkFormatEmail(String email) throws Exception {
		boolean flag = Pattern.matches("^[0-9a-zA-Z][0-9a-zA-Z\\_\\-\\.\\+]+[0-9a-zA-Z]@[0-9a-zA-Z][0-9a-zA-Z\\_\\-]*[0-9a-zA-Z](\\.[a-zA-Z]{2,6}){1,2}$", email); 
		if(!flag) {
			return flag;
		}
		
		return true;
	}
	
	/**
	 * 휴대폰번호 형식체크
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public static boolean checkFormatPhone(String phone) throws Exception {
		boolean flag = Pattern.matches("^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})[0-9]{3,4}[0-9]{4}$", phone);
		if(!flag) {
			return flag;
		}
		return true;
	}
	
}
