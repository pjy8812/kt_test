package kr.co.iousoft.lib.exception;

public class ServiceException extends Exception {
	String errorCode;
	
	/**
	 * @param message
	 */
	public ServiceException(String errorCode) {
		super(errorCode);
		setErrorCode(errorCode);
	}
	
	public ServiceException(String errorCode, String message) {
		super(message);
		setErrorCode(errorCode);
	}
	
	/**
	 * @return the errorCode
	 */
	public String getErrorCode() {
		return errorCode;
	}

	/**
	 * @param errorCode the errorCode to set
	 */
	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}
}
