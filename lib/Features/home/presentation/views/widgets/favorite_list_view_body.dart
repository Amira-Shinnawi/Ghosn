import 'package:flutter/material.dart';
import 'package:ghosn_app/Features/home/presentation/views/widgets/favorite_item.dart';

class FavoriteListViewBody extends StatelessWidget {
  const FavoriteListViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 15,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 37, vertical: 13),
            child: FavoriteItem(),
          );
        });
  }
}
