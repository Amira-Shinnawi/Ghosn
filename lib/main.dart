import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/utils/app_router.dart';
import 'package:ghosn_app/core/utils/functions/shared_pref_cache.dart';
import 'package:ghosn_app/translations/codegen_loader.g.dart';

import 'User Features/splash/presentation/views/no_internet_connection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await SharedPrefCache.cacheInitialization();

  userToken = await SharedPrefCache.getCacheData(key: 'token');
  tokenFacebookOrGoogle =
      await SharedPrefCache.getCacheData(key: 'accessToken');

  log("User token is : $userToken");
  log("User token Facebook Or Google is : $tokenFacebookOrGoogle");

  final savedLocale = await SharedPrefCache.getSavedLanguage();
  Locale? initialLocale = savedLocale ?? const Locale('en');

  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      fallbackLocale: initialLocale,
      assetLoader: const CodegenLoader(),
      child: DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const GhosnApp(),
      ),
    ),
  );
}

class GhosnApp extends StatefulWidget {
  const GhosnApp({super.key});

  @override
  State<GhosnApp> createState() => _GhosnAppState();
}

class _GhosnAppState extends State<GhosnApp> {
  void initState() {
    super.initState();
    checkConnectivity();
  }

  void checkConnectivity() async {
    var result = await Connectivity().checkConnectivity();
    print(result.name);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, snapshot) {
          return snapshot.data == ConnectivityResult.none
              ? const NoInternetConnection()
              : MaterialApp.router(
                  title: 'Ghosn',
                  routerConfig: AppRouter.router,
                  debugShowCheckedModeBanner: false,
                  supportedLocales: context.supportedLocales,
                  localizationsDelegates: context.localizationDelegates,
                  locale: context.locale,
                  theme: ThemeData(
                    brightness: Brightness.light,
                    fontFamily: kInter,
                    appBarTheme: const AppBarTheme(
                      color: Colors.white,
                    ),
                    scaffoldBackgroundColor: Colors.white,
                  ),
                );
        });
  }
}
