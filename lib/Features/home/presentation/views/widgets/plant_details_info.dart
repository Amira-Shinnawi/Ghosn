import 'package:flutter/material.dart';
import 'package:ghosn_app/core/utils/style.dart';

class PlantDetailsInfo extends StatelessWidget {
  const PlantDetailsInfo({
    super.key,
    required this.colorBowlListView,
  });

  final Widget? colorBowlListView;

  @override
  Widget build(BuildContext context) {
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
                    fontSize: 22,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'Bowl color',
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
        Text(
          'Details',
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
        const Row(
          children: [
            Text(
              'For more information,',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              'click here',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          'Other photos',
          style: Styles.textStyle20Inter.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
