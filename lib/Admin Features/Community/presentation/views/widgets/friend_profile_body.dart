import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ghosn_app/Admin%20Features/Community/presentation/views/widgets/friend_profile_activity.dart';

import 'friend_profile_item.dart';

class FriendProfileBody extends StatelessWidget {
  const FriendProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    return Padding(
      padding: EdgeInsets.only(
          left: blockWidth * 2, right: blockWidth * 2, bottom: blockHeight * 2),
      child: const CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: FriendProfileItem(),
          ),
          SliverToBoxAdapter(
            child: FriendProfileActivity(),
          ),
        ],
      ),
    );
  }
}
