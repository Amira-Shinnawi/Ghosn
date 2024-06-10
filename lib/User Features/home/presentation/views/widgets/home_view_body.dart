import 'package:flutter/material.dart';

import '../../../../../core/utils/style.dart';
import 'best_seller_list_view.dart';
import 'header_home_body.dart';
import 'plant_pots.dart';
import 'popular_plant_home.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  String searchQuery = '';
  String filterCategoryName = '';
  String filterPrice = "ASC";
  String filterSoilType = "LOAMY";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderWithSearchField(
            onSubmitted: (value) {
              setState(() {
                searchQuery = value;
              });
            },
          ),
          SizedBox(
            height: blockHeight * 2,
          ),
          PopularPlants(
            searchQuery: searchQuery,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: blockWidth * 5),
            child: const Text(
              'Plant Pots',
              style: Styles.textStyle18Inter,
            ),
          ),
          PlantPots(
            searchQuery: searchQuery,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: blockWidth * 5),
            child: const Text(
              'Best Seller',
              style: Styles.textStyle18Inter,
            ),
          ),
          const BestSellerListView(),
        ],
      ),
    );
  }
}
