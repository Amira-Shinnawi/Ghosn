import 'package:flutter/material.dart';
import 'package:ghosn_app/Features/home/presentation/views/widgets/Page2.dart';
import 'package:ghosn_app/Features/home/presentation/views/widgets/Page3.dart';
import 'package:ghosn_app/Features/home/presentation/views/widgets/bottomBar.dart';
import 'package:ghosn_app/Features/home/presentation/views/widgets/pageView1.dart';
import 'package:ghosn_app/Features/home/presentation/views/widgets/search&menu.dart';

class gardens extends StatelessWidget {
  gardens({super.key});

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
              icon: Icon(Icons.shopping_cart),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          ],
        ),
        body: Column(
          children: [
            Padding(padding: const EdgeInsets.all(8.0), child: searchPmenu()),
            Expanded(
              child: PageView(
                controller: _controller,
                children: const [
                  Page2(),
                  Page3(),
                  Page1(),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: bottomBar());
  }
}
