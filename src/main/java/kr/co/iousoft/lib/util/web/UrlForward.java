
package kr.co.iousoft.lib.util.web;

/**
 * <code>UrlForward</code>
 */
public interface UrlForward {
	public static final String NEWLINE = "\n";	
	public static final String DEFAULT_CHARSET = "UTF-8";
	public static final String METHOD_GET = "GET";
	public static final String METHOD_POST = "POST";

    public void addFormField(String name, String value) throws Exception;
    public String getResponse() throws Exception ;
    public int getResponseCode();

}
