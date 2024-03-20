import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/core/utils/assets_data.dart';
import 'package:ghosn_app/translations/local_keys.g.dart';

import '../../../../constants.dart';
import '../../../../core/utils/style.dart';
import '../../../../core/widgets/custom_appbar.dart';

class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blocHeight = (height / 100);

    return MaterialApp(
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: kInter,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
          appBar: CustomAppBar(
            titleAppBar: Text(
              LocaleKeys.internetConnection.tr(),
              style: Styles.textStyle22Inter.copyWith(
                fontSize: 20,
              ),
            ),
            backgroundColor: kGreenColor,
          ),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AspectRatio(
                    aspectRatio: 3 / 2,
                    child: Image.asset(
                      AssetsData.noInternetConnection,
                    )),
                Center(
                  child: Text(
                    LocaleKeys.noInternetConnection.tr(),
                    style: Styles.textStyle22Inter.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: blocHeight * 1,
                ),
                Text(
                  LocaleKeys.checkYourConnection.tr(),
                ),
                SizedBox(
                  height: blocHeight * 3,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kGreenColor),
                  ),
                  onPressed: () async {
                    ConnectivityResult result =
                        await Connectivity().checkConnectivity();
                    print(result.name);
                  },
                  child: Text(
                    LocaleKeys.refresh.tr(),
                    style: Styles.textStyle18Inter.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
