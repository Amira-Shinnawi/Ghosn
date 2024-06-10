import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/User%20Features/home/data/plant_model.dart';
import 'package:ghosn_app/core/utils/Api_Key.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../constants.dart';
import '../../../../core/widgets/show_snack_bar.dart';
import 'widgets/product_details_body.dart';

class ProductDetailsHome extends StatefulWidget {
  const ProductDetailsHome({
    super.key,
    required this.gClient,
    required this.plantModel,
  });
  final ValueNotifier<GraphQLClient> gClient;
  final Plants plantModel;
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
              addFav(widget.plantModel.id!);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: ProductDetailsBody(
          gClient: widget.gClient,
          plantModel: widget.plantModel,
        ),
      ),
    );
  }

  Future<void> addFav(int id) async {
    var headers = {'Authorization': 'Bearer $userToken'};
    var dio = Dio();
    try {
      var response = await dio.request(
        '${ApiKeys.BASE_URL}/api/wishlist/{productId}?ProductId=$id',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        print(json.encode(response.data));
      } else {
        throw Exception('An error occurred, Please Try Again!.');
      }
    } on DioException catch (error) {
      if (error.response?.statusCode == 400) {
        showSnackBar(context, 'This item already exists in your Favorite.');
        print(error.response?.statusMessage);
      } else {
        rethrow;
      }
    }
  }
}
