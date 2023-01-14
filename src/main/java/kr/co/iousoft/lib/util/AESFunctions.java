package kr.co.iousoft.lib.util;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

public class AESFunctions {
	private static final String AES_KEY = "F3D83427C13F8FBCB48A19F33144421A";
	private final static String HEX = "0123456789ABCDEF";

	public static String encrypt(String data) throws Exception {
		String encrypted = null;

		SecretKeySpec secretKeySpec = new SecretKeySpec(AES_KEY.getBytes(),
				"AES");

		Cipher cipher = Cipher.getInstance("AES");
		cipher.init(Cipher.ENCRYPT_MODE, secretKeySpec);

		encrypted = byteToHex(cipher.doFinal(data.getBytes()));

		return encrypted;
	}

	public static String decrypt(String data) throws Exception {
		String decrypted = null;

		SecretKeySpec secretKeySpec = new SecretKeySpec(AES_KEY.getBytes(),
				"AES");

		Cipher cipher = Cipher.getInstance("AES");
		cipher.init(Cipher.DECRYPT_MODE, secretKeySpec);

		decrypted = new String(cipher.doFinal(hexToByte(data)));

		return decrypted;
	}

	private static byte[] hexToByte(String data) {
		if ((data == null) || (data.length() <= 0))
			return null;

		byte[] bytes = null;

		bytes = new byte[data.length() / 2];

		for (int i = 0; i < data.length(); i++) {
			String temp = data.substring(2 * i, 2 * i + 2);
			Integer intTemp =  Integer.valueOf(temp, 16);
			bytes[i] = intTemp.byteValue();
		}

		return bytes;
	}

	private static String byteToHex(byte[] data) {
		if (data == null)
			return null;

		StringBuffer sb = new StringBuffer(data.length * 2);

		for (int i = 0; i < data.length; i++) {
			sb.append(HEX.charAt((data[i] >> 4) & 0x0f)).append(
					HEX.charAt(data[i] & 0x0f));
		}

		return sb.toString();
	}
}
