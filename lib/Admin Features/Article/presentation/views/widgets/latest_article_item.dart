import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/style.dart';
import '../article_content.dart';
import 'editing_latest_article.dart';

class LatestArticleItem extends StatelessWidget {
  const LatestArticleItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blocHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blocWidth = (width / 100);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: blocHeight * 1),
      child: Container(
        height: blocHeight * 18,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: kGreenColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: blocHeight * .5, horizontal: blocWidth * 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: AspectRatio(
                  aspectRatio: 1.5 / 2,
                  child: Image.asset(
                    AssetsData.article,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: blocWidth * 2,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const EditingLatestArticle(),
                      const Text(
                        'Part of the article or a definition about it. Example (There is a mutual relationship between soil and plants. Fertile soil encourages plant growth by providing plants with nutrients and acting as a reservoir that holds water)',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kGreenColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          minimumSize: const Size(30, 30),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const ArticleContent();
                          }));
                        },
                        child: Text(
                          'Show Article',
                          style: Styles.textStyle16Inter.copyWith(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: blocHeight * .5,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
