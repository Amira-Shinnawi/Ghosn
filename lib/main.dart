import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/utils/app_router.dart';
import 'package:ghosn_app/core/utils/functions/shared_pref_cache.dart';
import 'package:ghosn_app/translations/codegen_loader.g.dart';

import 'core/utils/functions/controller.dart';
List<CameraDescription> camerasList = [];
Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  camerasList = await availableCameras();

  await SharedPrefCache.cacheInitialization();

  userToken = await SharedPrefCache.getCacheData(key: 'token');
  tokenFacebookOrGoogle =
      await SharedPrefCache.getCacheData(key: 'accessToken');

  log("User token is : $userToken");
  log("User token Facebook Or Google is : $tokenFacebookOrGoogle");

  final savedLocale = await SharedPrefCache.getSavedLanguage();
  Locale? initialLocale = savedLocale ?? const Locale('en');

  runApp(EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      fallbackLocale: initialLocale,
      assetLoader: const CodegenLoader(),
      child: const GhosnApp()));
}

class GhosnApp extends StatelessWidget {
  const GhosnApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(main_controller());
    return MaterialApp.router(
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
  }
}
