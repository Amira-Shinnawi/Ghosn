import 'package:flutter/material.dart';
import 'package:ghosn_app/Features/home/presentation/views/widgets/Page2.dart';
import 'package:ghosn_app/Features/home/presentation/views/widgets/Page3.dart';
import 'package:ghosn_app/Features/home/presentation/views/widgets/bottomBar.dart';
import 'package:ghosn_app/Features/home/presentation/views/widgets/pageView1.dart';
import 'package:ghosn_app/Features/home/presentation/views/widgets/search&menu.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

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
              icon: Icon(Icons.shopping_cart_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_outlined),
            )
          ],
        ),
        body: Column(
          children: [
            Padding(padding: const EdgeInsets.all(8.0), child: searchPmenu()),
            Expanded(
              child: PageView(
                controller: _controller,
                children: const [
                  Page1(),
                  Page3(),
                  Page2(),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: bottomBar());
  }
}
