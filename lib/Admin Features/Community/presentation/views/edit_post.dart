import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/Admin%20Features/Community/data/model/post_model/post_model.dart';
import 'package:ghosn_app/Admin%20Features/Community/presentation/views/widgets/edit_post_body.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';

import '../../../../core/utils/style.dart';
import '../../../../translations/local_keys.g.dart';

class EditPostView extends StatelessWidget {
  const EditPostView({super.key, required this.editPost});
  final MyPosts editPost;
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
         LocaleKeys.EditPost.tr(),
          style: Styles.textStyle18Inter.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: EditPostBody(
          editPost: editPost,
        ),
      ),
    );
  }
}
