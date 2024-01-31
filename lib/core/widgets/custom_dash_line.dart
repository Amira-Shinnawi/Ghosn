import 'package:flutter/material.dart';



class dash_line extends StatelessWidget {
  const dash_line({
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
                        color: Color(0xFF848484),
                        width: 8,
                        height: 1),
                  )),
        ),
      ],
    );
  }
}
