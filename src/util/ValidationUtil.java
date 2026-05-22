package util;

import java.util.regex.Pattern;

public final class ValidationUtil {

    private static final Pattern NAME_PATTERN = Pattern.compile("[A-Za-z][A-Za-z\\s.'-]{0,49}");

    private ValidationUtil() {
    }

    public static int parseAccountNo(String value) {
        if (value == null || value.trim().isEmpty()) {
            throw new IllegalArgumentException("Account number is required.");
        }

        try {
            int accNo = Integer.parseInt(value.trim());
            requirePositiveAccountNo(accNo);
            return accNo;
        } catch (NumberFormatException ex) {
            throw new IllegalArgumentException("Account number must be numeric.");
        }
    }

    public static void requirePositiveAccountNo(int accNo) {
        if (accNo <= 0) {
            throw new IllegalArgumentException("Account number must be greater than zero.");
        }
    }

    public static String requireValidName(String value) {
        if (value == null) {
            throw new IllegalArgumentException("Name is required.");
        }

        String normalized = value.trim().replaceAll("\\s+", " ");
        if (!NAME_PATTERN.matcher(normalized).matches()) {
            throw new IllegalArgumentException("Name must contain only letters, spaces, apostrophes, hyphens, or dots.");
        }

        return normalized;
    }

    public static double parseAmount(String value) {
        if (value == null || value.trim().isEmpty()) {
            throw new IllegalArgumentException("Amount is required.");
        }

        try {
            double amount = Double.parseDouble(value.trim());
            requirePositiveAmount(amount);
            return amount;
        } catch (NumberFormatException ex) {
            throw new IllegalArgumentException("Amount must be numeric.");
        }
    }

    public static void requirePositiveAmount(double amount) {
        if (amount <= 0) {
            throw new IllegalArgumentException("Amount must be greater than zero.");
        }
    }
}