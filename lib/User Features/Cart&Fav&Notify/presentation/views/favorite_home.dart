import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghosn_app/User%20Features/Cart&Fav&Notify/data/repo/cart_repo_impl.dart';
import 'package:ghosn_app/User%20Features/Cart&Fav&Notify/presentation/manager/cubit/cart_cubit.dart';
import 'package:ghosn_app/User%20Features/Cart&Fav&Notify/presentation/views/widgets/favorite_list_view_body.dart';
import 'package:ghosn_app/core/utils/service_locator.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';

import '../../../../core/utils/style.dart';
import '../../../../translations/local_keys.g.dart';

class FavoriteHome extends StatelessWidget {
  const FavoriteHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),
        titleAppBar: Text(
          LocaleKeys.Favorites.tr(),
          style: Styles.textStyle18Inter.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (context) =>
              CartCubit(getIt.get<CartRepoImpl>())..fetchAllFavProducts(),
          child: const FavoriteListViewBody(),
        ),
      ),
    );
  }
}
