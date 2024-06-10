import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ghosn_app/User%20Features/Cart&Fav&Notify/data/model/cart_model/cart_model.dart';
import 'package:ghosn_app/User%20Features/Cart&Fav&Notify/data/model/fav_model/fav_model.dart';
import 'package:ghosn_app/User%20Features/Cart&Fav&Notify/data/repo/cart_repo.dart';
import 'package:ghosn_app/User%20Features/home/data/best_seller_plant_model/best_seller_plant_model.dart';

import '../../../data/model/purchases_model/purchases_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInitial());

  final CartRepo cartRepo;

  Future<void> fetchAllCarts() async {
    emit(CartLoading());
    try {
      var result = await cartRepo.getCart();
      result.fold((failure) {
        emit(CartFailure(failure.errorMessage));
      }, (carts) {
        emit(CartSuccess(carts));
      });
    } catch (e) {
      if (!isClosed) {
        emit(CartFailure(e.toString()));
      }
    }
  }

  Future<void> fetchAllFavProducts() async {
    emit(FavLoading());
    try {
      var result = await cartRepo.getFav();
      result.fold((failure) {
        emit(FavFailure(failure.errorMessage));
      }, (favProducts) {
        emit(FavSuccess(favProducts));
      });
    } on Exception catch (e) {
      if (!isClosed) {
        emit(FavFailure(e.toString()));
      }
    }
  }

  Future<void> fetchBestSeller() async {
    emit(BestSellerLoading());
    try {
      var result = await cartRepo.getBestSeller();
      result.fold((failure) {
        emit(BestSellerFailure(failure.errorMessage));
      }, (bestSeller) {
        emit(BestSellerSuccess(bestSeller));
      });
    } catch (e) {
      if (!isClosed) {
        emit(BestSellerFailure(e.toString()));
      }
    }
  }

  Future<void> fetchPurchases() async {
    emit(PurchasesLoading());
    try {
      var result = await cartRepo.getPurchases();
      result.fold((failure) {
        emit(PurchasesFailure(failure.errorMessage));
      }, (purchases) {
        emit(PurchasesSuccess(purchases));
      });
    } catch (e) {
      if (!isClosed) {
        emit(PurchasesFailure(e.toString()));
      }
    }
  }
}
