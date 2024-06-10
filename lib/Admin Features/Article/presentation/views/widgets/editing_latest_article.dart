import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../User Features/Article/data/model/article_model.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/style.dart';

class EditingLatestArticle extends StatelessWidget {
  const EditingLatestArticle({
    super.key,
    required this.articlesModel,
    this.onPressed,
    this.publishArticle,
  });
  final AllArticles articlesModel;
  final void Function()? onPressed;
  final void Function()? publishArticle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            '${articlesModel.slug}',
            style: Styles.textStyle16Inter.copyWith(
              fontSize: 14,
            ),
            maxLines: 1,
            overflow: TextOverflow.clip,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.edit,
            size: 20,
            color: kGreenColor,
          ),
        ),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.delete,
            size: 20,
            color: kGreenColor,
          ),
        ),
        Expanded(
          child: IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SimpleDialog(
                      backgroundColor: Colors.white,
                      title: const Text(
                        'Are you sure to publish it?',
                        textAlign: TextAlign.center,
                        style: Styles.textStyle18Inter,
                      ),
                      children: [
                        const Divider(),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: Theme.of(context).textTheme.labelLarge,
                          ),
                          onPressed: publishArticle,
                          child: Text(
                            'YES',
                            style: Styles.textStyle18Inter.copyWith(
                              color: kGreenColor,
                            ),
                          ),
                        ),
                        const Divider(),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: Theme.of(context).textTheme.labelLarge,
                          ),
                          child: Text(
                            'NO',
                            style: Styles.textStyle18Inter.copyWith(
                              color: Colors.red,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  });
            },
            icon: const Icon(
              FontAwesomeIcons.ellipsis,
              size: 20,
              color: kGreenColor,
            ),
          ),
        ),
      ],
    );
  }
}
