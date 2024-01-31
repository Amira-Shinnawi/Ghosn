import 'package:ghosn_app/Features/Account/presentation/views/change_pass.dart';
import 'package:ghosn_app/Features/Account/presentation/views/login_options_view.dart';
import 'package:ghosn_app/Features/Account/presentation/views/login_page.dart';
import 'package:ghosn_app/Features/Account/presentation/views/register_page.dart';
import 'package:ghosn_app/Features/Payment/presentation/views/paymethod.dart';
import 'package:go_router/go_router.dart';

import '../../Features/splash/presentation/views/splash_view.dart';

abstract class AppRoute {
  // static const kSplashView = '/splashView';
   static const kSplashView = '/paymentpage';
  static const kLoginOptionView = '/loginOptionView';
  static const kLoginPage = '/loginPage';
  static const kRegisterPage = '/registerPage';
  static const kChangePassword='/changePassword';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) =>PaymentPage()
    ),
    GoRoute(
      path: kLoginOptionView,
      builder: (context, state) => const LoginOptionsView(),
    ),
    GoRoute(
      path: kLoginPage,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: kRegisterPage,
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: kChangePassword,
      builder: (context, state) => const ChangePassword(),
    ),
  ]);
}
