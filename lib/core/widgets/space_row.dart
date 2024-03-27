import 'package:flutter/material.dart';
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

    double blocHeight = (height / 100);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: blocHeight * 2),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                label,
                style: Styles.textStyle18Intergray,
                maxLines: 2,
              ),
              const Spacer(),
              Expanded(
                child: Text(
                  value,
                  textAlign: TextAlign.end,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle18Intergray,
                ),
              ),
            ],
          ),
          SizedBox(
            height: blocHeight * 2,
          ),
          const DashedLine(
            color: Color.fromARGB(255, 214, 214, 214),
          ),
        ],
      ),
    );
  }
}
