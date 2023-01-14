package kr.co.iousoft.lib.core.vo;

import java.util.Map;

public class SearchVO extends DefaultVO {
	String keyword;
	String option;
	String orderBy;
	
	public SearchVO() {
		super();
	}

	public SearchVO(Map map) {
		super(map);
	}
	
	/**
	 * initMembers 다른VO에서 사용할 수 있음
	 */
	protected void initMembers() {
		//TODO 다른VO에서 사용할 수 있음
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}

	public String getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}

}
