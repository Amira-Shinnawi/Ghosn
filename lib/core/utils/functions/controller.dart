import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../Features/home/presentation/views/widgets/Page2.dart';
import '../../../Features/home/presentation/views/widgets/Page3.dart';
import '../../../Features/home/presentation/views/widgets/pageView1.dart';

class main_controller extends GetxController {
  List<Widget> articl = [
    Page1(
      i1: 'assets/images/image 16.jpg',
      n1: 'silver snak plant',
      p1: 150,
    ),
    Page2(
      i2: 'assets/images/image 20.jpg',
      n2: 'tree',
      p2: 150,
    ),
    Page3(
      i3: 'assets/images/image 21.jpg',
      n3: 'red flowers',
      p3: 150,
    )
  ];
}
