import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failuers.dart';
import '../../model/user_profile_edit_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, List<UserProfileEditModel>>> fetchUserProfile();
}
