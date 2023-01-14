
package kr.co.iousoft.lib.util;

import java.util.Map;

public class Pagination {
	
	int pageIndex = 1;
	int pageSize = 20;
	long sizeOfData;
	int pageLength = 5; 
	String keyword;
	String params;
	
	public Pagination() {};

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public long getSizeOfData() {
		return sizeOfData;
	}

	public void setSizeOfData(long sizeOfData) {
		this.sizeOfData = sizeOfData;
	}

	public int getPageLength() {
		return pageLength;
	}

	public void setPageLength(int pageLength) {
		this.pageLength = pageLength;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getParams() {
		return params;
	}

	public void setParams(String params) {
		this.params = params;
	}

	public String setPagination(Map map){
		
		initMembers(map);

		int pageCount = (int)((sizeOfData-1) / pageSize) + 1;
		if (pageCount == 1) {
			return "";
		}
		int first = 1;
		int last = pageCount;

		int startIndex = pageIndex - (int) (pageLength / 2.0);
		int endIndex = pageIndex + (int) (pageLength / 2.0 + 0.5);

		if (startIndex <= 1) {
			endIndex += (1 - startIndex);
			first = -1;
			startIndex = 1;
		}
		
		if (endIndex >= pageCount) {
			startIndex -= (endIndex - pageCount);
			last = -1;
			endIndex = pageCount;
		}
		
		if (startIndex <= 1) {
			first = -1;
			startIndex = 1;
		}

		String result = "";
		StringBuffer strbuff = new StringBuffer(result);
		
		// opener
		strbuff.append("<ul class=\"pagination pagination-rounded justify-content-center mt-2\">");
		// left arrow 
		if (startIndex > 1) {
			strbuff.append(String.format("<li class=\"paginate_button page-item previous disabled\" data-page-index=\"%d\">",pageIndex - 1));
			strbuff.append("	<a href=\"javascript:void(0);\" aria-controls=\"state-saving-datatable\" class=\"page-link\"><i class=\"mdi mdi-chevron-left\"></i>");
			strbuff.append("	</a>");
			strbuff.append("</li>");
		}
	
		// contents
		for (int i = startIndex; i <= endIndex; i++) {

			String activeClassStr = "";
			
			if(i == pageIndex) {
				activeClassStr = " active";
			}
			
			strbuff.append(String.format("<li class=\"paginate_button page-item%s\" data-page-index=\"%d\">", activeClassStr, i));
			strbuff.append(String.format("<a href=\"javascript:void(0);\" aria-controls=\"state-saving-datatable\" class=\"page-link\">%d</a>", i));
			strbuff.append("</li>");
		}
	
		// right arrow 
		if (endIndex < pageCount) {
			strbuff.append(String.format("<li class=\"paginate_button page-item next\" data-page-index=\"%d\">\n", pageIndex+1));
			strbuff.append("	<a href=\"javascript:void(0);\" aria-controls=\"state-saving-datatable\" class=\"page-link\"><i class=\"mdi mdi-chevron-right\"></i>");
			strbuff.append("	</a>");
			strbuff.append("</li>");
		}
		
		// closer
		strbuff.append("</ul>");
		
		result = strbuff.toString();
		
		return result;
	}
	
	private void initMembers(Map map) {
		
		if (map == null) {
			return;
		}
		
		pageIndex = (int) map.get("pageIndex");
		pageSize = (int) map.get("pageSize");
		sizeOfData = ((Integer) map.get("sizeOfData")).longValue();
		keyword = (String) map.get("keyword");
		
		if (keyword == null) {
			keyword = "";
		}
	}

}
