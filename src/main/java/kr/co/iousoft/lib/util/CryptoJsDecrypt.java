package kr.co.iousoft.lib.util;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class CryptoJsDecrypt {
	private static Logger logger = LogManager.getLogger("CryptoJsDecrypt");
	
	public static String decrypt(String ciphertext) {
		try {
			int keysize = 256;
			int ivsize = 128;

			byte[] ctBytes = Base64.decodeBase64(ciphertext.getBytes("UTF-8"));

			byte[] saltBytes = Arrays.copyOfRange(ctBytes, 8, 16);

			byte[] ciphertextBytes = Arrays.copyOfRange(ctBytes, 16, ctBytes.length);

			byte[] key = new byte[keysize/8];
			byte[] iv = new byte[ivsize/8];

			String pass = AESSimpleCrypto.encryptCode("kt");
			EvpKDF(pass.getBytes("UTF-8"), keysize, ivsize, saltBytes, key, iv);

			Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
			cipher.init(Cipher.DECRYPT_MODE, new SecretKeySpec(key, "AES"), new IvParameterSpec(iv));
			byte[] recoveredPlaintextBytes = cipher.doFinal(ciphertextBytes);

			return new String(recoveredPlaintextBytes);
		} catch (UnsupportedEncodingException e) {
			logger.debug("error: UnsupportedEncodingException");
		} catch (NoSuchAlgorithmException e) {
			logger.debug("error: NoSuchAlgorithmException");
		} catch (NoSuchPaddingException e) {
			logger.debug("error: NoSuchPaddingException");
		} catch (InvalidKeyException e) {
			logger.debug("error: InvalidKeyException");
		} catch (InvalidAlgorithmParameterException e) {
			logger.debug("error: InvalidAlgorithmParameterException");
		} catch (IllegalBlockSizeException e) {
			logger.debug("error: IllegalBlockSizeException");
		} catch (BadPaddingException e) {
			logger.debug("error: BadPaddingException");
		} catch (Exception e) {
			logger.debug("error: Exception");
		}

		return null;
	}

	private static byte[] EvpKDF(byte[] password, int keysize, int ivsize, byte[] salt, byte[] reultKey, byte[] resiltlv) throws NoSuchAlgorithmException{
		return EvpKDF(password, keysize, ivsize, salt, 1, "MD5", reultKey, resiltlv);
	}

	private static byte[] EvpKDF(byte[] password, int keysize, int ivSize, byte[] salt, int iterations, String hashAlgorithm,byte[] resultKey, byte[] resultlv) throws NoSuchAlgorithmException{
		int tempKeysize = keysize/32;
		int ivsize = ivSize;
		ivsize = ivsize/32;
		int targetKeySize = tempKeysize+ivsize;
		byte[] derivedByte = new byte[targetKeySize*4];
		int numberOfDerivedWords = 0;
		byte[] block = null;
		MessageDigest hasher = MessageDigest.getInstance(hashAlgorithm);
		while (numberOfDerivedWords < targetKeySize) {
			if(block != null) {
				hasher.update(block);
			}
			hasher.update(password);
			//salting
			block = hasher.digest(salt);
			hasher.reset();
			//key stretching
			for(int i=1; i< iterations; i++) {
				block = hasher.digest(block);
				hasher.reset();
			}
			System.arraycopy(block, 0, derivedByte, numberOfDerivedWords*4, Math.min(block.length, (targetKeySize - numberOfDerivedWords) *4));
			numberOfDerivedWords += block.length/4;
		}
		System.arraycopy(derivedByte, 0, resultKey, 0, tempKeysize*4);
		System.arraycopy(derivedByte, tempKeysize*4, resultlv, 0, ivsize*4);
		return derivedByte;
	}
}
