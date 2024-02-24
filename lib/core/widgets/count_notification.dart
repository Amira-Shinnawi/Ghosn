import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomNotification extends StatelessWidget {
  const CustomNotification({
    super.key, this.child,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      badgeContent: const Text(
        '5',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      badgeAnimation: const badges.BadgeAnimation.slide(
        toAnimate: true,
        animationDuration: Duration(
          seconds: 1,
        ),
      ),
      position: badges.BadgePosition.topEnd(top: -5, end: 5),
      badgeStyle: const badges.BadgeStyle(badgeColor: kGreenColor),
      child:child,
    );
  }
}
