import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.when;

public class OrderServiceTest {

    @Test
    void shouldPlaceOrderWhenPaymentSucceeds() {
        PaymentGateway paymentGateway = Mockito.mock(PaymentGateway.class);
        when(paymentGateway.charge(100.0)).thenReturn(true);
        OrderService orderService = new OrderService(paymentGateway);

        boolean result = orderService.placeOrder(100.0);

        assertTrue(result);
    }
}
