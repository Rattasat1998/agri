import 'package:agri/screens/home/bloc/home_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoleStatus {
  String getRole(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    final homeState = homeBloc.state as HomeLoaded;
    final role =homeState.homeModel?.data?.role ?? 'GUE';
    print(role);
    return role;
  }

  bool getRoleAdmin(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    final homeState = homeBloc.state as HomeLoaded;
    final role =homeState.homeModel?.data?.role ?? 'GUE';
    return role == 'ADM';
  }

  bool getRoleHead(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    final homeState = homeBloc.state as HomeLoaded;
    final role =homeState.homeModel?.data?.role ?? 'GUE';
    return role == 'HED';
  }

}
