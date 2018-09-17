package com.exp;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.servlet.http.HttpServlet;

/**
 *
 * @author ashim
 */
public class HashPassword extends HttpServlet{
    public static final String SALT_TEXT = "tnp salt";
    
    public static String generateHash(String input){
        String saltedPass = SALT_TEXT + input;
        String hashedPass = generateHashPassword(saltedPass);
        return hashedPass;
    }
    
    public static String generateHashPassword(String input) {
		StringBuilder hash = new StringBuilder();

		try {
			MessageDigest sha = MessageDigest.getInstance("SHA-1");
			byte[] hashedBytes = sha.digest(input.getBytes());
			char[] digits = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
					'a', 'b', 'c', 'd', 'e', 'f' };
			for (int idx = 0; idx < hashedBytes.length; ++idx) {
				byte b = hashedBytes[idx];
				hash.append(digits[(b & 0xf0) >> 4]);
				hash.append(digits[b & 0x0f]);
			}
		} catch (NoSuchAlgorithmException e) {
			// handle error here.
		}

		return hash.toString();
    } 
    
    
}
