import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/User%20Features/Cart&Fav&Notify/presentation/views/widgets/add_cart.dart';
import 'package:ghosn_app/User%20Features/home/data/pot_model.dart';
import 'package:ghosn_app/core/widgets/show_snack_bar.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/Api_Key.dart';
import '../../../../../core/utils/functions/network_image_handler.dart';
import '../../../../../core/utils/style.dart';
import 'pot_detail.dart';

class PotDetailsBody extends StatefulWidget {
  const PotDetailsBody({
    super.key,
    required this.gClient,
    required this.potModel,
  });
  final ValueNotifier<GraphQLClient> gClient;
  final PotProducts potModel;
  @override
  State<PotDetailsBody> createState() => _PotDetailsBodyState();
}

class _PotDetailsBodyState extends State<PotDetailsBody> {
  int currentIndex = 0;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double blockHeight = (height / 100);
    double blockWidth = (width / 100);
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: blockHeight * 55,
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(37),
                  topRight: Radius.circular(37),
                ),
              ),
            ),
            child: PotDetails(
              potModel: widget.potModel,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: AddCart(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    count++;
                  });
                },
                icon: const Icon(
                  Icons.add,
                  size: 25,
                  color: Colors.black,
                ),
              ),
              Text(
                '$count',
                style: Styles.textStyle18Inter,
              ),
              IconButton(
                onPressed: () {
                  if (count > 0) {
                    setState(() {
                      count--;
                    });
                  }
                },
                icon: const Icon(
                  Icons.remove,
                  size: 25,
                  color: Colors.black,
                ),
              ),
            ],
            onPressed: () {
              addCart(widget.potModel.id!, count,
                  widget.potModel.potVariations!.first.variationId!);
            },
          ),
        ),
        Positioned(
          right: 10,
          left: 10,
          top: 50,
          child: AspectRatio(
            aspectRatio: 2 / 1,
            child: Align(
              alignment: AlignmentDirectional.center,
              child: Image(
                image: NetworkHandler()
                    .getImage('Pots-Images/${widget.potModel.imageUrl}'),
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                      child: Icon(
                    Icons.error,
                    color: Colors.grey,
                  ));
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> addCart(int id, int quantity, int potVariation) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $userToken'
    };
    var data = json.encode({
      "productId": id,
      "quantity": quantity,
      "potVariationId": potVariation
    });
    var dio = Dio();

    try {
      var response = await dio.request(
        '${ApiKeys.BASE_URL}/api/Auth/AddToCart',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        print(json.encode(response.data));
      } else {
        throw Exception('An error occurred, Please Try Again!.');
      }
    } on DioException catch (error) {
      if (error.response?.statusCode == 500 ||
          error.response?.statusCode == 400) {
        showSnackBar(context, 'This item already exists in your cart.');
        print(error.response?.statusMessage);
      } else {
        rethrow;
      }
    }
  }
}
