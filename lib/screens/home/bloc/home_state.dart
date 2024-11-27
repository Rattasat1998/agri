part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeLoading extends HomeState {}
class HomeLoaded extends HomeState {
   HModel? homeModel;
  HomeLoaded({ this.homeModel});
}

