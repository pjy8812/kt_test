package kr.co.iousoft.lib.core.service.dataaccess;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

public class AbstractMapper extends SuperAbstractMapper {

//	@Resource(name = "propertyService")
//	protected DatabaseDrivenPropertyService propertyService;

	public int insert(String queryId) {
		return super.insert(queryId);
	}

	public int insert(String queryId, Object parameterObject) {
		return super.insert(queryId, updateDateFieldTimeZone(parameterObject));
	}

	public int update(String queryId) {
		return super.update(queryId);
	}

	public int update(String queryId, Object parameterObject) {
		return super.update(queryId, updateDateFieldTimeZone(parameterObject));
	}

	public int delete(String queryId) {
		return super.delete(queryId);
	}

	public int delete(String queryId, Object parameterObject) {
		return super.delete(queryId, updateDateFieldTimeZone(parameterObject));
	}

	@Deprecated
	public Object selectByPk(String queryId, Object parameterObject) {
		return updateDateFieldTimeZone(super.selectOne(queryId, parameterObject));
	}

	public <T> T selectOne(String queryId) {
		return (T) updateDateFieldTimeZone(super.selectOne(queryId));
	}

	public <T> T selectOne(String queryId, Object parameterObject) {
		return (T) updateDateFieldTimeZone(super.selectOne(queryId, parameterObject));
	}

	public <K, V> Map<K, V> selectMap(String queryId, String mapKey) {
		return (Map<K, V>) updateDateFieldTimeZone(super.selectMap(queryId, mapKey));
	}

	public <K, V> Map<K, V> selectMap(String queryId, Object parameterObject, String mapKey) {
		return (Map<K, V>) updateDateFieldTimeZone(super.selectMap(queryId, parameterObject, mapKey));
	}

	public <K, V> Map<K, V> selectMap(String queryId, Object parameterObject, String mapKey, RowBounds rowBounds) {
		return (Map<K, V>) updateDateFieldTimeZone(super.selectMap(queryId, parameterObject, mapKey, rowBounds));
	}

	@Deprecated
	public List<?> list(String queryId, Object parameterObject) {
		return (List<?>) updateDateFieldTimeZone(super.selectList(queryId, parameterObject));
	}

	public <E> List<E> selectList(String queryId) {
		return (List<E>) updateDateFieldTimeZone(super.selectList(queryId));
	}

	public <E> List<E> selectList(String queryId, Object parameterObject) {
		return (List<E>) updateDateFieldTimeZone(super.selectList(queryId, parameterObject));
	}

	public <E> List<E> selectList(String queryId, Object parameterObject, RowBounds rowBounds) {
		return (List<E>) updateDateFieldTimeZone(super.selectList(queryId, parameterObject, rowBounds));
	}

	public List<?> listWithPaging(String queryId, Object parameterObject, int pageIndex, int pageSize) {
		return (List<?>) updateDateFieldTimeZone(super.listWithPaging(queryId, parameterObject, pageIndex, pageSize));
	}
	private Object updateDateFieldTimeZone(Object object) {
		return object;
	}
}
