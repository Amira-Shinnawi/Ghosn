import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/utils/style.dart';

import '../../../../../translations/local_keys.g.dart';

class PlantDetailsInfo extends StatelessWidget {
  const PlantDetailsInfo({
    super.key,
    required this.colorBowlListView,
  });

  final Widget? colorBowlListView;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Silver Plant',
                  style: Styles.textStyle22Inter.copyWith(
                    color: Colors.black,
                  ),
                ),
                Text(
                  '150 EGP',
                  style: Styles.textStyle20Inter.copyWith(
                    fontSize: 20,
                    color: kGreenColor,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  LocaleKeys.BowlColor.tr(),
                  style: Styles.textStyle20Inter.copyWith(
                    fontSize: 22,
                  ),
                ),
                Container(
                  child: colorBowlListView,
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: blockHeight * 1,
        ),
        Text(
          LocaleKeys.Details.tr(),
          style: Styles.textStyle20Inter.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          "This plant has long, broad leaves with dark green lines on the edges.This plant has long, broad leaves with dark green lines on the edgesThis plant has long, broad leaves with dark green lines on the edges",
          style: TextStyle(
            fontSize: 18,
          ),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        Row(
          children: [
            Text(
              LocaleKeys.moreInfo.tr(),
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              LocaleKeys.clickHere.tr(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            )
          ],
        ),
        SizedBox(
          height: blockHeight * 1.5,
        ),
        Text(
          LocaleKeys.OtherPhotos.tr(),
          style: Styles.textStyle20Inter.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
