import 'package:artifitia_test/features/auth/domain/usecases/auth_usecases.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUsecases authUsecases;
  AuthBloc(this.authUsecases) : super(AuthInitial()) {
    on<CheckAuthEvents>(_checAuthState);
    on<SignInWithGoogleEvent>(_sigInWithGoogle);
    on<SignInWithEmailEvent>(_sigInWithEmail);
    on<SignOutEvent>(_sigInOut);
  }

  Future _checAuthState(CheckAuthEvents event, Emitter<AuthState> emit) async {
    final user = FirebaseAuth.instance.currentUser;
    await Future.delayed(Duration(seconds: 2));
    if (user != null) {
      emit(AuthSuccessState(user: user));
    } else {
      emit(AuthFailedState());
    }
  }

  Future _sigInWithGoogle(
      SignInWithGoogleEvent event, Emitter<AuthState> emit) async {
    try {
      final user = await authUsecases.sigInWithGoogle();
      if (user != null) {
        emit(AuthSuccessState(user: user));
      } else {
        emit(AuthFailedState());
      }
    } catch (e) {
      emit(AuthFailedState());
    }
  }

  Future _sigInWithEmail(
      SignInWithEmailEvent event, Emitter<AuthState> emit) async {
    emit(AuthButtonLoadingState());

    try {
      final user = await authUsecases.signInWithEmail(
          event.email, event.password, event.isNewUser);
      if (user != null) {
        emit(AuthSuccessState(user: user));
      } else {
        emit(AuthFailedState());
      }
    } catch (e) {
      emit(AuthFailedState());
    }
  }

  Future _sigInOut(SignOutEvent event, Emitter<AuthState> emit) async {
    emit(AuthButtonLoadingState());

    try {
      await authUsecases.signOut();
      emit(AuthSignOutState());
    } catch (e) {
      emit(AuthFailedState());
    }
  }
}
