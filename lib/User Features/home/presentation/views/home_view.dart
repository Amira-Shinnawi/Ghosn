import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';

import '../../../../core/widgets/count_notification.dart';
import '../../../Account/presentation/views/widgets/user_custom_drawer.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: CustomAppBar(backgroundColor: kGreenColor, actions: [
        const CustomNotification(),
        IconButton(
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
          icon: const Icon(
            FontAwesomeIcons.bars,
            color: Colors.white,
            size: 20,
          ),
        ),
      ]),
      drawer: const UserCustomDrawer(),
      body: const SafeArea(
        child: HomeViewBody(),
      ),
    );
  }
}
