import 'package:agri/bloc/auth/auth_bloc.dart';
import 'package:agri/screens/home/bloc/home_bloc.dart';
import 'package:agri/screens/news/blocs/news_bloc/news_bloc.dart';
import 'package:agri/screens/profile/bloc/profile_bloc.dart';
import 'package:agri/screens/profile/pages/agri_information/bloc/agri_info_bloc.dart';
import 'package:agri/screens/request_machine/pages/request_history_page/bloc/request_history_bloc.dart';
import 'package:agri/utils/api_end_point.dart';
import 'package:agri/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'bloc_providers.dart';
import 'screens/dashboard/bloc/dashboard_bloc.dart';
import 'screens/home/pages/admin/bloc/admin_bloc.dart';
import 'screens/home/pages/agricultural_information/bloc/agricultural_information_bloc.dart';
import 'screens/home/pages/machinery/bloc/machinery_bloc.dart';
import 'screens/home/pages/machinery/pages/machinery_borrow/bloc/machinery_borrow_bloc.dart';
import 'screens/home/pages/statistics/bloc/statistics_bloc.dart';
import 'screens/home/pages/training_schedule/bloc/training_bloc.dart';
import 'screens/login/bloc/login_bloc.dart';
import 'screens/machinery_map/bloc/machinery_map_bloc.dart';
import 'screens/notification/bloc/notification_bloc.dart';
import 'screens/register/bloc/register_bloc.dart';
import 'screens/request_machine/bloc/request_machine_bloc.dart';
import 'utils/app_routers.dart';

class AgriApp extends StatefulWidget {
  const AgriApp({Key? key}) : super(key: key);

  @override
  State<AgriApp> createState() => _AgriAppState();
}

class _AgriAppState extends State<AgriApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _init();
  }

  Future<void> _init() async {
    await [ Permission.location,Permission.locationWhenInUse,Permission.locationAlways].request();
  }


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(lazy: false,create: (context) => RegisterBloc()..add(RegisterInitialEvent())),
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => NewsBloc()),
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => ProfileBloc()),
        BlocProvider(create: (context) => TrainingBloc()),
        BlocProvider(create: (context) => AdminBloc()),
        BlocProvider(create: (context) => MachineryBloc()),
        BlocProvider(create: (context) => StatisticsBloc()),
        BlocProvider(create: (context) => RequestMachineBloc()),
        BlocProvider(create: (context) => NotificationBloc()),
        BlocProvider(create: (context) => MachineryMapBloc()),
        BlocProvider(create: (context) => RequestHistoryBloc()),
        BlocProvider(lazy: false,create: (context) => AgriInfoBloc()..add(InitialEvent())),
        BlocProvider(lazy: false,create: (context) => MachineryBorrowBloc()..add(BorrowInitialEvent())),
        BlocProvider(create: (context) => AgriculturalInformationBloc()),
        BlocProvider(lazy: false,create: (context) => DashboardBloc()..add(DashboardInitialEvent(apiEndPoint: ApiEndPoint.getDashboard))),
        BlocProvider(lazy: false,create: (context) => AuthBloc()..add(AuthLoginEvent())),
      ],
      child: GetMaterialApp(
        title: 'agri',
        //onGenerateInitialRoutes: AppRouteGenerator,
        onGenerateRoute: AppRouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark, // Set the default theme mode to dark
        theme: ThemeConfig.lightTheme,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('th', 'TH'),
        ],
        //darkTheme: ThemeConfig.darkTheme,
        // initialRoute: AppRoutes.loginScreen,

        builder: EasyLoading.init(),
        home: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.isLoggedIn) {
              context.read<HomeBloc>().add(HomeInitialEvent());
              print('Hererere');
              Navigator.pushNamedAndRemoveUntil(context, AppRoutes.homeScreen, (route) => false);

            } else {
              Navigator.pushNamedAndRemoveUntil(context, AppRoutes.dashboardScreen, (route) => false);
            }
          },
          child: const Scaffold(
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );

  }
}
