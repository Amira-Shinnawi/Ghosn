import 'package:flutter/material.dart';
import 'package:ghosn_app/constants.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../data/model/splash_data.dart';
import 'content_spalsh_view.dart';

class SplashDesignBody extends StatefulWidget {
  const SplashDesignBody({super.key});

  @override
  State<SplashDesignBody> createState() => _SplashDesignBodyState();
}

class _SplashDesignBodyState extends State<SplashDesignBody> {
  int selectedIndex = 0;
  PageController controller =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 1);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double blocHeight = (height / 100);
    double blocWidth = (width / 100);
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(
            horizontal: blocWidth * 5, vertical: blocHeight * 5),
        child: Column(
          children: [
            Expanded(
                child: PageView.builder(
              controller: controller,
              onPageChanged: (i) {
                setState(() {
                  selectedIndex = i;
                });
              },
              itemCount: SplashData.onBoardingItemList.length,
              itemBuilder: (context, index) {
                return ContentSplashView(
                  onBoardingItem: SplashData.onBoardingItemList[index],
                );
              },
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ...List.generate(
                      SplashData.onBoardingItemList.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                        height: 8,
                        width: selectedIndex == index ? 24 : 8,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: selectedIndex == index
                              ? kGreenColor
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    if (selectedIndex ==
                        SplashData.onBoardingItemList.length - 1) {
                      // Navigate to the next screen
                      GoRouter.of(context).push(AppRouter.kLoginOptionView);
                    } else {
                      controller.animateToPage(selectedIndex + 1,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease);
                    }
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
