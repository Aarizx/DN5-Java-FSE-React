import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import static org.mockito.Mockito.verify;

public class NotificationServiceTest {

    @Test
    void shouldSendEmailWhenNotifyingUser() {
        EmailService emailService = Mockito.mock(EmailService.class);
        NotificationService notificationService = new NotificationService(emailService);

        notificationService.notifyUser("user@example.com", "Hello");

        verify(emailService).sendEmail("user@example.com", "Hello");
    }
}
