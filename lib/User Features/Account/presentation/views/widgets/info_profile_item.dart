import 'package:flutter/material.dart';

import '../../../../../core/utils/style.dart';

class InfoProfileItem extends StatelessWidget {
  const InfoProfileItem({
    super.key,
    required this.icon,
    required this.infoItem,
    required this.width,
  });

  final IconData icon;
  final String infoItem;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        SizedBox(
          width: width * 3,
        ),
        Text(
          infoItem,
          style: Styles.textStyle22Inter.copyWith(
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
