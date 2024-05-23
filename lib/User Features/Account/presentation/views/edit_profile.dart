import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghosn_app/User%20Features/Account/presentation/manager/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:ghosn_app/User%20Features/Account/presentation/views/widgets/edit_profile_body.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/widgets/custom_appbar.dart';

import '../../../../core/utils/style.dart';
import '../../../../translations/local_keys.g.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
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
          centerTitle: false,
          titleAppBar: Text(
            LocaleKeys.editProfile.tr(),
            style: Styles.textStyle20Inter.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.settings,
                size: 20,
                color: kGreenColor,
              ),
            ),
          ]),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => EditProfileCubit()..fetchProfileData(),
          child: BlocBuilder<EditProfileCubit, EditProfileState>(
              builder: (context, state) {
            if (state is EditProfileLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is EditProfileSuccess) {
              final cubit = BlocProvider.of<EditProfileCubit>(context);
              final userProfile = state.userProfileModel;
              final firstNameController =
                  TextEditingController(text: userProfile.firstName);
              final lastNameController =
                  TextEditingController(text: userProfile.lastName);
              final emailController =
                  TextEditingController(text: userProfile.email);
              final userNameController =
                  TextEditingController(text: userProfile.userName);
              final phoneController =
                  TextEditingController(text: userProfile.phoneNumber);
              final cityController =
                  TextEditingController(text: userProfile.cityId.toString());
              final stateController =
                  TextEditingController(text: userProfile.street);
              final dateOfBirthController =
                  TextEditingController(text: userProfile.dateOfBirth);

              return EditProfileBody(
                userProfileModel: userProfile,
                firstNameController: firstNameController,
                lastNameController: lastNameController,
                userNameController: userNameController,
                phoneController: phoneController,
                cityController: cityController,
                stateController: stateController,
                dateOfBirthController: dateOfBirthController,
                emailController: emailController,
                onUpdatePressed: (updatedProfile) {
                  cubit.updateProfileData(updatedProfile);
                },
              );
            } else if (state is EditProfileUpdated) {
              return const Center(
                child: Text('Profile updated successfully'),
              );
            } else if (state is EditProfileFailure) {
              return Center(child: Text(state.errorMessage));
            }
            return const Center(child: Text('Unknown state'));
          }),
        ),
      ),
    );
  }
}
