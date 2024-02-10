
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ghosn_app/core/utils/style.dart';
import 'package:ghosn_app/core/widgets/custom_dash_line.dart';

class SpaceBetweenRow extends StatelessWidget {
  final String label;
  final String value;

 const SpaceBetweenRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 27),
                child: Text(label, style: Styles.textStyle18Intergray,),
              ),
            ),
         
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(value,style: Styles.textStyle18Intergray),
              ),
            ),
          ],
        ),
        Container(
          child: const DashLine(),
        )
      ],
    );
  }
}

