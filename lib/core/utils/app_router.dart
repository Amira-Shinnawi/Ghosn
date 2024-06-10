import 'package:ghosn_app/Admin%20Features/Article/presentation/views/latest_article_home.dart';
import 'package:ghosn_app/Admin%20Features/Community/presentation/views/community_home.dart';
import 'package:ghosn_app/Admin%20Features/Products/presentation/views/create_category.dart';
import 'package:ghosn_app/Admin%20Features/Products/presentation/views/create_plant.dart';
import 'package:ghosn_app/Admin%20Features/Transaction/presentation/views/transaction_view.dart';
import 'package:ghosn_app/User%20Features/Account/presentation/views/change_pass.dart';
import 'package:ghosn_app/User%20Features/Account/presentation/views/edit_profile.dart';
import 'package:ghosn_app/User%20Features/Account/presentation/views/login_options_view.dart';
import 'package:ghosn_app/User%20Features/Account/presentation/views/login_page.dart';
import 'package:ghosn_app/User%20Features/Account/presentation/views/register_page.dart';
import 'package:ghosn_app/User%20Features/Article/presentation/views/article_home.dart';
import 'package:ghosn_app/User%20Features/Cart&Fav&Notify/presentation/views/chart.dart';
import 'package:ghosn_app/User%20Features/Payment/presentation/views/payment_method.dart';
import 'package:ghosn_app/User%20Features/detection/presentation/views/tips_page.dart';
import 'package:ghosn_app/User%20Features/home/presentation/views/bottom_bar.dart';
import 'package:ghosn_app/User%20Features/home/presentation/views/home_view.dart';
import 'package:ghosn_app/User%20Features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

import '../../Admin Features/Community/presentation/views/create_post_view.dart';
import '../../Admin Features/Products/presentation/views/create_pot.dart';
import '../../Admin Features/Products/presentation/views/product_view.dart';
import '../../Admin Features/Shipments/presentation/views/shipment_view.dart';
import '../../User Features/Account/presentation/views/profile_view.dart';
import '../../User Features/Cart&Fav&Notify/presentation/views/favorite_home.dart';
import '../../User Features/Cart&Fav&Notify/presentation/views/notification_home.dart';
import '../../constants.dart';

abstract class AppRouter {
  // User //
  static const kSplashView = '/splashView';
  static const kPaymentPage = '/paymentpage';
  static const kLoginOptionView = '/loginOptionView';
  static const kLoginPage = '/loginPage';
  static const kRegisterPage = '/registerPage';
  static const kChangePassword = '/changePassword';
  static const kRadioListTitleWidget = '/radioListTitleWidget';
  static const kProductDetailsHome = '/product';
  static const kHomeView = '/homeView';
  static const kChart = '/chartPage';
  static const kFavorite = '/favorite';
  static const kMainHome = '/main';
  static const kNotification = '/notification';
  static const kProfile = '/profile';
  static const kEditProfile = '/editProfile';
  static const kArticleHome = '/articleHome';
  static const kdetectcamerapage = '/Camera';
  static const ktips = '/tips';
  static const kdisplyimg = '/DisplayPictureScreen';
  static const kdetectresult = '/DetectResult';

  // Admin //
  static const kLatestArticle = '/latestArticle';
  static const kCommunity = '/community';
  static const kCreatePost = '/createPost';
  static const kAdminProduct = '/adminProduct';
  static const kCreatePlant = '/createPlant';
  static const kCreatePot = '/createPot';
  static const kCreateCategory = '/createCategory';

  static const kShipment = '/shipment';
  static const kTransaction = '/transaction';
  static const kFriendProfile = '/FriendProfile';

  static final router = GoRouter(
      initialLocation: (userToken != null || tokenFacebookOrGoogle != null)
          ? '/'
          : kSplashView,
      routes: [
        // User //
        GoRoute(
          path: '/',
          builder: (context, state) =>
              (userToken != null || tokenFacebookOrGoogle != null)
                  ? const BottomBar()
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
        // GoRoute(
        //   path: kProductDetailsHome,
        //   builder: (context, state) => const ProductDetailsHome(),
        // ),
        GoRoute(
          path: kHomeView,
          builder: (context, state) => const HomeView(),
        ),
        GoRoute(
          path: kChart,
          builder: (context, state) => const CartHome(),
        ),
        GoRoute(
          path: kFavorite,
          builder: (context, state) => const FavoriteHome(),
        ),
        GoRoute(
          path: kNotification,
          builder: (context, state) => const NotificationHome(),
        ),
        GoRoute(
          path: kProfile,
          builder: (context, state) => const ProfileView(),
        ),
        GoRoute(
          path: kEditProfile,
          builder: (context, state) => const EditProfile(),
        ),
        GoRoute(
          path: kArticleHome,
          builder: (context, state) => const ArticleHome(),
        ),
        // Admin//
        GoRoute(
          path: kLatestArticle,
          builder: (context, state) => const LatestArticleHome(),
        ),
        GoRoute(
          path: kCommunity,
          builder: (context, state) => const CommunityHome(),
        ),
        GoRoute(
          path: kCreatePost,
          builder: (context, state) => const CreatePostView(),
        ),
        GoRoute(
          path: kAdminProduct,
          builder: (context, state) => const ProductAdminView(),
        ),
        GoRoute(
          path: kCreatePlant,
          builder: (context, state) => const CreatePlantView(),
        ),
        GoRoute(
          path: kCreatePot,
          builder: (context, state) => const CreatePotView(),
        ),
        GoRoute(
          path: kCreateCategory,
          builder: (context, state) => const CreateCategoryView(),
        ),
        GoRoute(
          path: kShipment,
          builder: (context, state) => const ShipmentView(),
        ),
        GoRoute(
          path: kTransaction,
          builder: (context, state) => const TransactionView(),
        ),
        GoRoute(
          path: ktips,
          builder: (context, state) => const Tips(),
        ),
      ]);
}
