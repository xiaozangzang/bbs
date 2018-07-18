package cc.javaee.bbs.tool;

import java.io.IOException;
import java.io.InputStream;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

public class ConfigPropertiesUtil {
	private static Properties properties;
	static{
		InputStream in = ConfigPropertiesUtil.class.getClassLoader()  
                .getResourceAsStream("/config/config.properties");
		try {
			properties=  new  Properties(); 
			properties.load(in);
		} catch (InvalidPropertiesFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static String getUpalodDir(){
		return properties.getProperty("upload.dir");
	}
	
	public static void main(String[] args) {
		System.out.println(getUpalodDir());;
	}
}
