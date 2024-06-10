part of 'community_cubit.dart';

sealed class CommunityState extends Equatable {
  const CommunityState();

  @override
  List<Object> get props => [];
}

final class CommunityInitial extends CommunityState {}

final class SearchSuggestedUserLoading extends CommunityState {}

final class SearchSuggestedUserSuccess extends CommunityState {
  final List<SuggestedUserModel> searchSuggestedUsers;

  const SearchSuggestedUserSuccess(this.searchSuggestedUsers);
}

final class SearchSuggestedUserFailure extends CommunityState {
  final String errorMessage;

  const SearchSuggestedUserFailure(this.errorMessage);
}
