import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/utils/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../User Features/Account/data/repo/profile/profile_repo_imple.dart';
import '../../../../../User Features/Account/presentation/manager/edit_profile_cubit/cubit/edit_profile_cubit.dart';
import '../../../../../core/utils/functions/network_image_handler.dart';
import '../../../../../core/utils/functions/shared_pref_cache.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_network_image.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../data/model/post_model/post_model.dart';

class WritePostContent extends StatefulWidget {
  const WritePostContent({
    super.key,
    this.controller,
    this.onPressed,
    this.editPost,
  });
  final TextEditingController? controller;
  final void Function()? onPressed;
  final MyPosts? editPost;

  @override
  State<WritePostContent> createState() => _WritePostContentState();
}

class _WritePostContentState extends State<WritePostContent> {
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final sharedPref = await SharedPreferences.getInstance();

    userName = await SharedPrefCache.getCacheData(key: 'userName');
    profileImage = sharedPref.getString('path');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    return Column(
      children: [
        BlocProvider(
          create: (context) => EditProfileCubit(
            getIt.get<ProfileRepoImplement>(),
          )..fetchProfile(),
          child: BlocBuilder<EditProfileCubit, EditProfileState>(
            builder: (context, state) {
              if (state is EditProfileSuccess) {
                return Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CircleAvatar(
                        radius: 20,
                        child: CustomNetworkImage(
                          imageUrl: NetworkHandler()
                              .getImage(state.profileModel.first.imgUrl!),
                          aspectRatio: 1 / 1,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: blockWidth * 4,
                    ),
                    Text(
                      '${state.profileModel.first.userName}',
                      style: Styles.textStyle16Inter,
                    ),
                    const Spacer(),
                    ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(kGreenColor),
                      ),
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
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    onPressed: widget.onPressed,
                                    child: Text(
                                      'Post',
                                      style: Styles.textStyle18Inter.copyWith(
                                        color: kGreenColor,
                                      ),
                                    ),
                                  ),
                                  const Divider(),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
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
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                );
              } else if (state is EditProfileFailure) {
                return Center(child: Text(state.errorMessage));
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              }
            },
          ),
        ),
        SizedBox(
          height: blockHeight * 2,
        ),
        CustomTextField(
          hintText: 'What\'s on your Mind?',
          width: 0,
          color: Colors.black,
          minLength: 6,
          controller: widget.controller,
        ),
      ],
    );
  }
}
