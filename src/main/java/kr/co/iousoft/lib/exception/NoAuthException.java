package kr.co.iousoft.lib.exception;

public class NoAuthException extends ServiceException {

	/**
	 * @param errorCode
	 */
	public NoAuthException(String message) {
		super("NO_AUTH", message);
	}

}
