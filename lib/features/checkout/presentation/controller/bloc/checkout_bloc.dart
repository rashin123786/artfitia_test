import 'package:artifitia_test/features/checkout/domain/usecases/checkout_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CheckoutUsecase checkoutUsecase;
  CheckoutBloc(this.checkoutUsecase) : super(CheckoutInitial()) {
    on<MakeStripePaymentEvent>(_handlePayment);
  }
  Future<void> _handlePayment(
      MakeStripePaymentEvent event, Emitter<CheckoutState> emit) async {
    emit(PaymentProcessing());
    try {
      final paymentIntent = await checkoutUsecase.call(event.amount, 'INR');

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent['client_secret'],
          merchantDisplayName: 'Shopywell',
          googlePay: const PaymentSheetGooglePay(
            merchantCountryCode: "IN",
            currencyCode: "INR",
            testEnv: true,
          ),
        ),
      );

      await Stripe.instance.presentPaymentSheet();
      emit(PaymentSuccess());
    } catch (e) {
      emit(PaymentFailure("Payment failed or cancelled"));
    }
  }
}
