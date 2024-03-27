import 'package:flutter/material.dart';

import '../../../../constants.dart';
import 'widgets/categoriesBar.dart';
import 'widgets/search&menu.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: const Text(
          "Hi , user",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          )
        ],
      ),
      body: Expanded(
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.all(8.0), child: searchPmenu()),
            categoriesBar()
          ],
        ),
      ),
    );
  }
}
