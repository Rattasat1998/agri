import 'dart:async';

import 'package:agri/screens/profile/models/profile_model.dart';
import 'package:agri/screens/profile/repository/profile_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository _profileRepository = ProfileRepository();

  ProfileBloc() : super(ProfileLoading()) {
    on<GetProfileEvent>(_onGetProfile);
    on<EditFirstName>(_onEditFirstName);
    on<EditLastName>(_onEditLastName);
    on<EditDateOfBirth>(_onEditDateOfBirth);
    on<ChangeProfile>(_onChangeProfile);
    on<ChangeDateOfBirth>(_onChangeDateOfBirth);
    on<RefreshProfile>(_onRefreshProfile);
  }

  Future<void> _onGetProfile(GetProfileEvent event, Emitter<ProfileState> emit) async {
    try {
      final profileModel = await _profileRepository.getProfile();
      final profile = profileModel.data!.profile!;

      emit(ProfileLoaded(
        profileModel: profileModel,
        firstnameController: TextEditingController(text: profile.firstname),
        lastnameController: TextEditingController(text: profile.lastname),
        telController: TextEditingController(text: profile.tel),
        dateOfBirth: profile.dateOfBirth.toString(),
      ));
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> _onRefreshProfile(RefreshProfile event, Emitter<ProfileState> emit) async {
    final state = this.state;
    if (state is ProfileLoaded) {
      final profileModel = await _profileRepository.getProfile();
      final profile = profileModel.data!.profile!;
      emit(state.copyWith(
        profileModel: profileModel,
        firstnameController: TextEditingController(text: profile.firstname),
        lastnameController: TextEditingController(text: profile.lastname),
        telController: TextEditingController(text: profile.tel),
        dateOfBirth: profile.dateOfBirth.toString(),
      ));
    }
  }

  Future<void> _onEditFirstName(EditFirstName event, Emitter<ProfileState> emit) async {
    final state = this.state;
    if (state is ProfileLoaded) {
      try {
        final firstname = state.firstnameController.text;

        if (firstname.isNotEmpty) {
          await _profileRepository.editFirstName(firstname: state.firstnameController.text);
        }
        add(GetProfileEvent());
      } catch (e) {
        throw Exception(e);
      }
    }
  }
  Future<void> _onEditLastName(EditLastName event, Emitter<ProfileState> emit) async {
    final state = this.state;
    if (state is ProfileLoaded) {
      try {
        final lastname = state.lastnameController.text;
         if (lastname.isNotEmpty) {
          await _profileRepository.editLastName(lastname: state.lastnameController.text);
        }
        add(GetProfileEvent());
      } catch (e) {
        throw Exception(e);
      }
    }
  }
  Future<void> _onEditDateOfBirth(EditDateOfBirth event, Emitter<ProfileState> emit) async {
    final state = this.state;
    if (state is ProfileLoaded) {
      try {

        final dateOfBirth = state.dateOfBirth.split(' ')[0];
          if (dateOfBirth.isNotEmpty) {
          await _profileRepository.editDateOfBirth(dateOfBirth: state.dateOfBirth.split(' ')[0]);
        }
        add(GetProfileEvent());
      } catch (e) {
        throw Exception(e);
      }
    }
  }

  Future<void> _onChangeProfile(ChangeProfile event, Emitter<ProfileState> emit) async {
    try {
      await _profileRepository.changeProfile(profileImg: event.profileImg);
      add(GetProfileEvent());
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> _onChangeDateOfBirth(ChangeDateOfBirth event, Emitter<ProfileState> emit) async {
    final state = this.state;
    if (state is ProfileLoaded) {
      emit(state.copyWith(dateOfBirth: event.dateOfBirth));
    }
  }
}
