import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/utils/style.dart';

import '../../../../../translations/local_keys.g.dart';
import '../../../data/plant_model.dart';

class PlantDetailsInfo extends StatelessWidget {
  const PlantDetailsInfo({
    super.key,
    required this.plantModel,
  });
  final Plants plantModel;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${plantModel.name}',
                  style: Styles.textStyle20Inter.copyWith(
                    color: Colors.black,
                  ),
                ),
                Text(
                  '${plantModel.category!.name} (${plantModel.soilType}) ',
                  style: Styles.textStyle20Inter.copyWith(
                    fontSize: 14,
                    color: kHintColor,
                  ),
                ),
              ],
            ),
            plantModel.quantity == 0
                ? Column(
                    children: [
                      Text(
                        '${plantModel.defaultPrice!.roundToDouble()}.LE',
                        style: Styles.textStyle20Inter.copyWith(
                          fontSize: 18,
                          color: kGreenColor,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.circle,
                            color: Colors.red,
                            size: 18,
                          ),
                          SizedBox(
                            width: blockWidth * 1,
                          ),
                          Text(
                            'Out of stock',
                            style: Styles.textStyle20Inter.copyWith(
                              fontSize: 18,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : Text(
                    '${plantModel.defaultPrice!.roundToDouble()}.LE',
                    style: Styles.textStyle20Inter.copyWith(
                      fontSize: 18,
                      color: kGreenColor,
                    ),
                  ),
          ],
        ),
        SizedBox(
          height: blockHeight * 1,
        ),
        Text(
          LocaleKeys.Details.tr(),
          style: Styles.textStyle18Inter.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "${plantModel.description}",
          style: const TextStyle(
            fontSize: 14,
          ),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        Row(
          children: [
            Text(
              LocaleKeys.moreInfo.tr(),
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            Text(
              LocaleKeys.clickHere.tr(),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: kGreenColor,
                decoration: TextDecoration.underline,
              ),
            )
          ],
        ),
      ],
    );
  }
}
