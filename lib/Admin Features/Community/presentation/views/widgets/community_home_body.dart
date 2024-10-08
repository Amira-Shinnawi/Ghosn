import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghosn_app/Admin%20Features/Community/data/repo/community_repo_imple.dart';
import 'package:ghosn_app/Admin%20Features/Community/presentation/manager/community_cubit/community_cubit.dart';
import 'package:ghosn_app/core/utils/service_locator.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../translations/local_keys.g.dart';
import 'following_posts_list_view.dart';
import 'recommended_posts_list_view.dart';
import 'who_to_follow.dart';

class CommunityHomeBody extends StatefulWidget {
  const CommunityHomeBody({super.key});

  @override
  State<CommunityHomeBody> createState() => _CommunityHomeBodyState();
}

class _CommunityHomeBodyState extends State<CommunityHomeBody> {
  int _selectedTextIndex = 0;
  late final PageController _pageController = PageController(
    initialPage: _selectedTextIndex,
  );

  List<String> sectionCommunity = [
    LocaleKeys.Recommended.tr(),
    LocaleKeys.Following.tr(),
    LocaleKeys.Whotofollow.tr()
  ];
  Widget _buildSelectedListView() {
    switch (_selectedTextIndex) {
      case 0:
        return const PublicPostsListView();
      case 1:
        return const FollowingPostsListView();
      case 2:
        return BlocProvider(
          create: (context) =>
              CommunityCubit(getIt.get<CommunityRepoImplement>()),
          child: const WhoToFollow(),
        );
      default:
        return const PublicPostsListView();
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: blockWidth * 3, vertical: blockHeight * 2),
      child: CustomScrollView(slivers: [
        SliverFillRemaining(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: blockHeight * 2),
                child: SizedBox(
                  height: blockHeight * 4,
                  width: double.infinity,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: sectionCommunity.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedTextIndex = index;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: _selectedTextIndex == index
                                  ? kGreenColor
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: IntrinsicWidth(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: blockWidth * 4,
                                ),
                                child: Center(
                                  child: Text(
                                    sectionCommunity[index],
                                    style: Styles.textStyle16Inter.copyWith(
                                      color: _selectedTextIndex == index
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: sectionCommunity.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _selectedTextIndex = index;
                    });
                  },
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return _buildSelectedListView();
                  },
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
