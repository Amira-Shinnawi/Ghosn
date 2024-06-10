import 'package:flutter/material.dart';
import 'package:ghosn_app/User%20Features/home/data/pot_model.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/utils/style.dart';

class PotDetailsInfo extends StatelessWidget {
  const PotDetailsInfo({
    super.key,
    required this.potModel,
  });
  final PotProducts potModel;

  @override
  Widget build(BuildContext context) {
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
                  '${potModel.name}',
                  style: Styles.textStyle20Inter.copyWith(
                    color: Colors.black,
                  ),
                ),
                Text(
                  '${potModel.material}',
                  style: Styles.textStyle20Inter.copyWith(
                    fontSize: 14,
                    color: kHintColor,
                  ),
                ),
              ],
            ),
            Text(
              '${potModel.colors}',
              style: Styles.textStyle20Inter.copyWith(
                fontSize: 18,
                color: kGreenColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
