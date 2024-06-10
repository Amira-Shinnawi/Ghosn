// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:ghosn_app/Admin%20Features/Community/data/model/post_model/post_model.dart';

// import '../../../../constants.dart';
// import '../../../../core/errors/failuers.dart';
// import '../../../../core/utils/api_service.dart';
// import 'post_repo.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ghosn_app/Admin%20Features/Community/data/model/suggested_user_model/suggested_user_model.dart';
import 'package:ghosn_app/Admin%20Features/Community/data/repo/community_repo.dart';
import 'package:ghosn_app/core/errors/failuers.dart';

import '../../../../constants.dart';
import '../../../../core/utils/api_service.dart';

class CommunityRepoImplement implements CommunityRepo {
  final APIService apiService;

  CommunityRepoImplement(this.apiService);

  @override
  Future<Either<Failure, List<SuggestedUserModel>>> searchSuggestedUser(
      {required String userName}) async {
    try {
      var data = await apiService.searchUser(
        endPoint: '/api/Follow/SearchUser?SearchType=$userName',
        options: Options(
          headers: {'Authorization': 'Bearer $userToken'},
        ),
      );
      List<SuggestedUserModel> suggestedUser = [];
      for (var user in data) {
        suggestedUser
            .add(SuggestedUserModel.fromJson(user as Map<String, dynamic>));
      }

      return right(suggestedUser);
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
