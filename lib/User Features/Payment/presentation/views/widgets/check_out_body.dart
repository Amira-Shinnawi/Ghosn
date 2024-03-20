import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/core/utils/app_router.dart';
import 'package:ghosn_app/core/utils/style.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../../translations/local_keys.g.dart';

class CheckOutBody extends StatelessWidget {
  const CheckOutBody({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    double blocHeight = (height / 100);
    double blocWidth = (width / 100);
    return Scaffold(
        appBar: CustomAppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: blocHeight * 6, horizontal: blocWidth * 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.paymentsuccess.tr(),
                style: Styles.textStyle20Inter,
                textAlign: TextAlign.center,
              ),
              Image.asset(
                'assets/images/image 61.png',
                width: 342,
                height: 320,
              ),
              SizedBox(height: blocHeight * 2),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  LocaleKeys.finishorder.tr(),
                  textAlign: TextAlign.center,
                  style: Styles.textStyle18Inter,
                ),
              ),
              SizedBox(
                height: blocHeight * 6,
              ),
              CustomButton(
                text: LocaleKeys.ok.tr(),
                width: 183,
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kSplashView);
                },
              )
            ],
          ),
        ));
  }
}
