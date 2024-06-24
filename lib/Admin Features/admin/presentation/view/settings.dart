import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';

import '../../../../core/utils/functions/shared_pref_cache.dart';
import '../../../../core/utils/style.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blocHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blocWidth = (width / 100);
    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),
        titleAppBar: Text(
          'Settings',
          style: Styles.textStyle18Inter.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: blocWidth * 4, vertical: blocHeight * 3),
          child: Column(
            children: [
              Container(
                height: blocHeight * 20,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kGreenColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: blocWidth * 3, vertical: blocHeight * 3),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.language,
                                size: 20,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: blocWidth * 1,
                              ),
                              Text(
                                'Languages',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: blocHeight * 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () async {
                                  await context.setLocale(const Locale('en'));
                                  await SharedPrefCache.saveLanguage(
                                      const Locale('en'));
                                },
                                child: const Text(
                                  'English',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              ElevatedButton(
                                onPressed: () async {
                                  await context.setLocale(const Locale('ar'));
                                  await SharedPrefCache.saveLanguage(
                                      const Locale('ar'));
                                },
                                child: const Text('العربية',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: blocHeight * 2,
              ),
              Container(
                height: blocHeight * 15,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kGreenColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: blocWidth * 3, vertical: blocHeight * 3),
                      child: Column(
                        children: [
                          SizedBox(
                            height: blocHeight * 2,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.person_off,
                                size: 20,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: blocWidth * 1,
                              ),
                              Text(
                                'Delete Account',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: blocHeight * 2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
