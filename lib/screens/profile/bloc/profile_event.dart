part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class GetProfileEvent extends ProfileEvent {}

class EditFirstName extends ProfileEvent {}

class EditLastName extends ProfileEvent {}

class EditDateOfBirth extends ProfileEvent {}

class ChangeProfile extends ProfileEvent {
  final String profileImg;

  ChangeProfile({
    required this.profileImg,
  });
}

class ChangeDateOfBirth extends ProfileEvent {
  final String dateOfBirth;

  ChangeDateOfBirth({
    required this.dateOfBirth,
  });
}

class RefreshProfile extends ProfileEvent {}






