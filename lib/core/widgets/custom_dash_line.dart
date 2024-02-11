import 'package:flutter/material.dart';

class DashLine extends StatelessWidget {
  const DashLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 10,
          children: List.generate(
              17,
              growable: true,
              (index) => Expanded(
                    child: Container(
                        color: const Color.fromARGB(255, 214, 214, 214),
                        width: 13,
                        height: 1),
                  )),
        ),
      ],
    );
  }
}
