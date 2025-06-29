part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class CheckAuthEvents extends AuthEvent {}

final class SignInWithGoogleEvent extends AuthEvent {}

final class SignInWithEmailEvent extends AuthEvent {
  final String email;
  final String password;
  final bool isNewUser;

  SignInWithEmailEvent(
      {required this.email, required this.password, required this.isNewUser});
}

final class SignOutEvent extends AuthEvent {}
