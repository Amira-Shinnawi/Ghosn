import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghosn_app/Admin%20Features/Community/presentation/views/community_home.dart';
import 'package:ghosn_app/constants.dart';

import '../../../Account/presentation/views/profile_view.dart';
import '../../../detection/presentation/views/tips_page.dart';
import '../../../Cart&Fav&Notify/presentation/views/favorite_home.dart';
import 'home_view.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final _bottomNavigationKey = GlobalKey<CurvedNavigationBarState>();

  int selectedIndex = 2;
  List<Widget> screens = [
    const CommunityHome(),
    const Tips(),
    const HomeView(),
    const FavoriteHome(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(
        Icons.groups,
      ),
      const Icon(
        Icons.qr_code_scanner_rounded,
      ),
      const Icon(
        Icons.home,
      ),
      const Icon(
        Icons.edit_calendar_rounded,
      ),
      const Icon(
        FontAwesomeIcons.circleUser,
      ),
    ];
    return Container(
      color: kGreenColor,
      child: SafeArea(
        top: false,
        child: Scaffold(
          extendBody: true,
          backgroundColor: Colors.transparent,
          body: screens[selectedIndex],
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
            ),
            child: CurvedNavigationBar(
                key: _bottomNavigationKey,
                backgroundColor: Colors.transparent,
                color: kGreenColor,
                buttonBackgroundColor: kGreenColor,
                height: 60,
                index: selectedIndex,
                items: items,
                animationCurve: Curves.easeInOut,
                animationDuration: const Duration(milliseconds: 300),
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
}
