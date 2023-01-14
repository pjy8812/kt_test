package kr.co.iousoft.lib.util;

import java.math.BigInteger;
import java.util.UUID;

public class UIDGenerator {

	public static String genRandomString() {
 		BigInteger bigInt = new BigInteger(UUID.randomUUID().toString().replace("-", ""), 16);
 		return bigInt.toString(16);
	}
}