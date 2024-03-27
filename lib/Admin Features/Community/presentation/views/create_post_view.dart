import 'package:flutter/material.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';

import '../../../../core/utils/style.dart';
import 'widgets/create_post_body.dart';

class CreatePostView extends StatelessWidget {
  const CreatePostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
            ),
          ),
          titleAppBar: Text(
            'Create Post',
            style: Styles.textStyle20Inter.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: false,
          actions: [
            TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SimpleDialog(
                          backgroundColor: Colors.white,
                          title: const Text(
                            'Are You Sure!\n You want to post it',
                            textAlign: TextAlign.center,
                            style: Styles.textStyle18Inter,
                          ),
                          children: [
                            const Divider(),
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle:
                                    Theme.of(context).textTheme.labelLarge,
                              ),
                              child: Text(
                                'Post',
                                style: Styles.textStyle18Inter.copyWith(
                                  color: kGreenColor,
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            const Divider(),
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle:
                                    Theme.of(context).textTheme.labelLarge,
                              ),
                              child: Text(
                                'Cancel',
                                style: Styles.textStyle18Inter.copyWith(
                                  color: Colors.red,
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      });
                },
                child: Text(
                  'Post',
                  style: Styles.textStyle16Inter.copyWith(
                    color: kGreenColor,
                  ),
                ))
          ]),
      body: const CreatePostBody(),
    );
  }
}
