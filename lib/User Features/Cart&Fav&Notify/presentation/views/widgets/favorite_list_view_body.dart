import 'package:flutter/material.dart';
import 'package:ghosn_app/User%20Features/Cart&Fav&Notify/presentation/views/widgets/favorite_item.dart';

class FavoriteListViewBody extends StatelessWidget {
  const FavoriteListViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 15,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: blockWidth * 7, vertical: blockHeight * 1),
            child: const FavoriteItem(),
          );
        });
  }
}
