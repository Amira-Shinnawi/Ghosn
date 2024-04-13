import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/widgets/custom_button.dart';
import 'package:ghosn_app/translations/local_keys.g.dart';

import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/custom_text_editing.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class ContinueEditing extends StatefulWidget {
  const ContinueEditing({super.key});

  @override
  State<ContinueEditing> createState() => _ContinueEditingState();
}

class _ContinueEditingState extends State<ContinueEditing> {
  List<Widget> socialLinks = [];
  bool showLocationFields = false;
  bool gender = true;

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
              const Text(
                'Basic Info',
                style: Styles.textStyle18Inter,
              ),
              SizedBox(
                height: blockHeight * 1,
              ),
              Container(
                height: blockHeight * 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: kGreenColor,
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: blockWidth * 2.5),
                  child: Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.venusMars,
                        size: 20,
                        color: kHintColor,
                      ),
                      SizedBox(
                        width: blockWidth * 4,
                      ),
                      Text(
                        LocaleKeys.gender.tr(),
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.4000000059604645),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        children: [
                          Radio<bool>(
                            value: true,
                            activeColor: kGreenColor,
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value!;
                              });
                            },
                          ),
                          Text(
                            LocaleKeys.Male.tr(),
                            style: Styles.textStyle16Inter,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<bool>(
                            value: false,
                            groupValue: gender,
                            activeColor: kGreenColor,
                            onChanged: (value) {
                              setState(() {
                                gender = value!;
                              });
                            },
                          ),
                          Text(
                            LocaleKeys.Female.tr(),
                            style: Styles.textStyle16Inter,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: blockHeight * 2,
              ),
              const Divider(),
              SizedBox(
                height: blockHeight * 2,
              ),
              Text(
                LocaleKeys.currentCity.tr(),
                style: Styles.textStyle18Inter,
              ),
              SizedBox(
                height: blockHeight * 1,
              ),
              CustomTextField(
                width: 2,
                onTap: () {
                  setState(() {
                    showLocationFields = !showLocationFields;
                  });
                },
                hintText: LocaleKeys.chooseLocation.tr(),
                suffixIcon: const Icon(
                  FontAwesomeIcons.chevronDown,
                  size: 20,
                  color: kGreenColor,
                ),
                controller: TextEditingController(text: ''),
                readOnly: true,
                prefixIcon: const Icon(
                  FontAwesomeIcons.locationDot,
                  size: 20,
                  color: kHintColor,
                ),
              ),
              SizedBox(
                height: blockHeight * 2,
              ),
              if (showLocationFields)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: blockWidth * 2.5),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              width: 1,
                              hintText: LocaleKeys.city.tr(),
                              onChanged: (value) {
                                setState(() {});
                              },
                            ),
                          ),
                          SizedBox(width: blockWidth * 2),
                          Expanded(
                            child: CustomTextField(
                              width: 1,
                              hintText: LocaleKeys.state.tr(),
                              onChanged: (value) {
                                setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              SizedBox(
                height: blockHeight * 1,
              ),
              const Divider(),
              SizedBox(
                height: blockHeight * 1,
              ),
              Text(
                LocaleKeys.work.tr(),
                style: Styles.textStyle18Inter,
              ),
              const CustomTextFormEditing(
                hintText: 'Your Work',
              ),
              SizedBox(
                height: blockHeight * 1,
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
