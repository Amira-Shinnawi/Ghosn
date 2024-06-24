import 'package:flutter/material.dart';
import 'package:ghosn_app/Admin%20Features/Community/presentation/views/widgets/friend_profile_body.dart';
import 'package:ghosn_app/core/utils/app_router.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';
import 'package:go_router/go_router.dart';

import '../../data/model/following_user_model/following_user_model.dart';

class FriendProfileView extends StatelessWidget {
  const FriendProfileView({
    super.key,
    required this.followingsModel,
  });
  final Followings followingsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kProfile);
            },
            icon: const Icon(
              Icons.notifications_none,
              size: 25,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: FriendProfileBody(
          followingsModel: followingsModel,
        ),
      ),
    );
  }
}
