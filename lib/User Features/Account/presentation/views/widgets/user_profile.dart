import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghosn_app/User%20Features/Account/presentation/manager/edit_profile_cubit/cubit/edit_profile_cubit.dart';
import 'package:ghosn_app/User%20Features/Account/presentation/views/widgets/info_profile_item.dart';
import 'package:ghosn_app/core/utils/functions/network_image_handler.dart';
import 'package:ghosn_app/core/widgets/custom_network_image.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/style.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({
    super.key,
  });

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double blockHeight = (height / 100);
    double width = MediaQuery.of(context).size.width;
    double blockWidth = (width / 100);
    return Container(
      height: blockHeight * 23,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            kGreenColor,
            Color.fromARGB(255, 3, 87, 62),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        color: kGreenColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: blockHeight * 1,
          bottom: blockHeight * 1,
          left: blockWidth * 8,
          right: blockWidth * 8,
        ),
        child: BlocBuilder<EditProfileCubit, EditProfileState>(
            builder: (context, state) {
          if (state is EditProfileSuccess) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                backgroundColor: Colors.transparent,
                                content: CustomNetworkImage(
                                  imageUrl: NetworkHandler().getImage(
                                      state.profileModel.first.imgUrl!),
                                  aspectRatio: 2 / 2,
                                  fit: BoxFit.cover,
                                ));
                          },
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(34),
                        child: CircleAvatar(
                          radius: 35,
                          child: CustomNetworkImage(
                            imageUrl: NetworkHandler()
                                .getImage(state.profileModel.first.imgUrl!),
                            aspectRatio: 1,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: blockHeight * 1,
                    ),
                    Text(
                      '@${state.profileModel.first.userName!}',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(
                  width: blockWidth * 8,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InfoProfileItem(
                          icon: Icons.person,
                          infoItem:
                              '${state.profileModel.first.firstName.toString()} ${state.profileModel.first.lastName.toString()}',
                          width: blockWidth,
                        ),
                        SizedBox(
                          height: blockHeight * 1.5,
                        ),
                        InfoProfileItem(
                          icon: FontAwesomeIcons.locationDot,
                          infoItem:
                              '${state.profileModel.first.countryName.toString()}, ${state.profileModel.first.cityName.toString()}',
                          width: blockWidth,
                        ),
                        SizedBox(
                          height: blockHeight * 1.5,
                        ),
                        InfoProfileItem(
                          icon: Icons.link,
                          infoItem: state.profileModel.first.email.toString(),
                          width: blockWidth,
                        ),
                        SizedBox(
                          height: blockHeight * 1.5,
                        ),
                        InfoProfileItem(
                          icon: Icons.cake,
                          infoItem:
                              state.profileModel.first.dateOfBirth!.toString(),
                          width: blockWidth,
                        ),
                        SizedBox(
                          height: blockHeight * 1.5,
                        ),
                        Row(
                          children: [
                            Text(
                              '${state.profileModel.first.totalFollwers.toString()} Followers',
                              style: Styles.textStyle22Inter.copyWith(
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              width: blockWidth * 4,
                            ),
                            Text(
                              '${state.profileModel.first.totalFollowees.toString()} Following',
                              style: Styles.textStyle22Inter.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
    );
  }
}
