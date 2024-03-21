import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/utils/functions/controller.dart';
import 'Page2.dart';
import 'Page3.dart';
import 'pageView1.dart';

class categoriesBar extends StatelessWidget {
  categoriesBar(
      {super.key,
      required this.color1,
      required this.color2,
      required this.color3});
  final Color color1;
  final Color color2;
  final Color color3;
  main_controller controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(children: [
        GestureDetector(
          onTap: () {
            controller.articl = [
              Page1(
                i1: 'assets/images/image 16.jpg',
                n1: 'silver snak plant',
                p1: 150,
              ),
              Page2(i2: 'assets/images/image 20.jpg', n2: 'tree', p2: 150),
              Page3(
                i3: 'assets/images/image 21.jpg',
                n3: 'red flowers',
                p3: 150,
              )
            ];
            controller.update();
          },
          child: Container(
            color: color1,
            child: const Text('indoor plants'),
          ),
        ),
        const Spacer(),
        GestureDetector(
            onTap: () {
              controller.articl = [
                Page2(i2: 'assets/images/image 20.jpg', n2: 'tree', p2: 150),
                Page3(
                  i3: 'assets/images/image 21.jpg',
                  n3: 'red flowers',
                  p3: 150,
                ),
                Page1(
                  i1: 'assets/images/image 16.jpg',
                  n1: 'silver snak plant',
                  p1: 150,
                )
              ];
              controller.update();
            },
            child: Container(color: color2, child: const Text('gardens'))),
        const Spacer(),
        GestureDetector(
            onTap: () {
              controller.articl = [
                Page3(
                  i3: 'assets/images/image 21.jpg',
                  n3: 'red flowers',
                  p3: 150,
                ),
                Page1(
                  i1: 'assets/images/image 16.jpg',
                  n1: 'silver snak plant',
                  p1: 150,
                ),
                Page2(i2: 'assets/images/image 20.jpg', n2: 'tree', p2: 150)
              ];
              controller.update();
            },
            child: Container(color: color3, child: const Text('bloombing')))
      ]),
    );
  }
}
