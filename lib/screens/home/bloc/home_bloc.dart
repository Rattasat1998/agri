import 'dart:async';

import 'package:agri/models/home_model.dart';
import 'package:agri/screens/home/repository/home_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final HomeRepository _homeRepository = HomeRepository();

  HomeBloc() : super(HomeLoading()) {
    on<HomeInitialEvent>(_onHomeInitialEvent);
  }

  void _onHomeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async {
    try {
      final homeModel = await _homeRepository.getHomeData();
      emit(HomeLoaded(homeModel: homeModel));
    } catch (e) {
      throw Exception('Failed to load data!');
    }
  }
}
