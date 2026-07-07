import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;
import org.junit.jupiter.api.Test;

public class StringUtilsTest {

    @Test
    void shouldReturnTrueForPalindrome() {
        StringUtils stringUtils = new StringUtils();

        assertTrue(stringUtils.isPalindrome("nurses run"));
    }

    @Test
    void shouldReturnFalseForNonPalindrome() {
        StringUtils stringUtils = new StringUtils();

        assertFalse(stringUtils.isPalindrome("hello"));
    }

    @Test
    void shouldThrowForNullInput() {
        StringUtils stringUtils = new StringUtils();

        assertDoesNotThrow(() -> stringUtils.isPalindrome("level"));
    }
}
