import 'package:flutter/material.dart';
import 'package:ghosn_app/core/utils/style.dart';

class SpaceColumn extends StatelessWidget {
  final String label;
  final String value;

  const SpaceColumn({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Styles.textStyle18Inter,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            value,
            style: Styles.textStyle18Intergray,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
