import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/utils/app_router.dart';
import 'package:ghosn_app/core/utils/service_locator.dart';
import 'package:go_router/go_router.dart';

import '../../../../User Features/Account/data/repo/profile/profile_repo_imple.dart';
import '../../../../User Features/Account/presentation/manager/edit_profile_cubit/cubit/edit_profile_cubit.dart';
import '../../../../core/utils/functions/network_image_handler.dart';
import '../../../../core/utils/functions/shared_pref_cache.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../../translations/local_keys.g.dart';
import '../../../admin/presentation/view/DashBoard2.dart';
import '../../../admin/presentation/view/settings.dart';

class UserCustomDrawer extends StatefulWidget {
  const UserCustomDrawer({super.key});

  @override
  State<UserCustomDrawer> createState() => _UserCustomDrawerState();
}

class _UserCustomDrawerState extends State<UserCustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.white,
        child: BlocProvider(
            create: (context) => EditProfileCubit(
                  getIt.get<ProfileRepoImplement>(),
                )..fetchProfile(),
            child: BlocBuilder<EditProfileCubit, EditProfileState>(
              builder: (context, state) {
                if (state is EditProfileSuccess) {
                  return state.profileModel.first.email.toString() ==
                          'amira@gmail.com'
                      ? ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            UserAccountsDrawerHeader(
                              accountName: Text(
                                '${state.profileModel.first.firstName} ${state.profileModel.first.lastName}',
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              accountEmail: Text(
                                '${state.profileModel.first.email}',
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              currentAccountPicture: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: CustomNetworkImage(
                                  imageUrl: NetworkHandler().getImage(
                                      '${state.profileModel.first.imgUrl}'),
                                  aspectRatio: 1,
                                ),
                              ),
                              decoration: const BoxDecoration(
                                color: kGreenColor,
                              ),
                            ),
                            ListTile(
                              title: Text(
                                LocaleKeys.DashBoard.tr(),
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              leading: const Icon(
                                FontAwesomeIcons.layerGroup,
                                size: 14,
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const DashBoard()));
                              },
                            ),
                            ListTile(
                              title: Text(
                                LocaleKeys.editProfile.tr(),
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              leading: const Icon(
                                FontAwesomeIcons.penToSquare,
                                size: 14,
                              ),
                              onTap: () {
                                GoRouter.of(context)
                                    .push(AppRouter.kEditProfile);
                              },
                            ),
                            ListTile(
                              title: Text(
                                LocaleKeys.Favorites.tr(),
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              leading: const Icon(
                                Icons.favorite_border_rounded,
                                size: 18,
                              ),
                              onTap: () {
                                GoRouter.of(context).push(AppRouter.kFavorite);
                              },
                            ),
                            ListTile(
                              title: Text(
                                LocaleKeys.Cart.tr(),
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              leading: const Icon(
                                Icons.shopping_cart_outlined,
                                size: 18,
                              ),
                              onTap: () {
                                GoRouter.of(context).push(AppRouter.kChart);
                              },
                            ),
                            ListTile(
                              title: Text(
                                LocaleKeys.articles.tr(),
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              leading: const Icon(
                                Icons.article_rounded,
                                size: 18,
                              ),
                              onTap: () {
                                GoRouter.of(context)
                                    .push(AppRouter.kLatestArticle);
                              },
                            ),
                            ListTile(
                              title: Text(
                                LocaleKeys.services.tr(),
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              leading: const Icon(
                                Icons.miscellaneous_services_rounded,
                                size: 18,
                              ),
                              onTap: () {},
                            ),
                            const Divider(),
                            ListTile(
                              leading: const Icon(
                                Icons.settings,
                                size: 18,
                              ),
                              title: Text(
                                LocaleKeys.settings.tr(),
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Settings()));
                              },
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.help_outline_rounded,
                                size: 18,
                              ),
                              title: Text(
                                LocaleKeys.help.tr(),
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              onTap: () {},
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.logout,
                                size: 18,
                              ),
                              title: Text(
                                LocaleKeys.signOut.tr(),
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              onTap: () async {
                                await SharedPrefCache.deleteCacheItem(
                                    key: 'token');
                                await SharedPrefCache.deleteCacheItem(
                                    key: 'accessToken');

                                GoRouter.of(context).pushReplacement(
                                    AppRouter.kLoginOptionView);
                              },
                            ),
                          ],
                        )
                      : ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            UserAccountsDrawerHeader(
                              accountName: Text(
                                '${state.profileModel.first.firstName} ${state.profileModel.first.lastName}',
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              accountEmail: Text(
                                '${state.profileModel.first.email}',
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              currentAccountPicture: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: CustomNetworkImage(
                                  imageUrl: NetworkHandler().getImage(
                                      '${state.profileModel.first.imgUrl}'),
                                  aspectRatio: 1,
                                ),
                              ),
                              decoration: const BoxDecoration(
                                color: kGreenColor,
                              ),
                            ),
                            ListTile(
                              title: Text(
                                LocaleKeys.editProfile.tr(),
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              leading: const Icon(
                                FontAwesomeIcons.penToSquare,
                                size: 14,
                              ),
                              onTap: () {
                                GoRouter.of(context)
                                    .push(AppRouter.kEditProfile);
                              },
                            ),
                            ListTile(
                              title: Text(
                                LocaleKeys.Favorites.tr(),
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              leading: const Icon(
                                Icons.favorite_border_rounded,
                                size: 18,
                              ),
                              onTap: () {
                                GoRouter.of(context).push(AppRouter.kFavorite);
                              },
                            ),
                            ListTile(
                              title: Text(
                                LocaleKeys.Cart.tr(),
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              leading: const Icon(
                                Icons.shopping_cart_outlined,
                                size: 18,
                              ),
                              onTap: () {
                                GoRouter.of(context).push(AppRouter.kChart);
                              },
                            ),
                            ListTile(
                              title: Text(
                                LocaleKeys.articles.tr(),
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              leading: const Icon(
                                Icons.article_rounded,
                                size: 18,
                              ),
                              onTap: () {
                                GoRouter.of(context)
                                    .push(AppRouter.kLatestArticle);
                              },
                            ),
                            ListTile(
                              title: Text(
                                LocaleKeys.services.tr(),
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              leading: const Icon(
                                Icons.miscellaneous_services_rounded,
                                size: 18,
                              ),
                              onTap: () {},
                            ),
                            const Divider(),
                            ListTile(
                              leading: const Icon(
                                Icons.settings,
                                size: 18,
                              ),
                              title: Text(
                                LocaleKeys.settings.tr(),
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Settings()));
                              },
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.help_outline_rounded,
                                size: 18,
                              ),
                              title: Text(
                                LocaleKeys.help.tr(),
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              onTap: () {},
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.logout,
                                size: 18,
                              ),
                              title: Text(
                                LocaleKeys.signOut.tr(),
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              onTap: () async {
                                await SharedPrefCache.deleteCacheItem(
                                    key: 'token');
                                await SharedPrefCache.deleteCacheItem(
                                    key: 'accessToken');

                                GoRouter.of(context).pushReplacement(
                                    AppRouter.kLoginOptionView);
                              },
                            ),
                          ],
                        );
                } else if (state is EditProfileFailure) {
                  return Center(child: Text(state.errorMessage));
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                }
              },
            )));
  }
}
