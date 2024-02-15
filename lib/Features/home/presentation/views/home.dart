import 'package:flutter/material.dart';
import 'package:ghosn_app/Features/home/presentation/views/widgets/Page2.dart';
import 'package:ghosn_app/Features/home/presentation/views/widgets/Page3.dart';
import 'package:ghosn_app/Features/home/presentation/views/widgets/pageView1.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "مرحبا,المستخدم",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Image.asset("assets/images/image 13.jpg"),
            ),
            IconButton(
                onPressed: () {},
                icon: Image.asset("assets/images/image 12.jpg")),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    width: 230,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Color(0xffFAF6F6),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 4,
                              color: Colors.black12,
                              offset: Offset(0, 4))
                        ],
                        borderRadius: BorderRadius.circular(30)),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'بحث',
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Color(0xffFAF6F6),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 4,
                              color: Colors.black12,
                              offset: Offset(0, 4))
                        ],
                        borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/images/image 14.png')),
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
              Spacer(),
              SizedBox(
                width: 50,
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/images/image 11.jpg"),
                ),
              ),
              Spacer(),
              SizedBox(
                width: 50,
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/images/image 22.jpg"),
                ),
              ),
              Spacer(),
              SizedBox(
                width: 50,
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/images/image 9.jpg"),
                ),
              ),
              Spacer(),
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
