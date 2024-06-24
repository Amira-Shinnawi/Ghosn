import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ghosn_app/User%20Features/Account/data/repo/profile/pofile_repo.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/errors/failuers.dart';

import '../../../../../core/utils/api_service.dart';
import '../../model/user_profile_edit_model.dart';

class ProfileRepoImplement implements ProfileRepo {
  final APIService apiService;

  ProfileRepoImplement(this.apiService);

  @override
  Future<Either<Failure, List<UserProfileEditModel>>> fetchUserProfile() async {
    try {
      final response = await apiService.getProfile(
        endPoint: '/api/Auth/v2/profile',
        options: Options(
          headers: {
            'Authorization': 'Bearer $userToken',
          },
        ),
      );

      List<UserProfileEditModel> profile = [];

      profile.add(UserProfileEditModel.fromJson(response));
      print(response);

      return right(profile);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioExceptionError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
