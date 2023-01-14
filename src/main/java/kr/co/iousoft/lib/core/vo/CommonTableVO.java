package kr.co.iousoft.lib.core.vo;

import java.util.Map;

public class CommonTableVO extends SearchVO {

	public static final String YN_Y = "Y";
	public static final String YN_N = "N";
	public static final int DEFAULT_PAGE_SIZE = 25;
	public static final int DEFAULT_MID_PAGE_SIZE = 20;
	
	public CommonTableVO() {
		super();
	}

	public CommonTableVO(Map map) {
		super(map);
	}

	/* (non-Javadoc)
	 * @see kr.co.iousoft.lib.core.vo.DefaultVO#initMembers()
	 */
	@Override
	protected void initMembers() {
		super.initMembers();
	}

}
