import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ghosn_app/Admin%20Features/Community/data/repo/community_repo_imple.dart';
import 'package:ghosn_app/User%20Features/Account/data/repo/profile/profile_repo_imple.dart';
import 'package:ghosn_app/User%20Features/Cart&Fav&Notify/data/repo/cart_repo_impl.dart';

import 'api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<APIService>(
    APIService(
      Dio(),
    ),
  );
  getIt.registerSingleton<ProfileRepoImplement>(
    ProfileRepoImplement(
      getIt.get<APIService>(),
    ),
  );
  getIt.registerSingleton<CartRepoImpl>(
    CartRepoImpl(
      getIt.get<APIService>(),
    ),
  );
  getIt.registerSingleton<CommunityRepoImplement>(
    CommunityRepoImplement(
      getIt.get<APIService>(),
    ),
  );
}
