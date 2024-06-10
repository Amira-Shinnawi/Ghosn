import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../../User Features/Article/data/model/article_model.dart';
import '../../../../../User Features/Article/presentation/views/article_detalis.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/functions/network_image_handler.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_network_image.dart';
import 'editing_latest_article.dart';

class LatestArticleItem extends StatelessWidget {
  const LatestArticleItem({
    super.key,
    required this.articlesModel,
    required this.gClient, this.onPressed, this.publishArticle,
  });
  final AllArticles articlesModel;
  final ValueNotifier<GraphQLClient> gClient;
final void Function()? onPressed;
  final void Function()? publishArticle;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blocHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blocWidth = (width / 100);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: blocHeight * 1),
      child: Container(
        height: blocHeight * 17,
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
                child: CustomNetworkImage(
                  imageUrl: NetworkHandler()
                      .getImage('${articlesModel.releventImgUrl}'),
                  aspectRatio: 1.5 / 2,
                ),
              ),
              SizedBox(
                width: blocWidth * 3,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      EditingLatestArticle(
                        articlesModel: articlesModel,
                        onPressed: onPressed,
                        publishArticle:publishArticle ,
                      ),
                      SizedBox(
                        height: blocHeight * 1,
                      ),
                      Text(
                        '${articlesModel.title}',
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
                            return ArticleDetails(
                              articlesModel: articlesModel,
                            );
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
