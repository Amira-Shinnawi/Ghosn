import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghosn_app/Admin%20Features/Community/presentation/manager/community_cubit/community_cubit.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/widgets/custom_text_field.dart';

import '../../../../../translations/local_keys.g.dart';
import 'recommended_friend.dart';

class WhoToFollow extends StatefulWidget {
 const WhoToFollow({super.key});

  @override
  State<WhoToFollow> createState() => _WhoToFollowState();
}

class _WhoToFollowState extends State<WhoToFollow> {
  String? subName;
  @override
  void initState() {
    BlocProvider.of<CommunityCubit>(context)
        .fetchSearchSuggestedUser(userName: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomTextField(
                    showSuffixIcon: false,

        prefixIcon: const Icon(
          Icons.search,
          size: 20,
        ),
        onChanged: (value) {
          subName = value;
          BlocProvider.of<CommunityCubit>(context)
              .fetchSearchSuggestedUser(userName: subName!);
        },
        hintText: LocaleKeys.Search.tr(),
        width: 1,
      ),
      Expanded(child: BlocBuilder<CommunityCubit, CommunityState>(
          builder: (context, state) {
        if (state is SearchSuggestedUserSuccess) {
          return ListView.builder(
            itemCount: state.searchSuggestedUsers.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return RecommendedFriendItem(
                suggestedUser: state.searchSuggestedUsers[index],
              );
            },
          );
        } else if (state is SearchSuggestedUserFailure) {
          return Text(state.errorMessage);
        } else {
          return const Center(
              child: CircularProgressIndicator(
            color: kGreenColor,
          ));
        }
      }))
    ]);
  }
}
