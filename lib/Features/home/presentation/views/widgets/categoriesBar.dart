import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:ghosn_app/Features/home/data/categoryModel.dart';
import 'package:ghosn_app/Features/home/data/offersModel.dart';
import 'package:ghosn_app/Features/home/data/plantModel.dart';
import 'package:ghosn_app/Features/home/presentation/views/widgets/plantContainer.dart';

import '../../../../../constants.dart';

class categoriesBar extends StatefulWidget {
  categoriesBar({super.key});

  @override
  State<categoriesBar> createState() => _categoriesBarState();
}

class _categoriesBarState extends State<categoriesBar> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        children: [
          Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (int i = 0; i < categories.length; i++)
                      GestureDetector(
                          onTap: () {
                            setState(() => selectId = categories[i].id);
                          },
                          child: Container(
                            color: selectId == i ? kLightGreenColor : bgColor,
                            child: Text(categories[i].name),
                          ))
                  ])),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 100),
            child: Text(
              offerText,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 170,
              child: ImageSlideshow(
                children: [
                  Image.asset(offerimages[0]),
                  Image.asset(offerimages[0]),
                  Image.asset(offerimages[0])
                ],
                autoPlayInterval: 3000,
                isLoop: true,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              top: 10,
            ),
            child: Text(
              "plants",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
            ),
          ),
          Expanded(
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: plants.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return plantContainer(
                    plantModel: plants[index],
                  );
                }),
          )
        ],
      ),
    );
  }

  int selectId = 0;
}
