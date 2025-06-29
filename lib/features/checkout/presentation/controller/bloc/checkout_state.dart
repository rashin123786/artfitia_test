part of 'checkout_bloc.dart';

@immutable
sealed class CheckoutState {}

final class CheckoutInitial extends CheckoutState {}

class PaymentProcessing extends CheckoutState {}

class PaymentSuccess extends CheckoutState {}

class PaymentFailure extends CheckoutState {
  final String message;
  PaymentFailure(this.message);
}
