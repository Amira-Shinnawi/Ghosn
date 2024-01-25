import 'package:flutter/material.dart';
import 'package:ghosn_app/core/utils/app_router.dart';
import 'package:ghosn_app/generated/l10n.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_button.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Image.asset(
          AssetsData.logo,
        ),
        const SizedBox(
          height: 27,
        ),
         Center(
          child: Text(
            S.of(context).title,
            style: Styles.textStyle32Itim,
          ),
        ),
        const Spacer(),
        CustomButton(
          text: S.of(context).getStarted,
          onPressed: () {
            GoRouter.of(context).push(AppRoute.kLoginOptionView);
          },
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
