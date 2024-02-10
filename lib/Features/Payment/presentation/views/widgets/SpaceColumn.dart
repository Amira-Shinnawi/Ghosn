// import 'package:flutter/material.dart';

// class SpaceColumn extends StatelessWidget {
//   final String label;
//   final String value;

//  SpaceColumn({required this.label, required this.value});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Expanded(
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Text(label),
//           ),
//         ),
//         Expanded(
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Text(value),
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:ghosn_app/core/utils/style.dart';

class SpaceColumn extends StatelessWidget {
  final String label;
  final String value;

  SpaceColumn({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: const EdgeInsets.only(top: 4),
          child: Text(label, style: Styles.textStyle18Inter,),
        ),
        Container(
         padding: const EdgeInsets.only(top: 4),
          child: Text(value, style: Styles.textStyle18Intergray,),
        ),
      ],
    );
  }
}