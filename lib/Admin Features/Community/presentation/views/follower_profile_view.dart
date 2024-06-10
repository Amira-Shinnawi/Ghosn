import 'package:flutter/material.dart';
import 'package:ghosn_app/core/utils/app_router.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';
import 'package:go_router/go_router.dart';

import '../../data/model/follower_user_model.dart';
import 'widgets/follower_profiel_body.dart';

class FollowerProfileView extends StatelessWidget {
  const FollowerProfileView({super.key, required this.followersModel});
  final Followers followersModel;

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
        child: FollowerProfileBody(
          followersModel: followersModel,
        ),
      ),
    );
  }
}
