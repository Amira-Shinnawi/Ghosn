import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/style.dart';
import '../../../Drawer/presentation/views/user_custom_drawer.dart';
import 'widgets/community_home_body.dart';

class CommunityHome extends StatefulWidget {
  const CommunityHome({super.key});

  @override
  State<CommunityHome> createState() => _CommunityHomeState();
}

class _CommunityHomeState extends State<CommunityHome> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    return Scaffold(
      key: scaffoldKey,
      appBar: CustomAppBar(
        titleAppBar: Text(
          'Plant Community',
          style: Styles.textStyle18Inter.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: false,
        actions: [
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
              scaffoldKey.currentState!.openDrawer();
            },
            icon: const Icon(
              FontAwesomeIcons.bars,
              size: 20,
            ),
          ),
        ],
      ),
      drawer: const UserCustomDrawer(),
      body: const SafeArea(
        child: CommunityHomeBody(),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: blockHeight * 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: FloatingActionButton(
            backgroundColor: kGreenColor,
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kCreatePost);
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
