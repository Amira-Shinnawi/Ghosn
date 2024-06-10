import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/User%20Features/Article/data/model/article_model.dart';
import 'package:ghosn_app/core/utils/functions/network_image_handler.dart';
import 'package:ghosn_app/core/widgets/custom_network_image.dart';

class ArticleDetailsListView extends StatelessWidget {
  const ArticleDetailsListView({
    super.key,
    required this.articlesModel,
  });
  final AllArticles articlesModel;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blocHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blocWidth = (width / 100);

    DateTime dateTime = DateTime.parse(articlesModel.publishDate!);
    String dateOnly = DateFormat('yyyy-MM-dd').format(dateTime);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${articlesModel.title}',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
          maxLines: 2,
          overflow: TextOverflow.clip,
        ),
        SizedBox(
          height: blocHeight * 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CircleAvatar(
                child: CustomNetworkImage(
                  imageUrl: NetworkHandler()
                      .getImage('${articlesModel.author!.releventImgUrl}'),
                  aspectRatio: 1,
                ),
              ),
            ),
            SizedBox(
              width: blocWidth * 3,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${articlesModel.author!.firstName} ${articlesModel.author!.lastName}',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
                Text(
                  dateOnly,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.grey,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: blocHeight * 2,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CustomNetworkImage(
            imageUrl:
                NetworkHandler().getImage('${articlesModel.releventImgUrl}'),
            aspectRatio: 2 / 1,
          ),
        ),
      ],
    );
  }
}
