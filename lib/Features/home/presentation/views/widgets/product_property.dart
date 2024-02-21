import 'package:flutter/material.dart';
import 'package:ghosn_app/core/utils/style.dart';

class ProductProperty extends StatelessWidget {
  const ProductProperty({
    super.key,
    required this.propertyName,
    required this.propertyValue,
  });
  final String propertyName, propertyValue;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * .01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            propertyName,
            style: Styles.textStyle22Inter.copyWith(
              fontSize: 18,
            ),
          ),
          Text(
            propertyValue,
            style: Styles.textStyle22Inter.copyWith(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
