import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/assets_data.dart';

class ProductPlantItem extends StatelessWidget {
  const ProductPlantItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    return Column(
      children: [
        Container(
          width: blockWidth * 25,
          height: blockHeight * 15,
          decoration: BoxDecoration(
            color: kHintColor.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: blockWidth * 2, vertical: blockHeight * 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Icon(
                  FontAwesomeIcons.ellipsis,
                  size: 15,
                ),
                Expanded(
                  child: AspectRatio(
                      aspectRatio: 3 / 2,
                      child: Image.asset(AssetsData.loginOption)),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: blockHeight * 1,
        ),
        Text(
          'Natural aloe vera',
          style: Theme.of(context).textTheme.bodySmall,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: blockHeight * .5,
        ),
        Text(
          '310 E.P',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: kHintColor,
              ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
