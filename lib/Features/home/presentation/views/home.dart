import 'package:flutter/material.dart';
import 'package:ghosn_app/Features/home/presentation/views/widgets/Page2.dart';
import 'package:ghosn_app/Features/home/presentation/views/widgets/Page3.dart';
import 'package:ghosn_app/Features/home/presentation/views/widgets/pageView1.dart';

import '../../../../core/widgets/custom_text_field.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Welcome,User",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none_outlined,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart_outlined,
                size: 30,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffFAF6F6),
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 4,
                            color: Colors.black12,
                            offset: Offset(0, 4))
                      ],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: CustomTextFelid(
                      hinText: 'Search',
                      width: 0,
                      color: Colors.transparent,
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search_rounded,
                          size: 30,
                        ),
                      ),
                    ),
                  )),
                  Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                        color: const Color(0xffFAF6F6),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 4,
                              color: Colors.black12,
                              offset: Offset(0, 4))
                        ],
                        borderRadius: BorderRadius.circular(30)),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.filter_list_rounded,
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: _controller,
                children: const [Page1(), Page2(), Page3()],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          height: 50,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 50,
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/images/image 10.jpg"),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 50,
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/images/image 11.jpg"),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 50,
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/images/image 22.jpg"),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 50,
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/images/image 9.jpg"),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 50,
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/images/image 38.jpg"),
                ),
              ),
            ],
          ),
        ));
  }
}
