import 'package:artifitia_test/core/service_locator.dart';
import 'package:artifitia_test/core/theme/app_theme.dart';
import 'package:artifitia_test/features/auth/presentation/controller/bloc/auth_bloc.dart';
import 'package:artifitia_test/features/auth/presentation/screen/splash_screen.dart';
import 'package:artifitia_test/features/checkout/presentation/controller/bloc/checkout_bloc.dart';
import 'package:artifitia_test/features/home/presentation/controller/bloc/home_bloc.dart';
import 'package:artifitia_test/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await setupLocator();
  await dotenv.load(fileName: "assets/config/.env");
  Stripe.publishableKey = dotenv.env['publishableKey'] ?? '';

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AuthBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<HomeBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<CheckoutBloc>(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: SplashScreen(),
      ),
    );
  }
}
