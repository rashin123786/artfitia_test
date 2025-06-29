import 'package:artifitia_test/features/checkout/domain/repo/checkout_repo.dart';

class CheckoutUsecase {
  final CheckoutRepo repository;

  CheckoutUsecase(this.repository);

  Future<Map<String, dynamic>> call(String amount, String currency) async {
    return await repository.createPaymentIntent(amount, currency);
  }
}
