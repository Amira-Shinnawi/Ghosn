import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/core/utils/app_router.dart';
import 'package:ghosn_app/translations/local_keys.g.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/functions/shared_pref_cache.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_button.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset(
            AssetsData.logo,
          ),
          SizedBox(
            height: height * .027,
          ),
          Center(
            child: Text(
              LocaleKeys.title.tr(),
              textAlign: TextAlign.center,
              style: Styles.textStyle32Itim,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await context.setLocale(const Locale('en'));
                  await SharedPrefCache.saveLanguage(const Locale('en'));
                },
                child: const Text(
                  'English',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              ElevatedButton(
                onPressed: () async {
                  await context.setLocale(const Locale('ar'));
                  await SharedPrefCache.saveLanguage(const Locale('ar'));
                },
                child: const Text('العربية',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ],
          ),
          CustomButton(
            text: LocaleKeys.getStarted.tr(),
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kPaymentPage);
            },
          ),
          SizedBox(
            height: height * .025,
          ),
        ],
      ),
    );
  }
}
