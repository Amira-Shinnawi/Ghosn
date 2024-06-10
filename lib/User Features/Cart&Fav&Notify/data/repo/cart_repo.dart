import 'package:dartz/dartz.dart';
import 'package:ghosn_app/User%20Features/Cart&Fav&Notify/data/model/cart_model/cart_model.dart';
import 'package:ghosn_app/User%20Features/Cart&Fav&Notify/data/model/fav_model/fav_model.dart';
import 'package:ghosn_app/User%20Features/Cart&Fav&Notify/data/model/purchases_model/purchases_model.dart';
import 'package:ghosn_app/User%20Features/home/data/best_seller_plant_model/best_seller_plant_model.dart';

import '../../../../core/errors/failuers.dart';

abstract class CartRepo {
  Future<Either<Failure, List<CartItems>>> getCart();
  Future<Either<Failure, List<FavModel>>> getFav();
  Future<Either<Failure, List<BestSellerModel>>> getBestSeller();
  Future<Either<Failure, List<PurchasesModel>>> getPurchases();
}
