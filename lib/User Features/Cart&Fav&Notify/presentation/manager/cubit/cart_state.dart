part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartSuccess extends CartState {
  final List<CartItems> carts;

  const CartSuccess(this.carts);
}

final class CartFailure extends CartState {
  final String errorMessage;

  const CartFailure(this.errorMessage);
}

final class FavLoading extends CartState {}

final class FavSuccess extends CartState {
  final List<FavModel> favProducts;

  const FavSuccess(this.favProducts);
}

final class FavFailure extends CartState {
  final String errorMessage;

  const FavFailure(this.errorMessage);
}

final class BestSellerLoading extends CartState {}

final class BestSellerSuccess extends CartState {
  final List<BestSellerModel> bestSeller;

  const BestSellerSuccess(this.bestSeller);
}

final class BestSellerFailure extends CartState {
  final String errorMessage;

  const BestSellerFailure(this.errorMessage);
}

final class PurchasesLoading extends CartState {}

final class PurchasesSuccess extends CartState {
  final List<PurchasesModel> purchases;

  const PurchasesSuccess(this.purchases);
}

final class PurchasesFailure extends CartState {
  final String errorMessage;

  const PurchasesFailure(this.errorMessage);
}
