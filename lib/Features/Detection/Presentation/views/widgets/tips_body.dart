import 'package:flutter/material.dart';
import 'package:ghosn_app/Features/Detection/Presentation/views/camera_detect.dart';
import 'package:ghosn_app/core/utils/style.dart';
import '../../../../../core/widgets/custom_button.dart';

class TipsBody extends StatelessWidget {
  TipsBody({super.key});

  final List<Map<String, dynamic>> imagesWithText = [
    {
      'image': 'assets/images/image 8.png',
      'text': 'So Far',
      'icon': Icons.close_sharp
    },
    {
      'image': 'assets/images/image 5.png',
      'text': 'So Close',
      'icon': Icons.close_sharp
    },
    {
      'image': 'assets/images/image 6.png',
      'text': 'Hazy',
      'icon': Icons.close_sharp
    },
    {
      'image': 'assets/images/image 9.png',
      'text': 'Several plants',
      'icon': Icons.close_sharp
    },
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    double blocHeight = (height / 100);
    double blocWidth = (width / 100);
    return Padding(
      padding: EdgeInsets.only(
          left: blocHeight * 3.5, top: blocWidth * 3, right: blocHeight * 3.5),
      child: Column(
        children: [
          Container(
            width: width * 3,
            height: height * .285,
            decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(
                    "assets/images/image 50.png",
                  ),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(30)),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: blocWidth * 6,
                right: blocWidth * 6,
                top: blocWidth * 3,
                bottom: blocWidth * 4),
            child: const Divider(
              color: Color.fromRGBO(83, 172, 95, 1),
              thickness: 2,
              indent: 8,
              endIndent: 8,
            ),
          ),
          const Text(
            "The following will cause bad results:",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: blocWidth * 4),
              child: GridView.builder(
                itemCount: imagesWithText.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 18.0,
                  mainAxisSpacing: 18.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: [
                        Container(
                          height: height * .150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            image: DecorationImage(
                              image:
                                  AssetImage(imagesWithText[index]['image']!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              imagesWithText[index]['icon'],
                              size: 30,
                              color: Colors.red,
                            ),
                            SizedBox(
                                width:
                                    width * .02), // Space between icon and text
                            Text(
                              imagesWithText[index]['text']!,
                              style: Styles.textStyle16Inter,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          CustomButton(
            text: 'OK',
            height: 48,
            width: 150,
          onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Camera()),
                );
              },
          )
        ],
      ),
    );
  }
}
