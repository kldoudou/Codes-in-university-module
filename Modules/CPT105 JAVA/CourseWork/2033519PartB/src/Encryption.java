import javax.crypto.*;
import javax.crypto.spec.DESKeySpec;
import java.security.GeneralSecurityException;
import java.util.Base64;

/**
 * It can encrypt and decrypt the data.
 * @author CPT105 teachers
 */
public class Encryption {
    private final static String sKey="zhenpeng.liu20@student.xjtlu.edu.cn"; // encryption key

    /**
     * Create a secret key
     * @return the secret key
     */
    private static SecretKey makeKeyFactory() throws GeneralSecurityException {
        SecretKeyFactory des = SecretKeyFactory.getInstance("DES");// DES algorithm
        SecretKey secretKey = des.generateSecret(new DESKeySpec(sKey.getBytes()));
        return secretKey;
    }

    /**
     * Get an encrypted string using DES algorithm
     * @param text need to be encrypted.
     * @return is string has been encrypted.
     */
    public static String encrypt(String text) throws GeneralSecurityException {
        Cipher cipher = Cipher.getInstance("DES");
        SecretKey secretKey = makeKeyFactory();
        cipher.init(Cipher.ENCRYPT_MODE, secretKey);
        return new String(Base64.getEncoder().encode(cipher.doFinal(text.getBytes())));
    }

    /**
     * Retrieve a normal string from an encrypted string.
     * @param text need to be decrypted.
     * @return is string has been decrypted.
     */
    public static String decrypt(String text) throws GeneralSecurityException{
        Cipher cipher = Cipher.getInstance("DES");
        SecretKey secretKey = makeKeyFactory();
        cipher.init(Cipher.DECRYPT_MODE, secretKey);
        return new String(cipher.doFinal(Base64.getDecoder().decode(text.getBytes())));
    }
}

