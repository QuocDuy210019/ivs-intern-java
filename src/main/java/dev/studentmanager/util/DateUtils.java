package dev.studentmanager.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * DateUtils
 * 
 * This utility class provides methods for formatting and parsing dates.
 * @version 1.0 17 Dec 2024
 * @author Vo Hong Vu
 */
public class DateUtils {

    /**
     * Formats a date string from "yyyy-MM-dd" to "dd/MM/yyyy".
     *
     * @param dateStr the date string in "yyyy-MM-dd" format
     * @return the formatted date string in "dd/MM/yyyy" format, or "Invalid
     *         date" if the input is invalid
     */
    public static String formatDate(String dateStr) {
        if (dateStr == null || dateStr.trim().isEmpty()) {
            // Handle null or empty string
            return "Invalid date";
        }

        try {
            SimpleDateFormat originalFormat = new SimpleDateFormat(
                    "yyyy-MM-dd");
            SimpleDateFormat targetFormat = new SimpleDateFormat("dd/MM/yyyy");

            Date date = originalFormat.parse(dateStr); // Parse the input string
            return targetFormat.format(date); // Format the date to the desired
                                              // format
        } catch (ParseException e) {
            // Log the error if parsing fails
            e.printStackTrace();
            return "Invalid date";
        }
    }

    /**
     * Parses a date string from "dd/MM/yyyy" to "yyyy-MM-dd".
     *
     * @param dateStr the date string in "dd/MM/yyyy" format
     * @return the parsed date string in "yyyy-MM-dd" format, or null if the
     *         input is invalid
     */
    public static String parseDate(String dateStr) {
        if (dateStr == null || dateStr.trim().isEmpty()) {
            return null; // Return null if the date string is empty
        }

        try {
            SimpleDateFormat originalFormat = new SimpleDateFormat(
                    "dd/MM/yyyy");
            SimpleDateFormat targetFormat = new SimpleDateFormat("yyyy-MM-dd");

            Date date = originalFormat.parse(dateStr); // Parse the input string
            return targetFormat.format(date); // Format the date to the storage
                                              // format
        } catch (ParseException e) {
            e.printStackTrace();
            return null; // Return null if parsing fails
        }
    }
}
