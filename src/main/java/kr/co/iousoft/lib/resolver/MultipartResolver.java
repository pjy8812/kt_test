package kr.co.iousoft.lib.resolver;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.commons.fileupload.FileItem;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

public class MultipartResolver extends CommonsMultipartResolver {

	public MultipartResolver() {
	}

	public MultipartResolver(ServletContext servletContext) {
		super(servletContext);
	}

	protected MultipartParsingResult parseFileItems(List fileItems, String encoding) {

		// 스프링 3.0변경으로 수정한 부분
		MultiValueMap<String, MultipartFile> multipartFiles = new LinkedMultiValueMap<String, MultipartFile>();
		Map<String, String[]> multipartParameters = new HashMap<String, String[]>();

		// Extract multipart files and multipart parameters.
		for (Iterator it = fileItems.iterator(); it.hasNext();) {
			FileItem fileItem = (FileItem) it.next();

			if (fileItem.isFormField()) {
				String value = null;
				if (encoding != null) {
					try {
						value = fileItem.getString(encoding);
					} catch (UnsupportedEncodingException ex) {
						logger.warn("Could not decode multipart item '"
								+ fileItem.getFieldName()
								+ "' with encoding '" + encoding
								+ "': using platform default");
						value = fileItem.getString();
					}
				} else {
					value = fileItem.getString();
				}
				String[] curParam = (String[]) multipartParameters.get(fileItem.getFieldName());
				String[] newParam = StringUtils.addStringToArray(curParam, value);
				multipartParameters.put(fileItem.getFieldName(), newParam);
			} else {
				if (fileItem.getSize() > 0) {
					CommonsMultipartFile file = new CommonsMultipartFile(fileItem);
					List<MultipartFile> fileList = multipartFiles.get(fileItem.getFieldName());
					if (fileList == null) {
						fileList = new ArrayList<MultipartFile>();
					}
					fileList.add(file);
					multipartFiles.put(fileItem.getFieldName(), fileList);
					
					logger.debug("Found multipart file [" + file.getName()
							+ "] of size " + file.getSize()
							+ " bytes with original filename ["
							+ file.getOriginalFilename() + "], stored "
							+ file.getStorageDescription());
				}

			}
		}

		return new MultipartParsingResult(multipartFiles, multipartParameters, null);
	}
	
}
