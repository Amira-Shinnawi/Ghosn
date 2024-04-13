import 'package:flutter/material.dart';
import 'package:ghosn_app/constants.dart';

import 'recent_shipment_table_body.dart';

class ShipmentViewBody extends StatelessWidget {
  const ShipmentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: blockWidth * 4, vertical: blockHeight * 2),
      child: Container(
        height: blockHeight * 100,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: kGreenColor,
            width: 2,
          ),
        ),
        child: const RecentShipmentTableBody(),
      ),
    );
  }
}
