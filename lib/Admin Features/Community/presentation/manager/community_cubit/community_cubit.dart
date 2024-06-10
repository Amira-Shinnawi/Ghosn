import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ghosn_app/Admin%20Features/Community/data/repo/community_repo.dart';

import '../../../data/model/suggested_user_model/suggested_user_model.dart';

part 'community_state.dart';

class CommunityCubit extends Cubit<CommunityState> {
  CommunityCubit(this.communityRepo) : super(CommunityInitial());
  final CommunityRepo communityRepo;
  

  Future<void> fetchSearchSuggestedUser({required String userName}) async {
    emit(SearchSuggestedUserLoading());
    var result = await communityRepo.searchSuggestedUser(userName: userName);
    result.fold((failure) {
      emit(SearchSuggestedUserFailure(failure.errorMessage));
    }, (users) {
      emit(SearchSuggestedUserSuccess(users));
    });
  }
}
