public class StringUtils {
    public boolean isPalindrome(String text) {
        if (text == null) {
            return false;
        }
        String normalized = text.replace(" ", "").toLowerCase();
        return normalized.equals(new StringBuilder(normalized).reverse().toString());
    }
}
