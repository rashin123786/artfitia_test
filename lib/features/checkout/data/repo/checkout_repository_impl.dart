import '../../domain/repo/checkout_repo.dart';
import '../datasource/checkout_remote_datasource.dart';

class CheckoutRepositoryImpl extends CheckoutRepo {
  final CheckoutRemoteDatasource dataSource;

  CheckoutRepositoryImpl(this.dataSource);

  @override
  Future<Map<String, dynamic>> createPaymentIntent(
      String amount, String currency) async {
    return await dataSource.createPaymentIntent(amount, currency);
  }
}
