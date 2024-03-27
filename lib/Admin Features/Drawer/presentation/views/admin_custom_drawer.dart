import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/utils/app_router.dart';
import 'package:ghosn_app/core/utils/assets_data.dart';
import 'package:go_router/go_router.dart';

import '../../../../translations/local_keys.g.dart';

class AdminCustomDrawer extends StatelessWidget {
  const AdminCustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
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
          ListTile(
            title: const Text('Dashboard'),
            leading: const Icon(FontAwesomeIcons.layerGroup),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Products'),
            leading: const Icon(Icons.grid_view_rounded),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Customers'),
            leading: const Icon(Icons.people_alt_rounded),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Orders'),
            leading: const Icon(FontAwesomeIcons.cartShopping),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Shipments'),
            leading: const Icon(Icons.local_shipping_rounded),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Transactions'),
            leading: const Icon(FontAwesomeIcons.creditCard),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Articles'),
            leading: const Icon(Icons.article_rounded),
            onTap: () {
              GoRouter.of(context).push(AppRouter.kLatestArticle);
            },
          ),
          ListTile(
            title: const Text('Community'),
            leading: const Icon(FontAwesomeIcons.users),
            onTap: () {
              GoRouter.of(context).push(AppRouter.kCommunity);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(LocaleKeys.settings.tr()),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(LocaleKeys.signOut.tr()),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
