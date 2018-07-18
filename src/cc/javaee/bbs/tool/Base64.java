package cc.javaee.bbs.tool;

import java.io.UnsupportedEncodingException;

import sun.misc.*;

public class Base64 {
	public static void main(String[] args) {
//		String string="AAed2k://|file|%E8%92%B8%E5%8F%91%E5%A4%AA%E5%B9%B3%E6%B4%8B.HD1280%E9%AB%98%E6%B8%85%E5%9B%BD%E8%AF%AD%E4%B8%AD%E5%AD%97.mp4|1089043189|A836913EF3A0BCAD96C7EE0F8DF79BD5|h=7U7APOBPZKCH323PHYWYHNULXYOWMVK2|/ZZ";
		String string="QUFlZDJrOi8vfGZpbGV8JUU2JTg4JTk4JUU0JUJBJTg5LkhEMTI4MCVFOCVCNiU4NSVFNiVCOCU4NSVFNCVCOCVCOSVFOSVCQSVBNiVFOCVBRiVBRCVFNCVCOCVBRCVFNSVBRCU5Ny5tcDR8MjM5NDg2NjM3OHxGQkEwM0UxRkY0NTcwQzhDRTA0ODE4NDc4MDc0Nzc4RHxoPUhHRkcyVEhUTUoySkxZSzdaNE9WNzVDNTJLSUxNSko1fC9aWg==";
//		String string2=getBase64(string);
		String string2 = getFromBase64(string);
		
		System.out.println(string2);
	}
	public static String getBase64(String str) {
		byte[] b = null;
		String s = null;
		try {
			b = str.getBytes("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		if (b != null) {
			s = new BASE64Encoder().encode(b);
		}
		return s;
	}

	public static String getFromBase64(String s) {
		byte[] b = null;
		String result = null;
		if (s != null) {
			BASE64Decoder decoder = new BASE64Decoder();
			try {
				b = decoder.decodeBuffer(s);
				result = new String(b, "utf-8");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
}