import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart' as http;

import '../../../../../User Features/Article/data/model/article_model.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/Api_Key.dart';
import '../../../../../core/utils/functions/graph_ql_config.dart';
import 'latest_article_item.dart';

class ArticleItemListView extends StatefulWidget {
  const ArticleItemListView({
    super.key,
    required this.searchQuery,
  });
  final String searchQuery;

  @override
  State<ArticleItemListView> createState() => _ArticleItemListViewState();
}

class _ArticleItemListViewState extends State<ArticleItemListView> {
  ValueNotifier<GraphQLClient> gClient = GraphQLConfigration();

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: gClient,
      child: Query(
        options: QueryOptions(
          document: gql(r"""
              query allArticles($published: Boolean,$contains:String) {
                    allArticles(where: { published: { eq: $published }, title: { contains: $contains } }) {
                      id
                      introImgUrl
                      publishDate
                      published
                      ReleventImgUrl
                      slug
                      title
                      sections {
                        contentText
                        heading
                        imgUrl
                        ReleventImgUrl
                        sequence
                      }
                      tags {
                        articleId
                        tagId
                      }
                      author {
                        firstName
                        image
                        ReleventImgUrl
                        userName
                        id
                        lastName
                      }
                    }
                  }
      """),
          variables: {"published": false, "contains": widget.searchQuery},
        ),
        builder: (result, {fetchMore, refetch}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }
          if (result.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          List<AllArticles>? articles =
              ArticleModel.fromJson(result.data!).allArticles;
          return RefreshIndicator(
            onRefresh: () async {
              await refetch?.call();
            },
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemCount: articles!.length,
                itemBuilder: (context, index) {
                  AllArticles allArticles = articles[index];

                  final isOddIndex = index % 2 == 1;
                  final textDirection =
                      isOddIndex ? TextDirection.rtl : TextDirection.ltr;
                  return Directionality(
                    textDirection: textDirection,
                    child: LatestArticleItem(
                      articlesModel: allArticles,
                      gClient: gClient,
                      onPressed: () {
                        deleteArticle(allArticles.slug.toString())
                            .then((response) {
                          refetch!();
                        });
                      },
                      publishArticle: () {
                        publishArticle(allArticles.id!).then((response) {
                          refetch!();
                        });
                      },
                    ),
                  );
                }),
          );
        },
      ),
    );
  }

  Future<http.Response> deleteArticle(String articleSlug) async {
    var response = await http.delete(
      Uri.parse("${ApiKeys.BASE_URL}/api/Article/$articleSlug/delete"),
      headers: {
        'Authorization': 'Bearer $userToken',
      },
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }

  Future<void> publishArticle(int articleId) async {
    var headers = {'Authorization': 'Bearer $userToken'};
    var dio = Dio();
    var response = await dio.request(
      '${ApiKeys.BASE_URL}/api/Article/Publish/$articleId',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }
  }
}
