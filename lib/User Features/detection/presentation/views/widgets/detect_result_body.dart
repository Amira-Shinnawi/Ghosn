import 'package:flutter/material.dart';

import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_detect_row.dart';

class DetectResultBody extends StatelessWidget {
  const DetectResultBody({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    double blocHeight = (height / 100);

    return SingleChildScrollView(
        child: Stack(
      children: [
        Positioned(
          top: blocHeight * .2,
          left: blocHeight * 2,
          right: blocHeight * 2,
          child: Container(
            width: width * .93,
            height: height * .3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              image: const DecorationImage(
                image: AssetImage("assets/images/image 66.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Positioned(
          left: blocHeight * 1.3,
          top: blocHeight * 22,
          child: Container(
            width: width * .4,
            height: height * .17,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              image: const DecorationImage(
                image: AssetImage("assets/images/image 16.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: blocHeight * 1.5,
              right: blocHeight * 1.3,
              top: blocHeight * 33),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: blocHeight * 19, bottom: blocHeight * 2.5),
                child: const Text(
                  "Picture of a healthy plant",
                  style: Styles.textStyle16Inter,
                ),
              ),
              const DetectResultRow(
                label: "Plant disease:",
                value: 'Name of the disease',
              ),
              const DetectResultRow(
                label: "Symptoms:",
                value:
                    'The most famous symptoms of the disease in each part of the plant in detail.',
              ),
              const DetectResultRow(
                label: "The causes of disease:",
                value:
                    'The reasons that led to the occurrence of the disease and the appearance of its symptoms',
              ),
              const DetectResultRow(
                label: "Treatment method::",
                value:
                    'A treatment method, whether using a natural, chemical, or other fertilizer.',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "For details about the plant",
                    style: Styles.textStyle16,
                  ),
                  SizedBox(width: width * .01),
                  const Text(
                    "click here",
                    style: Styles.textStyle16green,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
