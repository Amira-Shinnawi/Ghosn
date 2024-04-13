import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/translations/local_keys.g.dart';

import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/functions/shared_pref_cache.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../home/presentation/views/bottom_bar.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .020),
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
              // GoRouter.of(context).push(AppRouter.kTransaction);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const BottomBar()));
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
