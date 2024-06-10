import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/utils/app_router.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../User Features/Account/data/repo/profile/profile_repo_imple.dart';
import '../../../../User Features/Account/presentation/manager/edit_profile_cubit/cubit/edit_profile_cubit.dart';
import '../../../../core/utils/functions/network_image_handler.dart';
import '../../../../core/utils/functions/shared_pref_cache.dart';
import '../../../../core/utils/service_locator.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../../translations/local_keys.g.dart';

class AdminCustomDrawer extends StatefulWidget {
  const AdminCustomDrawer({super.key});

  @override
  State<AdminCustomDrawer> createState() => _AdminCustomDrawerState();
}

class _AdminCustomDrawerState extends State<AdminCustomDrawer> {
  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final sharedPref = await SharedPreferences.getInstance();
    firstName = await SharedPrefCache.getCacheData(key: 'firstName');
    lastName = await SharedPrefCache.getCacheData(key: 'lastName');
    email = await SharedPrefCache.getCacheData(key: 'email');
    profileImage = sharedPref.getString('path');
    setState(() {});
    log('$firstName,$lastName,$email');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          BlocProvider(
            create: (context) => EditProfileCubit(
              getIt.get<ProfileRepoImplement>(),
            )..fetchProfile(),
            child: BlocBuilder<EditProfileCubit, EditProfileState>(
              builder: (context, state) {
                if (state is EditProfileSuccess) {
                  return UserAccountsDrawerHeader(
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
                        imageUrl: NetworkHandler()
                            .getImage(state.profileModel.first.imgUrl!),
                        aspectRatio: 1,
                      ),
                    ),
                    decoration: const BoxDecoration(
                      color: kGreenColor,
                    ),
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
            ),
          ),
          ListTile(
            title: const Text(
              'Dashboard',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            leading: const Icon(
              FontAwesomeIcons.layerGroup,
              size: 14,
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              'Products',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            leading: const Icon(
              Icons.grid_view_rounded,
              size: 18,
            ),
            onTap: () {
              GoRouter.of(context).push(AppRouter.kAdminProduct);
            },
          ),
          ListTile(
            title: const Text(
              'Customers',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            leading: const Icon(
              Icons.people_alt_rounded,
              size: 18,
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              'Orders',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            leading: const Icon(
              FontAwesomeIcons.cartShopping,
              size: 14,
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              'Shipments',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            leading: const Icon(
              Icons.local_shipping_rounded,
              size: 18,
            ),
            onTap: () {
              GoRouter.of(context).push(AppRouter.kShipment);
            },
          ),
          ListTile(
            title: const Text(
              'Transactions',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            leading: const Icon(
              FontAwesomeIcons.creditCard,
              size: 14,
            ),
            onTap: () {
              GoRouter.of(context).push(AppRouter.kTransaction);
            },
          ),
          ListTile(
            title: const Text(
              'Articles',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            leading: const Icon(
              Icons.article_rounded,
              size: 18,
            ),
            onTap: () {
              GoRouter.of(context).push(AppRouter.kLatestArticle);
            },
          ),
          ListTile(
            title: const Text(
              'Community',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            leading: const Icon(
              FontAwesomeIcons.users,
              size: 14,
            ),
            onTap: () {
              GoRouter.of(context).push(AppRouter.kCommunity);
            },
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
              GoRouter.of(context).push(AppRouter.kChangePassword);
            },
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
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
