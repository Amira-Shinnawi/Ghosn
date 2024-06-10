import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghosn_app/User%20Features/Cart&Fav&Notify/presentation/manager/cubit/cart_cubit.dart';
import 'package:ghosn_app/User%20Features/Cart&Fav&Notify/presentation/views/widgets/favorite_item.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/Api_Key.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/show_snack_bar.dart';

class FavoriteListViewBody extends StatefulWidget {
  const FavoriteListViewBody({super.key});

  @override
  State<FavoriteListViewBody> createState() => _FavoriteListViewBodyState();
}

class _FavoriteListViewBodyState extends State<FavoriteListViewBody> {
  Future<void> _deleteItem(int id) async {
    await deleteProduct(id);

    if (mounted) {
      BlocProvider.of<CartCubit>(context).fetchAllFavProducts();
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is FavSuccess) {
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.favProducts.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: blockWidth * 3, vertical: blockHeight * 1),
                  child: FavoriteItem(
                    favModel: state.favProducts[index],
                    onTap: () {
                      _deleteItem(state.favProducts[index].id!);
                    },
                  ),
                );
              });
        } else if (state is FavFailure) {
          return Center(
            child: Text(
              'No Item In Your Favorite',
              style: Styles.textStyle16Inter.copyWith(
                color: kGreenColor,
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Future<void> deleteProduct(int id) async {
    var headers = {'Authorization': 'Bearer $userToken'};
    var dio = Dio();

    try {
      var response = await dio.request(
        '${ApiKeys.BASE_URL}/api/wishlist/Remove/$id',
        options: Options(
          method: 'DELETE',
          headers: headers,
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        showSnackBar(context, 'Product deleted successfully.');
        print(json.encode(response.data));
      } else {
        throw Exception('An error occurred while deleting the product.');
      }
    } on DioException catch (error) {
      if (error.response?.statusCode == 404) {
        showSnackBar(context, 'Product not found in your cart.');
        print(error.response?.statusMessage);
      } else {
        rethrow;
      }
    }
  }
}
