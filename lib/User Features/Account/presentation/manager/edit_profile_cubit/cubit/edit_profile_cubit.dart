import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ghosn_app/User%20Features/Account/data/repo/profile/pofile_repo.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/utils/Api_Key.dart';
import 'package:http/http.dart' as http;

import '../../../../data/model/user_profile_edit_model.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this.profileRepo) : super(EditProfileInitial());
  final ProfileRepo profileRepo;

  Future<void> fetchProfile() async {
    emit(EditProfileLoading());
    try {
      var result = await profileRepo.fetchUserProfile();
      result.fold((failure) {
        emit(EditProfileFailure(failure.errorMessage));
      }, (profile) {
        emit(EditProfileSuccess(profile));
      });
    } catch (e) {
      if (!isClosed) {
        emit(EditProfileFailure(e.toString()));
      }
    }
  }

  Future<void> editProfile({
    required String firstName,
    required String lastName,
    required String maleGender,
    required String email,
    required String userName,
    required String password,
    required String phoneNumber,
    required dynamic cityId,
    required String street,
    required String dateOfBirth,
  }) async {
    String url = '${ApiKeys.BASE_URL}/api/Auth/profile';
    final Map profile = {
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "maleGender": maleGender,
      "userName": userName,
      "phoneNumber": phoneNumber,
      "cityId": cityId,
      "street": street,
      "dateOfBirth": dateOfBirth,
      "password": password,
    };

    try {
      final response = await http.put(
        Uri.parse(url),
        body: jsonEncode(profile),
        headers: {
          'Authorization': 'Bearer $userToken',
          'Content-Type': 'application/json',
        },
      );
      print(response.body);
    } catch (er) {
      print(er.toString());
    }
  }
}
