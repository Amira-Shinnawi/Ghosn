part of 'edit_profile_cubit.dart';

@immutable
sealed class EditProfileState {}

final class EditProfileInitial extends EditProfileState {}

final class EditProfileLoading extends EditProfileState {}

final class EditProfileSuccess extends EditProfileState {
  final UserProfileModel userProfileModel;

  EditProfileSuccess({required this.userProfileModel});
}
final class EditProfileUpdated extends EditProfileState {
  final UserProfileModel userProfileModel;

  EditProfileUpdated({required this.userProfileModel});
}
final class EditProfileFailure extends EditProfileState {
  final String errorMessage;

  EditProfileFailure({required this.errorMessage});

}
