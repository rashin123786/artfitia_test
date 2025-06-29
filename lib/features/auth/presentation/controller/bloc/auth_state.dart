part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthButtonLoadingState extends AuthState {}

final class AuthSuccessState extends AuthState {
  final User user;

  AuthSuccessState({required this.user});
}

final class AuthFailedState extends AuthState {}

final class AuthSignOutState extends AuthState {}
