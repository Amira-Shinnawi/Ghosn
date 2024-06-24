import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghosn_app/User%20Features/Cart&Fav&Notify/data/model/cart_model/cart_model.dart';
import 'package:ghosn_app/User%20Features/Cart&Fav&Notify/presentation/manager/cubit/cart_cubit.dart';
import 'package:ghosn_app/User%20Features/Cart&Fav&Notify/presentation/views/widgets/total_amount.dart';
import 'package:ghosn_app/core/utils/style.dart';
import 'package:ghosn_app/translations/local_keys.g.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/Api_Key.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/functions/shared_pref_cache.dart';
import '../../../../../core/widgets/show_snack_bar.dart';
import 'chart_item.dart';

class ShoppingCartBody extends StatefulWidget {
  const ShoppingCartBody({super.key});

  @override
  State<ShoppingCartBody> createState() => _ShoppingCartBodyState();
}

class _ShoppingCartBodyState extends State<ShoppingCartBody> {
  var selectedIndexes = [];

  Future<void> _deleteItem(int id) async {
    await deleteProduct(id);

    if (mounted) {
      BlocProvider.of<CartCubit>(context).fetchAllCarts();
    }
  }

  Future<void> _createOrder(
    List<Map<String, dynamic>> orderProducts,
  ) async {
    await createOrder(
      orderProducts,
    );

    if (mounted) {
      BlocProvider.of<CartCubit>(context).fetchAllCarts();
    }
  }

  @override
  Widget build(BuildContext context) {
    bool hasSelectedItems = selectedIndexes.isNotEmpty;

    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartSuccess) {
          double calculateTotalAmount(List<CartItems> carts) {
            double totalAmount = 0.0;
            for (int index in selectedIndexes) {
              totalAmount += carts[index].totalPrice!;
            }
            return totalAmount;
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.carts.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return ChartItem(
                        cartModel: state.carts[index],
                        value: selectedIndexes.contains(index),
                        onChanged: (context) {
                          if (selectedIndexes.contains(index)) {
                            setState(() {
                              selectedIndexes.remove(index);
                            });
                          } else {
                            setState(() {
                              selectedIndexes.add(index);
                            });
                          }
                        },
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SimpleDialog(
                                  backgroundColor: Colors.white,
                                  title: Text(
                                    LocaleKeys
                                            .Doyoureallywanttoremovethisitemfromcart
                                        .tr(),
                                    textAlign: TextAlign.center,
                                    style: Styles.textStyle18Inter,
                                  ),
                                  children: [
                                    const Divider(),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      ),
                                      child: Text(
                                        LocaleKeys.SAVEFORLATER.tr(),
                                        style: Styles.textStyle18Inter.copyWith(
                                          color: kGreenColor,
                                        ),
                                      ),
                                      onPressed: () async {
                                        addFav(state.carts[index].id!);
                                        _deleteItem(
                                            state.carts[index].potParentId!);
                                        Navigator.pop(context);
                                      },
                                    ),
                                    const Divider(),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      ),
                                      child: Text(
                                        LocaleKeys.REMOVEITEM.tr(),
                                        style: Styles.textStyle18Inter.copyWith(
                                          color: Colors.red,
                                        ),
                                      ),
                                      onPressed: () {
                                        _deleteItem(
                                            state.carts[index].potParentId!);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              });
                        });
                  },
                ),
              ),
              if (hasSelectedItems)
                TotalAmount(
                  totalAmount: calculateTotalAmount(state.carts)
                      .roundToDouble()
                      .toString(),
                  onPressed: () {
                    List<Map<String, dynamic>> orderProducts = [];

                    for (int i = 0; i < selectedIndexes.length; i++) {
                      orderProducts.add({
                        "productId": state.carts[selectedIndexes[i]].id,
                        "quantity": state.carts[selectedIndexes[i]].quantity,
                        // "potVariationId": state.carts[selectedIndexes[i]].id
                      });
                    }
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return SimpleDialog(
                            backgroundColor: Colors.white,
                            title: Text(
                              LocaleKeys.AreYouSureYouwanttoConfirmOrder.tr(),
                              textAlign: TextAlign.center,
                              style: Styles.textStyle18Inter,
                            ),
                            children: [
                              const Divider(),
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle:
                                      Theme.of(context).textTheme.labelLarge,
                                ),
                                child: Text(
                                  LocaleKeys.Confirm.tr(),
                                  style: Styles.textStyle18Inter.copyWith(
                                    color: kGreenColor,
                                  ),
                                ),
                                onPressed: () async {
                                  await _createOrder(orderProducts);
                                  GoRouter.of(context)
                                      .push(AppRouter.kPaymentPage);
                                },
                              ),
                              const Divider(),
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle:
                                      Theme.of(context).textTheme.labelLarge,
                                ),
                                child: Text(
                                  LocaleKeys.Cancel.tr(),
                                  style: Styles.textStyle18Inter.copyWith(
                                    color: Colors.red,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        });
                  },
                ),
            ],
          );
        } else if (state is CartFailure) {
          return Center(
            child: Text(
              LocaleKeys.NoItemInYourCart.tr(),
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
        '${ApiKeys.BASE_URL}/api/Cart/Delete/$id',
        options: Options(
          method: 'DELETE',
          headers: headers,
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        showSnackBar(context, LocaleKeys.Productdeletedsuccessfully.tr());
        print(json.encode(response.data));
      } else {
        throw Exception('An error occurred while deleting the product.');
      }
    } on DioException catch (error) {
      if (error.response?.statusCode == 404) {
        showSnackBar(context, LocaleKeys.Productnotfoundinyourcart.tr());
        print(error.response?.statusMessage);
      } else {
        rethrow;
      }
    }
  }

  Future<void> createOrder(
    List<Map<String, dynamic>> orderProducts,
  ) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $userToken'
    };
    String requestId = Uuid().v4();
    print(requestId);
    var data = json.encode({
      "requestId": requestId,
      "orderProducts": orderProducts,
    });
    var dio = Dio();
    try {
      var response = await dio.request(
        '${ApiKeys.BASE_URL}/api/Auth/CreateOrder',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );
      if (response.statusCode == 200) {
        print(json.encode(response.data));
        await SharedPrefCache.insertToCache(
            key: 'totalPrice', value: response.data[totalPrice].toString());
        log(response.data['totalPrice'].toString());
        totalPrice = await SharedPrefCache.getCacheData(key: 'totalPrice');
      } else {
        throw Exception('An error occurred while Checkout the product.');
      }
    } on DioException catch (error) {
      if (error.response?.statusCode == 500 ||
          error.response?.statusCode == 400 ||
          error.response?.statusCode == 404) {
        print(error.response?.statusMessage);
        showSnackBar(context, LocaleKeys.ThisitemOutOfStock.tr());
      } else {
        rethrow;
      }
    }
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
        showSnackBar(
            context, LocaleKeys.ThisitemalreadyexistsinyourFavorite.tr());
        print(error.response?.statusMessage);
      } else {
        rethrow;
      }
    }
  }
}
