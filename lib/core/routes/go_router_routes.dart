import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_portfolio/core/routes/go_routes_path.dart';
import 'package:personal_portfolio/features/authentication_feature/presentation/screens/edit_profile.dart';
import 'package:personal_portfolio/features/authentication_feature/presentation/screens/login.dart';
import 'package:personal_portfolio/features/authentication_feature/presentation/screens/verify_otp.dart';
import 'package:personal_portfolio/features/home_feature/presentation/screens/home_screen.dart';
import 'package:personal_portfolio/features/home_feature/presentation/screens/introduction_screen.dart';
import 'package:personal_portfolio/features/home_feature/presentation/screens/not_found_screen.dart';
import 'package:personal_portfolio/features/home_feature/presentation/screens/play_ground.dart';
import 'package:personal_portfolio/features/home_feature/presentation/screens/splash_screen.dart';
import 'package:personal_portfolio/features/home_feature/presentation/screens/tab_screen.dart';

final GoRouter routes = GoRouter(
  initialLocation: GoRoutesPath.home,
  errorBuilder: (final BuildContext context, final GoRouterState state) {
    return const NotFoundScreen();
  },
  routes: <RouteBase>[
    GoRoute(
      path: GoRoutesPath.splash,
      builder: (final BuildContext context, final GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: GoRoutesPath.introduction,
      builder: (final BuildContext context, final GoRouterState state) {
        return const IntroductionScreen();
      },
    ),
    GoRoute(
      path: GoRoutesPath.home,
      builder: (final BuildContext context, final GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: GoRoutesPath.login,
      builder: (final BuildContext context, final GoRouterState state) {
        return const Login();
      },
    ),
    GoRoute(
      path: GoRoutesPath.verifyOtp,
      builder: (final BuildContext context, final GoRouterState state) {
        return VerifyOtp(
          mobileNumber: state.extra as String,
        );
      },
    ),
    GoRoute(
      path: GoRoutesPath.tabScreen,
      builder: (final BuildContext context, final GoRouterState state) {
        return const TabScreen();
      },
    ),
    GoRoute(
      path: GoRoutesPath.editProfile,
      builder: (final BuildContext context, final GoRouterState state) {
        return const EditProfile();
      },
    ),
    GoRoute(
      path: GoRoutesPath.playGround,
      builder: (final BuildContext context, final GoRouterState state) {
        return const PlayGround();
      },
    ),
  ],
);
