package kr.co.iousoft.lib.core.service.vo.auth;

import java.math.BigDecimal;
import java.util.Map;

import kr.co.iousoft.lib.core.vo.CommonTableVO;

/**
 * <code>ProgramVO</code>
 *
 * @author 임병진(nomja@iousoft.co.kr)
 * @since 2021.04.01
 * @version 1.0
 */
public class ProgramVO extends CommonTableVO {
	String programId;
	String prgGroupId;
	String programCd;
	String programUri;
	String programCss;
	String authReadYn;
	String authCreateYn;
	String authUpdateYn;
	String authDeleteYn;
	BigDecimal seq;
	String note;
	String preProgramId;
	String authIp;
	String interfaceUrl;

	public String getPreProgramId() {
		return preProgramId;
	}

	public void setPreProgramId(String preProgramId) {
		this.preProgramId = preProgramId;
	}

	/**
	 * 
	 */
	public ProgramVO() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param map
	 */
	public ProgramVO(Map map) {
		super(map);
		// TODO Auto-generated constructor stub
	}

	protected void initMembers() {
		authReadYn = "N";
		authCreateYn = "N";
		authUpdateYn = "N";
		authDeleteYn = "N";
	}

	/**
	 * @return the programId
	 */
	public String getProgramId() {
		return programId;
	}

	/**
	 * @param programId the programId to set
	 */
	public void setProgramId(String programId) {
		this.programId = programId;
	}

	/**
	 * @return the prgGroupId
	 */
	public String getPrgGroupId() {
		return prgGroupId;
	}

	/**
	 * @param prgGroupId the prgGroupId to set
	 */
	public void setPrgGroupId(String prgGroupId) {
		this.prgGroupId = prgGroupId;
	}

	/**
	 * @return the programCd
	 */
	public String getProgramCd() {
		return programCd;
	}

	/**
	 * @param programCd the programCd to set
	 */
	public void setProgramCd(String programCd) {
		this.programCd = programCd;
	}

	/**
	 * @return the programUri
	 */
	public String getProgramUri() {
		return programUri;
	}

	/**
	 * @param programUri the programUri to set
	 */
	public void setProgramUri(String programUri) {
		this.programUri = programUri;
	}

	/**
	 * @return the programCss
	 */
	public String getProgramCss() {
		return programCss;
	}

	/**
	 * @param programCss the programCss to set
	 */
	public void setProgramCss(String programCss) {
		this.programCss = programCss;
	}

	/**
	 * @return the authReadYn
	 */
	public String getAuthReadYn() {
		return authReadYn;
	}

	/**
	 * @param authReadYn the authReadYn to set
	 */
	public void setAuthReadYn(String authReadYn) {
		this.authReadYn = authReadYn;
	}

	/**
	 * @return the authCreateYn
	 */
	public String getAuthCreateYn() {
		return authCreateYn;
	}

	/**
	 * @param authCreateYn the authCreateYn to set
	 */
	public void setAuthCreateYn(String authCreateYn) {
		this.authCreateYn = authCreateYn;
	}

	/**
	 * @return the authUpdateYn
	 */
	public String getAuthUpdateYn() {
		return authUpdateYn;
	}

	/**
	 * @param authUpdateYn the authUpdateYn to set
	 */
	public void setAuthUpdateYn(String authUpdateYn) {
		this.authUpdateYn = authUpdateYn;
	}

	/**
	 * @return the authDeleteYn
	 */
	public String getAuthDeleteYn() {
		return authDeleteYn;
	}

	/**
	 * @param authDeleteYn the authDeleteYn to set
	 */
	public void setAuthDeleteYn(String authDeleteYn) {
		this.authDeleteYn = authDeleteYn;
	}

	/**
	 * @return the seq
	 */
	public BigDecimal getSeq() {
		return seq;
	}

	/**
	 * @param seq the seq to set
	 */
	public void setSeq(BigDecimal seq) {
		this.seq = seq;
	}

	/**
	 * @return the note
	 */
	public String getNote() {
		return note;
	}

	/**
	 * @param note the note to set
	 */
	public void setNote(String note) {
		this.note = note;
	}

	public String getAuthIp() {
		return authIp;
	}

	public void setAuthIp(String authIp) {
		this.authIp = authIp;
	}

	public String getInterfaceUrl() {
		return interfaceUrl;
	}

	public void setInterfaceUrl(String interfaceUrl) {
		this.interfaceUrl = interfaceUrl;
	}
	
	

	
}
