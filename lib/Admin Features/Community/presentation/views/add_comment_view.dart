import 'package:flutter/material.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';

import 'widgets/add_comment_body.dart';

class AddComment extends StatelessWidget {
  const AddComment({super.key});

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
      ),
      body: const SafeArea(
        child: AddCommentBody(),
      ),
    );
  }
}
