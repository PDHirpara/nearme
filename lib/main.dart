import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nearme/SplashScreen.dart';
import 'package:nearme/src/model/bottom_navigation.dart';
import 'package:nearme/src/views/add_places.dart';
import 'package:nearme/src/views/customer_support.dart';
import 'package:nearme/src/views/demo.dart';
import 'package:nearme/src/views/favourite_places.dart';
import 'package:nearme/src/views/forgot_password.dart';
import 'package:nearme/src/views/home_screen.dart';
import 'package:nearme/src/views/intro_screen.dart';
import 'package:nearme/src/views/login_screen.dart';
import 'package:nearme/src/views/privacy_policy.dart';
import 'package:nearme/src/views/profile_page.dart';
import 'package:nearme/src/views/setting_screen.dart';
import 'package:nearme/src/views/signup_screen.dart';
import 'package:nearme/src/views/splach_screen.dart';
import 'package:nearme/src/views/terms_conditions.dart';
import 'package:nearme/src/views/trip_place.dart';

import 'src/views/like.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ProviderScope(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        routes: {
          '/': (ctx) => const SplashScreen(),
          'otp': (ctx) => const VerificationCode(),
          // 'like': (ctx) => const FavouriteScreen(),
          'like': (ctx) => const Like(),
          'bottom': (ctx) => const BottomNavigation(),
          'trip': (ctx) => const SavedScreen(),
          'customer': (ctx) => const CustomerSupport(),
          'terms': (ctx) => const TermsConditions(),
          'privacy': (ctx) => const PrivacyPolicy(),
          'profile': (ctx) => const ProfileScreen(),
          'home': (ctx) => const HomeScreen(),
          'intro': (ctx) => const IntroScreen(),
          'login': (ctx) => const LoginScreen(),
          'signup': (ctx) => const SignupScreen(),
          'forgotpassword': (ctx) => const ForgotPasswordScreen(),
          'setting': (ctx) => const SettingScreen(),
          'add': (ctx) => const AddPlaceScreen(),
        },
      ),
    ),
  );
}

final theme = ThemeData().copyWith(
  scaffoldBackgroundColor: colorScheme.background,
  colorScheme: colorScheme,
  textTheme: GoogleFonts.interTextTheme().copyWith(
    titleSmall: GoogleFonts.inter(
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.inter(
      fontWeight: FontWeight.bold,
    ),
    titleLarge: GoogleFonts.inter(
      fontWeight: FontWeight.bold,
    ),
  ),
);
final colorScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: const Color.fromRGBO(54, 122, 255, 1),
  background: const Color.fromRGBO(255, 255, 255, 1),
);

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
