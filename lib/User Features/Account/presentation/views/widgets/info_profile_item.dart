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
          size: 16,
        ),
        SizedBox(
          width: width * 3,
        ),
        Expanded(
          child: Text(
            infoItem,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Styles.textStyle16Inter.copyWith(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
