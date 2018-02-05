package com.sitec.cpse.common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Staunch
 */
public class CommonUtils {

    public static Date getDate(int dd, int mm, int yyyy) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/mm/yyyy");
        try {
            String date = (dd > 9 ? dd : "0" + dd) + "/" + (mm > 9 ? mm : "0" + mm) + "/" + yyyy;
            return sdf.parse(date);
        } catch (ParseException ex) {
            throw new RuntimeException(ex);
        }
    }
}
