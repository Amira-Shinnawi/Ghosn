import 'package:ghosn_app/Features/Account/presentation/views/login_options_view.dart';
import 'package:ghosn_app/Features/Account/presentation/views/login_page.dart';
import 'package:go_router/go_router.dart';

import '../../Features/splash/presentation/views/splash_view.dart';

abstract class AppRoute {
  static const kSplashView = '/splashView';
  static const kLoginOptionView = '/loginOptionView';
  static const kLoginPage = '/loginPage';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kLoginOptionView,
      builder: (context, state) => const LoginOptionsView(),
    ),
    GoRoute(
      path: kLoginPage,
      builder: (context, state) => const LoginPage(),
    ),
  ]);
}
