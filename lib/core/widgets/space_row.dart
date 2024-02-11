import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ghosn_app/core/utils/style.dart';
import 'package:ghosn_app/core/widgets/custom_dash_line.dart';

class SpaceBetweenRow extends StatelessWidget {
  final String label;
  final String value;

  const SpaceBetweenRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: Styles.textStyle18Intergray,
                maxLines: 2,
              ),
            ),
            const Spacer(),
            Expanded(
              child: Text(
                value,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle18Intergray,
              ),
            ),
          ],
        ),
        SizedBox(
          height: height * .024,
        ),
        const DashLine(),
      ],
    );
  }
}
