package kr.co.iousoft.lib.util;

import java.security.SecureRandom;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;


public class AESSimpleCrypto
{
	public static final String SMARTID_KEY = "iousmartid031607";

	// public static final String PADDING = "AES";
	// public static final String PADDING = "AES/CBC/PKCS5Padding";
	public static final String PADDING = "AES/ECB/PKCS5Padding";
	// public static final String PADDING = "AES/ECB/ZeroBytePadding";
	
	public final static String SEED = "1234567890123456";
	
	private final static String HEX = "0123456789ABCDEF";
	
	public static String decryptCode(String source) throws Exception
	{
		try
		{
			String code = AESSimpleCrypto.decrypt(AESSimpleCrypto.SEED, source);
			return code;
		}
		catch(NullPointerException ne)
		{
			return source;
		} catch (Exception e) {
			return source;
		}
	}

	public static String encryptCode(String source) throws Exception
	{
		String code = AESSimpleCrypto.encrypt(AESSimpleCrypto.SEED, source);
		return code;
	}

	public static String encrypt(String seed, String cleartext) throws Exception
	{
		byte[] rawKey = getRawKey(seed.getBytes());
		byte[] result = encrypt(rawKey, cleartext.getBytes());
		return toHex(result);
	}

	public static String decrypt(String seed, String encrypted) throws Exception
	{
		byte[] rawKey = getRawKey(seed.getBytes());
		byte[] enc = toByte(encrypted);
		byte[] result = decrypt(rawKey, enc);
		return new String(result);
	}

	private static byte[] getRawKey(byte[] seed) throws Exception
	{
		KeyGenerator kgen = KeyGenerator.getInstance("AES");
		SecureRandom sr = SecureRandom.getInstance("SHA1PRNG");
		sr.setSeed(seed);
		kgen.init(128, sr); // 192 and 256 bits may not be available
		// SecretKey skey = kgen.generateKey();
		SecretKey skey = new SecretKeySpec(seed, "AES");

		byte[] raw = skey.getEncoded();
		return raw;
	}

	private static byte[] encrypt(byte[] raw, byte[] clear) throws Exception
	{
		SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
		Cipher cipher = Cipher.getInstance(PADDING);
		cipher.init(Cipher.ENCRYPT_MODE, skeySpec);

		byte[] encrypted = cipher.doFinal(clear);
		return encrypted;
	}

	private static byte[] decrypt(byte[] raw, byte[] encrypted) throws Exception
	{
		SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
		Cipher cipher = Cipher.getInstance(PADDING);
		cipher.init(Cipher.DECRYPT_MODE, skeySpec);

		byte[] decrypted = cipher.doFinal(encrypted);
		return decrypted;
	}

	public static String toHex(String txt)
	{
		return toHex(txt.getBytes());
	}

	public static String fromHex(String hex)
	{
		return new String(toByte(hex));
	}

	public static byte[] toByte(String hexString)
	{
		int len = hexString.length() / 2;
		byte[] result = new byte[len];

		for(int i = 0 ; i < len ; i++)
		{
			String temp = hexString.substring(2 * i, 2 * i + 2);
			Integer intTemp = Integer.valueOf(temp, 16);
			result[i] = intTemp.byteValue();
		}

		return result;
	}

	public static String toHex(byte[] buf)
	{
		if(buf == null)
			return "";

		StringBuffer result = new StringBuffer(2 * buf.length);

		for(int i = 0 ; i < buf.length ; i++)
		{
			appendHex(result, buf[i]);
		}

		return result.toString();
	}

	

	private static void appendHex(StringBuffer sb, byte b)
	{
		sb.append(HEX.charAt((b >> 4) & 0x0f)).append(HEX.charAt(b & 0x0f));
	}

}
