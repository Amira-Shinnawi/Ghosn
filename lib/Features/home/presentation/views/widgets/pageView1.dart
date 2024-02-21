import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(children: [
              Container(
                color: const Color(0xffEBF8E2),
                child: const Text('نباتات منزلية'),
              ),
              const Spacer(),
              Container(child: const Text('حدائق')),
              const Spacer(),
              Container(child: const Text('مزهرة'))
            ]),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Row(
              children: [
                Text(
                  'عروض تصل الى 30% ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
          const SizedBox(
              width: 330,
              height: 200,
              child: Image(image: AssetImage('assets/images/Component 1.jpg'))),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: const Color(0xffF0F0F0),
                    width: 155,
                    height: 240,
                    child: const Column(
                      children: [
                        Image(image: AssetImage('assets/images/image 16.jpg')),
                        Text('الثعبان الفضي',
                            style: TextStyle(
                              fontSize: 20,
                            )),
                        Text('150 e.l',
                            style: TextStyle(
                              fontSize: 20,
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    color: const Color(0xffF0F0F0),
                    width: 155,
                    height: 240,
                    child: const Column(
                      children: [
                        Image(image: AssetImage('assets/images/image 16.jpg')),
                        Text('الثعبان الفضي',
                            style: TextStyle(
                              fontSize: 20,
                            )),
                        Text('150 e.l',
                            style: TextStyle(
                              fontSize: 20,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          )
        ],
      ),
    );
  }
}
