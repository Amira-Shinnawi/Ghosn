import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghosn_app/Features/Account/presentation/views/widgets/nav_bar.dart';
import 'package:ghosn_app/core/utils/app_router.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/style.dart';
import '../../../../translations/local_keys.g.dart';
import 'widgets/profile_view_body.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        titleAppBar: Text(
          '${LocaleKeys.hello.tr()} User',
          style: Styles.textStyle20Inter.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kChart);
            },
            icon: const Icon(
              Icons.shopping_cart_outlined,
              size: 25,
            ),
          ),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kNotification);
            },
            icon: const Icon(
              Icons.notifications_none,
              size: 25,
            ),
          ),
          IconButton(
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            icon: const Icon(
              FontAwesomeIcons.bars,
              size: 20,
            ),
          ),
        ],
      ),
      drawer: const NavBar(),
      body: const SafeArea(
        child: ProfileViewBody(),
      ),
    );
  }
}
