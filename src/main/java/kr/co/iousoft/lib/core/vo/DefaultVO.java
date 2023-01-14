package kr.co.iousoft.lib.core.vo;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.builder.ToStringBuilder;

import kr.co.iousoft.lib.core.service.vo.session.SessionVO;

public abstract class DefaultVO<T> implements Serializable, Cloneable {
	int pageIndex;
	int pageSize;
	int pageOffset;
	int pageReadTotal;

	Date createDt;
	int createUserSqn;
	Date modifyDt;
	int modifyUserSqn;

	public DefaultVO() {
		initDefaultVOMembers();
	}

	public DefaultVO(Map map) {
		initDefaultVOMembers();
		loadMap(map);
	}

	private void initDefaultVOMembers() {
		setPageIndex(1);
		setPageSize(20);
		initMembers();
	}

	protected abstract void initMembers();

	/**
	 * map에서 멤버 변수의 값을 설정한다.
	 *
	 * @param map
	 */
	public void loadMap(Map map) {
		if (map == null) return;
		Iterator<String> keyIterator = map.keySet().iterator();
		while (keyIterator.hasNext()) {
			String key = keyIterator.next();
			Object value = map.get(key);
			String methodName = "set"+(""+key.charAt(0)).toUpperCase()+key.substring(1);

			Method method;
			try {
				if (value == null) {
					method = this.getClass().getMethod(methodName, String.class);
				} else if (value instanceof Timestamp) {
					method = this.getClass().getMethod(methodName, Date.class);
				} else if (value instanceof Integer) {
					try {
						method = this.getClass().getMethod(methodName, Integer.class);
						method.invoke(this, value);
					} catch (NullPointerException ne) {
						method = this.getClass().getMethod(methodName, BigDecimal.class);
						method.invoke(this, new BigDecimal(value.toString()));
					} catch (Exception ee) {
						try {
							method = this.getClass().getMethod(methodName, int.class);
						} catch (NullPointerException nee) {
							method = this.getClass().getMethod(methodName, BigDecimal.class);
							method.invoke(this, new BigDecimal(value.toString()));
						} catch (Exception eee) {
							method = this.getClass().getMethod(methodName, BigDecimal.class);
							method.invoke(this, new BigDecimal(value.toString()));
						}
					}
				}  else if (value instanceof Long) {
					try {
						method = this.getClass().getMethod(methodName, Long.class);
						method.invoke(this, value);
						continue;
					} catch (Exception ee) {
						try {
							method = this.getClass().getMethod(methodName, long.class);
						} catch (Exception eee) {
							method = this.getClass().getMethod(methodName, BigDecimal.class);
							method.invoke(this, new BigDecimal(value.toString()));
							continue;
						}
					}
				} else if (value instanceof BigDecimal) {
					try {
						method = this.getClass().getMethod(methodName, Integer.class);
						method.invoke(this, ((BigDecimal) value).intValue());
					} catch (NullPointerException ne) {
						method = this.getClass().getMethod(methodName, value.getClass());
					} catch (Exception ee) {
						try {
							method = this.getClass().getMethod(methodName, int.class);
							method.invoke(this, ((BigDecimal) value).intValue());
						} catch (NullPointerException nee) {
							method = this.getClass().getMethod(methodName, value.getClass());
						} catch (Exception eee) {
							method = this.getClass().getMethod(methodName, value.getClass());
						}
					}
				} else if (value instanceof List) {
					try {
						method = this.getClass().getMethod(methodName, List.class);
						method.invoke(this, value);
					} catch (NullPointerException ne) {
						method = this.getClass().getMethod(methodName, List.class);
						method.invoke(this, value);
					} catch (Exception ee) {
						method = this.getClass().getMethod(methodName, Object.class);
						method.invoke(this, value);
					}
				} else {
					method = this.getClass().getMethod(methodName, value.getClass());
				}
				method.invoke(this, value);
			} catch (NoSuchMethodException e) {
				e.printStackTrace();
			} catch (SecurityException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 멤버변수들에 대한 map을 반환한다.
	 *
	 * @return
	 */
	public Map<String, Object> toMap() {
		Map<String, Object> map = new HashMap<String, Object>();
		for (Method srcMethod : this.getClass().getMethods()) {
			String methodName = srcMethod.getName();
			try {
				if (!Modifier.isPublic(srcMethod.getModifiers()))
					continue;

				if (methodName.startsWith("get") && srcMethod.getParameterTypes().length == 0) {
					Object value = srcMethod.invoke(this, new Object[0]);
					String key = methodName.replaceFirst("get", "");
					key = (""+key.charAt(0)).toLowerCase() + key.substring(1);
					map.put(key, value);
				}
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalArgumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return map;
	}

	/**
	 * @return the pageIndex
	 */
	public int getPageIndex() {
		return pageIndex;
	}


	/**
	 * @param pageIndex the pageIndex to set
	 */
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}


	/**
	 * @return the pageSize
	 */
	public int getPageSize() {
		return pageSize;
	}


	/**
	 * @param pageSize the pageSize to set
	 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageOffset() {
		return (pageIndex-1)*pageSize;
	}

	public void setPageOffset(int pageOffset) {
		this.pageOffset = pageOffset;
	}

	public int getPageReadTotal() {
		return pageIndex*pageSize;
	}

	public void setPageReadTotal(int pageReadTotal) {
		this.pageReadTotal = pageReadTotal;
	}

	public Date getCreateDt() {
		return createDt;
	}

	public void setCreateDt(Date createDt) {
		this.createDt = createDt;
	}

	public int getCreateUserSqn() {
		return createUserSqn;
	}

	public void setCreateUserSqn(int createUserSqn) {
		this.createUserSqn = createUserSqn;
	}

	public Date getModifyDt() {
		return modifyDt;
	}

	public void setModifyDt(Date modifyDt) {
		this.modifyDt = modifyDt;
	}

	public int getModifyUserSqn() {
		return modifyUserSqn;
	}

	public void setModifyUserSqn(int modifyUserSqn) {
		this.modifyUserSqn = modifyUserSqn;
	}

	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

	public Object clone() {
		try {
			return super.clone();
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
			return null;
		}
	}

	public void setBasicColumn(SessionVO vo) {
		if (vo != null) {
			Date now = Calendar.getInstance().getTime();
			setCreateDt(now);
//			setCreateUserSqn(vo.getUserSqn());
			setModifyDt(now);
//			setModifyUserSqn(vo.getUserSqn());
		}
	}
}
