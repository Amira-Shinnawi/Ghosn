import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/utils/app_router.dart';
import 'package:ghosn_app/core/utils/assets_data.dart';
import 'package:ghosn_app/core/utils/style.dart';
import 'package:ghosn_app/core/widgets/custom_button.dart';
import 'package:ghosn_app/translations/local_keys.g.dart';
import 'package:go_router/go_router.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double blockHeight = (height / 100);
    double blockWidth = (width / 100);
    return Container(
      height: blockHeight * 12,
      width: blockWidth * 80,
      decoration: BoxDecoration(
        border: Border.all(
          color: kGreyColor.withOpacity(.2),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: blockWidth * 1, vertical: blockHeight * .5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 2 / 2,
              child: Image.asset(
                AssetsData.imageTest2,
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'Sliver Plant',
                      style: Styles.textStyle18Inter,
                    ),
                    CustomButton(
                      height: blockHeight * 6,
                      width: blockWidth * 50,
                      onPressed: () {
                        GoRouter.of(context)
                            .push(AppRouter.kProductDetailsHome);
                      },
                      text: LocaleKeys.ShowProduct.tr(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
