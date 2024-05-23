import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ghosn_app/User%20Features/Account/data/model/user_profile_model.dart';
import 'package:ghosn_app/constants.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../../../../../core/utils/Api_Key.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());

  Future<void> fetchProfileData() async {
    try {
      final response = await http
          .get(Uri.parse('${ApiKeys.BASE_URL}/Auth/profile'), headers: {
        'Authorization': 'Bearer $userToken',
      });

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final userProfile = UserProfileModel(
          firstName: data['firstName'],
          lastName: data['lastName'],
          maleGender: data['maleGender'],
          email: data['email'],
          userName: data['userName'],
          phoneNumber: data['phoneNumber'],
          cityId: data['cityId'],
          street: data['street'],
          dateOfBirth: data['dateOfBirth'],
        );

        emit(EditProfileSuccess(userProfileModel: userProfile)
            as EditProfileState);
        emit(EditProfileFailure(errorMessage: 'Failed to fetch profile data')
            as EditProfileState);
      }
    } catch (e) {
      emit(EditProfileFailure(errorMessage: 'An error occurred')
          as EditProfileState);
    }
  }

  Future<void> updateProfileData(UserProfileModel userProfile) async {
    try {
      final response =
          await http.put(Uri.parse('${ApiKeys.BASE_URL}/Auth/profile'), body: {
        'firstName': userProfile.firstName,
        'lastName': userProfile.lastName,
        'maleGender': userProfile.maleGender,
        'email': userProfile.email,
        'userName': userProfile.userName,
        'phoneNumber': userProfile.phoneNumber,
        'cityId': userProfile.cityId,
        'street': userProfile.street,
        'dateOfBirth': userProfile.dateOfBirth
      }, headers: {
        'Authorization': 'Bearer $userToken',
      });

      if (response.statusCode == 200) {
        emit(EditProfileUpdated(userProfileModel: userProfile)
            as EditProfileState);
      } else {
        emit(EditProfileFailure(errorMessage: 'Failed to update profile data')
            as EditProfileState);
      }
    } catch (e) {
      emit(EditProfileFailure(errorMessage: 'An error occurred')
          as EditProfileState);
    }
  }
}
