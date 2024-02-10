import 'package:flutter/material.dart';

class DashLine extends StatelessWidget {
  const DashLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Wrap(
//           spacing: 3,
//           children: List.generate(
//               29,
//               (index) => Expanded(
//                     child: Container(
//                         color: Color(0xFF848484), width: 8, height: 1),
//                   )),
//         ),
//       ],
//     );
//   }
// }
   return Column(
      children: [
        Wrap(
          spacing:5,
          children: List.generate(
            17,
            (index) => Expanded(
                  child: Container(
                      color: Color.fromARGB(255, 214, 214, 214), width:13, height:1),
                )),
        ),
      ],
    );
  }
}
