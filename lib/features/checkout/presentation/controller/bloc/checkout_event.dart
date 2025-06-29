part of 'checkout_bloc.dart';

@immutable
sealed class CheckoutEvent {}

class MakeStripePaymentEvent extends CheckoutEvent {
  final String amount;
  final String currency;

  MakeStripePaymentEvent({required this.amount, required this.currency});
}
