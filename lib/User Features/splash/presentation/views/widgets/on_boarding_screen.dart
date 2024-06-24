import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/utils/assets_data.dart';
import 'package:ghosn_app/core/utils/style.dart';
import 'package:ghosn_app/translations/local_keys.g.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import 'design_splash_body.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double blocHeight = (height / 100);
    double blocWidth = (width / 100);
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AssetsData.onBoarding,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: blocHeight * 5,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: blocWidth * 5),
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kLoginOptionView);
                },
                child: Text(
                  LocaleKeys.SKIP.tr(),
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ),
          ),
          Positioned(
            top: blocHeight * 10,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: blocWidth * 5),
              child: Text(
                LocaleKeys.Welcome.tr(),
                style: Styles.textStyle16Itim.copyWith(
                  fontSize: 28,
                ),
              ),
            ),
          ),
          Positioned(
            top: blocHeight * 15,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: blocWidth * 5),
              child: Text(
                LocaleKeys.weregladthathatyouarehere.tr(),
                style: Styles.textStyle16Itim.copyWith(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: blocHeight * 5,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: blocWidth * 5),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SplashDesignBody(),
                    ),
                  );
                },
                child: const CircleAvatar(
                  radius: 30,
                  backgroundColor: kGreenColor,
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
