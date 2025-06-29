import 'package:artifitia_test/features/auth/presentation/controller/bloc/auth_bloc.dart';
import 'package:artifitia_test/core/shared/screen/bottom_nav_screen.dart';
import 'package:artifitia_test/features/onboard/presentation/screen/onboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/service_locator.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<AuthBloc>()..add(CheckAuthEvents()),
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccessState) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => BottomNavScreen(),
                ),
              );
            } else if (state is AuthFailedState) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const OnboardScreen(),
                ),
              );
            }
          },
          child: Center(
            child: Image.asset('assets/images/logo_shopywell.png')
                .animate()
                .slideX(duration: const Duration(milliseconds: 1000)),
          ),
        ),
      ),
    );
  }
}
