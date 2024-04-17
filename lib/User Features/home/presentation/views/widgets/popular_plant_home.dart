import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/assets_data.dart';

class PopularPlant extends StatelessWidget {
  const PopularPlant({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    return SizedBox(
        height: blockHeight * 35,
        width: double.infinity,
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                  left: blockWidth * 5,
                  top: blockHeight * 2,
                  bottom: blockHeight * 2,
                ),
                width: blockWidth * 45,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 2 / 2,
                        child: Image.asset(
                          AssetsData.signUpImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: blockWidth * 2,
                              vertical: blockHeight * 1),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 10),
                                blurRadius: 50,
                                color: kGreenColor.withOpacity(0.23),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Samantha\n".toUpperCase(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    TextSpan(
                                      text: "Indoor".toUpperCase(),
                                      style: TextStyle(
                                        color: kGreenColor.withOpacity(0.5),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                '400.EGP',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(color: kGreenColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
