package kr.co.iousoft.lib.util.web;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

/**
 * <code>HttpUrlForward</code>
 */
public class HttpUrlForward extends AbstractUrlForward {


	public HttpUrlForward(String requestURL) throws Exception {
		super(requestURL);
	}

	public HttpUrlForward(String requestURL, String method) throws Exception {
		super(requestURL, method);
	}

	public HttpUrlForward(String requestURL, HttpServletRequest request) throws Exception {
		super(requestURL, request);
	}

	public HttpUrlForward(String requestURL, String method, HttpServletRequest request) throws Exception {
		super(requestURL, method, request);
	}

	public HttpUrlForward(String requestURL, String method, HttpServletRequest request, String charset) throws Exception {
		super(requestURL, method, request, charset);
	}

	public HttpUrlForward(String requestURL, String method, HttpServletRequest request, String charset, String[] dontSendField) throws Exception {
		super(requestURL, method, request, charset, dontSendField);
	}
	
	@Override
	protected void initMembers() throws Exception {
        this.postData = new StringBuffer();
	}

	protected void setContentType() {
        httpConn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset="+charset);
	}

	/**
     * Adds a form field to the request
     * @param name field name
     * @param value field value
     * @throws Exception 
     */
    public void addFormField(String name, String value) throws Exception {
		postData.append("&").append(name).append("=").append(URLEncoder.encode(value, charset));
    }
    protected String finish() throws Exception {
    		byte[] postDataBytes = postData.toString().getBytes(charset);
        
        httpConn.setRequestProperty("Content-Length", Integer.toString(postDataBytes.length));
		outputStream = httpConn.getOutputStream();
		writer = new PrintWriter(new OutputStreamWriter(outputStream, charset), true);
        writer.append(postData.toString()).flush();
        writer.close();
 
        // checks server's status code first
        StringBuffer response = new StringBuffer();
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
            throw new IOException("Server returned non-OK status " + status +":"+this.requestURL);
        }

        return response.toString();
    }

	@Override
	public int getResponseCode() {
		return status;
	}
}
