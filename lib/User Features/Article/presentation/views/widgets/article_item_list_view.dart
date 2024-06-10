import 'package:flutter/material.dart';
import 'package:ghosn_app/User%20Features/Article/data/model/article_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../../core/utils/functions/graph_ql_config.dart';
import 'article_item.dart';

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
          variables: {"published": true, "contains": widget.searchQuery},
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
          return ListView.builder(
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
                  child: ArticleItem(
                    gClient: gClient,
                    articlesModel: allArticles,
                  ),
                );
              });
        },
      ),
    );
  }
}
