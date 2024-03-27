import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghosn_app/Admin%20Features/Drawer/presentation/views/widgets/custom_drawer_item.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/utils/assets_data.dart';

import '../../../../translations/local_keys.g.dart';
import '../../data/model/drawer_item_model.dart';

class AdminCustomDrawer extends StatelessWidget {
  const AdminCustomDrawer({super.key});

  static List<DrawerItemModel> items = [
    DrawerItemModel(
      title: 'Dashboard',
      icon: FontAwesomeIcons.layerGroup,
      onTap: () {},
    ),
    DrawerItemModel(
      title: 'Products',
      icon: Icons.grid_view_rounded,
      onTap: () {},
    ),
    DrawerItemModel(
      title: 'Customers',
      icon: Icons.people_alt_rounded,
      onTap: () {},
    ),
    DrawerItemModel(
      title: 'Orders',
      icon: FontAwesomeIcons.cartShopping,
      onTap: () {},
    ),
    DrawerItemModel(
      title: 'Shipments',
      icon: Icons.local_shipping_rounded,
      onTap: () {},
    ),
    DrawerItemModel(
      title: 'Transactions',
      icon: FontAwesomeIcons.creditCard,
      onTap: () {},
    ),
    DrawerItemModel(
      title: 'Articles',
      icon: Icons.article_rounded,
      onTap: () {},
    ),
    DrawerItemModel(
      title: 'Community',
      icon: FontAwesomeIcons.users,
      onTap: () {},
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: UserAccountsDrawerHeader(
            accountName: const Text(
              'Amira Shinnawi',
            ),
            accountEmail: const Text(
              'amira123@gmail.com',
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  AssetsData.imageTest2,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: kGreenColor,
            ),
          ),
        ),
        SliverList.builder(
            itemCount: items.length,
            itemBuilder: ((context, index) {
              return CustomDrawerItem(drawerItemModel: items[index]);
            })),
        const SliverToBoxAdapter(child: Divider()),
        SliverToBoxAdapter(
          child: ListTile(
            leading: const Icon(
              Icons.settings,
            ),
            title: Text(
              LocaleKeys.settings.tr(),
            ),
            onTap: () {},
          ),
        ),
        SliverToBoxAdapter(
          child: ListTile(
            leading: const Icon(
              Icons.logout,
            ),
            title: Text(
              LocaleKeys.signOut.tr(),
            ),
            onTap: () {},
          ),
        ),
      ]),
    );
  }
}
