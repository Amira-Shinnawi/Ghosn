import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghosn_app/User%20Features/Account/presentation/views/widgets/user_profile.dart';

import '../../../../../core/utils/service_locator.dart';
import '../../../data/repo/profile/profile_repo_imple.dart';
import '../../manager/edit_profile_cubit/cubit/edit_profile_cubit.dart';
import 'history_profile_item_list_view.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: blockWidth * 3, vertical: blockHeight * 2),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
              child: Column(
            children: [
              BlocProvider(
                create: (context) => EditProfileCubit(
                  getIt.get<ProfileRepoImplement>(),
                )..fetchProfile(),
                child: const UserProfile(),
              ),
              const Expanded(
                child: HistoryProfileItems(),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
