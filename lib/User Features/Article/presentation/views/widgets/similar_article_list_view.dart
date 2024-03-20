import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/style.dart';

class SimilarArticleListView extends StatefulWidget {
  const SimilarArticleListView({
    super.key,
  });

  @override
  State<SimilarArticleListView> createState() => _SimilarArticleListViewState();
}

class _SimilarArticleListViewState extends State<SimilarArticleListView> {
  bool showReadMore = false;
  int clickedIndex = -1;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blocHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blocWidth = (width / 100);

    List<String> imageAssets = [
      AssetsData.article,
      AssetsData.article,
      AssetsData.article,
      AssetsData.article,
      AssetsData.article
    ];

    return SizedBox(
      height: blocHeight * 15,
      child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: imageAssets.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  showReadMore = index == clickedIndex ? !showReadMore : true;
                  clickedIndex = index;
                });
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: blocWidth * 1.5,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: AspectRatio(
                          aspectRatio: 1 / 1.6,
                          child: Image.asset(
                            imageAssets[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: blocHeight * .5,
                    ),
                    Text(
                      'Article Title',
                      style: Styles.textStyle16Inter.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    if (showReadMore && clickedIndex == index)
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kGreenColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            minimumSize: const Size(30, 30),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Read Now',
                            style: Styles.textStyle16Inter.copyWith(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          )),
                  ],
                ),
              ),
            );
          })),
    );
  }
}
