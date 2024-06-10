import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ghosn_app/User%20Features/Cart&Fav&Notify/data/model/cart_model/cart_model.dart';
import 'package:ghosn_app/User%20Features/Cart&Fav&Notify/data/model/fav_model/fav_model.dart';
import 'package:ghosn_app/User%20Features/Cart&Fav&Notify/data/model/purchases_model/purchases_model.dart';
import 'package:ghosn_app/User%20Features/Cart&Fav&Notify/data/repo/cart_repo.dart';
import 'package:ghosn_app/User%20Features/home/data/best_seller_plant_model/best_seller_plant_model.dart';
import 'package:ghosn_app/constants.dart';

import '../../../../core/errors/failuers.dart';
import '../../../../core/utils/api_service.dart';

class CartRepoImpl implements CartRepo {
  final APIService apiService;

  CartRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<CartItems>>> getCart() async {
    try {
      var data = await apiService.getProfile(
          endPoint: '/api/Cart',
          options: Options(headers: {'Authorization': 'Bearer $userToken'}));
      List<CartItems> carts = [];
      for (var item in data['cartItems']) {
        carts.add(CartItems.fromJson(item));
      }

      return right(carts);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioExceptionError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<FavModel>>> getFav() async {
    try {
      var data = await apiService.listOfMap(
          endPoint: '/api/wishlist/FavoritesProducts',
          options: Options(headers: {'Authorization': 'Bearer $userToken'}));
      List<FavModel> favProducts = [];
      for (var item in data) {
        favProducts.add(FavModel.fromJson(item as Map<String, dynamic>));
      }

      return right(favProducts);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioExceptionError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BestSellerModel>>> getBestSeller() async {
    try {
      var data = await apiService.listOfMap(
          endPoint: '/api/BestSeller',
          options: Options(headers: {'Authorization': 'Bearer $userToken'}));
      List<BestSellerModel> bestSeller = [];
      for (var item in data) {
        bestSeller.add(BestSellerModel.fromJson(item as Map<String, dynamic>));
      }

      return right(bestSeller);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioExceptionError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<PurchasesModel>>> getPurchases() async {
    try {
      var data = await apiService.listOfMap(
          endPoint: '/api/Auth/PurchaseHistory',
          options: Options(headers: {'Authorization': 'Bearer $userToken'}));
      List<PurchasesModel> purchases = [];
      for (var item in data) {
        purchases.add(PurchasesModel.fromJson(item as Map<String, dynamic>));
      }

      return right(purchases);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioExceptionError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
