import 'dart:async';

import 'package:agri/utils/local_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:meta/meta.dart';

import '../../screens/home/repository/home_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final HomeRepository _homeRepository = HomeRepository();

  AuthBloc() : super(AuthState()) {
    on<AuthLoginEvent>(_onAuthLoginEvent);
  }

  void _onAuthLoginEvent(AuthLoginEvent event, Emitter<AuthState> emit) async {


    try {
      final response = await _homeRepository.getHomeData();
      if(response.statusCode! > 201){
            LocalStorage.removeToken();
          }
      final localStorage = await LocalStorage.getToken();
      FlutterNativeSplash.remove();
      if (localStorage != null) {
            emit(state.copyWith(isLoggedIn: true));
          } else {
            emit(state.copyWith(isLoggedIn: false));
          }
    } catch (e,t) {
      print(e);
      print(t);
    }
  }
}
