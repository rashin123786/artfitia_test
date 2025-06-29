import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/auth/presentation/controller/bloc/auth_bloc.dart';
import '../../../features/onboard/presentation/screen/onboard_screen.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color.fromARGB(255, 249, 249, 249),
      centerTitle: true,
      title: Image.asset('assets/images/new_logo.png', height: 40),
      leading: const Icon(Icons.notes),
      actions: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSignOutState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Signing out......"),
                duration: Duration(seconds: 3),
              ));
              Navigator.pushAndRemoveUntil<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => const OnboardScreen(),
                ),
                (route) => false,
              );
            }
          },
          child: IconButton(
            onPressed: () {
              context.read<AuthBloc>().add(SignOutEvent());
            },
            icon: const Icon(Icons.logout),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/profile.png'),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
