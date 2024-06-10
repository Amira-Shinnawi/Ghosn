import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghosn_app/core/utils/functions/network_image_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/functions/shared_pref_cache.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/widgets/custom_network_image.dart';
import '../../../../Account/data/repo/profile/profile_repo_imple.dart';
import '../../../../Account/presentation/manager/edit_profile_cubit/cubit/edit_profile_cubit.dart';

class HeaderWithSearchField extends StatefulWidget {
  const HeaderWithSearchField({
    super.key,
    this.onSubmitted,
  });
  final void Function(String)? onSubmitted;
  @override
  State<HeaderWithSearchField> createState() => _HeaderWithSearchFieldState();
}

class _HeaderWithSearchFieldState extends State<HeaderWithSearchField> {
  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final sharedPref = await SharedPreferences.getInstance();

    firstName = await SharedPrefCache.getCacheData(key: 'firstName');
    profileImage = sharedPref.getString('path');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    return Container(
      margin: EdgeInsets.only(bottom: blockHeight * 2),
      height: blockHeight * 15,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: blockWidth * 5,
              right: blockWidth * 5,
              bottom: blockHeight * 7,
            ),
            height: blockHeight * 13,
            decoration: const BoxDecoration(
              color: kGreenColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: BlocProvider(
              create: (context) => EditProfileCubit(
                getIt.get<ProfileRepoImplement>(),
              )..fetchProfile(),
              child: BlocBuilder<EditProfileCubit, EditProfileState>(
                  builder: (context, state) {
                if (state is EditProfileSuccess) {
                  return Row(
                    children: [
                      Text(
                        'Hi, ${state.profileModel.first.firstName}!',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: CustomNetworkImage(
                          imageUrl: NetworkHandler()
                              .getImage(state.profileModel.first.imgUrl!)
                              ,
                          aspectRatio: 2 / 2,
                        ),
                      ),
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
              }),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: blockWidth * 5),
              padding: EdgeInsets.symmetric(horizontal: blockWidth * 5),
              height: blockHeight * 6,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 50,
                    color: kGreenColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onSubmitted: widget.onSubmitted,
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(
                          color: kGreenColor.withOpacity(0.5),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  const Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: kGreenColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
