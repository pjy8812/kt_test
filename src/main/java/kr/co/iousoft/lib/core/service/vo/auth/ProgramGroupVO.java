package kr.co.iousoft.lib.core.service.vo.auth;

import java.math.BigDecimal;
import java.util.Map;

import kr.co.iousoft.lib.core.vo.CommonTableVO;

/**
 * <code>ProgramGroupVO</code>
 *
 * @author 임병진(nomja@iousoft.co.kr)
 * @since 2021.04.01
 * @version 1.0
 */
public class ProgramGroupVO extends CommonTableVO {
	String prgGroupId;
	String prgGroupCd;
	String prgGroupCss;
	String prePrgGroupId;
	BigDecimal seq;
	
	/**
	 * 
	 */
	public ProgramGroupVO() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param map
	 */
	public ProgramGroupVO(Map map) {
		super(map);
		// TODO Auto-generated constructor stub
	}

	public String getPrePrgGroupId() {
		return prePrgGroupId;
	}

	public void setPrePrgGroupId(String prePrgGroupId) {
		this.prePrgGroupId = prePrgGroupId;
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
	 * @return the prgGroupCd
	 */
	public String getPrgGroupCd() {
		return prgGroupCd;
	}

	/**
	 * @param prgGroupCd the prgGroupCd to set
	 */
	public void setPrgGroupCd(String prgGroupCd) {
		this.prgGroupCd = prgGroupCd;
	}

	/**
	 * @return the prgGroupCss
	 */
	public String getPrgGroupCss() {
		return prgGroupCss;
	}

	/**
	 * @param prgGroupCss the prgGroupCss to set
	 */
	public void setPrgGroupCss(String prgGroupCss) {
		this.prgGroupCss = prgGroupCss;
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

}
