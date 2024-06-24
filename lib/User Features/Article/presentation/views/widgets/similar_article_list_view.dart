import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/User%20Features/Article/data/model/article_model.dart';
import 'package:ghosn_app/constants.dart';

import '../../../../../core/utils/Api_Key.dart';
import '../../../../../core/utils/functions/network_image_handler.dart';
import '../../../../../core/widgets/custom_network_image.dart';

class SimilarArticleListView extends StatefulWidget {
  const SimilarArticleListView({
    super.key,
    required this.articlesModel,
  });
  final AllArticles articlesModel;
  @override
  State<SimilarArticleListView> createState() => _SimilarArticleListViewState();
}

class _SimilarArticleListViewState extends State<SimilarArticleListView> {
  List<Sections>? _articles;

  @override
  void initState() {
    super.initState();
    _articles = widget.articlesModel.sections;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blocHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blocWidth = (width / 100);

    return SizedBox(
      height: blocHeight * 30,
      width: double.infinity,
      child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: _articles!.length,
          scrollDirection: Axis.vertical,
          itemBuilder: ((context, index) {
            Sections sections = widget.articlesModel.sections![index];

            final isOddIndex = index % 2 == 1;
            final textDirection =
                isOddIndex ? TextDirection.rtl : TextDirection.ltr;
            return Directionality(
              textDirection: textDirection,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: blocHeight * 2,
                ),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: double.infinity,
                        child: VerticalDivider(
                          color: kGreenColor,
                          thickness: 3,
                        ),
                      ),
                      SizedBox(
                        width: blocWidth * 1,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            widget.articlesModel.published == false
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${sections.heading}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          await deleteSection(
                                              widget.articlesModel.id!,
                                              sections.sequence!);
                                          setState(() {
                                            _articles!.remove(sections);
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          size: 20,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  )
                                : Text(
                                    '${sections.heading}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                            SizedBox(
                              height: blocHeight * .5,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: CustomNetworkImage(
                                imageUrl: NetworkHandler()
                                    .getImage('${sections.releventImgUrl}'),
                                aspectRatio: 2 / 1,
                              ),
                            ),
                            SizedBox(
                              height: blocHeight * .5,
                            ),
                            Text(
                              '${sections.contentText}',
                              style: Theme.of(context).textTheme.bodyMedium!,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          })),
    );
  }

  Future<void> deleteSection(int articleId, int sectionSequence) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $userToken'
    };
    var data = json
        .encode({"articleId": articleId, "sectionSequence": sectionSequence});
    var dio = Dio();
    var response = await dio.request(
      '${ApiKeys.BASE_URL}/api/Article/section/delete',
      options: Options(
        method: 'DELETE',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }
  }
}
