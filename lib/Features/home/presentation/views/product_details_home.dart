import 'package:flutter/material.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';

import '../../../../constants.dart';
import 'widgets/product_details_body.dart';

class ProductDetailsHome extends StatefulWidget {
  const ProductDetailsHome({super.key});

  @override
  State<ProductDetailsHome> createState() => _ProductDetailsHomeState();
}

class _ProductDetailsHomeState extends State<ProductDetailsHome> {
  bool favProductAdd = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: kGreenColor,
        leading: const Icon(Icons.arrow_back_ios),
        actions: [
          IconButton(
            icon: Icon(
              favProductAdd ? Icons.favorite : Icons.favorite_border,
              color: favProductAdd ? Colors.red : Colors.black,
              size: 30,
            ),
            onPressed: () {
              setState(() {
                favProductAdd = !favProductAdd;
              });
            },
          )
        ],
      ),
      body: const ProductDetailsBody(),
    );
  }
}
