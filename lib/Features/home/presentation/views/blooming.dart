import 'package:flutter/material.dart';
import 'package:ghosn_app/Features/home/presentation/views/widgets/Page2.dart';
import 'package:ghosn_app/Features/home/presentation/views/widgets/Page3.dart';
import 'package:ghosn_app/Features/home/presentation/views/widgets/bottomBar.dart';
import 'package:ghosn_app/Features/home/presentation/views/widgets/pageView1.dart';
import 'package:ghosn_app/Features/home/presentation/views/widgets/search&menu.dart';

class blooming extends StatelessWidget {
  blooming({super.key});

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
              icon: Image.asset("assets/image 13.jpg"),
            ),
            IconButton(
                onPressed: () {}, icon: Image.asset("assets/image 12.jpg")),
          ],
        ),
        body: Column(
          children: [
            Padding(padding: const EdgeInsets.all(8.0), child: searchPmenu()),
            Expanded(
              child: PageView(
                controller: _controller,
                children: const [
                  Page3(),
                  Page1(),
                  Page2(),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: bottomBar());
  }
}
