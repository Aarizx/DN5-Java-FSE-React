public class NotificationService {
    private final EmailService emailService;

    public NotificationService(EmailService emailService) {
        this.emailService = emailService;
    }

    public void notifyUser(String email, String message) {
        emailService.sendEmail(email, message);
    }
}
