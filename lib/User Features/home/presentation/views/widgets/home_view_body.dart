import 'package:flutter/material.dart';

import 'all_category_section.dart';
import 'header_home_body.dart';
import 'popular_plant_home.dart';
import 'title_with_more_button.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);

    return SingleChildScrollView(
      child: Column(
        children: [
          const HeaderWithSearchField(),
          TitleWithMoreButton(title: "Popular Plant", morePressed: () {}),
          SizedBox(
            height: blockHeight * 2,
          ),
          const AllCategorySection(),
          SizedBox(
            height: blockHeight * 4,
          ),
          const PopularPlant()
        ],
      ),
    );
  }
}
