package el;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MyUtil {
	
	private static SimpleDateFormat formatter = new SimpleDateFormat("yyy-MM-dd");
	
	
	public static String format(Date date) {
		return formatter.format(date);
	}

}

