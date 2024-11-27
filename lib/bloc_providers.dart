import 'package:agri/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/dashboard/bloc/dashboard_bloc.dart';
import 'screens/home/bloc/home_bloc.dart';
import 'screens/home/pages/admin/bloc/admin_bloc.dart';
import 'screens/home/pages/agricultural_information/bloc/agricultural_information_bloc.dart';
import 'screens/home/pages/machinery/bloc/machinery_bloc.dart';
import 'screens/home/pages/training_schedule/bloc/training_bloc.dart';
import 'screens/login/bloc/login_bloc.dart';
import 'screens/news/blocs/news_bloc/news_bloc.dart';
import 'screens/profile/bloc/profile_bloc.dart';
import 'screens/register/bloc/register_bloc.dart';
import 'utils/api_end_point.dart';

class BlocProviders {
  final BuildContext context;
  BlocProviders(this.context);
  List<BlocProvider> providers = [
    BlocProvider(lazy: false,create: (context) => RegisterBloc()..add(RegisterInitialEvent())),
    BlocProvider(create: (context) => LoginBloc()),
    BlocProvider(create: (context) => NewsBloc()),
    BlocProvider(create: (context) => HomeBloc()),
    BlocProvider(create: (context) => ProfileBloc()),
    BlocProvider(create: (context) => TrainingBloc()),
    BlocProvider(create: (context) => AdminBloc()),
    BlocProvider(create: (context) => MachineryBloc()),
    BlocProvider(create: (context) => AgriculturalInformationBloc()),
    BlocProvider(lazy: false,create: (context) => DashboardBloc()..add(DashboardInitialEvent(apiEndPoint: ApiEndPoint.getDashboard))),
    BlocProvider(lazy: false,create: (context) => AuthBloc()..add(AuthLoginEvent())),
  ];
}