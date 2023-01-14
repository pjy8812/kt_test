package kr.co.iousoft.lib.util;

import java.util.HashMap;

import org.springframework.jdbc.support.JdbcUtils;

public class LowerHashMap extends HashMap{
	
	@SuppressWarnings("unchecked")
	@Override
	public Object put(Object key, Object value) {
		return super.put(JdbcUtils.convertUnderscoreNameToPropertyName((String) key), value);
		
	}
}

