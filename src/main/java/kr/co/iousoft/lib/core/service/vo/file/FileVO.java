package kr.co.iousoft.lib.core.service.vo.file;

import java.math.BigDecimal;
import java.util.Map;

import kr.co.iousoft.lib.core.vo.CommonTableVO;

public class FileVO extends CommonTableVO {

	
	String fileId; // PK
	String fileFolderId; // FK == fileFoloderVO.fileFolderId
	String orgFileName;
	String saveFileName;
	String saveDir;
	String fileExt;
	String contentType;
	BigDecimal fileSize;
	String userId; // == userVO.userId
	
	public FileVO() {
		super();
	}

	public FileVO(Map map) {
		super(map);
	}

	protected void initMembers() {
		super.initMembers();
	}

	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	public String getFileFolderId() {
		return fileFolderId;
	}

	public void setFileFolderId(String fileFolderId) {
		this.fileFolderId = fileFolderId;
	}

	public String getOrgFileName() {
		return orgFileName;
	}

	public void setOrgFileName(String orgFileName) {
		this.orgFileName = orgFileName;
	}

	public String getSaveFileName() {
		return saveFileName;
	}

	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}

	public String getSaveDir() {
		return saveDir;
	}

	public void setSaveDir(String saveDir) {
		this.saveDir = saveDir;
	}

	public String getFileExt() {
		return fileExt;
	}

	public void setFileExt(String fileExt) {
		this.fileExt = fileExt;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public BigDecimal getFileSize() {
		return fileSize;
	}

	public void setFileSize(BigDecimal fileSize) {
		this.fileSize = fileSize;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "FileVO [fileId=" + fileId + ", fileFolderId=" + fileFolderId + ", orgFileName=" + orgFileName
				+ ", saveFileName=" + saveFileName + ", saveDir=" + saveDir + ", fileExt=" + fileExt + ", contentType="
				+ contentType + ", fileSize=" + fileSize + ", userId=" + userId + "]";
	}

}
