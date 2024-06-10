import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_router.dart';
import '../data/model/splash_model.dart';

class ContentSplashView extends StatelessWidget {
  const ContentSplashView({
    super.key,
    required this.onBoardingItem,
  });
  final OnBoardingItemModel onBoardingItem;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double blocHeight = (height / 100);
    double blocWidth = (width / 100);
    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kLoginOptionView);
            },
            child: Text(
              'SKIP',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: kGreenColor,
                  ),
            ),
          ),
        ),
        SizedBox(
          height: blocHeight * 1,
        ),
        Text(
          onBoardingItem.title,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.w700,
                fontFamily: kArefRuqaa,
              ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: blocHeight * 1,
        ),
        Text(
          onBoardingItem.subTitle,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: kArefRuqaa,
              ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: blocHeight * 5,
        ),
        const Spacer(),
        Lottie.asset(
          onBoardingItem.image,
        ),
        const Spacer(),
      ],
    );
  }
}
