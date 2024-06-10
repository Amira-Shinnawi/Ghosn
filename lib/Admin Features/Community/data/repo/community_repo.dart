import 'package:dartz/dartz.dart';
import 'package:ghosn_app/Admin%20Features/Community/data/model/suggested_user_model/suggested_user_model.dart';

import '../../../../core/errors/failuers.dart';

abstract class CommunityRepo {
  Future<Either<Failure, List<SuggestedUserModel>>> searchSuggestedUser(
      {required String userName});
}
