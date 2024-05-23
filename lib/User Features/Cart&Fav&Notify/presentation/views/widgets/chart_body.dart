import 'package:flutter/material.dart';
import 'package:ghosn_app/User%20Features/Cart&Fav&Notify/presentation/views/widgets/total_amount.dart';

import 'chart_item.dart';

class ShoppingCartBody extends StatefulWidget {
  const ShoppingCartBody({super.key});
  @override
  State<ShoppingCartBody> createState() => _ShoppingCartBodyState();
}

class _ShoppingCartBodyState extends State<ShoppingCartBody> {
  var selectedIndexes = [];

  @override
  Widget build(BuildContext context) {
    bool hasSelectedItems = selectedIndexes.isNotEmpty;

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 15,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return ChartItem(
                value: selectedIndexes.contains(index),
                onChanged: (context) {
                  if (selectedIndexes.contains(index)) {
                    setState(() {
                      selectedIndexes.remove(index);
                    });
                  } else {
                    setState(() {
                      selectedIndexes.add(index);
                    });
                  }
                },
              );
            },
          ),
        ),
        if (hasSelectedItems) const TotalAmount(),
      ],
    );
  }
}
