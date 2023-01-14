package kr.co.iousoft.lib.util.web;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class HttpUrlMultipartForward extends AbstractUrlForward {
    private String boundary;
    private static final String LINE_FEED = "\r\n";
	public HttpUrlMultipartForward(String requestURL) throws Exception {
		super(requestURL);
	}

	public HttpUrlMultipartForward(String requestURL, String method) throws Exception {
		super(requestURL, method);
	}

	public HttpUrlMultipartForward(String requestURL, HttpServletRequest request) throws Exception {
		super(requestURL, request);
	}

	public HttpUrlMultipartForward(String requestURL, String method, HttpServletRequest request) throws Exception {
		super(requestURL, method, request);
	}

	public HttpUrlMultipartForward(String requestURL, String method, HttpServletRequest request, String charset) throws Exception {
		super(requestURL, method, request, charset);
	}

	public HttpUrlMultipartForward(String requestURL, String method, HttpServletRequest request, String charset, String[] dontSendField, Map headers) throws Exception {
		super(requestURL, method, request, charset, dontSendField, headers);

		MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
		final Map<String, List<MultipartFile>> files = multiRequest.getMultiFileMap();
		//logger.debug("{}", files.size());
		// 파일 첨부
		Iterator<String> iterator = files.keySet().iterator();
		while (iterator.hasNext()) {
			String name = iterator.next();
			int total  = files.get(name).size();
			//logger.debug("total = {}", total);
			for(int i=0; i<total;i++) {
				MultipartFile file = files.get(name).get(i);
				addFilePart(name, file);
			}
		}
    }

	@Override
	protected void initMembers() throws Exception {
        // creates a unique boundary based on time stamp
        boundary = "---" + System.currentTimeMillis() + "---";
	}

	protected void setContentType() {
        httpConn.setRequestProperty("Content-Type",
                "multipart/form-data; boundary=" + boundary);
	}

    /**
     * Adds a form field to the request
     * @param name field name
     * @param value field value
     * @throws Exception
     */
    public void addFormField(String name, String value) throws Exception {
    	logger.debug("{} = {}", name, value);
    	checkWriter();

        writer.append("--" + boundary).append(LINE_FEED);
        writer.append("Content-Disposition: form-data; name=\"" + name + "\"")
                .append(LINE_FEED);
        if(name.equals("request")) {
        	writer.append("Content-Type: application/json;").append(LINE_FEED);
        } else {
        	writer.append("Content-Type: text/plain; charset=" + charset).append(
        			LINE_FEED);
        }
        writer.append(LINE_FEED);
        writer.append(value).append(LINE_FEED);
        writer.flush();
    }

    private void checkWriter() throws Exception {
    	if (writer == null) {
			outputStream = httpConn.getOutputStream();
			writer = new PrintWriter(new OutputStreamWriter(outputStream, charset), true);
    	}
	}

	/**
     * Adds a upload file section to the request
     * @param fieldName name attribute in <input type="file" name="..." />
     * @param uploadFile a File to be uploaded
     * @throws Exception
     */
    public void addFilePart(String fieldName, File uploadFile)
            throws Exception {
        String fileName = uploadFile.getName();
        String contentType = URLConnection.guessContentTypeFromName(fileName);
        FileInputStream inputStream = new FileInputStream(uploadFile);
        try {
        	addFilePart(fieldName, fileName, contentType, inputStream);
		} finally {
			if(inputStream != null) {
				inputStream.close();
			}
		}
    }

    /**
     * Adds a upload file section to the request
     * @param fieldName name attribute in <input type="file" name="..." />
     * @param uploadFile a MultipartFile to be uploaded
     * @throws Exception
     */
    public void addFilePart(String fieldName, MultipartFile uploadFile)
            throws Exception {
        String fileName = uploadFile.getOriginalFilename();
        String contentType = uploadFile.getContentType();
        InputStream inputStream = uploadFile.getInputStream();
    	addFilePart(fieldName, fileName, contentType, inputStream);
    }

    public void addFilePart(String fieldName, String fileName, String contentType, InputStream inputStream)
            throws Exception {
    	checkWriter();

        writer.append("--" + boundary).append(LINE_FEED);
        writer.append(
                "Content-Disposition: form-data; name=\"" + fieldName
                        + "\"; filename=\"" + fileName + "\"")
                .append(LINE_FEED);
        writer.append(
                "Content-Type: "
                        + contentType)
                .append(LINE_FEED);
        writer.append("Content-Transfer-Encoding: binary").append(LINE_FEED);
        writer.append(LINE_FEED);
        writer.flush();

        byte[] buffer = new byte[4096];
        int bytesRead = -1;
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            outputStream.write(buffer, 0, bytesRead);
        }
        outputStream.flush();
        inputStream.close();

        writer.append(LINE_FEED);
        writer.flush();
    }

    /**
     * Adds a header field to the request.
     * @param name - name of the header field
     * @param value - value of the header field
     * @throws Exception
     */
    public void addHeaderField(String name, String value) throws Exception {

		//httpConn.setRequestProperty(name, value);
    	
    }

    /**
     * Completes the request and receives response from the server.
     * @return Strings as response in case the server returned
     * status OK, otherwise an exception is thrown.
     * @throws Exception
     */
    public String finish() throws Exception {
        StringBuffer response = new StringBuffer();

    	checkWriter();

        writer.append(LINE_FEED).flush();
        writer.append("--" + boundary + "--").append(LINE_FEED).flush();
        writer.close();

        // checks server's status code first
        status = httpConn.getResponseCode();
        if (status == HttpURLConnection.HTTP_OK) {
            BufferedReader reader = new BufferedReader(new InputStreamReader(
                    httpConn.getInputStream(), charset));
            String line = null;
            if ((line = reader.readLine()) != null) {
                response.append(line);
            }
            while ((line = reader.readLine()) != null) {
                response.append(NEWLINE);
                response.append(line);
            }
            reader.close();
            httpConn.disconnect();
        } else {
        	try {       
            logger.debug("{}", httpConn.getResponseMessage());
        	}catch (Exception e) {
				e.printStackTrace();
			}
        	
        	IOException exception = new IOException(String.valueOf(status));
        	throw exception;
        	
            // throw new IOException("Server returned non-OK status " + status +":"+this.requestURL);
        }

        return response.toString();
    }
    
    public String finish(BigDecimal code) {
    	
    	Map<String, String> result = new HashMap<>();
 
    	try {
    		finish();
    	} catch(Exception e) {
    		
    		// OrderAdminService.uploadExcel
    		if(code.equals(BigDecimal.ZERO)) {
    			
    			result.put("resultCode", e.getMessage());
    			
    			// 메세지 분기 
    			if(e.getMessage().equals("500")) {
    				result.put("resultMsg", "유효하지 않은 주소가 포함되어 있습니다.");
    			} 
    			JSONObject jsonBody = new JSONObject(result);
    			
    			return jsonBody.toString();
    		}
    	}
    	
    	return ""; // length == 0
    	
    }
    
    public Map finishMap() throws Exception {
    	Map<String, Object> result = new HashMap<>();
    	InputStream in = null;
    	BufferedReader reader = null;
    	
    	checkWriter();

        writer.append(LINE_FEED).flush();
        writer.append("--" + boundary + "--").append(LINE_FEED).flush();
        writer.close();

        // checks server's status code first
        status = httpConn.getResponseCode();
        result.put("status", status);
        logger.debug("responseCode = {}", httpConn.getResponseCode());
        
		if (status == HttpURLConnection.HTTP_OK) {
			in = httpConn.getInputStream();
		} else {
			in = httpConn.getErrorStream();
		}
		
		reader = new BufferedReader(new InputStreamReader(in, "utf-8"));
		
		// json to map
	    ObjectMapper mapper = new ObjectMapper();
	    String json = reader.readLine();
	    
	    try{
	    	result = mapper.readValue(json, Map.class);
			result.put("status", status);
			logger.debug("result = {}", result);
	    } catch (JsonParseException e) {
	    	logger.debug("ERROR: JsonParseException");
	    	result.put("error", "JsonParseException");
		} catch (IOException e){
			List list = mapper.readValue(json, List.class);
			result.put("status", status);
			logger.debug("result = {}", list);
			
			logger.debug("ERROR: IOException");
	        //result.put("error", e.toString());
	    }
		
		reader.close();
        
		if (httpConn != null) {
			httpConn.disconnect();
		}

        return result;
    }

	@Override
	public int getResponseCode() {
		return status;
	}
}
