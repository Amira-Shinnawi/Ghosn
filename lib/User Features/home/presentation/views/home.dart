import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghosn_app/Features/home/presentation/views/widgets/bottomBar.dart';
import 'package:ghosn_app/Features/home/presentation/views/widgets/search&menu.dart';

import '../../../../core/utils/functions/controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  main_controller controller = Get.put(main_controller());
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
        body: GetBuilder<main_controller>(
            init: main_controller(),
            builder: (controller) {
              return Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0), child: searchPmenu()),
                  Expanded(
                    child: PageView(
                      controller: _controller,
                      children: controller.articl,
                    ),
                  ),
                ],
              );
            }),
        bottomNavigationBar: bottomBar());
  }
}
