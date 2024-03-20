import 'package:flutter/material.dart';
import 'package:ghosn_app/User%20Features/Article/presentation/views/widgets/article_item.dart';
import 'package:ghosn_app/core/widgets/custom_text_field.dart';

class ArticleHomeBody extends StatelessWidget {
  const ArticleHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blocHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blocWidth = (width / 100);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: blocWidth * 3, vertical: blocHeight * 1),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: blocHeight * .5,
              ),
              child: CustomTextFelid(
                prefixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  color: Colors.black.withOpacity(.5),
                ),
                hinText: 'What are you looking for?',
                width: 1,
                color: Colors.black.withOpacity(.3),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 15,
                itemBuilder: (context, index) {
                  final isOddIndex = index % 2 == 1;
                  final textDirection =
                      isOddIndex ? TextDirection.rtl : TextDirection.ltr;
                  return Directionality(
                    textDirection: textDirection,
                    child: const ArticleItem(),
                  );
                }),
          )
        ],
      ),
    );
  }
}
