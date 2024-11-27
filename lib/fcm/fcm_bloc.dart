import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../screens/notification/bloc/notification_bloc.dart';
import '../screens/request_machine/bloc/request_machine_bloc.dart';
import '../services/notification_service.dart';

abstract class FcmEvent {}

class FcmInitEvent extends FcmEvent {}

class FcmMessageState {
  final RemoteMessage message;

  FcmMessageState(this.message);
}

typedef NavigationCallback = void Function(RemoteMessage message);

Future<String?> getFcmToken() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  print('FCM = ${await messaging.getToken()}');
  final String? token = await messaging.getToken();
  return token;
}

class FcmBloc extends Bloc<FcmEvent, FcmMessageState> {
  final BuildContext context;
  final NavigationCallback onNavigation;

  FcmBloc({
    required this.onNavigation,
    required this.context,
  }) : super(FcmMessageState(const RemoteMessage())) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      context.read<RequestMachineBloc>().add(RequestMachineInitialEvent());
      context.read<NotificationBloc>().add(NotificationStarted());
      _handleForegroundMessage(message);


    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      onNavigation(message);
    });
  }



  void _handleForegroundMessage(RemoteMessage message) {
    // Handle the message directly here when the app is in the foreground
    NotificationService().showWithoutPicture(message);
  }
}