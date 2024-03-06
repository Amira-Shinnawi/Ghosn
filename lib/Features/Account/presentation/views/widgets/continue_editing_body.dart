import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/widgets/custom_button.dart';
import 'package:ghosn_app/translations/local_keys.g.dart';

import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/custom_text_editing.dart';

class ContinueEditing extends StatefulWidget {
  const ContinueEditing({super.key});

  @override
  State<ContinueEditing> createState() => _ContinueEditingState();
}

class _ContinueEditingState extends State<ContinueEditing> {
  List<Widget> socialLinks = [];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: kGreenColor,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: blockWidth * 5),
            child: GestureDetector(
              onTap: () {},
              child: Text(
                LocaleKeys.save.tr(),
                style: Styles.textStyle18Inter.copyWith(
                  color: kGreenColor,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: blockWidth * 5, vertical: blockHeight * 2),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.work.tr(),
                style: Styles.textStyle18Inter,
              ),
              const CustomTextFormEditing(
                hintText: 'Your Work',
              ),
              const Divider(),
              SizedBox(
                height: blockHeight * 2,
              ),
              Text(
                LocaleKeys.currentCity.tr(),
                style: Styles.textStyle18Inter,
              ),
              const CustomTextFormEditing(
                hintText: 'City,State',
              ),
              const Divider(),
              SizedBox(
                height: blockHeight * 2,
              ),
              Text(
                LocaleKeys.socialLinks.tr(),
                style: Styles.textStyle18Inter,
              ),
              CustomTextFormEditing(
                prefixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      socialLinks.add(
                        CustomTextFormEditing(
                          prefixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                socialLinks.removeLast();
                              });
                            },
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.red,
                            ),
                          ),
                          hintText: 'http://www.website.com',
                        ),
                      );
                    });
                  },
                  icon: const Icon(
                    Icons.add,
                    color: kGreenColor,
                  ),
                ),
                hintText: 'http://www.facebok.com/profile',
              ),
              ...socialLinks,
              SizedBox(
                height: blockHeight * 5,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: kHintColor.withOpacity(.9),
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: blockHeight * 1, horizontal: blockWidth * 2),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          FontAwesomeIcons.comments,
                          size: 25,
                          color: kGreenColor,
                        ),
                        Text(
                          LocaleKeys.needHelp.tr(),
                        ),
                        Text(
                          LocaleKeys.inquiry.tr(),
                          maxLines: 3,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                        CustomButton(
                          text: LocaleKeys.contactWith.tr(),
                          height: blockHeight * 5,
                          width: blockWidth * 50,
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
