package kr.co.iousoft.lib.util;

import java.util.Base64;
import java.util.Base64.Decoder;

import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.core.Logger;

public class DownloadFunctions {
	
	protected Logger logger = (Logger) LogManager.getLogger(getClass());
	
	/**
	 * base64 to download File
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	public static void downloadBase64toFile(HttpServletRequest request, HttpServletResponse response, String fileData, String fileName) throws Exception {
		
		if(response != null && fileData != null && fileName != null && !fileName.equals("")) {
		
			String filename = fileName;
			response.setHeader("Content-Type", "application/octet-stream;charset=euc-kr");
			String userAgent = request.getHeader("User-Agent");
			if (userAgent != null && userAgent.indexOf("MSIE 5.5") > -1) // MS IE 5.5 이하
				response.setHeader("Content-Disposition", "Filename=" + URLEncoder.encode(filename, "UTF-8") + ";");
			else if (userAgent != null && userAgent.indexOf("MSIE") > -1) // MS IE (보통은 6.x 이상 가정)
				response.setHeader("Content-Disposition",
						"ATTachment; Filename=" + URLEncoder.encode(filename, "UTF-8") + ";");
			else // 모질라나 오페라
				response.setHeader("Content-Disposition",
						"ATTachment; Filename=" + new String(filename.getBytes("euc-kr"), "latin1") + ";");
	
			response.setHeader("Content-Transfer-Encoding", "binary");
			response.setHeader("Pragma", "no-cache;");
			response.setHeader("Expires", "-1;");
	
			OutputStream fileOut = response.getOutputStream();
			Decoder decoder = Base64.getDecoder();
	
			byte[] buff = fileData.getBytes();
			String toStr = new String(buff);
			byte[] b64dec = decoder.decode(toStr);
			
//			response.setContentType("application/pdf");
//			response.setHeader("Content-Disposition", "attachment;filename=" + filename);
			OutputStream out = response.getOutputStream();
			out.write(b64dec);
		
		}
	}
	
	public static void downloadFile(HttpServletRequest request, HttpServletResponse response, byte[] fileData,
            String fileName, String contentType, String disposition) throws Exception {
        
        if (response != null && fileData != null && fileName != null && !fileName.equals("")
        	&& contentType != null && !contentType.equals("") && disposition != null && !disposition.equals("")) {
        	
			String userAgent = request.getHeader("User-Agent");
			if(userAgent != null && userAgent.indexOf("MSIE 5.5") > -1) // MS IE 5.5 이하
				response.setHeader("Content-Disposition", "Filename=" + URLEncoder.encode(fileName, "UTF-8") + ";");
			else if(userAgent != null && userAgent.indexOf("MSIE") > -1) // MS IE (보통은 6.x 이상 가정)
				response.setHeader("Content-Disposition", "ATTachment; Filename=" + URLEncoder.encode(fileName, "UTF-8") + ";");
			else // 모질라나 오페라
				response.setHeader("Content-Disposition", "ATTachment; Filename=" + new String(fileName.getBytes("euc-kr"), "latin1") + ";");

            response.setHeader("Content-Type", contentType);
            response.setHeader("Content-Transfer-Encoding", "binary");
            response.setHeader("Pragma", "no-cache;");
            response.setHeader("Expires", "-1;");

            OutputStream out = response.getOutputStream();
            out.write(fileData);
        }
    }
	
}
