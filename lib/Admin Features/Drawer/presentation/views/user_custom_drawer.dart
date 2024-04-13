import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/utils/app_router.dart';
import 'package:ghosn_app/core/utils/assets_data.dart';
import 'package:ghosn_app/translations/local_keys.g.dart';
import 'package:go_router/go_router.dart';

class UserCustomDrawer extends StatelessWidget {
  const UserCustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            leading: const Icon(FontAwesomeIcons.penToSquare),
            title: Text(LocaleKeys.editProfile.tr()),
            onTap: () {
              GoRouter.of(context).push(AppRouter.kEditProfile);
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite_border_rounded),
            title: Text(LocaleKeys.Favorites.tr()),
            onTap: () {
              GoRouter.of(context).push(AppRouter.kFavorite);
            },
          ),
          ListTile(
            leading: const Icon(Icons.description_rounded),
            title: Text(LocaleKeys.documents.tr()),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.article_rounded),
            title: Text(LocaleKeys.articles.tr()),
            onTap: () {
              GoRouter.of(context).push(AppRouter.kArticleHome);
            },
          ),
          ListTile(
            leading: const Icon(Icons.miscellaneous_services_rounded),
            title: Text(LocaleKeys.services.tr()),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(LocaleKeys.settings.tr()),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.help_outline_rounded),
            title: Text(LocaleKeys.help.tr()),
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
