import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghosn_app/User%20Features/Account/presentation/views/widgets/purchase_item.dart';
import 'package:ghosn_app/User%20Features/Cart&Fav&Notify/data/repo/cart_repo_impl.dart';
import 'package:ghosn_app/User%20Features/Cart&Fav&Notify/presentation/manager/cubit/cart_cubit.dart';
import 'package:ghosn_app/core/utils/service_locator.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/style.dart';

class PurchasesListView extends StatelessWidget {
  const PurchasesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CartCubit(getIt.get<CartRepoImpl>())..fetchPurchases(),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is PurchasesSuccess) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.purchases.length,
              itemBuilder: (context, index) {
                return PurchaseItem(
                  purchasesModel: state.purchases[index],
                );
              },
            );
          } else if (state is PurchasesFailure) {
            return Center(
              child: Text(
                'No Item In Your Purchase',
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
      ),
    );
  }
}
