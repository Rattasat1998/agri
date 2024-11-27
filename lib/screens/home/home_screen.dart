import 'package:agri/fcm/fcm_bloc.dart';
import 'package:agri/main.dart';
import 'package:agri/screens/home/bloc/home_bloc.dart';
import 'package:agri/screens/home/home_admin_screen.dart';
import 'package:agri/screens/home/home_manager_screen.dart';
import 'package:agri/screens/home/home_user_screen.dart';
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
    // context.read<FcmBloc>().add(FcmInitEvent());
    // context.read<FcmBloc>().add(FcmInitEvent());
    _configureSelectNotificationSubject();
    _fcmToken();
    /* FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _handleForegroundMessage(message);

    });*/
  }

  /*void _handleForegroundMessage(RemoteMessage message) {
    // Handle the message directly here when the app is in the foreground
    NotificationService().showBigPictureNotification(message);
  }*/

  _fcmToken() async {
    await Permission.notification.request();
    await [Permission.location, Permission.locationWhenInUse, Permission.locationAlways].request();
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    print('FCM = ${await messaging.getToken()}');
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
    print('message.data: ');
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
            return const CircularProgressIndicator.adaptive();
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
            return SizedBox();
          }
        },
      ),
    );
  }
}
