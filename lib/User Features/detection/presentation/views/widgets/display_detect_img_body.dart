import 'dart:io';

import 'package:flutter/material.dart';

import 'package:ghosn_app/core/widgets/custom_button.dart';

import '../detect_result.dart';

class DisplayPictureScreenBody extends StatelessWidget {
  final String imagePath;
  const DisplayPictureScreenBody({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    double blocHeight = (height / 100);
    double blocWidth = (width / 100);
    return Padding(
      padding: EdgeInsets.only(left: blocHeight * 3, right: blocHeight * 3),
      child: Column(
        children: [
          Container(
            width: width * .88, // Adjust width as needed
            height: height * .66, // Adjust height as needed
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                image: FileImage(File(imagePath)),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: height * .01),
           CustomButton(
            text: "Identify the plant",
            width: 265,
            height: 50,
             onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DetectResult()),
                );
              },
          ),
        
          CustomButton(
            text: "Identify plants disease ",
            width: 265,
            height: 50,
             onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DetectResult()),
                );
              },

          ),
        ],
      ),
    );
  }
}
