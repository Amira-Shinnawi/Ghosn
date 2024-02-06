import 'package:flutter/material.dart';

class DashLine extends StatelessWidget {
  const DashLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Wrap(
          spacing: 3,
          children: List.generate(
              29,
              (index) => Expanded(
                    child: Container(
                        color: const Color(0xFF848484), width: 8, height: 1),
                  )),
        ),
      ],
    );
  }
}
