part of 'edit_profile_cubit.dart';

sealed class EditProfileState extends Equatable {
  const EditProfileState();

  @override
  List<Object> get props => [];
}

final class EditProfileInitial extends EditProfileState {}

final class EditProfileLoading extends EditProfileState {}

final class EditProfileSuccess extends EditProfileState {
  final List<UserProfileEditModel> profileModel;

  const EditProfileSuccess(this.profileModel);
}

final class EditProfileFailure extends EditProfileState {
  final String errorMessage;

  const EditProfileFailure(this.errorMessage);
}
