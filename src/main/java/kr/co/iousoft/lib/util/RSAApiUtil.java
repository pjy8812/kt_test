package kr.co.iousoft.lib.util;

import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;


public class RSAApiUtil {
	private static Logger logger = LogManager.getLogger("RSAApiUtil");
	
	public static PublicKey initRsaAPi() {
 
        PublicKey publicKey = null;
		try {
	        String tmepPublicKey = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCOQ/I9nFqK+SZMi+/q9cEonyTVhrylYXjsDi/iococ4tLjSS8E8YeWCmc5coR1kz1gNrX4h5y+gO3VWNmORsSg+PwmbrCerkOT5OiUX9sgStozANC/eSGGRA+iV0o8gsoMhVwDkpIxFh32tFgAK2F4UP+NDj22knZ2KkN0yvOGvQIDAQAB";
			publicKey = getPublicKeyFromBase64Encrypted(tmepPublicKey);
		} catch (NoSuchAlgorithmException e) {
			logger.debug("rsa NoSuchAlgorithmException");
		} catch (InvalidKeySpecException e) {
			logger.debug("rsa InvalidKeySpecException");
		} 
        
        return publicKey;
    }
	
	public static PrivateKey initPrivate() {
		PrivateKey privateKey = null;
		try {
	        String tempKey =	"MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBAI5D8j2cWor5JkyL7+r1wSifJNWGvKVheOwOL+Khyhzi0uNJLwTxh5YKZzlyhHWTPWA2tfiHnL6A7dVY2Y5GxKD4/CZusJ6uQ5Pk6JRf2yBK2jMA0L95IYZED6JXSjyCygyFXAOSkjEWHfa0WAArYXhQ/40OPbaSdnYqQ3TK84a9AgMBAAECgYA86EYbrobtHMIS3451z4VE+O1yJV86hsKYfXJu2smHGG0lNb3VpfpgeE+9PpQLKmCKgqHhp12qCdTJFGMAELg5dQGdsoid1epOnSCOaOkXHpZiT7zXIHoqbQ0EjFwqRlCdQmPw1mqdW5zaS76EKKBYJ7mmJLqsONTXyN4QewXz2QJBAODmMDaM4Djg6sIt9LvKd0tg34e250Sr30NcQfbZ67zzUopD2MfbVGAG6gU6XfYYLN3P5qdDgA7S/xp0azgiKVsCQQCh8GIG0AmUkdz7r5/UBnDoI64urOo0Hov8Fst2DlYwJJzLErx/ibNcBDNF32QQRmLcg8+C6FJBbOXwUHB2rPPHAkAPOQWCa76xmufJBPtPysCQZZo7wXGeAFQ4ZwJABzghrgakPTtrK7lmVpF4kR7TDYfb67qdD8CXQEjsLX0ka4uJAkAvE56rtFbUpgLD+C5SiPzRv22njAUZ2beANXA4hbpwjHQ4ZN3/hZxqp53wNhz0zkF3Maplt/wRoQLHddr75ROJAkBiALYCIFFSTX7QJqabxBKPp2R9oaMgJXAt/qcRURLe644piACx5eEn1yqYQ1j639dwfTfgvL0fV5nun2p/6Wk7";
	        privateKey = getPrivateKeyFromBase64Encrypted(tempKey);
		} catch (NoSuchAlgorithmException e) {
			logger.debug("rsa NoSuchAlgorithmException");
		} catch (InvalidKeySpecException e) {
			logger.debug("rsa InvalidKeySpecException");
		} 
        
        return privateKey;
    }
	
	/**
	* Public Key로 RSA 암호화를 수행
    */
   public static String encryptRSA(String plainText, PublicKey publicKey) throws NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeyException,
           BadPaddingException, IllegalBlockSizeException {
       Cipher cipher = Cipher.getInstance("RSA");
       cipher.init(Cipher.ENCRYPT_MODE, publicKey);

       byte[] bytePlain = cipher.doFinal(plainText.getBytes());
       return Base64.getEncoder().encodeToString(bytePlain);
   }

   /**
    * Private Key로 RSA 복호화를 수행
    */
   public static String decryptRSA(String encrypted, PrivateKey privateKey) throws NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeyException,
           BadPaddingException, IllegalBlockSizeException, UnsupportedEncodingException {
       Cipher cipher = Cipher.getInstance("RSA");
       byte[] byteEncrypted = Base64.getDecoder().decode(encrypted.getBytes());

       cipher.init(Cipher.DECRYPT_MODE, privateKey);
       byte[] bytePlain = cipher.doFinal(byteEncrypted);
       return new String(bytePlain, "utf-8");
   }
 
	
	/**
	 * 16진 문자열을 byte 배열로 변환
	 * @param hex
	 * @return
	 */
    private static byte[] hexToByteArray(String hex) {
        if (hex == null || hex.length() % 2 != 0) { return new byte[] {}; }
 
        byte[] bytes = new byte[hex.length() / 2];
        for (int i = 0; i < hex.length(); i += 2) {
            byte value = (byte) Integer.parseInt(hex.substring(i, i + 2), 16);
            bytes[(int) Math.floor(i / 2)] = value;
        }
        return bytes;
    }
    
    
    public static PublicKey getPublicKeyFromBase64Encrypted(String base64PublicKey)throws NoSuchAlgorithmException, InvalidKeySpecException {
        byte[] decodedBase64PubKey = Base64.getDecoder().decode(base64PublicKey);

        return KeyFactory.getInstance(RSAUtil.RSA_INSTANCE)
                .generatePublic(new X509EncodedKeySpec(decodedBase64PubKey));
    }
    
    public static PrivateKey getPrivateKeyFromBase64Encrypted(String base64PrivateKey)
            throws NoSuchAlgorithmException, InvalidKeySpecException {
        byte[] decodedBase64PrivateKey = Base64.getDecoder().decode(base64PrivateKey);

        return KeyFactory.getInstance(RSAUtil.RSA_INSTANCE)
                .generatePrivate(new PKCS8EncodedKeySpec(decodedBase64PrivateKey));
    }

}
