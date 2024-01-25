import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/utils/app_router.dart';
import 'package:intl/intl.dart';

import 'generated/l10n.dart';

void main() {
  runApp(const GhosnApp());
}

class GhosnApp extends StatefulWidget {
  const GhosnApp({super.key});

  @override
  State<GhosnApp> createState() => _GhosnAppState();
}

class _GhosnAppState extends State<GhosnApp> {
  Locale _currentLocale = Locale('ar');

  void _toggleLanguage() {
    setState(() {
      _currentLocale = isArabic() ? Locale('en') : Locale('ar');
    });
  }

  bool isArabic() {
    return Intl.getCurrentLocale() == 'ar';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routerConfig: AppRoute.router,
        debugShowCheckedModeBanner: false,
        locale: _currentLocale,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: ThemeData(
          brightness: Brightness.light,
          fontFamily: isArabic() ? kInter : kArefRuqaa,
        ),
        builder: (context, router) {
          return Scaffold(
            body: GestureDetector(
              onDoubleTap: _toggleLanguage,
              child: router!,
            ),
          );
        });
  }
}
