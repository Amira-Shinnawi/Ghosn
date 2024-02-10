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
          spacing:5,
          children: List.generate(
            17,
            (index) => Expanded(
                  child: Container(
                      color: const Color.fromARGB(255, 214, 214, 214), width:13, height:1),
                )),
        ),
      ],
    );
  }
}
