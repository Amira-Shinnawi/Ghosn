import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/User%20Features/Account/presentation/views/widgets/follower_list_view.dart';
import 'package:ghosn_app/User%20Features/Account/presentation/views/widgets/following_list_view.dart';
import 'package:ghosn_app/Admin%20Features/Community/presentation/views/widgets/post_list_view.dart';
import 'package:ghosn_app/User%20Features/Account/presentation/views/widgets/purchase_list_view.dart';
import 'package:ghosn_app/constants.dart';

import '../../../../../core/utils/style.dart';
import '../../../../../translations/local_keys.g.dart';

class HistoryProfileItems extends StatefulWidget {
  const HistoryProfileItems({super.key});

  @override
  State<HistoryProfileItems> createState() => _HistoryProfileItemsState();
}

class _HistoryProfileItemsState extends State<HistoryProfileItems> {
  int _selectedTextIndex = 0;
  late final PageController _pageController = PageController(
    initialPage: _selectedTextIndex,
  );

  List<String> historyList = [
    LocaleKeys.posts.tr(),
    LocaleKeys.purchases.tr(),
    LocaleKeys.followers.tr(),
    LocaleKeys.following.tr(),
  ];
  Widget _buildSelectedListView() {
    switch (_selectedTextIndex) {
      case 0:
        return const PostsListView();
      case 1:
        return const PurchasesListView();
      case 2:
        return const FollowersListView();
      default:
        return const FollowingListView();
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: blockHeight * 2),
          child: SizedBox(
            height: blockHeight * 4,
            width: double.infinity,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: historyList.length,
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
                              historyList[index],
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
        Container(
          width: double.infinity,
          height: blockHeight * 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: historyList.length,
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
    );
  }
}
