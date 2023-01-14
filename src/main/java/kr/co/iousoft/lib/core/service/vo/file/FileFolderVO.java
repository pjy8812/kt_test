package kr.co.iousoft.lib.core.service.vo.file;

import java.util.Map;

import kr.co.iousoft.lib.core.vo.CommonTableVO;

public class FileFolderVO extends CommonTableVO {

	String fileFolderId; // PK
	String fileFolderName;
	String upFileFolderId;

	public FileFolderVO() {
		super();
	}

	public FileFolderVO(Map map) {
		super(map);
	}

	protected void initMembers() {
		super.initMembers();
	}

	public String getFileFolderId() {
		return fileFolderId;
	}

	public void setFileFolderId(String fileFolderId) {
		this.fileFolderId = fileFolderId;
	}

	public String getFileFolderName() {
		return fileFolderName;
	}

	public void setFileFolderName(String fileFolderName) {
		this.fileFolderName = fileFolderName;
	}

	public String getUpFileFolderId() {
		return upFileFolderId;
	}

	public void setUpFileFolderId(String upFileFolderId) {
		this.upFileFolderId = upFileFolderId;
	}

	@Override
	public String toString() {
		return "FileFolderVO [fileFolderId=" + fileFolderId + ", fileFolderName=" + fileFolderName + ", upFileFolderId="
				+ upFileFolderId + "]";
	}

}
