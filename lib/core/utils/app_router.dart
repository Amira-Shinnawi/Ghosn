import 'package:ghosn_app/Features/Account/presentation/views/change_pass.dart';
import 'package:ghosn_app/Features/Account/presentation/views/login_options_view.dart';
import 'package:ghosn_app/Features/Account/presentation/views/login_page.dart';
import 'package:ghosn_app/Features/Account/presentation/views/register_page.dart';
import 'package:ghosn_app/Features/Payment/presentation/views/payment_method.dart';
import 'package:ghosn_app/Features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

import '../../Features/home/presentation/views/home.dart';
import '../../Features/home/presentation/views/product_details_home.dart';
import '../../constants.dart';

abstract class AppRouter {
  static const kSplashView = '/splashView';
  static const kPaymentPage = '/paymentpage';
  static const kLoginOptionView = '/loginOptionView';
  static const kLoginPage = '/loginPage';
  static const kRegisterPage = '/registerPage';
  static const kChangePassword = '/changePassword';
  static const kRadioListTitleWidget = '/radioListTitleWidget';
  static const kProductDetailsHome = '/product';
  static const kHomePage = '/homePage';

  static final router = GoRouter(
      initialLocation: (userToken != null || tokenFacebookOrGoogle != null)
          ? '/'
          : kSplashView,
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) =>
              (userToken != null || tokenFacebookOrGoogle != null)
                  ? const ChangePassword()
                  : const SplashView(),
        ),
        GoRoute(
          path: kSplashView,
          builder: (context, state) => const SplashView(),
        ),
        GoRoute(
          path: kPaymentPage,
          builder: (context, state) => const PaymentPage(),
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
        GoRoute(
          path: kProductDetailsHome,
          builder: (context, state) => const ProductDetailsHome(),
        ),
         GoRoute(
          path: kHomePage,
          builder: (context, state) =>  HomePage(),
        ),
      ]);
}
