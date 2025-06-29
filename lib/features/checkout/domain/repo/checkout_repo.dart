abstract class CheckoutRepo {
  Future<Map<String, dynamic>> createPaymentIntent(
      String amount, String currency);
}
