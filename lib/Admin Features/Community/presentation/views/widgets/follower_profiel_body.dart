import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ghosn_app/Admin%20Features/Community/data/model/follower_user_model.dart';

import 'follower_profile_item.dart';
import 'follower_user_activity.dart';

class FollowerProfileBody extends StatelessWidget {
  const FollowerProfileBody({super.key, required this.followersModel});
  final Followers followersModel;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    return Padding(
      padding: EdgeInsets.only(
          left: blockWidth * 2, right: blockWidth * 2, bottom: blockHeight * 2),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              children: [
                FollowerProfileItem(
                  followersModel: followersModel,
                ),
                Expanded(
                  child: FollowerProfileActivity(
                    followingsModel: followersModel,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
