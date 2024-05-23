import 'package:flutter/material.dart';
import 'package:ghosn_app/core/utils/app_router.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/assets_data.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    return SizedBox(
      height: blockHeight * 25,
      width: double.infinity,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kProductDetailsHome);
            },
            child: Container(
              margin: EdgeInsets.only(
                left: blockWidth * 5,
                top: blockHeight * 2,
                bottom: blockHeight * 2,
              ),
              width: blockWidth * 80,
              height: blockHeight * 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(AssetsData.imageTest3),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
