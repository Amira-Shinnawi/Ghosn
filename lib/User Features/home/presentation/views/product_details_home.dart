import 'package:flutter/material.dart';
import 'package:ghosn_app/core/utils/app_router.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';
import 'package:go_router/go_router.dart';

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
      backgroundColor: kGreenColor,
      appBar: CustomAppBar(
        backgroundColor: kGreenColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              favProductAdd ? Icons.favorite : Icons.favorite_border,
              color: favProductAdd ? Colors.red : Colors.black,
              size: 25,
            ),
            onPressed: () {
              setState(() {
                favProductAdd = !favProductAdd;
              });
              GoRouter.of(context).push(AppRouter.kFavorite);
            },
          ),
        ],
      ),
      body: const SafeArea(
        child: ProductDetailsBody(),
      ),
    );
  }
}
