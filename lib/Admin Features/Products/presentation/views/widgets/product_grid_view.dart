import 'package:flutter/material.dart';

import 'product_plant_item.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    return GridView.builder(
        itemCount: 10,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: blockWidth * 4,
          mainAxisSpacing: blockHeight * 4,
          childAspectRatio: blockWidth * 1 / blockHeight * 1.3,
        ),
        itemBuilder: (context, index) {
          return const ProductPlantItem();
        });
  }
}
