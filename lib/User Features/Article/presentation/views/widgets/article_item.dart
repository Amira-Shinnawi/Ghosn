import 'package:flutter/material.dart';
import 'package:ghosn_app/User%20Features/Article/data/model/article_model.dart';
import 'package:ghosn_app/User%20Features/Article/presentation/views/article_detalis.dart';
import 'package:ghosn_app/core/utils/functions/network_image_handler.dart';
import 'package:ghosn_app/core/widgets/custom_network_image.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/style.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({
    super.key,
    required this.articlesModel,
    required this.gClient,
  });
  final AllArticles articlesModel;
  final ValueNotifier<GraphQLClient> gClient;

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
                      Text(
                        '${articlesModel.slug}',
                        style: Styles.textStyle16Inter,
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
