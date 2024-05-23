import 'package:flutter/material.dart';

import 'all_category_section.dart';
import 'best_seller_list_view.dart';
import 'filter.dart';
import 'header_home_body.dart';
import 'popular_plant_home.dart';
import 'title_with_more_button.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);

    return SingleChildScrollView(
      child: Column(
        children: [
          const HeaderWithSearchField(),
          TitleWithMoreButton(
              title: "Popular Plant",
              morePressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) {
                      return const Filter();
                    });
              }),
          SizedBox(
            height: blockHeight * 2,
          ),
          const AllCategorySection(),
          SizedBox(
            height: blockHeight * 2,
          ),
          const PopularPlant(),
          TitleWithMoreButton(
              title: 'Best Seller',
              morePressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) {
                      return const Filter();
                    });
              }),
          const BestSellerListView(),
        ],
      ),
    );
  }
}
