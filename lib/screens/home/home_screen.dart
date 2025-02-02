import 'package:agri/fcm/fcm_bloc.dart';
import 'package:agri/main.dart';
import 'package:agri/screens/home/bloc/home_bloc.dart';
import 'package:agri/screens/home/home_admin_screen.dart';
import 'package:agri/screens/home/home_manager_screen.dart';
import 'package:agri/screens/home/home_user_screen.dart';
import 'package:agri/screens/login/repository/login_repository.dart';
import 'package:agri/screens/request_machine/bloc/request_machine_bloc.dart';
import 'package:agri/services/notification_service.dart';
import 'package:agri/utils/custom_role_widget.dart';
import 'package:agri/utils/role_status.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

import '../notification/bloc/notification_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _configureSelectNotificationSubject();
    _fcmToken();
  }

  _fcmToken() async {
    await Permission.notification.request();
    await [Permission.location, Permission.locationWhenInUse, Permission.locationAlways].request();
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    final _fcmToken = await messaging.getToken();
    print('FCM = $_fcmToken');
    await LoginRepository().storeFcmToken(_fcmToken ?? '');
  }

  void _configureSelectNotificationSubject() {
    selectNotificationStream.stream.listen((String? payload) async {
      if (payload != null) {
        print('Notification payload: $payload');
        context.read<NotificationBloc>().add(NotificationStarted());
        context.read<RequestMachineBloc>().add(RequestMachineInitialEvent());
      }
    });
  }

  void _handleNavigation(BuildContext context, RemoteMessage message) {
    context.read<NotificationBloc>().add(NotificationStarted());
    context.read<RequestMachineBloc>().add(RequestMachineInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => FcmBloc(
        context: context,
        onNavigation: (argument) {
          _handleNavigation(context, argument);
        },
      ),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return  const Center(child: CircularProgressIndicator());
          }
          if (state is HomeLoaded) {
            final role = RoleStatus().getRole(context);
            print('role = $role');
            return CustomRoleWidget(
              currentRole: role,
              adminWidget: const HomeAdminScreen(),
              userWidget: const HomeUserScreen(),
              managerWidget: const HomeUserScreen(),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('ไม่สามารถโหลดข้อมูลได้'),
                    SizedBox(height: 20),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
