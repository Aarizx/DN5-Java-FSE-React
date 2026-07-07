import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class BankAccountTest {
    private BankAccount account;

    @BeforeEach
    void setUp() {
        account = new BankAccount(100);
    }

    @Test
    void shouldDepositMoney() {
        account.deposit(50);

        assertEquals(150, account.getBalance());
    }

    @Test
    void shouldWithdrawMoney() {
        account.withdraw(30);

        assertEquals(70, account.getBalance());
    }
}
