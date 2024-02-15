import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  String imaGe = 'assets/images/image 30.png';
  int count = 0;
  double bottom = .4;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green, actions: [
        IconButton(
          onPressed: () {},
          icon: Image.asset("assets/images/image 24.png"),
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Image.asset("assets/images/image 27.png"),
        )
      ]),
      body: Stack(children: [
        Container(
            child: Padding(
              padding: EdgeInsets.only(
                right: .7 * width,
              ),
              child: Column(
                children: [
                  SizedBox(height: 15),
                  Text('الحرارة:', style: TextStyle(color: Colors.white)),
                  Text('19-29 C',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                  SizedBox(height: 15),
                  Text('الرطوبة', style: TextStyle(color: Colors.white)),
                  Text('إلي %70',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                  SizedBox(height: 15),
                  Text('ضوء الشمس', style: TextStyle(color: Colors.white)),
                  Text('30%',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                  SizedBox(height: 15),
                  Text('الارتفاع', style: TextStyle(color: Colors.white)),
                  Text('30cm',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                  SizedBox(height: 15)
                ],
              ),
            ),
            height: .5 * height,
            width: width * 2,
            color: Colors.green),
        Container(
            height: .6 * height,
            width: width,
            margin: EdgeInsets.only(top: .35 * height),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 30, right: 20, left: 20),
              child: Column(children: [
                Row(children: [
                  Text('الثعبان الفضي',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Spacer(),
                  Text('لون الوعاء', style: TextStyle(fontSize: 20))
                ]),
                Row(children: [
                  Text('150 l.e',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      imaGe = 'assets/images/na 2.png';
                      bottom = .48;
                      setState(() {});
                    },
                    icon: Image.asset("assets/images/Ellipse 2.png"),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        imaGe = 'assets/images/image 30.png';
                        bottom = .4;
                      });
                    },
                    icon: Image.asset("assets/images/Ellipse 4.png"),
                  )
                ]),
                Row(
                  children: [
                    Text('التفاصيل:', style: TextStyle(fontSize: 20)),
                  ],
                ),
                Text(
                    "يحتوي هذا النبات على أوراق طويلة عريضة مع خطوط خضراء داكنة على الحواف",
                    style: TextStyle(fontSize: 20)),
                Row(
                  children: [
                    Text('لمزيد من المعلومات', style: TextStyle(fontSize: 20)),
                    Text('اضغط هنا',
                        style: TextStyle(
                            fontSize: 20, decoration: TextDecoration.underline))
                  ],
                ),
                Row(
                  children: [
                    Text('صور أخرى',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  ],
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Row(children: [
                        SizedBox(
                            height: 150,
                            width: 100,
                            child: Image.asset(
                                'assets/images/61S-WJnu7wL._AC_UL320_ 1.jpg')),
                        Spacer(),
                        SizedBox(
                            height: 150,
                            width: 100,
                            child: Image.asset(
                                'assets/images/61S-WJnu7wL._AC_UL320_ 1.jpg')),
                        Spacer(),
                        SizedBox(
                            height: 150,
                            width: 100,
                            child: Image.asset(
                                'assets/images/61S-WJnu7wL._AC_UL320_ 1.jpg'))
                      ])
                    ],
                  ),
                )
              ]),
            )),
        Padding(
          padding: EdgeInsets.only(bottom: bottom * height, left: .2 * width),
          child: Image.asset(imaGe),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 610,
          ),
          child: Container(
              color: Colors.white,
              child: Expanded(
                child: Row(
                  children: [
                    Image.asset('assets/images/Group 70.png'),
                    Spacer(),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: IconButton(
                        onPressed: () {
                          count++;
                          setState(() {});
                        },
                        icon: Image.asset("assets/images/image 17.jpg"),
                      ),
                    ),
                    Text('$count'),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: IconButton(
                        onPressed: () {
                          count--;
                          setState(() {});
                        },
                        icon: Image.asset("assets/images/image 18.jpg"),
                      ),
                    ),
                  ],
                ),
              )),
        )
      ]),
    );
  }
}
