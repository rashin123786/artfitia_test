import 'package:artifitia_test/core/theme/app_theme.dart';
import 'package:artifitia_test/features/auth/presentation/controller/auth_controller.dart';
import 'package:artifitia_test/features/auth/presentation/controller/bloc/auth_bloc.dart';
import 'package:artifitia_test/features/auth/presentation/screen/sign_up_screen.dart';
import 'package:artifitia_test/features/auth/presentation/widgets/social_media_login_widget.dart';
import 'package:artifitia_test/features/onboard/presentation/screen/get_started_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../widgets/auth_textfield_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final authController = Get.put(AuthController());
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  Text(
                    "Welcome\nBack!",
                    style: GoogleFonts.montserrat(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 40),
                  AuthTexFormFeildWidget(
                    controller: _emailController,
                    hintext: 'Username or Email',
                    obsecureText: false,
                    prefixIcon: Icons.person,
                    suffixIcon: SizedBox(),
                    validator: (p0) {
                      if (p0 == null) {
                        return 'Enter Username or Email';
                      } else {
                        return null;
                      }
                    },
                  ),

                  const SizedBox(height: 20),

                  Obx(
                    () => AuthTexFormFeildWidget(
                      controller: _passwordController,
                      hintext: 'Password',
                      obsecureText: authController.isObsecure.value,
                      prefixIcon: Icons.lock,
                      suffixIcon: IconButton(
                          onPressed: () {
                            authController.isObsecure.value =
                                !authController.isObsecure.value;
                          },
                          icon: Icon(authController.isObsecure.value
                              ? Icons.visibility_off
                              : Icons.visibility)),
                      validator: (p0) {
                        if (p0 == null || p0.length < 6) {
                          return 'Enter Password more than 6 digits';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  /// Login Button
                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is AuthSuccessState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                "Login successful! Welcome, ${state.user.displayName ?? 'User'}"),
                            backgroundColor: Colors.green,
                          ),
                        );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GetStartedScreen(),
                            ));
                      }
                    },
                    builder: (context, state) {
                      return SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: state is AuthButtonLoadingState
                              ? () {}
                              : () async {
                                  if (_formkey.currentState!.validate()) {
                                    context.read<AuthBloc>().add(
                                        SignInWithEmailEvent(
                                            email: _emailController.text.trim(),
                                            password:
                                                _passwordController.text.trim(),
                                            isNewUser: false));
                                  }
                                },
                          child: Text(
                            state is AuthButtonLoadingState
                                ? "Loading.."
                                : "Login",
                            style: GoogleFonts.montserrat(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 24),

                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "- OR Continue with -",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BlocListener<AuthBloc, AuthState>(
                        listener: (context, state) {
                          if (state is AuthSuccessState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    "Login successful! Welcome, ${state.user.displayName ?? 'User'}"),
                                backgroundColor: Colors.green,
                              ),
                            );
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GetStartedScreen(),
                                ));
                          }
                        },
                        child: SocialMediaLoginWidget(
                          imageUrl: 'assets/images/google_icon.svg',
                          onTap: () {
                            context
                                .read<AuthBloc>()
                                .add(SignInWithGoogleEvent());
                          },
                        ),
                      ),
                      SocialMediaLoginWidget(
                        imageUrl: 'assets/images/apple_icon.svg',
                      ),
                      SocialMediaLoginWidget(
                        imageUrl: 'assets/images/fb_icon.svg',
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                            text: 'Create An Account ',
                            style: GoogleFonts.montserrat(
                                color: const Color.fromARGB(255, 49, 49, 49)),
                            children: [
                              TextSpan(
                                  text: 'Sign Up',
                                  style: GoogleFonts.montserrat(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SignUpScreen(),
                                          ));
                                    })
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
