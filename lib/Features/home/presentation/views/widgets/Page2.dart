import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(children: [
              Container(
                child: const Text('نباتات منزلية'),
              ),
              const Spacer(),
              Container(color: Color(0xffEBF8E2), child: const Text('حدائق')),
              const Spacer(),
              Container(child: const Text('مزهرة'))
            ]),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Color(0xffF0F0F0),
                    width: 155,
                    height: 240,
                    child: Column(
                      children: [
                        Image(image: AssetImage('assets/images/image 20.jpg')),
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
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    color: Color(0xffF0F0F0),
                    width: 155,
                    height: 240,
                    child: Column(
                      children: [
                        Image(image: AssetImage('assets/images/image 20.jpg')),
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
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Color(0xffF0F0F0),
                    width: 155,
                    height: 240,
                    child: Column(
                      children: [
                        Image(image: AssetImage('assets/images/image 20.jpg')),
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
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    color: Color(0xffF0F0F0),
                    width: 155,
                    height: 240,
                    child: Column(
                      children: [
                        Image(image: AssetImage('assets/images/image 20.jpg')),
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
          ),
        ],
      ),
    );
  }
}
