import 'package:flutter/material.dart';
import 'package:ghosn_app/Features/splash/presentation/views/widgets/logo_view.dart';
import 'package:ghosn_app/core/utils/app_router.dart';
import 'package:ghosn_app/core/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        const Expanded(child: LogoView()),
        const Spacer(),
        CustomButton(
          text: 'Get Started',
          onPressed: () {
            GoRouter.of(context).push(AppRoute.kLoginOptionView);
          },
          childIcon:const Icon(Icons.arrow_forward_ios_rounded),
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
