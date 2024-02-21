import 'package:flutter/material.dart';
import 'package:ghosn_app/core/utils/app_router.dart';
import 'package:ghosn_app/core/utils/style.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/custom_button.dart';

class CheckOutBody extends StatelessWidget {
  const CheckOutBody({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: CustomAppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'The payment was completed successfully',
                style: Styles.textStyle20Inter,
                textAlign: TextAlign.center,
              ),
              Image.asset(
                'assets/images/image 61.png',
                width: 342,
                height: 320,
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  ' Your order has been placed and will be delivered to your specified address within 3 days.',
                  textAlign: TextAlign.center,
                  style: Styles.textStyle18Inter,
                ),
              ),
              SizedBox(
                height: height * .06,
              ),
              CustomButton(
                text: "OK ",
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
