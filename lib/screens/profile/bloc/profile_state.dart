part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileLoading extends ProfileState {}
class ProfileLoaded extends ProfileState {
  final PModel profileModel;
  final TextEditingController firstnameController;
  final TextEditingController lastnameController;
  final TextEditingController telController;
  final String dateOfBirth;

  ProfileLoaded({
    required this.profileModel,
    required this.firstnameController,
    required this.lastnameController,
    required this.telController,
    required this.dateOfBirth,
  });

  ProfileLoaded copyWith({
    PModel? profileModel,
    TextEditingController? firstnameController,
    TextEditingController? lastnameController,
    TextEditingController? telController,
    String? dateOfBirth,
  }) {
    return ProfileLoaded(
      profileModel: profileModel ?? this.profileModel,
      firstnameController: firstnameController ?? this.firstnameController,
      lastnameController: lastnameController ?? this.lastnameController,
      telController: telController ?? this.telController,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    );
  }

}
